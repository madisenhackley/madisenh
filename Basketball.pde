class Basketball { 

  float x, y; 
  float velX, velY; 
  float velXUpdate, velYUpdate; 
  float r; 
  float gravity; 
  float friction; 
  float spin; 

  Basketball (float xpos, float ypos, float radius) { 
    x= xpos;
    y= ypos; 
    velX = random(-8, 8); 
    velY = random(-5, 5); 
    velYUpdate= 2; 
    velXUpdate=1.5;
    gravity = .4; 
    friction = .99; 
    r = radius;
  }

  void render () { 
    pushStyle(); 
    fill (249, 163, 34); 
    stroke (0); 
    strokeWeight(1); 
    ellipse (x, y, 2*r, 2* r);
    line(x-15,y-15,x+15,y+15);
  
    noFill();
    arc(x+20,y-20,40,40, PI/3, 7/4*PI); 
    arc(x-20,y+19,40,40,radians(240), radians(360)); 

    stroke(0); 
    popStyle();
  }

  void move () {
    velY += gravity; 

    velY *= friction; 

    x += velX; 
    if (velX > 8) {
      velX = 8;
    }
    y += velY; 
    //attempting to draw constraints for score
    //if (x < 0 || y < 0) { 
      if (y - velY < net.y && y >= net.y        
          && x > net.x && x < net.x + net.w) {  
      score.addScore(1); 
      score.shots();
      reset();
    } else if (y > height) {
      reset(); 
      score.shots();
    }
  }
  void reverseYDirection() {
    velY *= -1;
  }



  void checkCollision(Paddle p) {
    if (velY > 0) {
      if  ((x + r > p.x && x - r < p.x + p.w)
        && (y + r < p.y + p.h && y + r > p.y)) {  
        //Bounces the ball on the platform
        reverseYDirection();
//creates the bounce to go higher 
        if (keyPressed) {
          if (key == ' ') {
            velY *= velYUpdate;
            } else if (key == CODED) {
            //Bounces the ball up and to the left
            if (keyCode == LEFT) {
              if (velX > -6) {
                velX -= velXUpdate;
              }
            } //Bounces the ball up and to the right
            else if (keyCode == RIGHT) {
              if (velX <= 6) {
                velX += velXUpdate;
              }
            }
            }
        }
        }
    }
      }
 
     
    
  
  void reset() {
    x = width/2; 
    y=random(20,300); 
    velX= random(-1,7); 
    velY=random(-3,7);
  } 
}