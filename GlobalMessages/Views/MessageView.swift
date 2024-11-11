//
//  MessageView.swift
//  GlobalMessages
//
//  Created by Dongjun Lee on 11/11/24.
//

import SwiftUI

struct MessageView: View {
    @Binding var messageWrapper: MessageWrapper?
    
    private var backgroundColor: Color {
        guard let messageType = messageWrapper?.messageType else {
            return .clear
        }
        
        switch messageType {
        case .error:
            return .red
        case .info:
            return .blue
        case .success:
            return .green
        }
    }
    
    var body: some View {
        Text(messageWrapper?.message ?? "")
            .frame(width: 300)
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .foregroundStyle(.white)
            .task(id: messageWrapper?.id) {
                try? await Task.sleep(for: .seconds(messageWrapper?.delay ?? 2.0))
                guard !Task.isCancelled else { return }
                withAnimation {
                    messageWrapper = nil
                }
            }
    }
}

#Preview {
    MessageView(messageWrapper: .constant(MessageWrapper(message: "This is an error message.", messageType: .error)))
}
