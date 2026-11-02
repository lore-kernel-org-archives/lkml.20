Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639958;
	b=Ftui1ctPbBxZ2SttYi5wSMNeiAAEwFt9XAh4HltmZx5EruIjFHAzJJivf+TxzO8JfFhe
	 i09hlDAin4Rl/Rj+pxGSH7zgE5pPhOfuYwoflAVb/LtOHtprOl0rZHRrKIz/Dzg3D4q7Q
	 htSeW3wQponamigGdPTu4ocdECV7nwXRzAj6GYoyFA96/FTVNpiTJFUb+lphkjfXnskoh
	 a6G1XJuKoFZTpBIeRudi7BpPt5jwxxjYo6ZG88jeYkW+tVg5x6JKtFLSYnQiimsId6Jjb
	 fE5ZzblckjF6WU2W/AnqMaljZFv7NhiuXS6KCaGhbWu6gDGyth75it283UAYhVaAzRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8UsCKoNbKnaX6mGeBQ8/pSx+fuQaOrU6twLBEIFwNZU=;
	b=IzRNOwoX2jFFQAqRYSyi82OPeffK0ERVkKnvzqUtv3/SbwOY6PWBuy4XUJY0Hv3a+dCs
	 VO0rOnE9JD+froa6kaFfIPOTZ3cRI+TWtzODdr6IvZ4JcJl+YtdvDFb2AquosZBCsJXlK
	 9PKz5QO0nxcMLDBbcyJaLp06rqJMs8euzrLBmQy/bud7kYVIaJ4CBQnYgcOi+kRGLXA2J
	 agBayRBt89vC2+OxdS7Wxxe4bTotGoJPoqXJjzxXcUojbyJS+9bhVbe+WkZzzCqisAcTs
	 Lv+1VRej/aOCYU9rqYYJpiRHEw7/zs3d4cpEPQI+wnj+xNfloaGfHisdvO9SmUJNs8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="df/dOuei";
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965916087625
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965916087625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=df/dOuei
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so573164c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639957; x=1794244757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UsCKoNbKnaX6mGeBQ8/pSx+fuQaOrU6twLBEIFwNZU=;
        b=df/dOuei8USjYH6md+Amf5NygtNA0arfOmQ7OMpPOsPVzqPNPTpCnZ3ml9/6iYbyz3
         JimNLgdSgLDTchTLwIHQqEfLV0oQhY3QgEssncjnflo37qZsvjjg0af97Z+v9ztRtkYI
         L6x+9NJzqYo2BDpO1FBgxqvlE57rP2K1dwUkdhiMPOhJ2/Js17D/GjP2PtPAWSNqFwqp
         ccWMb0h57kH2xzTi0bDzglIDdjtGsHJ1Y+wMcXDTBxJGyWlJ4sxXY/9EEHojINm6bvcM
         bd5vGoGfGIFmfz9Xltfgk0zhPxHoF7zXmY5KcucDVIN7lvkN7H2JAi/bv9EDA8W9DY/H
         RxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639957; x=1794244757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UsCKoNbKnaX6mGeBQ8/pSx+fuQaOrU6twLBEIFwNZU=;
        b=TLEFphjmMvVeIdw9DN84WcII+AbKa+DPboCUusgIztFpSw+5pJRsxituSz/Knh+Ge9
         pP98PhNjoUEwaXHkjwvefK/5DRkHMMqRdG/e011VCPS4RoXv+puUPr45tdEgmIspTbay
         bJvAiEntLHsXX/D8Qd5MDb/7WMJMI1/gHWUGAKX1iJjnXgS9p8uV4Y0xIvGG4pYAIAZn
         E7cRlDCZsRCVcE4/aoLMC9R1SbISzrU4CeiAeT/3cdPoZpUIYDXRRw1RDho9uTiHdAYM
         w2wDnpgv45gzGN5ZuDd96g8bG565jlE8dTDYldxZ/xMcT8LppYlF2aVM+0y7Nk9OfQmf
         lSUg==
X-Forwarded-Encrypted: i=1; AKwUvBycDcRHO16y8KaOxLj8h3CdBe49FZDlXoeRscq8VqTtLwTKJR9kd6XPL5sEj2nNQna3rJ6P5r03X03lJn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NPSEEt8B9+3i2W/+UzGELQh4XxLdko0qjj26hd3haBRlM1Wjw
	xKiMewBOYZdZt6R8Bx5VK6xEXHowHoDLThCZT6VyqUmpkEDvEHHtz6cd
X-Gm-Gg: AYBFou10cl4hEP/TigQeRBKFiTWzMKpGy4cqWTJth46382k5m404jvmOhztgd3umQvH
	xgcPBf8O+YFJnrSGE6pBps8ioLB/pLWtmL4xe3bdNyiE3NBREj7luVb4+Qa8G6t+5bzhXRmWv6+
	/9lcJ/LxpuOLeRbwsQx/CUBUq+x8tYIuP9gDJFisyRfoNkyWwgLahxvqOfHM5Gk+1QYeHRRwhcd
	RZXeanw1+9Bunsqe9B0adBqKAYQHX8jh1cYuvK7dVqM4yyjhXBm0edWuwPy4OlSbP658U7WAV8D
	dseNjvGHenGQU0MkkDWZB+XurdXP4+UEfo6ww4h5iP4RSNiRnprNN7Sj1EJ/50ZwQuDJYg8mvfx
	BiO/q0C1kpt2pCrE3rF284VxUE7bRcbSUvzjqOShCUaik5gFXBsVO7Iai5EMIhsRiYU7K9uVABq
	4ke5wIWudQwCd54EasdaxA1gS6A3NBoDyAQaDRsZ5OGLilirRcrTBQAGHFaD64rE/g1U5vOVt+Q
	0MIXiEfJtJsNwhYREuSfC9WlY9KySHG9mqxouJZaPBEQzQjXTWBD28tdYYeKH2nQKhKUs5cBUvG
	PY84VnHOifJLmGNWQAtSknh5IZ4=
X-Received: by 2002:a05:7300:c00c:20b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36a422039cdmr18657739eec.1.1793639956509;
        Mon, 02 Nov 2026 09:19:16 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:15 -0800 (PST)
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
Subject: [PATCH v2 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Tue,  3 Nov 2026 01:18:37 +0800
Message-ID: <20261102171838.2958552-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
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
fixed-regulator, add a v5v_boost node for the VBAT boost converter, and
a v5v_out node to represent the OR-ed 5V_OUT rail. Bind the vin-supply
of v5v_out to v5v_boost to ensure VBAT is boosted when the system runs
on battery. When VCCIN_5V is present, D16 takes over.

The USB load switch (vcc5v0_usb30_otg0) is then supplied by v5v_out.
This restores USB host functionality on battery power, matching the
vendor firmware behaviour.

Link: https://github.com/immortalwrt/immortalwrt/issues/1534
Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 15,18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Cc: stable@vger.kernel.org
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 7e0a2ab829209..11ac78acca3be 100644
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
+		regulator-min-microvolt = <3400000>;
+		regulator-max-microvolt = <4200000>;
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
+		vin-supply = <&regulator_5v_boost>;
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

