Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793273272;
	b=UjrkP0f5RbxExk8aq6pqhmb/P3Ej5/QId/Vi7jvFOYS8iOlk2Hu/fEdmI4rESTiAQgrN
	 Sjj/cuL3/MrjS85S2sYt4ldMpsGeQcXUT2PE/DOvq4Cq2Hk+OK6czzw6DABApLlev71B1
	 nnd+4l1s+/8kNTO/cvkSQ3nRAqwKynW5W8BdMmnxhiCTryr8uJ8j3imDSiFH8dLAaYvOQ
	 eAB0xUx0gB34lZ9cKsH2sbjIokse4n54OF/Tr9y52fqkj8YUlyQrngDHPlNbbojliygId
	 bHefgZtyEyOjzfeZq9vgNoaAUkqBBADRApSB/wQJ/oLzHzznYPg4XAn6s/RbM+k5SEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=risrBQtG8qA+1se5uHVK1FVnhNZdOgvrDeWq26wHG48=;
	b=rbIBpvz5ec2Zn0dgqByVbip0AaESN5G1/56Yck0jRPcVosskBCIqnyjzKd8yUVKqa0y1
	 jqd/ZmTeNs7NVXG+cTiPLW9FbRoYnP31BQnOmoZUmT9vjJPZr8h45a6Ej9wZcxD9QpgxP
	 sbx4GxKxVxHe2iVQA4CxY2Y0XWndo8lbE+wWly2iMdjuiRo6azqHeQr8Q2L9jPKEBjmcW
	 Z4jk1PQqVyiFLHmvZAUJMcyWYGCiBK7VDXmKbkqvqb2qBW9czC58J6m/hc13SwbQdbDE9
	 QoWd8n7/iswSQiffGjOjXvhL6T72tvH/aWhK8R76GAKdbmz68DXz9JfLABb0nXaaGtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M/at3/6P";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAF3606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AAF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M/at3/6P
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so16660935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793273270; x=1793878070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=risrBQtG8qA+1se5uHVK1FVnhNZdOgvrDeWq26wHG48=;
        b=M/at3/6PpkWBvMlWU6rsZo/hFRpEVaNhsnSrH2XzqbpYC8GemmY7F/BJbi/TvDD71z
         7mI5as9vrkOmQ7JIyFdgnlJLPqyvDZky0Mpblnywt3vlQXKJcvhxUAyh+9MiZLDsPE9v
         40eq1H86kWVc256fL7VuDZNmBAxNTqaS9yUVh/3fvabwer36rQXAWh+WREfpG4o8W/MZ
         s1LeGsTCLZtuYG+tkPKh9hjt3vLmq9h556jwRttMK69gw1BbA4Bskkc+IkLdvPyHU34b
         MiVXfHLgz8INEVbEy8aGXRQ8Zj8586vf5viJY4XPyiGGbM/Eqw53BrAmniJaauX+pBQW
         EqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273270; x=1793878070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=risrBQtG8qA+1se5uHVK1FVnhNZdOgvrDeWq26wHG48=;
        b=iUa6ftPHTQ6mZ2P1/PYkChqOX/CxVKzUWp4y9XlbPJ3B+txktNh1D+6KrSdUE7cp0R
         Ldb19hkJZccO3TzATmKJzk9YvZnmoOozEqVKy0BC/c6+FPk8qfbfSoPj7JzP3AOHbnPK
         Y2jXHRIerwskl1pZAt0phfwE3DBHAAZOTcuzQXf+R/R+Y/WUGdok0kJ2ol4E1cgbo5Vc
         rKYDd8S/KYRB8vdYE7Hyngq0bv3w0yP2+pGtU/6hBx65Tb23Q9wiI2lhMor1arBe7fUH
         u77jPOkm/wm41GLnhL5zKCqTBoMRvQHjF9m7/nDH8bPejtVxicEvfRX18u1TtCYHPiMV
         syfQ==
