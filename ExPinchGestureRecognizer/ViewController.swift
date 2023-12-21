//
//  ViewController.swift
//  ExPinchGestureRecognizer
//
//  Created by 김종권 on 2023/12/21.
//

import UIKit

class ViewController: UIViewController {
    private let blueView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            blueView.heightAnchor.constraint(equalToConstant: 200),
            blueView.widthAnchor.constraint(equalToConstant: 300),
            blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        let gesture = UIPinchGestureRecognizer(target: self, action: #selector(zooming))
        view.addGestureRecognizer(gesture)
    }
    
    @objc
    private func zooming(_ gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let changedScaleTransform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
            let minBound = 0.1
            let maxBound = 3.0
            
            guard (minBound...maxBound) ~= changedScaleTransform.a else { break }
            blueView.transform = changedScaleTransform
            
        default:
            break
        }
    }
}
