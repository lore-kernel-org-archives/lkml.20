Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA94915B1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962609; cv=none; b=eoxuHDzC+YBDIjDU6TgBPSEcZP17bvYenwXadj2obWxAc0jYRzps56u4j/qidgC+H5/krcthEo3IA6hXay/BpCqwYvSHUMQZfBpi/PnaA3VOHQyO8NZm7lE46g/B+UtD9OOXFcqGLDZ/R9oj0DP97VAtQylfc/uBw99VYkqK7Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962609; c=relaxed/simple;
	bh=kp34iCmI4gYR2F2VaX9bwcbyxBQZXztbDcgJom4mmak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKBbjGMmbGZyQu6IdAi5BVnQD3Q7pR8Txel6bAgPyyO82jvQmgdkoDv5rQrXJgoXpuvledHnSiaG0upH1lPj2CEwlDcspo67uTN1K5qo064pQes87OqFXvu6DW+jtx0AfroPWJCnHUyq0+R4x4T2VEKkAdJNm7pWQ80a6jYoqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7WbdbV1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7WbdbV1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so6100675e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962600; x=1792567400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOB0hFLW8NAJjDWYePu7p10HP778mqXX1LJvbg4+2So=;
        b=O7WbdbV1PKJH9TuSu+rn/96eR5bGJyQUr4fqK/vy+igcSO6ZtSNB2lXxgSTl0BYc33
         TtDjJhj4OtmhOysvp9BOsM0jMSi/URICT7DCHcNctfP5c+x9ajjnFgfyE2rdI6allLf7
         k1G3/z62RhJYdE8Fovy53ELuew/y+0Ew1Aawas3V1y1QhEsD2Ia/3zifjr8Aqog/QUzl
         BOIcHnY0MBOhPzDj41p0I0gDH0tn9eNjtDWw+cgImFo84ccQtnEBbRIQeb8ov8Xriciu
         tqG8KqPfMZCl5jKeTKbM+LRmmJTa1I8rmGgDTD9YN7uPACgaSRqsiiio/cKGNOm28PRA
         oC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962600; x=1792567400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOB0hFLW8NAJjDWYePu7p10HP778mqXX1LJvbg4+2So=;
        b=PCIk6oCIsS5+fhLM55sdnXyYWY5ZHLtv5chsDQNadbJ9JXO+XD/YEd5dHeApsHIteC
         lCl7PVrsBAESd0ujfvPu0AxuCwV3FZlzM4JQMIDwzumxfYcvZNUmadlPaBQDA5Y3GXbQ
         LVxu3bOJREAyqQRm2FDD/RPrkM1vwzsaa/4A8yQU0yWfhYg6G+4vyXklZSJo8SgOw21V
         yBVK2P+2cJM2YuQWAcwbDJm+MGCp91ueIFXBqBmHX82JBSLqZTVC/mirC5GD7B+f63Nt
         8aVxq4Tq2Ing2OdCenO9DdNoVj/x3fT0CiT9NOy8mnfmlW6NgJP0ZoatZthlLZZgSBTl
         nKBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQDPh+OA6WPHpbCHTiINgRPtcGNdLl/ufTOoWvBlpVd5aOwANtL7tFJF/Ryifa43PkpVaIayj//USF/MU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9Lm0y7Mgfm2z9BY7ankU2oa5nB2M4WlxsDo7Rtlqh7N/94ZOU
	9LtP99ni8bCkGbucaGe95logcAXy/hMEooWr2hrBhv9qMf+GY03yZDXL
