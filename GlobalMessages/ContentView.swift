//
//  ContentView.swift
//  GlobalMessages
//
//  Created by Dongjun Lee on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.showMessage) private var showMessage
    var body: some View {
        VStack {
            Button("Add Customer") {
                //showMessage("Operation Failed.")
               // showMessage("Success!", .success)
                showMessage("Info!", .info)
            }
        }
//        .sheet(isPresented: $isPresented, content: {
//            UpdateProfileScreen()
//                .withMessageView()
//        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    ContentView()
         .withMessageView()
}
