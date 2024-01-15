shader_type canvas_item;
uniform sampler2D noise_tex : hint_default_black, repeat_enable;

void fragment() {
	vec2 noise_uv = (UV * 0.5) + (TIME * 0.075);
	float noise = texture(noise_tex, noise_uv).r;
	noise = noise * 2.0 - 1.0;
	vec4 final = texture(TEXTURE, UV + noise * 0.05);
	COLOR = final;
}