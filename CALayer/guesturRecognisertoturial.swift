//
//  guesturRecognisertoturial.swift
//  CALayer
//
//  Created by Sierra on 5/8/18.
//  Copyright © 2018 Nagiz. All rights reserved.
//

import UIKit

class guesturRecognisertoturial: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var infoLbl: UILabel!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(guesturRecognisertoturial.tapFunction(sender:)))
        tapGesture.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tapGesture)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(guesturRecognisertoturial.logPressTapped(sender:)))
        longPress.minimumPressDuration = 2
        imgView.addGestureRecognizer(longPress)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(guesturRecognisertoturial.SwipeFunction(sender:)))
        swipeGesture.direction = .left
        imgView.addGestureRecognizer(swipeGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(guesturRecognisertoturial.pinchAction(sender:)))
        imgView.addGestureRecognizer(pinchGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(guesturRecognisertoturial.panAction(sender:)))
        imgView.addGestureRecognizer(panGesture)
    }
    
   @objc func tapFunction(sender:UITapGestureRecognizer){
    counter += 1
    if counter == 1 {
    infoLbl.text = "image view tapped \(counter) time"
    }else{
        infoLbl.text = "image view tapped \(counter) times"
    }
    }
    
    @objc func logPressTapped(sender:UILongPressGestureRecognizer){
        infoLbl.text = "image view pressed for 2 seconds"
    }
    
    @objc func SwipeFunction(sender:UISwipeGestureRecognizer){
        counter=0
        infoLbl.text = "Gesture was reset now"
    }
    
    @objc func pinchAction(sender:UIPinchGestureRecognizer){
        
        sender.view!.transform = sender.view!.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale=1
    }
    
     @objc func panAction(sender:UIPanGestureRecognizer){
        let translation = sender.translation(in: self.view)
        
        let newXlocation = sender.view!.center.x + translation.x
        let newYlocation = sender.view!.center.y + translation.y
        
        sender.view?.center = CGPoint(x: newXlocation, y: newYlocation)
        sender.setTranslation(.zero, in: self.view)
    }

}
