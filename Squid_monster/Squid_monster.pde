color blue = #0502D8;

int x;
int y;
int t;

float b;          // stored firing angle
float inkDist;    // distance ink travels

void setup() {
  size(800, 800, P2D);
}

void draw() {
  background(blue);

  // delay before shooting ink
  if (x <= 50) {
    x++;
  } else {
    // store angle once when ink starts
    if (t == 0) {
      b = atan2(mouseY - 400, mouseX - 400);
    }

    ink(inkDist, b);
    inkDist += 8;

    t++;
    y++;

    // reset after ink finishes
    if (y >= 100) {
      x = 0;
      t = 0;
      y = 0;
      inkDist = 0;
    }
  }

  jellyfish(400, 400);
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

  line(-100, -200, -100, 10);
  line(100, -200, 100, 10);

  ellipse(100, 50, 10, 10);
  ellipse(-100, 50, 10, 10);

  popMatrix();
}

void ink(float dist, float angle) {
  pushMatrix();
  translate(400, 400);
  rotate(angle + HALF_PI);

  noStroke();
  fill(0);

  // shoot straight between the tentacles
  ellipse(0, -dist, 100, 100);
  ellipse(-12, -dist, 100, 100);
  ellipse(0, -dist + 34, 100, 100);
  ellipse(41, -dist + 61, 100, 100);
  ellipse(76, -dist - 22, 100, 100);
  ellipse(-13, -dist + 123, 100, 100);

  popMatrix();
}
