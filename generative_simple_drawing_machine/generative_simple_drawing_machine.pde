

float X1, Y1, AX1, AY1, X2, Y2, AX2, AY2;
int count = 0;
float cor1;
float cor2;


void setup() {
  size(720, 600);
  X1 = noise(600);
  Y1 = random(600);
  AX1 = random(600);
  AY1 = noise(600);
  X2 = random(600);
  Y2 = random(600);
  AX2 = noise(600);
  AY2 = random(600);
  background(0);
}

void draw() {
  //background(0);
  if (keyPressed == true) {
    count = count + 1;
    if (key == 'a' || key == 'A') {
      X1 = mouseX;
      Y1 = mouseY;
    }
    if (key == 's' || key == 'S') {
      AX1 = mouseX;
      AY1 = mouseY;
    }

    if (key == 'd' || key == 'D') {
      X2 = mouseX;
      Y2 = mouseY;
    }

    if (key == 'f' || key == 'F') {
      AX2 = mouseX;
      AY2 = mouseY;
    }
    if (key == 'z' || key == 'Z') {
      save("cover.jpg");  
      
    }
  }

  cor1 = random(100);
  cor2 = random(20);
  smooth();
  noFill();
  //stroke(255, 102, 0);
  //line(X1, Y1, AX1, AY1);
  //line(AX2, AY2, X2, Y2);
  strokeWeight(0.2);
  stroke(255-cor1,255,180-cor2);
  bezier(X1, Y1, AX1, AY1, AX2, AY2, X2, Y2);
}