X-Forwarded-Encrypted: i=1; AKwUvByZEDC9E6nxjZd7et43LNfgk61GyN9tkdXAtRgD7NsK//sJgN3RDv0p3I6tHhOld0CIvHlSe1k8R/XoeG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7UydebYZb0aNxhSnySdxYUOd4Np0PYBm482QZdvpXgMF5ikJc
	oPi05RFOoZtxiyc2F5x4IaZeGAgd93OQLG7ZreUXIb2xDfmE+n+Pg5bj
X-Gm-Gg: AYBFou3XR1LfbaJ3w9c/B2cbiwcrza8a594D6+s67MunOjHJXQiIVUC47WdcqkZapM/
	D74PyQXSeIvxobfwy9dBKhTDDCCYYgtzLhAb21bU1tp4zSXENsLCj9lH4+mgUv7GZEvPH0qqX/n
	tUjynwFyrfYFwBnIxhvg7ccVaw7cXVrBOjE9L0tpvNQ1PR61otVXUaejYetNlmIVw4Nxg3kK2mh
	zvxxK6lqOWTuM+LaMnN73YEhNr6R2eQP55sjK8i/W//qPwBYzpDoTrGtbhhfrWohiQiwFtczig3
	S+w0ojpew1b1HeqAgi0+nwmxDC5epGv23C+ivBcIbZkjgh/ZYd/3y/kkd+zFqhrKbm9DC/PGLjw
	kpX9kaguWbnzljPVUgsGwUFl+bhUy/lL/rqnqIgMAR+oxnnEPQ0ScsSVJDojrle5dMxb55pgBfL
	wEA/lKfNQkfZqdxPuKfq/4qUjkXDdeY7xemn1+ia90RMfaBG7EAmMjf6GfVR9Zyk+Ioh1itgHCx
	8I5Cv5gLAfHFQeH79v1cNv9UqX7p6HPRZmek//GW1Uxtc/A+Bj80b0VOIA24TRcrVWgKblU1L38
	6LPWmBOFzXPzSfqCsGxkqvX0hTr5ZeKrC3a0oTAA1Ht/WX3UGROHS3ttrEPs4a9Hw9INbZZw2hJ
	/yybBgnVe8CVuT5HgHKXUOygh62xnLRMf54J0XzcTCRc0uB4YSqtQSxfdHQt+0ntJSeJipjUelF
	EZrSs3aK+JPF/qsZg=
X-Received: by 2002:a05:600c:3b24:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a966e2b4damr109547985e9.25.1793273270398;
        Thu, 29 Oct 2026 04:27:50 -0700 (PDT)
Received: from kali (adsl-101.109.242.200.tellas.gr. [109.242.200.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm69571215e9.9.2026.10.29.04.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:27:49 -0700 (PDT)
From: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
To: krzk@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	sashiko-bot@kernel.org,
	Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Subject: [PATCH v2] powerpc: dts: Add support for WatchGuard Firebox T30
Date: Thu, 29 Oct 2026 07:27:41 -0400
Message-ID: <20261029112742.10238-1-lefteris.koutrakis@gmail.com>
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

Add initial device tree support for the WatchGuard Firebox T30 board.
Enable building firebox-t30.dtb under CONFIG_MPC85xx_RDB in the
arch/powerpc/boot/dts/fsl/Makefile. Document the watchguard vendor
prefix in vendor-prefixes.yaml.

Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
---
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/powerpc/boot/dts/fsl/Makefile            |   1 +
 arch/powerpc/boot/dts/fsl/firebox-t30.dts     | 386 ++++++++++++++++++
 3 files changed, 389 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/firebox-t30.dts

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..75fe4bcbe5f9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -2017,3 +2017,5 @@ patternProperties:
 additionalProperties: false
 
 ...
+  "watchguard,":
+    description: WatchGuard Technologies, Inc.
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

