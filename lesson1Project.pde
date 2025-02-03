// Thomas Fang
// Block 2-4
// February 3, 2025


// COLOR PALETTE:
// https://coolors.co/palette/cc5803-e2711d-ff9505-ffb627-ffc971

// TODO: ADD MORE COLOURS TO PALETTE AND MAKE LAND A BIT DARKER AND SUN BRIGHTER

color c1,c2,c3,c4,c5;
int groundLevel = 460;

void setup() {
  size(960, 720);
  
  c1 = color(204, 88, 3);
  c2 = color(226, 113, 29);
  c3 = color(255, 149, 5);
  c4 = color(255, 182, 39);
  c5 = color(255, 201, 113);
  
  background(c4);
  noLoop();
}

void draw() {
  //sun
  fill(c5);
  noStroke();
  circle(840, 350, 100);
  
  //land
  fill(c1);
  quad(0, groundLevel, 960, groundLevel, 960, 720, 0, 720);
  
  //mountains
  fill(c2);
  triangle(250, 250, 210, groundLevel, 30, groundLevel);
  fill(c3);
  triangle(250, 250, 210, groundLevel, 350, groundLevel);
  
  fill(c2);
  triangle(645, 215, 620, groundLevel, 320, groundLevel);
  fill(c3);
  triangle(645, 215, 620, groundLevel, 800, groundLevel);
  
  
}
