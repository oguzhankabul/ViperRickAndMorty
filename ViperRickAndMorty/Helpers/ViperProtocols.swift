//
//  ViperProtocols.swift
//  ViperRickAndMorty
//
//  Created by Oğuzhan Kabul on 4.04.2022.
//

import UIKit

typealias Controller = AnyViewController & BaseViewController

protocol AnyViewController {
    var presenter: AnyPresenter? { get set}
    func update(with results: [Morty])
    func update(with error: String)
}

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    func getEntity()
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var viewController: AnyViewController? { get set }
    func interactorDidFetchResults(with result: [Morty])
    func interactorDidFetchResults(with error: String)
}

protocol AnyRouter {
    var controller: Controller? { get }
    static func start() -> AnyRouter
}

