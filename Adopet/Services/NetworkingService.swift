//
//  NetworkingService.swift
//  Adopet
//
//  Created by Guilherme Moreira Soares on 22/05/26.
//

import Foundation

enum NetworkingError: Error {
    case networkError(Error)
    case dataUnavailable
    case decodingError(Error)
    case urlUnavailable
}

protocol NetworkingProtocol {
    func request<T:Decodable>(_ url: URL, completion: @escaping ((Result<T, NetworkingError>) -> Void))
}

class URLSessionNetworking: NetworkingProtocol {
    func request<T>(_ url: URL, completion: @escaping ((Result<T, NetworkingError>) -> Void)) where T : Decodable {
        URLSession.shared.dataTask(with: url) { (responseData, _, error) in
            if let error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = responseData else {
                completion(.failure(.dataUnavailable))
                return
            }
            
            do {
                print(String(data: data, encoding: .utf8) ?? "nil")
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    
}
