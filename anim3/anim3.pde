
int x;

void setup(){
 size(600,600); 
 x = 00;
}

void draw(){
  background(255);
  ellipse(300,300,x,x);
  x += 1;
  if (x>=830){
   x=00;
  }
}
