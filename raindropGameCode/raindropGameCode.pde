PVector mouth;   //declare a P
Raindrop r;      //declare a new Raindrop called r
Bucket b;
float game; 

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(800, 600);
  mouth = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y positions
  b = new Bucket(mouseX, height-375);
  game = 0;
}

void draw() {
  background(0);
  if(game == 0){
    textSize(75);
    textAlign(CENTER, CENTER);
    fill(205,92,92);
    text("Hangry Emily", width/2, height/4);
    fill(188,143,143);
    textSize(50);
    String s = "Emily is hangry. Feed her sushi to make her happy!";
    text(s, width/7, height/6, 3*width/4, 3*height/4);
  }
  if(game == 1){
    mouth.set(mouseX, height-130);             //set value of mouse as mouseX,mouseY
    b.display();
    r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r.display();      //display the raindrop
    if (r.isInContactWith(mouth)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r.reset();                         //if it is, reset the raindrop
    }
    if (r.loc.y > height + 45) {     //check to see if the raindrop goes below the bottom of the screen
      r.reset();                           //if it does, reset the raindrop
    }
  }
}

void mousePressed(){
  if(game == 0){
    game = 1;
  }
}