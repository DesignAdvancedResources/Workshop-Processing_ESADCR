
planeta planet;


void setup(){
size(800,600);
background(255);
planet = new planeta();

}



void draw(){
  background(255);
  planet.mover();
  planet.desenhar();

}


class planeta{

  float posicaoX;
  float posicaoY;

  float velocidadeX;
  float velocidadeY;


  planeta(){
    //definimos um valor inicial para a posição
    //no eixo do X
    posicaoX = random(width);
    //e no eixo do Y
    posicaoX = random(height);

    //definimos a quantidade de deslocamento em cada frame
    //delocamento em X
    velocidadeX = random(5);
    //deslocamento em Y
    velocidadeY = random(5);
  }

  void mover(){
    //somamos a nossa velocidade à posição
    posicaoX += velocidadeX;
    posicaoY += velocidadeY;
  }

  void desenhar(){
    //desenhamos um circulo baseado na posição
    ellipse(posicaoX, posicaoY, 20, 20);
  }

}