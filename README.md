## DreamInGrid 

This is a fork of [n1ckfg's (Nick Fox-Gieg) Processing Shader Examples](https://github.com/genekogan/Processing-Shader-Examples/), adapted into a VJing app using Minim's beat analysis and audio buffer and an extension of the original P5Control shader switching backend.
At present, it only modifies the `ColorShaders` folder. 

The app can run itself, using randomised values, or can be run manually as a VJ app, using the following hotkeys:

- Hotkey R: Toggles "Random" mode. The app will run itself while random mode is enabled.
- Hotkeys A/D: A/D decrement/increment the index of the currently playing shader, respectively. 
- Number keys 1-0: These manually set the index of the currently playing shader (there are 10 shaders at time of writing).
- Esc: when running an exporting executable in full screen mode, this will kill the app. 

The app will react to whatever audio is being input into Windows' default audio device for *recording*. You can use something like [VB Virtual Audio Cable](https://vb-audio.com/Cable/) to get more control over this when not using a hardware line-in. 

## Processing shader examples

This is a collection of GLSL shaders being run inside Processing. Some of them are generic ones (brightness/saturation/contrast filters, blur, edge detection, etc) and others are more experimental. A number of them are modifications of examples taken from [GLSL Heroku](glsl.heroku.com).

In the Processing sketches, some shader parameters are routed to the position of the mouse, so as you move the mouse around inside the canvas, various properties of the shader graphics will change.

They fall into two categories:

### Texture shaders

These are shaders which modify the pixels of a source image. In the example sketch, the source images are three image files and one movie.

Click the left and right buttons to scroll through the different shaders, and click up and down to change the source images.

### Color shaders

These are shaders which create an image without any source. Click the left and right buttons to scroll through the shaders.


### Shaders GUI

This is a combination of the color shaders and texture shaders with an added user interface to change parameters. Requires [ControlP5 library](http://www.sojamo.de/libraries/controlP5/).
