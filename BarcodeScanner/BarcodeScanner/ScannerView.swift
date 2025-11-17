//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Benito Massidda on 17/11/25.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    
    @Binding var scannedCode:String
    
    func makeCoordinator() -> Coordinator {
       Coordinator(scannerView: self)
    }
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
    
        func didFind(barcode: String) {
          
            print(barcode)
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
        
        
    }
   
}


