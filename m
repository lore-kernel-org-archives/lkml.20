Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890321;
	b=OCZjhC7YosqGIbd8alQQVazl37mZbFSPipclPl1xeNmntKmCBVg3LxCTDHeAui0CFf7v
	 7qd1cPyqwe0mWRdvy4mZHkoTGAF/jq1XqTNAVa15bVe5BYVDANvzCZ2DuipTtG2eqKMdR
	 vj7UG60pV/7A2nF9NzGi2ibWxLk27Vy3ToZQYSQMTB5E5GzdlEuXdPNh08NiaMv411P31
	 jokLxLVRPO7rR+xLgrOnrtK63E23hKn3YzUmZXRMmzPBJiKF+MCLBZR5FuZjNR7Xoh1oy
	 5ep1F2J5x7fA4mHYSyM8ml2L+VMohLieBBEca1gun7pcyyEcyPdpmFsVOfyZQp8blDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890321;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tFn6zikrEC2zlRMrakpJdg31GXuSzHcjKbCz7ZUJ270=;
	b=pF5zf7reEZhp0Pgg9GOop1ZaP0sYV4hwgv1e1zJclqF06x+a/e6QKrAaDTvZurw4EmQM
	 ab7Qb25MLTsx2c1oeLmXaG+ToiiVUylWsLI1/L+8XEV3TjVpC84iXI46RyOpcVCxo3pIX
	 2GjFtvdgOWRI6GXu+Ixmqefc3Gd1pRYtbHEbOlLdPKGmpOIjI57Ys4IunceLU1wwuAoP/
	 XSBfPO/OV8gDIG1DU/0nn1v/mzwAk/Q4t0sZs8XyL8XDYAnIjaP3sJjhoJ3BWLqdRVBPZ
	 N17+z/NeuZ3BSPjQHSvCi2Itb/i9P140VziKuifTiq6YZuswqRm9sSk9CyF2P+IqjCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAhtLQAF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E9B606A328;
	Thu,  5 Nov 2026 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAhtLQAF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDC41F00919;
	Thu,  5 Nov 2026 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793890320;
	bh=tFn6zikrEC2zlRMrakpJdg31GXuSzHcjKbCz7ZUJ270=;
	h=From:To:Cc:Subject:Date;
	b=UAhtLQAF7ygLXbRm4nIp+VFu3Zsf5fwk2EQdIQK2d9V2i6A8PVlNuSObt9AuFKSXj
	 SoKszMHuYAQBz+LdZhBnKMbqx2bco+KTDrCNSu7EmVIizM4XdbI/Qv2Ye3ZmaNpiCc
	 Tjo9Ks58BNb3G0fzdGPjTZLLnVUtM8eLB95E5zD5rFCHJZm1FxBTQqK97ogSlDrbq2
	 JAwRVjm+pu/CXuNGkxtY4vjLzvR6tW6+J+E6EOT5ovABUjdLXyjTkKYF+J0qPQ7Dq+
	 iVZUmUg9YoyY0l96BX8hnLottoD2lgi48PqczKNKEBlmKMOB+r1Gyw+pWXBY8tost7
	 iO97CRtnQYqjg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Date: Thu,  5 Nov 2026 08:49:19 -0600
Message-ID: <20261105144920.2796623-2-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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

These .dtsi files are not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Rebased

It's been nearly a year and these are still orphans. There was a promise
to upstream something for the kontron ones, but that hasn't happened.

 .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
 .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
 .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
 .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
 4 files changed, 123 deletions(-)
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
deleted file mode 100644
index 5a9b819d7ee8..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6dl.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
-	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
deleted file mode 100644
index e76963436079..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6q.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Quad/Dual";
-	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
deleted file mode 100644
index 3a968782e854..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
+++ /dev/null
@@ -1,45 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR MIT
-//
-// Copyright 2017 NXP
-
-#include "imx6qdl-pico.dtsi"
-
-/ {
-	leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_leds>;
-
-		led {
-			label = "gpio-led";
-			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-};
-
-&i2c1 {
-	mpl3115@60 {
-		compatible = "fsl,mpl3115";
-		reg = <0x60>;
-	};
-};
-
-&i2c2 {
-	io-expander@25 {
-		compatible = "nxp,pca9554";
-		reg = <0x25>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		#interrupt-cells = <2>;
-	};
-
-};
-
-&iomuxc {
-	pinctrl_gpio_leds: gpioledsgrp {
-		fsl,pins = <
-			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
-		>;
-	};
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
deleted file mode 100644
index 3d56a4216448..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
+++ /dev/null
@@ -1,54 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR MIT
-
-#include "imx6qdl-pico.dtsi"
-
-/ {
-	leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_leds>;
-
-		led {
-			label = "gpio-led";
-			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-};
-
-&i2c1 {
-	adc@52 {
-		compatible = "ti,adc081c";
-		reg = <0x52>;
-		vref-supply = <&reg_2p5v>;
-	};
-};
-
-&i2c2 {
-	io-expander@25 {
-		compatible = "nxp,pca9554";
-		reg = <0x25>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		#interrupt-cells = <2>;
-	};
-};
-
-&i2c3 {
-	rtc@68 {
-		compatible = "dallas,ds1337";
-		reg = <0x68>;
-	};
-};
-
-&pcie {
-	status = "okay";
-};
-
-&iomuxc {
-	pinctrl_gpio_leds: gpioledsgrp {
-		fsl,pins = <
-			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
-		>;
-	};
-};
-- 
2.53.0

