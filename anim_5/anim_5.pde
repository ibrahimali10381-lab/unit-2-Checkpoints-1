
int x;
int y;

void setup(){
 size(600,600); 
 x = 0;
}

void draw(){
  background(255);
  ellipse(x,300,y,y);
  x += 5;
  y += 1;
  if (x>=700){
   x=-100;
   y=0;
  }
}
