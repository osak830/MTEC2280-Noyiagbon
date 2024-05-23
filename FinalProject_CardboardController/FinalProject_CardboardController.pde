//Osakpolor Noyiagbon Final Project
// Click on one of the four quadrants to play a guitar loop
//Use "Z,X,C,V,B,N,M" To play a variety of percussions while the loop is playing
//Link with the arduino code to adjust tempo and add reverb, and high and low pass filters.

//Credit for audios used:
//https://www.youtube.com/watch?v=pfML-lRyImo 
//https://www.youtube.com/watch?v=sCSsjZ7s5UQ
//https://www.youtube.com/watch?v=F7FSSHKcoa4
//https://www.youtube.com/watch?v=IsPWNFHtWB0

import processing.sound.*;
import processing.serial.*;

SoundFile audio1, audio2, audio3, audio4;
boolean[] isPlaying = new boolean[4];
int quadrantSize;

SoundFile audio5;
SoundFile audio6;
SoundFile audio7;
SoundFile audio8;
SoundFile audio9;
SoundFile audio10;
SoundFile audio11;

Serial myPort; // creates object from Serial class
int val = 0; // creates variable for data coming from serial port
int val1 = 0;
int val2 = 0;
int val3 = 0;

Reverb reverb;
HighPass highPass;
LowPass lowPass;
Delay delay;

Amplitude amplitude;
FFT fft;

void setup() {
  size(800, 600);
  textAlign(CENTER);
  textSize(64);
  quadrantSize = width / 2;
  
  audio1 = new SoundFile(this, "Amponsah.mp3");
  audio2 = new SoundFile(this, "makossa.wav");
  audio3 = new SoundFile(this, "odumeje.wav");
  audio4 = new SoundFile(this, "slowhighlife.wav");
  audio5 = new SoundFile(this, "kick.wav");
  audio6 = new SoundFile(this, "hat.wav");
  audio7 = new SoundFile(this, "snare.wav");
  audio8 = new SoundFile(this, "stick.wav");
  audio9 = new SoundFile(this, "perc.wav");
  audio10 = new SoundFile(this, "hicong.wav");
  audio11 = new SoundFile(this, "locong.wav");
  
  reverb = new Reverb(this);
  delay = new Delay(this);
  highPass = new HighPass(this);
  lowPass = new LowPass(this);
  
  amplitude = new Amplitude(this);
  fft = new FFT(this, 512);

  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[0]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 115200);
}

void draw() {
  if (myPort.available() > 0) { 
    val = myPort.read();
    val1 = myPort.read();
    val2 = myPort.read();
    val3 = myPort.read();
  }
  
  background(255);
  stroke(0);
  strokeWeight(2);
  line(quadrantSize, 0, quadrantSize, height);
  line(0, quadrantSize, width, quadrantSize);

  float bpm = map(val, 0, 255, 0.7, 2.0);

  audio1.rate(bpm);
  audio2.rate(bpm);
  audio3.rate(bpm);
  audio4.rate(bpm);
  audio5.rate(bpm);
  audio6.rate(bpm);
  audio7.rate(bpm);
  audio8.rate(bpm);
  audio9.rate(bpm);
  audio10.rate(bpm);
  audio11.rate(bpm);
  

  fill(0);
  text(bpm, width / 2, height / 6);

  if (val1 == 1) {
    reverb.process(audio1);
    reverb.process(audio2);
    reverb.process(audio3);
    reverb.process(audio4);
    /*
    reverb.process(audio5);
    reverb.process(audio6);
    reverb.process(audio7);
    reverb.process(audio8);
    reverb.process(audio9);
    reverb.process(audio10);
    reverb.process(audio11); */
    
  } else {
    reverb.stop();
  }

  if (val2 == 1) {
    highPass.process(audio1);
    highPass.process(audio2);
    highPass.process(audio3);
    highPass.process(audio4);
    /*
    highPass.process(audio5);
    highPass.process(audio6);
    highPass.process(audio7);
    highPass.process(audio8);
    highPass.process(audio9);
    highPass.process(audio10);
    highPass.process(audio11); */
  } else {
    highPass.stop();
  }

  if (val3 == 1) {
    lowPass.process(audio1);
    lowPass.process(audio2);
    lowPass.process(audio3);
    lowPass.process(audio4);
    lowPass.process(audio5);
    /*lowPass.process(audio6);
    lowPass.process(audio7);
    lowPass.process(audio8);
    lowPass.process(audio9);
    lowPass.process(audio10);
    lowPass.process(audio11); */
  } else {
    lowPass.stop();
  }

  visualizeAudio();
}

void keyPressed() {
  if (key == 'z' || key == 'Z') {
    audio5.play();
  }
  
  if (key == 'x' || key == 'X') {
    audio6.play();
  }
  
  if (key == 'c' || key == 'C') {
    audio7.play();
  }
  
  if (key == 'v' || key == 'V') {
    audio8.play();
  }
  
  if (key == 'b' || key == 'B') {
    audio9.play();
  }
  
  if (key == 'n' || key == 'N') {
    audio10.play();
  }
  
  if (key == 'm' || key == 'M') {
    audio11.play();
  }
}

void mousePressed() {
  int quadrantX = mouseX / quadrantSize;
  int quadrantY = mouseY / quadrantSize;
  int quadrantIndex = quadrantX + quadrantY * 2;

  if (quadrantIndex == 0) {
    toggleAudio(audio1, 0);
  } else if (quadrantIndex == 1) {
    toggleAudio(audio2, 1);
  } else if (quadrantIndex == 2) {
    toggleAudio(audio3, 2);
  } else if (quadrantIndex == 3) {
    toggleAudio(audio4, 3);
  }
}

void toggleAudio(SoundFile audio, int index) {
  if (isPlaying[index]) {
    audio.stop();
    isPlaying[index] = false;
  } else {
    audio.play();
    audio.loop();
    amplitude.input(audio);
    fft.input(audio);
    isPlaying[index] = true;
  }
}

void visualizeAudio() {
  // Amplitude Visualization
  //float level = amplitude.analyze();
  //fill(255, 0, 0);
  //rect(50, height - 100, 100, -level * 300);

  // FFT Visualization
  float[] spectrum = new float[512];
  fft.analyze(spectrum);
  
  noFill();
  stroke(0, 0, 255);
  beginShape();
  for (int i = 0; i < spectrum.length; i++) {
    float x = map(i, 0, spectrum.length, 0, width);
    float y = map(spectrum[i], 0, 1, height, 0);
    vertex(x, y);
  }
  endShape();
}
