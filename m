Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569900;
	b=h2LAOkV/EtHa0I643pUpdMypPgNHqzQgAD48IfrPCDkEmFen6uY0RnSNmyoW7U2qC9mA
	 FxOl5BWMKXqdijPoj1uYA5SEMZbk+rrewH3AIS6jLiYPcKYIksFOlW66YQjgZWdkvahRx
	 HkpsV9p7yS/0chjwWHH9l8uNA3xV4HMNhvSTUczzXP4tGaOv7dWToZFa921cMJOyjpz65
	 +gYhnvOKPJ+GBYD700Hvc9pzet3bnNmZJzEHCAenb9sLLVBE6LvoX0Nxzwf5+qItE6b/z
	 iFPnCQjqc+6F1JXSkxeR9H5g15habhnP09KP3hpFRKfrxFiUehr2WMFD8EIdGQ9UGLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vTCHyCAR6eAtqeA5pf25pJ8sdZ1P2+h3QAjk+dSuWXg=;
	b=rIa9HmYMBN/BgC5Ly+BVqaQV1Dvnaw99B9fCEMm+dCVOC5uWpxVr0FHltRD1t2R0UMsB
	 zui1ae0mx8yY7W1FzRcXLIQujNeHESzTgAjB3P5u7XLpKdfgkMsMuutd64jPGg1BHoVVD
	 QAMAidV5HjxcH9RtcZBHPpAnz1rVaa+f9mi09P5kdSfsuZGXOCs/mymFyRs0kpK0YywqQ
	 pNt+YfsGGh2NqAv0zuDulpIMa23YgkVIx6mdkR5fqxCJh5bd+J7TUzau9b70bjfkMmic8
	 R3pPauxDjag5KfV+oCvnBj3cKevKeHuErlapbcovOx6K5E5iecom7/s+eX8EzibAQNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=rbwYETMA;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAEB606A89F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAEB606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=rbwYETMA
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6191035e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794569898; x=1795174698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCHyCAR6eAtqeA5pf25pJ8sdZ1P2+h3QAjk+dSuWXg=;
        b=rbwYETMA4FU/YD49puTuRkkMHgMCy06nrgHsnZl8lh/n9BGsY2stk56zqhqypP8KLT
         cEZhfj5a9uUxpXiQmcOd2c2ZeuBobR9rmwCQvHzfUhM4c1xJ6bbVyEcv08YLF2bDNDFy
         +ue0CWrtqXuvycG34tUBl0qEetVp37D+qS5gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569898; x=1795174698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTCHyCAR6eAtqeA5pf25pJ8sdZ1P2+h3QAjk+dSuWXg=;
        b=fp/g2akJEg/6CGm7pilp3bwcscYtVhVa7GiRR51pvi40Bio0bqD5K4SISaOrUc/lPc
         IAmM/3OivPyu5YSz2yKGpzzv7UU0xIuQHuDeYi7m70ZpVCM11UkBWuXF/y8rDFtsCEKS
         si80F//7vAwMSFwpjdv4ttIH2zcay12vVzrNBNzgoRqVwP7gCVAu3Wg87vNArEDDLHYa
         58RewlgW+w4HQLeF7aXrO7YK7mjAUc0Y0U4zFLpNWwq8AGxvRz99Ao5+IOYEP1bFTpB8
         AxuC7IHzxKyQ+WOdhTr6HSioIkkFur/Z3WPCN5XNnXE1OY/J6vJONe72s6jbie75ScTt
         WVqg==
X-Forwarded-Encrypted: i=1; AL+hErH6tFuZku0gRYq+YY1wcs1IBtxFqWLEzwbi6o2hpd4NEchG399JBKqNVQJP6DoxredTRtlloeSCl/8LfNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/M1J6dXh8thg50rU+cSy+V/fBbXHauQXBN5PMsFiTTRn/xEY7
	nEhr0ERgrHtVFPb5GxSvfckdi7dk8UvLP4px3k1b1GQk8SUG6aMfREJ3mpQa2Egu8mE=
