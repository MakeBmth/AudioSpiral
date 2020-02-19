import processing.sound.*;

AudioIn in;
Amplitude amp;

float r = 0;
float theta = 0;

float amplitude = 0;
float volume = 5;

void setup() {
  senderInit("G10 P0 L20 X0 Y0 Z0");  // Set origin to current position
  size(450, 380);
  background(255);

  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {
  amplitude = amp.analyze();
  float jiggle = amplitude * volume;
  println(jiggle);
  //float jiggle = random(-1.5, 1.5);
  float x = (r+jiggle) * cos(theta);
  float y = (r+jiggle) * sin(theta);

  // Draw an ellipse at x,y
  stroke(0);
  fill(0);
  // Adjust for center of window
  point(x+width/2, y+height/2);
  drawTo(x+width/2, y+height/2, 50000);

  // Increment the angle
  theta += 0.01;
  // Increment the radius
  r += 0.001;
}
