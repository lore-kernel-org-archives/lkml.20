Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30D3F0761
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922599; cv=none; b=aKSLClHQpgGT6C4RbDw/zvH+W3EqtxQnbNtasDPrC/6dO3jes4Ykue8PtlSbyiIt4Kx9lMj4eOmJdU233NVnTNUHN+YP+we+gYSDM9LRaMJbn9upaAQ6ObmXLtzyQciE295+zUGh78Yc85ZSxKNnZeQIW1KteYyhuCkSNA9OcR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922599; c=relaxed/simple;
	bh=fs03FTxoiCFzu6tSmR1uYskIVcBOfsaVEJ0gUt1gWgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TijV14rCij8Mwgz1iG5jQhznJht57jtSX8uFnSZua3xkEJEAp9fNCTBjyQ1/YCnAPuvPo0gqKMkiqnOK1SOKjoVJZReEIo/BFQtS+xKkXKJiyJyzaAmzbuu+kBCrfIfTqTOSKghhc3gLMLTkWJZC9uuzhcG95vbLsG83FTu6+Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnXSWMh3; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnXSWMh3"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b590a5b5eso4218779eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922597; x=1791527397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dStcbhY+rumd3OvNKAll20rKoWFwQ08aAwWyl88q55Y=;
        b=rnXSWMh3zxiMsLu7AZXfz3e8L0S0JIg8W+PXdRSpBD3dNpA7ugIs0I6rAPWs0HpXoO
         RpeGJs2QqEKOCpSsS9t5bYhSqX/XsYJRu6KwMTitsFuJJO10HXd9si5Wac8SltSPlEOn
         wsujsLN/Y/X7BUOi8TLgxuktf164updnpkOj89VDbhp60Hr5PE6sJ6Pp/53dVjQPKI7h
         U5BsFBmGmofWQmGFDXOh6MbyfEJ0bqIQ3URfRkUA2BBaTHkNr6i3Vxj4h9fsmfBwild2
         hRFcToqiuw5ZXPC4BNQ2/5ZOTavWwSXqZ2m0L5m6PLrrrd+NlUGSDgWckffZaIoJAsAy
         qm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922597; x=1791527397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dStcbhY+rumd3OvNKAll20rKoWFwQ08aAwWyl88q55Y=;
        b=WX/gKqkgvO6gttxdZ0pM2lddxB0Xd5F85BKbZYVQrWDHPxw0dnFGwX3utRz8Xioi0P
         f032kf6PH8FfKtQ+hP9419OtKV59KexdWr1bIjUii+8xFjJ1oSgPCTXSmKU+jiqF0Q0U
         eck9dZIXIzr8tc3aDr2YhXdcti+zAIaB4terDZ7ViStCGAkypAOitPmnVcGeDLBKKiNH
         vOUUOZCHbcfolBB7a0mfr5qIeN0pJAu7gC07gSKkSaWUNHd3Va5gJYReAJ4DZ5kHAja8
         pX57HOcIqG+oNKQN32tVJbXxhrlZQKihbVcEb2nDxNzCPJwpM/SDt6LiRtpdrLQ5oeWw
         W78g==
X-Gm-Message-State: AFuF++nzUTp/71k3wrNDLbyxltiEeL6Lh2/MLhIy/jqraBV1q234QRSs
	JtevlbA56D5c5hGvwc9vewENNqcuQP2kuR/W5AzL0ZMlSDISOJSMBJ7p
X-Gm-Gg: AYBFou0nXw8WwMXznKf9z4vKMg/CuHAbVf1ttMvGLAqhax1Go2KytQh9uIeTRkYsL3U
	n+Wv7sUmdfNmAUCFgRJe1UgCu8oPfrATlG7krl3CBNDiY2uT5SvCcxThb4DywENTxX2ktE8Lt/k
	P+OyLT/Yp+R5vFTIUuTGDXq0lXWPAhu8ZBxYNE2tu0CENcEQ4bDq8/N0N2jamjQzMRPYMFGuPq9
	c4Mju+f0RL4DXKp9EpzZkPHK86hY4bp1ILNT7n6M+ex0/udTbQVqxTZK8JeCuUL/Y4/JwHmqtpX
	n7RdiLYb/54ZZEzLD/FVzIpbnc2+LrDeUQo1ORqQMdND92kMdpRO1lESJv5905seP0nTno2ZORc
	wLunWAT6oPWunPZyD1/sbRH+Jl3zIe/rkaxMZg74HD9CmDWYU+lx8SWlkkJRfqNSl/IFTvFLmXh
	IV4OYj0w1bN7UUZfO2D0cP6xu+P3QA0sPmGeeAI6Ju6gJgemqr3qBrsIKs5PcTFAbPt0B0HhIgx
	vCg5Xxy7Q7cM0pd
X-Received: by 2002:a05:701b:291c:b0:143:298e:45a1 with SMTP id a92af1059eb24-14f5c7e2290mr1802049c88.40.1790922596939;
        Thu, 01 Oct 2026 23:29:56 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6236636c88.4.2026.10.01.23.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:29:56 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v8 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Fri,  2 Oct 2026 11:59:33 +0530
Message-ID: <20261002062933.26497-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
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

