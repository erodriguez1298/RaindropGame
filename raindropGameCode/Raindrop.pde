class Raindrop {
  //declaring all info contained within Raindrop class
  PVector loc, vel, acc;
  //int diam;
  PImage sushi;

  Raindrop(float x, float y) {
    //diam = 50;
    loc = new PVector(random(90, width-90), 0);
    vel = new PVector (0, 5);
    acc = new PVector(0, 2);
    sushi = loadImage("sushi.png");
    sushi.resize(90, 90);
  }

  void display() {
    fill(0, 200, 255, 200);
    noStroke();
    //ellipse(loc.x, loc.y, diam, diam);
    image(sushi, loc.x, loc.y);
  }

  void fall() {
    loc.add(vel);
    vel.add(acc);
    vel.limit(15);
  }

  boolean isInContactWith(PVector mouth) {
    if (loc.dist(mouth) <= 60) {
      println("caught it in frame " + frameCount);
      return true;
    } else { 
      return false;
    }
  }
  void reset() {
    loc = new PVector(random(90, width-90), 0);
    vel = new PVector (0, 5);
    //ellipse(loc.x, loc.y, diam, diam);
  }
}