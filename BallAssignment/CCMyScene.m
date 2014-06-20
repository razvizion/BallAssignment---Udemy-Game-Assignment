//
//  CCMyScene.m
//  BallAssignment
//
//  Created by Michał Kozak on 05.05.2014.
//  Copyright (c) 2014 Raz Labs. All rights reserved.
//

#import "CCMyScene.h"

@implementation CCMyScene
{
     SKNode *_mainLayer;
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        
        //SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        /*
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
         */
        
        SKNode *edge = [SKNode node];
        edge.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self addChild:edge];

        
        
        _mainLayer = [[SKNode alloc]init];
        [self addChild:_mainLayer];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
     
        
    
           [self addBall:location];
        
        //sprite.position = location;
        
      //  SKNode *ball = [self]
        
        //SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
       // [sprite runAction:[SKAction repeatActionForever:action]];
        
      //  [self addChild:sprite];
    }
}

-(void)addBall:(CGPoint) location
{
    int mRand = arc4random_uniform(3);
    SKSpriteNode  *ball;
    switch (mRand) {
        case 0:
            ball = [SKSpriteNode spriteNodeWithImageNamed:@"8Ball"];
            ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
            ball.physicsBody.mass = 0.8;
            ball.physicsBody.restitution = 0.2;
            break;
        case 1:
            ball = [SKSpriteNode spriteNodeWithImageNamed:@"BeachBall"];
            ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
            ball.physicsBody.mass = 0.1;
            ball.physicsBody.restitution = 1;
            //ball.physicsBody.linearDamping = 0.0;
            ball.physicsBody.friction = 0.0;
            break;
        default:
            ball = [SKSpriteNode spriteNodeWithImageNamed:@"SoccerBall"];
            ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width * 0.5];
            ball.physicsBody.mass = 0.4;
            ball.physicsBody.restitution = 0.5;
            ball.physicsBody.angularVelocity = 20.0;
            break;
    }
    ball.physicsBody.friction=1.0;
    ball.position = location;
    
    [_mainLayer addChild:ball];
    
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(int)generateRandomNumberBetweenMin:(int)min Max:(int)max
{
    return ( (arc4random() % (max-min+1)) + min );
}

@end
