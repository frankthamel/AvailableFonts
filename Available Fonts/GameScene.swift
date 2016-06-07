//
//  GameScene.swift
//  Available Fonts
//
//  Created by frank thamel on 6/7/16.
//  Copyright (c) 2016 Talene. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var familyIdx : Int  = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        showCurrentFamily()
    }
    
    func showCurrentFamily()  {
        //
        removeAllChildren()
        
        let familyName = UIFont.familyNames()[familyIdx]
        print("Family : \(familyName)")
        
        let fontNames  = UIFont.fontNamesForFamilyName(familyName)
        
        for (idx, fontName) in fontNames.enumerate() {
            let label = SKLabelNode(fontNamed: fontName)
            label.text = fontName
            label.position = CGPoint(x: size.width/2, y: (size.height * (CGFloat(idx + 1)))/(CGFloat(fontNames.count)+1))
            label.fontSize = 50
            label.verticalAlignmentMode = .Center
            addChild(label)
        }
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        familyIdx = familyIdx + 1
        if familyIdx >= UIFont.familyNames().count {
            familyIdx = 0
        }
        showCurrentFamily()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
