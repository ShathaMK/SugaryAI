//
//  TestView.swift
//  SugaryAI
//
//  Created by Shatha Almukhaild on 04/09/1446 AH.
//

import SwiftUI

struct TestView: View {
    @State private var viewModel = CameraViewModel()
    
    var body: some View {
        CameraView(image: $viewModel.currentFrame)
            .ignoresSafeArea()

    }
}

#Preview {
    TestView()
}
