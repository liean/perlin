//
//  pgePerlinShader.fsh
//  Tankimals
//
//  Created by Lars Birkemose on 13/06/12.
//  Copyright 2012 Protec Electronics. All rights reserved.
//
// -----------------------------------------------------------------    

precision highp float;
precision highp int;
precision highp sampler2D;

// -----------------------------------------------------------------    

uniform sampler2D       u_textureLower;         // lower texture
uniform sampler2D       u_textureUpper;         // upper texture
uniform sampler2D       u_textureColor;         // color texture
uniform float           u_animationProgress;

varying vec2            v_texCoord;

// -----------------------------------------------------------------    

void main( ) {
    vec4 noiseVector;
    vec4 noiseVector0;
    vec4 noiseVector1;
    float intensity;
        
    // get 3D perlin data
    noiseVector0 = texture2D( u_textureLower, v_texCoord );
    noiseVector1 = texture2D( u_textureUpper, v_texCoord );
    noiseVector = mix( noiseVector0, noiseVector1, u_animationProgress );
            
    intensity = noiseVector.r + noiseVector.g + noiseVector.b + noiseVector.a;
    intensity = intensity - 0.40;
    
    intensity = clamp( intensity, 0.0, 1.0 );
    gl_FragColor = texture2D( u_textureColor, vec2( 1.0 - intensity, 0.37 ) );

}

// -----------------------------------------------------------------    














