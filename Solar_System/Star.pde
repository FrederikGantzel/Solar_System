public class Star {
  PVector position;
  float size;
  PImage img;
  
  public Star(PVector pos) {
    position = pos;
    int star_nr = int(random(1,5));
    
    //I found four different star pictures to create some variation in the sky
    if (star_nr == 1) {
      img = loadImage("Star_1.png");
    } else if (star_nr == 2) {
      img = loadImage("Star_2.png");
    } else if (star_nr == 3) {
      img = loadImage("Star_3.png");
    } else {
      img = loadImage("Star_4.png");
    }
  }
  
  public void drawStar() {
    //I want the stars to always appear in the same place, and the same size,
    //since they are too far away to be meaninfully affected by a change in zoom level or camera position
    image(img, (position.x-translate_x)/scaleFactor, (position.y-translate_y)/scaleFactor,
      10/scaleFactor, 10/scaleFactor);
  }
}
