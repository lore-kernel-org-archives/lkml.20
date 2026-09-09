Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAA503BDE;
	Wed,  9 Sep 2026 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949651; cv=none; b=X8CN3NjDyEXKvJi0C1Qd80Fe5WaFMSJ85GD/ffow4WSO3IWHRCLU5k04OtkPPNnxHTtI0zSb0C12HFaHrSUD2js5cI4Je1n61i6/ar/iym5Uc/u1iobykG1piRHpadcdC71JzSdaBIM8wc387YHcYGdPfnRCeIi9ybU3C2XZwv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949651; c=relaxed/simple;
	bh=C7S7XHfxQnp5uE+3F+9w2T8pnzHGI5LbglHOzy5r0d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aF99CFWa4iyHIC1ckE9mUN98Dhhoea7FyMzSwGv1ZsZjaMZ69QUJneqWsLwHReyBmEe02DY3ceEoVZVTDNwQTHwtglmg75yGWovuU/fNGVq0QS7Q0OOjw4yCKQI3UkFUCQ3dcuo8t36pPhar6uRyC3CYRu5Z14hn+rxrtY5MvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=ZoBPOujd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iwTcCBhQ; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="ZoBPOujd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iwTcCBhQ"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0A9527A00BF;
	Wed,  9 Sep 2026 06:27:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 09 Sep 2026 06:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949646;
	 x=1789036046; bh=ZkT5VcAQQpKlpqulmTBWpPKXElg6p9FdyGKZi+5QEAY=; b=
	ZoBPOujduRYzc81ddw8KKn2JeWfQy8i/1aG7BMXfJ+Tbl71cuDS0191K+uAfNcCn
	tWqE6E0wSL2ybxMOhfF8jZjllos4a0HMiQTTWCLP1QI95EtDW3VG6iCAVnBOr4tI
	DFfH6q/V8cV1WoLHH60Br+2C9s50BYlp4cUN21GUqBrv7j7R34CcJ5q7Ev5BSdx4
	uGT7AO83YcYpRwPvpudXKyqYVQrT1JprXcR3QwO27hR1VAfWzSDXxyZOyQAAhjRD
	ZioNLHOepIRWEyVf5WfRnAsuLvic7utxUbmCzbI8XQHqRDka1cZYr/UAcJsK8Eij
	Sd3RJ1aVnoAc+1BzVEhOmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949646; x=
	1789036046; bh=ZkT5VcAQQpKlpqulmTBWpPKXElg6p9FdyGKZi+5QEAY=; b=i
	wTcCBhQWkE4zz41cTZTGUDaVSDjFnb7VbuFTvCo0BIezDAvcQbmHAR9u/KaF6dEb
	S9RyX8u+pKqvyzl8tz3GSTZQPMb3zJCJIJWjFSPXR9UDSR+kJSPLXSrWBAY0PaEr
	2h+44YRVsQa/k/NH4lXSkhEHf+Cmp+aXUSQTfjGBxBwB2YBz9+NqXbDhmGqrTsam
	fw+q4wwBSOV33uThpIh61sht+KjTVOFXDbu9kF2uBK32+TZI8M0TCBx3BVRtCJRd
	ZPCqVLpe8BcOUoRteXXqT4wvwpvIbx00JWsZMaCA6PeV+Hamp+W/QAPbdIHkQixH
	Ax0cBKYl8feqPI+k7nLCw==
X-ME-Sender: <xms:jjShajebvBVsLUOl_GJ5JeXv-prL5EuWLYyVK6PjpMByLqmJcGxIWg>
    <xme:jjShahaR5z89nlv7_f9-EqgqsQG6g9rS_ec8vlYy0_2rdguAmmrS_4tc1-bSwWF-8
    G0ze1MEVhebrueC8YDAMMcalByWb6mlp2S-KJyUqu413OifzMuiI8dY>
