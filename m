Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570B937268C;
	Thu, 24 Sep 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256171; cv=none; b=g85v0NYKD88nGSkQSlbEQjlrmk7TyCbGgldOgVWUsSw1nG7mUBYGmRL3ZUj//WBFQGpaQYtE9Os5bw7mZShJtfltjQEw8r0fZUZ7/Cnzr5X+FP166HVM+wdmfI+iv/cn8FVAXIVPZNtHB+UKzW70ZgyZtLF9xlbhwHD3xYWHAs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256171; c=relaxed/simple;
	bh=bwOCxC6hoVLK3JQJZ9OL5IX4jkpARgSlp/z1h6umQuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3XJo2eYmLLJZPmHUBwI1YqrTMYHFi5QqqvnJe0Hx145ptPfWcg1HrnmQ7mBUT9RjyVniO+glbRVS9Me1fr0wFId6KRpJ6CunZ8W/d5JgSOqOkZSZ2J8RwnalPmL78rmWvcirsLvXJpQXZaUu1azyJ7xKExVZwVrMnwpjOtF8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=OP8UrcIz; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="OP8UrcIz"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790256155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zEzkxPo/TvWxfTAnlVnEb3LOECf8HweSA0IBHma31Zw=;
	b=OP8UrcIzpIdqBBgQKR1t+KyFqkBIlRq40j0Jy8TIbefRhodLgV8UrY4EHaCbivrAiHW2yn
	6jCjX7MAj8qLEmz3OwgkMnqfsZqwGyIaqkhajPg1EJeLMX9gHz/mtv4dcvS0UJZ8HwZaeV
	vpnZqI34Ui2kneOfkzPtVVzyLPaG+M0=
Date: Thu, 24 Sep 2026 15:22:24 +0200
Subject: [PATCH 2/3] dts: apple: t8132: Fix ordering-related dt-check-style
 issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-apple-dts-m4-dt-style-check-v1-2-3ec651d75baf@cyberchaos.dev>
References: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
In-Reply-To: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

This fixes most `dt-check-style --mode=strict` issues related to
node and property ordering in the t8132 device tres.
The cache-related properties are kept in their own sorting group,
separated by a newline from the rest, to improve human readability.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-j604.dts  |   8 +-
 arch/arm64/boot/dts/apple/t8132-j713.dts  |   8 +-
 arch/arm64/boot/dts/apple/t8132-j715.dts  |   8 +-
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |   4 +-
 arch/arm64/boot/dts/apple/t8132.dtsi      | 195 +++++++++++++++++-------------
 5 files changed, 123 insertions(+), 100 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8132-j604.dts b/arch/arm64/boot/dts/apple/t8132-j604.dts
