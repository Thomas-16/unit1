// Thomas Fang
// Block 2-4
// February 3, 2025


// COLOR PALETTE:
// https://coolors.co/palette/cc5803-e2711d-ff9505-ffb627-ffc971

// TODO: ADD MORE COLOURS TO PALETTE AND MAKE LAND A BIT DARKER AND SUN BRIGHTER


color c1,c2,c3, backgroundColor, backgroundColor2, backgroundColor3, c5;
int groundLevel = 460;

color[] robotColors = {
  color(61, 61, 61),    
  color(70, 130, 180),  
  color(200, 200, 200), 
  color(169, 169, 169)  
};

void setup() {
  size(960, 720);
  
  c1 = color(204, 88, 3);
  c2 = color(226, 113, 29);
  c3 = color(255, 149, 5);
  backgroundColor = color(240, 162, 34);
  backgroundColor2 = color(235, 157, 33);
  backgroundColor3 = color(222, 144, 18);
  c5 = color(255, 201, 113);
  
  background(backgroundColor);
  noLoop();
}

void draw() {
  // sky gradient
  noStroke();
  fill(backgroundColor2);
  triangle(0, 0, 550, 0, 0, 550);
  fill(lerpColor(backgroundColor2, backgroundColor3, 0.5));
  triangle(0, 0, lerp(550, 210, 0.5), 0, 0, lerp(550, 210, 0.5));
  fill(backgroundColor3);
  triangle(0, 0, 210, 0, 0, 210);
  
  int sunPosX = 850;
  int sunPosY = 338;
  int sunRadius = 100;
  // sun gradient
  drawGradient(sunPosX, sunPosY, sunRadius, 600, color(300, 251, 153), backgroundColor, 300);
  
  // sun
  fill(255, 253, 201);
  noStroke();
  circle(sunPosX, sunPosY, sunRadius);
  
  // land
  fill(c1);
  quad(0, groundLevel, 960, groundLevel, 960, 720, 0, 720);
  
  // mountains
  fill(c2);
  triangle(250, 250, 210, groundLevel, 30, groundLevel);
  fill(c3);
  triangle(250, 250, 210, groundLevel, 350, groundLevel);
  
  fill(c2);
  triangle(645, 215, 620, groundLevel, 320, groundLevel);
  fill(c3);
  triangle(645, 215, 620, groundLevel, 800, groundLevel);
  
  // clouds
  fill(300 * 0.95, 251 * 0.95, 153 * 0.95, 255);
  ellipse(170+80, 100+30, 80, 40);
  ellipse(140+80, 100+30, 90, 60);
  ellipse(90+80, 115+30, 70, 35);
  
  fill(300 * 0.95, 251 * 0.95, 153 * 0.95, 255);
  ellipse(480, 130, 100, 80);
  ellipse(440, 155, 90, 55);
  ellipse(520, 140, 100, 60);
  
  // robot
  int robotX = 250;
  int robotY = 500;
  
  // robot body
  fill(robotColors[0]);
  rect(robotX-30, robotY-80, 60, 80, 10);
  
  // robot head
  fill(robotColors[1]);
  rect(robotX-20, robotY-120, 40, 40, 5);
  
  // eyes
  fill(robotColors[2]);
  ellipse(robotX - 10, robotY - 110, 12, 12);
  ellipse(robotX + 10, robotY - 110, 12, 12);
  fill(0);
  ellipse(robotX - 10, robotY - 110, 8, 8);
  ellipse(robotX + 10, robotY - 110, 8, 8);
  fill(robotColors[2]);
  ellipse(robotX - 11, robotY - 112, 3, 3); // lens flare
  
}



void drawGradient(int x, int y, float r1, float r2, color c1, color c2, int numSteps) {
  noStroke();
  float width = r2 - r1;
  float deltaR = (r2 - r1) / numSteps;
  for(int i = 0; i < numSteps; i++) {
    float floatAmt = i * deltaR / width;
    fill(lerpColor(c2, c1, floatAmt));
    circle(x, y, r2 - (i*deltaR));
  }
}