X-Gm-Gg: AYBFou12/lQh7hrLf5PKKAKGFFb5RRS5cwyDAdrpit2GzrP3jrYt4pvd+Yh0UdaGSyV
	71yRyb8DH2C2CyQ878YaCpoNLYol+o3t6dq0c9GTfzC4BdfeO6BIdb5WgVHyfhrHw6HaQp+w1Gs
	8+k55UBuC3Nt0+SRG3FR31ZdgtE/uujSXRHKXvq72Z2GQIjO7uw9M5U4iTmDQgHNkTcjw4mKhb+
	rO4/1YyZWg6e/8TE9eMTc4LiOMHAJqZDYH62NRQH3v9nukYaBrCTsS8YD+Jlf4a7UQfIIN6MqjY
	3tF7UI18CfmQm7a5PYDaCfU1YEZ9dm/6NeD1RgVTGPmXfeDBFF8bxcPaPlWm9+a9UwNhWMVtFON
	3FBtlGN29LgbGLBlDch7LnL9BRo29I3C03Phq4xGgSY4kzDOsSA9OlhSEN02Szk7uyOd7Efm/rU
	Na7KF3OERDjSEsQA+WeD3ep4IP5I/KLIX5CF9U51RM5oFD84ZarLPxigZYw3QZCuTQqlfIIW099
	aqqJjOG1Ewqp24fk7oaZD78HD/TuOe9gl7skPKxfwQGMe6hjrjQJ4nKhv4oufTrI5kEYRsiaC/m
	7IwhTx2T4P6igmH0AEd3S8kGu6674BMqB47RLMf+BuK+iXSPNWIQe8SMwNdIJkoyLG5aA2+3
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a18e4a5355mr364127835e9.10.1791962599738;
        Wed, 14 Oct 2026 00:23:19 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:19 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Wed, 14 Oct 2026 08:21:04 +0100
Message-ID: <20261014072109.1759502-25-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree for the ZTE ZXHN H3600 Wi-Fi 6 home gateway router.
Configure the internal Gigabit switch ports, external Sanechips ZX5201
WAN PHY, SPI NAND flash on the SPI controller, LEDs, buttons, and
MediaTek MT7915 Wi-Fi cards on PCIe ports 0 and 1.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/boot/dts/zte/Makefile                |   2 +
 .../boot/dts/zte/zx279128s-zte-zxhn-h3600.dts | 364 ++++++++++++++++++
 2 files changed, 366 insertions(+)
 create mode 100644 arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts

diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
index f052cfbd63..29cc864459 100644
--- a/arch/arm/boot/dts/zte/Makefile
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 dtb-$(CONFIG_SOC_ZX297520V3) += \
 	zx297520v3-dlink-dwr932m.dtb
