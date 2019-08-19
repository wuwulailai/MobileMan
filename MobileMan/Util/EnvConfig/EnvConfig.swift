//
//  Environment.swift
//

import Foundation

public class EnvConfig {
    
    public enum State: String, CaseIterable {
        case development
        case production
        case staging
        case testing
    }
    
    public static let instance = EnvConfig()
    public let stateDefaultKey: String = "default.config.environment"

    public var state: State {
        return environmentState(for: stateDefaultKey)
    }
    
    private init() { }
    
}

extension EnvConfig.State: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        switch self {
        case .development: return "开发环境"
        case .production: return "生产环境"
        case .staging: return "预发布环境"
        case .testing: return "测试环境"
        }
    }
    
    public var debugDescription: String {
        return description
    }
    
}

extension EnvConfig {
    
    public func setEnvironmentState(_ state: State, for key: String? = nil) {
        let storageKey = key ?? stateDefaultKey
        UserDefaults.standard.set(state.rawValue, forKey: storageKey)
        UserDefaults.standard.synchronize()
    }
    
    public func environmentState(for key: String? = nil) -> State {
        let storageKey = key ?? stateDefaultKey
        guard let rawValue = UserDefaults.standard.string(forKey: storageKey) else { return .production }
        guard let state = State(rawValue: rawValue) else { return .production }
        return state
    }
    
}
