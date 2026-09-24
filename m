Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96D47A0D1;
	Thu, 24 Sep 2026 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257304; cv=none; b=fkk22O5bcd7zVSodDwJALZCeh90I7sbjzhz7apt6zZ4mTKsSWANtrL/8xFmJ/m/N0S08ubwkXNWXs5nCQ4yWyghPIGlZyLM5ilC8FmZgNX7MyhUJsUBLjREdTwRDlkVb/YMfc/y8UryxCcKuvea7otO0vU0E7mc7yZat3zMBRr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257304; c=relaxed/simple;
	bh=nA/rC2OvJeW0AaqvGfx1Brf8SxDvZIsuz7E/iVHMkZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYRJ7IKi1rOabNyqtAVg45N1y38v0xw9Zogg67s2OQQiCXB2dcQJ7PCOEW8jPpqarKcOA4+3x5QnFBxvxs/QIi1r4EqNMLT7XXumVZNRXV7c/1jroTassQHCOFB4HrKD+JVWWloVhsV//0mpN0FX627oeaJNg9NVivTY0+xA+2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x8GF7vp0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x8GF7vp0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6870D1A1002;
	Thu, 24 Sep 2026 13:41:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DC6660341;
	Thu, 24 Sep 2026 13:41:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D08E103294D6;
	Thu, 24 Sep 2026 15:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790257293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xLAWXoAqE+60g1cvgidm3NIwGVVBCvvmj/eG9JwqIno=;
	b=x8GF7vp04HdAJEpj6avB9cMCXcuGiT9rMEzUDGWwa+NgUO3uhTeVf03HL55E0obU9edxfE
	Pc9jwnAd87Unai6NB1lWvjnoLl9JWMoSlZ4nvC2BRmGW8OuFfpFeoojlq5WEFvoA5rES4c
	4CoHxB5aMXyLV2szxFMxwNugeI2TlJizks0YsRhVQJ5TcbmSDnppIgMwXJb+qWtLk2iU9e
	A7zTcyacmRRXNmIqqdUX1jzh+Jkqls1ZMdO1E3/4CXAFK0T+kI9wXrKfDVEfdEc1bIHXrO
	CFTV0DD6Mmc6JTh5eDjZcE0SkW+FUff+VQeLcklSUBoMr9ldDTTeWpOswKhzpA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 24 Sep 2026 15:41:14 +0200
Subject: [PATCH v2 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-paul-v7-3-rc1-edac-v2-3-bc1406161ecc@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com>
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790257282; l=1034;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=nA/rC2OvJeW0AaqvGfx1Brf8SxDvZIsuz7E/iVHMkZM=;
 b=q/IVUObM2voOzLOma/8/kLfiZUMMC0CpxsgKGIGWRxUeaOHpOAP8arzARe7TLz1a9SkL2qu6Q
 IISvqQi2GYABGKI2A34e64nyZVlCziLKePJeZ50CzF4cfdME9vlNArn
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

