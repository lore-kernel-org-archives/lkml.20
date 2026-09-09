Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE174F55A5;
	Wed,  9 Sep 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949658; cv=none; b=PWdFf1eVyw+0QM3y/P7VsCrWU/GgWgxNyvgI0K58IGCpoupcJoANM4ocnTLf0fp9d+4u/ZXspEFQu7Lq0Q97zzdlGjxiR1Wik3wLgrnaA0copLhxNs1WbhrxJaGo7W9qlR6/FJo948ottXNUDQQfEyRv4SNLEksz0Evzy1tEOFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949658; c=relaxed/simple;
	bh=ICP5yuolFbCg6Xo6F8Jja7N+DMmgx2hdCpu+m/Immus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=un2rkB6BYypQyu4p7QdJ+lzKo/sqr0Ey3oFr5OnOLkyHt1OBXdSEDMrw17t8F7J8FQfo/4yDEruVZj6ei9gt2ah0QVAeEZ0tJcM+vX7V+7iBJvNbNAXswpcoRZisvHEfLoohm8AZ24pA2ALx7jHEbr0vvNIgwitrkK6zpuJze0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=BPF7+td5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OO92CbLq; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="BPF7+td5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OO92CbLq"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 88AF57A000F;
	Wed,  9 Sep 2026 06:27:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 09 Sep 2026 06:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949651;
	 x=1789036051; bh=nFivQDzihTw9JXzQtDLSekV/1gT4RktT2UYHw4YyHQY=; b=
	BPF7+td5T6Br3iu81rFFGPcxsfz/v4r3kiuQDRbVND2OuHVtW+S3KlXj7peBlDmG
	46pcy4trrxLQqXut7eImObKDGvrmS36nGrZMSbOb26eLICDAue09fKghT2MZt4Dm
	/zRie+RbtYA1W9f942PnSncypIiVDcbd84HVAD7dbZ+KS+FqlMw+htjdXxMtg45g
	Nqcz5WISkOts70dLorznLzQE6+eF1nLNZNSJU8ZJSbKtAtoZRymLxN1BojklSFzZ
	wXnwlu9IS1LAW4wnMp+LgXjBG7uXT5L1tqdPQ/jPnWKD/gHtsw2S9IU7vMXde93K
	xsf8egXTaY1ph7k79TRMAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949651; x=
	1789036051; bh=nFivQDzihTw9JXzQtDLSekV/1gT4RktT2UYHw4YyHQY=; b=O
	O92CbLqsiJHnu8IMaE6h7egHO4VGYowqY6c8WCdfuXx9uQDRMZEr0UcXGFuQGxrJ
	07jNOGxQaxdbjIcqWR+WTj/zVjPqai/4A4f09/FiyYHx59b3U7zG320yGGkNZ/LT
	dE2u+FINdKYHptOLToE3poog/DDFayXsWVLBiSLVB9CHmcD6sB+tJR2vP6CyD86V
	rdBZpk8f/FeSU1vnX7bLmUu+y1NAsUYN8zC7mOZZDnGwxUrpOGGULIvkoIS8RFhi
	VcsNinS04neu0NXs9I0bIV69g/bjeTbDOemIcw0AcpArG5YoHvDzg1FP4MaZlv3E
	NhF+KbKrSiNhgNvGoqstQ==
X-ME-Sender: <xms:kzShaiowFS5ybJUQkiTTcnbL6ua05qSUBmTj3CqgPd_v5ATHdxXTbQ>
    <xme:kzShao1OdT2cvSX4Q4-uZs9sADfmwiPQpF8PDLDGpKmQ6QtPcIzTqPuVjWBZ0aL3c
    KrccJ441OWMY_IZVvFTpWjXOinH_iZXlcWm9hVnIMtnXByrVHiQqw>
X-ME-Received: <xmr:kzShaizi-8iVJsurx3OuYlXka4hXZinzBvdjxNCR2l7r9R3tyYiGea0LXzLaPaUG3Zaaq1RJFPfF5aHbLFVZ4wPEpHzmHavLNOaXFw>
X-ME-Proxy-Cause: dmFkZTFx5WkaY4CDAlu0ZuU0hrQzpafzkGsOaaQGEhoUmSRPpPX76dVLRDYSy3Ff36O28i
    2b99czRBR+aM2sP9W0jn3TnWedWS1aurEII+sX65de2uh7zYXOOp/7zyDNqGFAsFsn5G92
    BaS0m5e4Kv8PJlU26VdOhZ/DVyTkQd6kagOvbn+jkexDsbD8nNJOHEvi4uQdLIXSeayDWh
    nMJWoPiW/JuVJBDcDNmg7gGLig4IK9iLSNltxhecCMWDtrvVn5YADCi0ePKsJDVJujcxSN
    ZZDmN0eLKwvqavAQsRwATwIBAsHaWpd4LLVFp74ef13oKcetFr2d4tMXguUSWmQiXc9ent
    t2d/iZkytAwwTXGIe/ukg9AyveT42K8fZOMB+3Yw2ULdqZEVQ0Uj+HdzTOPUx/oxrRFdGY
    8TdCq+zIgeVNqyINgh7rqkzlSWPE4RteoFJQA/ZLu+KCelilnRHAY1oC0W7hODwlluEGyr
    RRdzm8ffDuHKAn8KV5M1BJj2F7lz584t+1whauyX9jeEQZ2jIGECvZfGyEzypvzkNh6xD7
    35pbu6e/MgZ1I6sdevhPv0kyheV8FGSj4Vv6dnFmjh1Cvg+CUdno7Riu3t8ZIwXMxErBKI
    1PtuEiAzZ2/8FQBZSrIeNsKe8YOWakKH79ZTN57ILg4pMMBKl867nnujTqtQ
