//
//  Target_MessageModule.swift
//  MessageModule
//
//  Created by chenweiqiang on 2020/5/27.
//

import UIKit

open class Target_MessageModule: NSObject {
    
    @objc open func Action_mainViewController(_ param: [AnyHashable: Any]) -> UIViewController {
        
        let vc = MessageViewController()
        guard let userId = param["userId"] as? NSString else { return vc }
        vc.userId = userId as String
        return vc
    }
}
