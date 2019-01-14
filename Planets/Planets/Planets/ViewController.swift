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
        let rootNode = self.sceneView.scene.rootNode
        
        let planetEarth = planet(geometry:SCNSphere(radius: 0.2),diffuse: UIImage(named: "Earth Day"),specular: UIImage(named: "Earth Especular"), emission: UIImage(named:"Earth Emision"),normal: UIImage(named: "Earth Normal"), position: SCNVector3(0,0,-3))
        
        
        //let action = SCNAction.rotateBy(x: 0, y:  CGFloat(360.degreesToRadians), z:0, duration: 6)
        //let runForever = SCNAction.repeatForever(action)
        //planetEarth.runAction(runForever)
        rootNode.addChildNode(planetEarth)
        
    }
    
    func planet(geometry:SCNGeometry, diffuse: UIImage?, specular:UIImage?, emission:UIImage?, normal:UIImage?, position:SCNVector3) -> SCNNode{
        let planetNode = SCNNode(geometry: geometry)
        let earthFirstMaterial = planetNode.geometry?.firstMaterial
        earthFirstMaterial?.diffuse.contents = diffuse
        earthFirstMaterial?.specular.contents = specular
        earthFirstMaterial?.emission.contents = emission
        earthFirstMaterial?.normal.contents = normal
        planetNode.position = position
        return planetNode
    }
    
    
    

}

extension
Int {
    
    var degreesToRadians: Double { return Double(self) * .pi / 180}
}
