Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6ED41167E;
	Mon, 14 Sep 2026 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375271; cv=none; b=OWJmSASjUWJS0FXA0zmso8A+tGD9tdx6AG1qFq5dBvjBSds+v9bD4umGlEqQW9d17/VbqPbBtcoK3Ay8kUdnsM+WtgDbWeqmNFmhL59EjAln26mimdIOlNWannr8/+JJt4o5fl4mULY9I1QrvN+uCqCXcayfLITz0mNVKZTv9lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375271; c=relaxed/simple;
	bh=0r3QMDr1W369qSjg34sBLU7Z3UzrMAd5SbVSrae4pOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fiu44nKAgx4diNS3pDTT36xSHJ711zayRnoHlsjxZ7ndhqo2olvzIV2FTP8YPxMuW6BjZkqIJxjhXIsmIiHktRue/SyMPvigGjzkZxc/o9ippuEDDb4cSt52hX8kaUnKDh7psNpyLeViWuMXHFkgIxBjojlMkWjAqvzX76pebvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Ix8UDaHt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ImPoMwP7; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Ix8UDaHt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ImPoMwP7"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 50F4BEC0600;
	Mon, 14 Sep 2026 04:40:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 14 Sep 2026 04:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375256;
	 x=1789461656; bh=+8HFJLvwxIzwMmuCkh1z+a2IDJcdZbtrI8CcvNWGV7Y=; b=
	Ix8UDaHt2A88cTR15XgoM10advZZlBPxSNMDdPhFErgnJoKHKPotyXtRi34a/ZzU
	SB4TN96vybVSEPhCija1KfVPnG6zGQrGPm3vBXPztI5rYytuEP0Zl77dOFgOAQgS
	gmHpQI1Xnct+IYFLIjGTaGoK0umqdIIZITiVdRxDksmgyGnThPZuVAKzfJyycNIt
	i60uQuJaN19SJEpzRrchxCG8DZMvJcrcrDY/gbIgMyjh3PRVLTCBgWBQ2+IBDJqj
	M72ROc+pBTLR5jFTyErxZsogUsmOr42AupOxVufy/FIsifhxSJEyR589kDWoe8SW
	z3vG0p+Wiv5QFGyblJaoAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375256; x=
	1789461656; bh=+8HFJLvwxIzwMmuCkh1z+a2IDJcdZbtrI8CcvNWGV7Y=; b=I
	mPoMwP7p1RdoaiD5NA8/VqO/tgZFDI4hjMEnYIklPnNjOrmxyTr79SXfrVGL3He1
	52bhzVxfqzFgDeARUQXGOGFpq2UV4E5O7IAzLBukLt/7d21rjAC6qyAw6NpPYjv7
	oHN4HT4mYmCf7WZRDEJXO4cWd6KBF9HHMmF/fGJsXKrtToNtl6rx4Y85qekPdvBY
	N0Dsaa9my6eynMZj2hwPCbTcEwH3mJXAMSNeCQxMjC8N9o/toPCDcYs2ooP7ttmr
	EDxM1em3a103dm/1tZVY4xQa0DKm1qNtfkzoxJp0L/WLxgwLPIM+hqcsWC+jJTVi
	d21FFRu5cQmSEtN/V2IzA==
X-ME-Sender: <xms:GLOnagmDu5_fEg1VUzmMwYoBUHGAnrJsZqyM_Lzfq_A9EauPf67rzw>
    <xme:GLOnaoDxTteV45C6ZjuMbV545dISvpqPIwogOCAj5Qqci49pg-C9_K3VlA45mG_ai
    RjOB2WT5_8WY9hJxtijOobG8GGt9toa5scd6Z9jkaunNgIeUurdEahO>
X-ME-Received: <xmr:GLOnaqOVEMWq34HogoE3Xryzx3bIqEodl6EwAWKs_EqqADSUJW5EzVPXzgdOLkfynkJSVJbyQbsIzy-CjN5MwkdvHhTe8r67TwSpGA>
X-ME-Proxy-Cause: dmFkZTGTKY//RUR5EgjNbSpcd3VVyHi7/RyZZoSH75sSjgM30+UMh0SnsYKjQljj3zB5sH
    UfXSIJXXAUSEPTXl3x5Pe7T/YIndxdissUCd+4R1d0nftRIrhDo1ZQaSJwH2QxYEcZjR6q
    e1HSRCovBuObDp7yvtbJu0MeL0TzRLJi/WjnPbfUseVNsYil7chlvegBuYUJmT7prpLoO5
    9KBYbuj3PPvZPnU/frjB0pX1g3DRpbM/YNiNklFelr4yqg27xxhYMIdtJwD7hUpgzK9cSv
    KRK6VlgNVAcaqJfEMRnUBHVIz+eN0YLgQlErlN1OImZXUK+mDrswsAndDkuJm87YyrVFir
    6pGtMVEKO7P6AMQUNj/w5yWt+RvtLwamEDlh4CTTbQmjyIyaFQuwglM1lIgt8+EMYKsyc8
    QDzRdtlqYjaKFBhnsSiB7v3YgV7ilo0htpmSTU64epm2i24ht1zOTVVeo1/xwR+jq6YueC
    e+m6S1b/I6swLtn8+TQ4OlzvfywDrVH0kKxC3MaMLDvlYKWv/20JU4Xa0O8F1yduEvqLZ6
    W4KEOk5e6RabIHat4zpAH6DukI+1Jf2fcthNypi8JLcf/VZhfrTvVXSUtOZ6tf3g9fzM1F
    uruqwiB0/L2OAT0pfKa09xzZGQRyh3V9D0G2HtZtAjm5PKvK+jjmmFZG5z9Q
X-ME-Proxy: <xmx:GLOnanOuPH2qY-ejmY9LlwgjmHxXdsL2Zo1EK1-W-GDeKlYUFeOSiw>
    <xmx:GLOnaqnc41o4MWb6eo8g3G6d8jjXLsbw0ggXcro2XXKDG0jAO1Z-NQ>
    <xmx:GLOnatuc9Vsg4UmyEyOonWLzoN_6uZNXRV7Ct7mACffKCbyTDuw2Dg>
    <xmx:GLOnalqmLybu1Wr8b-v8Y3hie8zPuXfoCOFE8WL8gEJ92bLPW8RBVQ>
    <xmx:GLOnaklDmoH7GIwJ7Z_X9NagORVw1g_CvVEuo1KrwibPlda38PD_7BOZ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:55 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:40 +0200
Subject: [PATCH v2 10/13] arm64: dts: apple: t8122: Fix most property-order
 dt-check-style issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-10-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16483; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=0r3QMDr1W369qSjg34sBLU7Z3UzrMAd5SbVSrae4pOY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm1mqF815rTiZafuy2QsYHnHOaWP4tHzjvaJjsxfo5
 90uX5D8taOUhUGMi0FWTJElSftlB8PqGsWY2gdhMHNYmUCGMHBxCsBE4p8z/JXrL7to9rja0ND5
 f5u08JyVIW11rkF+FTpb91e7VjEyXmdkeLH4/olDPitXfcqQEr06UZTPMjPa677BgtvxP/2Kj95
 p4gIA
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
index cf9cd0781fde..173c05a55fc1 100644
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
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>;
 			/*
 			 * TODO: figure out the clocking properly, there may
 			 * be a third selectable clock.
 			 */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>;
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

