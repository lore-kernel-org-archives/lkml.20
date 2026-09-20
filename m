Received: from v54.v54282eed.euw1.send.eu.mailgun.net (v54.v54282eed.euw1.send.eu.mailgun.net [185.250.239.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8F318859B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.239.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912507; cv=none; b=YHcN3tzEfa6acDNUen/c9kEnLKIXtY7itEvYtzxp3txKEt8mkaMXfzgFyJrZxAA2fCH3guIJ2mPftC/RiNV2pDFoWWPiPzunBSXt3NBCHO8gk4B4b2dqzWwXy6d2SSiJWABGnhoMkXp7dvtmEj9DPg4zSdeYs6JpjpT7WQqgUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912507; c=relaxed/simple;
	bh=qtF+udijNTr8ESJQzc0uN9JGpbrGwb8PdiQ6EIJl2dE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ywm8oUEDPeujxDocfNh3ZG9eBy2mwX8wefFODopQzLKshHxx+JNXb1oVOapKjLMA3fyloB/XKcXThCnRgMnjHvzGbdO7RncusipTPLVEOGmYUi/RczD6R/Y+daGZbb8L7s4k483AHUAPc+ArVtmv9eDqLyGT9mQ9Pa/ai/AurWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu; spf=pass smtp.mailfrom=plajta.eu; dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b=I+U4ggsM; arc=none smtp.client-ip=185.250.239.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plajta.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b="I+U4ggsM"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=plajta.eu; q=dns/txt; s=s1; t=1789912504; x=1789919704;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=xpA0/+bYG+V3mE24O/Gx/WTLzmmfPiXYkUXdb7BfSIw=;
 b=I+U4ggsMRM1YN2RgrWjEjeI2SqEVSItR4axNJBasF9GpyeNZl0p1FWoqxaOnj4pG9hvbWZfx4/zrn5oX4+sRUDR5wVYQajxc7CbVPtwDzzWXvGtmyF8dLWpD2q5AtwCTukc4p7SJbtVz1Z+cSszuv3hazHCQvWiNaqeJ+CCre8kZLZx7qWoSw7WNPOSJSMgJGsFIoWcF5mLpLQlTD3HXkRheESNCGSgVYjX8dxQ5oKIQe/mq6xKcbFsH+TUiVPU/dAGf3DB7t8rDs0K3X1x0DAnwOcLGl6Q1Wt7cqRtQziTyRyUO6CszNTHKRCaPkcSS9KSVAO/U48qLjmUBwpVpFA==
X-Mailgun-Sid: WyI1ZWFlNCIsImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciLCJhOTI0YiJd
Received: from tensor.lan (ip-86-49-238-222.bb.vodafone.cz [86.49.238.222]) by
 b18cc1c9dc75ca617e74a5400a67cf2140990ea41ca79d6592644c77ad7781b1 with SMTP id
 6aafe5b822c83e8341a8fc46 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 20 Sep 2026 13:55:04 GMT
X-Mailgun-Sending-Ip: 185.250.239.4
Sender: andrijsalivon@plajta.eu
From: Andrii Salivon <andrijsalivon@plajta.eu>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrii Salivon <andrijsalivon@plajta.eu>
Subject: [PATCH 2/2] ARM: dts: imx50: add support for Amazon Kindle 4 (Yoshi)
Date: Sun, 20 Sep 2026 15:54:56 +0200
Message-ID: <20260920135456.3192247-3-andrijsalivon@plajta.eu>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree for the Amazon Kindle 4 non-touch e-reader
(codename "yoshi", mainboard marked E01100), based on the i.MX50 SoC.

This enables the console (UART1) and internal eMMC (eSDHC3), tested
booting to a full Arch Linux ARM userspace with systemd on real
hardware.

Signed-off-by: Andrii Salivon <andrijsalivon@plajta.eu>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  3 +-
 .../boot/dts/nxp/imx/imx50-amazon-yoshi.dts   | 60 +++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..dd508451286d 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -24,7 +24,8 @@ dtb-$(CONFIG_SOC_IMX35) += \
 	imx35-pdk.dtb
 dtb-$(CONFIG_SOC_IMX50) += \
 	imx50-evk.dtb \
-	imx50-kobo-aura.dtb
+	imx50-kobo-aura.dtb \
+	imx50-amazon-yoshi.dtb
 dtb-$(CONFIG_SOC_IMX51) += \
 	imx51-apf51.dtb \
 	imx51-apf51dev.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts b/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
new file mode 100644
index 000000000000..aa4cb5864a16
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+#include "imx50.dtsi"
+
+/ {
+	model = "Amazon Kindle 4 (Yoshi)";
+	compatible = "amazon,yoshi", "fsl,imx50";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@70000000 {
+		device_type = "memory";
+		reg = <0x70000000 0x10000000>;
+	};
+};
+
+&esdhc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd3>;
+	bus-width = <8>;
+	non-removable;
+	min-frequency = <400000>;
+	max-frequency = <40000000>;
+	disable-wp;
+	status = "okay";
+
+	/* Internal eMMC */
+};
+
+&iomuxc {
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX50_PAD_UART1_TXD__UART1_TXD_MUX	0x1e4
+			MX50_PAD_UART1_RXD__UART1_RXD_MUX	0x1e4
+		>;
+	};
+
+	pinctrl_sd3: sd3grp {
+		fsl,pins = <
+			MX50_PAD_SD3_CMD__ESDHC3_CMD		0x1e4
+			MX50_PAD_SD3_CLK__ESDHC3_CLK		0xd4
+			MX50_PAD_SD3_D0__ESDHC3_DAT0		0x1d4
+			MX50_PAD_SD3_D1__ESDHC3_DAT1		0x1d4
+			MX50_PAD_SD3_D2__ESDHC3_DAT2		0x1d4
+			MX50_PAD_SD3_D3__ESDHC3_DAT3		0x1d4
+			MX50_PAD_SD3_D4__ESDHC3_DAT4		0x1d4
+			MX50_PAD_SD3_D5__ESDHC3_DAT5		0x1d4
+			MX50_PAD_SD3_D6__ESDHC3_DAT6		0x1d4
+			MX50_PAD_SD3_D7__ESDHC3_DAT7		0x1d4
+		>;
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
-- 
2.55.0

