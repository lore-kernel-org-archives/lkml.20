Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5F149DB8B;
	Mon, 28 Sep 2026 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592377; cv=none; b=KPOL7PqqB0pL/hoHq1t4nSqJxRpEQRU4n7Yu1PcCW2FKH9gI19xNdt3UIFJmQynjneomJ625kKIVEnrm35YcukL49WY2KQkJ9zxbmdynDjGFNBLF+aLOejirUg2+ng+h7ZjE5xhmtQFINR+nyT+mTscVWx0slRVJvk+622zeMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592377; c=relaxed/simple;
	bh=8DYNZFOHd5e4MsoRTx8ygmwQgvRgTdveiNKefgOMC4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=puZag6guP1Vm4fFLfL+wh+TGYcsS6NUXNY2Bh6UX1gCBxmXHHB5Q9gXDrqMkdv2mXkOYfp+wVWouPoO0LH5poX5Sp7lUSZfxqMuFwyBTIKweYli6hnzdj+tbZVybpvlJcfiRkj3vy31RyWH/y942Svz3qcGep+Cy6liH+x1An+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S/bprw9U; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S/bprw9U"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0D6F4E41099;
	Mon, 28 Sep 2026 10:46:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4029601BD;
	Mon, 28 Sep 2026 10:46:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01D31102F1ECF;
	Mon, 28 Sep 2026 12:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790592371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=atI7qXIzs6KQElAaHdZKdHw4dLA3gMuvDUusM2Vrg9U=;
	b=S/bprw9UT+5Q/Y/cqgQEoC5V0eositOi2XgAaXvHaLAUNofBBr+5yFJb8XI+lJ9XBTiHVm
	hWeCc1nlB3ezVPbTwktOo5h0SMc6WEzIavvHxcdVHBkyiFMLdKauHeslVY4B5CFLEpaOR9
	755BIiWKSgsstVHNT9pOJKDkrZG6GNW2oZbLq5K4RWfT/iSNgg5EAaY2DfNY9NuCZwmTRw
	oXO2dDz7bQtZiWa9TSUEi8P4febvvznNZKcyMBJ98W8lLpqQJa0JgtqdL/o3UD2sFRdILR
	R1S6DyQvfCx7XxEYp2QqI07olFD35uU6bSn7W4D0NXvIHWVlKTKWy99xrgqNEQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 28 Sep 2026 12:45:49 +0200
Subject: [PATCH v4 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-paul-v7-3-rc1-edac-v4-3-4646a5b7cac9@bootlin.com>
References: <20260928-paul-v7-3-rc1-edac-v4-0-4646a5b7cac9@bootlin.com>
In-Reply-To: <20260928-paul-v7-3-rc1-edac-v4-0-4646a5b7cac9@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790592361; l=1057;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=8DYNZFOHd5e4MsoRTx8ygmwQgvRgTdveiNKefgOMC4U=;
 b=U8cazgFjhYJuyG9b1fMzAkuqK8ZRSYY67+eHDYe/HlnIs26EDT81hBi98tR506Wz0NIrl/TKa
 Mz6WvwKQKBhCoBjsICEjBYHpGw247l/1UY1//vq2L0lmyis+BQrEbmr
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

