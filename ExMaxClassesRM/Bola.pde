class Bola{

  //variáveis usadas para definir a posição
  float posicaoX, posicaoY;

  //variáveis onde guardamos a velocidade
  float velocidadeX, velocidadeY;

  //variáveis onde guardamos os valores de aceleraçao
  float aceleracaoX;
  float aceleracaoY;

  //definimos um valor para o raio
  float raio;

  //resistencia
  float resistencia;

  //definimos 2 variáveris onde vamos sempre guardar a posição anterior da nossa bola
  //vamos usar esta informação para desenhar uma linha a mostrar o caminho que o nosso ponto faz
  float anteriorX;
  float anteriorY;
  
  int banda;
  
  float passo;

  Bola(){
    //definimos um valor inicial para a posição
    //no eixo do X
    posicaoX = width / 2;
    //e no eixo do Y
    posicaoY = height / 2;

    //iniciamos as variáveis da posicaçao anterior com os mesmos valores de origem
    anteriorX = posicaoX;
    anteriorY = posicaoY;

    //definimos o valor de resistencia
    //este valor convem ser entre 0 e 1
    //em que zero = resistencia total (o objecto não mexe)
    //e 1 = nenhuma resistencia
    resistencia = 0.99;

    //raio
    raio = 20;
    
    
    banda = (int)random(0, 256);
  }

  void mover(){

    //dividimos as coordenadas que usamos para obter o valor de noise
    //para obtermos valores mais fluidos
    float resolucao = 500;

    //um contador para, progressivamente, alterarmos os nossos valores de noise
    float contador = frameCount / 100;

    //obtemos os valores de noise através das coordenadas desta bola
   // float noiseX = noise(posicaoX / resolucao, posicaoY / resolucao, contador);
   // float noiseY = noise(posicaoX / resolucao + 10000, posicaoY / resolucao + 10000, contador + 10000);

  float noiseVal = noise(posicaoX / resolucao, posicaoY / resolucao, contador);
  float angulo = map(noiseVal, 0, 1, -TWO_PI, TWO_PI);
    //mapeamos os valores de noise (que originalmente estão contidos entre 0 e 1) para estarem contidos entre o nosso valor de passo
    //applicamos estes valor à aceleraçao
 //   aceleracaoX = map(noiseX, 0, 1, -passo, passo);
   // aceleracaoY = map(noiseY, 0, 1, -passo, passo);

aceleracaoX = cos(angulo) * passo;
aceleracaoY = sin(angulo) * passo;

    //para o nosso ponto não se afastar muito,
    //aplicamos uma outra força elástica ao nosso ponto
    //que o atrai para o centro 
    float centroX = width / 2;
    float centroY = height / 2;
    aceleracaoX += (centroX - posicaoX) / 100;
    aceleracaoY += (centroY - posicaoY) / 100;

    //somamos a aceleração à velocidade
    velocidadeX += aceleracaoX;
    velocidadeY += aceleracaoY;

    velocidadeX *= resistencia;
    velocidadeY *= resistencia;

    //somamos a nossa velocidade à posição
    posicaoX += velocidadeX;
    posicaoY += velocidadeY;
  }

  void colisao(){
    //testamos para ver se a nossa bola colide com os lados da janela
    //mas temos em conta o raio da bola
    //sempre que há uma colisão, colocamos a bola no ponto de colisão
    //e invertemos a velocidade nesse eixo
    if(posicaoX < raio){
      posicaoX = raio;
      velocidadeX *= -1; 
    }
    if(posicaoX > width - raio){
      posicaoX = width - raio;
      velocidadeX *= -1; 
    }
    if(posicaoY < raio){
      posicaoY = raio;
      velocidadeY *= -1; 
    }
    if(posicaoY > height - raio){
      posicaoY = height - raio;
      velocidadeY *= -1; 
    }
  }


  void desenhar(){
    //desenhamos um circulo baseado na posição e no raio
    line(posicaoX, posicaoY, anteriorX, anteriorY);
    anteriorX = posicaoX;
    anteriorY = posicaoY;
  } 
}