//Custom vector class that uses double instead of float.
//The simulation wasn't working properly due to rounding errors when using floats,
//and so i had to switch over to using doubles with this class.
//I pretty much just copied what i needed from the PVector source code, and adjusted some things
public class DVector {
  
  double x, y;
  
  public DVector(double position_x, double position_y) {
    x = position_x;
    y = position_y;
  }
  
  public DVector copy() {
    return new DVector(x, y);
  }
  
  public DVector add(DVector v) {
    x += v.x;
    y += v.y;
    return this;
  }
  
  public DVector sub(DVector v) {
    x -= v.x;
    y -= v.y;
    return this;
  }
  
  public DVector div(double n) {
    x /= n;
    y /= n;
    return this;
  }
  
  public DVector mult(double n) {
    x *= n;
    y *= n;
    return this;
  }
  
  public double mag() {
    return Math.sqrt(x*x + y*y);
  }
  
  public DVector normalize() {
    double m = mag();
    if (m != 0 && m != 1) {
      div(m);
    }
    return this;
  }
  
}
