flow f;
int nodeCount = 20;
ArrayList<node> nodes = new ArrayList<node>();

int scl = 20;
int rows;
int cols;

public void setup() {
  size(1200, 600);
  rows = height/scl;
  cols = width/scl;
  f = new flow(rows, cols, scl);
  generateNodes();
}

public void draw() {
  background(51);
  f.show();
  nodeStuff();
}

public void mousePressed() {
  reset();
}

public void reset() {
  for (node n : nodes) {
    n.pos = new PVector(random(width),random(height));
  }
}

public void generateNodes() {
  for (int i = 0; i < nodeCount; i++) {
    nodes.add(new node());
  }
}

public void nodeStuff() {
  for (node n : nodes) {
    n.update();
  }
  for (node n : nodes) {
    n.show();
  }
}
