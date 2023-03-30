
//display related values
PImage speed_img;
int transparency = 0;
float scaleFactor = 0.0005;
float translate_x, translate_y = 0.0;
float largest_orbit = 70000000;
int nstars = 500;
int time_speed = 64;
int pause_speed = 0;
Star[] stars = new Star[nstars];
System_Simulation model;
Space_Object focus;


void setup() {
  
  //If you'd rather have the simulation windowed, use the size() command below (with adequate dimentions),
  //and comment out the fullScreen() command
  //size(1800, 900);
  fullScreen();
  frameRate(60);
  
  //Here, we create all the stars. I found 500 stars to be a nice number
  for (int i=0; i<nstars; i++) {
    stars[i] = new Star(new PVector(random(-width/2, width/2), random(-height/2, height/2)));
  }
  //Create the model object
  model = new System_Simulation();
}

void draw() {
  
  
  //The Sun it created in position (0,0), which is actually the upper left corner of the screen,
  //so we translate the camera position so the Sun starts in the center
  translate(width/2, height/2);
  
  //If we have set an object in focus, we translate the camera to be centered on that object,
  //and if not, we just translate the camera to the current x and y translate coordinates
  if(focus != null) {
    translate_x = -(float)focus.position.x*scaleFactor;
    translate_y = -(float)focus.position.y*scaleFactor;
  }
  translate(translate_x, translate_y);
   //<>//
  //Zoom out to the current zoom level
  scale(scaleFactor);
  //Since we use the tint() function later, we have to specify that, for the time being, no tint is required
  noTint();
  
  //The commented out code below uses a single big image to draw the background stars.
  //In order for the background to look good, the image needs to be high resolution,
  //but this in turn slows down the program a lot. I found that the program runs a lot smoother if I instead
  //draw a bunch of small stars seperately, even though this is a little bit more complicated.
  //image(loadImage("Star_Sky.jpg"), (-width/2-translate_x)/scaleFactor, (-height/2-translate_y)/scaleFactor,
  //  width/scaleFactor, height/scaleFactor);
  
  //We set the background to a very dark blue, and draw the stars
  background(0, 0, 30);
  for (int i=0; i<nstars; i++) {
    stars[i].drawStar();
  }
  
  //We draw the objects on their current positions, and then calculate their next positions with the moveObjects() funciton
  model.drawSystem();
  //the moveObjects() function uses time units of 1 minute. Since the orbits of some of the objects are very small,
  //(most of the moons), larger time units would result in a critical loss in accuracy for the orbits.
  //Thus, when we speed up the time, we can't simply increase the time units,
  //but rather we must run the moveObjects() function multiple times
  for (int i=0; i<time_speed; i++) {
    model.moveObjects();
  }
  
  
  //the text() function cannot handle the text sizes we would need to input, unless we scale the camera back down
  scale(1/scaleFactor);
  
  //1 run of the moveObjects() function equals 1 minute.
  //We simply display how many times the moveObjects() function is run, and translate it into hours/days where appropriate
  textSize(30);
  float hours = time_speed/60;
  float days = hours/24;
  if (days > 1) {
    text("Speed: " + days + " day(s) per frame", -(width/2)+10-translate_x, -(height/2)+30-translate_y);
  } else if (hours > 1) {
    text("Speed: " + hours + " hour(s) per frame", -(width/2)+10-translate_x, -(height/2)+30-translate_y);
  } else {
    text("Speed: " + time_speed + " minute(s) per frame", -(width/2)+10-translate_x, -(height/2)+30-translate_y);
  }
  text("Frames per second: " + frameRate, -(width/2)+10-translate_x, -(height/2)+60-translate_y);
  
  text("Zoom: " + nf(scaleFactor/0.0001, 2, 2), -(width/2)+10-translate_x, -(height/2)+90-translate_y);
  
  //We display what the current focus object is, and what object is currently being moused over
  if (focus != null) {
    text("Currently focusing on: " + focus.name , -(width/2)+10-translate_x, -(height/2)+120-translate_y);
  } else {
    text("Currently focusing on: None" , -(width/2)+10-translate_x, -(height/2)+120-translate_y);
  }
  if (model.current_mouse_over != null) {
    text("This object is: " + model.current_mouse_over.name , -(width/2)+10-translate_x, -(height/2)+160-translate_y);
  }
  
  //If time is altered, we display a little image to reflect how time was altered.
  //The image then fades out within a couple of seconds.
  //I just did this part because I thought it would look nice
  if (transparency > 0) {
    tint(255, transparency);
    image(speed_img, -(width/2)+460-translate_x, -(height/2)+15-translate_y, 60, 60);
    transparency = constrain(transparency-3, 0, 255);
  }
  
}

