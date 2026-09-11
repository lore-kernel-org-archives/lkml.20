Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CB636EAB8;
	Fri, 11 Sep 2026 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139132; cv=none; b=RKpKwpxdiOdF494JkINPIly5Opyp2G63R/y8477I2/XlfVn6FVR+jsSy5taf1+JjnuX562lSShGb7BEZCBXJosvERJ9dFGhRSm3V5q9TBulPczcCLQkgDu7H9Iw0iuIWO+9mPsY+bxTTxebj6he2ymZHArmc2PlDJWId3Y/DIXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139132; c=relaxed/simple;
	bh=oLctePOGxPPRUbtQZuT0MEC1E4uXDtj8aF9aZKCHexc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9yTh+3M4q43Y+D9q6YmRWV8TA2aE/EJdEdo+IPuWy62/DFZ6U8vAYlz/RCOHelTe8yKsmv4VLPl8jCRZPeMWHDaKuV+qpm+EWJFegC+blwDBhUSFzKFml63xIojHwjdK4ytd3y4z3asDFd1kDR7fLdQUgDuNcLsNTDEm3ZYS4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DKg00gnT; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DKg00gnT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 02464C63A0C;
	Fri, 11 Sep 2026 15:06:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3145E601DE;
	Fri, 11 Sep 2026 15:05:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9842411C7AFB1;
	Fri, 11 Sep 2026 17:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139124; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FWib/BdWYa2opT7pMAJQyUzwO/Irx5Iu+DpIpo9cepI=;
	b=DKg00gnT4ftdGyrO/Qj+MoESq+8l0xb7qkW7xSKiRGtvGmbOK/oowhox8fz79zg3PGFTYR
	DcFh9r3HJr14chg9eT89VmcQMEh9+9gtr9vRB7u9U3rqmiu5mTIaF3xjaIzckmKgK3X4Sn
	vf2WFGb1PCweLchnrdFlJCfOvzV6V/NsE+aXoHIjwoL10tlp4ZI3k1UcLBLuTBuSJAi1rI
	1k2CHzTRxwvTonc/jFhRvRyA3DRpDqKj++zIWjTCurEyjh1fxf2R19aob1VN6/83Bk5bci
	CORCg4i1joJlSd0ltz9do8FD5g+MybvMvwpFdgyu2rjg05724h7O+9LCIjLtUA==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 3/4] ARM: dts: r9a06g032: Add support for timers
Date: Fri, 11 Sep 2026 17:04:54 +0200
Message-ID: <20260911150456.893761-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911150456.893761-1-herve.codina@bootlin.com>
References: <20260911150456.893761-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In the Renesas RZ/N1 SoCs family, two timers block are available. Each
block contains 8 timers composed of 6 16-bits timers and 2 32-bits
timers. Each timer has its own interrupt line.

Describe those timers blocks.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 19c9bce0a26d..6fae6db2850e 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -806,6 +806,40 @@ gpioirqmux: interrupt-controller@51000480 {
 			status = "disabled";
 		};
 
+		timer0: timer@51001000 {
+			compatible = "renesas,r9a06g032-timer", "renesas,rzn1-timer";
+			reg = <0x51001000 0x200>;
+			clocks = <&sysctrl R9A06G032_HCLK_TIMER0>;
+			clock-names = "pclk";
+			power-domains = <&sysctrl>;
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer1: timer@51002000 {
+			compatible = "renesas,r9a06g032-timer", "renesas,rzn1-timer";
+			reg = <0x51002000 0x200>;
+			clocks = <&sysctrl R9A06G032_HCLK_TIMER1>;
+			clock-names = "pclk";
+			power-domains = <&sysctrl>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		can0: can@52104000 {
 			compatible = "renesas,r9a06g032-sja1000", "renesas,rzn1-sja1000";
 			reg = <0x52104000 0x800>;
-- 
2.55.0

