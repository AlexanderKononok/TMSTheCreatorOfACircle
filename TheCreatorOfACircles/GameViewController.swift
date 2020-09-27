//
//  GameViewController.swift
//  TheCreatorOfACircles
//
//  Created by Alexander Kononok on 9/27/20.
//

import UIKit

class GameViewController: UIViewController {
  
  @IBOutlet weak var fieldForCirclesView: UIView!
  
  var circle: UIView!
//  var count = 0
  let side: CGFloat = 100
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fieldForCirclesView.backgroundColor = .purple
    let gesture = UITapGestureRecognizer()
    gesture.addTarget(self, action: #selector(processTap(_:)))
    fieldForCirclesView.addGestureRecognizer(gesture)
    
  }
  
  @objc func processTap(_ gesture: UITapGestureRecognizer) {
    let coord = gesture.location(in: fieldForCirclesView)
    let x = coord.x
    let y = coord.y
    
    createCircle(x: x, y: y)
//    if count < 3 {
//      createCircle(x: x, y: y)
//      count += 1
//      print(count)
//    } else {
//      removeCircle(x: x, y: y)
//      print("deleted")
//    }
  }
  
  func createCircle(x: CGFloat, y: CGFloat) {
    circle = UIView()
    circle.frame = CGRect(x: x - (side / 2), y: y - (side / 2), width: side, height: side)
    circle.layer.cornerRadius = circle.frame.width / 2
//    circle.tag = Int.random(in: 0...Int.max)
//    print(circle.tag)
    generateRandomColor()
    fieldForCirclesView.addSubview(circle)
  }
  
  func removeCircle(x: CGFloat, y: CGFloat) {
    circle.removeFromSuperview()
  }
  
  func generateRandomColor() {
    let red = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue = CGFloat.random(in: 0...1)
    
    circle.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
  }
  
}
