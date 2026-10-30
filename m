Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364647;
	b=R+RQS0fFhYw+iEdQZAbWNKcAq06hdrWd57p6hFoAx43AumjlAFkfRuwSj3VCOD3ZhM1/
	 BBSmuwIBiQHhuAJYiK2S9NwALmI94VNm5VDK39hMsdxqzayROUZtMPIMmZ/QtmlfjUg11
	 He9+A3TwSm0GS4xe58zINQin5JupQ8hU2MgV2QDFdrPD+ZnuHldP5zVzA2lglGsV2C71F
	 T79/Iws9PdPZxtUdKpSmCR7rnZQzyf6DT4zG4hrEWP9pLlJB4+F7ilec20rPIh4Cadohd
	 E4LIP0gG5g6Khl5o1Guc2nqDLO9WtZD5YW2ZO+NlVTHRY++3JTeXsplLAnhTAUQS3Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Olu1HZtBUL1umhLjTK2ztuieF0PyP+Vx+Ejrhr2YE+M=;
	b=0p8XN/NY/xK3diKfGYZBl4DpG+T1MNFWfmvAFIQmmwZ2hB0BYN6v0zzVatu1JfWTkW4h
	 tfge88uBDOLvJ6vZqSFQFm63fitV+oto77kXdcSA7qqNrjYuhJd7WAypVpAEnSkEYbl47
	 /d3pCIPsKYDnxxDoT1k85suwvBRgcMgFBE/vUlw9YFXwpOCCXee20yxgF/VJibGK2wB+j
	 QGdjzXQQV1OnB5guN6xXrm52+2eUYLXezlcWxBE0Ar+Q+XVwdOTfZXldznjtTtwzrTBSg
	 b/9Hk3b+RD0tYFv7YBZH0KF6qEN/T9RToWTD8YsbUmByjvdwS8tF0n7ZxB9JWOB0Y0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydGuuH5a;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779E160A2606
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779E160A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ydGuuH5a
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so7026695e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793364646; x=1793969446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Olu1HZtBUL1umhLjTK2ztuieF0PyP+Vx+Ejrhr2YE+M=;
        b=ydGuuH5anKyX+oSYeH8vauVXZchJQaLYqgcXU3bmrFsVJ8tPXZEO7j4S0qLVlPUzA8
         iDflBHLRiBeFZuj9Mlq4zrg5mHEk0Ddx4gQafrh0iuc6Zbe2HKsOszel60CFE5H+H8f6
         8QKO9sGo1ECCYMtUHnnll/bT71t7EkSdQgv8zrbvHOO4jmtZEw6e5XyIcYQTxsI2UhMe
         5kE3/W8bWElhzK+2ZFjzcRBeAo1GCPghM8jXcuaOjC57aVX7bmZZHXzigIw1n/L86Pxe
         ZW8zF866KKQ0J+zgEGiCuoEcNKhZSEvx+oG4aXqK9nNLNxEmVn0NNgzw/dhhh6y0V8zI
         Veiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364646; x=1793969446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Olu1HZtBUL1umhLjTK2ztuieF0PyP+Vx+Ejrhr2YE+M=;
        b=Q3jGP+WA1DHijQK9dXlWvGjZXoKeZOqVAvPqb9ncua2l9XCJSHsyAH19piPKvMD68e
         t+BjkeDKgeJ7vpAVSW9hxKnX7N0LO2dd0Spujbsi6rODXZ3pdM9cnP6RzS2X1CNiHCyh
         PSEK8Rnnk+F25Avwe85zvqGV9IoqGfr/RFGtuqjh67Zw3OrkvSd84ObFxr0RWldHrzLL
         W+oyaobUAD46j2O9AHsODBYJZUnCUEk4yRrZ/eo6qLbJgspRHF0nrhSbddO0X4c36W4t
         a/l6wuJ7jyvbEfBgiMk5Q5NnUYdRzI0xn6la/DWR+j05WVYuW+hzXBeHeyfuqycJBmen
         lzjw==
