Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511982;
	b=W/ydc/AwuZQQiJ41S+vUDYlvY2hUoSYBLX0pv4KwkxacaKW+vNQSHiqa6E2LtN3lohbK
	 qc78xDyH9nZHvuQh2N9OgUTCmiC8OpibrQ1f5OpxytbQC4Oy8XHFa8I2Uc6Z28duzHD9G
	 OW8SNIt3Ob0v0rVkff/bm7c1T45R576bd0YlntbmDFLVq/n7Xa4o4kL1+SM4fP4B3ZPry
	 eMCTGIgdDMG6lYY4xNW+BWzCFmO/yO13qAYFm9DXYPveXBePYQNHnb5Xt9I3lepE+/MpA
	 ecTjJoXJjvl9b2P/sYUzr0XOVZC22i1V269YUntbhfmbJdPWw8mcJ8R2wQQeXvddZdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I1+vR9QxfCce51TW0jo5Fo/3ZflfP0wWJngCGR19FuU=;
	b=tcekeEmPO3//1fLYwo6hj7WYThYk4AWpTlxct/bp2n6IMkOnrn6Y+LRb21cyoyhIhErD
	 mX3weedOaQrpfzSmH8eJN17qr+o0o00dT2CV9L3UBNK71LI0FPEm84A8FIgE+IDg77LET
	 TzQ3F3PzXDBh7cFISWALFAirZplusaxmYN9YXnmxg8yKbjYWMNrrJB64JlelCXHZKLkkS
	 qKssmPc2ntwEmMc5uZ1vKUpFMHt2kcYKTrDVP9mcf5zLEF/qBwCn1FEciZsqujaF5RPHJ
	 0Y1DUhXN5/zGg+ZfagyqA6j3InZ2zXKO7mwXd5WRPrpF7WSt3XqkvI+y5cqXLCPpYOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E70eTPU2;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A78606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A78606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E70eTPU2
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3712b6d9843so249753eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511980; x=1795116780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1+vR9QxfCce51TW0jo5Fo/3ZflfP0wWJngCGR19FuU=;
        b=E70eTPU2nlLkfa6nXlOF2XdhHalwudnshzE3mu9MAGe3GnwTFJZzm5ut7w/jyI/pH+
         a9i3JCpQl+IES2gcMhtifXNO/iDtdnUxDooSZn1reETzONRQCSFHIM/EZCi+pE7TaAkN
         J13aRXCHjRdd/hCk06PNZeS+A+JXJa+8vm354UHhr0kVb3jcGWEzZm5Zv33moW+9A+w+
         TWP/dcnmGezMAfgCVWrGuoIiA49pjy926w8igWy/mo6mVbFMMrma7K92H36MT44AQ8iO
         r9SsscmaIyJzR6pMiiuV0Rvqa/1dR37cnYo4y9o2KSoBnEyyI9s25bAGMuA5KUJ8+KlQ
         kqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511980; x=1795116780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1+vR9QxfCce51TW0jo5Fo/3ZflfP0wWJngCGR19FuU=;
        b=XlaFt/QX/6nbh0bTwyxSWJ90mdse+2h3pQpiAy32vCYUd9jsSkfPlf6jHidv799TWP
         dvyIbectMZh5aTJ9OlfrDs9KaNV4EOSJ/0QGhFx4OweL1/KeocErhEDLhhWE78KNVIxw
         EUyg0HlVyoCOBFNxihUYtxxnf9OxsM37XLCSAcvNWJGNKzz8IIbRZWuLWd6x59zFzJpC
         j3TX2q+zibNtHkiN0o8PzTtMzQeW7URT6oi1JW3OBTYni4psiHQiME6O9x0lpcKyM+H7
         Ex6ORrEK3oBBC4oJDjWFv1JAgcNL2gWU8cLzH0DfF1v4k6QnzEVIuFKmEp0P4UK9LsYz
         O+EQ==
X-Forwarded-Encrypted: i=1; AL+hErG8c2RAuUXSan8qo8euXeAHE82enNxa9PbQXV68z/C5OQgANjj4pY9Z8Ui01PgfBzSt/6LQPQ7+5Dlu2G0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q95Xbi8aPy0PEKEMV6AqIzKU266QyWHbhXjfTEu4222eIezy8
	axJtndqL3bntLNJXDESfBS/3pkp/tDDaXy58xu2M57ukzxFZ8EM+AtSU