X-Gm-Gg: AYBFou2FwebJRWE1+74141w0khHLzC1kMRP3JG/in/9URb2Hg90sRkvxSD1/Ajc5kP8
	LegqfaIYPIaRZNZDX5+WvV2qiW/ff2qx5zYWFdMXG86lzwiTF57djIoXX5m3WSVjUeYPCU0FHzy
	o0o8H0Ax+A6znS6i6uSbY7baNGDEqYo+zJm0dIJyBKr95AwvzKT/xLTdpk9LhHkBiuUZFRaM3uD
	RcPn5q+K6xlvO7n9zeh99zhiSPHO25ypwJT9PadOMYQDpmNZDgOPFJbMZINZe2kBY4GIs9xQneM
	YFBTIKh74lkPqafBCpw74dTduXEzZ1SVTEk3kD7hqfr07cNkhjPNvbc0Lht1H3A4ZvCdIPAG9ca
	h2p7cBtQy7QrGBwCPnnBMBRwwMjEU3KccZWW2xbb+NXzN6Z2Ay2qXAKNMRbSF9JSwos/kN59FXN
	6MzwRIN20WJgBlwTaruzuwdx8WO78d/FyYIHTPN6+bHfu2wa0Jy9bifmzjt6kumXfQ3MoaoZ/b1
	QvM7ZJED2ZfSKAwcgFA0nQ84wVr544S8nmrWpu9V2p5/pGDGf9N97+9dDrkURPegLYplD8/w4wE
	Iie4MaZbLeAcc0iL/YiJNvpRVU063OhdtPGJkMHWHHGWkUjRLWueNSzP0/cNtgL1GL6YR1lceF4
	O
X-Received: by 2002:a05:600c:a302:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4bb55a57c5bmr35482175e9.6.1794569897619;
        Fri, 13 Nov 2026 03:38:17 -0800 (PST)
