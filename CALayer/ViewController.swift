//
//  ViewController.swift
//  CALayer
//
//  Created by Sierra on 5/8/18.
//  Copyright © 2018 Nagiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        layer is back of view ,, y3ny le sh8lna el stren dol m3 b3d hyb2a loon el view asfr msh eswd
//        MyView.layer.backgroundColor = UIColor.black.cgColor
//        MyView.backgroundColor = .yellow
        
        let gradient = CAGradientLayer()
        gradient.frame = MyView.bounds
        gradient.colors = [UIColor.black.cgColor,UIColor.red.cgColor]
        MyView.layer.addSublayer(gradient)
        
//        MyView.layer.isGeometryFlipped = true
    }



}