X-ME-Received: <xmr:jjShaoFMtZ_QcRHR9hUpW_ISlR5v_VNc_D85nHK45iaKPimqaTwtK78pqgOXaiklMC2-e9dmnpzhIhznUmapZxKtM_7UL-KV4uh5mA>
X-ME-Proxy-Cause: dmFkZTESry9O/DPGKe0VZV6GxKkpthVVgrSgQusifTMlX7/k4FmmR6JoX50yJgJEvkYX2z
    CHfDcHGOklHamKt0x434he/uqWpXBqTGuHAQccODIQsInwl4DARBkTt78fIMraLs1+mpmI
    gK3HK4DF3fMdJIkGYwWoIlL7b0TcU88RezOQk6aH2u2DUkvIm376c4Gcng6HKagr2g/4oy
    o6pMOtYyvZCZxjwOi28nN5RZFIsXR9v+DDcXlt0VuM//1gcusssrXm8JsyhzugG4ZlPwTF
    GO8UZJEkbKavlsZDolduW0Y35QI6ft+zZ538PCvD4tvmP6zy2twexC+T6jns9oe9fFkMnh
    2Z93M4Q7/JtJ72hVbdgdh/l5EX32bOqrCVtcro9FqxcpMdpEIYMWWKOsYYoxD5Y4zh+xnK
    3y1Y7RedniVQikYymvt3uFvlItDmAY0eXiTBg7uuzRZUcZVL0FnjG3hLZQIBfMyZbseOUK
    kOGutu4ZNmlZlm9jmLlOIov3+SyRTH46oH1SwJOj+f1A6mdx98j/2dQsqDEivg0AJyQVOt
    YFhe2Rq5mRKSJQajiVmddpc6gETnr/llnzUXQIVfAJSfqJ9L838NYrmBqdIqmZdbPIWndJ
    RKJPh54lNphExTDEksl7WFDT1TNo0n3aIB4OU6AEfwkpGPwZKo9qWEu063HA
X-ME-Proxy: <xmx:jjShavn-UapRE2fbQe8bNKAARZh3GpHj9-I10bWJ9XWH5pzaKWJthA>
    <xmx:jjShareJ1yIJJATMcUz740gncV5Nh-hlRhZilqddUqEibxraSPbqxg>
    <xmx:jjShatHfGBkR7KBWa5D4yBUlXN_UgWEHytSST17MtJUkLUf-fMPxSw>
    <xmx:jjShahgtJGsXgf4N5vYzzqoWTcQo3mnlt2NMN6RnN5sXdTqlX_aqyA>
    <xmx:jjShaucstC0FzyDu2jaq9eEX3-Vr9Aom3pBc7Y5LL4uEwO90iwB6BN1S>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:26 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:04 +0200
Subject: [PATCH 08/13] arm64: dts: apple: t6030: Fix most property-order
 dt-style-check issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-8-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16105; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=C7S7XHfxQnp5uE+3F+9w2T8pnzHGI5LbglHOzy5r0d0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpXKuxvnlmdUJ/tti1mYsuvscs/Wt8EfDU/63Pzdc
 mL7g09rOkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEyE7wHDX4HMaqN90xY7mHXe
 NZiw59lhT2Vfv36D5JOpp2qvXLxny8/wz07xmZ9ux/3Og31cDdGiuiZaLltOnL5/oXDz32uBPuG
 r2AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

t6030-pmgr.dtsi is left unchanged because future additions or
modifications will be sparse.

Not fixed are

| [property-order] property 'd-cache-size' out of canonical order (should sort before 'enable-method')

