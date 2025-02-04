color[] marsColors = {
  color(204, 88, 3),    // Dark orange (environment)
  color(226, 113, 29),  // Medium orange (environment)
  color(255, 149, 5),   // Bright orange (environment)
  color(255, 182, 39),  // Yellow-orange (environment)
  color(255, 201, 113)  // Light yellow (environment)
};

color[] robotColors = {
  color(34, 34, 34),     // Dark graphite (robot primary)
  color(70, 130, 180),   // Steel blue (robot secondary)
  color(200, 200, 200),  // Silver (robot accents)
  color(169, 169, 169)   // Dark silver (robot details)
};

void setup() {
  size(800, 600);
  noLoop();
  noStroke();
}

void draw() {
  drawGradientBackground();
  drawSun();
  drawMountains();
  drawRobot();
}
void drawGradientBackground() {
  // Create vertical gradient using the color palette
  for (int y = 0; y < height; y++) {
    float t = map(y, 0, height, 0, 1);
    color c;
    if (t < 0.25) {
      c = lerpColor(marsColors[0], marsColors[1], t*4);
    } else if (t < 0.5) {
      c = lerpColor(marsColors[1], marsColors[2], (t-0.25)*4);
    } else if (t < 0.75) {
      c = lerpColor(marsColors[2], marsColors[3], (t-0.5)*4);
    } else {
      c = lerpColor(marsColors[3], marsColors[4], (t-0.75)*4);
    }
    stroke(c);
    line(0, y, width, y);
  }
}

void drawSun() {
  fill(marsColors[2]);
  ellipse(width/2, height * 0.85, 120, 120);
}

void drawMountains() {
  // Distant mountains
  fill(marsColors[0]);
  drawMountainRange(height * 0.6, 80, 150);
  
  // Closer mountains
  fill(marsColors[1]);
  drawMountainRange(height * 0.7, 120, 200);
}

void drawMountainRange(float baseY, float minHeight, float maxHeight) {
  beginShape();
  vertex(-100, height); // Start off left
  float xStep = width / 12.0;
  for (float x = -xStep; x < width + xStep; x += xStep) {
    float y = baseY - random(minHeight, maxHeight);
    vertex(x, y);
  }
  vertex(width + 100, height); // End off right
  endShape(CLOSE);
}
void drawRobot() {
  float robotX = width * 0.65;
  float robotY = height * 0.75;
  
  // Body (metallic main)
  fill(robotColors[0]);
  rect(robotX - 30, robotY - 80, 60, 80, 10);
  
  // Head (steel blue)
  fill(robotColors[1]);
  rect(robotX - 20, robotY - 120, 40, 40, 5);
  
  // Eyes with lens effect
  fill(robotColors[2]);
  ellipse(robotX - 10, robotY - 110, 12, 12);
  ellipse(robotX + 10, robotY - 110, 12, 12);
  fill(0);
  ellipse(robotX - 10, robotY - 110, 8, 8);
  ellipse(robotX + 10, robotY - 110, 8, 8);
  fill(robotColors[2]);
  ellipse(robotX - 11, robotY - 112, 3, 3); // lens flare
  
  // Antenna with glow
  stroke(robotColors[3]);
  line(robotX, robotY - 120, robotX, robotY - 140);
  fill(robotColors[2]);
  ellipse(robotX, robotY - 140, 10, 10);
  
  // Arms with joint details
  noStroke();
  fill(robotColors[0]);
  rect(robotX - 50, robotY - 70, 20, 60, 5); // Left arm
  rect(robotX + 30, robotY - 70, 20, 60, 5); // Right arm
  fill(robotColors[1]);
  rect(robotX - 50, robotY - 70, 20, 15, 3); // Left shoulder
  rect(robotX + 30, robotY - 70, 20, 15, 3); // Right shoulder
  
  // Legs with hydraulic details
  fill(robotColors[1]);
  rect(robotX - 25, robotY, 20, 60, 5); // Left leg
  rect(robotX + 5, robotY, 20, 60, 5);  // Right leg
  fill(robotColors[3]);
  rect(robotX - 25, robotY + 20, 20, 10, 2); // Left knee
  rect(robotX + 5, robotY + 20, 20, 10, 2);  // Right knee
  
  // Chest panel
  fill(robotColors[3]);
  rect(robotX - 20, robotY - 60, 40, 20, 3);
  fill(robotColors[2]);
}
