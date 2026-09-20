Received: from v54.v54282eed.euw1.send.eu.mailgun.net (v54.v54282eed.euw1.send.eu.mailgun.net [185.250.239.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CEE3DB62B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.239.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789932887; cv=none; b=V83D+vEJc4Rsjns9nmHyBiGmA2j1+XtNBHK0gmIgY9ocFzDPulHGQINy2WQTXfsN2DVvr5X0bcFe4kJ/Rr+UA5dbTTtH5YtL9fU3c3x4ad127eyJD/+SYmTX3s0KSN6u4YPcyIJMRghDEdYK37S2QNZxLteAVz8l/1tWCAhGeSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789932887; c=relaxed/simple;
	bh=t4JIveL13S9gauJA04Ox198PtrobTg34jManQ35hPL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSg58sEeVL2NT7kwrQ4kkIhXuD3pLG0ieY1awyGsR4dkU2sdC9eRNI5EeI/4l5CuMUrzrgEJiDKy242EtE6QfT7IrM8z1vka0OsU91kKmTimJckULT6dxcQs4w5e5knhHAWJyCoZNlZtXv4v+LXUMC64LZLIuPjIpdkceiBqQus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu; spf=pass smtp.mailfrom=plajta.eu; dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b=5cBxX8vI; arc=none smtp.client-ip=185.250.239.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plajta.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b="5cBxX8vI"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=plajta.eu; q=dns/txt; s=s1; t=1789932882; x=1789940082;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=FmzhuK6IpWvR2aW1te2Z5aBW1CaQdm+9cLdgsDSyZlQ=;
 b=5cBxX8vIRFqKqGRGGA/GjJEc1t+MULA/9QlHxSPiiZxRyqWu2MMaFxXoi4ezVzLNOvwC93EDZpXruaz/t4otjUR76oBealH5SZSDFtqwsGE2i8c7EsEWUG6nxHWPg66FQPXWKq9CPld5TPIXwxAovlbYtM5mB8Li/HmsM+kLvJdpbUS55+PPG0A0mayu0WAS+kDjJBLxT5CfzLZLlq9jzK1eu8k6QGeFCk7PIupDjfZ/DY9fm60PVWUYVcZ1ISJp+SLTS1guByOys9VX+wrHIxv9k9N4qHnxsxHGWun0dGrO+prSi+o7+J6+lHL/Sxx9bn6PLlPWuj2D+UfrFIsQOg==
X-Mailgun-Sid: WyI1ZWFlNCIsImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciLCJhOTI0YiJd
Received: from tensor.lan (ip-86-49-238-222.bb.vodafone.cz [86.49.238.222]) by
 00ac16c5e585ac9bceb1079b802b58c72c785b7e76dfb24b3a1541702f7d4fe6 with SMTP id
 6ab0355132eec1afadfe4f4b (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 20 Sep 2026 19:34:41 GMT
X-Mailgun-Sending-Ip: 185.250.239.4
Sender: andrijsalivon@plajta.eu
From: Andrii Salivon <andrijsalivon@plajta.eu>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Andrii Salivon <andrijsalivon@plajta.eu>
Subject: [PATCH v2 2/2] ARM: dts: imx50: add support for Amazon Kindle 4 (Yoshi)
Date: Sun, 20 Sep 2026 21:34:24 +0200
Message-ID: <20260920193424.3637697-1-andrijsalivon@plajta.eu>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920-imx50-yoshi-v1-0-b8a46b3a972f@plajta.eu>
References: <20260920-imx50-yoshi-v1-0-b8a46b3a972f@plajta.eu>
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
 arch/arm/boot/dts/nxp/imx/Makefile            |  1 +
 .../boot/dts/nxp/imx/imx50-amazon-yoshi.dts   | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..1a9e70b985d6 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_SOC_IMX35) += \
 	imx35-eukrea-mbimxsd35-baseboard.dtb \
 	imx35-pdk.dtb
 dtb-$(CONFIG_SOC_IMX50) += \
+	imx50-amazon-yoshi.dtb \
 	imx50-evk.dtb \
 	imx50-kobo-aura.dtb
 dtb-$(CONFIG_SOC_IMX51) += \
diff --git a/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts b/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
new file mode 100644
index 000000000000..417972ad6bb3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
@@ -0,0 +1,59 @@
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
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX50_PAD_UART1_TXD__UART1_TXD_MUX	0x1e4
+			MX50_PAD_UART1_RXD__UART1_RXD_MUX	0x1e4
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

