//
//  FavoritesViewController.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 02/09/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var posterPageController: UIPageControl!
    @IBOutlet weak var favoritePosterImage: UIImageView!
    
    let posters = ["0","1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        posterPageController.numberOfPages = posters.count
        setImage()
    }
    
    @IBAction func posterPagerControllerAction(_ sender: UIPageControl) {
        setImage()
    }
    @IBAction func leftSwipe(_ sender: Any) {
        if posterPageController.currentPage == posters.count-1 {
            posterPageController.currentPage = 0
            setImage()
        }else{
            posterPageController.currentPage += 1
            setImage()
        }
    }
    @IBAction func rightSwipe(_ sender: Any) {
        if posterPageController.currentPage == 0 {
            posterPageController.currentPage = posters.count
            setImage()
        }else{
            posterPageController.currentPage -= 1
            setImage()
        }
    }
    
    private func setImage(){
        favoritePosterImage.image = UIImage(named: posters[posterPageController.currentPage])
    }
    
    
}
