import * as THREE from 'three';
import { OrbitControls } from 'THREE/examples/jsm/controls/OrbitControls';

export default class Sketch {
	constructor(options) {
		this.container = options.domElement;
		this.width = this.container.offsetWidth;
		this.height = this.container.offsetHeight;

		this.camera = new THREE.PerspectiveCamera(
			70,
			this.width / this.height,
			0.01,
			10
		);

		this.camera.position.z = 1;

		this.scene = new THREE.Scene();

		this.renderer = new THREE.WebGLRenderer();
		this.renderer.setSize(this.width, this.height);
		this.container.appendChild(this.renderer.domElement);
		this.controls = new OrbitControls(this.camera, this.renderer.domElement);

		this.time = 0;
		this.resize();
		this.addObjects();
		this.render();
		this.setupResize();
	}

	resize = () => {
		this.width = this.container.offsetWidth;
		this.height = this.container.offsetHeight;
		this.renderer.setSize(this.width, this.height);
		this.camera.aspect = this.width / this.height;
		this.camera.updateProjectionMatrix();
	};

	setupResize() {
		window.addEventListener('resize', this.resize.bind(this));
	}

	addObjects = () => {
		this.geometry = new THREE.PlaneBufferGeometry(0.5, 0.5);
		this.material = new THREE.MeshBasicMaterial({
			color: 0xffaa00,
		});

		this.renderer.setPixelRatio(window.devicePixelRatio);
		// this.renderer.setPixelRatio(2);

		this.mesh = new THREE.Mesh(this.geometry, this.material);
		this.scene.add(this.mesh);
	};

	render = () => {
		this.time += 0.05;

		this.mesh.rotation.x = this.time / 2000;
		this.mesh.rotation.y = this.time / 2000;
		this.mesh.rotation.z = this.time / 2000;

		// console.log(this.time);
		this.renderer.render(this.scene, this.camera);
		requestAnimationFrame(this.render);
	};
}

new Sketch({
	domElement: document.getElementById('container'),
});
