Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7595138D404
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259200; cv=none; b=KnJM9cN2pWkBK77hyzoN3PO7hx++FH3MrLJBLtGXJnONP+y4uSgY6ZhsV2mX0CEnpBzlMrB6r1xVfcvdcZMk8yxQrEplBzAKsb01yeGhXgqmI3KHmROrVcRF1OBYuU5+1UXhevi4P7UWPbRcSaDYxpL8HRn1R0C0V+Ao5RSoHoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259200; c=relaxed/simple;
	bh=nA/rC2OvJeW0AaqvGfx1Brf8SxDvZIsuz7E/iVHMkZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGDBDqXBN8FeRF8sTinkQbaSZQu3iIGSUrrL6pnveI322E4RX3gMiDTHDNADsxaSH613yEuoDQklmp35Br+109LP3q/tHlcK3DXXdZgAf1N6q+qGJo9LEadWkqA3hnfAIMHX7joLA5tEyXj2eBCgsghozMGMFSmV4ZCR6IV3w5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V+8kD5Ju; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V+8kD5Ju"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D45BD1A1006;
	Thu, 24 Sep 2026 14:13:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A959460341;
	Thu, 24 Sep 2026 14:13:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0ADD6103294B8;
	Thu, 24 Sep 2026 16:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790259195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xLAWXoAqE+60g1cvgidm3NIwGVVBCvvmj/eG9JwqIno=;
	b=V+8kD5JuxOudbRl/WH9LUeqXMUjJK41WUdnfUyFfTuL1Oemrl2ZLDZvqrgmXwZWgy2jvsk
	a415S9KXKp+QNTiKZL8i+DyIzsnLy4UxnHCJD6Z6u3fk9jkXA1q6XINQmVv1yZieUJ7auD
	jrXl9TzBonXA5MjRRXoZGa7hey4GCgLeo0m4pMUzcqPwQ8CxH4jSJdGq9ujxAI0GvOJ3Wv
	x48xLUomc5xijlE95sOIqY7UfrOaMO8qEmlYTfWKtTMMAUhBmOcWR+r6SRSQoBkG0dm2od
	8vv7mNXY9GZJDN/b6KMAie4sntpG7Lam8dhnvB+AvmwiIho2M2N0tL56puKwUA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 24 Sep 2026 16:12:49 +0200
Subject: [PATCH v3 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-paul-v7-3-rc1-edac-v3-3-bd8054a5b180@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
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
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790259185; l=1034;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=nA/rC2OvJeW0AaqvGfx1Brf8SxDvZIsuz7E/iVHMkZM=;
 b=6ghn0a3/yX5el7Z0MU1g4HN4pSVvUMKi1fcuR26V612J6e7StQacy0pN2/qK1sWFCc9PkLOl4
 920Iem3iPOxBtFI655i0rs9MN5dKOx4Drvk7+dlmbCzb1kKZ9OYN5u9
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add EDAC node to the SoC base device tree file.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 19c9bce0a26d..779221931fb6 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -164,6 +164,16 @@ dmamux: dma-router@a0 {
 			};
 		};
 
+		edac: memory-controller@4000d000 {
+			compatible = "renesas,r9a06g032-ddr-edac", "renesas,rzn1-ddr-edac",
+				     "cdns,ddr-edac";
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

