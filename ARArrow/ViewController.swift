//
//  ViewController.swift
//  ARArrow
//
//  Created by Rawan on 15/11/1444 AH.
//


import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {
@IBOutlet var sceneView: ARSCNView!

override func viewDidLoad() {
    super.viewDidLoad()
    sceneView.delegate = self
    
    let scene = SCNScene()
    sceneView.scene = scene
    
    let arrowNode = ArrowNode()
    arrowNode.position = SCNVector3(0, 0, -1)
    sceneView.scene.rootNode.addChildNode(arrowNode)
//    arrowNode.startRotationAnimation360()
    DispatchQueue.main.asyncAfter(deadline: .now()
                                  + 2.0){
        arrowNode.eulerAngles.z += .pi / 2
        
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
    arrowNode.eulerAngles.z += .pi
    }

    // Rotate arrowNode by 360 degrees after 20 seconds (5-second delay + 5-second rotation + 5-second delay + 5-second rotation)
    DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
    arrowNode.eulerAngles.z += 2 + .pi
    }
}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let configuration = ARWorldTrackingConfiguration()
    sceneView.session.run(configuration)
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    sceneView.session.pause()
}

    
    
    
    
    
    
// ARSCNViewDelegate methods

// Add any additional delegate methods as needed

// ...
}
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
//
//    func session(_ session: ARSession, didFailWithError error: Error) {
//        // Present an error message to the user
//
//    }
//
//    func sessionWasInterrupted(_ session: ARSession) {
//        // Inform the user that the session has been interrupted, for example, by presenting an overlay
//
//    }
//
//    func sessionInterruptionEnded(_ session: ARSession) {
//        // Reset tracking and/or remove existing anchors if consistent tracking is required
//
//    }

