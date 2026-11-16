Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852222;
	b=ujp9uefPYjHEmjVsuf+/hTkiKEiGYiv+s7qzKjMoHhJaW83Btvy4PsJ66b2GoqEl9y2I
	 PCfb/quRIfGSrLJgHjwwEbFOiWM/agPh0s2EkCtmJmMiKnH1U32AHwH11Bp6dW7209OSf
	 p5uLI6UxAdz/RJeuzN53oXOH+ZBEr+LO6mjnpJkpH5XGFKpop6As3ZjmI6fhcyYpEad9f
	 BUwpg45fKEdMwdwpmBuySCRxrP3uDo99Tx/9MLbnubfCyWUOftOg9q5QDo8ik4lViKgLO
	 DkljRkVDoWG4C19kNdIq2kHsWitS8ADQvkRhcGpFt6SuNw4voXzgOsI+XhBIS3DEH/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qdwVpDmUyX6+miopugFQ74zvWKqlDoa5kHuLWgelFRU=;
	b=TvEsc0qry+JTo5rdVqpaQ1l4t9J22rLaORQdUwURQboszvHtCu8UMzjSKfRNuKBXZzYi
	 kGLWLbvS2r1qh+kyzhkt3agTsMKHaDNXALh6A5bfR7B5BoW8OO11KnYhdoc9WhYajEBXk
	 D2ij4CsfJWUC83fFbk7qlVjRUiVdI+B4l8gjk/4QAhuBY/8TW1aWujRPPA91xi1cPlKnt
	 1Xd8okQ3iE6U7jNfIdtY/1t6WISxZTxGyhViImpWs9zLxudh9NDTeO112Qe5tppzh3xhC
	 1lAPgZGJ9/oIfeFt3JYEJrZ7AJZdZexhqL6zGikDABxR0sq/2hgCM61TufY/y3+CpjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Czu8QGyZ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D878D606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D878D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Czu8QGyZ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so12947745e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852220; x=1795457020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdwVpDmUyX6+miopugFQ74zvWKqlDoa5kHuLWgelFRU=;
        b=Czu8QGyZXTeH+BM9fYzjSN3b+Fh5w8Mp2jj0bC03jjr+wUJ1N1/sD4l8idtAkqb8e7
         UQGbrnphsMPfy9O2B+EulzworGT7D4m8uF/FqxBVXJTZ9Gq/SjoeJ+FREG0UV3Ejw+ZK
         nTV7mH8Lh8c0dj7MJJtfpZcnsaY1BT91B3golLrb6jQa4hzfqSG0Krxo7ZSIDhgNeLwy
         E0QYPUepeNHk0LBycG2IuHaTOq/Dc+BdzmHXIwhhiFQBd66R1V6fXeq6UotJpRv4dY27
         5DeYskGmh2OE8t2s6PSLEwID5hWOwfteluJGhEJnQ1yjJMvY0kWvIn8EfX6mLTPW1LJw
         n+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852220; x=1795457020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdwVpDmUyX6+miopugFQ74zvWKqlDoa5kHuLWgelFRU=;
        b=NxvY+YPWSKIYzBjVURxaLOMtEU0aa92Q20HDr3AFMMu5EZSEtyhNi/k2SAksGWFaVf
         BTCL0tSnmwU09LeAoOCHnBk6kk82dnrXW7+orwZbvIU/BhojKccIkG1gM5nu2BsCT7HN
         myUFabDZ6Ve3J2z7bzZ0oCkZgBd6m8Hc1ikjWw5ARq4PhkLSF8OY4Xoe62S7wjjFZy6i
         O/CYLGix3MMXJdwuwLmqcFFeGR6x4LErlzZ/PyaUaQ4jEdPeDlFAalFklrNmH4citGxe
         NNd7l907RC2eCtTtHPLF6l7eavbO0b/bWnfVI2Tqjhf8NrtYPs2Zy4wORaHi1FPX9Kwz
         Ml1A==
