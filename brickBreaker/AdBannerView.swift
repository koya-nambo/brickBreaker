//
//  AdBannerView.swift
//  tapApp
//
//  Created by 南房航哉 on 2022/07/18.
//

import SwiftUI
import GoogleMobileAds

struct BannerAdView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: GADAdSizeBanner)
        // テスト用広告ID:ca-app-pub-3940256099942544/2934735716
        // 本番用広告ID:ca-app-pub-7398138440100496/7855776773
        banner.adUnitID = "ca-app-pub-7398138440100496/7855776773"
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        banner.rootViewController = window?.rootViewController
        let gadRequest = GADRequest()
        gadRequest.scene = windowScene
        banner.load(gadRequest)
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}