index 93076cd923a9..676c1d1f3a14 100644
--- a/arch/arm64/boot/dts/apple/t8132-j604.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j604.dts
@@ -21,12 +21,12 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-0 {
-			pwms = <&fpwm1 0 40000>;
-			label = "kbd_backlight";
-			function = LED_FUNCTION_KBD_BACKLIGHT;
 			color = <LED_COLOR_ID_WHITE>;
-			max-brightness = <255>;
 			default-state = "keep";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			label = "kbd_backlight";
+			max-brightness = <255>;
+			pwms = <&fpwm1 0 40000>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t8132-j713.dts b/arch/arm64/boot/dts/apple/t8132-j713.dts
index 892a3812bc65..b70d2cdacd3a 100644
--- a/arch/arm64/boot/dts/apple/t8132-j713.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j713.dts
@@ -21,12 +21,12 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-0 {
-			pwms = <&fpwm1 0 40000>;
-			label = "kbd_backlight";
-			function = LED_FUNCTION_KBD_BACKLIGHT;
 			color = <LED_COLOR_ID_WHITE>;
-			max-brightness = <255>;
 			default-state = "keep";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			label = "kbd_backlight";
+			max-brightness = <255>;
+			pwms = <&fpwm1 0 40000>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t8132-j715.dts b/arch/arm64/boot/dts/apple/t8132-j715.dts
index 212d194bd1ae..d0428a3c9484 100644
--- a/arch/arm64/boot/dts/apple/t8132-j715.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j715.dts
@@ -21,12 +21,12 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-0 {
-			pwms = <&fpwm1 0 40000>;
-			label = "kbd_backlight";
-			function = LED_FUNCTION_KBD_BACKLIGHT;
 			color = <LED_COLOR_ID_WHITE>;
-			max-brightness = <255>;
 			default-state = "keep";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			label = "kbd_backlight";
+			max-brightness = <255>;
+			pwms = <&fpwm1 0 40000>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
index b0c5d71943b6..09ab380a00e9 100644
--- a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
@@ -15,9 +15,9 @@ aliases {
 	};
 
 	chosen {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		stdout-path = "serial0";
 
@@ -32,9 +32,9 @@ framebuffer0: framebuffer@0 {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 		/* To be filled by loader */
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index 1ea488ce6e1c..350ad7b3772b 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -15,6 +15,13 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -66,171 +73,174 @@ core3 {
 		};
 
 		cpu_e0: cpu@0 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x0>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e1: cpu@1 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x1>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e2: cpu@2 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x2>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e3: cpu@3 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x3>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e4: cpu@4 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x4>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e5: cpu@5 {
-			compatible = "apple,donan-e";
 			device_type = "cpu";
+			compatible = "apple,donan-e";
 			reg = <0x0 0x5>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_p0: cpu@10100 {
-			compatible = "apple,donan-p";
 			device_type = "cpu";
+			compatible = "apple,donan-p";
 			reg = <0x0 0x10100>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p1: cpu@10101 {
-			compatible = "apple,donan-p";
 			device_type = "cpu";
+			compatible = "apple,donan-p";
 			reg = <0x0 0x10101>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p2: cpu@10102 {
-			compatible = "apple,donan-p";
 			device_type = "cpu";
+			compatible = "apple,donan-p";
 			reg = <0x0 0x10102>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p3: cpu@10103 {
-			compatible = "apple,donan-p";
 			device_type = "cpu";
+			compatible = "apple,donan-p";
 			reg = <0x0 0x10103>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>;
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		l2_cache_0: l2-cache-0 {
 			compatible = "cache";
 			cache-level = <2>;
-			cache-unified;
 			cache-size = <0x400000>;
+			cache-unified;
 		};
 
 		l2_cache_1: l2-cache-1 {
 			compatible = "cache";
 			cache-level = <2>;
-			cache-unified;
 			cache-size = <0x1000000>;
+			cache-unified;
 		};
 	};
 
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
 	soc: soc {
 		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
 
 		ranges;
+		#address-cells = <2>;
 		nonposted-mmio;
+		#size-cells = <2>;
 
 		pmgr: power-management@380700000 {
 			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x3 0x80700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			reg = <0x3 0x80700000 0 0x14000>;
 			/* child nodes are added in t8132-pmgr.dtsi */
 		};
 
 		aic: interrupt-controller@381000000 {
 			compatible = "apple,t8132-aic3", "apple,t8122-aic3";
-			#interrupt-cells = <3>;
-			interrupt-controller;
 			reg = <0x3 0x81000000 0x0 0x1cc000>,
 			      <0x3 0x81040000 0x0 0x4000>;
 			reg-names = "core", "event";
+			#interrupt-cells = <3>;
+			interrupt-controller;
 			power-domains = <&ps_aic>;
 
 			affinities {
 				e-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_E>;
 					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3 &cpu_e4 &cpu_e5>;
+					apple,fiq-index = <AIC_CPU_PMU_E>;
 				};
 
 				p-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_P>;
 					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
+					apple,fiq-index = <AIC_CPU_PMU_P>;
 				};
 			};
 		};
@@ -238,15 +248,13 @@ p-core-pmu-affinity {
 		pinctrl_nub: pinctrl@3881f0000 {
 			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x881f0000 0x0 0x4000>;
-			power-domains = <&ps_nub_gpio>;
 
-			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-controller;
 			gpio-ranges = <&pinctrl_nub 0 0 32>;
-			apple,npins = <32>;
 
-			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
@@ -255,13 +263,16 @@ pinctrl_nub: pinctrl@3881f0000 {
 			             <AIC_IRQ 503 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 505 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&ps_nub_gpio>;
+			apple,npins = <32>;
 		};
 
 		pmgr_mini: power-management@388280000 {
 			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x3 0x88280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			reg = <0x3 0x88280000 0 0x4000>;
 			/* child nodes are added in t8132-pmgr.dtsi */
 		};
 
@@ -277,13 +288,12 @@ pinctrl_smc: pinctrl@38c820000 {
 			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x8c820000 0x0 0x4000>;
 
-			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-controller;
 			gpio-ranges = <&pinctrl_smc 0 0 18>;
-			apple,npins = <18>;
 
-			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 552 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>,
@@ -292,19 +302,20 @@ pinctrl_smc: pinctrl@38c820000 {
 			             <AIC_IRQ 556 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 557 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 558 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <18>;
 		};
 
 		pinctrl_aop: pinctrl@390824000 {
 			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x90824000 0x0 0x4000>;
 
-			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-controller;
 			gpio-ranges = <&pinctrl_aop 0 0 57>;
-			apple,npins = <57>;
 
-			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 423 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 424 IRQ_TYPE_LEVEL_HIGH>,
@@ -313,20 +324,20 @@ pinctrl_aop: pinctrl@390824000 {
 			             <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <57>;
 		};
 
 		pinctrl_ap: pinctrl@39a000000 {
 			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x9a000000 0x0 0x100000>;
-			power-domains = <&ps_gpio>;
 
-			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-controller;
 			gpio-ranges = <&pinctrl_ap 0 0 224>;
-			apple,npins = <224>;
 
-			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
@@ -336,6 +347,9 @@ pinctrl_ap: pinctrl@39a000000 {
 			             <AIC_IRQ 308 IRQ_TYPE_LEVEL_HIGH>,
 			             <AIC_IRQ 309 IRQ_TYPE_LEVEL_HIGH>;
 
+			power-domains = <&ps_gpio>;
+			apple,npins = <224>;
+
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(104, 1)>,
 				         <APPLE_PINMUX(103, 1)>;
@@ -365,14 +379,15 @@ i2c4_pins: i2c4-pins {
 		i2c0: i2c@3ad010000 {
 			compatible = "apple,t8132-i2c", "apple,t8103-i2c";
 			reg = <0x3 0xad010000 0x0 0x4000>;
+
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 1062 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c0_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c0>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -380,14 +395,15 @@ i2c0: i2c@3ad010000 {
 		i2c1: i2c@3ad014000 {
 			compatible = "apple,t8132-i2c", "apple,t8103-i2c";
 			reg = <0x3 0xad014000 0x0 0x4000>;
+
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 1063 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c1_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c1>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -395,14 +411,15 @@ i2c1: i2c@3ad014000 {
 		i2c2: i2c@3ad018000 {
 			compatible = "apple,t8132-i2c", "apple,t8103-i2c";
 			reg = <0x3 0xad018000 0x0 0x4000>;
+
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 1064 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c2_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c2>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -410,14 +427,15 @@ i2c2: i2c@3ad018000 {
 		i2c3: i2c@3ad01c000 {
 			compatible = "apple,t8132-i2c", "apple,t8103-i2c";
 			reg = <0x3 0xad01c000 0x0 0x4000>;
+
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 1065 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c3_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c3>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -425,14 +443,15 @@ i2c3: i2c@3ad01c000 {
 		i2c4: i2c@3ad020000 {
 			compatible = "apple,t8132-i2c", "apple,t8103-i2c";
 			reg = <0x3 0xad020000 0x0 0x4000>;
+
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 1066 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c4_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c4>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -440,8 +459,9 @@ i2c4: i2c@3ad020000 {
 		fpwm1: pwm@3ad044000 {
 			compatible = "apple,t8132-fpwm", "apple,s5l-fpwm";
 			reg = <0x3 0xad044000 0x0 0x4000>;
-			power-domains = <&ps_fpwm1>;
+
 			clocks = <&clkref>;
+			power-domains = <&ps_fpwm1>;
 			#pwm-cells = <2>;
 
 			status = "disabled";
@@ -450,12 +470,15 @@ fpwm1: pwm@3ad044000 {
 		serial0: serial@3ad200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x3 0xad200000 0x0 0x1000>;
-			reg-io-width = <4>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 1046 IRQ_TYPE_LEVEL_HIGH>;
+
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1046 IRQ_TYPE_LEVEL_HIGH>;
+
 			power-domains = <&ps_uart0>;
+			reg-io-width = <4>;
 
 			status = "disabled";
 		};
@@ -464,11 +487,11 @@ serial0: serial@3ad200000 {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 		             <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
 		             <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
 		             <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
 

-- 
2.55.0

