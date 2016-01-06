PVector mouth;   //declaring variables
Bucket b;
float game; 
int timer;
ArrayList<Raindrop> particles = new ArrayList<Raindrop>();
int interval;
int score;
int loss;
PImage happy;
PImage sad;

void setup() {
  size(800, 600);
  mouth = new PVector();                //declaring values
  b = new Bucket(mouseX, height-375);
  happy = loadImage("emilyhappy.png");
  sad = loadImage("emilysad.png");
  
  for (int i = 0; i < 2; i++) {                                    //add sushi
    particles.add(new Raindrop(random(width), -random(height)));
  }
}

void draw() {
  background(0);

  if (game == 0) {        //start screen
    textSize(75);
    textAlign(CENTER, CENTER);
    fill(205, 92, 92);
    text("Hangry Emily", width/2, height/4);
    fill(188, 143, 143);
    textSize(50);
    String s = "Feed Emily sushi to make her happy! (Click to begin)";
    text(s, width/7, height/6, 3*width/4, 3*height/4);
  }

  if (game == 1) {
    mouth.set(mouseX, height-130);             //setting mouth position 
    b.display();
    text("Yum level = " + score, width/4, 100);    //Score board

    for (int i = particles.size()-1; i >= 0; i--) {  //using array of sushi particles
      Raindrop r = particles.get(i);    //get the Particle in location i and store it in Particle p

      r.fall();         //make the sushi fall. It should accelerate as if pulled towards the ground by earth's gravity
      r.display();      //display the sushi

      if (r.isInContactWith(mouth)) {      //check to see if the sushi is in contact with the point represented by the PVector called mouse
        r.reset();         //if it is, reset the sushi
        timer = frameCount;
        score+=1;
      }

      if (r.loc.y > height + 45) {     //check to see if the raindrop goes below the bottom of the screen
        r.reset();              //if it does, reset the raindrop
        loss += 1;
      }
    }
  }

    if (score>=20) {    //win the game when you get 30 points
      game=2;
      score = 0;
      loss=0;
    }

    if (loss>=20) {      //lose the game when you drop 20 sushi
      game =3;
      score = 0;
      loss=0;
    }

    if (game ==2) {
      win();
    }

    if (game == 3) {
      failure();
    }
    
    if (frameCount < timer +20){  //"Yum!" appears for 20 frames (and also at the beginning as a joke)
      reaction();
  }
}


void mousePressed() {
  if (game == 0|| game == 2 || game==3) {          //click to restart/start
    game = 1;
  }
}

void win(){
      image(happy, 200, 200);      //winning page
      fill(205, 92, 92);
      textSize(40);
      text("Yay! Click to start over", 400, 150);
}

void failure() {                  //losing page
  image(sad, 200, 30);
    fill(188, 143, 143);
  textSize(40);
  text("You failed Emily. Click to try again", 400, 560);
}

void reaction() {    //"Yum!"
  fill(255, 160, 122);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("YUM", width/2, 200);
}