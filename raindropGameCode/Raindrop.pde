class Raindrop {
  //declaring all info contained within Raindrop class
  PVector loc, vel, acc;
  int diam;

  Raindrop(float x, float y) {
    diam = 50;
    loc = new PVector(random(diam, width-diam), 0);
    vel = new PVector (0, 5);
    acc = new PVector(0, 2);
  }

  void display() {
    fill(0, 200, 255, 200);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {
    loc.add(vel);
    vel.add(acc);
    vel.limit(15);
  }

  boolean isInContactWith(PVector mouse) {
    if (loc.dist(mouse) <= diam/2) {
      return true;
    } else return false;
  }
  void reset() {
    loc = new PVector(random(diam, width-diam), 0);
    vel = new PVector (0, 5);
    ellipse(loc.x, loc.y, diam, diam);
  }
}