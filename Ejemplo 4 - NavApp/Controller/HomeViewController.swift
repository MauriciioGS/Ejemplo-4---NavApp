//
//  HomeViewController.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 02/09/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let genreDataManager = GenreDataManager()
    
    private var selectedGenre: Genre!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //movieDataManager.fetchGenre(genre: "Adventure")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        genreDataManager.fetch()
    }
    
    @IBAction func viewDetail(_ sender: UIButton) {
        self.performSegue(withIdentifier: "detailSegue",
                          sender: Self.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreDataManager.genreCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCVCell", for: indexPath) as! GenreCVCell
        cell.setup(with: genreDataManager.genreAtIndex(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedGenre = genreDataManager.genreAtIndex(index: indexPath.row)
        self.performSegue(withIdentifier: "detailSegue", sender: Self.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.recievedGenre = selectedGenre
    }
    
}
