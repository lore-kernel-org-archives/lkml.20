Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E170411A16;
	Mon, 14 Sep 2026 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375262; cv=none; b=Y4EJlVzDxA1l0Z1qTbHvNUr4Z5wVFiIRITAF4UWXwbKq1zJQB3sHWqaPoc1nSaitDHNgkBszI+9mFIbPzZtU+V7OtgVSmzGIVDMDMpfUxOnNeaOoBCo1aLbt971bLMXBoPyx6B1f7s7SijRGZxv3e47J7MlCIFmQP76EjuBH+io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375262; c=relaxed/simple;
	bh=Oah0LgFEyGqOdR0+X4mlfeZgQU6B7d/SaS0qZscGDPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCc+NmvpvIM5xdtWJQp3UvQ7Xunid3p/u5h8cNNWLvZBFZEqYSqqwJm+D+DxEL0cfiDDIzf7vzaHsYt4PfrINg1ZFIPvQlVshgSHT+cr48hQ52SuvFrjUIIcVp1aVMnAKLdVaRRJcZKL7Ez/qYc40aKFubPLdVI2qlUX2Xxgpwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Q2N9bL3N; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NmWPhNKS; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Q2N9bL3N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NmWPhNKS"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4E69C140012E;
	Mon, 14 Sep 2026 04:40:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 14 Sep 2026 04:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375249;
	 x=1789461649; bh=adE2QtyHr5FA3h8p/vzzNysjwN90NOIzwiMJGeI1PXY=; b=
	Q2N9bL3N7ufPHt6q2ChFxKUQpX3Vd+Z4UWHUMP1sOndBWbI7OMXFBEvncUFVWtcz
	rFY9p4bpb69WfnOJVV08pTHBcwoIPx3LNZ9LEjBqNHBceVXm7mBsZ1PBiHtGbqDC
	FV3EZm/C04f3UTmBRqG4B4z8QiGq9H6qhYu5Rvyt0A1hVXoUfKTp0KXJmWJErRL4
	yFiNuZnf0Jzq3hjzuoW45djwHGQ07VhdDeT+zYEeX7EjqFN8IWN+K49q/AZ8NRKX
	Oo5D0hW+Vt8guHF/iU9Pklca8kssQPRFyRfbICX1XyVGK2ZkRLiTrbU9azFky8wC
	oJ2z3oxxbi7eZ/8CE7e2iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375249; x=
	1789461649; bh=adE2QtyHr5FA3h8p/vzzNysjwN90NOIzwiMJGeI1PXY=; b=N
	mWPhNKS0EywP3cHrypP+3EnQqE7oNvEJxNQj9E6SK77pj5MO4FbBZFFiHkyL33IQ
	tQQajAiAdEPud510eQWsQ1Ei4HPVR1WVx56Soun4CYRKQSORlrM1brj0ZIwzeMH+
	ld7Gbg5b50YMLjjBBaTEMbRwBlygPBC2vgUFeA7i53zrpRq3Gi+kigkqO/eE71Vf
	NIA/kW+Zs3uGjyX99gHUKmuFTx6WKewYlI84JPrEbHTXtClB8FUjnBE4CdaB8c42
	fH99HfvmhkwomxhySx1FuzuUlWsZgg61x68AYpZLaANTFbZmNgm81K4O8uBilFtY
	nWLeikdRXbhzt2DECQPaQ==
X-ME-Sender: <xms:EbOnal4BbOFVFiR9qf8dlMQPeUT2bJGDVIrs-alqoIGMExG-vgvinQ>
    <xme:EbOnarEZUY0cuopGq7C2saLmaFakCOHbwdI9_tjKcyHcVZQWbzMl1kSbvK9aiDVz4
    zCOxxoODJ6EDmj3Z9WdY_bqiYdAK9_gUtREA6MUZnTx8q-zkFUCG8O9>
X-ME-Received: <xmr:EbOnaoC4Q79DP8--sRrhhwSwvjoVTldFPxjjiOhg2tOMl0uFUSKo-xKx_deBTGNXLl1VWY3rPjHzTu60pdIwVEY15KCEcvAdh92bFg>
X-ME-Proxy-Cause: dmFkZTE4K6JMrxd6sPzZVNrePGCzWSArxKGqIFy2UwUC7nS/ZY+sStdcZ7vmPmE2pNoHZC
    9MiqcQ5OXckdWGFiy01IJr2JkZ+n3p+fcnek7D1Qwk8LgHRtAPwJ3G0I5cz7ZhSuemTIJc
    i9Rs6SyTtRrS0p1PgXmcVZpifTNEIm8RuZjsFaFCWemyhP462rhvuOdftkbms6ekvvuLIV
    6HeACEZ35ia1OWZxWsqljJDvRhxvUU8yfY+GnRLK37wYdoIiqubcn305EIee0gH5ypsRyC
    0b6zJacisih6eDtoNCnZwnv1woWj2R2DHm/YruUPQexvu5t1hokHp9I+EwChY3zqidyUTZ
    97SNJZd9sqf1E3zESawkZsSeM+I2jDY3OpYJLViWP016VXUA0V7WxYjNYGFbyb1LaCi8uA
    zoNvhP4+b3OxYSZAwxyRnILEXFCbj7yv5q2xc4fYWOwpd0Q/ahMgJ4NhNEUkLsEojXEpEI
    kqLkUtLl2GQreZ1TRv3PNoRl+ltfdNcxlmcLEIPDgJwI3V9Q3jopl5XzWUPF7F7fDbsJfR
    /rkJUAitKYaHUwj/rCcAOOV0GbK7K/oq1EstSd2ttipE19kJq+6NGEoKHp6E7QQLrPF431
    ENn3xTiTGKVniiwbFa/jkNJZmyKiVuiy1uodZTexGe+goT69ginrpRE/i/8w
X-ME-Proxy: <xmx:EbOnaowUEcBUSCOp_1pjX-nlTrsn7Av6e-4uGLP9E6Uk4jU_sTHC5Q>
    <xmx:EbOnak7LGXAOR7ZQ0fYJ0Ar9RiOYsEoB-CvocObJdmOg622rdnfGDw>
    <xmx:EbOnahx3cO76zo3Bjwe7uzqCkrbnzDCZ7UkqHi_lsOfIoxAOAKtxsw>
    <xmx:EbOnagf6gHY4BSDRl1ogBYU-AovfpsDE6zhJdXEYgfrKGNo7gU8gUg>
    <xmx:EbOnakZM6hRc2gHQFldyRk3NECckX-efl87QBiQrFU3-fG73QECSIT6A>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:48 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:36 +0200
Subject: [PATCH v2 06/13] arm64: dts: apple: t6031: Fix continuation
 alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-6-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
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
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5mjntp7SHYuOlm9stb02JLUu0v+sq3NvXCJ+Wjf2
 9v/DO77d5SyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZjIgniGf0ZT99Vz9rI+Xbh8
 umyulclCpVN3jZ3C08qnVPFr/ZqSpsDI8F+ZPeJDBrcVl1rBB6XfIbuv+3+TcN/KMm83J9+X5Ot
 MPAA=
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