X-Forwarded-Encrypted: i=1; AL+hErF4cwygBcMlr3BQCEqaqc+esQQrd1Eln+evZobsIWU1LtYArG2w9VuiMIHV1qpL/NG4+d5PUffTNWanrvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8smETZBJHsgZOr9E60yJsYCd08DEes/+K49hAocaQxiAJEeQfK
	PWuv08gBOPYXgtVeZtwVmiuRQ4ej0EiVbpQWpnWs1R24pnHm6qon7z2c
X-Gm-Gg: AYBFou1Xx+QVFT9dAJOihZROFlMO2lxchbuvZeUKEe+l3oxmh/ivZ1fLmbVRz8hCwP0
	0nJUO0a8rRgmSnFS9sxr2SWUKGsP+jF1iZyeMUmCerNPQKhJNs/tElZC5OOtELUpVTOBl3iEpOK
	Fp5WKZuvsFlxblKYH5vC6cCsjz8xvGvxYKGr+csySBDMKRuDvG3eremkrWTvfm4pjdQv3bSAGOr
	KNs+yvpep5AE/cMGf6l4/bwatNoyy4+JwyQu6al3ziLfhhgib+f2aCTYUW0c+NO4HJV9Aoh62NP
	BJqlEJisocpUOygYQGOvQRmn3kFBIFk8urRcOS0Zq0PgJE0Ve2IZ91csAzmWGrdsQZpAS7V+N8M
	mDR/VDy27vFFSsU7CQQuJVdomNVNlytpeAQA9MhsdQZdW5yBEsfjc7rjm0LRntvojR9xDv+mlcz
	iCWVRRa1GPg1dXLt3Pd5pwFU3OzBbduMmOEP8bcxTt9ZffuEm5Y0RWjLBNlMdzO4YqVIkh9ZZWN
	XFM3wI2PTjwO5geH7OkN1GQEzswUDc/6jg1nAawtqEjGoHT++uKJ5se4wXek1/Zt6tAW8oQxLjE
	zwqrbdezgxmy/05Cf+CHo0+dXy637+XdLNRAG/HZcphwonjyfr1x+Mt7gMdR8GxHTCrhkKCBhl1
	RRjXlGIG1Zm+oMmPKQR8WIV2GBvOOsKq0hl8UwnSj7wdlcyApsghX4JE=
X-Received: by 2002:a05:600c:c167:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb6a75defamr97842195e9.8.1794852219973;
        Mon, 16 Nov 2026 10:03:39 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm23904692f8f.10.2026.11.16.10.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:03:38 -0800 (PST)
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
Subject: [PATCH v2 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Mon, 16 Nov 2026 19:03:33 +0100
Message-ID: <20261116180333.43440-1-stefano.r@variscite.com>
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
include, and add overlays and combined -m4 DTBs for remoteproc and RPMsg
support.

Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
also disable the buttons and PCIe, which depend on GPIO expanders on
I2C4.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
This patch depends on commit ebb21cc5d1c0
("dt-bindings: remoteproc: imx_rproc: Document memory-region-names to avoid implicit ABI")
for validation of the new memory-region-names property:
https://lore.kernel.org/r/20261023-memory-region-name-v9-1-ad597887dfe9@nxp.com

v1->v2:
 - Add memory-region-names as requested by Frank Li.
 - Convert the Sonata M4 configuration to an overlay, so both boards use
   the same approach and the overlays can be reused across board variants.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx8mm-var-common-m4.dtsi   | 62 +++++++++++++++++++
 .../freescale/imx8mm-var-dart-sonata-m4.dtso  | 49 +++++++++++++++
 .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..c542613ed3ea 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,9 +245,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+
+imx8mm-var-dart-sonata-m4-dtbs := imx8mm-var-dart-sonata.dtb imx8mm-var-dart-sonata-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtbo
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
index 000000000000..ba2457d0ec91
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
@@ -0,0 +1,62 @@
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
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m4-reserved-ddr", "rsc-table";
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
new file mode 100644
index 000000000000..dacc845e53ec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
@@ -0,0 +1,49 @@
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
+/dts-v1/;
+/plugin/;
+
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
+/*
+ * Keep the touchscreen enabled without its optional reset GPIO, since the
+ * GPIO expander on I2C4 is unavailable to Linux.
+ */
+&ft5x06_ts {
+	reset-gpios = <0>;
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

