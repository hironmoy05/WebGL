uniform float time;
uniform sampler2D uTexture;
uniform vec2 uTextureSize;

varying float sine;
varying vec2 vUv;
varying vec3 vNormal;
varying float sinePulse;
varying vec2 vSize;

vec2 getUV (vec2 uv, vec2 textureSize, vec2 quadSize) {
    vec2 tempUV = uv - vec2(0.5);

    float quadAspect = quadSize.x / quadSize.y;
    float textureAspect = textureSize.x / textureSize.y;

    if (quadAspect < textureAspect) {
        tempUV *= vec2(quadAspect/textureAspect, 1.);
    } else {
        tempUV *= vec2(1., textureAspect/quadAspect);
    }

    tempUV += vec2(0.5);
    return tempUV;
}

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
    // gl_FragColor = vec4(sinePulse, 0., 0., 1.0);

    // From this we preserve aspect ratio of our image 
    // vec2 tempUV = vUv - vec2(0.5) + vec2(0.5);
    // vec4 image = texture(uTexture, tempUV);

    vec2 correctUV = getUV(vUv, uTextureSize, vSize);

    vec4 image = texture(uTexture, correctUV);

    gl_FragColor = image;
}