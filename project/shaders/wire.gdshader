shader_type canvas_item;

void fragment() {
	vec2 res = vec2(75.0, 66.0);
	float fps = floor(TIME * 12.0) / 12.0;
	vec2 pixelated = floor(UV * res) / res;
	float sway_mask = clamp(pow(pixelated.y, 4.0), 0.0, 1.0);
	vec2 uv = (pixelated - vec2(cos(fps) * sway_mask * 0.1, 0.0));
	COLOR = texture(TEXTURE, uv);
	//COLOR.rgb = vec3(clamp(pow(pixelated.y, 3.0), 0.0, 1.0));
}