+
+dtb-$(CONFIG_SOC_ZX279128S) += zx279128s-zte-zxhn-h3600.dtb
diff --git a/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts b/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts
new file mode 100644
index 0000000000..d46390f075
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * ZTE ZXHN H3600 (also sold as ZXHN H1600): home gateway with four LAN ports,
+ * a WAN port and an MT7915 Wi-Fi 6 chip on both PCIe controllers.
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+#include "zx279128s.dtsi"
+
+/ {
+	model = "ZTE ZXHN H3600";
+	compatible = "zte,zxhn-h3600", "zte,zx279128s";
+
+	aliases {
+		serial0 = &serial0;
+		serial1 = &serial1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/*
+		 * The stock kernel reserves the top 38 MiB for the packet
+		 * processor. Keep Linux, and in particular DMA buffers, out.
+		 */
+		pp@5da00000 {
+			reg = <0x5da00000 0x2600000>;
+			no-map;
+		};
+	};
+
+	/* All LEDs are active low. Colours only where seen on the panel. */
+	leds {
+		compatible = "gpio-leds";
+
+		/* One power LED with two elements: both on shows orange */
+		led_power_red: led-power-red {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led_power_green: led-power-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+		};
+
+		led_wlan_2g: led-wlan-2g {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN_2GHZ;
+			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led_broadband: led-broadband {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WAN;
+			gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
+		};
+
+		led_phone1: led-phone1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "phone";
+			function-enumerator = <1>;
+			gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
+		};
+
+		led_phone2: led-phone2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = "phone";
+			function-enumerator = <2>;
+			gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
+		};
+
+		led_wlan_5g: led-wlan-5g {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN_5GHZ;
+			gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+		};
+
+		led_usb: led-usb {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
+			gpios = <&gpio2 9 GPIO_ACTIVE_LOW>;
+		};
+
+		led_internet_red: led-internet-red {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_WAN_ONLINE;
+			gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+		};
+
+		led_internet_green: led-internet-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WAN_ONLINE;
+			gpios = <&gpio3 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led_wps: led-wps {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WPS;
+			gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	/* Polled: the GPIO driver does not support interrupts */
+	keys {
+		compatible = "gpio-keys-polled";
+		poll-interval = <50>;
+
+		key-reset {
+			label = "reset";
+			gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+			debounce-interval = <60>;
+		};
+
+		key-wps {
+			label = "wps";
+			gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WPS_BUTTON>;
+			debounce-interval = <60>;
+		};
+
+		key-wifi {
+			label = "rfkill";
+			gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RFKILL>;
+			debounce-interval = <60>;
+		};
+
+		key-led {
+			label = "led";
+			gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LIGHTS_TOGGLE>;
+			debounce-interval = <60>;
+		};
+	};
+};
+
+&gmac {
+	status = "okay";
+};
+
+&gmac_port0 {
+	label = "lan1";
+	phy-handle = <&phy10>;
+	phy-mode = "internal";
+	nvmem-cells = <&macaddr_tag_1e 0>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&gmac_port1 {
+	label = "lan2";
+	phy-handle = <&phy11>;
+	phy-mode = "internal";
+	nvmem-cells = <&macaddr_tag_1e 0>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&gmac_port2 {
+	label = "lan3";
+	phy-handle = <&phy12>;
+	phy-mode = "internal";
+	nvmem-cells = <&macaddr_tag_1e 0>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&gmac_port3 {
+	label = "lan4";
+	phy-handle = <&phy13>;
+	phy-mode = "internal";
+	nvmem-cells = <&macaddr_tag_1e 0>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&gmac_port4 {
+	label = "wan";
+	phy-handle = <&phy8>;
+	phy-mode = "gmii";
+	nvmem-cells = <&macaddr_tag_1e 1>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&mdio {
+	/* the ZX5201 WAN PHY */
+	pinctrl-names = "default";
+	pinctrl-0 = <&ext_phy_pins>;
+	status = "okay";
+
+	/* external Sanechips ZX5201; its SerDes answers on address 9 */
+	phy8: ethernet-phy@8 {
+		reg = <8>;
+	};
+
+	phy10: ethernet-phy@a {
+		reg = <10>;
+	};
+
+	phy11: ethernet-phy@b {
+		reg = <11>;
+	};
+
+	phy12: ethernet-phy@c {
+		reg = <12>;
+	};
+
+	phy13: ethernet-phy@d {
+		reg = <13>;
+	};
+};
+
+/* MT7915: main interface on pcie0, second interface (HIF2) on pcie1 */
+/*
+ * The two lines reset the whole MT7915, which is behind both controllers.
+ * Whichever controller starts first releases it.
+ */
+&pcie0 {
+	reset-gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
+	enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&pcie1 {
+	reset-gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
+	enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&spifc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bootloader";
+				reg = <0x0000000 0x0100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "tag";
+				reg = <0x0100000 0x0100000>;
+				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					/* the LAN ports' MAC; the WAN port uses the next one */
+					macaddr_tag_1e: macaddr@1e {
+						compatible = "mac-base";
+						reg = <0x1e 0x6>;
+						#nvmem-cell-cells = <1>;
+					};
+				};
+			};
+
+			partition@200000 {
+				label = "wifi";
+				reg = <0x0200000 0x0100000>;
+				read-only;
+			};
+
+			partition@300000 {
+				label = "usercfg";
+				reg = <0x0300000 0x0200000>;
+				read-only;
+			};
+
+			partition@500000 {
+				label = "defcfg";
+				reg = <0x0500000 0x0200000>;
+				read-only;
+			};
+
+			/*
+			 * Slot 0 of the boot loader, up to its slot 1 at
+			 * 0x2700000: it reads the kernel from the start, stepping
+			 * over bad blocks, and finds the slot header, which
+			 * holds the kernel's length and CRC. A rootfs length of 0
+			 * makes it check nothing else.
+			 */
+			partition@700000 {
+				label = "kernel";
+				reg = <0x0700000 0x0400000>;
+			};
+
+			partition@b00000 {
+				/* Erase old rootfs/UBI headers during migration. */
+				label = "slot0_gap";
+				reg = <0x0b00000 0x1b00000>;
+			};
+
+			partition@2600000 {
+				label = "trailer";
+				reg = <0x2600000 0x0100000>;
+			};
+
+			partition@2700000 {
+				label = "stock";
+				reg = <0x2700000 0x2000000>;
+				read-only;
+			};
+
+			/*
+			 * Keep slot 1 (0x2700000..0x4700000) intact. cspboot
+			 * mistakes UBI erase-counter headers for boot headers;
+			 * its scan must find both firmware headers before UBI.
+			 */
+			partition@4700000 {
+				label = "ubi";
+				reg = <0x4700000 0x3900000>;
+			};
+		};
+	};
+};
-- 
2.55.0

