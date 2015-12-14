float raio, Stroker, desvioX, desvioY;
int raioMax = 200;
float StrokeMax = 0.7;
int desvioMax = 50;


void setup(){
  
size(851,315);
stroke(0);
background(255);

}


void draw(){

raio = map (mouseY,0,height,0,raioMax);
Stroker = map(mouseX,width,0,0,StrokeMax);
desvioX = map(mouseX,0,width,0,desvioMax);
desvioY = map(mouseY,0,height,0,desvioMax);
//background(255);
strokeWeight(Stroker);
line(mouseX,mouseY,50-desvioX,200+desvioY);
strokeWeight(1);
ellipse(mouseX,mouseY,raio,raio);
if (keyPressed) {
save("cover.jpg");  
background(255);

}

}