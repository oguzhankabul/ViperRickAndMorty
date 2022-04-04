//
//  Presenter.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import Foundation

class Presenter: AnyPresenter {
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getEntity()
        }
    }
    
    var viewController: AnyViewController?
    
    func interactorDidFetchResults(with results: [Morty]){
        viewController?.update(with: results)
    }
    
    func interactorDidFetchResults(with error: String) {
        viewController?.update(with: error)
    }
}
