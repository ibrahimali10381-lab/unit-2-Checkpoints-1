color blue = #0502D8;

int x;
int y;
int t;
float b;
int inkDist;

void setup() {
  size(800, 800, P2D);
}

void draw() {
  background(blue);

  if (x <= 50) {
    x++;
  } else {
    if (t == 0) {
      b = atan2(mouseY - 400, mouseX - 400);
    }
    ink(inkDist, b);
    inkDist += 8;
    t++;
    y++;

    if (y >= 100) {
      x = 0;
      t = 0;
      y = 0;
      inkDist = 0;
    }
  }

  jellyfish(400, 400);
}

void eye(int p, int q,int xsize, int ysize) {
  pushMatrix();
  strokeWeight(1);
  translate(p, q);
  fill(255);
  ellipse(0, 0, xsize, ysize);
  popMatrix();
  pushMatrix();
  translate(p,q);
  float ang = atan2(-mouseY + y, -mouseX + x);
  translate(ang + TWO_PI,ang + TWO_PI);
  fill(0);
  ellipse(0, 0, xsize/2, ysize/2);
  popMatrix();
}
void jellyfish(int x, int y) {
  pushMatrix();
  translate(x, y);

  float ang = atan2(mouseY - y, mouseX - x);
  rotate(ang + HALF_PI);

  fill(255);
  noStroke();
  arc(0, 50, 300, 100, PI, TWO_PI);

  strokeWeight(10);
  stroke(0);
  arc(0, 50, 300, 200, 0, PI);
  strokeWeight(15);

  line(-100, -200, -100, 10);
  line(100, -200, 100, 10);
  ellipse(100, 50, 10, 10);
  ellipse(-100, 50, 10, 10);

  eye(100, -100,50,50);
  eye(100, -30,50,50);
  eye(100, -170,50,50);
  eye(-100, -100,50,50);
  eye(-100, -30,50,50);
  eye(-100, -170,50,50);


  popMatrix();
}

void ink(int dist, float angle) {
  pushMatrix();
  translate(400, 400);
  rotate(angle + HALF_PI);

  noStroke();
  fill(0);

  eye(0, -dist, 100, 100);
  eye(-12, -dist, 100, 100);
  eye(0, -dist + 34, 100, 100);
  eye(41, -dist + 61, 100, 100);
  eye(76, -dist - 22, 100, 100);
  eye(-13, -dist + 123, 100, 100);

  popMatrix();
}
