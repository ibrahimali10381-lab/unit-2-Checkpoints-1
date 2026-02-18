// Ibrahim Ali
// Animation tutorial

int x;

void setup(){
  size(600,600);
  x = 1;
}

void draw(){
  background(255);
  strokeWeight(5);
  ellipse(300,x,200,200);
  x += 1;

}
