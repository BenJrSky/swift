//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Benito Massidda on 17/11/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @State var scannedCode: String = ""
    
    
    var body: some View {
        
        
        NavigationStack{
            
            VStack{
                ScannerView(scannedCode:$scannedCode)
                    .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(scannedCode.isEmpty ? "Not yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
                    
            }
            .navigationTitle("Barcode Scanner")
        }
        
        
    }
    
    
}

#Preview {
    BarcodeScannerView()
}
