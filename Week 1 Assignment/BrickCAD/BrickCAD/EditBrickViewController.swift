//
//  EditBrickViewController.swift
//  BrickCAD
//
//  Created by Ale Mohamad on 18/01/2020.
//  Copyright © 2020 Ale Mohamad. All rights reserved.
//

import UIKit

class EditBrickViewController: UIViewController {
    
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var widthTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    
    var delegate: BrickViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setTouched(_ sender: Any) {
        if let height = heightTextField.text, let heightInt = Int(height),
            let width = widthTextField.text, let widthInt = Int(width),
            let length = lengthTextField.text, let lengthInt = Int(length) {
            delegate?.updateBrickSize(width: widthInt, height: heightInt, length: lengthInt)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
