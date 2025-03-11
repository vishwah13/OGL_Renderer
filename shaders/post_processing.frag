#version 330 core
out vec4 FragColor;
  
in vec2 TexCoords;

uniform sampler2D screenTexture;
uniform float exposure;

void main()
{	
	//gamma correction and HDR(tone mapping)
	vec3 hdrColor = texture(screenTexture, TexCoords).rgb;

	//exposure tone mapping
	vec3 mapped = vec3(1.0) - exp(-hdrColor * exposure);
	//gamma correction
	mapped = pow(mapped,vec3(1.0/2.2));

	FragColor = vec4(mapped,1.0);


   //FragColor = texture(screenTexture, TexCoords);
   //float average = 0.2126 * FragColor.r + 0.7152 * FragColor.g + 0.0722 * FragColor.b;
	//FragColor = vec4(average, average, average, 1.0);

	
}