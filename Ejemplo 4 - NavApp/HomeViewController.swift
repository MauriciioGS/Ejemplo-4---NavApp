//
//  HomeViewController.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 02/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func viewDetail(_ sender: UIButton) {
        self.performSegue(withIdentifier: "detailSegue",
                          sender: Self.self)
    }
    
}
