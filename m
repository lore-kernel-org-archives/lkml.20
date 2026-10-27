Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072979;
	b=j3Jrpwns+ERdNil458i1OYIoYBbyOMIM41eqIwqJFXGMQNiuxThZUoGglttRrvO0LMWz
	 rU3ERD3auYK4SXT4Wd0fGucrC6I0AJvB5GTehkSYidmkijTfG1fktVo9fxIsolQZYEowM
	 jjU3WAfSuOqa3Eg7GF8b51zGQuG1L7vzsGJOUahtANunyaXWH/XC3Lrsy8Vs1dzGyK7tM
	 Frqi+B+d1+LNLJ0Xhtd/zJkS0cE/xQ7XBLcw31De0Iwvenh3gMDSwoz16KDrfl+yPUss+
	 y2VNfJQM11PRlAqdAxcBnOmIc9asLDQ4V64SBpA2rEvpF097D4wr4we9PYbXF5sQFag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
	b=Z0cBPOGoQcg0GoA079vEsmC5+mriGHOzgZ7Zf4niUIg4uyxvZUVO0EhOOb7wWT6TLR3L
	 GkrlzLNhqjtOsMhsdTK0vVBSa9Eqav/22IPspdhj8JwtVkNvbFB+9h+nl4R2wKJxwjRW1
	 JTs+tgcB0kD+4z7NVeUYJuBuYDZbgxEHSg8h+bxxUSG8OWbhEq81cFztsrg4UTjNjr0Y6
	 dgUnIL6mrwFzgDZKaX1FNOcehRG6NJzNd7sTUjM/3TXqnAV8nZInNv7vmRmdPdMyh7Edd
	 xkZL3M7Ur09FT4xQQAr1PdJ592EZ43OGMsk94T0zD+pCyvy9wXb68jhV2eNF+V8bZIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R9zqUsot;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8995606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8995606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R9zqUsot
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-185fd3a4ca3so3166033c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072978; x=1793677778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
        b=R9zqUsot1/CtmT57G/TVnh6derzSzSReMVWeJiJ3mux/Q0vdlL5dHJb5+tJGe0TixO
         5US1XUv26gM2Fdv5TBPbySP8eGPJ2juba7xUvM/Qgj/gXI23VVPuq0HMpeyi2GSO1Gpd
         A/vx/xos/NiNtO3bescC98W6NseXk4R2RRRqZwLuSHnJS1L43FMPobhoq1NOyTBAZsn/
         0NPKRKZloZtNm6YxE0SiTJrL7KNYV17/SNToM0XZdf3lhvAeOirT2Vuzl8g+pqMjXi8D
         JEjcA46QPdJdsOnr6BmHAl2PDamVP0mWNLM4Pkrj95jja9df17VBKFbUrsnTACKxguOe
         QwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072978; x=1793677778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
        b=cD/XSbo5MpYBWb4inP8igczAGV2AiyB1GW1y4ERE+sIKx7UX8wWv9WWgxk+BdWVGO+
         RZY4d4M7oOfu2kyEgfGC6Z4YIvKZxUD/+Kg+HdoPnXqX6XCPjohTKGjIpnZ09fdfoY9f
         Ikp8doBVIFS5SuIbNAVhIe4A3gMJEql30fFucpOC9qBHOOAuDIzAFwLxE9iG7tRdmXZC
         mxE34+ZE15I6P2Jt7k3i76zrV8lAYWbcOuJ5EEf3qcfHpa17mbmpTzPpmeuaA3JUEQj8
         tzkgyuxvaivOleUiBcqaxqJGF1vw7luFvLJDrK5OcSAopy7AXFwKs+tRBDkmISNr7muj
         nLJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLvZd1e4evGWum4V0oszqYF1TmI1G66iwC7CKzQ3GwlkWHkeqo6hRuj+o34m/xxoQTKMABQjGZGJiZ+N4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBq3898w624ejPbeYlXlzWAgvho6zGEzNTEur3wEo9l8cVQZjf
	tWkQ1Uw5rQ4ZCgtbvCx3M4Yhn/lBQQ3btiFXJaH9jPYmXd+41QcCblx/
X-Gm-Gg: AYBFou2P0Aa23tAC205Q3cImhyJmndGDA06+DrE27UmeS7d678YPNHCQu2nh88O7VIJ
	ZFw81v8ANrNezsSPiF+twRXzjs+RnQn0W61pwToSG80m7l+h6j9DRASjb+qCodQ9zEbr/1Xuyjl
	k4YobLOfmSi5XwNeySV4JDDYQAoN57YQUJ9kawd34luqvznX0sM1aumTb2dG8xWcM0S8H2++WJQ
	EF9yOCwZQDc/XOw8ihHqZJEr78Lh5d83ILQGwpZBoyCdaHonaJyakE/4nUTT/nnfdriF5kFwPOD
	gbi4tEG/6PHUXpd2Q8xsfNjEGuceMNn8y3cOOc7BIkZVVmrVP93SAjFopg5tJCnh2LdVmLk1Som
	WdarROjEHK+pA3RN6xeRgln7h5cSU7t9jjWDBXzOhzK21LWfekA8QKHgFE31cEZTyimotUr/hsR
	hMzo2tPCP9kRL7XKtw7fEscyqjGKiDGpsErqzjyjEeOQs6Qut3hDOC//sng5emBszu6hFXkWpdt
	v1uN5yMKjwIFUFB4QnKRN7vA9mrRvNd56QGaiRvuONy6gFKBEAZHy2dswy1rKswDoMXEkztPnEj
	B+Ar9OqCcu/FORdZ
