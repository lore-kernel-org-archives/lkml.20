Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D53A2E3F;
	Thu, 27 Aug 2026 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817179; cv=none; b=FObLwRaLT1FfnB8zc86h+KwDmk4dJbhFSqEnCq5e7KeYniYqPpMDSLYNwD1BwFby/9HC0tSnMb+FrsVGnvfVBm0ihAIp2L7DuhfKHTDYSJWBVtO4x8tYsJSc5l8YDuWk18NL0gakQQ+SUA6INVo/XNH3kwYxgQLNcB+hragrX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817179; c=relaxed/simple;
	bh=hu4EZ+RzchbMV8HoxFG3hqm+5SaKSMT08Ev4y9Q3UMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDABssk/tsjMVWdAtfmZ1wodEVumf59l6m2USmkyldzuh2bDWlT5rc3BV1bOLj8gdk3uzwEHoPBwyT0/A+Ma730+VW+DeeoBn3PXb1jD0aCoQ/dIzMgVihavcD353KYqo/kSReW9HifAuENF7K3/Mm+4xCUQDA9YY8Qe9VDpiyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pM7dj9n/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pM7dj9n/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED875C4AF0B;
	Thu, 27 Aug 2026 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787817179;
	bh=hu4EZ+RzchbMV8HoxFG3hqm+5SaKSMT08Ev4y9Q3UMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pM7dj9n/6ukVZJTwQzg+omEI+ywADUze0J5mvk9QSybTcXV1i68tSfw8TfXd6IwyF
	 twFN4IzGxoWTaUIHBka996U+SkegspL/kzNWuKKdtisGYyBAnTmN3QZnU6XllZzQO2
	 VpA7Bc8tXapOMTeucCzsJ9Sk7137pNveUNZ6gJPVvVdcPtRsCytTjc0jR9u3eTbud6
	 jc1eowkZCUcF3128cspmXK5Ty1nhXNGUkhyewoYFiFKY0YGOo8EGhU31HwPBzS0Raj
	 d0JFsWM07wrhbEo4uGQy5jwkXmJCJ2BMk1IpY1ZchiuktNCQZdK5uYj5qmyho/3fUk
	 35A06IvgzKkzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBB0C61DC7;
	Thu, 27 Aug 2026 07:52:58 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 27 Aug 2026 09:52:49 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio
 playback support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
In-Reply-To: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787817176; l=1351;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=7xkjdxOijSp8eM/DKmvoe1hNzfXCqUIYUtM74xYVJGw=;
 b=1iaEPMNaAOFOZtYc0BXthpLHOKrtbjEjgfwWY2HfhD/umsVxNMJpsk9O110OstDMcoPDoW7ag
 uqfjJt2VvVyDbilHT+CVyguKfajGGrdAg4bTc57xytBlpxstQayV9+e
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The X13s sound card has no DAI links for the Type-C DisplayPort
controllers, so those playback paths never show up. Add DP0 and DP1
links using the existing mdss0_dp DAIs and DISPLAY_PORT_RX_{0,1}.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 467e14ca21e56..bd4b4cb6245cf 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1215,6 +1215,38 @@ &sound {
 		"VA DMIC2", "MIC BIAS3",
 		"TX SWR_ADC1", "ADC2_OUTPUT";
 
+	dp0-dai-link {
+		link-name = "DP0 Playback";
+
+		codec {
+			sound-dai = <&mdss0_dp0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	dp1-dai-link {
+		link-name = "DP1 Playback";
+
+		codec {
+			sound-dai = <&mdss0_dp1>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
 	wcd-playback-dai-link {
 		link-name = "WCD Playback";
 		cpu {

-- 
2.53.0


