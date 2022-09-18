//
//  MovieDataManager.swift
//  Ejemplo 4 - NavApp
//
//  Created by Proteco on 03/09/22.
//

import Foundation

class MovieDataManager{
    private var movies: [Movie] = []
    
    func fetchGenre(genre: String){
        if let file = Bundle.main.url(forResource: "movies", withExtension: "json"){
            do{
                let data = try Data(contentsOf: file)
                let decodedMovies = try JSONDecoder().decode([Movie].self, from: data)
                movies = decodedMovies.filter(
                    {$0.genres.contains(genre)}
                )
            }catch{
                print("error: ",error)
            }
        }
    }
    
    func movieCount() -> Int {
        return movies.count
    }
    
    func movieAtIndex(index: Int) -> Movie{
        return movies[index]
    }

}
