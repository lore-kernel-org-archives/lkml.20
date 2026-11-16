Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827627;
	b=jI1ww5KlFx6Y2YO5FmvBBP3YLohD3ckr44dkRck9Vl6ZnQdewPly+tuaEQozGnyu5eIR
	 nSpWpZrjGb8eDiKnqkRsNAUrJ8Mb21up9c1zDJr+s3PVcYSrAwGxOQqbuDj2e//bTHG56
	 UxSZaIt2Nw3NLNZMWTxQxvJvYR1bGcaI8EvsJ18FnMmRZZT34jaIOWuI9vTg4bXX43Dnh
	 PRIF0RGsRDpqfxb6Qgo6LzVmH/09s/0dJl3rVmY11KssWcPvkQgch9wUC59TlPmr/6NBf
	 XtUrV4yMK1IiAo7Y8lLM/h4TdbvZOcr8WoyRE2FzehQJAizfth6wIBmNiCUkACPJ05g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/E7B+CLgw+x/SfaWIPOPoPWBEopRUEi6rBKwGolhOO4=;
	b=f76thjqtRYCi1oatDGiTyLznssDkhlNQ1+jfFyGchJVBNb9cfMlzeOVpSKnmtbdUMFXS
	 tA7tV4qiNpgqEOnZmDivEcTqx9FiTDl5lzf+l3G3WFaQ2jVkFo5BxMoXaCmkRky09xT48
	 ho1QJayUSKf1rsBYCNN8jUx6Hh/GY/wz0HYx+a11WIlEQ1fdIg9AfbmyvB3Q0b1uFlMCb
	 ij+RoS5YrvL9I5+d4rO8azEFL45mmzcPtQhyVCpARGrIM5GinBsFt1HZsJmNHuNnf6PFC
	 P6Wp4VuATqq2Pqc3AMDXgBwDrqJ59encXcWPAyGwtjSsELd+KRZLyAq9YgEYUuqKbBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKwQC6iy;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDF606A8BF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DDF606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKwQC6iy
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1737546f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827625; x=1795432425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/E7B+CLgw+x/SfaWIPOPoPWBEopRUEi6rBKwGolhOO4=;
        b=LKwQC6iyMs8LsBFdWpMLtGqRZVNsC5s1NGrtjDh6Lv8O1tgyyQQ2Lfx5DNeCDdcgQh
         xliqRScN53obLrIlWCViMABBUygDAEudh9CwMga7HmalfG4dtZW3hN+ucP0Sg3ZBBZIz
         YRCDasr02mGbBS9GbojBKd1X6MswspCJYZVqZWbyf2DaTN0+KHFCq0AZ1YCh+93sr5pk
         FvhaASH47ah9xVQeexDBHynNRl/IMTZeRl6obqp3RGrI0w8zssq44JT54RQNmGR2GgvS
         NkimQVFDVMUqzX2qudYSS1aWCK1i1NTx4DNMIIfs0StB++DweCwFE05Ha6QFyLqJQdTS
         8c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827625; x=1795432425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/E7B+CLgw+x/SfaWIPOPoPWBEopRUEi6rBKwGolhOO4=;
        b=HjQKXkpHGRpxeFVWJKkRHZn81lHj5lNLoyElIEmzWzJB1cLqPr3JtNtrb8n5fkFjQ1
         dqTtePy/x2/hWUGlT8Pm1foLp3k5R2tfz+av0ePOjk10v8b2CNkWq8ZBVPAFtLooggNB
         TFOcG6THKDmrjYBqcncaG7JDeK+EwI3OxhywI9v+mRfHj6PPpwmaUgGsZFo5iEph9Bla
         Whgv7YScDf4FmO6hYdU0zTFgax/srC8EWvwwEs91zXjV/Rojec5ep3Z3hSt3Xa/RDvwW
         gf3FpWbdaiiTrYBeIw90t4eCMvDUvV+TJ1i9NQ+d5TuaY9M3DKOeAVclXdJ6gRyRedgo
         Wt2w==
X-Forwarded-Encrypted: i=1; AL+hErG3QhPVVMnbce0MplwcSVGKoYEyhsCXmW5h6tF3VxvrjLD5ofsCUYbycgOoTymxZLVE4xrBOhpvHGYSvmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g3ez9fZsFF29k4bbEiNWBerxLaET1ZPwuJgcuJdir/smpbhI0
	BZ75Mi1DgZgKbn2JXuvWtgCIFawOYkxYgQIszRNS3qB+DEazl5SsKEko
