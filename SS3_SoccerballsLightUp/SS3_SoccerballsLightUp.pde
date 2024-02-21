//Osakpolor Noyiagbon MTEC 2280

int numColumns = 8; 
int numRows = 6; 
int ballSize = 40; 
int spacing = 60; 
boolean rollover = false; 

void setup() {
  size(500, 400);
  noStroke();
}

void draw() {
  background(124, 252, 0);
  
  //pattern for balls
  for (int i = 0; i < numColumns; i++) {
    for (int j = 0; j < numRows; j++) {
      int x = i * spacing + ballSize; // Calculate x position
      int y = j * spacing + ballSize; // Calculate y position
      
      // alternate placing of balls
      if ((i + j) % 2 == 0) {
        drawSoccerBall(x, y);
      } else {
        drawSoccerBall(x + spacing / 2, y);
      }
      
      //see if mouse is over ball
      if (mouseX > x - ballSize && mouseX < x + ballSize &&
          mouseY > y - ballSize && mouseY < y + ballSize) {
        rollover = true;
      } else {
        rollover = false;
      }
    }
  }
}

//drawing soccer ball
void drawSoccerBall(int x, int y) {
  fill(255);
  ellipse(x, y, ballSize, ballSize);
  if (rollover) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  ellipse(x, y, ballSize - 10, ballSize - 10);
}
