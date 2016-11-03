class Splashscreen { 
  PImage image; 
  float x1, y1;
   //draws splashscreen 
Splashscreen() {
  
  x1= width/2;
  y1 = height/6; 
}
  
  void render (Basketball b, Paddle p) {
    //imported illustrator file
    image = loadImage("ball_is_life-01.png");
    image (image,0,0);
    
    if (keyPressed) {
      if (key == ' ') {
        hasStart = false;
      }
    }
  }
}