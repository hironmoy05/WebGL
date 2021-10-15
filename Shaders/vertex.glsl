uniform float time;

varying float sine;
varying vec2 vUv;

void main () {
    vUv = uv;
    vec3 newPosition = position;

    // newPosition.x *= 2.;
    // This shows us big waves
    // newPosition.z = sin(position.x*30.);

    // Me make this into small
    // newPosition.z = 0.1*sin(position.x*30. + time);

    // Do animation in all direction through 'length' 
    newPosition.z = 0.05*sin(length(position*30.) + time);

    // variable 'sine' for giving color in fragment.glsl
    sine = 20.*newPosition.z;

    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}