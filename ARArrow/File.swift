//
//  File.swift
//  ARArrow
//
//  Created by Rawan on 15/11/1444 AH.
//

import Foundation
import Foundation
import SceneKit

class ArrowNode: SCNNode {
    
    override init() {
        super.init()
        
        // Create the arrow geometry
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x: 0, y: 0))
        arrowPath.addLine(to: CGPoint(x: 0.2, y: 0))
        arrowPath.addLine(to: CGPoint(x: 0.2, y: 0.05))
        arrowPath.addLine(to: CGPoint(x: 0.4, y: -0.05))
        arrowPath.addLine(to: CGPoint(x: 0.2, y: -0.15))
        arrowPath.addLine(to: CGPoint(x: 0.2, y: -0.1))
        arrowPath.addLine(to: CGPoint(x: 0, y: -0.1))
        arrowPath.close()
        
        let arrowShape = SCNShape(path: arrowPath, extrusionDepth: 0.02)
        arrowShape.firstMaterial?.diffuse.contents = UIColor(fromHexString: "32C25B").withAlphaComponent(0.8)
        
        // Create the arrow node
        let arrowNode = SCNNode(geometry: arrowShape)
        
        // Attach the arrow node to the custom shape node
        self.addChildNode(arrowNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startRotationAnimation2() {
    let rotationAction = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi * 2), z: 0, duration: 2.0)
    let rotationForeverAction = SCNAction.repeatForever(rotationAction)
    self.runAction(rotationForeverAction)
    }
    func startRotationAnimation() {
    let rotationAction = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi * 2), z: 0, duration: 2.0)
    let rotationForeverAction = SCNAction.repeatForever(rotationAction)

    let translationAction = SCNAction.move(by: SCNVector3(0, 0, -0.5), duration: 2.0)
    let reverseTranslationAction = SCNAction.move(by: SCNVector3(0, 0, 0.5), duration: 2.0)
    let translationSequence = SCNAction.sequence([translationAction, reverseTranslationAction])
    let translationForeverAction = SCNAction.repeatForever(translationSequence)

    self.runAction(rotationForeverAction)
    self.runAction(translationForeverAction)
    }
    
    
//    func startRotationAnimation360() {
//    let rotationAction = SCNAction.rotateBy(x: 0, y: .pi * 2, z: 0, duration: 4.0)
//    let rotationForeverAction = SCNAction.repeatForever(rotationAction)
//
//    self.runAction(rotationForeverAction)
//    }
    
//    func startRotationAnimation360() {
//    let rotationAction = SCNAction.rotateBy(x: 0, y: .pi * 2, z: 0, duration: 4.0)
//    let rotationForeverAction = SCNAction.repeatForever(rotationAction)
//
//    self.runAction(rotationForeverAction)
//    }
    
//    func startRotationAnimation306() {
//    let rotationAction = SCNAction.rotateBy(x: 0, y: .pi * 2, z: 0, duration: 4.0)
//    let rotationForeverAction = SCNAction.repeatForever(rotationAction)
//
//    let positionAction = SCNAction.move(by: SCNVector3(0, 0, -2), duration: 4.0)
//    let reversePositionAction = SCNAction.move(by: SCNVector3(0, 0, 2), duration: 4.0)
//    let positionSequence = SCNAction.sequence([positionAction, reversePositionAction])
//    let positionForeverAction = SCNAction.repeatForever(positionSequence)
//
//    self.runAction(rotationForeverAction)
//    self.runAction(positionForeverAction)
//    }
    
    func startRotationAnimation360() {
//    let moveUpAction = SCNAction.move(by: SCNVector3(0, 1, 0), duration: 2.0)
    let moveLeftAction = SCNAction.move(by: SCNVector3(-1, 0, 0), duration: 2.0)
    let moveRightAction = SCNAction.move(by: SCNVector3(1, 0, 0), duration: 2.0)
    let moveSequence = SCNAction.sequence([moveLeftAction, moveRightAction])
    let moveForeverAction = SCNAction.repeatForever(moveSequence)

    self.runAction(moveForeverAction)
    }
    
}
