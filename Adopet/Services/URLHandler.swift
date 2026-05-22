//
//  URLHandler.swift
//  Adopet
//
//  Created by Guilherme Moreira Soares on 21/05/26.
//

import UIKit

class URLHandler {
    func openUrl(url: URL,
                 options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
                 completionHandler completion: (@MainActor @Sendable (Bool) -> Void)? = nil) {
        UIApplication.shared.open(url, options: options, completionHandler: completion)
    }
    
    func canOpenUrl(url: URL) -> Bool {
        return UIApplication.shared.canOpenURL(url)
    }
}
