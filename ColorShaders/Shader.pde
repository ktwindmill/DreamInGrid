class GShader
{
  String path;
  PShader shader;
  ArrayList<Param> parameters;
  float cumulativeTimeOffset = 0;
  
  GShader(String path) {
    this.path = path;
    shader = loadShader(path);
    parameters = new ArrayList<Param>();
  }
  
  void addParameter(String name, float minVal, float maxVal) {
    Param param = new Param(name, minVal, maxVal);
    parameters.add(param);
  }
  
  void addParameter(String name, float minVal1, float maxVal1, float minVal2, float maxVal2) {
    Param param = new Param(name, minVal1, maxVal1, minVal2, maxVal2);
    parameters.add(param);
  }
  
  void addParameter(String name, float minVal1, float maxVal1, float minVal2, float maxVal2, float minVal3, float maxVal3) {
    Param param = new Param(name, minVal1, maxVal1, minVal2, maxVal2, minVal3, maxVal3);
    parameters.add(param);
  }
  
  void setShaderParameters(float timeOffset) {
    cumulativeTimeOffset += timeOffset;
    shader.set("time", (float) (millis()+cumulativeTimeOffset)/1000.0);
    shader.set("resolution", float(pg.width), float(pg.height));
    for (Param p : parameters) {
      if (p.is2d) {
        shader.set(p.name, p.value2.x, p.value2.y);
      } 
      else if(p.is3d){
        shader.set(p.name, p.value3.x, p.value3.y, p.value3.z);
      }
      else {
        shader.set(p.name, p.value);
      }
    }
  }
  
  void setShaderParametersOnHat() {
    for (Param p : parameters) {
      if (p.is2d) {
        PVector rand = new PVector(random(p.minValue2.x,p.maxValue2.x),random(p.minValue2.y,p.maxValue2.y));
        p.value2 = new PVector(rand.x, rand.y);
      } 
      else if(p.is3d){
        PVector rand = new PVector(random(p.minValue3.x,p.maxValue3.x),random(p.minValue3.y,p.maxValue3.y),random(p.minValue3.z,p.maxValue3.z));
        p.value3 = new PVector(rand.x, rand.y,rand.z);
      }
      else {
        p.value = random(p.minValue,p.maxValue);
      }
    }
  }
  
  void addGui() {
    if(SHOW_GUI){
      PVector guiPosition = new PVector(15, 50);
      for (Param p : parameters) {
        if (p.is2d) {
          cp5.addSlider2D(p.name)
             .setArrayValue(new float[]{p.value2.x, p.value2.y})
             .setMinX(p.minValue2.x).setMinY(p.minValue2.y)
             .setMaxX(p.maxValue2.x).setMaxY(p.maxValue2.y)
             .setPosition(guiPosition.x, guiPosition.y)
             .setSize(300, 300);           
          guiPosition.y += 330;
        }
        else {
          cp5.addSlider(p.name)
             .setValue(p.value)
             .setRange(p.minValue, p.maxValue)
             .setPosition(guiPosition.x, guiPosition.y)
             .setSize(300, 25);
          guiPosition.y += 35;
        } 
      }
    }
  }
  
  void removeGui() {
    for (Param p : parameters) {
      cp5.remove(p.name);
    }
  }
}

float wrap(float val, float min, float max){
  
  if(val < min){
    val = max;
  } else if (val > max){
    val = min;
  }
  
  return val;
}
