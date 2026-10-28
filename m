Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201831;
	b=2MsTS254ed3ihBJD6T54HYNNmuoskhB1h33BI/SqXE0T+OdB63MRXtdhXbrX0I5jEwUe
	 nwICkQfaapy0DkGPdyHBDFoXSYxCa7i67z9eQ0X5CcofP9+BG3JKyqLdcDWd6MN+dF3d3
	 BxzGSGGVish0USiVU1QlV2/hIR7hUBQfiH5e38DAxJKlZwLLYA3YgFFZHn3P6GkQlRQ2s
	 D3ppQ7ZISCdjaZsgYEGpYL+r/2iDef9TpVdXNPtDaKoA+uhIbdy2PupcIpdmQ5Wl7D4dd
	 ZRd7R2A9kIm2mAG4NL9GbLfxiPdqJKJEq+AkvwpTOKyCW+fA3PD3qSlFX3q0k0vbWsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=I16DQdy1VOVFDjvuWwKEez1vFW63gYQh2CVkwH7X+QY=;
	b=FmKfVmrzwtdu226VFPVLOQBgxhIV7nZHcDqw+zSISnh08dhvPq+0Ha343RbzWwQMmVXH
	 uugccY6uyjGfcyoLi0ddhOTQTedEaY6w9FngandwmR0IF4Ha94H79mSQvQKZIwRH8rKJV
	 Jt5EbjPZJSbAWNa0wr35umdQWFKeR5Y9FQuhzOfstG667tsTgGcda2ssP70Pmn98C1p+i
	 RY5bZL6iYyVgH86wTdge/n2EmVj4E8zgHZxJsasK/zow6Nqi1OceUs/Lph497U3FMvEhV
	 VL31libDpIom7bAy4eVxVmPu8Bayu/uwmxbZDFUaLSeJwrc4oyS1pOvf38N+A2oIOyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nK/pIe0n";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B28606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B28606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nK/pIe0n
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11731555e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201828; x=1793806628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I16DQdy1VOVFDjvuWwKEez1vFW63gYQh2CVkwH7X+QY=;
        b=nK/pIe0ngKCTRN/P1vJMMYdC0biISm21apL8jvlyy9pwKohheWIn0VP19j9NaYf9VB
         aaZighpNrdbOYCFbqpgnbqGvf6UFH5RUZ+ELVZzGky9IXVnL3dmD3WfriJ/bwaM3WJxn
         Xl/mF+2oOwYJgBIhhwSvt0mgLyrXPeiMOtFB/JTqQxNcroTlRIYmOTGdglhjzolFs4pk
         2bPuhD4sezlbufFtuyV/1oZ0n8qdrhqCRszW24TsEl12LeD1l9QYDBT0C6k4I6JoZEGC
         atIVdwUswECGGlxuVgQFbWzQZCHYhNASNDa5DX4Soyw1WFYeSTo+Yij2BT3yf/HBDv33
         ZMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201828; x=1793806628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I16DQdy1VOVFDjvuWwKEez1vFW63gYQh2CVkwH7X+QY=;
        b=NJxB7YtGVSp4cwZ2PHs5Ad2Z/csJIN/WO/FcCBnuw+aKo1uZeylIznuaEzE1rzZXs/
         RcUCDi35c+CDfvq+NQPeNDxDyZ7AylfKmHWYJJpfp58Pj+1BiruKqixAiBNJZJjcWuLK
         Ha3KtZ0NYSXtwPfbimOCEC8yL719v2CrpHuhrXAWAuDnYgP2+5l8RcbO7IIcVCdXGdlA
         HciB6fyh3qDxVq2qd1J/j7Wve+Dfoi4Li5wtso4z6tHiylfwRNCunj/p1CHymp7nrNbR
         pl/T/7X7BDA3VbB5aExnEM5bWnCRvGsKSpKEyvHrGwSkNtHBnnober0cqoDi6fkW0FjN
         H+iQ==
