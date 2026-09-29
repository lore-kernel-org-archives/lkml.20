Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3056A4DAF86;
	Tue, 29 Sep 2026 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671875; cv=none; b=iZF818iFrILaKUZniSwmCSaq03HhrJOWg1SdmEGjcs7Mgpb5ztzhtHjNgTFpubJA7kHVG075Q05QOyKLJiYYpFSE8W+B++0zfvXMyfcQ/M4VKtPii7OdHD2YjHU7LwDXvcOHp4kpqz6jP9etgxXi/nVPOmOfAF0jK2z87cEs0vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671875; c=relaxed/simple;
	bh=oLctePOGxPPRUbtQZuT0MEC1E4uXDtj8aF9aZKCHexc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGmF28volgQ0rol5/MuySWcPfxenLUOnHxnbT8XeZuhdRGYk1AtFm39CcauRkG2Zcf+ZBm0S5o/lbN/J9NHfiofq5FFp1PwdIB6OtYlikGBaFz8be87tzZxMxnuy6RMdSAGfrN3BtX/YB4yp3h+AUXQbgYS6XAbw2WS3qZzdT8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fr+IWQIH; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fr+IWQIH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0BE4C1A1054;
	Tue, 29 Sep 2026 08:51:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D43ED601BD;
	Tue, 29 Sep 2026 08:50:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2B72103297B1;
	Tue, 29 Sep 2026 10:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790671858; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FWib/BdWYa2opT7pMAJQyUzwO/Irx5Iu+DpIpo9cepI=;
	b=fr+IWQIHJLUOqLEweuMcaPtvKxgT2hynV7BYyNZVKlH2jlGhFlZ0l9TgCB9dpEWRSEkPAH
	i2tsTKpu9gNcUms3uSRu4IfVbfFlNUNIlxMaYlcUK4u9V9PJrkzZnLFYY0e2qQjINOkIa7
	oUH3bW8NmuNYyKkgwsfeY0BOQv2tOh2aN/5tf9kUdbjkfRc0tPpr3eHTwGSEj3ZE/B2P3j
	evXFQW98HmPqsy+BKoMvhdZnN1u1j2ipimxEK8yyJn1Sdy2dANOVLpk4NM03YNjQhxe7Hq
	I0Spw+CK9H/wmRN9Xzcjl189FBsiSoYvvtUjpZWM3VNtNofeTRR9k5JApCFdBw==
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
Subject: [PATCH v6 3/4] ARM: dts: r9a06g032: Add support for timers
Date: Tue, 29 Sep 2026 10:50:33 +0200
Message-ID: <20260929085035.57609-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929085035.57609-1-herve.codina@bootlin.com>
References: <20260929085035.57609-1-herve.codina@bootlin.com>
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

