Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507504BEE30;
	Tue, 13 Oct 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884761; cv=none; b=TQblt5iypq61p9v9pnT2g9T+MfKJVD8M+vO+G9bVf8FlirCi36lzPMARlbME1sV5eEGt4tDnMxBRSErz3Mj9sf7kfxJ0H0T8o/pzDF44aPNhntVdbNGizohLSCnJUlh2g2NxUO7c/sVIt5HHS31GlIAWhjy38SVYl2gXO4uJu+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884761; c=relaxed/simple;
	bh=kMWLmxhCwJOi59BQEb2+yGb43FlsThs5bgXxOU04Y20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CPKP7br/fLOo297MjH2zJ6MhPa2fN/WKWeTRLbfRY77dYXaUWeeagOza0gvFibRpKludtJV+OLAY2KQc+wCy8xHfAOyKZEsLB6HwMeLoxLU25WXgH5e8gg/Zsta33OfchQzzTxjCQ1HaQ5EihZbYRYLOIVy2eten4pqpfJ6P1QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=d5iBv4cn; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="d5iBv4cn"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oc+GAxo/OtJxhYCWXAstFX6SEZo+nVR4t/iiwMt80Y8=;
	b=d5iBv4cn+gluKJAatkFOZymTHOO2gK38vW/4almumPm5ZpRlfAnc/6qh/sbGBTgYoPT8gk
	rG5uT1CE90vNB6panQpTFWN0FUgc5EH33MwtMOYiyP1VDxwi03pz7o7TdDjn+DT0TEyLvX
	iC9jgpZKJD09RZwzrvB1rA5bATcL04zvC6UqUu9wU6LPt8BYEuyd+fRU/hACGYCWzIs2ee
	1oy9Eo+4mimAI4YqlOG0xagPp9QiDvOp+e2YoGO4Wf2/x8Etqex1vAoH3xH7JvmLRYsU8k
	3N//LZY7EzKFyNjeXyWJ3Teub9wiodUpOPGxYM5nLfz2QReS7vAdqN71a7Xrew==
Date: Tue, 13 Oct 2026 11:44:50 +0200
Subject: [PATCH 5/8] arm64: dts: imx8mm-kontron: Fix GPIO label for
 PCIe_SM_ALERT#
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-5-94f09ec520ef@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=N9VYCVh8GuLzJHb8e854RVh/8/k+oRLW0d502vksBdM=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36ObI+RbZvx6UKl0edvewjvvTHg2Gc7TPVmlEyXgs
 +1nxav1HaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABORFWRk+MvSmbctc97cdw22
 5VffX3C5nyOSJHlN5o69lNX/d3skpjH8lfRdcPyx4axPp5Js1/zxlq9m+u9x7e6ih8rhpenalx8
 u4AMA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The OSM specification provides generic names for all pads. Fix the
GPIO label for PCIe_SM_ALERT# to use the correct pad name in order
to align the label with the spec and with other OSM module
devicetrees.

Fixes: 6f5e6d7306c0 ("arm64: dts: imx8mm-kontron: Refactor devicetree for OSM-S module and board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 35b76cd02b1df..9fb229815c1fe 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -223,7 +223,7 @@ &gpio4 {
 			  "GPIO_B_7", "SPI_A_/WP_(IO2)", "SPI_A_/HOLD_(IO3)", "GPIO_C_6",
 			  "I2S_MCLK", "UART_A_TX", "UART_A_RX", "UART_A_CTS",
 			  "UART_A_RTS", "", "", "",
-			  "PCIe_SM_ALERT", "UART_B_RTS", "UART_B_CTS", "UART_B_RX";
+			  "PCIe_SM_ALERT#", "UART_B_RTS", "UART_B_CTS", "UART_B_RX";
 };
 
 &gpio5 {
@@ -614,7 +614,7 @@ pinctrl_pcie: pciegrp {
 			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22		0x19 /* PCIe_CLKREQ# */
 			MX8MM_IOMUXC_SAI5_RXD2_GPIO3_IO23		0x19 /* PCIe_A_PERST# */
 			MX8MM_IOMUXC_SAI5_RXD3_GPIO3_IO24		0x19 /* PCIe_WAKE# */
-			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19 /* PCIe_SM_ALERT */
+			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28		0x19 /* PCIe_SM_ALERT# */
 		>;
 	};
 

-- 
2.55.0