X-Gm-Gg: AZFdTZfeSDnnrboq0bW3vYyz/TN32qLcAjdLGsLAd/LFpAqBUeP3THlHLGE2mtAwlah
	1eXgF+pac1JAOplHztnDSmptA4MItbkDoKkKivm3U+CiGDHnGM0bXnzPoewkPhHulCorzuZyWYp
	MDZrT+e5jn1uZk/vHqbs5OWJUPv+k90Z7Dqxjta0+NfUQefyVFw4BlY1g0A5U68GSB7linBliRP
	/xpqIM3ogsmRInLScyUSgT9FsEpycKU/iOW5pScnuZFlABnyb497fpMUR11qi0IPLEOfe0Zw2rc
	uP2zRjXzpB46UoC5/xfC7vQ0h+1lnMtRxpvOisA9Rk6DD3iFyoKDUd2qq2Zs7KUMeIRwbIKJMnR
	60yphC/V7J1eD1+iI8BDUKtutsZIhyUj9LSZ2/cw8JuAckVsGl+InK73qs6slReqrbPPWjO6h+Z
	QlXiPw3wrI3Gb3FWORDsj3DFbFOOEvt0dBaFCQOPQaXlZ1oDSxbsucG7+JZBMQRci70MkR5qcCu
	6pBcJ6lM3GeZy2akyVMhZnq5AiekkqCVG6Td4QouwmNLXB+/cTfABhxvqxLzkozm39KBWNJA69H
	qPrh15Tyi26o1Ty4OcgF7xC+B4zugkC+Xy9Z8lMymsooLM8M+HydEZLXrxYveis1X4iKsx0Ckmu
	mD2W2bDw7dDpvQ7Oe6cLsoqAQ7D9y37wDfoRZyvIywyQC7TLOpvagTzE=
X-Received: by 2002:a05:6000:26ce:b0:48b:e50:7159 with SMTP id ffacd0b85a97d-49c71b5bfbemr20650347f8f.30.1794827624837;
        Mon, 16 Nov 2026 03:13:44 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm18061420f8f.20.2026.11.16.03.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:13:44 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Mon, 16 Nov 2026 12:13:36 +0100
Message-ID: <20261116111337.15740-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add Cortex-M4 configurations for DART-MX8M-MINI on Sonata and
VAR-SOM-MX8M-MINI on Symphony.

Share the reserved memory and remoteproc configuration through a common
include, and add -m4 DTBs for remoteproc and RPMsg support.

Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
also disable the buttons and PCIe, which depend on GPIO expanders on
I2C4.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  7 +++
 .../dts/freescale/imx8mm-var-common-m4.dtsi   | 60 +++++++++++++++++++
 .../freescale/imx8mm-var-dart-sonata-m4.dts   | 44 ++++++++++++++
 .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..9574763dec09 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,9 +245,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
+
+imx8mm-var-som-symphony-m4-dtbs := imx8mm-var-som-symphony.dtb imx8mm-var-som-symphony-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw73xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
new file mode 100644
index 000000000000..98790a28694d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M4 configuration for Variscite i.MX8M Mini modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: vdev0vring0@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@40400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x40400000 0 0x100000>;
+			no-map;
+		};
+
+		m4_reserved: m4@7e000000 {
+			reg = <0 0x7e000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m4_reserved>, <&rsc_table>;
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
new file mode 100644
index 000000000000..35e3ea43e5ec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite DART-MX8M-MINI on Sonata-Board
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx8mm-var-dart-sonata.dts"
+#include "imx8mm-var-common-m4.dtsi"
+
+/* The buttons use a GPIO expander on I2C4. */
+&{/gpio-keys} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "disabled";
+};
+
+/* The touchscreen reset uses a GPIO expander on I2C4. */
+&ft5x06_ts {
+	/delete-property/ reset-gpios;
+};
+
+&i2c4 {
+	status = "disabled";
+};
+
+/* The PCIe reset uses a GPIO expander on I2C4. */
+&pcie0 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
new file mode 100644
index 000000000000..f2a1618edcf5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite VAR-SOM-MX8M-MINI on Symphony-Board
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-var-common-m4.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "disabled";
+};
+
+&i2c4 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
-- 
2.47.3

