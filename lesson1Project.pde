// Thomas Fang
// Block 2-4
// February 3, 2025


// COLOR PALETTE:
// https://coolors.co/palette/cc5803-e2711d-ff9505-ffb627-ffc971

// TODO: ADD MORE COLOURS TO PALETTE AND MAKE LAND A BIT DARKER AND SUN BRIGHTER


color c1,c2,c3, backgroundColor, backgroundColor2, backgroundColor3, c5;
int groundLevel = 460;
PGraphics pg;
PGraphics pg2;

color[] robotColors = {
  color(61, 61, 61),    
  color(70, 130, 180),  
  color(200, 200, 200), 
  color(169, 169, 169)  
};

void setup() {
  size(960, 720);
  pg = createGraphics(width, height);
  pg2 = createGraphics(width, height);
  
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
  
  int sunX = 850;
  int sunY = 338;
  int sunRadius = 100;
  // sun gradient
  drawCircleGradient(sunX, sunY, sunRadius, 600, color(300, 251, 153), backgroundColor, 150);
  
  // sun
  fill(255, 253, 201);
  noStroke();
  circle(sunX, sunY, sunRadius);
  
  // ground
  fill(c1);
  quad(0, groundLevel, 960, groundLevel, 960, 720, 0, 720);
  //drawVerticalRectGradient(groundLevel, 720, color(237, 131, 52), c1);
  
  // mountains
  noStroke();
  fill(c2);
  triangle(410-30, 340, 390-30, groundLevel, 250-30, groundLevel);
  fill(c3);
  triangle(410-30, 340, 390-30, groundLevel, 480-30, groundLevel);
  
  fill(c2);
  triangle(250, 250, 210, groundLevel, 30, groundLevel);
  fill(c3);
  triangle(250, 250, 210, groundLevel, 350, groundLevel);
  
  fill(c2);
  triangle(645, 215, 620, groundLevel, 320, groundLevel);
  fill(c3);
  triangle(645, 215, 620, groundLevel, 800, groundLevel);
  
  // cloud shadows
  pg2.beginDraw();
  pg2.noStroke();
  pg2.fill(300 * 0.1, 251 * 0.1, 153 * 0.1, 69);
  pg2.ellipse(170+80-2, 100+30+3, 80, 40);
  pg2.ellipse(140+80-2, 100+30+3, 90, 60);
  pg2.ellipse(90+80-2, 115+30+3, 70, 35);
  
  pg2.ellipse(480-2, 130+3, 100, 80);
  pg2.ellipse(440-2, 155+3, 90, 55);
  pg2.ellipse(520-2, 140+3, 100, 60);
  pg2.endDraw();
  pg2.filter(BLUR, 2);
  image(pg2, 0, 0);
  
  // clouds
  fill(300 * 0.8, 251 * 0.8, 153 * 0.8, 255);
  ellipse(170+80, 100+30, 80, 40);
  ellipse(140+80, 100+30, 90, 60);
  ellipse(90+80, 115+30, 70, 35);
  
  ellipse(480, 130, 100, 80);
  ellipse(440, 155, 90, 55);
  ellipse(520, 140, 100, 60);
  
  // robot
  int robotX = 250;
  int robotY = 500;
  
  // Shadow
  float shadowX = robotX - 20;
  float shadowY = robotY + 40;
  
  pg.beginDraw();
  pg.noStroke();
  pg.fill(0, 0, 0, 70); 
  pg.shearY(-0.13);
  pg.ellipse(shadowX-23, shadowY + 53, 155, 30);
  pg.shearY(0.1);
  pg.filter(BLUR, 2);
  pg.ellipse(shadowX+5, shadowY + 26, 30, 20);
  pg.ellipse(shadowX+33, shadowY + 26, 30, 20);
  pg.filter(BLUR, 2);
  pg.endDraw();
  
  image(pg, 0, 0);
  
  
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
  fill(255, 255, 255);
  ellipse(robotX - 11, robotY - 112, 3, 3); // flare
  
  // arms
  noStroke();
  fill(robotColors[0]);
  rect(robotX - 50, robotY - 70, 20, 60, 5); 
  rect(robotX + 30, robotY - 70, 20, 60, 5);
  // shoulders
  fill(robotColors[1]);
  rect(robotX - 50, robotY - 70, 20, 15, 3); 
  rect(robotX + 30, robotY - 70, 20, 15, 3);
  
  // legs
  fill(robotColors[1]);
  rect(robotX - 25, robotY, 20, 60, 5);
  rect(robotX + 5, robotY, 20, 60, 5); 
  fill(robotColors[3]);
  rect(robotX - 25, robotY + 20, 20, 10, 2); 
  rect(robotX + 5, robotY + 20, 20, 10, 2); 
  
  
  
}


void drawCircleGradient(int x, int y, float r1, float r2, color c1, color c2, int numSteps) {
  noStroke();
  float width = r2 - r1;
  float deltaR = (r2 - r1) / numSteps;
  for(int i = 0; i < numSteps; i++) {
    float floatAmt = i * deltaR / width;
    fill(lerpColor(c2, c1, floatAmt));
    circle(x, y, r2 - (i*deltaR));
  }
}
