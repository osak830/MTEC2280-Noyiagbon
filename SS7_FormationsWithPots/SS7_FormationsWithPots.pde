import processing.serial.*;

Serial myPort; // creates object from Serial class
int val = 0; // creates variable for data coming from serial port


PImage field;
PImage[] playerImages = new PImage[33];
String[] playerNames = {
  "Iker Casillas \n His illustrious career as a goalkeeper is \n marked by numerous titles, iconic saves, \n and a legacy of excellence \n in Spanish and international football. \n 869 Games \n 340 Clean Sheets \n 25 Trophies ", "Sergio Ramos \n His career epitomizes defensive brilliance, \n leadership, and a remarkable trophy-laden \n journey with Real Madrid and the \n Spanish national team. \n 807 Games (And counting) \n 116 Goals (From defense!) \n 28 Trophies", "Carles Puyol \n His career is defined by unwavering commitment, \n fierce defensive prowess, and a captain's \n leadership that propelled Barcelona to \n numerous triumphs on both domestic \n and international fronts. \n 682 Games \n 23 Trophies \n Nicknamed: The Shark", "Gerard Pique \n His career showcases his exceptional \n defensive skills, tactical intelligence, \n and instrumental role in Barcelona's dominance, \n  both domestically and in Europe, \n alongside his contributions to the \n Spanish national team's success. \n 667 Games \n 36 Trophies! \n Currently owns his own football club", "Joan Capdevilla \n His career is distinguished by his reliable \n defensive performances, tactical versatility, and \n crucial role in Spain's historic triumph \n at the 2010 FIFA World Cup. \n 588 Games \n 6 Trophies ",
  "Xabi Alonso \n His career is characterized by his \n elegant midfield mastery, precise passing, \n and pivotal contributions to club and \n international success, including \n UEFA Champions League triumphs and \n  World Cup glory with Spain. \n 695 Games \n 18 Trophies \n Current manager of Bayer Leverkusen who \n are unbeaten in all competitions this season!", "Sergio Busquets \n A midfield maestro who orchestrated \n Spain and Barcelona's play with his \n intelligence and precise passing. \n 752 Games (and counting) \n 35 Trophies! \n Still playing at the age of 35 in Miami", "Pedro Rodriguez \n Pedro's speed, versatility, and knack \n for scoring crucial goals added an extra \n dimension to any attack he played in \n 708 Games (and counting) \n 178 Goals \n 108 Assists \n  26 Trophies \n In 2009/2010, Pedro became the first player \n in history to score in six different club \n competitions in a single year, a record only \n matched by Lionel Messi who did it in 2011.", "Xavi Hernandez \n  The heartbeat of Spain and Barcelona's midfield. \n Xavi dictated the tempo of the game with \n his vision and passing range. \n 928 Games! \n 111 Goals \n 216 Assists \n 32 Trophies \n Current manager of his boyhood club \n FC Barcelona but will be leaving at the \n end of the season.",
  "Andres Iniesta \n The magician on the field. \n Iniesta's creativity and dribbling skills unlocked \n defenses and scored the winning goal \n in the 2010 World Cup final. \n 875 Games (and counting) \n 90 Goals \n 162 Assists \n 38 Trophies! \n Is still playing at the age of 39! in the UAE", "David Villa \n Spain's lethal striker. \n Villa's clinical finishing and versatility made \n him a constant threat to opposition defenses. \n 667 Games \n 341 Goals \n 82 Assists \n Nicknamed El Guaje or The Kid due to him playing \n football with kids much older than him", "Edwin van der Sar \n The reliable Dutch goalkeeper provided a \n steadfast presence in goal, crucial for \n Manchester United's defensive solidity. \n 821 Games \n 368 Clean Sheets \n 25 Trophies \n During the 2008–09 season, \n he set a world record by not conceding \n a league goal for 1,311 minutes.", "Wes Brown \n Although forgotten, solid and dependable. \n Brown's defensive prowess added \n resilience to United's backline. \n 484 Games \n 16 Trophies ", "Rio Ferdinand \n A stalwart in defense. \n Ferdinand's leadership and composure \n played a pivotal role in United's success. \n 691 Games \n 15 Trophies \n Currently a pundit for TNT Sports", "Nemanja Vidic \n Known for his physicality and aerial dominance, \n Vidić formed a formidable partnership with \n Ferdinand at the heart of United's defense. \n 383 Games \n 18 Trophies \n His former teammate Robin Van Persie \n when asked to describe him said \n When I think of him as a footballer, \n Nemanja puts his head where other players \n are scared to put their feet. That’s Nemanja.",
  "Patrice Evra \n Evra's marauding runs down the left flank \n coupled with defensive tenacity made him an \n indispensable asset to United's lineup. \n 725 Games \n 21 Trophies \n Many dont know but he is the son \n of a former diplomat in Senegal.", "Paul Scholes \n The midfield maestro's exceptional \n passing range, intelligence, and knack for \n scoring crucial goals were pivotal in \n dictating play and unlocking \n defenses for Manchester United. \n 718 Games \n 155 Goals \n 82 Assits \n 26 Trophies \n He has won 11 Premier League Titles \n (More than any player in history)", "Michael Carrick \n Carrick's vision, passing ability, \n and positional awareness orchestrated United's \n midfield, often dictating the tempo of the game. \n 702 Games \n 18 Trophies \n Current manager of Middlesbrough. ", " Cristiano Ronaldo \n Cristiano Ronaldo's iconic career is \n marked by his unparalleled athleticism, \n goal-scoring prowess, and numerous records, \n cementing his status as one of \n  football's greatest players of all time. \n 1001 Games (and counting) \n 873 Goals \n 236 Assits \n 33 Trophies \n  He has 5 Ballon D'Ors to his name \n Is The All time highest goalscorer in \n the UEFA Champions League (140) \n First player to score 800 goals", "Owen Hargreaves \n Hargreaves' versatility and work rate \n provided both defensive cover and \n attacking impetus in midfield. \n 289 Games \n 15 Trophies", "Wayne Rooney \n Wayne Rooney's illustrious career is \n characterized by his prolific \n goal-scoring ability, versatile playing \n style, and unwavering passion for \n the game, earning him a place among \n the Premier League's all-time greats. \n 764 Games \n 313 Goals \n 170 Assists \n 17 Trophies \n At just 16 years old, Wayne Rooney \n introduced himself to the world with an \n absolute rocket of a goal against \n Arsenal in 2002.", "Carlos Tevez \n Tevez's tireless work ethic, flair, \n and knack for scoring crucial goals provided \n an added dimension to United's attack, \n complementing Ronaldo and Rooney effectively. \n 721 Games \n 291 Goals \n 121 Assists \n 28 Trophies \n Nicknamed El Apache due to the neighborhood \n in Argentina where he grew up \n named Fuerte Apache.", 
  "Thibaut Courtois \n Commanded the penalty area with \n authority, providing crucial \n saves when called upon. \n 583 Games \n 239 Clean Sheets \n 18 Trophies \n Despite his many accomplishments, \n he's known as a snake to every club \n that he's left", "Cesar Azpilicueta \n Solid and reliable, Azpilicueta's \n defensive prowess and leadership \n were invaluable. \n 714 Games \n 66 Assists \n 12 Trophies \n He has the most appearances for \n Chelsea FC as an international player" , "Gary Cahill \n  A stalwart in defense, \n Cahill's tenacity and aerial prowess \n added stability to Chelsea's backline. \n 587 Games \n 8 Trophies \n After joining Chelsea FC in 2012 \n he became the fastest player in \n Premier League history to win \n every major trophy with a club \n in just 3 years." , "David Luiz \n Controlled the backline with \n his composure and vision, \n initiating attacks from deep positions. \n 641 Games \n 23 Trophies \n Nicknamed Sideshow Bob because of his hair", "Marcos Alonso \n A constant threat down the left flank, \n Alonso's deliveries and set-piece \n expertise were vital for Chelsea's attack. \n 457 Games \n 45 Goals \n 8 Trophies \n Alonso comes from a footballing family \n His Father was a player for Barcelona \n and his Grandfather a player for Real Madrid.", "Victor Moses \n Provided width and dynamism \n on the right flank, combining defensive \n diligence with attacking impetus. \n 474 Games \n 61 Goals \n 6 Trophies ", "N'Golo Kante \n Covered every blade of grass, \n Kanté's tireless work ethic and \n interceptions were instrumental in midfield. \n 464 Games \n 9 Trophies \n N'Golo's name has royal origins \n His parents named him after the great \n Mali emperor Ngolo Diarra \n of the Bambara empire." ,
  "Cesc Fabregas \n Cesc orchestrated Chelsea's midfield \n with his precise passing and vision. \n 739 Games \n 125 Goals \n 217 Assists \n 16 Trophies \n Fabregas would become Arsenal's youngest \n ever goalscorer at the time at just \n 16 years of age in 2003." , "Willian \n Willian's electrifying pace and \n dazzling footwork ignited Chelsea's attacks \n with flair and creativity. \n 739 Games \n 115 Goals \n 153 Assists \n 18 Trophies \n He currently owns an Italian restaurant in \n London named Babbo with his former \n teammate David Luiz.", "Eden Hazard \n (Personally my favorite ever player) \n The creative fulcrum of the team, \n Hazard's dribbling skills and \n incisive runs unlocked \n opposition defenses. \n 623 Games \n 167 Goals \n 157 Assists \n 14 Trophies \n Hazard is known to be a big fan of Burgers \n and was seen eating a burger after being \n substituted in a game in 2011.", "Diego Costa \n Led the line with power and aggression, \n Costa's physical presence and goal-scoring \n instincts spearheaded Chelsea's attack. \n 539 Games \n 196 Goals \n 11 Trophies \n Costa is a dual citizen for Brazil \n and Spain and has played for both \n national teams before deciding Spain."    
};
int numColumns = 8;
int numRows = 6;
int ballSize = 70;
int spacing;
int selectedPlayer = -1;
int previousTime = 0;

