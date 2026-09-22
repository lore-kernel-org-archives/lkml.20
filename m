Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41EB544D44
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080661; cv=none; b=qZEFPiSxBm8Z2YIgIBXbFJKFEE/SyIXgj+wwA7fPmxj7zToS82/FjodEK0rAGEe8py2f8QBJ+cdFZ35zeEfGH8vFUFIBKUg1/l/I2uKRj0B5mdi0+LJDcXRcjJmn0KF/Jk9MEl7tUi3EYKre99suKKNKo1e9GuouPcTttptEgnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080661; c=relaxed/simple;
	bh=PrM8pp9pqa3kAa/lLlxnGnh0it0M1I0jBihLWySwtmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXhCcZoxpST4SdoLVY4hue/tLVaOTRjxftlud5URqcYbI4j7A8AhdHrzXj2shyS6Kh46MyrEzwHYHx11ogDC4Bwp81N1B7T9iGHZzGdYR59yCjCCrwd8xcKXpfiRmDPAPF8GwvSR5i67V9/FQHupv1JrhgB2rsQXRB7ZrWqDMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdukucQ/; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdukucQ/"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a0so4448284b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080652; x=1790685452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7irEIIBgzty36UKE5fbvUb/seFCiEiq/bxnIonis9JA=;
        b=kdukucQ/WE5jcc2MuYkyRspuJ9s/f0TkiC3yypw4n2+QnZFLQSWIE+7A6IEpuJpkNJ
         IOhWHmUul2fNj+H8Srfv5JCUB76zQDd1g+8GOWAKiKtcSuXCr4bY637GV1WZkn74nvNQ
         eqEDoDekaESB1CmM1lZ1/FoecKZQxWAGQoMYCSsDhe+wBWpkWvjEkkop8dMuIRsrqbqu
         g+Z6Ecbe4Y5+HuIAQEPE2rvw0uGxq0tDM4oqsSG9V05v5PyvLBYG2DYJUKKf8/xSOko4
         3nEW3TLAjVXfJvGVDt6dbW5F4FWNFj1ESvTkoCmFqf0Pc6e6gWov4Ns2uuC5z/SV+MJR
         IO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080652; x=1790685452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7irEIIBgzty36UKE5fbvUb/seFCiEiq/bxnIonis9JA=;
        b=Z5NFtvDmX/QxLsKrzfX0+WzpbQt/wbwf104GsBeNaInv38NMChz2tU4Wz9k5UplG2d
         NDqmazLzNQ/jqdSbW3y8lcS9MHD1VyFDP9YmMo0f/UVTVNghKBhoSAtCx8GW3iudKDfZ
         DewHDYlyp01DZvd/IHLg8VLaUPQOinhd7pw74TRp5AI+9N1z4r1/TB2hB1/fHst+xrRz
         Gpgj0mvRCqO8NWufXAMIlaEZJQEtdh+B6ZcC5OjwdnxIA0sFwCyER9y80FQEk8DyqAad
         64rulXmKAJgc8tqz0p/6Kdop8NZOBNGQH5JdCGYc8KuXfR4EZW7jbVyk6fXpKU2vkL6D
         4bGA==
X-Forwarded-Encrypted: i=1; AKwUvBzvlLjDkvgU6wB1NEUssS015tWr8g9f/1kwlKmjEHH7jXvCO/uOTB7udc6ORVYbIIgRU8CeSNFxqQtHPxs=@vger.kernel.org
X-Gm-Message-State: AFuF++kc0m2L8VTRyrQm09jZrPpyj390p3H+wKIJWoC6DDIqctmcSiuU
	SlkCVIlMx6v1sEaJHdNCk1EOLmyyyGOKj+Phter13J8BefRes9L8xUeK
