//
//  FloatingViewController.swift
//  SampleFloatingButton
//
//  Created by Park GilNam on 2020/03/20.
//  Copyright © 2020 swieeft. All rights reserved.
//

import UIKit

class FloatingViewController: UIViewController {

    @IBOutlet weak var floatingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.floatingButton.setImage(UIImage(named: "Hide"), for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