X-Received: by 2002:a05:7022:1407:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1a21a289389mr4067703c88.37.1793072977517;
        Mon, 26 Oct 2026 20:49:37 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:37 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 27 Oct 2026 09:19:11 +0530
Message-ID: <20261027034911.99482-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
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

Add the device tree for the ASRock Rack B650D4U BMC, based on the
ASPEED AST2600 SoC.

Describe memory, SPI NOR partitions, the UART console, GPIO line
names, framebuffer memory, and the EEPROM on I2C7. Use the EEPROM
as the NVMEM provider for the MAC0 address and configure MAC0 with
an RTL8211F PHY in RGMII-ID mode.

Enable both ADC engines with 2.5 V internal references and their
pin groups. Expose the sixteen channels through an IIO-to-hwmon
bridge for board voltage monitoring.

The DTB compiles with aspeed_g5_defconfig. Binding validation with
dtschema 2026.9 completes without diagnostics. Board validation
reports unmatched schemas for inherited AST2600 LHC and I3C-global
nodes, with no board-specific errors in the reported output.

ADC readings and recovery after BMC restart were tested using the
same ADC configuration in a locally patched OpenBMC image. That
image uses a different flash layout and separate power-control
changes; this complete upstream DTS has not been boot-tested.

Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 173 ++++++++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6874b621d..fcb94e62c 100644
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
index 000000000..630588dcb
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,173 @@
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
+		/* A0-A7 */     "", "", "", "", "", "", "", "",
+		/* B0-B7 */     "", "", "", "", "", "", "", "",
+		/* C0-C7 */     "", "", "", "", "", "", "", "",
+		/* D0-D7 */     "", "", "", "", "", "", "", "",
+		/* E0-E7 */     "", "", "", "", "", "", "", "",
+		/* F0-F7 */     "", "", "", "", "", "", "", "",
+		/* G0-G7 */     "", "", "", "", "", "", "", "",
+		/* H0-H7 */     "", "", "", "", "", "", "", "",
+		/* I0-I7 */     "", "", "", "", "", "", "", "",
+		/* J0-J7 */     "", "", "", "", "", "", "", "",
+		/* K0-K7 */     "", "", "", "", "", "", "", "",
+		/* L0-L7 */     "", "", "", "", "", "", "", "",
+		/* M0-M7 */     "", "", "", "", "", "", "", "",
+		/* N0-N7 */     "", "", "", "", "", "", "", "",
+		/* O0-O7 */     "", "", "", "", "", "", "", "",
+		/* P0-P7 */     "button-reset-n", "control-reset-n",
+		"button-power-n", "control-power-n",
+		"button-nmi-n", "control-nmi-n",
+		"", "",
+		/* Q0-Q7 */     "", "", "", "", "", "", "", "",
+		/* R0-R7 */     "", "", "", "", "", "", "", "",
+		/* S0-S7 */     "", "", "", "", "", "", "", "",
+		/* T0-T7 */     "", "", "", "", "", "", "", "",
+		/* U0-U7 */     "", "", "", "", "", "", "", "",
+		/* V0-V7 */     "", "", "", "", "", "", "", "",
+		/* W0-W7 */     "", "", "", "", "", "", "", "",
+		/* X0-X7 */     "", "", "", "", "", "", "", "",
+		/* Y0-Y7 */     "", "", "", "", "", "", "", "",
+		/* Z0-Z7 */     "", "", "", "", "", "", "", "";
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
+
+/ {
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+};
+
+&adc0 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default>,
+		    <&pinctrl_adc1_default>,
+		    <&pinctrl_adc2_default>,
+		    <&pinctrl_adc3_default>,
+		    <&pinctrl_adc4_default>,
+		    <&pinctrl_adc5_default>,
+		    <&pinctrl_adc6_default>,
+		    <&pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default>,
+		    <&pinctrl_adc9_default>,
+		    <&pinctrl_adc10_default>,
+		    <&pinctrl_adc11_default>,
+		    <&pinctrl_adc12_default>,
+		    <&pinctrl_adc13_default>,
+		    <&pinctrl_adc14_default>,
+		    <&pinctrl_adc15_default>;
+};
-- 
2.47.3

