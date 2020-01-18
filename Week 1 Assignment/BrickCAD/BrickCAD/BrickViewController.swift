//
//  BrickViewController.swift
//  BrickCAD
//
//  Created by Ale Mohamad on 18/01/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import UIKit

protocol BrickViewControllerDelegate {
    func updateBrickSize(width: Int, height: Int, length: Int)
}

class BrickViewController: UIViewController, BrickViewControllerDelegate {
    
    var width: Int = 0
    var height: Int = 0
    var length: Int = 0
    
    // top: length + width
    // side: height + length
    // front: height + width
    
    @IBOutlet var topLengthConstraint: NSLayoutConstraint!
    @IBOutlet var topWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet var sideHeightConstraint: NSLayoutConstraint!
    @IBOutlet var sideLengthConstraint: NSLayoutConstraint!
    
    @IBOutlet var frontHeightConstraint: NSLayoutConstraint!
    @IBOutlet var frontWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToEditBrickVC() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "EditBrickVC") as? EditBrickViewController else { return }
        
        vc.delegate = self
        
        show(vc, sender: self)
    }
    
    func updateBrickSize(width: Int, height: Int, length: Int) {
        self.width = width
        self.height = height
        self.length = length
        
        topLengthConstraint.constant = CGFloat(length)
        topWidthConstraint.constant = CGFloat(width)
        
        sideHeightConstraint.constant = CGFloat(height)
        sideLengthConstraint.constant = CGFloat(length)
        
        frontHeightConstraint.constant = CGFloat(height)
        frontWidthConstraint.constant = CGFloat(width)
    }
    
}

