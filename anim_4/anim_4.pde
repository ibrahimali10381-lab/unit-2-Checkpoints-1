
int x;

void setup(){
 size(600,600); 
 x = 00;
}

void draw(){
  background(255);
  ellipse(x,x,200,200);
  x += 1;
  if (x>=600){
   x= -100;
  }
}
