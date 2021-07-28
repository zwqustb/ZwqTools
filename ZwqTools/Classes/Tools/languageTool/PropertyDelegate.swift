//
//  PropertyDelegate.swift
//  ZwqLife
//
//  Created by 张文强 on 2021/7/12.
//  Copyright © 2021 zwq. All rights reserved.
//

import Foundation
@propertyWrapper struct UserDefault<T> {
    let key: String
    let defaultValue: T
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }

}
struct GlobalSettings {
    @UserDefault(key: "isFirstLanch", defaultValue: false)
    static var isFirstLanch: Bool

    @UserDefault(key: "uiFontValue", defaultValue: 14)
    static var uiFontValue: Float
    
    @UserDefault(key: "myFileName", defaultValue: "zwq")
    static var curFileName: String
}
