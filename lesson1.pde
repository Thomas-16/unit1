// Thomas Fang
// Block 2-4
// January 30, 2025


//size(1280, 720); // width, height
//background(int(random(0, 256)), int(random(0, 256)), int(random(0, 256))); // r, g, b

//fill(int(random(0, 256)), int(random(0, 256)), int(random(0, 256))); // r, g, b
//rect(300, 300, 100, 100); // x, y, w, h

//stroke(255, 255, 0); // r, g, b
//strokeWeight(5); // thickness in px

//fill(161, 232, 39); // r, g, b
//ellipse(1280/2, 720/2, 400, 400);
//line(900, 700, 1280/2, 720/2); // x1, y1, x2, y2

//fill(int(random(0, 256)), int(random(0, 256)), int(random(0, 256))); // r, g, b
//triangle(100, 200, 500, 200, 50, 20); // x1, y1, x2, y2, x3, y3

size(600, 700);
background(255, 255, 255);

//ears
fill(118,60,25);
ellipse(160, 340, 60, 90); // left
ellipse(440, 340, 60, 90); // right

//head
ellipse(300, 350, 270, 300);

//eyes
fill(255, 255, 255);
ellipse(230, 320, 50, 25);
ellipse(600-230, 320, 50, 25);
fill(0, 0, 0);
ellipse(230, 320, 20, 20);
ellipse(600-230, 320, 20, 20);

//nose
fill(118,60,25);
triangle(300, 335, 300 + 20, 335 + (sqrt(3) * 20), 300 - 20, 335 + (sqrt(3) * 20));

//inside of mouth
fill(163, 48, 7);
ellipse(300, 435, 80, 45);

//teeth
fill(255, 255, 255);
stroke(69, 69, 69);
strokeWeight(1);
rect(300 - (13/2), 430-3 - (13/2), 11, 11);
rect(300 - (13/2) - (1 * 11), 430-3 - (13/2), 11, 11);
rect(300 - (13/2) - (2 * 11), 430-3 - (13/2), 11, 11);
rect(300 - (13/2) - (3 * 11), 430-3 - (13/2), 11, 11);
rect(300 - (13/2) + (1 * 11), 430-3 - (13/2), 11, 11);
rect(300 - (13/2) + (2 * 11), 430-3 - (13/2), 11, 11);
rect(300 - (13/2) + (3 * 11), 430-3 - (13/2), 11, 11);

rect(300 - (13/2), 430+3 + (13/2), 11, 11);
rect(300 - (13/2) - (1 * 11), 430+3 + (13/2), 11, 11);
rect(300 - (13/2) - (2 * 11), 430+2 + (13/2), 11, 11);
rect(300 - (13/2) - (3 * 11), 430-1 + (13/2), 11, 11);
rect(300 - (13/2) + (1 * 11), 430+3 + (13/2), 11, 11);
rect(300 - (13/2) + (2 * 11), 430+2 + (13/2), 11, 11);
rect(300 - (13/2) + (3 * 11), 430-1 + (13/2), 11, 11);

//lips
noFill();
stroke(156, 87, 91);
strokeWeight(12);
arc(300, 430, 80, 25, -PI, 0, OPEN);
arc(300, 430, 80, 45, 0, PI, OPEN);

//hair
fill(0, 0, 0);
noStroke();
ellipse(300, 220, 130, 40);

//beard - left
stroke(0, 0, 0);
strokeWeight(5);
arc(210, 480, 180, 50, radians(-90), radians(20), OPEN);
arc(300, 350, 275, 305, radians(90), radians(90 + 45), OPEN);
noStroke();
quad(300, 504, 300, 480, 200, 450, 225, 480);
//beard - right
stroke(0, 0, 0);
strokeWeight(5);
arc(390, 480, 180, 50, radians(160), radians(270), OPEN);
arc(300, 350, 275, 305, radians(45), radians(90), OPEN);
noStroke();
quad(300, 504, 300, 480, 400, 450, 375, 480);
