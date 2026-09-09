Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F263E49E4;
	Wed,  9 Sep 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949645; cv=none; b=WHXYEE8y87c2IiEmw0xUW8CdoHSBfoOXSVbfzuAjjid2wfEFCgwfRJOCipGcNqd0ckQfs/o3wdO/InzpvhSKtKnVAzYFchjRVd6YNTFWv3d8Ev0M0+rfIZT0VOGYnwqoaNPLaILjkKDtURVVHsCTWT7fQQcavb77AeoghvEvJio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949645; c=relaxed/simple;
	bh=Oah0LgFEyGqOdR0+X4mlfeZgQU6B7d/SaS0qZscGDPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDRZtRCrvV3gOsZxbVFPJH9rZBbA6LZ0gIXEy98+W9+okvkCgUm3YmbMQtR4qVvFWXC08lXJHdSJIK15rgYeZosMvZdReQ6g+nZ5EvjLeSwHovxp0m9rDxKGqjCYvGQC41W5FiDRI8+BfNrmOkATCgR7fL6XniZMwNSCkmIQGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=aQsAf3yU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ciOAI0Cb; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="aQsAf3yU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ciOAI0Cb"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 951967A00B7;
	Wed,  9 Sep 2026 06:27:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 09 Sep 2026 06:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949642;
	 x=1789036042; bh=adE2QtyHr5FA3h8p/vzzNysjwN90NOIzwiMJGeI1PXY=; b=
	aQsAf3yU3C8qLspcT5c8FQLB7rmSZgtzTzx5hYU19O/2Wy/AO49tHZd5QQUMregI
	US4xc739vlWUB4GBKr6rYFYX9wUkwLtzET8ohWpzfYs44Zp2GA4/RBKFZTGXjIjg
	f6nZ6HOTsgGEBeEiVV2zVQElrXqad+S6AjvT8U/+C4/rS+M6a40Qp2UeIUz9sMDK
	eSM5J5RFDEdpwFKFRTvHlo9zXnoMN//3FO/sn1aspLSyCOdWH0KFKReOr1LPfTss
	WhRGJlBU1vGaCQJ0+iajv3vBZNWhz2uMu7OxAiIjjcDIHNGtO9ml+0miBXDkaFFv
	DHfDxrr6Z3Jdm7kt1/Ewlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949642; x=
	1789036042; bh=adE2QtyHr5FA3h8p/vzzNysjwN90NOIzwiMJGeI1PXY=; b=c
	iOAI0CbC7GGXq1SPXIeYRUHS8JE9BhLNIKSO9WaJLkERZX1kAQgBICVu6Bzx4E62
	apAszPx9c/CqdlwFDlKl51+PJOuWKuV0j5oTCiMqLqWeG7TVeoQkQXLkz6T1uSA2
	Gy3SkaxsWvR3VijC9EYkI+xYsH1pNGONRVcQHFw10Wp4H0WIyV7MSKwiH7REb1Ax
	0B1v81Fa1jFG38DmcaE2fsxgNYzRvlD0LTJBGcWf6odJ86kKmCC5lRmsiirrtlFE
	Qrb3O4m687/kqN8SQM3ckn6DWIne8Wh9kZ6cItTSD6zYC7d2fDaAMXlcJeda5fgB
	MsQbKDt3o0bFfAUru+KWg==
X-ME-Sender: <xms:ijShajR8ojevaPd33bt5tZliZZyF8NVGz1nWQEkGPH4yMwkddx8U5Q>
    <xme:ijShas-qJwaD2p-jZwRmElilgwz2r03sOFPC5mnIFWPpfHEVYouwP-9l1oIi_h0nZ
    qat1xPmpnDA28Kp3eTCRs_08_y12bpndXelMi8zkI-_rAFfKmAys_XL>
X-ME-Received: <xmr:ijShakZ2qMR1toe1GaYaDI71ixSdSyVT-CUevxx0OCRi349hxEKaDT6YN3k9kT39V-Q__ME7tZpoaHxfgWbZVwcLWvfSO4-eZce5PA>
X-ME-Proxy-Cause: dmFkZTGrfMJS/BPnzvFtxFWH7T2NvqB5iRSUYFltsQYoqh91AcAlEZdgxuHZyrYLq3kEOk
    j5wvhkqN1OKl91HrWXzjjavcMXmgvEWC1tfNMr6YyuWRD6//RUDkmVO3/ATEajCWyfZedL
    8sHEPefu4TqdYPDdk53dU84dTpDQmvitB4Jd8BhRBQx2FhHfLph5+6E9Uyo985vYlfK3rV
    DNGLSCjFuasa5/IY8K3MZyQs8cwzlsSAXH1aJt2liMZr6UglJb7lvyAF9z6AbPEzIyhVzl
    HRoRmsqTYvRh/nPj5OrrpEMagZdYAssoR8SKXOADJ0/HyjV/ybNJdeD0QwSSZATBimrjYN
    lk1KDWZW4wWCzP1sTXUWHDsGLp0Pho9JyE+K3WfC6kTWgZJ8N2UqHBk/OpfOGowmE+NIY8
    IO8C60kgVqZB53l8BzPPi7wAYI5Sk2VqPuyvmyeCACzcvI9LVX1gMC2T817QeoVzJxsC00
    CcVeOuAHDCG+s7uDOLDAxEFdmsKfzObYIHrMOySADp/2DIaCGLwxwfXSCO6Fk1iQKCTOsh
    eKiS87GCUExKTrZqsSowY7TOTdZ1f+TH/2c6613OVyMWYDSPulF/mxs0imPrdX+kYUBAFr
    RWjL6h5THSgbQt4uqoVBqK/fFM2u2Klm8Y4bO9ONrkqnp9AzdcNKlFijSO7w
