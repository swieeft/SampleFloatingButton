//
//  ViewController.swift
//  SampleFloatingButton
//
//  Created by Park GilNam on 2020/03/20.
//  Copyright © 2020 swieeft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var floatingStackView: UIStackView!
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var morningButton: UIButton!
    @IBOutlet weak var afternoonButton: UIButton!
    @IBOutlet weak var eveningButton: UIButton!
    
    var floatingDimView: UIView = UIView()
    
    var isShowFloating: Bool = false
    
    lazy var buttons: [UIButton] = [self.morningButton, self.afternoonButton, self.eveningButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func floatingButtonAction(_ sender: UIButton) {
        
        if isShowFloating {
            buttons.reversed().forEach { button in
                UIView.animate(withDuration: 0.3) {
                    button.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.floatingDimView.alpha = 0
            }) { (_) in
                self.floatingDimView.removeFromSuperview()
                self.floatingDimView.alpha = 1
            }
        } else {
            floatingDimView = UIView(frame: self.view.frame)
            floatingDimView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            floatingDimView.alpha = 0
            
            self.view.insertSubview(floatingDimView, belowSubview: floatingStackView)
         
            UIView.animate(withDuration: 0.5) {
                self.floatingDimView.alpha = 1
            }
            
            buttons.forEach { [weak self] button in
                button.isHidden = false
                button.alpha = 0

                UIView.animate(withDuration: 0.3) {
                    button.alpha = 1
                    self?.view.layoutIfNeeded()
                }
            }
        }
        
        isShowFloating = !isShowFloating
        
        let image = isShowFloating ? UIImage(named: "Hide") : UIImage(named: "Show")
        let roatation = isShowFloating ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity
        
        UIView.animate(withDuration: 0.3) {
            sender.setImage(image, for: .normal)
            sender.transform = roatation
        }
        
    }
}