X-ME-Proxy: <xmx:kzShashae-u8OiiWSVbpUwZzmdun-N4qquR-2VGOXhG369RdIawdPw>
    <xmx:kzShatqawy64uB3Ep3PxgVepgyNpgyrKhFvTol-sRyd6ka-h1MMzwg>
    <xmx:kzSharidRWruu4_IkzQA4QUJ_R0-duIJY95IYEQ5f5JYnoEd_Oi9QA>
    <xmx:kzShanOSwpCkHTZKuQdlY6ci5CEOLxHrVni9JK8M0ZhrOI7IsZG1lw>
    <xmx:kzShanKR1SFnOJuzTfqCrPMbFaIfAGHq65Xo9EI-pd0qxcMLsYxqjpdR>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:30 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:06 +0200
Subject: [PATCH 10/13] arm64: dts: apple: t8122: Fix most property-order
 dt-style-check issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-10-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16479; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=ICP5yuolFbCg6Xo6F8Jja7N+DMmgx2hdCpu+m/Immus=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpXVX3tent70+lyLyir/xVOiMpPXaQja5r15O910z
 70UuZuOHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACYiFsTI0Kz4VtEjYsb6jkTm
 07lzFqZM2V+xcc6GhdeFphdevNfhMZOR4f7J2zcifwixpRlNYN+zbU4006wLyaGHXx8R+nr1yoR
 zKTwA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

t8122-pmgr.dtsi is left unchanged because future additions or
modifications will be sparse.

Not fixed are

| [property-order] property 'd-cache-size' out of canonical order (should sort before 'enable-method')

for all CPU nodes to keep cache related properties together. A blank
line is added before 'd-cache-size' to attenuate this grouping for human
consumption.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122-j504.dts  |   8 +-
 arch/arm64/boot/dts/apple/t8122-j613.dts  |   8 +-
 arch/arm64/boot/dts/apple/t8122-j615.dts  |   8 +-
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi |   4 +-
 arch/arm64/boot/dts/apple/t8122.dtsi      | 158 ++++++++++++++++--------------
 5 files changed, 99 insertions(+), 87 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122-j504.dts b/arch/arm64/boot/dts/apple/t8122-j504.dts