Received: from thinkpat.amarulasolutions.com ([2a07:7e81:b71d:0:3e39:d071:1d81:5914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm5448492f8f.1.2026.11.13.03.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:38:17 -0800 (PST)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: [PATCH v3 3/3] arm64: dts: rockchip: Add Axelera Embedded 111c
Date: Fri, 13 Nov 2026 12:38:08 +0100
Message-ID: <20261113113808.1779860-4-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
References: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
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

Add minimal device tree for the Axelera Embedded 111c
(rk3588-axelera-embedded-111c).

It offers efficient AI compute for multi-stream computer vision and
GenAI applications in a compact design. It features a quad-core
Axelera AI Metis AIPU and an RK3588 SoC processor.

This basic version of the dts supports:
- Console
- eMMC
- HDMI
- 4x USB-A
- 2x Gigabit Ethernet
- RTC
- Enumeration of on-board Axelera Metis AIPU

Link: https://axelera.ai/axelera-products/embedded/111c
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
---
Changes in v3:
- Rename from rk3588-embedded-111c.dts to
  rk3588-axelera-embedded-111c.dts
- Drop deprecated "regulator-suspend-microvolt" property
- Add Co-developed-by to the sign-off chain from Michael and Dario.
  (The process was: the first version of the downstream dts for the
  Rockchip kernel we've been using since 2024 was authored by Michael
  with some of my help. The first version of this upstream dts was
  co-developed by Dario and Michael together and in-person at a
  workshop. Later on this was picked up by me and largely
  re-written, but without their contribution and their prior work this
  series would not exist. I hope having all three of us as
  Co-developers on this patch, given the particular circumstances,
  is alright :))
- Add Copyright from Amarula Solutions

Changes in v2:
- Prepend "regulator-" to regulator nodes
- Drop non-existent "mem-supply" binding
- Drop unneeded comment from rgmii-rxid; replace it with the one from
  rk3588-youyeetoo-yy3588 to stop checkpatch from complaining
- Remove phy reset from the gmac node; note that these are still not
  described in the phy node because GPIO3_B7 defaults to pull-down,
  which causes the rgmii_phy1 node to never come up.
  Describing the reset in the parent mdio node instead does not cause
  the same issue
- Use the existing hdmim1_tx0_hpd pinctrl group instead of
  redefining it
- Drop "full-pwr-cycle-in-suspend" from the eMMC node
- Add "vmmc-supply" and "vqmmc-supply" to the eMMC node
- Add pinctrl for the pmic interrupt pin
- Replace the "vcc3v3_hubreset" regulator hack with two GL3523 hubs
  linked with "peer-hub".
- Drop the regulators that were defined but never referenced, and their
  corresponding pinctrls
- Mux PCIEX4_PERST_N as GPIO, since it is being used as reset-gpios
- Drop unused input.h include
- Drop unused rtc label
- Drop the local pciex1 pinctrl groups, as they were duplicates of the
  pcie30x1m1_1_* groups in the base pinctrl for the rk3588

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588-axelera-embedded-111c.dts | 810 ++++++++++++++++++
 2 files changed, 811 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf..51ddc17e98d3 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -191,6 +191,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e54c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-axelera-embedded-111c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-genbook.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dts b/arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dts
new file mode 100644
index 000000000000..0d760ee0f4e6
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dts
@@ -0,0 +1,810 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Amarula Solutions
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3588.dtsi"
+
+/ {
+	model = "Axelera Embedded 111c";
+	compatible = "axelera,embedded-111c", "rockchip,rk3588";
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		mmc0 = &sdhci;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
+	pcie20_avdd0v85: regulator-pcie20-avdd0v85 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <850000>;
+		regulator-max-microvolt = <850000>;
+		regulator-name = "pcie20_avdd0v85";
+		vin-supply = <&vdda_0v85_s0>;
+	};
+
+	pcie20_avdd1v8: regulator-pcie20-avdd1v8 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "pcie20_avdd1v8";
+		vin-supply = <&vcca_1v8_s0>;
+	};
+
+	pcie30_avdd0v75: regulator-pcie30-avdd0v75 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <750000>;
+		regulator-max-microvolt = <750000>;
+		regulator-name = "pcie30_avdd0v75";
+		vin-supply = <&hdmi_vdda0v85_s0>;
+	};
+
+	pcie30_avdd1v8: regulator-pcie30-avdd1v8 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "pcie30_avdd1v8";
+		vin-supply = <&vcca_1v8_s0>;
+	};
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-name = "vcc_1v1_nldo_s3";
+		vin-supply = <&vcc4v0_sys>;
+	};
+
+	vcc_1v8_pcie: regulator-vcc-1v8-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>; /* PCIE30_PWREN_H */
+		pinctrl-0 = <&pcie30_pwren_h>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "vcc_1v8_pcie";
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc_1v8_s3>;
+	};
+
+	vcc12v_dcin: regulator-vcc12v-dcin {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-name = "12vsus";
+	};
+
+	vcc3v3_m2: regulator-vcc3v3-m2 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>; /* PCIE_PWREN_H */
+		pinctrl-0 = <&pcie_pwren_h>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "3v_m2";
+		vin-supply = <&vcc3v3_sus>;
+	};
+
+	vcc3v3_sus: regulator-vcc3v3-sus {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "3vsus";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc4v0_sys: regulator-vcc4v0-sys {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-name = "vcc4v0_sys";
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc5v0_host: regulator-vcc5v0-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>; /* USB_HOST_PWREN */
+		pinctrl-0 = <&usb_host_pwren>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "vcc5v0_host";
+		vin-supply = <&vcc5v0_sus>;
+	};
+
+	vcc5v0_sus: regulator-vcc5v0-sus {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "5vsus";
+		vin-supply = <&vcc12v_dcin>;
+	};
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&gmac0 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy0>;
+	/* RX delay is added by the PHY, TX delay by the GMAC */
+	phy-mode = "rgmii-rxid";
+	pinctrl-0 = <&gmac0_miim
+		     &gmac0_tx_bus2
+		     &gmac0_rx_bus2
+		     &gmac0_rgmii_clk
+		     &gmac0_rgmii_bus
+		     &gmac0_rst_n>;
+	pinctrl-names = "default";
+	tx_delay = <0x44>;
+	status = "okay";
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	/* RX delay is added by the PHY, TX delay by the GMAC */
+	phy-mode = "rgmii-rxid";
+	pinctrl-0 = <&gmac1_miim
+		     &gmac1_tx_bus2
+		     &gmac1_rx_bus2
+		     &gmac1_rgmii_clk
+		     &gmac1_rgmii_bus
+		     &gmac1_rst_n>;
+	pinctrl-names = "default";
+	tx_delay = <0x43>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
+&hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec
+		     &hdmim1_tx0_hpd
+		     &hdmim0_tx0_scl
+		     &hdmim0_tx0_sda>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdmi0_sound {
+	status = "okay";
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	vdd_cpu_big0_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc4v0_sys>;
+		fcs,suspend-voltage-selector = <1>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: regulator@43 {
+		compatible = "rockchip,rk8603", "rockchip,rk8602";
+		reg = <0x43>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc4v0_sys>;
+		fcs,suspend-voltage-selector = <1>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1m2_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	vdd_npu_s0: vdd_npu_mem_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-name = "vdd_npu_s0";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc4v0_sys>;
+		fcs,suspend-voltage-selector = <1>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	rtc@68 {
+		compatible = "ti,bq32000";
+		reg = <0x68>;
+	};
+};
+
+&i2s5_8ch {
+	status = "okay";
+};
+
+&mdio0 {
+	reset-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>; /* GMAC0_RST_N */
+	reset-delay-us = <20000>;
+	reset-post-delay-us = <100000>;
+
+	rgmii_phy0: phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&mdio1 {
+	reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>; /* GMAC1_RST_N */
+	reset-delay-us = <20000>;
+	reset-post-delay-us = <100000>;
+
+	rgmii_phy1: phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+	};
+};
+
+&pcie30phy {
+	status = "okay";
+};
+
+&pcie3x4 {
+	pinctrl-0 = <&pciex4_perst_n>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>; /* PCIEX4_PERST_N */
+	/*
+	 * Add specific mapping required by the onboard
+	 * Axelera Metis AIPU to function.
+	 */
+	ranges = <0x81000000 0x0 0xf0100000 0x0 0xf0100000 0x0 0x100000
+		  0x82000000 0x0 0x40000000 0x9 0x00000000 0x0 0x20000000
+		  0xc3000000 0x0 0x60000000 0x9 0x20000000 0x0 0x20000000>;
+	/*
+	 * Set to 1v8 because the electronics on the pcie3x4 slot
+	 * do not receive 3v3 supply at all, but vpcie3v3-supply
+	 * must be specified.
+	 */
+	vpcie3v3-supply = <&vcc_1v8_pcie>;
+	status = "okay";
+};
+
+&pinctrl {
+	gmac0 {
+		gmac0_rst_n: gmac0-rst-n {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	gmac1 {
+		gmac1_rst_n: gmac1-rst-n {
+			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	pci {
+		pcie_pwren_h: pcie-pwren-h {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie30_pwren_h: pcie30-pwren-h {
+			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pciex4_perst_n: pciex4-perst-n { /* pcie3x4 reset */
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb_hub_rst_n: usb-hub-rst-n {
+			rockchip,pins = <3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&saradc {
+	vref-supply = <&vcca_1v8_s0>;
+	status = "okay";
+};
+
+/* eMMC */
+&sdhci {
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sd;
+	no-sdio;
+	non-removable;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	status = "okay";
+};
+
+&spi2 {
+	assigned-clock-rates = <200000000>;
+	assigned-clocks = <&cru CLK_SPI2>;
+	num-cs = <1>;
+	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@0 {
+		compatible = "rockchip,rk806";
+		reg = <0x0>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>; /* PMIC_INT_L */
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		spi-max-frequency = <1000000>;
+		system-power-controller;
+		vcc1-supply = <&vcc4v0_sys>;
+		vcc2-supply = <&vcc4v0_sys>;
+		vcc3-supply = <&vcc4v0_sys>;
+		vcc4-supply = <&vcc4v0_sys>;
+		vcc5-supply = <&vcc4v0_sys>;
+		vcc6-supply = <&vcc4v0_sys>;
+		vcc7-supply = <&vcc4v0_sys>;
+		vcc8-supply = <&vcc4v0_sys>;
+		vcc9-supply = <&vcc4v0_sys>;
+		vcc10-supply = <&vcc4v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc4v0_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc4v0_sys>;
+
+		regulators {
+			vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
+				regulator-boot-on;
+				regulator-enable-ramp-delay = <400>;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-name = "vdd_gpu_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: vdd_cpu_lit_mem_s0: dcdc-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-name = "vdd_cpu_lit_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_log_s0: dcdc-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <800000>;
+				regulator-name = "vdd_log_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_vdenc_s0: vdd_vdenc_mem_s0: dcdc-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-name = "vdd_vdenc_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd_ddr_s0";
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vdd2_ddr_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_2v0_pldo_s3: dcdc-reg7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2000000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-name = "vdd_2v0_pldo_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vddq_ddr_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg10 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcca_1v8_s0: pldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca_1v8_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s0: pldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vdda_1v2_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcca_3v3_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_sd_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pldo6_s3: pldo-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pldo6_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s3";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdda_ddr_pll_s0: nldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdda_ddr_pll_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			hdmi_vdda0v85_s0: nldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <837500>;
+				regulator-max-microvolt = <837500>;
+				regulator-name = "hdmi_vdda0v85_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v85_s0: nldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdda_0v85_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v75_s0: nldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m0_xfer>;
+	status = "okay";
+};
+
+&usb_host1_xhci {
+	dr_mode = "host";
+	pinctrl-0 = <&usb_hub_rst_n>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	usb20_hub1: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+		peer-hub = <&usb30_hub1>;
+		reset-gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>; /* USB_HUB_RST_N */
+		vdd-supply = <&vcc_3v3_s3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb20_hub2: hub@4 {
+			compatible = "usb5e3,610";
+			reg = <4>;
+			peer-hub = <&usb30_hub2>;
+			vdd-supply = <&vcc_3v3_s3>;
+		};
+	};
+
+	usb30_hub1: hub@2 {
+		compatible = "usb5e3,620";
+		reg = <2>;
+		peer-hub = <&usb20_hub1>;
+		vdd-supply = <&vcc_3v3_s3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb30_hub2: hub@4 {
+			compatible = "usb5e3,620";
+			reg = <4>;
+			peer-hub = <&usb20_hub2>;
+			vdd-supply = <&vcc_3v3_s3>;
+		};
+	};
+};
+
+&usbdp_phy1 {
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
-- 
2.53.0

