Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2F35A3594
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421066; cv=none; b=ReNPNG6ObaWkxR4tHZZ42cG1+e6vOyDNYFqBdhkU/hzLzl/MIGmjlYdGyQnt9CW3/G484432YX1HWZKU9pbkLdB7p38UPHAPmUjGSh66WgDve5UTgqSdOBTW3W7MRvkAOVHUzHfNuldA2DXj1pnq7TMtsrIDwnhADJMsiISmmYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421066; c=relaxed/simple;
	bh=M50cgOBy/LauGa0pGoFBLyHKSyVtAgLQdzrWGmCAWp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXk0dSjolP+3xi5VMALZQbN9Mz+p3Vc9htAu9Q8sOa3AUCvoMvg9yZtgqgYipluFVxBjRp5ngGJIsyyCJELlFsEUtjcFxI/wCJ0Q3LYwxCUUtcMqP9EIiL5vl0Xc7a6G1xilVpZP1cHEprJL3n6Hvh+dIOeaGLE2S1ZzXbaHcoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jL1wVhbo; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jL1wVhbo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C4C894E4120B;
	Mon, 19 Oct 2026 14:44:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9993360582;
	Mon, 19 Oct 2026 14:44:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FDA610328D3B;
	Mon, 19 Oct 2026 16:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792421062; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xH0gEgoLRWaLsp635rB2jonezfltFGPWmAbpMXeeiOk=;
	b=jL1wVhbo9M+I0bcruq5q6iCzf+vaN3qXBgpv6gKJCSChx2p52y6CbU9qFIGx1dc05v05Oz
	ggmzmmfRbKXUc7SwYxfqJj86ooN2PbuCxo9Ek/lXpkQ8c+u4tOjiaBC3qlOXp7v3VkpK2+
	dCSGurDjswzEUgn4Nrqm8xl9C6B9Yvq5/ZVlveAnSzIZfKV8lmyj4vbaHI6w3DkYmZ1f4V
	A8UnbCd2naDtFspeSjdsbSR04gYnDcbc+whbfuFmhaqSciuUepo7eH/DNZ3t0Qv785Qqvk
	37vNJaPiUVf9HYbvgkOiMabFrMDp0r/imnnNmHxexCKpLd3/cWX3n9s0Pz8r5g==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 19 Oct 2026 16:43:27 +0200
Subject: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
In-Reply-To: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792421040; l=1057;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=M50cgOBy/LauGa0pGoFBLyHKSyVtAgLQdzrWGmCAWp8=;
 b=r8ZMJOImRgqEPTGLesAcBvG1dlQkFjPOtp+af7z33pYiw/wziqOJuhfVrYWyYefhgT80FY9uO
 z7wG6lnbLieBAwrzA45E5IQBnc1E5vmHSqW4q5fX88FGxp1P1LWMZvb
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

