class Planeta {

  float posicaoX, posicaoY;
  float raio;
  float fundo;
  float dirX, dirY;
  float passo = 1;
  boolean bate;
  float acel;
  float resistencia;
  float tensao;
  int count;
  float PrevposicaoX, PrevposicaoY;

  Planeta() {

    posicaoX = 0;
    posicaoY = 0;
    dirX = random(20);
    dirY = random(10);
    dirX = map(dirX, 0, 10, -TWO_PI, TWO_PI);
    dirY = map(dirY, 0, 10, -TWO_PI, TWO_PI);
    acel=1;
    bate = false;
    resistencia = 0.99;
    tensao =2;
    PrevposicaoX =width/2;
    PrevposicaoY =height/2;
  }



  void direcciona() {
    
    

    if (posicaoY < raio) {
      count++;
      bate =true;
      posicaoY = raio;
      dirY *= -1;
    }

    if (posicaoY > height) {
      bate =true;
      posicaoY = height - raio;
      dirY *= -1;
    }

    if (posicaoX < raio) {
      bate =true;
      posicaoX = raio;
      dirX *= -1;
    }

    if ( posicaoX > width) {
      bate =true;
      posicaoX = width - raio;
      dirX *= -1;
    }
    if (posicaoX < width && posicaoX > raio && posicaoY < height && posicaoY > raio) {
      
      bate =false;
    }
  } 
  void mover() {
    
    if (!bate){
    posicaoX=PrevposicaoX+passo*dirX*resistencia*acel;
    posicaoY=PrevposicaoY+passo*dirY*resistencia*acel;
    }
    
    if (bate){
    posicaoX=PrevposicaoX+passo*dirX*tensao*acel;
    posicaoY=PrevposicaoY+passo*dirY*tensao*acel;
    }

    //
  }
  void dimensionar(float som) {
    
    
    acel = map(som,0,10,0,1);
    
    raio = map(som,0,80,2,5)-random(3);
  }

  void desenhar() {
    stroke(raio);
    line(PrevposicaoX, PrevposicaoY,posicaoX, posicaoY);
    PrevposicaoX = posicaoX;
    PrevposicaoY = posicaoY;
  }
}