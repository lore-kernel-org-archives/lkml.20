Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888E3B14D0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242277; cv=none; b=AiwlOhaoGBM17/QIAzzRuxIapWKiJKPXYJU9bWJDnDNJf+zHXEc016dU8FruBX07UVxzD3NfEZhjYW9P8thVD7qtINE8BhWQBDbOW9SUEpQJtRD7hZ+VCy2P/OEQBlyYen5P4SHshz5S/CPYvaEDxAZCYrxSrWwDoj0Kyku/4v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242277; c=relaxed/simple;
	bh=nA/rC2OvJeW0AaqvGfx1Brf8SxDvZIsuz7E/iVHMkZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lonG376AQ6XlfAgZeSygeeF4ZoxA7n177fTrGy/sV1xMIc3weO4ExkuejPMUDxtLer7klFKlyD+Izkf3TMuJUVM6BLj0MSsiGn3XkZaGJ2ckkmu+A1F8vlIRxVaOGiYglysa49ocK/iddppBE2xGBlo7XtCbwvQ9RSl06tOgEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KcT7W6kL; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KcT7W6kL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D713CC211E2;
	Thu, 24 Sep 2026 09:32:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 832F35FB45;
	Thu, 24 Sep 2026 09:31:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0EA4103294C2;
	Thu, 24 Sep 2026 11:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790242271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xLAWXoAqE+60g1cvgidm3NIwGVVBCvvmj/eG9JwqIno=;
	b=KcT7W6kLL70eJuB76f+jLJ9U+aPl4Z0E+mE3bLRn4ts6yPymaa9yAyAbizruUp+nl77J27
	oQ099gprTWyMjfpMtvtEw++b9ZmcINkBIcTCNXwKVmWK1Y8d9Yj5kT14Sd5YCgIi4qwdgX
	jkyDjccdS85O6T5B6WdsZMkhm5nk/Fs5a5LxDdldHJscxzEKC8g0ljGq7eAmEfidTlMotQ
	jwvcmNot4dmWv/hWJ+snLpJnSkApphs4m/LVTLwQmEdnpC1v2as4MWgy51co81rlCOS5Zi
	6BH4k8AoZGLeKcPnOfoEBmsxcKn5wA8hPf89dFeQIRG+rVvzMNDHPzr+iT+Uow==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 24 Sep 2026 11:30:27 +0200
Subject: [PATCH 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-paul-v7-3-rc1-edac-v1-3-70be37c41a18@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v1-0-70be37c41a18@bootlin.com>
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v1-0-70be37c41a18@bootlin.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242261; l=1034;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=nA/rC2OvJeW0AaqvGfx1Brf8SxDvZIsuz7E/iVHMkZM=;
 b=/awqOfeqO5xSucxLXU+EiYTn+ORlLqiat2BlCwyf4j7SGQNBnKdLkgn5zyl8WR7RW+yf8IrSm
 CXvPq7u0RI+CqwNqbXZ7v4zlTNXFCIn0HLaiOdSfMSRMogUBHeXHasY
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

