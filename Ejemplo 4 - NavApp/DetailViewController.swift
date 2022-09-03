//
//  DetailViewController.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 02/09/22.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func viewMoreButton(_ sender: Any) {
        self.performSegue(withIdentifier: "viewMoreSegue",
                          sender: Self.self)
    }
}
