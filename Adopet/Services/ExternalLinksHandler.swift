//
//  ExternalLinksHandler.swift
//  Adopet
//
//  Created by Guilherme Moreira Soares on 21/05/26.
//

import UIKit

class ExternalLinksHandler {
    
    private var urlHandler: URLHandler
    
    init(urlHandler: URLHandler = URLHandler()) {
        self.urlHandler = urlHandler
    }
    
    func openTelephoneUrl(phoneNumber: String) {
        if let phoneNumberURL = URL(string: "tel://\(phoneNumber)") {
            urlHandler.openUrl(url: phoneNumberURL, options: [:], completionHandler: nil)
        }
    }
    
    func openWhatsapp(phoneNumber: String, petName: String) {
        guard let whatsappURL = URL(string: "whatsapp://send?phone=\(phoneNumber)&text=Olá! Tenho interesse no pet \(petName)") else {
            return
        }
        
        if urlHandler.canOpenUrl(url: whatsappURL) {
            urlHandler.openUrl(url: whatsappURL, options: [:], completionHandler: nil)
        } else {
            openWhatsappInAppStore()
        }

    }
    
    func openWhatsappInAppStore() {
        guard let appStoreURL = URL(string: "https://apps.apple.com/app/whatsapp-messenger/id310633997") else {
            return
        }
        
        urlHandler.openUrl(url: appStoreURL, options: [:], completionHandler: nil)
    }
}
