float r = 255;
float g = 255;
float b = 255;
float randSize = 200;
float circleX;
float circleY;


void setup()
{
  size (1080, 720);
  //background(255);
}

void draw()
{
  circleX = random(width);
  circleY = random(height);
  
  background(75);
  fill(r, g, b);
  ellipse(circleX, circleY, 24, 24);
  
  //rect(circleX, circleY, 50, 50);
  
  stroke(r, g, b);
  strokeWeight(random(randSize/2));
  line (mouseX, mouseY, pmouseX, pmouseY);
  
  if (mouseX > width/2)
  {
    fill(r, g, b);
    rect(circleX, circleY, randSize, 50);
  }
  
  else if (mouseY > height/2)
  {
    fill(r,g,b);
    arc(circleX, circleY, randSize, 100, PI, TWO_PI);
  }
}


void mousePressed()
{
  r = random(0, 255);
  g = random(0, 255);
  b = g = random(0, 255);
}
