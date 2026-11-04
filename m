Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790417;
	b=JLsqbR+nHV68sTRiSIeUX31QE0WM6JEAtrZi0pG9wCmXZ6YPIXnZt5Fje7wwA41luk3c
	 4uBr7YQ74J5dJ31BOQRcpe6zlJCmVc5nAGrbEppKTgERXxCiKbkBESCfgKBaSZGs6qFRa
	 IWI98h8oK+PYIe+tMEfC6fqLIIrwcrZ1+PUegE5uxVkuwAWeYmX2FH8hOUTC+s1vw6zHG
	 t18Wz4vuwBoFtSgQtm6YHBRFQl0Ko9sJi+1K5MzT4JOBxsIM4byiash+FMIaqR5xzZicO
	 u1aRd5XY3sqxNjkWL+NSbu7/+p9QN5Y3P49Fxq0fYiR27qApO+NxzdnkYJ5kW7AyrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790417;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4CIuy+PkiT+UL1hCEuwA9BVJ0GmEQ2NY52OWjxnzAo=;
	b=yXZt2yu16u6hP3GQ2OJeUzb5WJD2xs+HaV7pkFzFPIMuIO6VyxHw1T0VnQeYHmi+zNid
	 GdPNFJl99M7hEnv7p/mjoT3dr3CvrHuFFtTl48EIN73mgIRBk6hyUnwCmScTRVn0rVaFD
	 aOWcnnqoFL1CiykDr0zsm2npjZOcWjuImXHJz28M4BLNGOgQbb/hXzsnRqLoQ3MpKKKGA
	 MojfXK8tGYlzXKlKGXYA5u6H2C6mRnegCpKq0mNk9lTtU6akRXUxR+3FmNZAlDAVDsF2T
	 UA2j/FI5m4lxMQ7N3l4VY6wf6B7eITn8Dxjc5TAXjGgeNrBi55kLcgMi+vaDwbsn9hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=Usi61I2E;
	arc=none smtp.remote-ip=95.215.58.159
Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB3606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADDB3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=Usi61I2E
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rnqNfzNHS33ke4zcO6y3Oh6VMVuv1mlxjr1t5iFKKLk=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790414; v=1; x=1794395214;
 b=Usi61I2EKaXcye57J7LC8+XF/ZLPorol8lgrKj5cx8R4WOThTd1paLWgEE1sVlhlU6FW6YL5
 pY2+J+ZMTsBqUrdLu+XqaJdAa6b7q4RGNFVy2GMOKxP6U/ehVAwCvywJx4TOKIlrEz/+6z8pvnw
 hxq4K5wiAjmqeHys4MJ9XKbDILPUcwj7FBX0xXas1l83Eg24i434V+JjH4uW7EfiCH+QC/GgT0I
 gbxByvt3BdIwZaWDqhaYIzRNndzCge4s61MjglxZb6hCZyeTxnjDd3Y6P7ay3xk/z7Oe4feQagx
 f1VPL5lkK4eGyQgHi2aELq9u3MctcOQiLBoWMA/b1ofGw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eeae194fa72656f1;
	Wed, 04 Nov 2026 11:06:54 +0000
X-Mizu-Trace-ID: eeae194fa72656f1
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH RESEND 2/3] arm64: dts: rockchip: Move sound cards to board files for NanoPC-T6
Date: Wed,  4 Nov 2026 12:05:05 +0100
Message-ID: <20261104110640.1132917-3-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104110640.1132917-1-diederik@cknow-tech.com>
References: <20261104110640.1132917-1-diederik@cknow-tech.com>
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
index 13be56af095b..121ab2c467bf 100644
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

