import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput input;
FFT fft;


ArrayList bolas;

//número inicial de bolas 
int numeroDeBolas = 500;

void setup(){
  size(800, 600);
  background(0); 

  minim = new Minim(this);
  input = minim.getLineIn(Minim.STEREO, 512);
  
  fft = new FFT(input.bufferSize(), input.sampleRate());

  bolas = new ArrayList();

  //criamos numeroDeBolas para começar....
  for(int i=0; i<numeroDeBolas; i++){
    bolas.add(new Bola()); 
  }
}

void draw(){
  fft.forward(input.mix);
  
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);

  stroke(255);
  noFill();
  for(int i=0; i<bolas.size(); i++){
    Bola b = (Bola)bolas.get(i);
    b.passo = fft.getBand(b.banda);
    b.mover();
    b.colisao();
    b.desenhar(); 
  }

}

void mouseReleased(){
  Bola bola = new Bola();
  bola.posicaoX = mouseX;
  bola.posicaoY = mouseY;
  bolas.add(bola);
}

void stop(){
  input.close();
  minim.stop();
  super.stop(); 
}