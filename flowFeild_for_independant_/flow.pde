class flow {
  int rows;
  int cols;
  int scl;
  
  float xoff;
  float yoff;
  
  PVector[][] vels;

  flow(int rows, int cols, int scl) {
    this.rows = rows;
    this.cols = cols;
    this.scl = scl;
    vels = generate();
  }

  public void show() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        push();
        translate(i*scl + scl/2, j*scl + scl/2);
        stroke(255);
        rotate(f.vels[i][j].heading());
        line(0,0,scl/2,0);
        pop();
      }
    }
  }

  public PVector[][] generate() {
    PVector[][] vel = new PVector[cols][rows];
     xoff = 0;
    for (int i = 0; i < cols; i++) {
       yoff = 0;
      xoff+=.03;
      for (int j = 0; j < rows; j++) {
        float angle = map(noise(xoff, yoff), 0, 1, 0, 2*PI);
        vel[i][j] = PVector.fromAngle(angle);
        yoff+=.03;
      }
    }
    return vel;
  }
  
}
