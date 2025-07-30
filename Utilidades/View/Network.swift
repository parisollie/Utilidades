//
//  Network.swift
//  Utilidades
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

//Vid 307 
import SwiftUI
import Network
struct Network: View {
    
    @StateObject var monitor = NetworkMonitor()
    
    var body: some View {
        VStack{
            //Traemmos la imagen de internet 
            Image(systemName: monitor.isConnected ? "wifi" : "wifi.slash")
                .font(.system(size: 56))
            Text(monitor.isConnected ? "Conectado" : "No conectado" )
                .padding()
        }
    }
}

//Vid 307,para ver si tenemos internet
class NetworkMonitor : ObservableObject {
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "monitor")
    
    @Published var isConnected = true
    
    init(){
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                //Nos dice si estamos conectados
                self?.isConnected = path.status == .satisfied ? true : false
            }
        }
        monitor.start(queue:queue)
    }
    
}

