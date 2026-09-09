Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1C43E9C18;
	Wed,  9 Sep 2026 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949639; cv=none; b=pfE1NQZvoLWXF+T5sfwe5qhcTJHndd/kjFZ7izemSEKc4VryXWOy+dV6akFFoY7p2Zj6e4uKGLcm9yGjI5zbFVhmuQvIhjhffTBXYFJ1GsVcwARfgbMV5VKQ8/TpBoWY8ZymvGPyMeamZcjozhP4u58/EsVX856ONlfJICUV74s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949639; c=relaxed/simple;
	bh=sDA014IFMyQbbbDqEeTzq4+uA6KJJPGdzVuJQBtklQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VnloIhiSQU7kq52h45k3bzG3Ohew7qZFj/tWKcWDNmsphYXwZGnZoq+4JtT4MEaRRdWJwNDqPI3CyMsE+HnNff0IO8Or9RlJggLPwBpRhNKuqRgdNGT1GEnWhLITzzf0KOAY9Kng9mujMy+uJutooheozqAfLdkXK+VpMURAB74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=ncmIz0O4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LE43dJw5; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="ncmIz0O4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LE43dJw5"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 155787A008A;
	Wed,  9 Sep 2026 06:27:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 09 Sep 2026 06:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949635;
	 x=1789036035; bh=DXcx2TrxsMWv23FCyocW6ViAOLRbNVvuyxPi2KJAD9c=; b=
	ncmIz0O4GX3URf7/frabKjQsDO7Xcw3A71ORWIcEOeTtQDNt0BQ9U+b1EOUKpOTE
	eNdnBzk49WW8+JMJt4IvzG/oR1t0HsAyaqPzw7IxR/RyKX+7CIjd6t9hevY/RWtH
	nQxP4wAy5S4XGw1Qc90m8Yi7fj5aw4WWNfr5+Hgb0ASjjyZUAwlqc72VVvjnM7cx
	ks3nmd3wBoNU3fPr9Kqq+ExwK5rfIJzfAqEik9YeM6Wn2lXUvTX4jzUyupCpRjyu
	kd4qFGdrn2rBsZf1EdKypzgslTtWgEqWsKWFENbQ4Gm1OK4FeFxRgZgTmwtZVKKY
	VixyJmwRM6Ap5lfRhhRQ0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949635; x=
	1789036035; bh=DXcx2TrxsMWv23FCyocW6ViAOLRbNVvuyxPi2KJAD9c=; b=L
	E43dJw5iQQLkMUYR48vS9bWxvgjtW7xneWpOhcufXMZjVU/L9SFnunojTXEA1q4g
	gGLeZiU3lpYj968P7FpWQuhGakoGLBAw83I1ML7wRbkBLmDPhwy7847+XGaSyImW
	wM136B2eTNjfHr9eDq3Ms54CAWFWBOifKn4XrQqk/rvdew+Nsfzs0dydW2UDd/tu
	FLvKgXFAPCqqD6aKsq7wKztjSIywlAkz12LZD+vDahEV4Tx5HuXbQ6yAFeFAjFi5
	PE5seFINpKFdfTSdIj680rEBdREhkvn8+MfCvSRus394xtqh5A6GDDN+Wwxjh2iK
	Lba3099jLc4+4LOqo0obg==
X-ME-Sender: <xms:gzShakSnQL3NUt_eXNSmwbgAc_GpL1qNHPeVCUTBkbV20QXT6vbkHQ>
    <xme:gzShap9g8Je3SEpXwpy9ENWIS4eVLfeFfs73U_6vZAKQnjKIxa9OO9Ip93xp8G9nc
    U8oQLHbBX2k9mZAQcitsxkczG6JN7iDuCNY8L_JJWWmflwyajkcQyQC>