index d9e8016e84a2..e60ec3039196 100644
--- a/arch/arm64/boot/dts/apple/t8122-j504.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j504.dts
@@ -22,12 +22,12 @@ led-controller {
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
diff --git a/arch/arm64/boot/dts/apple/t8122-j613.dts b/arch/arm64/boot/dts/apple/t8122-j613.dts
index 127a4c2d8577..40274a983849 100644
--- a/arch/arm64/boot/dts/apple/t8122-j613.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j613.dts
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
diff --git a/arch/arm64/boot/dts/apple/t8122-j615.dts b/arch/arm64/boot/dts/apple/t8122-j615.dts
index 9ef7791e2f32..61833f6d019b 100644
--- a/arch/arm64/boot/dts/apple/t8122-j615.dts
+++ b/arch/arm64/boot/dts/apple/t8122-j615.dts
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
diff --git a/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
index b9576e4164a3..2dbdb77d5413 100644
--- a/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
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
 
diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index cf9cd0781fde..5e79de6fece8 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -70,129 +70,137 @@ core3 {
 		};
 
 		cpu_e0: cpu@0 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x0>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e1: cpu@1 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x1>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e2: cpu@2 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x2>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e3: cpu@3 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x3>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_p0: cpu@10100 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10100>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p1: cpu@10101 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10101>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p2: cpu@10102 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10102>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p3: cpu@10103 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10103>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
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
 
 	soc {
 		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-
 		ranges;
-		nonposted-mmio;
+		#address-cells = <2>;
+
 		/* Required to get >32-bit DMA via DARTs */
 		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
+		nonposted-mmio;
+		#size-cells = <2>;
 
 		i2c0: i2c@2a1010000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
 			reg = <0x2 0xa1010000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 780 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c0_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c0>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -200,14 +208,14 @@ i2c0: i2c@2a1010000 {
 		i2c1: i2c@2a1014000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
 			reg = <0x2 0xa1014000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c1_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c1>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -215,14 +223,14 @@ i2c1: i2c@2a1014000 {
 		i2c2: i2c@2a1018000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
 			reg = <0x2 0xa1018000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 782 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c2_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c2>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -230,14 +238,14 @@ i2c2: i2c@2a1018000 {
 		i2c3: i2c@2a101c000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
 			reg = <0x2 0xa101c000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 783 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c3_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c3>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -245,14 +253,14 @@ i2c3: i2c@2a101c000 {
 		i2c4: i2c@2a1020000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
 			reg = <0x2 0xa1020000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c4_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c4>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -260,8 +268,8 @@ i2c4: i2c@2a1020000 {
 		fpwm1: pwm@2a1044000 {
 			compatible = "apple,t8122-fpwm", "apple,s5l-fpwm";
 			reg = <0x2 0xa1044000 0x0 0x4000>;
-			power-domains = <&ps_fpwm1>;
 			clocks = <&clkref>;
+			power-domains = <&ps_fpwm1>;
 			#pwm-cells = <2>;
 
 			status = "disabled";
@@ -270,16 +278,16 @@ fpwm1: pwm@2a1044000 {
 		serial0: serial@2a1200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0xa1200000 0x0 0x1000>;
-			reg-io-width = <4>;
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>;
 			/*
 			 * TODO: figure out the clocking properly, there may
 			 * be a third selectable clock.
 			 */
-			clocks = <&clkref>, <&clkref>;
-			clock-names = "uart", "clk_uart_baud0";
 			power-domains = <&ps_uart0>;
+			reg-io-width = <4>;
 
 			status = "disabled";
 		};
@@ -287,15 +295,13 @@ serial0: serial@2a1200000 {
 		pinctrl_ap: pinctrl@2c7100000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xc7100000 0x0 0x100000>;
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
 			interrupts = <AIC_IRQ 241 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 242 IRQ_TYPE_LEVEL_HIGH>,
@@ -305,6 +311,9 @@ pinctrl_ap: pinctrl@2c7100000 {
 				     <AIC_IRQ 246 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 247 IRQ_TYPE_LEVEL_HIGH>;
 
+			power-domains = <&ps_gpio>;
+			apple,npins = <224>;
+
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(145, 1)>,
 					 <APPLE_PINMUX(144, 1)>;
@@ -333,30 +342,30 @@ i2c4_pins: i2c4-pins {
 
 		pmgr: power-management@2d0700000 {
 			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x2 0xd0700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			reg = <0x2 0xd0700000 0 0x14000>;
 			/* child nodes are added in t8122-pmgr.dtsi */
 		};
 
 		aic: interrupt-controller@2d1000000 {
 			compatible = "apple,t8122-aic3";
-			#interrupt-cells = <3>;
-			interrupt-controller;
 			reg = <0x2 0xd1000000 0x0 0x184000>,
 			      <0x2 0xd1040000 0x0 0x4>;
 			reg-names = "core", "event";
+			#interrupt-cells = <3>;
+			interrupt-controller;
 			power-domains = <&ps_aic>;
 
 			affinities {
 				e-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_E>;
 					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+					apple,fiq-index = <AIC_CPU_PMU_E>;
 				};
 
 				p-core-pmu-affinity {
-					apple,fiq-index = <AIC_CPU_PMU_P>;
 					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
+					apple,fiq-index = <AIC_CPU_PMU_P>;
 				};
 			};
 		};
@@ -364,15 +373,13 @@ p-core-pmu-affinity {
 		pinctrl_nub: pinctrl@2e41f0000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xe41f0000 0x0 0x4000>;
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
 			interrupts = <AIC_IRQ 424 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 425 IRQ_TYPE_LEVEL_HIGH>,
@@ -381,13 +388,16 @@ pinctrl_nub: pinctrl@2e41f0000 {
 				     <AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 430 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&ps_nub_gpio>;
+			apple,npins = <32>;
 		};
 
 		pmgr_mini: power-management@2e4280000 {
 			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x2 0xe4280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			reg = <0x2 0xe4280000 0 0x4000>;
 			/* child nodes are added in t8122-pmgr.dtsi */
 		};
 
@@ -403,13 +413,12 @@ pinctrl_smc: pinctrl@2ec820000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xec820000 0x0 0x4000>;
 
-			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-controller;
 			gpio-ranges = <&pinctrl_smc 0 0 18>;
-			apple,npins = <18>;
 
-			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 493 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 494 IRQ_TYPE_LEVEL_HIGH>,
@@ -418,19 +427,20 @@ pinctrl_smc: pinctrl@2ec820000 {
 				     <AIC_IRQ 497 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 498 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <18>;
 		};
 
 		pinctrl_aop: pinctrl@2f4824000 {
 			compatible = "apple,t8122-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x2 0xf4824000 0x0 0x4000>;
 
-			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-controller;
 			gpio-ranges = <&pinctrl_aop 0 0 54>;
-			apple,npins = <54>;
 
-			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 346 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 347 IRQ_TYPE_LEVEL_HIGH>,
@@ -439,17 +449,19 @@ pinctrl_aop: pinctrl@2f4824000 {
 				     <AIC_IRQ 350 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 351 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 352 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <54>;
 		};
 	};
 
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

