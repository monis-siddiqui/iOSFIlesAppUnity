//
//  SwiftForUnity.swift
//  SwiftPlugin
//
//  Created by Monis on 17/10/2019.
//  Copyright © 2019 Monis. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

@objc public class SwiftForUnity: UIViewController {
    
    
      @objc static let shared = SwiftForUnity()
    let viewController =  UIApplication.shared.keyWindow?.rootViewController
      @objc func getFilePath(){
        importFiles()
      }
    
    func importFiles() {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypePlainText as String], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        viewController?.present(documentPicker, animated: true, completion: nil)
    }

    
}

extension SwiftForUnity: UIDocumentPickerDelegate{

    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        UnitySendMessage("Callback", "OnRecieveFileURL", urls.first?.absoluteString)
    }
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("Entre a documentPicker")
    }
}

