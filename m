Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35554411FA8;
	Mon, 14 Sep 2026 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375257; cv=none; b=u7oJsKejd9V0KsHVkqnzNQDCTGgwc7Oxb9xNqPAH0sldfJmAsgTcnZXVReyjWxT+aKCnuOljzzvKOMDKInRrukmBzel+r2DoP6gwXV+qUUMqboccQp5TUz3f9HHn1oAqC2Qm/KSNvgHmoKb+oQB66Za/QRce/vaBzCneQIwlgAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375257; c=relaxed/simple;
	bh=1UsHloy/L2sarxFvpPUMHmIp2lRWVoyjmt1Tj9haRyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdIEyatrtPV6mCbiSWGm9B+aMH4HCrPnlUGbVBYeC1V5RvjfRUH7ZrxdUwV8fLEMvTTPVTWm1l8dm7/5OJ+T9bP1vc6zk4CuuRzQZGmeCivdSV4Va69JJl8ciGlpkakGqOMCIECeBB+FcDuiINZsPXyRUy57VB0BUz4gXaMzcKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=BQ8gMpnO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cmxmLMYh; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="BQ8gMpnO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cmxmLMYh"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 03C51140009E;
	Mon, 14 Sep 2026 04:40:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 14 Sep 2026 04:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375246;
	 x=1789461646; bh=qGCNF78R8wJOtYi2eSbyY81WkHIiBzIfw2hpbakjkPU=; b=
	BQ8gMpnOBAPndWSXYt//cK7WcDAoGl/T1nRA0GnvfNked0gr4kN9EPzDJhPMAMf/
	9Ufwd8hZm/49KwQKLNWMob+4MCXiIAMTYMijIc7ivasCQfWLG9PosgdhuE6yvvLB
	BrDmzNTbgo5ti8bLK/dNr4GTKnIopct9TEhw2vUlfYvU11XdkvL2qD2Lhw7Gh82e
	SDsVgKw2ghyqlwEQUTaoeXPox0WSR2CEjBAODfF9fmr6decfpwFZI+uQi2TkyGcK
	r0VFdQ7RIPDP6w+V8tNdaP/3FnOsilGrdjxF4oQDIaueDT+KvlCkAn8wat74ViUJ
	p66yp401+3PfQRA792zdEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375246; x=
	1789461646; bh=qGCNF78R8wJOtYi2eSbyY81WkHIiBzIfw2hpbakjkPU=; b=c
	mxmLMYhVWiGtSiDe968yKNA9aopHSLerhkKpyPJ//VKbMYNSfmrxpv1aiSvjnWmh
	D8FYRAeViV/eZMbLgvqg+L9EdQ1S7UK5BFIwUDMrXq6PR3Na9A3s1mRtKlIsUuwi
	paneC6KHFBBXF6lfY7FlpkVR4yWPykNUtD83ULaLuwjqxHK6HudBh1sITc8iCNPk
	sLsV/MdZAqv+cGEktBYu+pv1Boeb+dn6N2oyv/+Uuvk9KKh5JtPxzMcDuLRjRgrK
	YSKy/pKagI5c2NikjempUd2DN1jbHkWcdBoGfu/+ibyUP0cWPmHjroEJkf/uC2Jl
	x9drR0C7FG52aeJdGgfMQ==
X-ME-Sender: <xms:DbOnasXVHmlHrHnu2MsSIxvjw8jPcivKlWBqjhcOz8NU55dn2gIlaw>
    <xme:DbOnaowTPiBoESBYQ-6QHAGplEBTdyjRlTpqU2ViO6cb4YlHg0Xn9LhkHqaszmowd
    gtLNTXqqiBtQFNlZ3ECxS5smxaSmX6XGbOf0HwS01VlyuOHhnoAWZIG9w>
