#version 330 core
out vec4 FragColor;
  
in vec2 TexCoords;

uniform sampler2D screenTexture;

void main()
{	
	//gamma correction
	vec3 color = texture(screenTexture, TexCoords).rgb;
	color = pow(color,vec3(1.0/2.2));
	FragColor = vec4(color,1.0);


   //FragColor = texture(screenTexture, TexCoords);
   //float average = 0.2126 * FragColor.r + 0.7152 * FragColor.g + 0.0722 * FragColor.b;
	//FragColor = vec4(average, average, average, 1.0);

	
}