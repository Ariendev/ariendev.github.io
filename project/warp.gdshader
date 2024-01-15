shader_type canvas_item;
uniform sampler2D noiseTex : hint_default_black, repeat_enable;
uniform float warpAmount : hint_range(0.0, 1.0, 0.01) = 0.01;
uniform vec2 scrollDirection = vec2(1.0, 1.0);
uniform vec2 res = vec2(189.0, 66.0);
void fragment() {
	// Called for every pixel the material is visible on.
	vec2 pixel_uv = (floor(UV * res) / res);
	vec2 noise_uv = pixel_uv + (TIME * scrollDirection);
	float noise = textureLod(noiseTex, noise_uv, 0.0).r * 2.0 - 1.0;
	vec2 texture_uv = pixel_uv + (noise * warpAmount);
	COLOR = textureLod(TEXTURE, texture_uv, 0.0);
	//COLOR = vec4(noise, noise, noise, 1.0);
}
