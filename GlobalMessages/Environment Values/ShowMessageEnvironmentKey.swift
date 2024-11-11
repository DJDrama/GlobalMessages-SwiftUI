//
//  ShowMessageEnvironmentKey.swift
//  GlobalMessages
//
//  Created by Dongjun Lee on 11/11/24.
//

import Foundation
import SwiftUI

enum MessageType {
    case error
    case info
    case success
}

struct ShowMessageAction {
    typealias Action = (String, MessageType) -> ()
    let action: Action
    
    func callAsFunction(_ message: String, _ messageType: MessageType = .error) {
        action(message, messageType)
    }
}

struct ShowMessageEnvironmentKey: EnvironmentKey {
    static var defaultValue: ShowMessageAction = ShowMessageAction { _, _ in }
}

extension EnvironmentValues {
    var showMessage: (ShowMessageAction) {
        get { self[ShowMessageEnvironmentKey.self] }
        set { self[ShowMessageEnvironmentKey.self] = newValue }
    }
}


