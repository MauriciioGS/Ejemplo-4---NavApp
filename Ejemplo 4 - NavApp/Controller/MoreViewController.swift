//
//  MoreViewController.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 02/09/22.
//

import UIKit

class MoreViewController: UIViewController {
    
    var recievedMovie : Movie!
    @IBOutlet weak var posterMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var yearMovie: UILabel!
    @IBOutlet weak var runtimeMovie: UILabel!
    @IBOutlet weak var genresMovie: UILabel!
    @IBOutlet weak var directorMovie: UILabel!
    @IBOutlet weak var actorsMovie: UILabel!
    @IBOutlet weak var plotMovie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        setPoster(stringUrl: recievedMovie.posterURL)
        titleMovie.text = recievedMovie.title
        yearMovie.text = recievedMovie.year
        runtimeMovie.text = recievedMovie.runtime
        genresMovie.text = populateString()
        directorMovie.text = recievedMovie.director
        actorsMovie.text = recievedMovie.actors
        plotMovie.text = recievedMovie.plot
    }
    
    func populateString() -> String {
        var genresText : String = ""
        recievedMovie.genres.forEach{ genre in
            genresText += (genre + ", ")
        }
        return genresText
    }
    
    func setPoster(stringUrl : String){
        let posterUrl = URL(string: stringUrl)!
        if let data = try? Data(contentsOf: posterUrl){
            if let image = UIImage(data: data){
                posterMovie.image = image
            }
        }else{
            posterMovie.image = UIImage.init(named: "no-image-available")
        }
    }
    
}
