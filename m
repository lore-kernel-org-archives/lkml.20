Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641521;
	b=Q/LzdN5ZJCvkKZfyuMTf7EwgdUiUPLiSrwL3marx7auz1rYyMLQmkzyLkpBiHK8JlxkL
	 1bYFDtivt4qU7zD27C4YHSxKjLBh4tkaFpFaRJW+04ncQYetGaIa88/aD///iiKVnMsaC
	 12eJsmAx1ozdrwXevEKnU8NJqVUCbtsNnGa2Ydu+qTej0iUvKxdiMgKGRnUMI9yzk5QMu
	 NnppH3pcdzodh5y9kcRZ6eF7TLHRzYMAsMLLpmflJZnF2JkaHixhTY6dH/wiSuc2odiS4
	 pB7JG5gO0aeom259iz8ZrLAocZ/mpxOEuHK6hjVohbS53WvJ6roK107FIZSoQqk+s8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=druvbJvBN6ko55G4pQr8mGOqphalakbTk9dYFbwjgLM=;
	b=UOD/cPr2+FJBlixGdjIs0K1aCf0jGx9UtqSVQ61zsSUZ3eQiUw6js/o+0StyRUuYo2UW
	 p5wBEi1fjsswyrLkvqq3vRDmk1iR2/d4CPxJW1okINyWabnCp+7vdK51dDKQ3Zr2VBIne
	 CNs5q3PuVt8P1c9mdCaSYeTbm7egrZMnfAdk8fm6mcVQh15KvpdV5K+k9YrzD1NKJjrhP
	 8nijL8EfmKQqcleVcRmDHL/k9sE2yJjGRaz8ZuwPv/3Dqfu2B4GFoIZPnk+4HCRWhumgE
	 A2qu1brDsRIX2ZX6ImVDGaFADqFuoz56ZsicXjbmNJIQjnA15R3iO317wN9Fq4nHdoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd6lo9yE;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EDB60850A5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EDB60850A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd6lo9yE
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so3201700eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641520; x=1794246320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=druvbJvBN6ko55G4pQr8mGOqphalakbTk9dYFbwjgLM=;
        b=yd6lo9yEWuJUMl/+aP8HN/dtgpx5uQ8WW6Bc1IV4WBj+cefC1XxQftpQqCPoWVqBDz
         N40TxHXTAY62ONZLRupG5OGeYB7sO/8Qq3f9wLtCjEvtG3zxXfn9tp2mbxlhCvFOTMmH
         AB+9B4D0Np9BS9YcpbJRVHjoxQYEowFcXJq0iwKxynkx+wxRvDMcEFTptyrCgQi93mVO
         2ZvLeoJN8VVVlIektlJfwSKxSimSqLRmcqO3FFDxX2BthAmXUMTXB84JSStR+RDRVInd
         TdLhPiGDPK9zH/bTfgb8W2f0IpIyrrFUVygHAf7hETB+4t+d2bt1R4kM/ZTGJuFvvXB6
         kFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641520; x=1794246320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=druvbJvBN6ko55G4pQr8mGOqphalakbTk9dYFbwjgLM=;
        b=EOWHjedyFJOlXA3abmf/Ru78wSaE302sH9vxuxpXORKDSgCpjGM3w25TVxi9Dip17D
         hc48Qq3blwCNqwMkonSpLCMw/ez0DMH0s2JkT5O49W7g96+lHj/UDNHzxYVTEMZ/rPcL
         CEVOVp6Wcca0e0AhY4xy2j4o1duSXlWTpnJMH31m2WlFA9iR2fvla78HwYv2tH8a7fHq
         p1HH72wPXMqorJTG/ooDZBRDotptnrYXPjbJj25PnJvrpPzvVw3+D1WieehNLnWNGIyy
         ECwZq8b1VJ0vQkmx9lrktrsL0ewR620Cj/fcrbUuGJVwVh4xS7aDtemccqbZGDe/JpRF
         LeKA==
X-Forwarded-Encrypted: i=1; AKwUvByWI5bi92AHaXoyFfGJ3DsRPqSjzvslGRdEeqC8Am7fZbXHcyMoLJKqsacoURjLTo+M6NkBGcruJ0BMA4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLExxGkLeFP+KsnhC+kx8QR42zhGu+MzEGxDXYiF2pZrkvsk0tE
	1Dd7Xi8Pq8hZ3WydmRtJbRhtELw359M5yZPfp36cWhi13J+dYYeDPxbn