X-Gm-Message-State: AFq9FYLyQ71UqtII5IJigbDPsogd8ZpJbt27BTcAsD4zw6icQokE3GOK
	VsfJkrbF0ahq8oVTlPOF85P7/mqcBkYYSZmX6EhgRFh3PGj/+gDxrinC
X-Gm-Gg: AYBFou2k0LZRSzOhEGxnN6TbyhVKV0zwddoZs9v/NSF9nxXR+VolrV7kJVXiovn+lLy
	YElf1pMvRIMvWncXLKGfsPWrBxm9zsniJID1iwG4juiXTHgVGjwaOUXUVWr8bjs1mWPHJcnCA0f
	tOyUXLifH0JUN1h0CllWel2xv8w99JxezXuCU8T92avEKZTywFeqJPyqkzl4TKVUK7Q0YWIEhcu
	v2IG42XIu34nduPtj7Apo/BjYQeJF4T/i08jTw/HWvo8L2ktVWi93thXp/9Vye+jZM9PcN/hyVv
	GLLvxxtydTcMAmsATCCUqAcRTk+uSH3PysDPYPkg6x4jEDmswmOXo8DCNaYXyxT6dnMPbd5txZJ
	dn/5ZYGfPsmbVhH9qqfEdmBE1HjEt1I2YIXOGaMoJ09DHeMb/3NGfOsJCEgjqfC/WgDrH4fI/sM
	DUoACWDvKF3YhuhCqhmfPy1F4y06xWJ4aM2eS4F1opJIGG8ne2EcFeknohEgqDdhXt1iu+HnBzE
	XHyFh7wCq8Xj/H7JZmmK6I5sehEq4aY1Q2agtmoZ4qb6PSCnxD5F+eZTiXMVHHDv2AIQZX0VlL6
	OFCP8bz4fVVsZTdd0zIkPTozfGcGNal7ULZkx3GNy68QkcrTSBt5XMuSRHt/ZsDg+I6D3U73AEf
	0+j2TXkfGWaWc0xrQdTmhGIcY1k0kkvbXYB8lFM9NKiD4BNOYDo61IIdf8oQXo5sVvoioMblUZD
	nQVPnD/mlVWPJjs84=
X-Received: by 2002:a05:600c:5397:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4a967babdb6mr57832025e9.31.1793201828288;
        Wed, 28 Oct 2026 08:37:08 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm35488335e9.2.2026.10.28.08.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:37:07 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v4] powerpc/dts: Add Device Tree for WatchGuard Firebox T30
Date: Wed, 28 Oct 2026 11:37:02 -0400
Message-ID: <20261028153702.4287-1-lefteris.koutrakis@gmail.com>
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

Add initial support for the WatchGuard Firebox T30 board based on the
PowerPC architecture, updating the fsl Makefile and adding the new DTS
file.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 arch/powerpc/boot/dts/fsl/Makefile        |   1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts | 378 ++++++++++++++++++++++
 2 files changed, 379 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts
---

v4:
- Removed duplicate firebox-t30.dtb entry from fsl/Makefile.
- Fixed invalid TPM compatible string to "atmel,at97sc3204t".
- Dropped redundant SoC properties and malformed interrupts in sdhc/spi0.
- Removed unsupported properties (rx/tx internal delays, gpio-controller).
- Wrapped commit message to 75 columns and added Signed-off-by.

diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index d2cc8e1f0..ebbf301e1 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -3,6 +3,7 @@
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
 
 # MPC85xx platforms
+dtb-$(CONFIG_MPC85xx_RDB) += firebox-t30.dtb
 dtb-$(CONFIG_BSC9131_RDB) += bsc9131rdb.dtb
 dtb-$(CONFIG_BSC9132_QDS) += bsc9132qds.dtb
 dtb-$(CONFIG_C293_PCIE) += c293pcie.dtb
diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
new file mode 100644
index 000000000..318430a57
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+
+		spi0: spi@7000 {
+
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
+
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

