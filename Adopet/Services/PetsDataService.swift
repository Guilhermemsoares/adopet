//
//  PetsDataService.swift
//  Adopet
//
//  Created by Guilherme Moreira Soares on 21/05/26.
//

import Foundation

protocol PetsDataServiceDelegate: AnyObject {
    func fetchedSuccesfully(_ pets: [Pet])
    func failedToFetch(_ error: NetworkingError)
}

class PetsDataService {
    
    private var networkingService: NetworkingProtocol = URLSessionNetworking()
    weak var delegate: PetsDataServiceDelegate?
    
    func fetchPets() {
        guard let url = URL(string: "https://my-json-server.typicode.com/alura-cursos/pets-api/pets") else { return }
        
        networkingService.request(url) { [weak self] (result: Result<[Pet], NetworkingError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let pets):
                    self?.delegate?.fetchedSuccesfully(pets)
                case .failure(let error):
                    self?.delegate?.failedToFetch(error)
                }
            }
        }
    }
}
