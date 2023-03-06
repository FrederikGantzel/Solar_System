public class Space_Object {
   
  //Due to rounding errors while using floats, i needed to create a vector class that used doubles instead.
  //Thus, DVector is basically a PVector that uses doubles
  //Also, for the sake of simplification, the simulation works in only two dimentions,
  //despite the real solar-system obviouslt working in 3d space
  
  //The units i used are:
  //Time unit: 1 minute = 60 seconds
  //Mass unit: 1 Earth mass = 5.972158 * 10^24 kg
  //Distance unit: 1 millionth of an Astronomical Unit (1/1,000,000 AU) = 149,597.8707 meters
  
  DVector position, velocity;
  String name;
  double mass;
  PImage img, highlight_img;
  int img_size, min_img_size, max_img_size;
  boolean being_moused_over;

  public Space_Object(String Name, double Mass, float Dist, float Velocity,
    int Img_size, int Min_img_size, int Max_img_size) {
    name = Name;
    img = loadImage(Name + ".png");
    mass = Mass;
    
    //All objects start in a perfect line in the x-direction.
    //As a result, they will all have their initial velocities in the y-direction.
    //In real life, it is not possible for all the objects to line up perfectly in this manner,
    //but it simplifies the setup process for me a lot
    position = new DVector(Dist,0);
    velocity = new DVector(0, Velocity);
 
    img_size = Img_size;
    max_img_size = Max_img_size;
    min_img_size = Min_img_size;
    being_moused_over = false;
    
    //We create a brighter version of the picture for the object, to be used when mousing over the object
    highlight_img = img.copy();
    highlight_img.loadPixels();
    for(int i=0; i<highlight_img.width*highlight_img.height; i++) {
      color pixel = highlight_img.pixels[i];
      //We want the new picture to be a brighter version of the old picture,
      //so we just increase the RGB value by 50% across the board,
      //ignoring the pixels that are see-through
      if (alpha(pixel) == 255) {
        highlight_img.pixels[i] = color(
          red(pixel)*1.5,
          green(pixel)*1.5,
          blue(pixel)*1.5);
      }
    }
    highlight_img.updatePixels();
    
  }

  public void drawObject() {
    
    //We scale the image size so the objects can still be seen when zoomed out very far.
    //Objects with shorter orbits will be overshadowed by the objects they are orbiting when zoomed out far enough
    //(This applies mostly to the moons and inner planets).
    //I did this because I though it was more important to show the object being orbited, rather than the smaller orbiting body
    float current_image_size = constrain(img_size/scaleFactor, min_img_size, max_img_size);
    being_moused_over = mousingOver(current_image_size);
    
    //If being moused over, we show the highlighted version of the image
    if (being_moused_over) {
      image(highlight_img, (float)position.x-current_image_size/2, (float)position.y-current_image_size/2,
      current_image_size, current_image_size);
    } else {
      image(img, (float)position.x-current_image_size/2, (float)position.y-current_image_size/2,
      current_image_size, current_image_size);
    }
    
  }
  
  //To figure out if we are mousing over an object,
  //we see if the euclidean distance between the mouse and the center of the object is less than half the image size
  //(which here acts as the radius of the planet).
  //This works because all the objects are perfectly circular (except for Saturn, since it has those huge rings)
  public boolean mousingOver(float current_image_size) {
    double dist_x = position.x - (mouseX-width/2-translate_x)/scaleFactor;
    double dist_y = position.y - (mouseY-height/2-translate_y)/scaleFactor;
    
    if (Math.sqrt(dist_x*dist_x + dist_y*dist_y) < current_image_size/2) {
      return true;
    } else {
      return false;
    }
    
  }
}
