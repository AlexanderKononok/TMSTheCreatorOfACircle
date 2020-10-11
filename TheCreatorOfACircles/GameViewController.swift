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
  var arrCircles: [UIView] = []
  
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
    createCircle(x: coord.x, y: coord.y)
    
    print(arrCircles)
    print("============================================")
    
    var circleWhichWillRemoved: [UIView] = arrCircles.filter({ ($0.frame.minX < coord.x && coord.x < $0.frame.maxX && $0.frame.minY < coord.y && coord.y < $0.frame.maxY) })
    print(circleWhichWillRemoved)
    if circleWhichWillRemoved.count > 1 {
      for circle in circleWhichWillRemoved {
        circle.removeFromSuperview()
      }
      circleWhichWillRemoved = []
    }
    print("============================================")
  }
  
  func createCircle(x: CGFloat, y: CGFloat) {
    circle = UIView()
    circle.frame = CGRect(x: x - (side / 2), y: y - (side / 2), width: side, height: side)
    circle.layer.cornerRadius = circle.frame.width / 2
    generateRandomColor()
    fieldForCirclesView.addSubview(circle)
    arrCircles.append(circle)
  }
  
  func generateRandomColor() {
    let red = CGFloat.random(in: 0...1)
    let green = CGFloat.random(in: 0...1)
    let blue = CGFloat.random(in: 0...1)
    
    circle.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
  }
  
}
