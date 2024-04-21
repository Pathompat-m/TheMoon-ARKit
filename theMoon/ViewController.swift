//
//  ViewController.swift
//  theMoon
//
//  Created by Pathompat Mekbenchapivat on 21/4/2567 BE.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a sphere geometry
        let sphere = SCNSphere(radius: 0.2)
        
        // Create a material and set its diffuse content to a moon image
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        
        // Apply the material to the sphere
        sphere.materials = [material]
        
        // Create a node to hold the sphere
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        node.geometry = sphere
        
        // Add the node to the scene's root node
        sceneView.scene.rootNode.addChildNode(node)
        
        // Enable default lighting for the scene
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration for AR tracking
        let configuration = ARWorldTrackingConfiguration()

        // Run the AR session with the given configuration
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
