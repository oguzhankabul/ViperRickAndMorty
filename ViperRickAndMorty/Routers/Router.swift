//
//  Router.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import Foundation

class Router: AnyRouter {
    
    var controller: Controller?
    
    static func start() -> AnyRouter {
        let router = Router()
        var viewController: AnyViewController = DashboardViewController()
        var presenter: AnyPresenter = Presenter()
        var interactor: AnyInteractor = Interactor()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.viewController = viewController
        presenter.interactor = interactor
        router.controller = viewController as? Controller
        
        return router
    }
}
