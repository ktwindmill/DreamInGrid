class Param 
{
  String name;
  float value;
  PVector value2;
  PVector value3;
  float minValue, maxValue;
  PVector minValue2, maxValue2;
  PVector minValue3, maxValue3;
  boolean is2d;
  boolean is3d;
  
  Param(String name, float minValue, float maxValue) {
    this.name = name;
    this.minValue = minValue;
    this.maxValue = maxValue;
    this.value = 0.5 * (minValue + maxValue);
    is2d = false;    
    is3d = false; 
  }
  
  Param(String name, float minValue1, float maxValue1, float minValue2, float maxValue2) {
    this.name = name;
    this.minValue2 = new PVector(minValue1, minValue2);
    this.maxValue2 = new PVector(maxValue1, maxValue2);
    this.value2 = new PVector(0.5 * (this.minValue2.x + this.maxValue2.x), 
                              0.5 * (this.minValue2.y + this.maxValue2.y) );
    is2d = true;
    is3d = false; 
  }
  
  Param(String name, float minValue1, float maxValue1, float minValue2, float maxValue2, float minValue3, float maxValue3) {
    this.name = name;
    this.minValue3 = new PVector(minValue1, minValue2, minValue3);
    this.maxValue3 = new PVector(maxValue1, maxValue2, maxValue3);
    this.value3 = new PVector(0.5 * (this.minValue3.x + this.maxValue3.x), 
                              0.5 * (this.minValue3.y + this.maxValue3.y),
                              0.5 * (this.minValue3.z + this.maxValue3.z));
    is2d = false;
    is3d = true; 
  }
  
  void set(float value) {
    this.value = value;
  }
  
  void set(float[] value) {
    this.value2.set(value[0], value[1]);
  }
  
  void set3D(float[] value) {
     this.value3.set(value[0], value[1], value[2]); 
  }

}
