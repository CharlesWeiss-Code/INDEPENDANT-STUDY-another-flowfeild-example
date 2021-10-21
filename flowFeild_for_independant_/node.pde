class node {
  PVector pos;
  PVector vel;
  PVector acc;

  node() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0, 0);
    acc = new PVector(0, 0, 0);
  }

  public void update() {
    if (pos.x > width -1) {
      pos.x = 1;
    } else if (pos.x < 1) {
      pos.x = width-1;
    }
    if (pos.y > height-1) {
      pos.y = 1;
    } else if (pos.y < 1) {
      pos.y = height-1;
    }
    //vel.add(getAcc());//
    pos.add(getAcc());
    acc.setMag(0);
  }

  public PVector getAcc() {
    return f.vels[int(pos.x/f.scl)][int(pos.y/f.scl)].setMag(2);
  }

  public void show() {
    push();
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, 10, 10);
    pop();
  }
} 
