//
//  AdInterstitialView.swift
//  tapApp
//
//  Created by 南房航哉 on 2022/07/31.
//

import GoogleMobileAds

class Interstitial: NSObject, GADFullScreenContentDelegate, ObservableObject {
    @Published var interstitialAdLoaded: Bool = false
    var InterstitialAd: GADInterstitialAd?

    override init() {
        super.init()
    }

    // リワード広告の読み込み
    func LoadInterstitial() {
        
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-7398138440100496/6631121176", request: GADRequest()) { (ad, error) in
            if let _ = error {
                self.interstitialAdLoaded = false
                return
            }
            self.interstitialAdLoaded = true
            self.InterstitialAd = ad
            self.InterstitialAd?.fullScreenContentDelegate = self
        }
    }

    // インタースティシャル広告の表示
    func ShowInterstitial() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let root = window?.rootViewController
        if let ad = InterstitialAd {
            ad.present(fromRootViewController: root!)
            self.interstitialAdLoaded = false
        } else {
            self.interstitialAdLoaded = false
            self.LoadInterstitial()
        }
    }
    // 失敗通知
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        self.interstitialAdLoaded = false
        self.LoadInterstitial()
    }

    // 表示通知
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        self.interstitialAdLoaded = false
    }

    // クローズ通知
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        self.interstitialAdLoaded = false
    }
}