X-ME-Proxy: <xmx:ijShatrF_TSn1aA7h8mpTrRa4Y_R3MlzV_Vm-ngpDtM_YXb4O5e9AQ>
    <xmx:ijShaoRdFfi5oCs2XejhS4karkcokt6Q6r6ila1torKudd4GX32lBg>
    <xmx:ijShaho8sneoipfZ8nKmxHO58rl-HIqVVzgEgKF1Ef9YT7kzdT286g>
    <xmx:ijShai0OptwnQeXHUkgw4uQYhMK0df22POsaPFjrfmwBuXbymy72bg>
    <xmx:ijShasxtQcSIsd0uA7F6d0HcYagm_n0cVcN6AnAmqNZxf3nG2I2cydUm>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:21 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:02 +0200
Subject: [PATCH 06/13] arm64: dts: apple: t6031: Fix continuation alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-6-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5573; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Oah0LgFEyGqOdR0+X4mlfeZgQU6B7d/SaS0qZscGDPk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpW3GI+Y1VZ2u36caJSeoxJxgtlEVt/kl9dNnjqFp
 Ld8HjM7SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATOT1Kob/BbvfW7l4VTu+nNlt
 8tfwOEecnuN6QQG7N99fH/zI7qt8neGfkfdn6XW1h05VPVj9NPCoQNLuGXujVMUyea55Hfe0ann
 JBAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Align multi-line properties exactly to "<" of the previous value.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6031-die0.dtsi      | 12 ++++-----
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi      | 36 +++++++++++++-------------
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi | 18 ++++++-------
 3 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6031-die0.dtsi b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
index 932c97579f99..57f44f1fbe6e 100644
--- a/arch/arm64/boot/dts/apple/t6031-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
@@ -39,12 +39,12 @@ pinctrl_smc: pinctrl@2a4820000 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ 0 904 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 905 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 906 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 907 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 908 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 909 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ 0 910 IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_IRQ 0 905 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 906 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 907 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 908 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 909 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 910 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	i2c0: i2c@391010000 {
diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index 524a72f5483e..01fe459259a4 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -37,12 +37,12 @@ DIE_NODE(pinctrl_nub): pinctrl@2a01f0000 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ DIE_NO 710 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 711 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 712 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 713 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 714 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 715 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 716 IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_IRQ DIE_NO 711 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 712 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 713 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 714 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 715 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 716 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	DIE_NODE(pmgr_mini): power-management@2a0280000 {
@@ -66,12 +66,12 @@ DIE_NODE(pinctrl_aop): pinctrl@2a8824000 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ DIE_NO 595 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 596 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 597 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 598 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 599 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 600 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 601 IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_IRQ DIE_NO 596 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 597 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 598 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 599 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 600 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 601 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
@@ -80,12 +80,12 @@ DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
 
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_IRQ DIE_NO 458 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 459 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 460 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 461 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 462 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 463 IRQ_TYPE_LEVEL_HIGH>,
-				<AIC_IRQ DIE_NO 464 IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_IRQ DIE_NO 459 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 460 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 461 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 462 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 463 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 464 IRQ_TYPE_LEVEL_HIGH>;
 
 		clocks = <&clkref>;
 		power-domains = <&DIE_NODE(ps_gpio)>;
diff --git a/arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi b/arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi
index 5e4727e357d2..0c0d09964e69 100644
--- a/arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi
@@ -8,46 +8,46 @@
 &pinctrl_ap {
 	i2c0_pins: i2c0-pins {
 		pinmux = <APPLE_PINMUX(56, 1)>,
-			<APPLE_PINMUX(57, 1)>;
+			 <APPLE_PINMUX(57, 1)>;
 	};
 
 	i2c1_pins: i2c1-pins {
 		pinmux = <APPLE_PINMUX(58, 1)>,
-			<APPLE_PINMUX(59, 1)>;
+			 <APPLE_PINMUX(59, 1)>;
 	};
 
 	i2c2_pins: i2c2-pins {
 		pinmux = <APPLE_PINMUX(60, 1)>,
-			<APPLE_PINMUX(61, 1)>;
+			 <APPLE_PINMUX(61, 1)>;
 	};
 
 	i2c3_pins: i2c3-pins {
 		pinmux = <APPLE_PINMUX(62, 1)>,
-			<APPLE_PINMUX(63, 1)>;
+			 <APPLE_PINMUX(63, 1)>;
 	};
 
 	i2c4_pins: i2c4-pins {
 		pinmux = <APPLE_PINMUX(64, 1)>,
-			<APPLE_PINMUX(65, 1)>;
+			 <APPLE_PINMUX(65, 1)>;
 	};
 
 	i2c5_pins: i2c5-pins {
 		pinmux = <APPLE_PINMUX(66, 1)>,
-			<APPLE_PINMUX(67, 1)>;
+			 <APPLE_PINMUX(67, 1)>;
 	};
 
 	i2c6_pins: i2c6-pins {
 		pinmux = <APPLE_PINMUX(68, 1)>,
-			<APPLE_PINMUX(69, 1)>;
+			 <APPLE_PINMUX(69, 1)>;
 	};
 
 	i2c7_pins: i2c7-pins {
 		pinmux = <APPLE_PINMUX(70, 1)>,
-			<APPLE_PINMUX(71, 1)>;
+			 <APPLE_PINMUX(71, 1)>;
 	};
 
 	i2c8_pins: i2c8-pins {
 		pinmux = <APPLE_PINMUX(72, 1)>,
-			<APPLE_PINMUX(73, 1)>;
+			 <APPLE_PINMUX(73, 1)>;
 	};
 };

-- 
2.55.0

