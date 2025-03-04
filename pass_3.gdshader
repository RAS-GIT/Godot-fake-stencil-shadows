shader_type spatial;

render_mode unshaded, cull_back, blend_add, depth_test_disabled, world_vertex_coords;

uniform vec3 light_position;
uniform float light_radius = 50.0;

void vertex() {
	vec3 rd = VERTEX - light_position;
	vec3 rn = normalize(rd);
	if (dot(NORMAL, rn) > 0.0) {
		VERTEX += rn*clamp(light_radius-length(rd), 0.0, light_radius);
	}
	else {
		VERTEX -= NORMAL*0.01;
	}
}

void fragment() {
	ALPHA = 0.5;
}