int currentX;
int currentY;
int speedX;
int speedY;

// Define formations
int[][] formations = {
  // Formation 1: 4-2-3-1 Spain's 2010 World Cup Winning Side
  {
    -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, 1, -1, -1, 7, -1, -1,
    -1, -1, 2, 5, -1, -1, -1, -1,
    -1, 0, -1, -1, 8, 10, -1, -1,
    -1, -1, 3, 6, -1, -1, -1, -1,
    -1, -1, 4, -1, -1, 9, -1, -1
  },
  // Formation 2:  4-4-2 Sir Alex Ferguson's 2008 UEFA Champions League Winning Manchester United
  {
    -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, 15, -1, 18, -1, -1, -1,
    -1, -1, 14, 16, -1, 20, -1, -1,
    -1, 11, -1, -1, -1, -1, -1, -1,
    -1, -1, 13, 17, -1, 21, -1, -1,
    -1, -1, 12, -1, 19, -1, -1, -1
  },
  // Formation 3: 3-4-2-1 Antonio Conte's Revolutionary 2017 Premier League Winners Chelsea
  {
   -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, 26, -1, -1, -1, -1,
    -1, -1, 25, 29, 31, -1, -1, -1,
    -1, 22, 24, -1, -1, 32, -1, -1,
    -1, -1, 23, 28, 30, -1, -1, -1,
    -1, -1, -1, 27, -1, -1, -1, -1
  }
  
};

