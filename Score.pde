class Score { 
  
  String fontScore ="ScoreBoard-48.vlw"; 
  String fontInstruction = "ScoreBoard-20.vlw"; 
  int scoreValue;
  int shots; 
  PFont font1; 
  PFont font2; 
  float x1,y1,x2,y2;
  
  Score () { 
    scoreValue = 0; 
    shots = 6; 
    font1= loadFont(fontScore); 
    font2 = loadFont(fontInstruction); 
    x1 = width/2; 
    y1 = height/6; 
    x2 = width/2;
    y2= height /6 + 50; 
  }
  
  void render () { 
     //draws score from each basket made
    textFont(font1); 
    textAlign(CENTER); 
    fill(255,0,21); 
    text(scoreValue + "/7", x1, y1);  
  } //draws shots on screen
    void myShots() {
      textAlign(CENTER); 
      fill(255,0,21); 
      text("Shots:" + shots, x2, y2);
    }
 //add to score 
    void addScore(int increment) {
      if (!hasLost && !hasStart) {
        scoreValue += increment;
      }
    }
    //number of shots the person has left
    void shots () {
      shots--; 
      if (shots <0 && hasStart ==false) { 
        hasLost=true; 
      }
    }
    void directions() { 
      fill(255);
      textFont(font2); 
      text("Press the SPACE BAR", x1, 250);
      text("to bounce the ball higher",x1,280);  
     if (shots <= 5){ 
       fill(0); 
       rect(160,220,400,60); 
     } 
    }
    
    
    void renderGameOver (Basketball b, Paddle p, Boundary lbo, Boundary rbo) { 
      pushStyle(); 
      textFont(font1); 
      textAlign(CENTER);
      noStroke(); 
      fill(0); 
      rect(0,0,width,height); 
      fill(255,0,21); 
      text ("GAME OVER", width/2, height/2-200); 
      fill (66,200,244); 
      text ("Shooting: " + scoreValue + "/7", width/2, height/2); 
      fill(255); 
      text ("Press the Space Bar", width/2, height/2 + 200); 
      text ("to play again", width/2, height /2 + 250); 
      popStyle(); 
    
    if (keyPressed) { 
      if (key == ' ') { 
        hasLost=false; 
        shots=7; 
        scoreValue=0; 
        b.reset(); 
      }
    }
    }
}
    
    
    