//This is the function that allows us to click the mouse and drag it around,
//in order to move where the camera is pointing.
//I constrain how far you can move the camera to just outside the farthest object's (Eris') orbit,
//so you can't just keep draggin the camera off into oblivion
void mouseDragged(MouseEvent e) {   
    translate_x = constrain(translate_x + (mouseX - pmouseX), -largest_orbit*scaleFactor, largest_orbit*scaleFactor);
    translate_y = constrain(translate_y + (mouseY - pmouseY), -largest_orbit*scaleFactor, largest_orbit*scaleFactor);
}

//This is the function that allows us to zoom in and out with the mouse wheel.
void mouseWheel(MouseEvent e) {
  
  //I don't want the user to be able to zoom out too far, and zooming in to far causes some problems with displaying the stars,
  //so i use this if-statement to determine the minimum and maximum zoom levels
  if ((scaleFactor > 0.00001 && e.getCount() > 0) || (scaleFactor < 1.00 && e.getCount() < 0)) {
    
    //I want the zoom to happen on the point where the mouse cursor is, which is why modify translate_x and translate_y like this.
    //Then later, I modify them back, so it seems like the zoom happened on the curser position
    translate_x -= mouseX-(width/2);
    translate_y -= mouseY-(height/2);
    float zoom;
  
    //e.getCount() returns 1 if the mouse wheel is rolled forward, and -1 if it is rolled backward
    if(e.getCount() > 0){
      zoom = 0.95;
    } else {
      zoom = 1.05;
    }
    
    //We don't want to be able to zoom in or out too far. Thus, the constrain
    scaleFactor = constrain(scaleFactor*zoom, 0.00001, 1.0);
    translate_x *= zoom;
    translate_y *= zoom;
    //We modify translate_x and translate_y in a way that cancels out how they were modified on line 136 and 137.
    //We also constrain them however, as we still don't want the user to be able to move the camera too far from the Sun
    translate_x = constrain(translate_x + (mouseX-(width/2)), -largest_orbit*scaleFactor, largest_orbit*scaleFactor);
    translate_y = constrain(translate_y + (mouseY-(height/2)), -largest_orbit*scaleFactor, largest_orbit*scaleFactor);
  }
}

//Clicking the right arrow, left arrow, or spacebar, either speeds up, slows down, or pauses the simulation.
void keyPressed() {
  //We dont want to be able to speed up or slow down time if the simulation is paused
  if (key == CODED && time_speed > 0) {
    //For higher speeds, increasing the time_speed might not actually speed up the program,
    //since the increase in time_speed will be canceled out by a decrease in framerate
    if (keyCode == RIGHT) {
      time_speed = constrain(time_speed*2, 1, 32768);
      speed_img = loadImage("Speed_Up.png");
      transparency = 255;
    } else if (keyCode == LEFT) {
      time_speed = constrain(time_speed/2, 1, 32768);
      speed_img = loadImage("Speed_Down.png");
      transparency = 255;
    }
  } else if (key == ' ') {
    //Here we use pause_speed to store the speed before pausing,
    //so when we resume the simulation, the same speed is used
    int swapper = time_speed;
    time_speed = pause_speed;
    pause_speed = swapper;
    if (pause_speed > 0) {
      speed_img = loadImage("Pause.png");
    } else {
      speed_img = loadImage("Play.png");
    }
    transparency = 255;
  }
}

//Very simple function. If we are mousing over an object (determined automatically with a function in the System_Simulation class),
//and we then click the mouse, we set that object as focus.
void mousePressed() {
  focus = model.current_mouse_over;
}
