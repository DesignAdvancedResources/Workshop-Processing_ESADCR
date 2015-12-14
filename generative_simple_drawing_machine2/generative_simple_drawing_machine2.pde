import processing.video.*;

float X1, Y1, AX1, AY1, X2, Y2, AX2, AY2;
float cor1;
float cor2;
int count = 0;
String nomeDoficheiro;
float evolX, evolY;
Movie mov;

void setup() {
  
  size(1500, 500);
  X1 = noise(600);
  Y1 = random(600);
  AX1 = random(600);
  AY1 = noise(600);
  X2 = random(600);
  Y2 = random(600);
  AX2 = noise(600);
  AY2 = random(600);
  background(255);
  evolX = width;
  evolY = 0;
}

void draw() {
  evolX--;
  evolY++;
 
  
  if (evolX == 0) {
    evolX = width;
  }
  if (evolY == height) {
    evolY = 0;
  }
  
  
  if (keyPressed == true) {

    if (key == 'z' || key == 'Z') {
      nomeDoficheiro = "cover" + str(count) + ".png";
      save(nomeDoficheiro);
      count++;
    }
    if (key == 'b' || key == 'B') {
      background(255);
    }

    if (key == 's' || key == 'S') {
      evolX=evolX-random(evolX);
      evolY=evolY-random(evolY);
    }
  }


  cor1 = random(100);
  cor2 = random(20);
  smooth();
  noFill();
  X2 =  random(evolX);
  Y2 = random(evolY);
  AX2 = random(evolX);
  AY1 = random(evolY);
  X1 = random(evolX)-width;
  Y1 = random(evolY)-height;
  AX1 = random(evolX);
  AY2 = random(evolY);
  //stroke(255, 102, 0);
  //line(X1, Y1, AX1, AY1);
  //line(AX2, AY2, X2, Y2);
  strokeWeight(0.2);
  stroke(200, 40, 255-cor1);
  bezier(X1, Y1, AX1, AY1, AX2, AY2, X2, Y2);
}