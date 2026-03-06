float movex;
float x = -20;
float randmove = 1.0;
int t = 0;
int time = 0;

int carmovement = 800;
int car2 = 0;
boolean started = false;
int randcar = 1;

float Cam1;
float Cam2;

float r1 = random(0, 255);
float g1 = random(0, 255);
float b1 = random(0, 255);

int z = 0;
boolean s = false;


void setup() {
  size(900, 900);
}




void draw() {
  wall();
  road();

  if (started == false) {
    r1 = 80;
    g1 = 78;
    b1 = 75;
    randcar = int(random(6));
  } 
  else if (randcar == 0) {

    randcar = 0;
  }
  
  else{
   randcar = 1; 
  }

  car(800, carmovement, r1, g1, b1, randcar);



  movex = random(2);


  Cam1 = camMove(x, randmove, movex);
  camera(50, 300, Cam1);

  Cam2 = camMove(x, randmove, movex);
  camera(250, 300, Cam2);


  x = camMove(x, randmove, movex);
  camera(450, 300, x);


  x = camMove(x, randmove, movex);
  camera(650, 300, x);

  x = camMove(x, randmove, movex);
  camera(850, 300, x);


  carmovement -= 15;

  started = true;

  if (carmovement <-300) {
    carmovement = 950;
    started = false;
  }
  
  wantedcar(100,350);
  eyes(450,450,z);
  
  if (time > 3600){
   s = true; 
  }

  
  else{
    s = false;
    z = 0;
    time +=1;
  }
  
  if (s == true){
   z+=1; 
  }
  
}




void road() {
  pushMatrix();
  translate(0, 700);
  fill(59, 57, 57);
  rect(0, 0, 900, 200);

  fill(255);
  rect(-10, 85, 100, 30);
  rect(290, 85, 100, 30);
  rect(590, 85, 100, 30);
  rect(890, 85, 100, 30);
  popMatrix();
}








void wall() {
  pushMatrix();
  background(0);

  fill(134, 135, 135);
  rect(0, 150, 900, 550);

  fill(183, 181, 181);
  rect(0, 550, 900, 200);
  popMatrix();
}







void camera(int Camx, int Camy, float x) {
  pushMatrix();
  translate(Camx, Camy);

  float t = random(10000);

  if (t<100) {
    randmove = random(-1, 1);
    t = 0;
  } else {
    t = t +1;
  }


  fill(90);
  rect(x, -20, 40, 40);
  quad(x, -20, 15, -40, 45, -40, x+40, -20);
  quad(x+40, -20, x+40, 20, 45, 0, 45, -40);
  quad(x, -20, x, 20, 15, 0, 15, -40);

  fill(0);
  ellipse(x+20, 0, 20, 20);
  popMatrix();
}







float camMove(float x, float rand, float speed) {

  float save = x;
  speed = random(2);


  if (rand < 0) {
    x = x+ speed/2;
  } else {
    x = x- speed/2;
  }


  if (x > 30) {
    x = save;
    if (second()%5 == 0) {
      rand = 1;
      return x;
    }
    return x;
  } else if (x < -20) {
    x = save;
    if (second()%5 == 0) {
      rand = -1;
      return x;
    }
    return x;
  }
  return x;
}






void car(int y, int carmove, float r1, float g1, float b1, int rands) {
  pushMatrix();
  translate(carmove, y);

  float r = 255;
  float b = 0;
  float g = 0;


  if (rands == 0) {
    fill(r, g, b);
    ellipse(200, 0, 200, 150);
    rect(0, 0, 300, 100);

    fill(116, 173, 209);
    ellipse(200, 0, 150, 100);

    fill(r, g, b);
    rect(0, 0, 300, 100);

    fill(0);
    ellipse(30, 100, 75, 75);
    ellipse(270, 100, 75, 75);
  } else {


    fill(r1, g1, b1);
    ellipse(200, 0, 200, 150);
    rect(0, 0, 300, 100);

    fill(116, 173, 209);
    ellipse(200, 0, 150, 100);

    fill(r1, g1, b1);
    rect(0, 0, 300, 100);

    fill(0);
    ellipse(30, 100, 75, 75);
    ellipse(270, 100, 75, 75);
  }


  popMatrix();
}



void wantedcar (int x, int y){
 pushMatrix();
 translate(x,y);
 
 fill(250,203,126);
 rect(0,0,100,150);
 
 fill(0);
 textSize(20);
 text("WANTED",10,20);
 
 scale(0.28,0.28);
 car(300,20,r1,g1,b1,0);
 
 popMatrix();
  
}




void eyes (int x, int y, int z){
  pushMatrix();
  translate(x,y);
  fill(255);
  ellipse(0,0,100,z+2);
  ellipse(100,0,100,z+2);
  
  popMatrix();
}
