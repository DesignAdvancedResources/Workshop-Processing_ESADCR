
ArrayList planets;

int numberOfPlanets = 600;

int count;
int tempoVida = 2;

void setup(){

size(640,480);  
planets = new ArrayList();
//frameRate(14);
background(255);

noStroke();
fill(0);
count = 0;
frameRate(200);

for (int i = 0; i<numberOfPlanets; i++){
planets.add(new Planeta());
}


}

void draw(){
  
if (count == tempoVida){  
fill(255,255,255,80);
rect(0,0,width,height);
count = 0;
}

fill(0);
//background(255);


newBorns();
for (int j = 0; j <planets.size(); j++){
Planeta planet = (Planeta)planets.get(j);
planet.dimensionar();
planet.direcciona();
planet.mover();
planet.desenhar();

}
count++;


}

void newBorns(){

if(count == tempoVida-1){
Planeta planets = new Planeta();

}

}