int currentFormationIndex = 0;

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
  playerImages[11] = loadImage("vandersar.jpg");
  playerImages[12] = loadImage("brown.jpg");
  playerImages[13] = loadImage("rio.jpg");
  playerImages[14] = loadImage("vidic.jpg");
  playerImages[15] = loadImage("evra.jpg");
  playerImages[16] = loadImage("scholes.jpg");
  playerImages[17] = loadImage("carrick.jpg");
  playerImages[18] = loadImage("ronaldo.jpg");
  playerImages[19] = loadImage("hargreaves.jpg");
  playerImages[20] = loadImage("rooney.jpg");
  playerImages[21] = loadImage("tevez.jpg");
  playerImages[22] = loadImage("courtois.jpg");
  playerImages[23] = loadImage("azpi.jpg");
  playerImages[24] = loadImage("cahill.jpg");
  playerImages[25] = loadImage("luiz.jpg");
  playerImages[26] = loadImage("marcos.jpg");
  playerImages[27] = loadImage("moses.jpg");
  playerImages[28] = loadImage("kante.jpg");
  playerImages[29] = loadImage("cesc.jpg");
  playerImages[30] = loadImage("willian.jpg");
  playerImages[31] = loadImage("hazard.jpg");
  playerImages[32] = loadImage("costa.jpg");
  //noStroke();
  spacing = min(width, height) / max(numColumns, numRows);
  
  currentX = width / 2;
  currentY = height / 2;
  speedX = (int) random(-5, 5);
  speedY = (int) random(-5, 5);
  
  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[0]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 115200);
}


void draw() {
  if ( myPort.available() > 0) { 
    val = myPort.read();       
  }
  
  // Check if val reaches certain thresholds to switch formations
  if (val > 210) {
    currentFormationIndex = 2;
  } else if (val > 140) {
    currentFormationIndex = 1;
  } else if (val > 70) {
    currentFormationIndex = 0;
  }
  
  speedX = (int) map(val, 0, 255, -5, 5);
  speedY = (int) map(val, 0, 255, -5, 5);
  
  background(0);
  image(field, 0, 0);
  
  fill(255); 
  ellipse(currentX, currentY, ballSize, ballSize);

  // Update position of the bouncing ellipse
  currentX += speedX;
  currentY += speedY;

  // Check for collision with boundaries
  if (currentX <= 0 || currentX >= width) {
    speedX *= -1;
  }
  if (currentY <= 0 || currentY >= height) {
    speedY *= -1;
  }

  // Get current formation
  int[] formation = formations[currentFormationIndex];

  for (int i = 0; i < numColumns; i++) {
    for (int j = 0; j < numRows; j++) {
      int index = j * numColumns + i;
      if (index < formation.length) {
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
    fill(0); // Set rectangle color to black
    rect(width - 300, 0, 300, height); // Draw black rectangle on the right side

    fill(255); // Set text color to white
    textAlign(CENTER, TOP); // Align text to top center
    textSize(15); // Set text size
    text(playerNames[selectedPlayer], width - 150, 340); // Display player name in the rectangle under the image
    image(playerImages[selectedPlayer], width - 280, 50, 260, 260); // Display enlarged image in the rectangle
  }
}

void keyPressed() {
  // If 'F' key is pressed, reset the bouncing ellipse's position and speed
  if (key == 'f' || key == 'F') {
    currentX = width / 2;
    currentY = height / 2;
    speedX = (int) random(-5, val);
    speedY = (int) random(-5, val);
  }
}


/*void mousePressed() {
  // Switch to the next formation on mouse press
  currentFormationIndex = (currentFormationIndex + 1) % formations.length;
} */
