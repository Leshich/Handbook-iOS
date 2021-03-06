//
//  Misc.swift
//  Handbook
//
//  Created by Алексей Агапов on 03/04/16.
//  Copyright © 2016 ru.urfu. All rights reserved.
//

import Foundation
import Watchdog
import Loggerithm
import PhoneNumberKit

let watchdog = Watchdog(threshold: 0.6, strictMode: true)

let log = Loggerithm()

extension UIApplication {
  
  class func appVersion() -> String {
    return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
  }
  
  class func appBuild() -> String {
    return NSBundle.mainBundle().objectForInfoDictionaryKey(kCFBundleVersionKey as String) as! String
  }
  
  class func versionBuild() -> String {
    let version = appVersion(), build = appBuild()
    
//    return version == build ? "\(version)" : "\(version)(\(build))"
    return "\(version)"
  }
}

func urlPhoneNumber(phone:String) -> String {
  let ph = phone.stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("+", withString: "").stringByReplacingOccurrencesOfString("-", withString: "")
  return ph
}

func beautyPhoneNumber(phone:String) -> String? {
  do {
    let phoneNumber = try PhoneNumber(rawNumber:phone, region:"RU")
    return phoneNumber.toInternational()
  } catch {
    return nil
  }
}