//
//  Interactor.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import Foundation

class Interactor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getEntity() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            presenter?.interactorDidFetchResults(with: "Something went wrong")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchResults(with: "Something went wrong")
                return
            }
            do {
                let morties = try JSONDecoder().decode(MortyList.self, from: data).results
                self?.presenter?.interactorDidFetchResults(with: morties)
            }
            catch {
                self?.presenter?.interactorDidFetchResults(with: "Something went wrong")
            }
        }
        task.resume()
    }
}