X-Gm-Gg: AYBFou3Bb2mRLd7X0315WYtCcEEe/zyYl4b8BfHvLfG5U1ek0zxWhjjnVa017L2DdLn
	W+w4tG+URP1BRW1FPWMXHej+94InlAiD3M4jtPZfG4/2X1DQ2GOOFcOP5RhRzvvI8UkIOWo7vOf
	bVWg+dIsgbJPbIFBLwT2y7Ds9LNiHVHQwC0S8iFvVpSVV8tWJ5yFPOi1IRz90HEyRAZ8xIglmWr
	tC9bVSsQ4wrjTPd1zhoUS2wG8jxs6TzszT0bvzaRKW5ctDk6jYxiLRjZuBIYCpiK2egPNXtGSF7
	sqyXHBbYcVBLEHLYlJyUpVPz6rx0oENY2jXqY2EnAzSx5IMQDJeZs9pbAMPcDVKdlC/WjDFAgBE
	/mC2BBfpFZHQbkKVpRQJmgMe4mP7q0GvY+hjoLmkQRiillmDLE2MyP2A1A96FP21Mh6f78Yf29q
	5fL8MqzHolOS2OX/Qil2zK64CWFq6cLBcyGix64/GhZhqLFxP6/qmUFECqO95gO8ILZ6nVbV+yG
	pT68ZCGKZ2zrYXrWuAOozT9UKk=
X-Received: by 2002:a05:6a20:e290:b0:3dd:a196:9076 with SMTP id adf61e73a8af0-3ddec87d5f9mr1250509637.64.1790080651785;
        Tue, 22 Sep 2026 05:37:31 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm6453922eec.18.2026.09.22.05.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:37:31 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	andrew@lunn.ch,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v7 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 22 Sep 2026 18:05:00 +0530
Message-ID: <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART console,
GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
connected to an RTL8211F Ethernet PHY.

Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.

Configure MAC0 to use the RTL8211F in RGMII-ID mode.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6b68671f9379..b109491d5c8f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000000..a4e384588a54
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+	model = "ASRock Rack B650D4U BMC";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gfx_memory: framebuffer {
+			compatible = "shared-dma-pool";
+			alignment = <0x01000000>;
+			reusable;
+			size = <0x01000000>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+
+		status = "okay";
+
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&gfx {
+	memory-region = <&gfx_memory>;
+
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+		/* A0-A7 */	"","","","","","","","",
+		/* B0-B7 */	"","","","","","","","",
+		/* C0-C7 */	"","","","","","","","",
+		/* D0-D7 */	"","","","","","","","",
+		/* E0-E7 */	"","","","","","","","",
+		/* F0-F7 */	"","","","","","","","",
+		/* G0-G7 */	"","","","","","","","",
+		/* H0-H7 */	"","","","","","","","",
+		/* I0-I7 */	"","","","","","","","",
+		/* J0-J7 */	"","","","","","","","",
+		/* K0-K7 */	"","","","","","","","",
+		/* L0-L7 */	"","","","","","","","",
+		/* M0-M7 */	"","","","","","","","",
+		/* N0-N7 */	"","","","","","","","",
+		/* O0-O7 */	"","","","","","","","",
+		/* P0-P7 */	"button-reset-n","control-reset-n",
+		"button-power-n","control-power-n",
+		"button-nmi-n","control-nmi-n",
+		"","",
+		/* Q0-Q7 */	"","","","","","","","",
+		/* R0-R7 */	"","","","","","","","",
+		/* S0-S7 */	"","","","","","","","",
+		/* T0-T7 */	"","","","","","","","",
+		/* U0-U7 */	"","","","","","","","",
+		/* V0-V7 */	"","","","","","","","",
+		/* W0-W7 */	"","","","","","","","",
+		/* X0-X7 */	"","","","","","","","",
+		/* Y0-Y7 */	"","","","","","","","",
+		/* Z0-Z7 */	"","","","","","","","";
+};
+
+&i2c7 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+		pagesize = <16>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
+		};
+	};
+};
+
+&mac0 {
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
-- 
2.47.3

