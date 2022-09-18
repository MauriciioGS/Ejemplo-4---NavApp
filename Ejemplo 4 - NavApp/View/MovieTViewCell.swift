//
//  MovieTViewCell.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 17/09/22.
//

import UIKit

class MovieTViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func setup(with movie: Movie) {
        let posterUrl = URL(string: movie.posterURL)!
        if let data = try? Data(contentsOf: posterUrl){
            if let image = UIImage(data: data){
                posterImageView.image = image
            }
        }else{
            posterImageView.image = UIImage.init(named: "no-image-available")
        }
        
        titleLabel.text = movie.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
