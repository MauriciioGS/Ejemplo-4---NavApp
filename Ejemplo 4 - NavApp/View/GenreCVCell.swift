//
//  GenreCell.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 03/09/22.
//

import UIKit

class GenreCVCell: UICollectionViewCell {
    
    @IBOutlet weak var genreImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with genre: Genre){
        genreImageView.image = UIImage.init(named: genre.genre)
        titleLabel.text = genre.genre
    }
}
