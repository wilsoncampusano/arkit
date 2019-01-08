//
//  ViewController.swift
//  AR Drawing
//
//  Created by Wilson Campusano Jorge on 1/7/19.
//  Copyright © 2019 Wilson Campusano Jorge. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var draw: UIButton!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        self.sceneView.showsStatistics = true
        self.sceneView.delegate = self
        self.sceneView.session.run(configuration)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {

        guard let pointOfView = renderer.pointOfView else {return }
        
        let transformation = pointOfView.transform
        
        let orientation = SCNVector3(-transformation.m31, -transformation.m32, -transformation.m33)
        
        let location = SCNVector3(transformation.m41, transformation.m42, transformation.m43)
        
        let frontOfCamera = orientation + location
        let rootNode = self.sceneView.scene.rootNode
   
        DispatchQueue.main.async {
            if self.draw.isHighlighted {
                print("Dibujar pisado")
                let sphereNode = SCNNode(geometry: SCNSphere(radius: 0.02))
                sphereNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
                sphereNode.position = frontOfCamera
                rootNode.addChildNode(sphereNode)
            }else {
                
                rootNode.enumerateChildNodes { (node, _) in
                    if node.geometry is SCNBox{
                        node.removeFromParentNode()
                    }
                }
                
                let pointerNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1/2))
                pointerNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
                pointerNode.position = frontOfCamera
                rootNode.addChildNode(pointerNode)
            }
        }
    }
    
}

extension SCNVector3{
    static func +(left:SCNVector3, right:SCNVector3) -> SCNVector3{
        return SCNVector3Make(left.x + right.x, left.y+right.y, left.z+right.z)
    }
}
