Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F504F404B;
	Tue, 13 Oct 2026 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892311; cv=none; b=TLqXPoB0YvCN6GxFYyrXjuGOrSdzJdT6g8Pt3B0lovqqkR6keQmEnyzALfdTvSsONovlqVE2UKx9181sqoKTsYjI5rj1wErQCx1qpASN4eupieMQI4Z4QxcivUSGNrm0BrXm8n+Ls4oHb/VekzjqczBqoi1XckLHQoLUc4QjwtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892311; c=relaxed/simple;
	bh=3/JzDGYh5PlOXg3+l+Qj8k2PA8m3clNRgUQcSlfwxVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxnTz2mMoX+nChC7KA+RDYRDzrT0avXDRlI14ord+Hv5yugUfglaAHmy9zFrNrMSLPbjj7vqQQU+rAA+Yodlk2CH+kEIyt3gRxXEMxFjs3V+Vuf/4aMz7f/jkQu0PBRVmDcsuMGBggiC0R2URI8GF5uutroDoyJUA8eFHm8j6/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=0hLHGN4E; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="0hLHGN4E"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvOEPFtPzQzKLUYMK93ocRj37FpDFeyR1MEc3ztTr0s=;
	b=0hLHGN4Euaz+k8H8mT+zSljroDdM6C/aycHOEYzzrhczz4jEtpUxTrt3qjYD9T/JoJOCQf
	e6bhmNl+YV0ZdyB/K1gyERjptuN1FnQqF+Qhs7VSy5ibcrb27ldRKSTKenqczxk1mVQQ5B
	Yk+7Y0yz6Mw1ZhWBIUn1DdgPq+DwvFp3QC4RFt/cUbI3KstX+AcVa/qrq5z0w8SQJwDKPZ
	osxWUaUKDxW8292FYshsLIQ10c4tOp7bGBIp5PKOBUAe4cCG0Kphwp9ZcYommPYqC+TCeW
	8teETg2u34WPSH4hFDN59OryAgRwfoUcxIXfXmoUz+SeJLaVrgHv7yH2I1zy7w==
Date: Tue, 13 Oct 2026 13:51:11 +0200
Subject: [PATCH v2 6/9] arm64: dts: imx8mm-kontron: Fix GPIO label for
 PCIe_SM_ALERT#
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-6-d464ca652c91@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=aaxRKaOe/mV9rDuv1flggH0cjtsajMFJy+hs4E1+4IQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctJ/7+vON3fliDdIr/m+7YVD46MvW1St88tb1njixQ
 255/bVLHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABN5dJORYW1sN6/1oYfhmz8Z
 f9WT03QLDD4qrnqyZ8rraXJyFvptKxkZnj1ddCBtwmLRCoeu3T7t9rdiAzpKeGqCD5mkV79LXlD
 NDgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The OSM specification provides generic names for all pads. Fix the
GPIO label for PCIe_SM_ALERT# to use the correct pad name in order
to align the label with the spec and with other OSM module
devicetrees.

Also fix the label in the BL board devicetree that overrides the GPIO
labels of the SoM.

Fixes: 6f5e6d7306c0 ("arm64: dts: imx8mm-kontron: Refactor devicetree for OSM-S module and board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
index 3a166cf0afcb7..8d17701233876 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts
@@ -156,7 +156,7 @@ &gpio4 {
 			  "DIO4_IN", "SPI_A_/WP_(IO2)", "SPI_A_/HOLD_(IO3)", "GPIO_C_6",
 			  "I2S_MCLK", "UART_A_TX", "UART_A_RX", "UART_A_CTS",
 			  "UART_A_RTS", "", "", "",
-			  "PCIe_SM_ALERT", "UART_B_RTS", "UART_B_CTS", "UART_B_RX";
+			  "PCIe_SM_ALERT#", "UART_B_RTS", "UART_B_CTS", "UART_B_RX";
 };
 
 &i2c3 {
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

