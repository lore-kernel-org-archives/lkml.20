Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6869F40F749;
	Mon, 14 Sep 2026 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375250; cv=none; b=XdDrNc3B1utrHiufYD+uru04/bp2qAzzeN8WldB7ymqx1Et7I8ajpfdyO3+3dQuK/64YHyWhAo2Q5kr/gv6vODS+BWms/Ggct67xJRGA7HeiieP5+k1s7+wPXtvhkBwAERm0r3jY/zos5XyWbU+ErWeF0LAvYrVOgQXPmqr4CRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375250; c=relaxed/simple;
	bh=UtrP7ky+ia0X5EdOIrkOzleqCu52VefQgEqHWJ/EJ1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MGT82n8YM1sFWjDC4Ap0wGoMWsc4GEKK3zzxjiukx1UVYKpTPE4V+dwm+68XKTqEoo0Zk8ATX+606kMHNt253QiwDFa1IRDAz3fWiULLHjto6Fd70teEvB4utP5g66qqZSN3mJaAtFrmy0VsFmUPrz5II8XlpD97TUrjaf4vE2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Whl85dE2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xn08JsaY; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Whl85dE2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xn08JsaY"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AA29C1400123;
	Mon, 14 Sep 2026 04:40:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 14 Sep 2026 04:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375242;
	 x=1789461642; bh=UfqM1lG2CJRosE3K9vNpiLxEng508TmpFvN7XfosmNk=; b=
	Whl85dE2IFe/QFJJYbBUPk0bqpuEOolN7XN07bq50RCUgjugcjDg1zHvfwX5sZsC
	szTiiD8SavLmvQiWXgxf9DOd3BYuVlWcHhN/CQWvE1JssMGRjgHyFMNgEN69/PjC
	dRAPvFKXPONrDyGr+yDrk2kr4pNMWXmxSUPZneDA9LeGZAN6UXXsoiJrgfLwe8KD
	YIWpNHoaAH7yiwhejOefGtMK1kH/bJ+ui8NaZkQmt3TdQNz283N0SupC/z8wOijg
	nH2t7QT+edDhCg/OOVd198NSl83AYZHhGzClhx6ruhwjfTpw4zV7yZjq3MduulzK
	N8ookf7AtbtAzc69S5XBWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375242; x=
	1789461642; bh=UfqM1lG2CJRosE3K9vNpiLxEng508TmpFvN7XfosmNk=; b=X
	n08JsaYThMg6abwnDFq9zJlugwdps5fuREyYH4rQEkmb58EoAKrQUGmNFnskUL5K
	dL9o7eaF8jXk6/YZ+HY52dbn1r0+ZP/PKjjNA3ZADmRPgrG5kmsci11VuWdJtfkf
	IoHzYeub3ZDW5G2M3DAkPAmhRQfOMdBYheR4Ag9pOm3lNlCNi8zxMg5+ry39qLyT
	drPEv8GUBy7h8vCg2bZVekqHp+0atLkN2MqhLvjHleoaeEP5njqpG5zuRO4N1vTq
	qLIDsOXkvIOG7a3Pz6agOStsNPtPspFzmwmDrXKhSMEPT88ItRuD+K1kKDabS8ih
	OAAMAm9+ONW/cxv4ToqtQ==
X-ME-Sender: <xms:CrOnagupUknnpP0T93AQe6yR3GFq3xla74VUWRKTOZet2kiGZCy70A>
    <xme:CrOnatKdsGWIYXPbxXfmgByrWQfE1cIwm46NA3OaQE1pCcXEBpwAR8b6IhDEb4ySL
    SVe47LrFjLl98kSTysYaLkQlyic0TsVQG3rvrMM4Q9Gg_J-4zOecovL>
X-ME-Received: <xmr:CrOnanZkDvZJLV_DJ7oiWr5KAqlwTPVoBSr2cL7i8pHzyQL30TMSzbW8HhZqSVJpAhORVOTv6iCNSQUApIe6u3rJ2G6MaDWrkGlQkw>
X-ME-Proxy-Cause: dmFkZTE4K6JMrxd6sPzZVNrePGCzWSArxKGqIFy2UwUC7nS/ZY+sStdcZ7vmPmE2pNoHZC
    9MiqcQ5OXckdWGFiy01IJr2JkZ+n3p+fcnek7D1Qwk8LgHRtAPwJ3G0I5cz7ZhSuemTIJc
    i9Rs6SyTtRrS0p1PgXmcVZpifTNEIm8RuZjsFaFCWemyhP462rhvuOdftkbms6ekvvuLIV
    6HeACEZ35ia1OWZxWsqljJDvRhxvUU8yfY+GnRLK37wYdoIiqubcn305EIee0gH5ypsRyC
    0b6zJacisih6eDtoNCnZwnv1woWj2R2DHm/YruUPQexvu5t1hokHp9I+EwChY3zqidyUaw
    fI+7gl6UABp9qmpgEscVANnSqzAGsFihEQeA2VLEZCrVXNtWQnP6UEXahkHIPQ8bi8r7dM
    l5To4+JvUap3zlFHayIr/mvqqeeZcEJlBsPKDFj/zOtICnEQD2Hu05CDtUIvtuEXcOgUtY
    PLlw9R7yb98MDuQMr52ClRhbuVJqNk8/uG22RQO5IOkiDI/DAdfGPXeCq0cJFIdbqTVjYQ
    hD6tO97+p6z0Na1mi/vWsGTZ+/hyzPpGWitIH7cTZDTP6vl4eoSvCvoFLuH/FnuYhGvlk2
    LZAIjlVPxRSmn8JiuZDbNInxtchkYhMUoPf/Wn8Wlh5RYgS/4hQSxf8bWIlw
