shader_type canvas_item;
uniform vec2 scrollDireciton = vec2(1.0, 0.0);
uniform vec2 textureRes = vec2(16.0, 32.0);
uniform float uvSnap : hint_range(0.0, 0.875, 0.125);
void fragment() {
	vec2 res = textureRes * mix(8.0, 0.0, uvSnap);
	vec2 pixelate = floor(UV * res) / res;
	vec2 scroll_uv = pixelate + (TIME * scrollDireciton);
	COLOR = textureLod(TEXTURE, scroll_uv, 0.0);
	
	}
