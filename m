Received: from mta0.migadu.com (out-234.mta0.migadu.com [91.218.175.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF1048C400
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783859; cv=none; b=QqkNBemMMUOOnf1gqnJz/Z8OYPg0OcKTspWk6LylxgXWpuzDdUPg8G88Qh/uOkW/2QVWVnkszCHdpe15rnakaAhMyt5R0ZN71bi8ck5U8ysaulCN+CClnijrzKaKIjB3IeX0seKgvvU7g564hoKQXXTX0vd/t0y/Zma9bOj/kJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783859; c=relaxed/simple;
	bh=SF/BkZtpH0zsCxHBAMSG1N4uiarb4RpMqqndpLESzpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgiyU47hJXPu2bFOcDtima3j45r9D8yU8v1zpx3B5dTYdSXtoQRHceG73UqfHjf45yj4YWkEG0llRbue+sFq7i9/D5q4DY4jcWa55CnObUrcFaFE/tmdRXTc6oN7GfeFKAUkoJIMUFMCchFgI0dfj6SmL5ATJCp6euJ8Tv7ti3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=FRYZQmoe; arc=none smtp.client-ip=91.218.175.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="FRYZQmoe"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SF/BkZtpH0zsCxHBAMSG1N4uiarb4RpMqqndpLESzpM=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788783853; v=1; x=1789388653;
 b=FRYZQmoecxHbJ5NnFqczQslCfYBKKNccGYKs4/YKldQ7GMd7/Gy2VpeF5yWEbB2geI9V1WLr
 oagbSGaJXhVXKI37RrdqbTHGjG2FAbXCwAaQUTTEhyWV/+3tq1HcNxjZLM4sQPPlSC6d7s27+Bv
 2U27SicqEujYgtNdFDVERBMGludnpOJm1XI3aasEBsiSqaaE4BCm/t/Aq2X8Lp84PeQuWqW5gHa
 ODbxg9DKNCTey2alyI4z3ieV8JVIDWdz3ifT2BHlx382TMdr8zSXWF63R3fs+po/UI5QTtBUdcL
 5Fsh9pv7KJnE3BmbZBUxCkLzcDkH7ZGlAyoak1b0rhPaQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b80fe7de94c76630;
	Mon, 07 Sep 2026 12:24:12 +0000
X-Mizu-Trace-ID: b80fe7de94c76630
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: Move sound cards to board files for NanoPC-T6
Date: Mon,  7 Sep 2026 14:22:44 +0200
Message-ID: <20260907122406.1862398-3-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907122406.1862398-1-diederik@cknow-tech.com>
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NanoPC-T6 and the NanoPC-T6-LTS both have a Realtek ALC5616 audio codec.
But the NanoPC-T6 Plus has an Everest ES8389 audio codec. So move the audio
definition which is not shared among all boards to the individual board files.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 39 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dts    | 39 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 36 +----------------
 3 files changed, 79 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
index 0ee67ee24f3c..32f9b313b5d6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
@@ -30,6 +30,45 @@ vcc5v0_usb20_host: regulator-vcc5v0-usb20-host {
 	};
 };
 
+&analog_sound {
+	compatible = "simple-audio-card";
+	label = "Onboard Analog Realtek ALC5616";
+
+	simple-audio-card,format = "i2s";
+	simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+	simple-audio-card,mclk-fs = <256>;
+	simple-audio-card,name = "realtek,rt5616-codec";
+
+	simple-audio-card,widgets =
+		"Headphone", "Headphones",
+		"Microphone", "Microphone Jack";
+	simple-audio-card,routing =
+		"Headphones", "HPOL",
+		"Headphones", "HPOR",
+		"MIC1", "Microphone Jack",
+		"Microphone Jack", "micbias1";
+
+	simple-audio-card,cpu {
+		sound-dai = <&i2s0_8ch>;
+	};
+
+	simple-audio-card,codec {
+		sound-dai = <&rt5616>;
+	};
+};
+
+&i2c7 {
+	rt5616: codec@1b {
+		compatible = "realtek,rt5616";
+		reg = <0x1b>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pinctrl {
 	usb {
 		usb20_host_pwren: usb20-host-pwren {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts
index 40290a81bb9d..40ea1079a928 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts
@@ -27,6 +27,45 @@ vdd_4g_3v3: regulator-vdd-4g-3v3 {
 	};
 };
 
+&analog_sound {
+	compatible = "simple-audio-card";
+	label = "Onboard Analog Realtek ALC5616";
+
+	simple-audio-card,format = "i2s";
+	simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+	simple-audio-card,mclk-fs = <256>;
+	simple-audio-card,name = "realtek,rt5616-codec";
+
+	simple-audio-card,widgets =
+		"Headphone", "Headphones",
+		"Microphone", "Microphone Jack";
+	simple-audio-card,routing =
+		"Headphones", "HPOL",
+		"Headphones", "HPOR",
+		"MIC1", "Microphone Jack",
+		"Microphone Jack", "micbias1";
+
+	simple-audio-card,cpu {
+		sound-dai = <&i2s0_8ch>;
+	};
+
+	simple-audio-card,codec {
+		sound-dai = <&rt5616>;
+	};
+};
+
+&i2c7 {
+	rt5616: codec@1b {
+		compatible = "realtek,rt5616";
+		reg = <0x1b>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pinctrl {
 	usb {
 		pin_4g_lte_pwren: 4g-lte-pwren {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index eb0eb124c4cd..4d97afbc33bf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -98,33 +98,9 @@ fan: pwm-fan {
 		#cooling-cells = <2>;
 	};
 
-	sound {
-		compatible = "simple-audio-card";
-		label = "Onboard Analog Realtek ALC5616";
+	analog_sound: sound {
 		pinctrl-0 = <&hp_det>;
 		pinctrl-names = "default";
-
-		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
-		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "realtek,rt5616-codec";
-
-		simple-audio-card,widgets =
-			"Headphone", "Headphones",
-			"Microphone", "Microphone Jack";
-		simple-audio-card,routing =
-			"Headphones", "HPOL",
-			"Headphones", "HPOR",
-			"MIC1", "Microphone Jack",
-			"Microphone Jack", "micbias1";
-
-		simple-audio-card,cpu {
-			sound-dai = <&i2s0_8ch>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&rt5616>;
-		};
 	};
 
 	vcc12v_dcin: regulator-vcc12v-dcin {
@@ -549,16 +525,6 @@ &i2c7 {
 	clock-frequency = <200000>;
 	status = "okay";
 
-	rt5616: codec@1b {
-		compatible = "realtek,rt5616";
-		reg = <0x1b>;
-		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
-		assigned-clock-rates = <12288000>;
-		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
-		clock-names = "mclk";
-		#sound-dai-cells = <0>;
-	};
-
 	/* connected with MIPI-CSI1 */
 };
 
-- 
2.55.0

