uniform float time;
uniform sampler2D uTexture;

varying float sine;
varying vec2 vUv;
varying vec3 vNormal;
varying float sinePulse;

void main () {
    // Now with sin function it is -1, 1
    // float sinePulse = sin(vUv.x*50.);

    // Make it to 0, 1
    // float sinePulse = (1.+sin(vUv.x*50.)) * .5;

    // now we move this color with time
    // float sinePulse = (1.+sin(vUv.x*50. - time)) * .5;

    // gl_FragColor = vec4(sinePulse, 0., 0., 1.);

    // vec4 image = texture(uTexture, vUv);
    // gl_FragColor = image;

    // vec4 image = texture(uTexture, vUv + 0.01*sin(vUv*20. + time));
    // gl_FragColor = image;

    // with vNormal we create a un-joinable object
    gl_FragColor = vec4(sinePulse, 0., 0., 1.0);
}