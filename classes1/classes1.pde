
planeta mercurio;


void setup(){
size(800,600);
background(255);
mercurio = new planeta("mercurio", 30, 200, 50);

}



void draw(){

  mercurio.desenha();

}


class planeta{
  
  String Nome; 
    int raio;
    int posX;
    int posY;
  
  planeta(String N, int r, int pX, int pY){
    Nome = N; 
    raio = r;
    posX = pX;
    posY = pY;
  }
  
void desenha(){
  
stroke(0);
fill(255-random(100));
ellipse( posX, posY, raio, raio);

}

void mostra(){


}




}