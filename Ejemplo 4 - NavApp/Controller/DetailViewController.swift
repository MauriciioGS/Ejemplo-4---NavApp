//
//  DetailViewController.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 02/09/22.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var recievedGenre : Genre?
    let movieDataManager = MovieDataManager()
    private var selectedMovie : Movie!

    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        movieDataManager.fetchGenre(genre: recievedGenre!.genre)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.movieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTViewCell
        cell.setup(with: movieDataManager.movieAtIndex(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movieDataManager.movieAtIndex(index: indexPath.row)
        self.performSegue(withIdentifier: "movieInfo", sender: Self.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MoreViewController
        destination.recievedMovie = selectedMovie
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
}
