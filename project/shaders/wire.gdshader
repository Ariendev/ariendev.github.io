shader_type canvas_item;
uniform sampler2D noise_tex : hint_default_black, repeat_enable;

const float RES = 80.0;
const float SCALE = 0.25;
const float SPEED = 0.1;
const float DISP = 0.05;
const float FPS = 12.0;
void fragment() {
	vec2 pixelated = floor(UV * RES) / RES;
	
	vec2 noise_uv = (pixelated * SCALE) + ((floor(TIME * FPS) / FPS) * SPEED);
	float noise = texture(noise_tex, noise_uv).r;
	noise = noise * 2.0 - 1.0;
	
	vec2 final_uv = pixelated + noise * DISP;
	vec4 final = texture(TEXTURE, final_uv);
	COLOR = final;
}