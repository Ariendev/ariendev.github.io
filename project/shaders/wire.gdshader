shader_type canvas_item;
uniform sampler2D noise_tex : hint_default_black, repeat_enable;

void fragment() {
	float noise = texture(noise_tex, UV).r;
	COLOR = vec4(noise);
}