X-Gm-Gg: AYBFou0yZeKSR3rnVPUxVHbUuP0RA4cIaGOt5vUHGcUhbeD8oYR4T5uZ71d9cTvSCU2
	qc7MxxJWAIgAg4df+t5ubZ0ok+uheyKv8o9EiEL4tj5OKy2loJFMXe7j3xfZUUlqLT42avR8cxn
	Ns6NIBFKh7WN5OjCTaoEcOsP00Ph6N8vW3YTDLB+Z6SQA1AgdDN/EJ7cwM3dc/QyNMsVYx9cJ1c
	xVtuS0J0md661MNvIbjedguJW0TFofaP68EJnqwExHi/9Yk8oCKGcEGlu6k52gqZB2LCeXVvIQa
	UEMllHvfhOyfpHwZ3EG8Hoo4fDRqtn4Ib2oFgVmLlFuycDulSnAIfMiugOMRwpvAWhBBjNoesUu
	SxWPzMe7G76XPh9aTuBGLdX/G/smQa0unxqLkYY2laiLMEG3S/vTG/XPjHXo9I2AZ/M4tAKvC9Z
	qgnqtCr4JmV6bAX9RRyToNlSVoEgRZ7mOskLzwoys5Otkf5yriBtXvafyJFgD+OZwNnMMzdHEgz
	YAawiYpHCFPNsDV4kN5UHkXuCTSvpmn85u+b1IsMCd8lAX4SQZafT45u7eyV8Gw5ZXt8U1icmuF
	22n9t/5HD7Tx5EH69c2qSBiup06yKQ0lXnYHtTlDROplOppFiw==
X-Received: by 2002:a05:7301:713:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-379684ae563mr104749eec.36.1794511978886;
        Thu, 12 Nov 2026 11:32:58 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm565379eec.14.2026.11.12.11.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:32:58 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Fri, 13 Nov 2026 03:32:45 +0800
Message-ID: <20261112193245.250149-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112193245.250149-1-cyan2254650260@gmail.com>
References: <20261112193245.250149-1-cyan2254650260@gmail.com>
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

Add devicetree support for the ALINX AX7Z020B development board.
The board is built around the ALINX AC7Z020 system on module with a
Zynq-7000 (XC7Z020-2CLG400I) SoC, 1 GB DDR3 SDRAM and 32 MB QSPI
flash, and provides Gigabit Ethernet (JLSemi JL2121 PHY), USB 2.0
host, MicroSD slot, dual CAN buses (SN65HVD232 transceivers on
MIO 10-13), I2C RTC/EEPROM/LM75 and the serial console on UART1.
DevCFG FPGA manager is also enabled.

The two SMA AD inputs and the spare differential pair are wired to
XADC aux channels VAUX1, VAUX9 and VAUX12. The XADC hard macro is
always accessible from the PS, so expose these channels via the
driver's xlnx,channels property.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  71 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 146 ++++++++++++++++++
 3 files changed, 218 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

diff --git a/arch/arm/boot/dts/xilinx/Makefile b/arch/arm/boot/dts/xilinx/Makefile
index 9233e539b1..5c4bcd9492 100644
--- a/arch/arm/boot/dts/xilinx/Makefile
+++ b/arch/arm/boot/dts/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQ) += \
+	zynq-alinx-ax7z020b.dtb \
 	zynq-cc108.dtb \
 	zynq-ebaz4205.dtb \
 	zynq-microzed.dtb \
diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
new file mode 100644
index 0000000000..d60e58657b
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DTS for ALINX AC7Z020 System on Module
+ *
+ * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
+ */
+
+#include "zynq-7000.dtsi"
+
+/ {
+	compatible = "alinx,ac7z020", "xlnx,zynq-7000";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+
+	pmu@f8891000 {
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
+&devcfg {
+	status = "okay";
+};
+
+&qspi {
+	bootph-all;
+	num-cs = <1>;
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x00000000 0x00500000>;
+				label = "boot";
+			};
+
+			partition@500000 {
+				reg = <0x00500000 0x00020000>;
+				label = "bootenv";
+			};
+
+			partition@520000 {
+				reg = <0x00520000 0x00a80000>;
+				label = "image";
+			};
+
+			partition@fa0000 {
+				reg = <0x00fa0000 0x01060000>;
+				label = "spare";
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
new file mode 100644
index 0000000000..f232371a51
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DTS for ALINX AX7Z020B Development Board
+ *
+ * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
+ */
+
+/dts-v1/;
+#include "zynq-alinx-ac7z020.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "ALINX AX7Z020B Development Board";
+	compatible = "alinx,ax7z020b", "alinx,ac7z020", "xlnx,zynq-7000";
+
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+		serial1 = &uart0;
+		mmc0 = &sdhci0;
+		spi0 = &qspi;
+		i2c0 = &i2c0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	usb_phy0: phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+		reset-gpios = <&gpio0 46 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&adc {
+	xlnx,channels {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* AD1: XADC_AD1P/N, E17/D18 */
+		channel@2 {
+			reg = <2>;
+		};
+
+		/* AD9: XADC_AD9P/N, E18/E19 */
+		channel@a {
+			reg = <10>;
+		};
+
+		/* Spare pair: XADC_AD12P/N, F19/F20 */
+		channel@d {
+			reg = <13>;
+		};
+	};
+};
+
+&can0 {
+	status = "okay";
+};
+
+&can1 {
+	status = "okay";
+};
+
+&gem0 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet_phy: ethernet-phy@1 {
+			reg = <1>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_ACTIVITY;
+					default-state = "keep";
+				};
+			};
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1338";
+		reg = <0x68>;
+	};
+};
+
+&sdhci0 {
+	bootph-all;
+	disable-wp;
+
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	bootph-all;
+
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+	usb-phy = <&usb_phy0>;
+
+	status = "okay";
+};
-- 
2.56.0

