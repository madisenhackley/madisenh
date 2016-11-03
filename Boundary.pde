class Boundary { 
  //draws boundaries on sides of screen
  float x1, y1, x2, y2; 
  float w1, h1, w2, h2; 


  Boundary(float xpos, float ypos) { 
    x1=xpos; 
    y1=ypos;
    x2=xpos;
    y2= y1 +3080; 
    w1= 80; 
    h1= 3000; 
    w2= 80; 
    h2= 3000;
 
  }

  void render () { 
    pushStyle();
    fill(244, 164, 66);
    rect(x1, y1, w1, h1);
    rect(x2, y2, w2, h2); 
    popStyle();
  }

  void collidesWith(Basketball b) {

    //collides with boundaries (right and left side) trying to mess with constraints so net can change positions); 
    if ((b.x + b.r/2 > x1
      && b.x - b.r/2 < x1 + w1)
      && (b.y - b.r < y1 + h1
      && b.y - b.r > y1)) {
      b.velY = abs(b.velY);
    } else if (( b.x + b.r / 2 > x1
      && b.x - b.r/2 < x1 + w1) 
      && (b.y + b.r < y1 +h1
      && b.y + b.r > y1)) { 
      b.velY= -abs(b.velY);
    } else if  ((b.y + b.r / 2> y1 
      &&  b.y - b.r / 2 < y1 + h1)
      && (b.x + b.r> x1 
      &&  b.x + b.r < x1 + w1)) {
      b.velX = -abs(b.velX);
    }

    //collides with Right side of top wall
    else if  ((b.y + b.r / 2 > y1 
      &&  b.y - b.r / 2 < y1 + h1)
      && (b.x - b.r < x1 + w1 
      &&  b.x - b.r > x1)) {
      b.velX = abs(b.velX);
    }

    //collides with Bottom of bottom wall
    else if  ((b.x + b.r / 2 > x2 
      &&  b.x - b.r / 2 < x2 + w2)
      && (b.y - b.r < (y2 + h2) 
      &&  b.y - b.r > y2)) {
      b.velY = abs(b.velY);
    }

    //collides with Top of bottom wall
    else if  ((b.x + b.r / 2 > x2 
      &&  b.x - b.r / 2 < x2 + w2)
      && (b.y + b.r < y2 + h2 
      &&  b.y + b.r > y2)) {
      b.velY = -abs(b.velY);
    }

    //collides with left boundary 
    else if  ((b.y + b.r / 2 > y2 
      &&  b.y - b.r / 2 < y2 + h2)
      && (b.x + b.r > x2 
      &&  b.x + b.r < x2 + w2)) {
      b.velX=-abs(b.velX);
    }

    //collides with Right side boundary
    else if  ((b.y + b.r / 2 > y2 
      &&  b.y - b.r / 2 < y2 + h2)
      && (b.x - b.r < x2 + w2 
      &&  b.x - b.r > x2)) {
      b.velX=abs(b.velX);
    }
  }
}