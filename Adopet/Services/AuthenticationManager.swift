//
//  AuthenticationManager.swift
//  Adopet
//
//  Created by Guilherme Moreira Soares on 21/05/26.
//

import Foundation

enum AuthenticationManagerError: Error {
    case loginFailed(String)
}

protocol AuthenticationProvider {
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, AuthenticationManagerError>) -> Void)
}

class GoogleAuthenticationProvider: AuthenticationProvider {
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, AuthenticationManagerError>) -> Void) {
        print("Login with Google")
        completion(.success(true))
    }
}

class FacebookAuthenticationProvider:AuthenticationProvider {
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, AuthenticationManagerError>) -> Void) {
        print("Login with Google")
        completion(.success(true))
    }
}

class AuthenticationManager {
    
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, AuthenticationManagerError>) -> Void) {
        // Valores mockados para propósitos de ensino
        let mockEmail = "johndoe@gmail.com"
        let mockPassword = "123"
        
        DispatchQueue.main.async {
            if email == mockEmail && password == mockPassword {
                completion(.success(true))
            } else {
                completion(.failure(.loginFailed("Usuário ou senha incorretos.")))
            }
        }
    }
}
