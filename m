Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9113603D8;
	Tue,  1 Sep 2026 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266989; cv=none; b=LOCxZ6i6DqsATgoi3iUl3YwJ76YaU0P8ouAZa+4Hdw4Zy7krccaQYLymzc3eMxQQOqhRijkrNg7cjjVrUHyUxUN6jhWRgeethVFYBBe7TfmZepG5oxLVnn0CMlCxlrFvrIEgaxdkU3rD5eKv9loSUnjAWOYmUilMfb2gQJucyIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266989; c=relaxed/simple;
	bh=eR5QRP+3ErWplxoTfCLBWrCAh6P4IzW/uFFoww0sU6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WNyJLCL6dmAM6hXV6tXghurySAGW1Q2mH9jxQ43IHOKQuJaYuRXPHuI8NnJa6+k0IUmfOCxVaTnSDadxOb5XCEHFAiyf2KDv2XvFv+wGgucGrryGCtLXT6e4nSUz/4OWhUZl5bJD85pF1T4bgGDUHSY6X1CpimjJGBldbqoDYeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Tw02IMJZ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Tw02IMJZ"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1671E1F94F;
	Tue,  1 Sep 2026 14:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788266975;
	bh=16wkGkGjtMZJK0egYytkz9YHSnlvfQ9XYjKckJktAqc=; h=From:To:Subject;
	b=Tw02IMJZ6jzXen+J6UQZpvw655/oHpgiVUqUrMiVYUbvf6dP6zo0JeDXSi5b3Inws
	 5OqRZpl8mN9abu1KnrutKWp/ZEvy9s+NhEWu9LaOqDis3Ls50vIr3QPaCw66MS3YUO
	 D8TtZSMM0Rf8LVHK7ILDHXaYr8fp38R7dycWkyfuutoJwjLsZljSx1cleEcJ5bnbyM
	 W9nictGWcDSqmJ84f1Bd98ztPyYPW67kwO1G2FNWgy+Z+x4iprmy092kJTXvzz3bto
	 uSZtldAPjzK1lnqOA8ab7gtlLJA1Oz/O0yBdzETyPgLzggOHuD9K1Kyv+t8P41rPzy
	 8O+odu53Ncp9w==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: dts: imx7d-colibri-emmc: Add VGA overlay
Date: Tue,  1 Sep 2026 14:49:20 +0200
Message-ID: <20260901124921.78635-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a device tree overlay for the VGA output on the Colibri iMX7 parallel
RGB LCD interface. The VGA output is driven through a non-programmable
video DAC without VESA DDC I2C signals to a DVI connector.

The overlay is also combined with the Aster, Evaluation Board v3, Iris
and Iris v2 carrier board device trees to provide ready-to-use DTBs.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
this patch is on top of https://lore.kernel.org/all/20260723105225.194366-1-francesco@dolcini.it/
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 21 +++++++
 .../dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   | 59 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index e9f95c3b8353..d1272104ef27 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -436,18 +436,39 @@ imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-eval-v3.dtb \
 	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
 
+imx7d-colibri-emmc-aster-vga-dtbs := \
+	imx7d-colibri-emmc-aster.dtb \
+	imx7d-colibri-emmc-vga.dtbo
+
+imx7d-colibri-emmc-eval-v3-vga-dtbs := \
+	imx7d-colibri-emmc-eval-v3.dtb \
+	imx7d-colibri-emmc-vga.dtbo
+
+imx7d-colibri-emmc-iris-vga-dtbs := \
+	imx7d-colibri-emmc-iris.dtb \
+	imx7d-colibri-emmc-vga.dtbo
+
+imx7d-colibri-emmc-iris-v2-vga-dtbs := \
+	imx7d-colibri-emmc-iris-v2.dtb \
+	imx7d-colibri-emmc-vga.dtbo
+
 dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-cl-som-imx7.dtb \
 	imx7d-colibri-aster.dtb \
 	imx7d-colibri-emmc-aster.dtb \
 	imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-aster-vga.dtb \
 	imx7d-colibri-emmc-iris.dtb \
+	imx7d-colibri-emmc-iris-vga.dtb \
 	imx7d-colibri-emmc-iris-v2.dtb \
 	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-iris-v2-vga.dtb \
 	imx7d-colibri-emmc-eval-v3.dtb \
 	imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-eval-v3-vga.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
+	imx7d-colibri-emmc-vga.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
 	imx7d-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
new file mode 100644
index 000000000000..cda214c13876
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcdif_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
+	dvi-connector {
+		compatible = "dvi-connector";
+		analog;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	remote-endpoint = <&vga_enc_in>;
+};
-- 
2.47.3

