class Bucket {
  PImage bucket;
  PVector pos;
  
  Bucket(float x, float y){
    bucket = loadImage("bucket.png");
    pos = new PVector(mouseX, height-375);
  }
  
  void display(){
    image(bucket, mouseX-420 ,pos.y);
  }
}