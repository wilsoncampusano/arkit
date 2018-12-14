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
        
        scenView.session.run(config)
    }
}
