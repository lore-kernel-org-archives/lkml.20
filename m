Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EB45111A8;
	Wed,  9 Sep 2026 10:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949657; cv=none; b=cyu74QwPRpq3fQU17DV+cGlM90HdAtHnZvR8d3hGeejKV1jY8aU6MBOa4KqU5hxmt78AKOnHJlOS+cKMgBDAhD6UnZdr0txyrHbQRa474RszMpYr/cAgUPyRFBVbfvsgwejyUzv6611TA1+ovJPO2YSNCgACDYVHoRnJBx5kN9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949657; c=relaxed/simple;
	bh=6idYn0iMxrSZWTO3+P/lCSXlOySJMXyZGTt6kzP+380=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2UBd4FHLznejs547jVpi0zr0qXaWAIkh4r9cZVSame4tG8Kg8WGUNK4pA0qk4LfarTa2/32CgLI0abFnWAlUDFJ/Kbn8d9NRSk+si1fNrIabSGwIhZCytzK6tD5GU4hCnLVDnyFuVCR5ZnBGOy0DBGg0Sje40LTfzXrCwLaIsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=RmDbcz1H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BwrPnm2L; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="RmDbcz1H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BwrPnm2L"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 48C851D000AE;
	Wed,  9 Sep 2026 06:27:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 09 Sep 2026 06:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949649;
	 x=1789036049; bh=8qa88L4VpiR+GdE+L50d8ZtFnXr1g9uY2Kmz6nZEqc8=; b=
	RmDbcz1HlShIXYIHtdhR2ZcZeL7oWUjlz0FQkdlA4DRWjvghqb7g5xcwAaNhdYFa
	b/8X5qN43ZoEBMmjOy+jZ2olyoCfzVoe+kb0pyqRVU4RxVVKUxXJeyXWEQY1pf2/
	JvfLMgB9q1QpuzPPlAp4IXJ85eMqsZ76iJMFI2JSIQt4CxSAIa6K/jLdCe4f1Q4X
	w1deyQFeWB5Cl34I2i+kho7L3LS9EzDdRczWTmb31ADzpPOp8K0+1mC4ApYuaQYp
	yXFTbaQjbm64fRTTYUjwT6nvsYLh7LFoE6O9FW1oxBhh3q22SjkuBBMBt9EXhd8L
	D5Q4/poHlX7GQpRbgEZN/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949649; x=
	1789036049; bh=8qa88L4VpiR+GdE+L50d8ZtFnXr1g9uY2Kmz6nZEqc8=; b=B
	wrPnm2LJYdVfblxBA6G++VZZ3I0mBO+MDe0gxuZX3oENeS5eG+3I/03ASFr1YMbD
	4O7SpZ8xc7regyXVhL5D6Xwhshe3T2s1XUuPy6abtVdx4VXCiIhcKl7y1h3JHGs+
	5SiP4sdKkFUuzEmjK97ncu0WUQxEcnNt4PGj66mdzVPVQjH2T0R8qAvGwhoK1mjC
	TiX6pAd9Y/Wgd2WXpczsxEcGE64YYPXXT4I38Aw26B/4WMFMOz2HGDc4BR8Hm0LQ
	bpMN/xad2i/0zZfrndKwcsBgp9o9c6zt5eS++Qfjd6eTOmSUI03unCgPUR72WcpX
	dRuN+KcrY3WfwZ8hFF6DA==
X-ME-Sender: <xms:kTShapmk9DIV8LLy8lr2pcEI5hnopvWwBPQ-R5myjd4vb3gxBiLBWA>
    <xme:kTShatCbiavEMRJqBFNAHN-pYfd8kyP29tr7sEcPNfbYvvN9Fp4XqSKq9yNKHUwUE
    A3SZoPejE_ZULRGch5oSTA5L7zsGG2Pc4NNkLnZO-UVWjtpcsC9-XsJ>