X-Gm-Gg: AYBFou1LV0/+Zha8Il30FNfio0g40VomJFVFs4fX3WcPhIzMoKP/jrhCGlG2Hg2HBRg
	uG0ISP/kB5K5YlJCUFY9fzrropZXwJOIzp33wa/h3oFcL6w3S6UqlijXf4rYAAdBJZorWYEIAEQ
	MuoDEYWhK8sey9dzUtDxvtOzSIHThobLyV8W/KQxHTUpIFeILKYkvhCuUQTDlfVpOhiiiDvpiSZ
	xGQQb8D9wWKoeJJkR+/J/zB/0PBJcIG3QOyPG2catUgl+DKKE+uqecYSRcVro7knBxUAezCaRH/
	Tx0PRnSmq1lCEKp5FKiPxgayxut+sj2Je8ivLTuLBhCzbzu613wMLqmvvd+ASDQMR9T60nwT7wU
	yVlumfgUujLnnH+dz0415KgaRo6PxhrlxIj7/z6K+co0uw4AOs0FpdXm88DypcYTf/RlRQhCtly
	x39mZ8RFW2j1D6KuS08SnO0US6DINZ0uNNzVsEBkPBWBX3kGGTElC7T5pwa/fgDB/uBaSbZ53+I
	u7lqcDVhUsT53Hkw6gT+MBRzCKUU/9xkpQsTHaZVOzXvV3PDFhOC9ddo6BbiQS4D+XWTgVFp5nk
	izvqzuQsnG3luoETact0UH4FKag=
X-Received: by 2002:a05:693c:6316:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-36a7bb74690mr123492eec.34.1793641520162;
        Mon, 02 Nov 2026 09:45:20 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:19 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Tue,  3 Nov 2026 01:44:49 +0800
Message-ID: <20261102174450.3000397-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the Ariaboard Photonicat runs on battery, the USB port has no power
output and attached devices are not detected. With the external supply
connected, the same port works fine.

Per the schematic, the 5V_OUT rail that feeds the USB load switch (U12,
enabled by USB_HOST_PWREN_H) is the OR-ed combination of two sources:
- VCCIN_5V (external DC input), OR-ed via D16.
- 5V_BOOST from the VBAT boost converter (U16, enabled by BOOST_EN /
  GPIO4_D2), OR-ed via D5002.

The 5V_OUT rail has no enable pin of its own. Since the regulator
framework can only model a single power supply dependency per
fixed-regulator, add a regulator_5v_boost node for the VBAT boost
converter, and a regulator_5v_out node to represent the OR-ed 5V_OUT
rail. Bind the vin-supply of regulator_5v_out to regulator_5v_boost to
ensure VBAT is boosted when the system runs on battery. When VCCIN_5V
is present, D16 takes over.

The USB load switch (vcc5v0_usb30_otg0) is then supplied by
regulator_5v_out. This restores USB host functionality on battery
power, matching the vendor firmware behaviour.

Link: https://github.com/immortalwrt/immortalwrt/issues/1534
Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 15,18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Cc: stable@vger.kernel.org
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 7e0a2ab829209..290e3ee97c709 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -59,6 +59,47 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	regulator_5v_boost: regulator-5v-boost {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_en>;
+		regulator-name = "5v_boost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vbat>;
+	};
+
+	/*
+	 * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
+	 * and VCCIN_5V (via D16).
+	 * It has no enable pin of its own.
+	 * Model it as a fixed regulator depending on the boost converter,
+	 * so that VBAT is boosted when running on battery.
+	 *
+	 * 5V_OUT supplies:
+	 * - VCC5V0_USB30_OTG0 (USB VBUS via U12 load switch)
+	 * - VCC5V_HDMI (HDMI 5V via D5000)
+	 * - J53 expansion header (Pin 1)
+	 */
+	regulator_5v_out: regulator-5v-out {
+		compatible = "regulator-fixed";
+		regulator-name = "5v_out";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&regulator_5v_boost>;
+	};
+
+	vbat: regulator-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_1v8";
@@ -148,7 +189,7 @@ vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
 		regulator-name = "vcc5v0_usb30_otg0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&regulator_5v_out>;
 	};
 
 	vccin_5v: regulator-vccin-5v {
@@ -446,6 +487,12 @@ pcie_pwren_h: pcie-pwren-h {
 		};
 	};
 
+	power {
+		boost_en: boost-en {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc0 {
 		sdmmc0_pwren: sdmmc0-pwren {
 			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.47.3

