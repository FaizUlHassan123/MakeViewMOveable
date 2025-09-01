//
//  ViewController.swift
//  MakeViewMOveable
//
//  Created by Faiz Ul Hassan on 11/09/2024.
//

import UIKit
 
class ViewController: UIViewController {

    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var draggableView: UIView!
    private var pangesture: UIPanGestureRecognizer!

    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setDragView()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }

    @objc func timerAction() {
        counter += 1
        label.text = "\(counter)"
    }
}

extension ViewController {
    fileprivate func setDragView() {
        pangesture = UIPanGestureRecognizer(target: self, action: #selector(draggableFunction(_:)))
        draggableView.isUserInteractionEnabled = true
        draggableView.addGestureRecognizer(pangesture)
    }
}

extension ViewController {
    @objc fileprivate func draggableFunction(_ sender: UIPanGestureRecognizer) {
        draggableView.translatesAutoresizingMaskIntoConstraints = true

        let translation = sender.translation(in: self.view)
        draggableView.center = CGPoint(x: draggableView.center.x + translation.x, y: draggableView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
}
