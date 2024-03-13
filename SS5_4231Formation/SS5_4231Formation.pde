//Osakpolor Noyiagbon
//Purpose of this assignment is to display the 4-2-3-1 formation used by Spain in the 2010 World Cup Final
//Hovering over each player enlarges their image which is pretty basic but will be elaborated on for the midterm

PImage field;
PImage[] playerImages = new PImage[11];
int numColumns = 8;
int numRows = 6;
int ballSize = 70;
int spacing;
int selectedPlayer = -1;
int previousTime = 0;

void setup() {
  size(1000, 636);
  field = loadImage("field.jpg");
  playerImages[0] = loadImage("goalkeeper.jpg");
  playerImages[1] = loadImage("defender1.jpg");
  playerImages[2] = loadImage("defender2.jpg");
  playerImages[3] = loadImage("defender3.jpg");
  playerImages[4] = loadImage("defender4.jpg");
  playerImages[5] = loadImage("midfielder1.jpg");
  playerImages[6] = loadImage("midfielder2.jpg");
  playerImages[7] = loadImage("midfielder3.jpg");
  playerImages[8] = loadImage("midfielder4.jpg");
  playerImages[9] = loadImage("forward1.jpg");
  playerImages[10] = loadImage("forward2.jpg");
  //noStroke();
  spacing = min(width, height) / max(numColumns, numRows); 
}

void draw() {
  background(0);
  image(field, 0, 0);


  // Setup for 4-2-3-1
  int[] formation = {
   -1, -1, -1, -1, -1, -1, -1, -1, 
   -1, -1, 1, -1, -1, 7, -1, -1, 
    -1, -1, 2, 5, -1, -1, -1, -1, 
    -1, 0, -1, -1, 8, 10, -1, -1, 
    -1, -1, 3, 6, -1, -1, -1, -1, 
    -1, -1, 4, -1, -1, 9, -1, -1
    -1, -1, -1, -1, -1, -1, -1
  };

  for (int i = 0; i < numColumns; i++) {
    for (int j = 0; j < numRows; j++) {
      int index = j * numColumns + i;
      if (index < 48) {
        int x = i * spacing + ballSize; 
        int y = j * spacing + ballSize; 

        
        if (formation[index] >= 0 && formation[index] < playerImages.length) {
          image(playerImages[formation[index]], x - ballSize / 2, y - ballSize / 2, ballSize, ballSize);
        }

        
        if (mouseX > x - ballSize && mouseX < x + ballSize &&
          mouseY > y - ballSize && mouseY < y + ballSize) {
          selectedPlayer = formation[index];
        }
      }
    }
  }

  
  if (selectedPlayer != -1) {
    int x = width - ballSize * 2; 
    int y = height / 2 - ballSize / 2; 
    image(playerImages[selectedPlayer], x, y, ballSize * 2, ballSize * 2); // Enlarge the image
  }
}
