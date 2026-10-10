Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C621C4AF9F6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637258; cv=none; b=cV3WJtSXu8q7y4Xa1ox8rHEpojEOhgdmoWpHqVvrKRnFm0oor2UD9qLGX6Q0A/pA0O8mpGmdgaOxi9xLVSwYx3Emb0d+UrrpGHlf4/+lseeJHZttSpCFS81/b+hcsBlXYC+u8nSmfPciq0oRIw+MeuF9x6iZLNLx4pIWHYTL2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637258; c=relaxed/simple;
	bh=j9QWKUEHGDyQilUsxyQXyk/OT9N+hsL23NiBCTAt+TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvuO3MtHr1rEhHxROzCZ1romnzMF94heGzqE8KPbW74utaY9zUAgR90rq4cbpZ7hn4s+J3AouSaxRlhZ2wOLli6NM7wqwuLFM2gcS0z/GGqkJ/2efPYkQiaVhIQGvRfy3nWSsvDQxuBy+X7ouhEtQa/ag++xNIqYHDosKYB/pK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STJ5oUQk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STJ5oUQk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48bbb06e746so311197f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637253; x=1792242053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNXkjtT0L04RQGi6cXZiM9YcMBazDC5BVW3nyU4mKv4=;
        b=STJ5oUQk8XDSyzfIRK2CpXJNJ58iUf6kCmg0O4rhIH9wR6Ayaph3I2KKOgXSvC/P0X
         lUIeuJ/ItMC3Ej4DSL2rdCQi+np1zEk/CEtMDf/VgXUxkaalw9fC354PdrxJEZPddpmb
         1ZDQot/OjT2huRq6k7ZROmtRH4GsP4dc0IAX1gV3u5yhZtguPm3uQ8k8DlYYyP2AF1MA
         QZz7GuJgFOq4mUuanN2kf/v+BIeymOL6OSKCuB8Ff5mi/Kco2VRv0B8mlagzPe4o0kbd
         jRv/+hmvlgidSUUzcVLCJ0yAwTltJDxqDXAakoO6fltrWva+RMtUJf0HzKzzr044sW+p
         PS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637253; x=1792242053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNXkjtT0L04RQGi6cXZiM9YcMBazDC5BVW3nyU4mKv4=;
        b=uySa2ggJ8ZI+pi16LfPYx+cc9qA/dbFjVpyBGCh1lWI7O4p8ZyPU8ZEJT986AKsdAf
         kBIhADS8PdvG5pXt0hP+26Zr7BRWpvAotaYn7dKpGs4oEGfoFPFht8gcb6bQhLvU7qKc
         1UbZbM/YPHA1zK265S7eEQMkzZY7PWjR+zfRC1ULM97mJphDBZzcQ+rzVtEHp52FFT+P
         W9jyIT/j3vmq7hPLLyNXdukuCx5jD/9GEmL38N4lpJ+P8H2F7D3j3xP6HJqdzKru/cj8
         bzuZ68zW9YvLHF9aZgIadYdLrfd9iViAv/G6JFt9FuWsfgRnYU13qQL0JjjwUMNU7W9i
         /ndw==
X-Forwarded-Encrypted: i=1; AKwUvBwcKWlk0PWvVm5KpDO/rjNJe3mjvnMRL9KA9+I8jidfaxFflGjwBz3cCdxowqPcgS7mz/0oUfhccCOydqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4rtpCgoos/WbpqCZ6isGeNn/NgxB9f5FyNSSkAH/5IVf373Za
	yNaCA3vKpJsB8R2vqgz7iXHt193SFLaqzbvHEIFIRkR1kCDyxiO8WjqenQG1Mnx2IpI1GQ==
X-Gm-Gg: AYBFou2NRczkW05bbQbsaVAFUIEdFRYJZCwi9ShvdfXmFYO0b0lnVd3IDbUdjIn2ahl
	3cc26goQWJH9pzwc1X7Qa32V06n3+2REjFSWE1dEcxkSWnWr1ZeR5htXd93M20vwjYCL1jYfhUO
	TuPTVMgWl97xeSBW23fUxbQvcmBGILxmcQvf04sa9VfkDHjQCJQu+eqouJSeIEt+hvs6+FJQ8NM
	sr4yFi9MOi64UjEgfGHPEv0EzJ8StIj4vLrxGuHyGXobgwvO3DME8oHpqn+lAlDS5j0+U6tF7JS
	sTerpDSldBvvkdKExbBgsccifHy8ZLh+dvyWw7AXRL8FzI8xCX4Z6pQLqJV9VDdHSBzjuQpyGaG
	z8cdNlOieJGQwGv1FBZkFanVGiyWvPbARCBFE9z2WeLoEBwGtLB1k/mNVGR0QiMkRpya8JpXek/
	ElXUKi6ojvBA5rpw8ktKMxIRf+stmyzAejIxy1GlVibVQIA/+OlT3gjq6B7P82beUq3Z515mVQm
	ZOmZYUc4Enb1v70IxFGOnHecEp45mq38TvGeq+3fMxiAEzOUVNxDCrluteQxh+tcPBbVao4D5Wy
	Qbgok3iKwfd1KckahsZQOPfcO/fZpg1NK/0xJQ27cg9P7c8bs8cXLkVidyqoWw==
X-Received: by 2002:a05:600c:818d:b0:4a1:6c79:fd31 with SMTP id 5b1f17b1804b1-4a18e483231mr84377575e9.12.1791637252496;
        Sat, 10 Oct 2026 06:00:52 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:51 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Sat, 10 Oct 2026 14:00:02 +0100
Message-ID: <20261010130024.177503-25-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the board ports, Wi-Fi links, USB, LEDs, buttons and generic SPI
NAND. Keep the stock firmware slot intact and UBI above both bootloader-
visible headers.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/boot/dts/zte/Makefile                |   2 +
 .../boot/dts/zte/zx279128s-zte-zxhn-h3600.dts | 361 ++++++++++++++++++
 2 files changed, 363 insertions(+)
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
index 0000000000..96d09f0296
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts
@@ -0,0 +1,361 @@
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
+			function = LED_FUNCTION_WLAN_2GHZ;
+			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led_broadband: led-broadband {
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
+	phy10: ethernet-phy@10 {
+		reg = <10>;
+	};
+
+	phy11: ethernet-phy@11 {
+		reg = <11>;
+	};
+
+	phy12: ethernet-phy@12 {
+		reg = <12>;
+	};
+
+	phy13: ethernet-phy@13 {
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