X-ME-Received: <xmr:kTSharP5zjiP8yzKLJA-uZ9WV6i3FxFi5PEtws7g-5p5LKx0GxDOMl0eX7poZ-TB2Ohz4GL6R5dUsBnVzKOsHgfZHPQKE7IWwfjxOQ>
X-ME-Proxy-Cause: dmFkZTGRaba3+elOqz6mGGfoSBiCZjC/P/YvC69oBfXDxkDuqW/gUqUM7TPyVKN7JzWQcY
    OdgxBJKfTLC7846+OYry0bSGE3xPk45JsOaAAzIo+S60yc9dnozlXeTnxUCa8BC9WAofmP
    2h8SJRrVPiFrYykhuCN5Ui35oWh3qrE6i71iwiq+wmnBxYsu7hjRVs9cELF36bc9jk/U3T
    5S1a+Wwegu/IfmjiZKHiru3+U7GImKU6XUF4r2pfYthynWgu/Xr4vJPQ0jJnDE1SnUgtv7
    mYqfT1BvFbpc/gySMvvWitm70hE4QNzGMUWLc89BusjcFaWCYcUGzgjnN8tuyQcm566utT
    9eH2YfduD38aCWFI4Y1UowSnMQOetXA8FdVoKXWt4vdLSVw0wYkIbyAL52kjyTuiC5zmA8
    YvJYnqvVpp6EKOGtaF9DWpcYH9CbZVsjTFxokIlFmVEv3C1dMKlwHmWOSuZur0dZUwDWSE
    aj3ghyDkWBMSs9uoTsmFe/i8wpBhj+DxN3jEiqpF0p2aIEFsgPPxI95wzcTGLF0zRSbEje
    R69eYWWg+cFMPLDaVhCiOHaNE0t1h3uoq5OsRLsMFUQZi/OHnIU1HzJifmog/3aRXFcYfk
    n70IMstbBMI8/LToE9T+aFIZjFKXOlfqAAVW1ONLyHeKOEd7JaG9q4Rhwo5A
X-ME-Proxy: <xmx:kTShakOp8_GV0g5ZFfYxObnnMy0qiyE3cf9o39gggsVgWNqpF4aXhg>
    <xmx:kTShajmH4wlWE_MVybF3x67gTOM2vKT1HFRGHDfDa8EHY1i8SeZbyQ>
    <xmx:kTShaiuczq7w7Z2dD2gOtYMSlBBvTO9Kg7Hhhtf3nwBXtlQaFhKgug>
    <xmx:kTShamo7th_VjV30Rr4VCEYBeYHeTI_9CJxsP9s_UYtHcNZNNLe2CQ>
    <xmx:kTShalnxwwZSM2BNepyCkuSTStg5kf5FKza6B_7GhAZSpwJdRTGCjNMm>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:28 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:05 +0200
Subject: [PATCH 09/13] arm64: dts: apple: t603[12]: Fix most property-order
 dt-style-check issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-9-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=31062; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=6idYn0iMxrSZWTO3+P/lCSXlOySJMXyZGTt6kzP+380=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpXiM67HP7R9d1y4/+4amyU7W2TWPWSPsVk693nR/
 auZVXK7O0pZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAExkVzUjQ1vDh7g0ljaTK3+k
 badonUyxM5tzNiPjm+KN/3anlp7ITGFkmLisfL72P26HpPigb3q+vHyLHpu+fGgQLeXH0JTVwnG
 UDQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

t6031-pmgr.dtsi is left unchanged because future additions or
modifications will be sparse.

Not fixed are

| [property-order] property 'd-cache-size' out of canonical order (should sort before 'enable-method')

for all CPU nodes to keep cache related properties together. A blank
line is added before 'd-cache-size' to attenuate this grouping for human
consumption.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6031-base.dtsi      | 154 ++++++++++++-----------
 arch/arm64/boot/dts/apple/t6031-die0.dtsi      |  39 +++---
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi      |  44 ++++---
 arch/arm64/boot/dts/apple/t6031.dtsi           |   7 +-
 arch/arm64/boot/dts/apple/t6032-j575d.dts      |   2 +-
 arch/arm64/boot/dts/apple/t6032.dtsi           | 162 ++++++++++++++-----------
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi |   8 +-
 7 files changed, 223 insertions(+), 193 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6031-base.dtsi b/arch/arm64/boot/dts/apple/t6031-base.dtsi
