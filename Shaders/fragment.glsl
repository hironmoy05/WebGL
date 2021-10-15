uniform float time;

varying float sine;
varying vec2 vUv;

void main () {
    // Now with sin function it is -1, 1
    // float sinePulse = sin(vUv.x*50.);

    // Make it to 0, 1
    // float sinePulse = (1.+sin(vUv.x*50.)) * .5;

    // now we move this color with time
    float sinePulse = (1.+sin(vUv.x*50. - time)) * .5;

    gl_FragColor = vec4(sinePulse, 0., 0., 1.);
}