X-Forwarded-Encrypted: i=1; AKwUvByU4Z9aaU7E0o7d9bLTvdhmBEfzlfQRK/fM/N7ggbK0E1I/foyvZcLvd7Wqmwl89EsvPZ6zdjN6d/NborE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcDxFzmCcGrOnAGI6z7jseojpE63x3qLSqPchW/abn2CBh6E/j
	m380NeGOrSIaLdbb4jVpunZNCPP5LlriFoZllWokLxgN+D2srNtb3q/9
X-Gm-Gg: AYBFou0t95Pdcz5b3YmD6G7TbZIjXycOXt0u6tO4XFj8KwVrQcJqmxu3uBGIHPRd5J/
	7j9nwNe6TH6O3AQHzI4Q1TOjD1a2/5V+ybVHVYpVq6AWE9LXJTVN/vzEelvQGjSxJPw9RfXu3IH
	CYEdO34m//zsFTK9JnYG6LUMjDFxkqz8A+3/Fl1uT57yzAbHmKOFwlW8TUqUurJOApSASG9/ZPE
	Z1fWadxcC8fzqeVrSWnNWiFlNGuMbE0ZCUATiOwVtwcHOJmkBkwJ2wr6zDQVrOIU8W0q6cGIGkh
	ZmGOnQ5VlEgVukAfXp5hdXDfA2tjfOH4dhg9b4FY7tt9/nyWkXJ30qCQoUF1pCjKmXhqql8uyaR
	a1Th2ggTYd9lgBLWIQ6xHc6t7d41D1Ddh39n0KP/Zce0GZHrxj+udxtvKEDb4+FuAaDyxYRTaFs
	g82TZDVFQYwoBJZG3VBNHOvj/E6ZOwIU9c3Ha+Z3ypnAn00iIYdfzvs4HHKW+H+br2rDu48K/K7
	jmBp7XGLUfaAyUkSARAYVMJdNOvgpriU7Lo7VEiDhQfWXIXvjlB1+tlAxY6LPXXQTXBBoh2+aSE
	BKa6o+xrrFHXx6D9Ok4qmZHZHX9TIrx6J/13+GbZ0YKqVor8PxXJonGqH3+ckJrtksEZB157sHl
	u1xBJa8UMp0tehQ+7SYoZuxCHzFeoETlwtGfFWl3nyi7GGjljLxuwwl0ESWFmeY68c4ZXTUo1an
	cAKDkP2oi5sSxYZdU=
X-Received: by 2002:a05:600c:198c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ac151a9a36mr51395525e9.4.1793364645815;
        Fri, 30 Oct 2026 05:50:45 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm93079855e9.3.2026.10.30.05.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:50:45 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	maddy@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v9 2/2] powerpc: dts: fsl: Add support for WatchGuard Firebox T30
Date: Fri, 30 Oct 2026 08:50:21 -0400
Message-ID: <20261030125024.612396-2-lefteris.koutrakis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030125024.612396-1-lefteris.koutrakis@gmail.com>
References: <20261030125024.612396-1-lefteris.koutrakis@gmail.com>
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

Add initial device tree support for the WatchGuard Firebox T30 board
and enable building firebox-t30.dtb under CONFIG_MPC85xx_RDB in
arch/powerpc/boot/dts/fsl/Makefile.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 arch/powerpc/boot/dts/fsl/Makefile        |   1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts | 386 ++++++++++++++++++++++
 2 files changed, 387 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts

diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index d2cc8e1f007e..8b5d0ac0ebad 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -44,3 +44,4 @@ dtb-$(CONFIG_GEF_SBC310) += gef_sbc310.dtb
 dtb-$(CONFIG_GEF_SBC610) += gef_sbc610.dtb
 dtb-$(CONFIG_GEF_PPC9A) += gef_ppc9a.dtb
 dtb-$(CONFIG_MVME7100) += mvme7100.dtb
