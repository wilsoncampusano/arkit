//
//  ViewController.swift
//  Planets
//
//  Created by Wilson Campusano Jorge on 1/14/19.
//  Copyright © 2019 Wilson Campusano Jorge. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.session.run(configuration)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let earthNode = SCNNode(geometry: SCNSphere(radius: 1))
        let rootNode = self.sceneView.scene.rootNode
        let earthFirstMaterial = earthNode.geometry?.firstMaterial
        
        earthFirstMaterial?.diffuse.contents = UIImage(named: "Earth Day")
        earthFirstMaterial?.specular.contents = UIImage(named: "Earth Especular")
        earthFirstMaterial?.emission.contents = UIImage(named: "Earth Emision")
        earthFirstMaterial?.normal.contents = UIImage(named: "Earth Normal")
    
        
        earthNode.position = SCNVector3(0,0,-3)
        
        let action = SCNAction.rotateBy(x: 0, y:  CGFloat(360.degreesToRadians), z:0, duration: 6)
        let runForever = SCNAction.repeatForever(action)
        earthNode.runAction(runForever)
        
        rootNode.addChildNode(earthNode)
        
    }
    
    
    

}

extension
Int {
    
    var degreesToRadians: Double { return Double(self) * .pi / 180}
}