for all CPU nodes to keep cache related properties together. A blank
line is added before 'd-cache-size' to attenuate this grouping for human
consumption.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030.dtsi | 218 ++++++++++++++++++-----------------
 1 file changed, 113 insertions(+), 105 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 0b5824c9f1bf..71b75a59f695 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -81,179 +81,190 @@ core5 {
 		};
 
 		cpu_e00: cpu@0 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x0>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e01: cpu@1 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x1>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e02: cpu@2 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x2>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e03: cpu@3 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x3>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e04: cpu@4 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x4>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e05: cpu@5 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x5>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_p00: cpu@10100 {
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
 
 		cpu_p01: cpu@10101 {
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
 
 		cpu_p02: cpu@10102 {
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
 
 		cpu_p03: cpu@10103 {
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
 
 		cpu_p04: cpu@10104 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10104>;
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
 
 		cpu_p05: cpu@10105 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10105>;
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
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 	};
 
 	soc: soc {
 		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-
 		ranges;
-		nonposted-mmio;
+		#address-cells = <2>;
 		/* Required to get >32-bit DMA via DARTs */
 		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
+		nonposted-mmio;
+		#size-cells = <2>;
 
 		i2c1: i2c@289014000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89014000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 890 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c1_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c1>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -261,14 +272,14 @@ i2c1: i2c@289014000 {
 		i2c2: i2c@289018000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89018000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 891 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c2_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c2>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -276,14 +287,14 @@ i2c2: i2c@289018000 {
 		i2c3: i2c@28901c000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x8901c000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 892 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c3_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c3>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -291,14 +302,14 @@ i2c3: i2c@28901c000 {
 		i2c4: i2c@289020000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89020000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 893 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c4_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c4>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -306,14 +317,14 @@ i2c4: i2c@289020000 {
 		i2c6: i2c@289028000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89028000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 895 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c6_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c6>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -321,14 +332,14 @@ i2c6: i2c@289028000 {
 		i2c8: i2c@289030000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89030000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 897 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c8_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c8>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -336,8 +347,8 @@ i2c8: i2c@289030000 {
 		fpwm0: pwm@289040000 {
 			compatible = "apple,t6030-fpwm", "apple,s5l-fpwm";
 			reg = <0x2 0x89040000 0x0 0x4000>;
-			power-domains = <&ps_fpwm0>;
 			clocks = <&clkref>;
+			power-domains = <&ps_fpwm0>;
 			#pwm-cells = <2>;
 
 			status = "disabled";
@@ -346,26 +357,25 @@ fpwm0: pwm@289040000 {
 		serial0: serial@289200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x89200000 0x0 0x1000>;
-			reg-io-width = <4>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>;
 			/*
 			 * TODO: figure out the clocking properly, there may
 			 * be a third selectable clock.
 			 */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&ps_uart0>;
+			reg-io-width = <4>;
 
 			status = "disabled";
 		};
 
 		pmgr_gfx: power-management@290e80000 {
 			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x2 0x90e80000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-
-			reg = <0x2 0x90e80000 0 0x4000>;
 			/* child nodes are added in t6030-pmgr.dtsi */
 		};
 
@@ -373,6 +383,12 @@ pinctrl_ap: pinctrl@347100000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x47100000 0x0 0x4000>;
 
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl_ap 0 0 224>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>,
@@ -383,15 +399,8 @@ pinctrl_ap: pinctrl@347100000 {
 				     <AIC_IRQ 279 IRQ_TYPE_LEVEL_HIGH>;
 
 			power-domains = <&ps_gpio>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_ap 0 0 224>;
 			apple,npins = <224>;
 
-			interrupt-controller;
-			#interrupt-cells = <2>;
-
 			i2c1_pins: i2c1-pins {
 				pinmux = <APPLE_PINMUX(37, 1)>,
 					 <APPLE_PINMUX(36, 1)>;
@@ -425,21 +434,20 @@ i2c8_pins: i2c8-pins {
 
 		pmgr: power-management@350700000 {
 			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x3 0x50700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-
-			reg = <0x3 0x50700000 0 0x14000>;
 			/* child nodes are added in t6030-pmgr.dtsi */
 		};
 
 		aic: interrupt-controller@351000000 {
 			compatible = "apple,t6030-aic3", "apple,t8122-aic3";
-			#interrupt-cells = <3>;
-			interrupt-controller;
-
 			reg = <0x3 0x51000000 0x0 0x184000>,
 			      <0x3 0x51040000 0x0 0x4000>;
 			reg-names = "core", "event";
+
+			#interrupt-cells = <3>;
+			interrupt-controller;
 			power-domains = <&ps_aic>;
 		};
 
@@ -447,6 +455,12 @@ pinctrl_nub: pinctrl@3641f0000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x641f0000 0x0 0x4000>;
 
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl_nub 0 0 37>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 472 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 473 IRQ_TYPE_LEVEL_HIGH>,
@@ -456,21 +470,14 @@ pinctrl_nub: pinctrl@3641f0000 {
 				     <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>;
 
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_nub 0 0 37>;
 			apple,npins = <37>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
 		};
 
 		pmgr_mini: power-management@364280000 {
 			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x3 0x64280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-
-			reg = <0x3 0x64280000 0 0x4000>;
 			/* child nodes are added in t6030-pmgr.dtsi */
 		};
 
@@ -486,13 +493,12 @@ pinctrl_smc: pinctrl@36c820000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x6c820000 0x0 0x4000>;
 
-			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-controller;
 			gpio-ranges = <&pinctrl_smc 0 0 18>;
-			apple,npins = <18>;
 
-			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 545 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 546 IRQ_TYPE_LEVEL_HIGH>,
@@ -501,12 +507,22 @@ pinctrl_smc: pinctrl@36c820000 {
 				     <AIC_IRQ 549 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 550 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 551 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <18>;
 		};
 
 		pinctrl_aop: pinctrl@374824000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x74824000 0x0 0x4000>;
 
+			clocks = <&clkref>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl_aop 0 0 54>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
@@ -516,26 +532,18 @@ pinctrl_aop: pinctrl@374824000 {
 				     <AIC_IRQ 399 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&clkref>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_aop 0 0 54>;
 			apple,npins = <54>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
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