index 667f32e9e606..f62ce0690182 100644
--- a/arch/arm64/boot/dts/apple/t6031-base.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-base.dtsi
@@ -95,216 +95,232 @@ core5 {
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
 
 		cpu_p10: cpu@10200 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10200>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_2>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_2>;
 		};
 
 		cpu_p11: cpu@10201 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10201>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_2>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_2>;
 		};
 
 		cpu_p12: cpu@10202 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10202>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_2>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_2>;
 		};
 
 		cpu_p13: cpu@10203 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10203>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_2>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_2>;
 		};
 
 		cpu_p14: cpu@10204 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10204>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_2>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_2>;
 		};
 
 		cpu_p15: cpu@10205 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10205>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_2>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_2>;
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
 
 		l2_cache_2: l2-cache-2 {
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
 
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 		interrupts = <AIC_FIQ 0 AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ 0 AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ 0 AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ 0 AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t6031-die0.dtsi b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
index 57f44f1fbe6e..b14443436e26 100644
--- a/arch/arm64/boot/dts/apple/t6031-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
@@ -9,12 +9,12 @@
 &SOC_NODE {
 	aic: interrupt-controller@292400000 {
 		compatible = "apple,t6031-aic3", "apple,t8122-aic3";
-		#interrupt-cells = <4>;
-		interrupt-controller;
-
 		reg = <0x00000002 0x92400000 0x00000000 0x1cc000>,
 		      <0x00000002 0x92440000 0x00000000 0x4000>;
 		reg-names = "core", "event";
+
+		#interrupt-cells = <4>;
+		interrupt-controller;
 		power-domains = <&ps_aic>;
 	};
 
@@ -30,13 +30,12 @@ pinctrl_smc: pinctrl@2a4820000 {
 		compatible = "apple,t6031-pinctrl", "apple,t8103-pinctrl";
 		reg = <0x2 0xa4820000 0x0 0x4000>;
 
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 		gpio-ranges = <&pinctrl_smc 0 0 30>;
-		apple,npins = <30>;
 
-		interrupt-controller;
 		#interrupt-cells = <2>;
+		interrupt-controller;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 904 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ 0 905 IRQ_TYPE_LEVEL_HIGH>,
@@ -45,31 +44,33 @@ pinctrl_smc: pinctrl@2a4820000 {
 			     <AIC_IRQ 0 908 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ 0 909 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ 0 910 IRQ_TYPE_LEVEL_HIGH>;
+
+		apple,npins = <30>;
 	};
 
 	i2c0: i2c@391010000 {
 		compatible = "apple,t6031-i2c", "apple,t8103-i2c";
 		reg = <0x3 0x91010000 0x0 0x4000>;
+		#address-cells = <0x1>;
 		clocks = <&clkref>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 1326 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-0 = <&i2c0_pins>;
 		pinctrl-names = "default";
 		power-domains = <&ps_i2c0>;
-		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 	};
 
 	i2c1: i2c@391014000 {
 		compatible = "apple,t6031-i2c", "apple,t8103-i2c";
 		reg = <0x3 0x91014000 0x0 0x4000>;
+		#address-cells = <0x1>;
 		clocks = <&clkref>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 1327 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-0 = <&i2c1_pins>;
 		pinctrl-names = "default";
 		power-domains = <&ps_i2c1>;
-		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 
 		status = "disabled";
@@ -78,13 +79,13 @@ i2c1: i2c@391014000 {
 	i2c2: i2c@391018000 {
 		compatible = "apple,t6031-i2c", "apple,t8103-i2c";
 		reg = <0x3 0x91018000 0x0 0x4000>;
+		#address-cells = <0x1>;
 		clocks = <&clkref>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 1328 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-0 = <&i2c2_pins>;
 		pinctrl-names = "default";
 		power-domains = <&ps_i2c2>;
-		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 
 		status = "disabled";
@@ -93,13 +94,13 @@ i2c2: i2c@391018000 {
 	i2c3: i2c@39101c000 {
 		compatible = "apple,t6031-i2c", "apple,t8103-i2c";
 		reg = <0x3 0x9101c000 0x0 0x4000>;
+		#address-cells = <0x1>;
 		clocks = <&clkref>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 1329 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-0 = <&i2c3_pins>;
 		pinctrl-names = "default";
 		power-domains = <&ps_i2c3>;
-		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 
 		status = "disabled";
@@ -108,13 +109,13 @@ i2c3: i2c@39101c000 {
 	i2c4: i2c@391020000 {
 		compatible = "apple,t6031-i2c", "apple,t8103-i2c";
 		reg = <0x3 0x91020000 0x0 0x4000>;
+		#address-cells = <0x1>;
 		clocks = <&clkref>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 1330 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-0 = <&i2c4_pins>;
 		pinctrl-names = "default";
 		power-domains = <&ps_i2c4>;
-		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 
 		status = "disabled";
@@ -123,13 +124,13 @@ i2c4: i2c@391020000 {
 	i2c5: i2c@391024000 {
 		compatible = "apple,t6031-i2c", "apple,t8103-i2c";
 		reg = <0x3 0x91024000 0x0 0x4000>;
+		#address-cells = <0x1>;
 		clocks = <&clkref>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 1331 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-0 = <&i2c5_pins>;
 		pinctrl-names = "default";
 		power-domains = <&ps_i2c5>;
-		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 
 		status = "disabled";
@@ -138,13 +139,13 @@ i2c5: i2c@391024000 {
 	i2c6: i2c@391028000 {
 		compatible = "apple,t6031-i2c", "apple,t8103-i2c";
 		reg = <0x3 0x91028000 0x0 0x4000>;
+		#address-cells = <0x1>;
 		clocks = <&clkref>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 1332 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-0 = <&i2c6_pins>;
 		pinctrl-names = "default";
 		power-domains = <&ps_i2c6>;
-		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 
 		status = "disabled";
@@ -153,13 +154,13 @@ i2c6: i2c@391028000 {
 	i2c7: i2c@39102c000 {
 		compatible = "apple,t6031-i2c", "apple,t8103-i2c";
 		reg = <0x3 0x9102c000 0x0 0x4000>;
+		#address-cells = <0x1>;
 		clocks = <&clkref>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 1333 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-0 = <&i2c7_pins>;
 		pinctrl-names = "default";
 		power-domains = <&ps_i2c7>;
-		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 
 		status = "disabled";
@@ -168,13 +169,13 @@ i2c7: i2c@39102c000 {
 	i2c8: i2c@391030000 {
 		compatible = "apple,t6031-i2c", "apple,t8103-i2c";
 		reg = <0x3 0x91030000 0x0 0x4000>;
+		#address-cells = <0x1>;
 		clocks = <&clkref>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 1334 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-0 = <&i2c8_pins>;
 		pinctrl-names = "default";
 		power-domains = <&ps_i2c8>;
-		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 
 		status = "disabled";
@@ -183,8 +184,8 @@ i2c8: i2c@391030000 {
 	fpwm0: pwm@391040000 {
 		compatible = "apple,t6031-fpwm", "apple,s5l-fpwm";
 		reg = <0x3 0x91040000 0x0 0x4000>;
-		power-domains = <&ps_fpwm0>;
 		clocks = <&clkref>;
+		power-domains = <&ps_fpwm0>;
 		#pwm-cells = <2>;
 
 		status = "disabled";
@@ -193,16 +194,16 @@ fpwm0: pwm@391040000 {
 	serial0: serial@391200000 {
 		compatible = "apple,s5l-uart";
 		reg = <0x3 0x91200000 0x0 0x4000>;
-		reg-io-width = <4>;
-		interrupt-parent = <&aic>;
-		interrupts = <AIC_IRQ 0 1303 IRQ_TYPE_LEVEL_HIGH>;
 		/*
 		 * TODO: figure out the clocking properly, there may
 		 * be a third selectable clock.
 		 */
 		clocks = <&clkref>, <&clkref>;
 		clock-names = "uart", "clk_uart_baud0";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 0 1303 IRQ_TYPE_LEVEL_HIGH>;
 		power-domains = <&ps_uart0>;
+		reg-io-width = <4>;
 
 		status = "disabled";
 	};
diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index 01fe459259a4..bd73d691f0d8 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -9,32 +9,28 @@
 &SOC_NODE {
 	DIE_NODE(pmgr): power-management@292280000 {
 		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		reg = <0x2 0x92280000 0 0xc000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-
-		reg = <0x2 0x92280000 0 0xc000>;
 	};
 
 	DIE_NODE(pmgr1): power-management@292800000 {
 		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		reg = <0x2 0x92800000 0 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-
-		reg = <0x2 0x92800000 0 0x4000>;
 	};
 
 	DIE_NODE(pinctrl_nub): pinctrl@2a01f0000 {
 		compatible = "apple,t6031-pinctrl", "apple,t8103-pinctrl";
 		reg = <0x2 0xa01f0000 0x0 0x4000>;
-		power-domains = <&DIE_NODE(ps_nub_gpio)>;
 
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 		gpio-ranges = <&DIE_NODE(pinctrl_nub) 0 0 59>;
-		apple,npins = <59>;
 
-		interrupt-controller;
 		#interrupt-cells = <2>;
+		interrupt-controller;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ DIE_NO 710 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ DIE_NO 711 IRQ_TYPE_LEVEL_HIGH>,
@@ -43,27 +39,28 @@ DIE_NODE(pinctrl_nub): pinctrl@2a01f0000 {
 			     <AIC_IRQ DIE_NO 714 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ DIE_NO 715 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ DIE_NO 716 IRQ_TYPE_LEVEL_HIGH>;
+
+		power-domains = <&DIE_NODE(ps_nub_gpio)>;
+		apple,npins = <59>;
 	};
 
 	DIE_NODE(pmgr_mini): power-management@2a0280000 {
 		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		reg = <0x2 0xa0280000 0 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-
-		reg = <0x2 0xa0280000 0 0x4000>;
 	};
 
 	DIE_NODE(pinctrl_aop): pinctrl@2a8824000 {
 		compatible = "apple,t6031-pinctrl", "apple,t8103-pinctrl";
 		reg = <0x2 0xa8824000 0x0 0x4000>;
 
-		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-controller;
 		gpio-ranges = <&DIE_NODE(pinctrl_aop) 0 0 102>;
-		apple,npins = <102>;
 
-		interrupt-controller;
 		#interrupt-cells = <2>;
+		interrupt-controller;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ DIE_NO 595 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ DIE_NO 596 IRQ_TYPE_LEVEL_HIGH>,
@@ -72,12 +69,22 @@ DIE_NODE(pinctrl_aop): pinctrl@2a8824000 {
 			     <AIC_IRQ DIE_NO 599 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ DIE_NO 600 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ DIE_NO 601 IRQ_TYPE_LEVEL_HIGH>;
+
+		apple,npins = <102>;
 	};
 
 	DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
 		compatible = "apple,t6031-pinctrl", "apple,t8103-pinctrl";
 		reg = <0x2 0xb3000000 0x0 0x4000>;
 
+		clocks = <&clkref>;
+
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-ranges = <&DIE_NODE(pinctrl_ap) 0 0 200>;
+
+		#interrupt-cells = <2>;
+		interrupt-controller;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ DIE_NO 458 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ DIE_NO 459 IRQ_TYPE_LEVEL_HIGH>,
@@ -87,23 +94,14 @@ DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
 			     <AIC_IRQ DIE_NO 463 IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_IRQ DIE_NO 464 IRQ_TYPE_LEVEL_HIGH>;
 
-		clocks = <&clkref>;
 		power-domains = <&DIE_NODE(ps_gpio)>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&DIE_NODE(pinctrl_ap) 0 0 200>;
 		apple,npins = <200>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
 	};
 
 	DIE_NODE(pmgr_gfx): power-management@408e80000 {
 		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		reg = <0x4 0x8e80000 0 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-
-		reg = <0x4 0x8e80000 0 0x4000>;
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t6031.dtsi b/arch/arm64/boot/dts/apple/t6031.dtsi
index 2ba0768c33bc..a2aa64ea9db9 100644
--- a/arch/arm64/boot/dts/apple/t6031.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031.dtsi
@@ -21,13 +21,12 @@ / {
 
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
 
 		// filled via templated includes at the end of the file
 	};
diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index 71f4a00e1b1c..1c4a0fc9bd6f 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -20,9 +20,9 @@ aliases {
 	};
 
 	chosen {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		stdout-path = "serial0";
 
diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index aa48f2483fbb..efe56d2a9a79 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -101,228 +101,244 @@ core5 {
 		};
 
 		cpu_e10: cpu@800 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x800>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_3>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_3>;
 		};
 
 		cpu_e11: cpu@801 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x801>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_3>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_3>;
 		};
 
 		cpu_e12: cpu@802 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x802>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_3>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_3>;
 		};
 
 		cpu_e13: cpu@803 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x803>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_3>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_3>;
 		};
 
 		cpu_p20: cpu@10900 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10900>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_4>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_4>;
 		};
 
 		cpu_p21: cpu@10901 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10901>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_4>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_4>;
 		};
 
 		cpu_p22: cpu@10902 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10902>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_4>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_4>;
 		};
 
 		cpu_p23: cpu@10903 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10903>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_4>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_4>;
 		};
 
 		cpu_p24: cpu@10904 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10904>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_4>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_4>;
 		};
 
 		cpu_p25: cpu@10905 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10905>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_4>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_4>;
 		};
 
 		cpu_p30: cpu@10a00 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10a00>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_5>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_5>;
 		};
 
 		cpu_p31: cpu@10a01 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10a01>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_5>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_5>;
 		};
 
 		cpu_p32: cpu@10a02 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10a02>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_5>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_5>;
 		};
 
 		cpu_p33: cpu@10a03 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10a03>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_5>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_5>;
 		};
 
 		cpu_p34: cpu@10a04 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10a04>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_5>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_5>;
 		};
 
 		cpu_p35: cpu@10a05 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10a05>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_5>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_5>;
 		};
 
 		l2_cache_3: l2-cache-3 {
 			compatible = "cache";
 			cache-level = <2>;
-			cache-unified;
 			cache-size = <0x400000>;
+			cache-unified;
 		};
 
 		l2_cache_4: l2-cache-4 {
 			compatible = "cache";
 			cache-level = <2>;
-			cache-unified;
 			cache-size = <0x1000000>;
+			cache-unified;
 		};
 
 		l2_cache_5: l2-cache-5 {
 			compatible = "cache";
 			cache-level = <2>;
-			cache-unified;
 			cache-size = <0x1000000>;
+			cache-unified;
 		};
 	};
 
 	die0: soc@200000000 {
 		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
 		ranges = <0x02 0x00000000 0x02 0x00000000 0x4 0x00000000>,
 			 <0x05 0x80000000 0x05 0x80000000 0x1 0x80000000>,
 			 <0x07 0x00000000 0x07 0x00000000 0xf 0x80000000>,
 			 <0x16 0x80000000 0x16 0x80000000 0x5 0x80000000>;
-		nonposted-mmio;
+		#address-cells = <2>;
 		/* Required to get >32-bit DMA via DARTs */
 		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
+		nonposted-mmio;
+		#size-cells = <2>;
 
 		// filled via templated includes at the end of the file
 	};
 
 	die1: soc@2200000000 {
 		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
 		ranges = <0x02 0x00000000 0x22 0x00000000 0x4 0x00000000>,
 			 <0x07 0x00000000 0x27 0x00000000 0xf 0x80000000>,
 			 <0x16 0x80000000 0x36 0x80000000 0x5 0x80000000>;
-		nonposted-mmio;
+		#address-cells = <2>;
 		/* Required to get >32-bit DMA via DARTs */
 		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
+		nonposted-mmio;
+		#size-cells = <2>;
 
 		// filled via templated includes at the end of the file
 	};
diff --git a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
index 3ac8a2f0723b..c9af6103487a 100644
--- a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
+++ b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
@@ -25,9 +25,9 @@ aliases {
 	};
 
 	chosen {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		stdout-path = "serial0";
 
@@ -50,11 +50,11 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-0 {
-			pwms = <&fpwm0 0 40000>;
-			function = LED_FUNCTION_KBD_BACKLIGHT;
 			color = <LED_COLOR_ID_WHITE>;
-			max-brightness = <255>;
 			default-state = "keep";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			max-brightness = <255>;
+			pwms = <&fpwm0 0 40000>;
 		};
 	};
 };

-- 
2.55.0