X-ME-Proxy: <xmx:CrOnavANeZrEiPSOb2EEXQ6OgDPrUWQ7Mvbp0Etn60ahnARQaz-L-g>
    <xmx:CrOnahZiNXivaq7cXaV0zdgD6kssh5o8czNkKbar5MwxNAE2ZgZphA>
    <xmx:CrOnanmi7XTTKaQiFhMIhV_p6WpXOlhvI5P-Qzie4cNXIWvHMVA3mw>
    <xmx:CrOnampO5LszG7rnhvW5xqBrNx28q3102Wjvc8HQzAz1neG1_han3A>
    <xmx:CrOnajp3rEWZkuKmaAVWxrBLs7CbvcENlI_AUtrMehWu8P9DL4hiZSeC>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:42 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:32 +0200
Subject: [PATCH v2 02/13] arm64: dts: apple: t8122: Fix blank line related
 dt-check-style issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-2-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4776; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=UtrP7ky+ia0X5EdOIrkOzleqCu52VefQgEqHWJ/EJ1I=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5nTFhgpX97x9OH+3GjPDx/fH+886rj0xWPuBmUBe
 acujmytjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNZzszwv8qOP+Pi41u9quKR
 P7i+rBKJeXRim/OshIKFWV8/bJjKy8TI8NgxVyNDiPc3749p/W13PoT0zpjdHrs8e81T3rrtxTs
 m8wEA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Fixes dt-check-style 'blank-lines' and 'required-blank-lines' issues
reported in strict mode.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122-j504.dts  |  2 +-
 arch/arm64/boot/dts/apple/t8122-j613.dts  |  1 +
 arch/arm64/boot/dts/apple/t8122-j615.dts  |  1 +
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi |  1 +
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi |  1 -
 arch/arm64/boot/dts/apple/t8122.dtsi      | 14 +++++++++++++-
 6 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122-j504.dts b/arch/arm64/boot/dts/apple/t8122-j504.dts
index 464491b55b01..d9e8016e84a2 100644
--- a/arch/arm64/boot/dts/apple/t8122-j504.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j504.dts
@@ -20,6 +20,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
@@ -34,4 +35,3 @@ led-0 {
 &fpwm1 {
 	status = "okay";
 };
-
diff --git a/arch/arm64/boot/dts/apple/t8122-j613.dts b/arch/arm64/boot/dts/apple/t8122-j613.dts
index 51894ea705e7..127a4c2d8577 100644
--- a/arch/arm64/boot/dts/apple/t8122-j613.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j613.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8122-j615.dts b/arch/arm64/boot/dts/apple/t8122-j615.dts
index 2a1970c1bc90..9ef7791e2f32 100644
--- a/arch/arm64/boot/dts/apple/t8122-j615.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j615.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
index dd85f0c9fb1e..b9576e4164a3 100644
--- a/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
@@ -26,6 +26,7 @@ framebuffer0: framebuffer@0 {
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_cpu>, <&ps_dptx_ext_phy>;
 			/* Format properties will be added by loader */
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
index 64093792e0ad..3f8be74b5ea8 100644
--- a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
@@ -1004,7 +1004,6 @@ ps_disp_cpu: power-controller@10000 {
 };
 
 &pmgr_mini {
-
 	ps_debug_gated: power-controller@0 {
 		compatible = "apple,t8122-pmgr-pwrstate", "apple,t8103-pmgr-pwrstate";
 		reg = <0x0 4>;
diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 1ee61c5b3409..de09989c5663 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -29,12 +29,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpu_e0>;
 				};
+
 				core1 {
 					cpu = <&cpu_e1>;
 				};
+
 				core2 {
 					cpu = <&cpu_e2>;
 				};
+
 				core3 {
 					cpu = <&cpu_e3>;
 				};
@@ -44,12 +47,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu_p0>;
 				};
+
 				core1 {
 					cpu = <&cpu_p1>;
 				};
+
 				core2 {
 					cpu = <&cpu_p2>;
 				};
+
 				core3 {
 					cpu = <&cpu_p3>;
 				};
@@ -197,6 +203,7 @@ i2c0: i2c@2a1010000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c0>;
+
 			status = "disabled";
 		};
 
@@ -211,6 +218,7 @@ i2c1: i2c@2a1014000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c1>;
+
 			status = "disabled";
 		};
 
@@ -225,6 +233,7 @@ i2c2: i2c@2a1018000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c2>;
+
 			status = "disabled";
 		};
 
@@ -239,6 +248,7 @@ i2c3: i2c@2a101c000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c3>;
+
 			status = "disabled";
 		};
 
@@ -253,6 +263,7 @@ i2c4: i2c@2a1020000 {
 			#address-cells = <0x1>;
 			#size-cells = <0x0>;
 			power-domains = <&ps_i2c4>;
+
 			status = "disabled";
 		};
 
@@ -262,6 +273,7 @@ fpwm1: pwm@2a1044000 {
 			power-domains = <&ps_fpwm1>;
 			clocks = <&clkref>;
 			#pwm-cells = <2>;
+
 			status = "disabled";
 		};
 
@@ -278,6 +290,7 @@ serial0: serial@2a1200000 {
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
 			power-domains = <&ps_uart0>;
+
 			status = "disabled";
 		};
 
@@ -356,7 +369,6 @@ i2c4_pins: i2c4-pins {
 				pinmux = <APPLE_PINMUX(149, 1)>,
 					 <APPLE_PINMUX(148, 1)>;
 			};
-
 		};
 
 		pinctrl_nub: pinctrl@2e41f0000 {

-- 
2.55.0

