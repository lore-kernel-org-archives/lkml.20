Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79034B5409;
	Tue, 13 Oct 2026 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888338; cv=none; b=d6n9NgvZ5/fxNdMhqy1UbgUm3hsBnhpLRTI0rSep9GkF8V1/E8FA3OCH5n4rEQF/L79K6Aejs3bDoONknEEFNMY7CISAj7fCR0hZXPD5jxADV5Gfbj8B1S+bnfNWKG9tVkFWWZaV9lP/QcBNrazu5QE6Fk3rtjLg9whVQUjvLwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888338; c=relaxed/simple;
	bh=M50cgOBy/LauGa0pGoFBLyHKSyVtAgLQdzrWGmCAWp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fGgKv4B7NjExPU11WhMstASingludZj34RVKx96t4OWikZ6wdaNG7gdAY/m1J3cfjsHkHqwAuqWM/bMG3TDZz9f202DbeOQLNGv/e2BM/df/rf6mbRepuQu8cXe/ReGACK7/om2sq56CEJJ6QVIvzRUVqEu9sF67aNxLLMLpGVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0fkgAN9L; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0fkgAN9L"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65AD81A11FA;
	Tue, 13 Oct 2026 10:45:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B56E60362;
	Tue, 13 Oct 2026 10:45:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83EB911D703F3;
	Tue, 13 Oct 2026 12:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791888334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xH0gEgoLRWaLsp635rB2jonezfltFGPWmAbpMXeeiOk=;
	b=0fkgAN9Lk9jmmZdqjtSfpYOv/Q0/7cI/M5LCQKQJkC0CM+zTroJi7cCU2QusI1hp45r/Em
	46lK2yCaGRMgxth4ibUQM0I+7eEIEP5xV/2fOBL7Af14/RIDJ4kJOYGqrxgfX1eUJbiWsW
	nhCRBHjWJqU3xeFaWNnKvcT8QPaNna70ik/tHf4aElLURSR9acaBN3eK+XH9qZ9/hEMKIt
	M2GZ84WSm9AIEzIvoKwV8/P7/6ZEMyCxvtKezsSQTlA44lIe7yepo/6HdLrecqUwoPW9BH
	keO6uEYQxBiZrCzb7a+/1/eNc0ehYND6mdtYweHmHO+j/i2IAM9MyvCrUYNb3Q==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Tue, 13 Oct 2026 12:45:00 +0200
Subject: [PATCH v6 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791888321; l=1057;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=M50cgOBy/LauGa0pGoFBLyHKSyVtAgLQdzrWGmCAWp8=;
 b=/oClhJBknzwXfOGSxLToZK3Q007FHEMpTYbcYyKXgcZ0sG74BWHd+91tvnvKDnOzv/A/0u+8G
 vax2Vrnvt9TD/YuN4rimQHFnmwwfMOnoZwRe2DJ6WKMcfYw35/5oSPh
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
2.56.0

