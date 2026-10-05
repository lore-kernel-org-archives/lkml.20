Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AD2481FA3;
	Mon,  5 Oct 2026 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204641; cv=none; b=sFx+gjO9hikHkXiCF6epShCeH9gtL0bagK6pbDWhsXHhKE1x6zwnXwb7LMpWtAcxqzfQL0qvKJliLeNtFLfFqab0dRMpNq1OxiL50weObnq8MJTNtV95XEVTGRQRxoi+GOxuKCZuWIQKr5GjXVRQO4bOPb/YbsRoUNoPwlTp62o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204641; c=relaxed/simple;
	bh=8DYNZFOHd5e4MsoRTx8ygmwQgvRgTdveiNKefgOMC4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeXs/820jKhk1CE5hgeNRQzbnKRBjL1EqUT7dhbU4ryRJCEB1grF1HB0jPM1TGan/mY8r+DSroltyWm1Zz+3Q9Mfi8b8je87Iazom1quZ5Dl+1sAYH3yMv8CoOZrh5/KALortiUiaYG2fc10FvePAsRfJRwuGYPPUlJM6UfpJiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x70FJi2B; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x70FJi2B"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B2DE44E410A6;
	Mon,  5 Oct 2026 12:50:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85473601A5;
	Mon,  5 Oct 2026 12:50:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3FAA10330748;
	Mon,  5 Oct 2026 14:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791204637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=atI7qXIzs6KQElAaHdZKdHw4dLA3gMuvDUusM2Vrg9U=;
	b=x70FJi2B6CEtrNcYPvUecrDFZCnuOP7pspusb1G6Sgv6hmnDKuR24lxJH61lssTdt0Xrj0
	6ezafiD5Dy7NV2nR1qlNkpRO6WmqhMLsCor/LLYhG+XCX2jVF2bzKUW4spB0i0M3l+FM/E
	8hlUDh+tmJQ0vmUl7jOMRG0nEiyKBNtr3vfVlIRmprwOalqAMbDD/lMlVBj8tP2dzmXwGB
	tIyTxcRAiguQZe04RhghEy3nkEu7EBxT0H7U7jywvEO2fSoNogHQ6/x0gsBHd+O/p6rK4T
	C8gG7N3r1UkNQJ6vhRXDiGeqI9uGITyytHHYtex93jfulvP6vDxYTj6V8orCfA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 05 Oct 2026 14:49:24 +0200
Subject: [PATCH v5 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-paul-v7-3-rc1-edac-v5-3-140a0f124bc0@bootlin.com>
References: <20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com>
In-Reply-To: <20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791204619; l=1057;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=8DYNZFOHd5e4MsoRTx8ygmwQgvRgTdveiNKefgOMC4U=;
 b=8rOu+D5ZgPp+hI2w4xe6fS+Bo6aYChMye1RbJ8uQMlvvy5v+qFBH/YhrwgdaX5PXXu8X9Wy9I
 T5gvDyb5VFeCSfyBDjV0LohbumnE2BiBh0hV8XdBjyROilzecmn/2y7
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add EDAC node to the SoC base device tree file.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 19c9bce0a26d..8152464d4e6b 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -164,6 +164,15 @@ dmamux: dma-router@a0 {
 			};
 		};
 
+		edac: memory-controller@4000d000 {
+			compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
+			reg = <0x4000d000 0x1000>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
+			clock-names = "ddrc", "pclk";
+			status = "disabled";
+		};
+
 		udc: usb@4001e000 {
 			compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
 			reg = <0x4001e000 0x2000>;

-- 
2.55.0