X-ME-Received: <xmr:gzShata_NiaJ_9qNbGbFRxEbloDJE-lqWUuhLR9P2ngkzPGzywk_8S2zGCoxoNU8MWbzz_BCnC8s8X1NVlJYLv9lqM3su6ivJ6sc-g>
X-ME-Proxy-Cause: dmFkZTFx5WkaY4CDAlu0ZuU0hrQzpafzkGsOaaQGEhoUmSRPpPX76dVLRDYSy3Ff36O28i
    2b99czRBR+aM2sP9W0jn3TnWedWS1aurEII+sX65de2uh7zYXOOp/7zyDNqGFAsFsn5G92
    BaS0m5e4Kv8PJlU26VdOhZ/DVyTkQd6kagOvbn+jkexDsbD8nNJOHEvi4uQdLIXSeayDWh
    nMJWoPiW/JuVJBDcDNmg7gGLig4IK9iLSNltxhecCMWDtrvVn5YADCi0ePKsJDVJujcxSN
    ZZDmN0eLKwvqavAQsRwATwIBAsHaWpd4LLVFp74ef13oKcetFr2d4tMXguUSWmQiXc9eXA
    jYOi5bn97SVoQGHZJ1e70ebqgnLX1pB06jLtb6d35MkDnoXF0ELkt8PHwZ1/E/o4mc2Aay
    9KivtXH0M5hVvlFSryw4Xhu4hYpMqmPqyNnuMPr7Z/8Br/X5GLuuiHlORIuSZkggf8q8s8
    3aZOTjZKM7rpP2quGb60scov+DpIhrx9qhadTQmXPL/ByQhiogm4BNwbdW2nAhmv548B6L
    9tUyUHAtzQLXpeggnsot0MYonxOWkxRJ9VeJx3KgVyGcQz4KfyFUCqghyArxzzWSp0lFsn
    gfR7iL3UA60VIdekyhEl61OCdY3iNXPQK0fd1os9aTtuDSLvEXafRfiGovEA
X-ME-Proxy: <xmx:gzShaip4akXKwmBO7Q28tHHviGMaQLT0NVUsnQaBQKOo13zkzCcodQ>
    <xmx:gzShapQpUWC9QhvAxxXN9KlKUZg7ymIaEupnoUNdS4oVp-I-OzLddQ>
    <xmx:gzShaup-PpHU_P7iu0siEkyqRaI9ITjPbwcznKJHRWYHCc6aL-EBbQ>
    <xmx:gzShar1gJbkxwlLkRNtxogVuPFG785WM996CQuPQ0WevuV_cMqPLQQ>
    <xmx:gzSham5LhCbf2mK-962JsNnQ3rJfemOgxi8BOUeGJXzUgkdIC-LILVWb>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:15 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:26:59 +0200
Subject: [PATCH 03/13] arm64: dts: apple: t603x: Fix child-name-order
 dt-style-check issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-3-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=sDA014IFMyQbbbDqEeTzq4+uA6KJJPGdzVuJQBtklQw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJhVbpzw3Xbrr1xrPnDnOBRtt5Q+HmJznrIsoMzC/Y
 hz646tpRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIn8SmRkuBoe5B6fPaH75wwW
 Xrug9NUJNZubD3wNbLOW0vzt5a56mJFh7fN9cj48tzyNeJo27uFPtFV0ucb2/MhOnyetUs4PxWf
 yAQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Reorder child nodes by name to fix dt-style-check warnings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030.dtsi      | 34 +++++++++++++++----------------
 arch/arm64/boot/dts/apple/t6031-base.dtsi | 26 +++++++++++------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 0bfa8db59db4..0b5824c9f1bf 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
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
@@ -220,23 +227,6 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
-		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -537,6 +527,16 @@ pinctrl_aop: pinctrl@374824000 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t6030-pmgr.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6031-base.dtsi b/arch/arm64/boot/dts/apple/t6031-base.dtsi
index 6df3be68d740..667f32e9e606 100644
--- a/arch/arm64/boot/dts/apple/t6031-base.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-base.dtsi
@@ -11,6 +11,13 @@ / {
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
@@ -285,6 +292,12 @@ l2_cache_2: l2-cache-2 {
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
@@ -294,17 +307,4 @@ timer {
 			     <AIC_FIQ 0 AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ 0 AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-	};
 };

-- 
2.55.0

