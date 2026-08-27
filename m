Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCCF38886B;
	Thu, 27 Aug 2026 07:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817481; cv=none; b=otj6pRoQKSSenrKH05YGWO7v7yKn/nX7bCZln4OS5jKTHx9N5MlFmH/XUe5SQXP9Z25u8ckZm4vqIRrRnoYaCmBYMfO5JY6mY7S942rXLevNTjY4rETd2iGIScR0DpVCp0wJdlFT9FktUX3rpFdv1P/ZJSbT90qhfkU6Ulx5Zz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817481; c=relaxed/simple;
	bh=wB7oQYB55ay6TpsBEEieK0+fs1L5wWTB14GeroUIITs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ry+PcZHn8J7y8jYSW86HTh5eyMaP/8XT9aF3/OdVQshAQEiFGWypo1rz7EkZrp9Pwg5XwdCih8atRmCZ6uk4dWiCSZP0kShaxlTOAVHH44C0l+n9prM8U7fYX7ksvJxkp1LtAiMDeSwROgAdMQCGDo4PV6KdCuBJTR3MG+0Riko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=S2vbAg6W; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="S2vbAg6W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yvFziv4lNhYffP/GPGVZf1WyR/w9ddzuS5seHRU85Hk=; b=S2vbAg6WhN1L+tJiFtAtgDm0Hi
	9GqoPnQaeEaWKG39TQkvot67tEywlo+Q/TT9gw3boyOw+bsuX/SMEROHWQYuAGIo1frfpjdne1zJf
	hiygudBzL1onRe1hRIY59fPoGIT3lNchgbKi+3lWEwCq9oetGYuOOwc2mu18tEvvShp+woFoGpaf6
	0UI54VhiRGm+5Xp3S2XQAWKSMC3Ap6uHXNCWnmDiUAth88Nb/mgxHk7/0MWdweNP1cAKiEtqXjNhG
	Jt3dHH8yEZnwXNdSGndJwFXqD6VHYMQVRkG20G1J32yaGX8Grs2u7jzFAQGqw42zblQw/dtMGUejm
	8333dJxQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:55640 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wzUzl-00000007oR4-0FED;
	Thu, 27 Aug 2026 09:57:56 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH] arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-07 expansion board
Date: Thu, 27 Aug 2026 09:57:54 +0200
Message-Id: <20260827075754.2739119-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add support for PEB-WLBT-07 which is an expansion board that provides
WiFi 6 and Bluetooth 5.4 LE functionality. It features the u-blox
MAYA-W2 module with the NXP IW612 chipset.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../imx8mp-phyboard-pollux-peb-wlbt-07.dtso   | 76 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-07.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..9c9dcf08c96b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -456,6 +456,8 @@ imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra-dtbs += imx8mp-phyboard-pollux-rd
 	imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo
 imx8mp-phyboard-pollux-peb-av-10-ph128800t006-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
 	imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo
+imx8mp-phyboard-pollux-peb-wlbt-07-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
+	imx8mp-phyboard-pollux-peb-wlbt-07.dtbo
 imx8mp-phyboard-pollux-ph128800t006-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
 	imx8mp-phyboard-pollux-ph128800t006.dtbo
 imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
@@ -465,6 +467,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-etml1010g3dra.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-wlbt-07.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-ph128800t006.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-wlbt.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-07.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-07.dtso
new file mode 100644
index 000000000000..008b6f9f46e5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-07.dtso
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+* Copyright (C) 2026 PHYTEC Messtechnik GmbH
+*/
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "imx8mp-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	usdhc1_pwrseq: pwr-seq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_RESET_B__UART3_DCE_RTS	0x140 /* RTS */
+			MX8MP_IOMUXC_SD1_STROBE__UART3_DCE_CTS	0x140 /* CTS */
+			MX8MP_IOMUXC_UART3_RXD__UART3_DCE_RX	0x140 /* RX */
+			MX8MP_IOMUXC_UART3_TXD__UART3_DCE_TX	0x140 /* TX */
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190 /* SDIO_CLK */
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0 /* SDIO_CMD */
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0 /* SDIO_D0 */
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0 /* SDIO_D1 */
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0 /* SDIO_D2 */
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0 /* SDIO_D3 */
+		>;
+	};
+
+	pinctrl_wlbt: wlbtgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x106 /* WAKE_DEV */
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07	0x106 /* PDn */
+			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09	0x106 /* WAKE_HOST */
+		>;
+	};
+};
+
+&uart3 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		vcc-supply = <&reg_vcc_3v3_sw>;
+	};
+};
+
+&usdhc1 {
+	bus-width = <4>;
+	keep-power-in-suspend;
+	max-frequency = <50000000>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wlbt>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_vcc_3v3_sw>;
+	wakeup-source;
+	status = "okay";
+};
-- 
2.34.1

