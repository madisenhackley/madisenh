class Net { 

  PImage image; 
  
  
  float x, y;
  int w, h;
  float targetX1, targetY1; 
  
  boolean needsUpdate;


  Net() {
    x = 70;
    y = 300;
    w = 80;
    h = 60;
    targetX1 = x;
    targetY1 = y; 
    needsUpdate = true;
    
    image = loadImage("BasketballNet.png"); 
    image.resize(w, h);
  }

  //Draws the Net 
  void render () { 
    image(image, x, y);
  }
  
  void setRandomTarget() { 
    targetX1 = x; 
    targetY1 = random(100,400);
    needsUpdate = true; 
  }
}