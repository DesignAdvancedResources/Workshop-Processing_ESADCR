import processing.pdf.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
FFT         fft;


ArrayList planets;

int numberOfPlanets = 100;

int count;
int tempoVida = 3;
float eRadius;
int alphal;

void setup(){

size(640,480);  
planets = new ArrayList();
//frameRate(14);
background(255);

noStroke();
fill(0);
count = 0;
frameRate(200);

  minim = new Minim(this);
  song = minim.loadFile("jingle.mp3", 2048);
  song.loop();
  
    beat = new BeatDetect();
   fft = new FFT( song.bufferSize(), song.sampleRate() );
  
  eRadius = 20;
alphal = 80;
for (int i = 0; i<numberOfPlanets; i++){
planets.add(new Planeta());
}


}

void draw(){

  
beat.detect(song.mix);
   if ( beat.isOnset() ) eRadius = 80;
   

  eRadius *= 0.95;
  if ( eRadius < 10 ) eRadius = 10;
 fft.forward( song.mix );  
  
alphal = int(map(fft.getBand(int(random(fft.specSize())))*10, 0,1,120,20));  
  
if (count == tempoVida){  
fill(0,0,0,alphal);
rect(0,0,width,height);
count = 0;
}

fill(255);
//background(255);


newBorns();
for (int j = 0; j <planets.size(); j++){
Planeta planet = (Planeta)planets.get(j);
planet.dimensionar(eRadius);
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