+dtb-$(CONFIG_MPC85xx_RDB) += firebox-t30.dtb
diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
new file mode 100644
index 000000000000..ec6cf911c66f
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree for WatchGuard Firebox T30
+ * Author: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/include/ "p1020si-pre.dtsi"
+
+/ {
+	model = "Watchguard Firebox T30";
+	compatible = "watchguard,firebox-t30", "fsl,P1020RDB";
+
+	memory {
+		device_type = "memory";
+	};
+
+	cpus {
+		/delete-node/ PowerPC,P1020@1;
+	};
+
+	lbc: localbus@ffe05000 {
+		reg = <0 0xffe05000 0 0x1000>;
+		ranges = <0x0 0x0 0x0 0xefc00000 0x400000>;
+
+		nor@0 {
+			compatible = "cfi-flash";
+			reg = <0x0 0x0 0x400000>;
+			bank-width = <2>;
+			device-width = <1>;
+
+			partitions {
+				compatible = "fixed-partitions";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				partition@0 {
+					reg = <0x0 0x20000>;
+					label = "nor-cfg0";
+
+					nvmem-layout {
+						compatible = "fixed-layout";
+						#address-cells = <1>;
+						#size-cells = <1>;
+
+						macaddr_nor_cfg0_1830: mac-address@1830 {
+							compatible = "mac-base";
+							reg = <0x1830 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_1844: mac-address@1844 {
+							compatible = "mac-base";
+							reg = <0x1844 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_1858: mac-address@1858 {
+							compatible = "mac-base";
+							reg = <0x1858 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_186c: mac-address@186c {
+							compatible = "mac-base";
+							reg = <0x186c 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_1880: mac-address@1880 {
+							compatible = "mac-base";
+							reg = <0x1880 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+
+						macaddr_nor_cfg0_1894: mac-address@1894 {
+							compatible = "mac-base";
+							reg = <0x1894 0x11>;
+							#nvmem-cell-cells = <1>;
+						};
+					};
+				};
+
+				partition@20000 {
+					reg = <0x20000 0x10000>;
+					label = "nor-cfg1";
+				};
+
+				partition@30000 {
+					reg = <0x30000 0x20000>;
+					label = "nor-mfg";
+				};
+
+				partition@50000 {
+					reg = <0x50000 0xc0000>;
+					label = "nor-bootopt";
+				};
+
+				partition@110000 {
+					reg = <0x110000 0xc0000>;
+					label = "nor-extra1";
+				};
+
+				partition@1d0000 {
+					reg = <0x1d0000 0xc0000>;
+					label = "nor-extra2";
+				};
+
+				partition@290000 {
+					reg = <0x290000 0xe0000>;
+					label = "nor-backup";
+				};
+
+				partition@370000 {
+					reg = <0x370000 0x10000>;
+					label = "nor-ubootenv";
+				};
+
+				partition@380000 {
+					reg = <0x380000 0x80000>;
+					label = "nor-uboot";
+				};
+			};
+		};
+	};
+
+	soc: soc@ffe00000 {
+		ranges = <0x0 0x0 0xffe00000 0x100000>;
+
+		gpio0: gpio-controller@fc00 {
+			#gpio-cells = <2>;
+			compatible = "fsl,pq3-gpio";
+			reg = <0xfc00 0x100>;
+			interrupts = <47 0x2 0 0>;
+			gpio-controller;
+		};
+
+		i2c@3000 {
+			rtc@30 {
+				compatible = "sii,s35390a";
+				reg = <0x30>;
+			};
+		};
+
+		i2c@3100 {
+			tpm@29 {
+				compatible = "atmel,at97sc3204t";
+				reg = <0x29>;
+			};
+		};
+
+		spi0: spi@7000 {
+			flash@0 {
+				compatible = "everspin,mr25h256", "jedec,spi-nor";
+				reg = <0>;
+				spi-max-frequency = <40000000>;
+				m25p,fast-read;
+
+				partitions {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					partition@0 {
+						reg = <0x0 0x8000>;
+						label = "spi_mtd_0";
+					};
+				};
+			};
+
+			slic@1 {
+				compatible = "zarlink,le88266";
+				reg = <1>;
+				spi-max-frequency = <500000>;
+			};
+		};
+
+		usb@22000 {
+			phy_type = "ulpi";
+			dr_mode = "host";
+		};
+
+		mdio@24000 {
+			switch0: switch@10 {
+				compatible = "marvell,mv88e6085";
+				reg = <0x10>;
+
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					switch0phy0: ethernet-phy@0 {
+						reg = <0>;
+					};
+
+					switch0phy1: ethernet-phy@1 {
+						reg = <1>;
+					};
+
+					switch0phy2: ethernet-phy@2 {
+						reg = <2>;
+					};
+
+					switch0phy3: ethernet-phy@3 {
+						reg = <3>;
+					};
+
+					switch0phy4: ethernet-phy@4 {
+						reg = <4>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						label = "wan";
+						phy-handle = <&switch0phy0>;
+						nvmem-cells = <&macaddr_nor_cfg0_1830 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@1 {
+						reg = <1>;
+						label = "lan1";
+						phy-handle = <&switch0phy1>;
+						nvmem-cells = <&macaddr_nor_cfg0_1844 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@2 {
+						reg = <2>;
+						label = "lan2";
+						phy-handle = <&switch0phy2>;
+						nvmem-cells = <&macaddr_nor_cfg0_1858 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@3 {
+						reg = <3>;
+						label = "lan3";
+						phy-handle = <&switch0phy3>;
+						nvmem-cells = <&macaddr_nor_cfg0_186c 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@4 {
+						reg = <4>;
+						label = "lan4";
+						phy-handle = <&switch0phy4>;
+						nvmem-cells = <&macaddr_nor_cfg0_1880 0>;
+						nvmem-cell-names = "mac-address";
+					};
+
+					port@6 {
+						reg = <6>;
+						label = "cpu";
+						ethernet = <&enet0>;
+						phy-mode = "rgmii-id";
+
+						fixed-link {
+							speed = <1000>;
+							full-duplex;
+						};
+					};
+				};
+			};
+		};
+
+		mdio@25000 {
+			status = "disabled";
+		};
+
+		mdio@26000 {
+			status = "disabled";
+		};
+
+		enet0: ethernet@b0000 {
+			phy-connection-type = "rgmii-id";
+			nvmem-cells = <&macaddr_nor_cfg0_1830 0>;
+			nvmem-cell-names = "mac-address";
+
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+
+		enet1: ethernet@b1000 {
+			status = "disabled";
+		};
+
+		enet2: ethernet@b2000 {
+			status = "disabled";
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led0: led-0 {
+			gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_ORANGE>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led1: led-1 {
+			gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+		};
+
+		led2: led-2 {
+			gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
+		};
+
+		led3: led-3 {
+			gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN_5GHZ;
+			default-state = "keep";
+		};
+
+		led4: led-4 {
+			gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_ORANGE>;
+			function = LED_FUNCTION_WLAN_2GHZ;
+			default-state = "keep";
+		};
+
+		led5: led-5 {
+			gpios = <&gpio0 7 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_POWER;
+			default-state = "on";
+		};
+	};
+
+	pci0: pcie@ffe09000 {
+		reg = <0 0xffe09000 0 0x1000>;
+		ranges = <0x2000000 0x0 0xa0000000 0 0xa0000000 0x0 0x20000000
+			  0x1000000 0x0 0x00000000 0 0xffc10000 0x0 0x10000>;
+		status = "disabled";
+
+		pcie@0 {
+			ranges = <0x2000000 0x0 0xa0000000
+				  0x2000000 0x0 0xa0000000
+				  0x0 0x20000000
+
+				  0x1000000 0x0 0x0
+				  0x1000000 0x0 0x0
+				  0x0 0x100000>;
+		};
+	};
+
+	pci1: pcie@ffe0a000 {
+		reg = <0 0xffe0a000 0 0x1000>;
+		ranges = <0x2000000 0x0 0x80000000 0 0x80000000 0x0 0x20000000
+			  0x1000000 0x0 0x00000000 0 0xffc00000 0x0 0x10000>;
+
+		pcie@0 {
+			ranges = <0x2000000 0x0 0x80000000
+				  0x2000000 0x0 0x80000000
+				  0x0 0x20000000
+
+				  0x1000000 0x0 0x0
+				  0x1000000 0x0 0x0
+				  0x0 0x100000>;
+
+			ath10k: wifi@0,0 {
+				reg = <0x0000 0 0 0 0>;
+				nvmem-cells = <&macaddr_nor_cfg0_1894 0>;
+				nvmem-cell-names = "mac-address";
+			};
+		};
+	};
+};
+
+/include/ "p1020si-post.dtsi"
-- 
2.53.0

