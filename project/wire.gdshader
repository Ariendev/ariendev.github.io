shader_type canvas_item;
uniform sampler2D noise_tex : hint_default_black, filter_linear, repeat_enable;
uniform sampler2D noise_mask : hint_default_white, filter_linear, repeat_disable;
uniform float noise_scale = 0.25; 
uniform vec2 res = vec2(32.0, 32.0);
uniform vec2 dir = vec2(1.0, 0.0);
uniform vec2 dis = vec2(0.01, 0.01);
uniform float fps = 24.0;
void fragment() {
	vec2 uv = floor(UV * res) / res;
	float noise = texture(noise_tex, (uv * noise_scale) + ((floor(TIME * fps) / fps) * dir)).r * 2.0 - 1.0;
	noise *= texture(noise_mask, uv).r;
	COLOR = texture(TEXTURE, uv + (noise * dis));
}

