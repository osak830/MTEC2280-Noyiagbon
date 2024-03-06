//Osakpolor Noyiagbon
PImage field;
int numColumns = 8; 
int numRows = 6; 
int ballSize = 40; 
int spacing; 
boolean rollover = false; 
boolean useCircles = true; 

void setup() {
  size(1000, 636);
  field = loadImage("field.jpg");
  noStroke();
  spacing = min(width, height) / max(numColumns, numRows); // tried to Calculate spacing based on screen size (didnt work)
}

void draw() {
  background(0);
  image(field, 0, 0);
  
  // Switch shape type based on time
  if (millis() > 5000) { //change to triangles after 5 seconds
    useCircles = false;
  }
  
  //pattern for balls
  for (int i = 0; i < numColumns; i++) {
    for (int j = 0; j < numRows; j++) {
      int x = i * spacing + ballSize; // Calculate x position
      int y = j * spacing + ballSize; // Calculate y position
      
      // alternate placing of balls
      if ((i + j) % 2 == 0) {
        if (useCircles) {
          drawSoccerBall(x, y);
        } else {
          drawSoccerTriangle(x, y);
        }
      } else {
        if (useCircles) {
          drawSoccerBall(x + spacing / 2, y);
        } else {
          drawSoccerTriangle(x + spacing / 2, y);
        }
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

// Drawing soccer triangle
void drawSoccerTriangle(int x, int y) {
  fill(255);
  triangle(x - ballSize/2, y + ballSize/2, x + ballSize/2, y + ballSize/2, x, y - ballSize/2);
  if (rollover) {
    fill(0, 255, 0); // Change color to green when mouse hovers over
  } else {
    fill(0);
  }
  triangle(x - (ballSize - 10)/2, y + (ballSize - 10)/2, x + (ballSize - 10)/2, y + (ballSize - 10)/2, x, y - (ballSize - 10)/2);
}
