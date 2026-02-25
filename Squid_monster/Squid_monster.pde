color blue = #0502D8;

int x, y, t;
float b;
int inkDist;
int tentacleGrowth;

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
      tentacleGrowth += 20;
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

void eye(float px, float py, int xs, int ys) {
  pushMatrix();
  translate(px, py);
  fill(255);
  ellipse(0, 0, xs, ys);

  float ang = atan2(mouseY - (height/2 + py), mouseX - (width/2 + px));
  float r = xs * 0.2;
  fill(0);
  ellipse(cos(ang) * r, sin(ang) * r, xs/2, ys/2);
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

  stroke(0);
  strokeWeight(10);
  arc(0, 50, 300, 200, 0, PI);

  strokeWeight(8);
  for (int i = -100; i <= 100; i += 200) {
    line(i, -200 - tentacleGrowth, i, 10);
    eye(i, -200 - tentacleGrowth, 40, 40);
  }

  popMatrix();
}

void ink(int dist, float angle) {
  pushMatrix();
  translate(400, 400);
  rotate(angle + HALF_PI);

  noStroke();
  fill(0);

  eye(0, -dist, 80, 80);
  eye(-20, -dist + 30, 80, 80);
  eye(30, -dist - 20, 80, 80);

  popMatrix();
}
