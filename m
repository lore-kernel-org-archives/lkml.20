Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4FD3793A2;
	Mon, 12 Oct 2026 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788058; cv=none; b=freEjEodm1MuqhpU8LVfh+ss4PxQ6bdyfWPCQr6uRiIjHecm4kv7C9KRKkhvIiNayozDq90iyZFc4CAg8tWlTMkyDHaa6BWsjF9mSdO8xuIVSZ/Xi3v4RtaYNbgXnmLh9sbkhmpIiWR8RYQdw7XkAt9DiE/opS5rAxGSreAUfMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788058; c=relaxed/simple;
	bh=+zYvJDjvjyDbkuqVFAXpBeT7NaAXCvb2EXICu/BfR/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rhfPUXLBMl6LhljQNVwOO6IWAPWTwHBIZRjFw3G9VqjS2M5oVIPX0FPHBPzT9FxmJl/4ahg3iUBAgRxLIEuGPFbd8Ce8XO2Z+7BTc/aLtD8u62mf1C2QTBPtMnKPUjXlqpgW2Lf74FRXm5aCRyq+ucLoFEXjVmr9z891QjULELg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 861EA200141;
	Mon, 12 Oct 2026 08:54:09 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 51BDD20010E;
	Mon, 12 Oct 2026 08:54:09 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A1E6D180006C;
	Mon, 12 Oct 2026 14:54:07 +0800 (+08)
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
Date: Mon, 12 Oct 2026 15:54:06 +0900
Subject: [PATCH] arm64: dts: imx95-19x19-frdm-pro: add boot phase
 properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bootph-frdm-imx95-pro-v1-1-6757c5f04a17@nxp.com>
X-B4-Tracking: v=1; b=H4sIAA2EzGoC/x3MPQqAMAxA4atIZgNt/UG9ijioTTWDtqQiQvHuF
 sdveC9BJGGKMBQJhG6O7M8MXRaw7vO5EbLNBqNMq5U2uHh/hR2d2AP5ePoGg3hsyTpV93XVdAS
 5DUKOn/87Tu/7AQbONc5nAAAA
X-Change-ID: 20261012-bootph-frdm-imx95-pro-6edf0494358e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791788047; l=3678;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=T+rRMEHcGNOjswqqiijOmdJK9cCyXurOqzLoJPYfDBM=;
 b=joEyfLlMputGo/6PnO31LjUBvTRea/hUFN1YiXx+PERr/tQBkfeTl5ebpL7aTz1znUl5Imlld
 p7NHVREfdVkDB9+FEs/flnxUP0fvWa99WTCMRmruxs+LHIvIu7ywGUi
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

From: Joseph Guo <qijian.guo@nxp.com>

Add boot phase properties to essential resources during boot phase.

FRDM-IMX95-PRO need UART, SD-Card, eMMC access during boot process.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
index 1f62d729a5e7778e570fe2a66d1b2cb70ec6feec..8dc1134f8d24d3ac4928b63ce21d328295cb2ba7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
@@ -180,6 +180,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-min-microvolt = <3300000>;
 		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		bootph-pre-ram;
 	};
 
 	reg_usdhc3_vmmc: regulator-usdhc3 {
@@ -418,6 +419,7 @@ &lpuart1 {
 	/* console */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -696,6 +698,7 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_sai5: sai5grp {
@@ -712,6 +715,7 @@ pinctrl_uart1: uart1grp {
 			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
 			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart5: uart5grp {
@@ -737,6 +741,7 @@ IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
 			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
 			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
@@ -753,6 +758,7 @@ IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
 			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
 			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
@@ -769,12 +775,14 @@ IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
 			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
 			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x31e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
@@ -787,6 +795,7 @@ IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
 			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
@@ -799,6 +808,7 @@ IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
 			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
@@ -811,6 +821,7 @@ IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
 			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
 			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
@@ -984,6 +995,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	pinctrl-3 = <&pinctrl_usdhc1>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -996,6 +1008,7 @@ &usdhc2 {
 	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bootph-pre-ram;
 	status = "okay";
 };
 

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20261012-bootph-frdm-imx95-pro-6edf0494358e

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

