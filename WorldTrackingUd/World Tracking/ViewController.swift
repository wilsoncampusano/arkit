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
        let node = SCNNode()
        //let cilinderWithCode = SCNCone(topRadius: 0.3, bottomRadius: 0.3, height: 0.5)
        _ = SCNSphere(radius: 0.1)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0.0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
        path.addLine(to: CGPoint(x:0.4, y:0.2))
        path.addLine(to: CGPoint(x: 0.4, y: 0.0))
        let shape = SCNShape(path: path, extrusionDepth: 0.05)
        //node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        node.geometry = shape
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.black
        
        _ = Util.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        _ = Util.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        _ = Util.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(0,0,-0.5)
        self.scenView.scene.rootNode.addChildNode(node)
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
