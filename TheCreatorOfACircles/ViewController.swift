//
//  ViewController.swift
//  TheCreatorOfACircles
//
//  Created by Alexander Kononok on 9/27/20.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .purple
  }

  @IBAction func startGameButtonPressed(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let gameViewController = storyboard.instantiateViewController(identifier: String(describing: GameViewController.self)) as! GameViewController
    navigationController?.pushViewController(gameViewController, animated: true)
  }
  
}

