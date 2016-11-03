/* Madisen Hackley 
 ARTG2260 Programming Basics
 Fall 2016
 hackley.m@husky.neu.edu
 Assignment 7: "Ball is Life"
 Instructions: Use the left and right arrow keys to move the paddle, 
 Use the space bar to bounce the ball higher 
 */
float paddleWidth = 125; 
float paddleHeight = 20; 
float paddleMargin = 50; 
float paddleVelocity = 12; 

float ballRadius = 20; 

boolean hasLost = false; 
boolean hasStart = true; 


Basketball basketball; 
Paddle paddle;
Splashscreen splashscreen; 
Boundary leftBoundary;
Boundary rightBoundary;
Net net; 
Score score; 

void setup() { 
  size (600, 700);
  basketball = new Basketball (width/2, 0, ballRadius); 
  paddle = new Paddle (width / 2, 42 * height / 30 - height / 2, paddleWidth, paddleHeight);  
  splashscreen = new Splashscreen();
  leftBoundary = new Boundary (-10, -2250);
  rightBoundary = new Boundary (521, -2250); 
  net = new Net ();  
  score = new Score();
  net.setRandomTarget();
}

void draw() { 
  background(0); 
 score.directions(); 
  paddle.render(); 
  basketball.checkCollision(paddle); 
  score.render(); 
  score.myShots();
  score.directions(); 
   basketball.render();
  basketball.move(); 
  leftBoundary.render();
  leftBoundary.collidesWith(basketball);
  rightBoundary.render();
  rightBoundary.collidesWith(basketball);
  net.render();
  

  if (hasStart == true) {
    splashscreen.render(basketball, paddle);
  }
  if (hasLost == true) { 
    score.renderGameOver(basketball,paddle,leftBoundary, rightBoundary); 
  }
    
  //movement of paddle 
  if (key == CODED) { 
    switch (keyCode) { 
      case LEFT:
      paddle.move(-paddleVelocity);
      break; 
      case RIGHT:
      paddle.move(paddleVelocity);
    }
  }
}