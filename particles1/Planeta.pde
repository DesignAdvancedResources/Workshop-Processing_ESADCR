class Planeta {

  float posicaoX, posicaoY;
  float raio;
  float fundo;
  float dirX, dirY;

  Planeta() {

    posicaoX = width/2;
    posicaoY = height/2;
    dirX = random(2);
    dirY = random(2);
  }



  void direcciona(){
   
    if ( posicaoY <=0 || posicaoY >= height){
    dirY = dirY*-random(1);
    }
    
    
    else if ( posicaoX >= width || posicaoX <= 0){
    dirX = dirX*-random(1);
    }
  
  
  } 
  void mover() {
    
    posicaoX=posicaoX+dirX;
    posicaoY=posicaoY-dirY;

    
    //
    

    
   
    
  }

  void dimensionar() {
    raio = 3-random(2);
  }
  
  
  
  void desenhar() {
    ellipse(posicaoX, posicaoY, raio, raio);
  }
}