X-ME-Received: <xmr:DbOnar_ciHZY3SGigOWeTKYEzgDT2_Nr_aRMVDqgC0Xx5uAn-kU8Mbj88SdzJi1SjmA4UOdW8_C5UOjRvysI0L-xm49LmjNL3PjZKw>
X-ME-Proxy-Cause: dmFkZTE4K6JMrxd6sPzZVNrePGCzWSArxKGqIFy2UwUC7nS/ZY+sStdcZ7vmPmE2pNoHZC
    9MiqcQ5OXckdWGFiy01IJr2JkZ+n3p+fcnek7D1Qwk8LgHRtAPwJ3G0I5cz7ZhSuemTIJc
    i9Rs6SyTtRrS0p1PgXmcVZpifTNEIm8RuZjsFaFCWemyhP462rhvuOdftkbms6ekvvuLIV
    6HeACEZ35ia1OWZxWsqljJDvRhxvUU8yfY+GnRLK37wYdoIiqubcn305EIee0gH5ypsRyC
    0b6zJacisih6eDtoNCnZwnv1woWj2R2DHm/YruUPQexvu5t1hokHp9I+EwChY3zqidyUQy
    3yAiyGB3X1Cjr2VvfEjsV7rs4+tSOLd+orK+v+d00vTve3WcpxhQPCJs7s1dhbwRhi96+0
    J0ZvlEqgAGDGN9ZiQ3o4tz7663DiFJOhx50e4k0gf+GegkRIn6CmirzJJ9ZdCvJICzDbsg
    uV/NMcmKJiNwImigdyvqNN60K9mI4vCS2PWaRA+WD44n2K2DC4ZJxjjXoAzMczjAex8qYW
    Nm7HXqAirw+V4tRv5YdtThjSJYkl8WtqtUVxavk3vPc2T8fUNRe0xURM9sDQDUvFv2d/X/
    weS18JmTPvdNalTEhMwIOeJSJ+/wNYtZAwDVKgdSfX2wwjqE+qeWgBvRLMcg
X-ME-Proxy: <xmx:DbOnal8dJvN4zw3_5OluJ4fDyiz4Pedv80O3Mripk2lo6TSmlHNXCw>
    <xmx:DbOnaiUfgDI6AeTvAkyaRsyVeB6IAjVpbBErBrZsDZv1W9FIvU9XYw>
    <xmx:DbOnaqdTiV-TZmLLTDFtq2M6QB7lJHeEiL3J1NcPIO-BUrF9p49EBg>
    <xmx:DbOnajbDX87PUUFUmV7vt0Hwb71FX7vMSHqQE4QA1PY0J3X8XiSxWQ>
    <xmx:DrOnauVLncNmCmIRuWyf35Z-hy6hnpeEuw69ha7bqg8dK3A906Q29zcj>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:45 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:34 +0200
Subject: [PATCH v2 04/13] arm64: dts: apple: t8122: Fix child-name-order
 dt-check-style issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-4-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=1UsHloy/L2sarxFvpPUMHmIp2lRWVoyjmt1Tj9haRyA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5kvXt14+1BTGYOuJgunxNZ4reA9v3qu3Fj40iiVQ
 c//0Ue/jlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNp0GX4X5gRu7/L8cjEOfOy
 /xj8mHKi8qb8vsO7juVnGdw/tnvN8y5GhvVqN0pr2DZ6tfO+CTM/4CrLOXX+lPZ9jC/DK+5mNSs
 xsgIA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Reorder child nodes by name to fix dt-check-style warnings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index de09989c5663..481f68a570ec 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -20,6 +20,13 @@ / {
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
@@ -165,23 +172,6 @@ l2_cache_1: l2-cache-1 {
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
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -451,6 +441,16 @@ pinctrl_aop: pinctrl@2f4824000 {
 				     <AIC_IRQ 352 IRQ_TYPE_LEVEL_HIGH>;
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
 
 #include "t8122-pmgr.dtsi"

-- 
2.55.0

