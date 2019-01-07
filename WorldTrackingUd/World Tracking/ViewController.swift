//
//  ViewController.swift
//  World Tracking
//
//  Created by Wilson Campusano Jorge on 12/14/18.
//  Copyright © 2018 Wilson Campusano Jorge. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var scenView: ARSCNView!
    let config = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scenView.debugOptions = [.showWorldOrigin, .showCameras, .showFeaturePoints]
        scenView.autoenablesDefaultLighting = true
        scenView.session.run(config)
    }
    @IBAction func add(_ sender: UIButton) {
        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0))
        let triangleNode = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
        let planeNode = SCNNode(geometry: SCNPlane(width: 0.04, height: 0.06))

        boxNode.geometry?.firstMaterial?.specular.contents = UIColor.orange
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.black
        boxNode.position = SCNVector3(0.2,0.3,-0.20)

        triangleNode.geometry?.firstMaterial?.specular.contents = UIColor.green
        triangleNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        triangleNode.position = SCNVector3(0, 0.05, 0)

        planeNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        planeNode.position = SCNVector3(x: 0, y: -0.02, z: 0.053)

        boxNode.addChildNode(triangleNode)
        boxNode.addChildNode(planeNode)
        boxNode.eulerAngles = SCNVector3(x: 0, y: 0, z: Float(90.radians))
        self.scenView.scene.rootNode.addChildNode(boxNode)
        
//        let planeNode = SCNNode(geometry: SCNPlane(width: 0.1, height: 0.1))
//        planeNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        planeNode.position = SCNVector3(0.0,0.0,-0.1)
//        planeNode.eulerAngles = SCNVector3(0,0,90.radians)
//
//        let pyramidNode = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
//        pyramidNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        pyramidNode.position = SCNVector3(0.0,0,-0.2)
        
      //  planeNode.addChildNode(pyramidNode)
        
  //      self.scenView.scene.rootNode.addChildNode(planeNode)
        
    }
    @IBAction func reiniciar(_ sender: Any) {
        self.resset()
    }
    
    func resset(){
        self.scenView.session.pause()
        let childs = self.scenView.scene.rootNode.childNodes
        
        for c in childs {
            c.removeFromParentNode()
        }
        self.scenView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
    }
}
