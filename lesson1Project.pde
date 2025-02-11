
color c1,c2,c3, backgroundColor, backgroundColor2, backgroundColor3, c5;
int groundLevel = 460;
PGraphics pg, pg2, pg3;

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
  pg3 = createGraphics(width, height);
  
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
  
  // pebbles
  fill(160, 82, 45);
  noStroke();
  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(groundLevel, height);
    float s = random(5, 13);
    ellipse(x, y, s, s*random(0.7, 1));
  }
  
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
  
  // cactus
  int cactusX = 700;
  int cactusY = groundLevel + 20;
  int stemWidth = 20;
  int stemHeight = 100;
  int armWidth  = 15;
  int armHeight = 40;
  int armYOffset = 30; 
  
  pg3.beginDraw();
  pg3.noStroke();
  pg3.fill(0, 0, 0, 70); 
  pg3.shearY(-0.05);
  pg3.ellipse(cactusX + 10, cactusY + 40, 40, 20);
  pg3.filter(BLUR, 2);
  pg3.endDraw();
  
  image(pg3, 0, 0);
  
  noStroke();
  fill(34, 139, 34);  
  rect(cactusX, cactusY - stemHeight, stemWidth, stemHeight, 5);
  
  fill(50, 205, 50, 180);  
  rect(cactusX + stemWidth - 5, cactusY - stemHeight, 5, stemHeight);
  
  fill(34, 139, 34);
  rect(cactusX - armWidth, cactusY - armYOffset - armHeight, armWidth, armHeight, 5);
  rect(cactusX + stemWidth, cactusY - armYOffset - armHeight + 10, armWidth, armHeight, 5);
  
  fill(255, 105, 180); 
  ellipse(cactusX - armWidth/2, cactusY - armYOffset - armHeight, 6, 6);
  ellipse(cactusX + stemWidth + armWidth/2, cactusY - armYOffset - armHeight + 10, 6, 6);
  
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
