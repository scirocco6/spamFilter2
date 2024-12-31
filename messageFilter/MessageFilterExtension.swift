//
//  MessageFilterExtension.swift
//  messageFilter
//
//  Created by 0110 on 11/21/24.
//

import IdentityLookup

extension UserDefaults {
    static let shared = UserDefaults(suiteName: "group.provenance-six.provenance")!
    static let filterEnabledKey = "isFilterEnabled"
}

final class MessageFilterExtension: ILMessageFilterExtension {}

extension MessageFilterExtension: ILMessageFilterQueryHandling, ILMessageFilterCapabilitiesQueryHandling {
    func handle(_ capabilitiesQueryRequest: ILMessageFilterCapabilitiesQueryRequest, context: ILMessageFilterExtensionContext, completion: @escaping (ILMessageFilterCapabilitiesQueryResponse) -> Void) {
        let response = ILMessageFilterCapabilitiesQueryResponse()

        // TODO: Update subActions from ILMessageFilterSubAction enum
        // response.transactionalSubActions = [...]
        // response.promotionalSubActions   = [...]

        completion(response)
    }

    func handle(_ queryRequest: ILMessageFilterQueryRequest, context: ILMessageFilterExtensionContext, completion: @escaping (ILMessageFilterQueryResponse) -> Void) {
        let response = ILMessageFilterQueryResponse()
        
        // Always use the shared container in the extension
        let shared = UserDefaults(suiteName: "group.provenance-six.provenance")
        let isFilterEnabled = shared?.bool(forKey: "isFilterEnabled") ?? true
        
        response.action = isFilterEnabled ? .junk : .none 
        completion(response)
    }
}
