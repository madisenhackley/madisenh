
class Paddle {

  float x, y;
  float w, h;

  Paddle(float xpos, float ypos, float width_, float height_) {
    x = xpos;
    y = ypos;
    w = width_;
    h = height_;
  }

  void render() {
    pushStyle();
    fill(3, 192, 255);
    noStroke();
    rect(x, y, w, h);
    popStyle();
  }

  //Moves the paddle left
  void move(float xDist) {
    x += xDist; 
    if (x < 60) {
      x = 60;
    } else if (x > width - w - 60) {
      x = width - w - 60;
    }
  }


}
//collision with paddle and ball
void checkCollision(Basketball b) { 
  float bx = b.x + b.r; 
  float by = b.y;


  if (b.velX > 0) { 
    bx = b.x + b.r;
  } else { 
    bx = b.x - b.r;
  }

  if (bx > bx && bx < bx  && by > by && by < by + height) { 

  }
}