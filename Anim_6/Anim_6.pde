
int x;
int y;

void setup(){
 size(600,600); 
 x = 600;
}

void draw(){
  background(255);
  ellipse(450,x,200,200);
  ellipse(150,y,200,200);
  x -= 1;
  y += 1;
  if (x<=-200){
   x=700;
   y=-100;
  }
}
