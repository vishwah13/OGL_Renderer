#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;
layout (location = 3) in vec3 aTangent;
layout (location = 4) in vec3 aBitangent;

out vec3 FragPos;
//out vec3 Normal;
out vec2 TexCoords;

out mat3 TBN;
//out vec3 TangentLightPos;
out vec3 TangentViewPos;
out vec3 TangentFragPos;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
//uniform vec3 viewPos;

void main()
{
    FragPos = vec3(model * vec4(aPos, 1.0));
    //doing mat3(transpose(inverse(model))) to find normal matrix
    //Normal = mat3(transpose(inverse(model))) * aNormal;
     TexCoords = aTexCoords;   
     vec3 T = normalize(vec3(model * vec4(aTangent, 0.0)));
     vec3 B = normalize(vec3(model * vec4(aBitangent, 0.0)));
     vec3 N = normalize(vec3(model * vec4(aNormal, 0.0)));
     //mat3 tbn = transpose(mat3(T,B,N));
     mat3 tbn = mat3(T,B,N);
     TBN = tbn;
//     TangentViewPos = tbn * viewPos;
//     TangentFragPos = tbn * vec3(model * vec4(aPos, 1.0));
    gl_Position = projection * view * model * vec4(aPos, 1.0);
}