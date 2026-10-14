Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143B83AFAF8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000234; cv=none; b=l1JKvb00A146x4go0udDCVeUkmohDv8umKhya5z3xbwxjHqBSGC/NvJhZ2Soz1/nk1CBJx5h59SiJ1KTdKbIEHmHkBOgji6lc285wgpPEM9SM96a2EabvINxt3CRCbsqJFQtYIL4dUJIfOh9WztmVdQpMciffB8vh8IVQMFhhYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000234; c=relaxed/simple;
	bh=kR933n8CDQ9fwFh6PwSbJrQSvXtoKLACtGEq0PzM0q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b3g714/HHLbZn1sSToTG2vgv5sUVsY8GMKpV1atudr/0rqLplKgwRYZwSjYVqpo53TQwhyQsCBeUEp8sM8E8ENqS7uoa5Ro1YaoZ8xU4bimoeCnS2hWziUkqX//7BWUGJpgIiU8E7NnmtTFUaGrRn8MlXZUY7SMlBTV2sbJ9Ucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmtDu/ic; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmtDu/ic"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso194511a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000232; x=1792605032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nujP9rgCHe8pVwsy2vxm07nZV8x4bv342qsfibZkYP0=;
        b=SmtDu/icqwpdEbZa6gjM/Isy6E0x/FnhLCuQzIXTupA+dUyPghvZ3HZkU7+w+iaddy
         MOGN9E2P/OmsYUmWFvqeIcwRGvGbWQOT8XvVGmkURn82iF06zPvIEEeNGFS+T/upFYen
         8MRmaa5BD+Mkn2URcM7YFJHRfzXYGtRAz2Kbm1Coycv/tJ+KqaLkrIGAuytAGWidKNUG
         7oFT1vVThwwT8a7XIQR0M0vz9DbvitVAzucpnpxlTJiGdJz3j9tXVf2PKR5eS0gyiRYW
         t+pUBGWefhZM/5ZWuCX2WxH8kqcnlwtsFuLeaKhiqNN5N/lXUyOHU/wvTtik5/QBXvxz
         ac9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000232; x=1792605032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nujP9rgCHe8pVwsy2vxm07nZV8x4bv342qsfibZkYP0=;
        b=ZmXgzCq4NQVsDzCxCXEFDaf14I6D4Q7f74KzgNgf6ugRi1AtR9lZPaguuXJMPH2X6k
         BVcnwF27gUpRgx2cAFll3AyBaW1zB1N6POlrNplsIqCGi79tO0hQ3EbmRucC90dWMSOa
         issGbIOahGZDIhm4hTy3q96Cd9k5W7BKbhksoc+z7loi4bvYqnrbif5z8IZAThFPVJ0U
         OKzfHWY5WJJYRx2P/DPXVVhk75A3o22RPWclB8wVSAXV26olNZbUxLD8a0U4wSPVrmXG
         L7R3oh147cbMyNm20Zxf4/VlJH5sAjLp8TflCJJDncagiutlvnbC17S0gmQ4YEHOABGZ
         7cRw==
X-Forwarded-Encrypted: i=1; AKwUvBxkPdJIucIcYBqnzrsCXdrHcjJTA1BoEUNMTHAZfOzfkmLJ06FdIOPN0WVCyUw+r6PRxO7Sx2oBA2dSf28=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/hXgkean264LtzbZrMux8roP+PCRWNgiGUZlyrqsXcianZPEI
	5hVTzJeUQlLeaiuIVqwGX9mvYp7xtGO/94u0xctfRfE4m2Nmq0rXYaYA
X-Gm-Gg: AYBFou1QiBkuirY1zHIF6gRAvDEASsbTPshR5SiT82Sft4Fb5p7T56B0NUBmCPZzPjU
	8TQBsqBqNV1gZhvXkVB01pz5ysiSu9d3n1XNcIVNBYdr1cp6LvVYD/IR8YAby4TEN9VzQFGUap+
	RTtswWdLBoiTj3iRB/NBfYa/4AYq4ppM2Ha0nffaIkDLi6+aWlsMml/JFJoNvk38AA0wfaGH7Eh
	+pVhilxEzsUUGAJU/JeGEdPuSsbulFa6rEeQ0YJPUTSNCatuVrxWKC+/lKunSLJKCX/4MNR2ABv
	52MAxV2In1MhQuMTx9wSvXN8mhJTErasNEDilQ7ci2UaIm2jwd1BQXGT9zINSuIAf4IZkWXbkyx
	l40mCk17nHgyPo3rrpnfdQd25g1rDqAwAlRQ7wz1AP8LKJShpBPCoUwEHrwOaA+kC5vgQQZnSmv
	JrWZuyNUrkewJXk4ExvvaJFmVGdv064QgtIW4UMnIzvm/6hUN8qU7XDFjjHewWAB8QD+SZbRW0N
	wJaHRpjBC7R1noCTiCP
X-Received: by 2002:a17:90b:1e41:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3ab3a9d3e2cmr14452410a91.65.1792000232105;
        Wed, 14 Oct 2026 10:50:32 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm403009a91.13.2026.10.14.10.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:28 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: zynqmp: Add support for ALINX EdgeBoard FZ3A
Date: Thu, 15 Oct 2026 01:50:17 +0800
Message-ID: <20261014175020.62907-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ALINX EdgeBoard FZ3A is an embedded computing board from ALINX based on
the Xilinx Zynq UltraScale+ XCZU3EG SoC. The hardware was designed and
manufactured by ALINX for Baidu's AI EdgeBoard program.

This series adds the ALINX vendor prefix, documents the board compatible,
and adds a device tree for the board's PS peripherals:
  - UART1 debug console
  - eMMC (HS200) and microSD card
  - GEM3 Ethernet with Micrel KSZ9031 PHY on the MDIO bus
  - I2C0 and I2C1
  - QSPI NOR flash
  - PCIe
  - USB 3.0 host
  - DisplayPort output

Public board documentation and product links:
  - https://ai.baidu.com/tech/hardware/deepkit
  - https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
  - https://www.alinx.com/
  - https://vd100-20232-v101.readthedocs.io/zh-cn/en/VD100_S1_RSTdocument_EN/00_aboutALINX_EN.html

Tested on ALINX EdgeBoard FZ3A hardware with Linux 7.3.0-rc5: the board boots
from SD card into userspace over the serial console, gem3 negotiates
1000Mbps/Full duplex with phy-mode = "rgmii-id", and the eMMC runs in
HS200 mode.

The base DTB passes CHECK_DTBS=y without warnings, the bindings pass
dt_binding_check, and the DTS passes dt-check-style.

Apologies for the threading issues in v2 caused by an SMTP relay breakdown;
v3 is sent as a clean, unified thread and addresses all reviewer comments.

Changes in v3:
  - Update author and submission email to cyan2254650260@gmail.com
  - Patch 1:
    - Fix legal transliteration to "Xinyi Electronic Technology (Shanghai)
      Co., Ltd. (ALINX)" (Conor Dooley)
    - Add website link in commit message (Conor Dooley)
    - Collect Conor's Acked-by
  - Patch 2:
    - Collect Conor's Acked-by
  - Patch 3:
    - Add public board documentation and product links in commit message
      and DTS header comment (Michal Simek)
    - Conform to DTS coding style:
      - Sort compatible before model in root node
      - Sort children in natural-sort order
      - Reorder properties in canonical order (phys before phy-names, etc.)
      - Add required blank lines before status properties
      - Alphabetize pinctrl children and pin configurations

Changes in v2:
  - Use the correct vendor prefix 'alinx' instead of 'ebdee', and rename
    the board and DTS file accordingly (Krzysztof Kozlowski)
  - Describe the board as a single board computer with the SoC, DDR4 and
    eMMC on one PCB (Andrew Lunn)
  - Add the MDIO bus and describe the KSZ9031 PHY with phy-handle (Andrew Lunn)
  - Enable eMMC HS200 on sdhci0: drop no-1-8-v, add pinctrl and mmc-hs200-1_8v
  - Drop power-source and bias-high-impedance from pinctrl_gem3_default,
    which only produce spurious warnings on pre-2023.1 PM firmware


Pufan Jin (3):
  dt-bindings: vendor-prefixes: Add ALINX vendor prefix
  dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
  arm64: zynqmp: Add ALINX EdgeBoard FZ3A

 .../bindings/soc/xilinx/xilinx.yaml           |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 360 ++++++++++++++++++
 4 files changed, 364 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts

Range-diff against v2:
1:  c33ea63b7 ! 1:  ceeae5872 dt-bindings: vendor-prefixes: Add ALINX vendor prefix
    @@
      ## Metadata ##
    -Author: Pufan Jin <2254650260@qq.com>
    +Author: Pufan Jin <cyan2254650260@gmail.com>
     
      ## Commit message ##
         dt-bindings: vendor-prefixes: Add ALINX vendor prefix
     
    -    Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
    +    Add vendor prefix for ALINX (Xinyi Electronic Technology (Shanghai)
         Co., Ltd.).
     
    -    Signed-off-by: Pufan Jin <2254650260@qq.com>
    +    Link: https://www.alinx.com/
    +    Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
    +    Acked-by: Conor Dooley <conor.dooley@microchip.com>
     
      ## Documentation/devicetree/bindings/vendor-prefixes.yaml ##
     @@ Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:
    @@ Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:
        "^alientek,.*":
          description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
     +  "^alinx,.*":
    -+    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
    ++    description: Xinyi Electronic Technology (Shanghai) Co., Ltd. (ALINX)
        "^allegro,.*":
          description: Allegro DVT
        "^allegromicro,.*":
2:  888548b4e ! 2:  da2a7b3e7 dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
    @@
      ## Metadata ##
    -Author: Pufan Jin <2254650260@qq.com>
    +Author: Pufan Jin <cyan2254650260@gmail.com>
     
      ## Commit message ##
         dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
     
         Document the ALINX EdgeBoard FZ3A compatible.
     
    -    Signed-off-by: Pufan Jin <2254650260@qq.com>
    +    Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
    +    Acked-by: Conor Dooley <conor.dooley@microchip.com>
     
      ## Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml ##
     @@ Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml: properties:
3:  cd96303fb ! 3:  273fcd977 arm64: zynqmp: Add ALINX EdgeBoard FZ3A
    @@
      ## Metadata ##
    -Author: Pufan Jin <2254650260@qq.com>
    +Author: Pufan Jin <cyan2254650260@gmail.com>
     
      ## Commit message ##
         arm64: zynqmp: Add ALINX EdgeBoard FZ3A
    @@ Commit message
         The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
         dt_binding_check.
     
    -    Signed-off-by: Pufan Jin <2254650260@qq.com>
    +    Link: https://ai.baidu.com/tech/hardware/deepkit
    +    Link: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
    +    Link: https://www.alinx.com/
    +    Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
     
      ## arch/arm64/boot/dts/xilinx/Makefile ##
     @@
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     + * Device tree for the ALINX EdgeBoard FZ3A
     + * based on the Xilinx Zynq UltraScale+ XCZU3EG
     + *
    ++ * Product info: https://ai.baidu.com/tech/hardware/deepkit
    ++ * Documentation: https://ai.baidu.com/ai-doc/HWCE/8kq9b2121
    ++ *
     + * Copyright (c) 2026 Pufan Jin
     + */
     +
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +#include "zynqmp-clk-ccf.dtsi"
     +
     +/ {
    -+	model = "ALINX EdgeBoard FZ3A";
     +	compatible = "alinx,edgeboard-fz3a", "xlnx,zynqmp";
    ++	model = "ALINX EdgeBoard FZ3A";
     +
     +	aliases {
     +		ethernet0 = &gem3;
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		stdout-path = "serial0:115200n8";
     +	};
     +
    -+	dpcon: connector {
    -+		compatible = "dp-connector";
    -+		label = "mini-DP";
    -+		type = "mini";
    -+
    -+		port {
    -+			dpcon_in: endpoint {
    -+				remote-endpoint = <&dpsub_dp_out>;
    -+			};
    -+		};
    -+	};
    -+
     +	dp_aclk: clock-dp-aclk {
     +		compatible = "fixed-clock";
     +		#clock-cells = <0>;
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		clock-frequency = <100000000>;
     +	};
     +
    -+	memory@0 {
    -+		device_type = "memory";
    -+		reg = <0x0 0x0 0x0 0x7ff00000>;
    ++	dpcon: connector {
    ++		compatible = "dp-connector";
    ++		label = "mini-DP";
    ++		type = "mini";
    ++
    ++		port {
    ++			dpcon_in: endpoint {
    ++				remote-endpoint = <&dpsub_dp_out>;
    ++			};
    ++		};
     +	};
     +
     +	vcc_3v3_pcie: regulator-pcie {
     +		compatible = "regulator-fixed";
    -+		regulator-name = "pcie-reset";
    -+		regulator-min-microvolt = <3300000>;
    -+		regulator-max-microvolt = <3300000>;
    -+		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
     +		enable-active-high;
    ++		gpios = <&gpio 37 GPIO_ACTIVE_HIGH>;
     +		regulator-always-on;
     +		regulator-boot-on;
    ++		regulator-max-microvolt = <3300000>;
    ++		regulator-min-microvolt = <3300000>;
    ++		regulator-name = "pcie-reset";
     +	};
     +
     +	reserved_memory: reserved-memory {
    ++		ranges;
     +		#address-cells = <2>;
     +		#size-cells = <2>;
    -+		ranges;
     +
     +		linux_cma: cma {
     +			compatible = "shared-dma-pool";
    ++			alloc-ranges = <0x0 0x0 0x0 0x7ff00000>;
     +			reusable;
    -+			alloc-ranges = <0x0 0x0 0x0 0x80000000>;
    -+			size = <0x0 0x20000000>;	/* 512MB */
    -+			linux,cma-default;
    ++			size = <0x0 0x20000000>;
     +		};
     +	};
    ++
    ++	memory@0 {
    ++		device_type = "memory";
    ++		reg = <0x0 0x0 0x0 0x7ff00000>;
    ++	};
     +};
     +
     +&ams_pl {
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +	snps,dis_u2_susphy_quirk;
     +	snps,hsphy_interface = "ulpi";
     +	snps,usb3_lpm_capable;
    ++
     +	status = "okay";
     +};
     +
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
     +		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
     +		 <&zynqmp_clk GEM_TSU>;
    -+	pinctrl-names = "default";
    -+	pinctrl-0 = <&pinctrl_gem3_default>;
    -+	phy-mode = "rgmii-id";
     +	phy-handle = <&phy0>;
    ++	phy-mode = "rgmii-id";
    ++	pinctrl-0 = <&pinctrl_gem3_default>;
    ++	pinctrl-names = "default";
    ++
     +	status = "okay";
     +
     +	mdio {
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		#size-cells = <0>;
     +
     +		phy0: ethernet-phy@1 {
    -+			reg = <1>;
     +			compatible = "ethernet-phy-id0022.1620";
    ++			reg = <1>;
     +		};
     +	};
     +};
     +
     +&gpio {
     +	clocks = <&lpd_lsbus>;
    ++
     +	status = "okay";
     +};
     +
     +&i2c0 {
     +	clock-frequency = <400000>;
    -+	pinctrl-names = "default";
     +	pinctrl-0 = <&pinctrl_i2c0_default>;
    ++	pinctrl-names = "default";
    ++
     +	status = "okay";
     +};
     +
     +&i2c1 {
     +	clock-frequency = <400000>;
    -+	pinctrl-names = "default";
     +	pinctrl-0 = <&pinctrl_i2c1_default>;
    ++	pinctrl-names = "default";
    ++
     +	status = "okay";
     +};
     +
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +
     +&pcie {
     +	phys = <&psgtr 0 PHY_TYPE_PCIE 0 0>;
    ++
     +	status = "okay";
     +};
     +
     +&pinctrl0 {
     +	status = "okay";
     +
    ++	pinctrl_gem3_default: gem3-default {
    ++		conf {
    ++			groups = "ethernet3_0_grp";
    ++			slew-rate = <SLEW_RATE_SLOW>;
    ++		};
    ++
    ++		conf-mdio {
    ++			bias-disable;
    ++			groups = "mdio3_0_grp";
    ++			slew-rate = <SLEW_RATE_SLOW>;
    ++		};
    ++
    ++		conf-rx {
    ++			low-power-disable;
    ++			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
    ++			       "MIO75";
    ++		};
    ++
    ++		conf-tx {
    ++			bias-disable;
    ++			low-power-enable;
    ++			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
    ++			       "MIO69";
    ++		};
    ++
    ++		mux {
    ++			function = "ethernet3";
    ++			groups = "ethernet3_0_grp";
    ++		};
    ++
    ++		mux-mdio {
    ++			function = "mdio3";
    ++			groups = "mdio3_0_grp";
    ++		};
    ++	};
    ++
     +	pinctrl_i2c0_default: i2c0-default {
     +		conf {
     +			bias-pull-up;
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		};
     +	};
     +
    -+	pinctrl_usb0_default: usb0-default {
    -+		mux {
    -+			function = "usb0";
    -+			groups = "usb0_0_grp";
    -+		};
    -+	};
    -+
     +	pinctrl_sdhci0_default: sdhci0-default {
    -+		mux {
    -+			groups = "sdio0_0_grp";
    -+			function = "sdio0";
    -+		};
    -+
     +		conf {
    ++			bias-disable;
     +			groups = "sdio0_0_grp";
     +			slew-rate = <SLEW_RATE_SLOW>;
    -+			bias-disable;
     +		};
    -+	};
     +
    -+	/*
    -+	 * Omit 'power-source' and 'bias-high-impedance' to avoid spurious
    -+	 * warnings on the board's pre-2023.1 PM firmware. Bank voltage
    -+	 * and pin directions are already configured by hardware.
    -+	 */
    -+	pinctrl_gem3_default: gem3-default {
     +		mux {
    -+			function = "ethernet3";
    -+			groups = "ethernet3_0_grp";
    -+		};
    -+
    -+		conf {
    -+			groups = "ethernet3_0_grp";
    -+			slew-rate = <SLEW_RATE_SLOW>;
    -+		};
    -+
    -+		conf-rx {
    -+			pins = "MIO70", "MIO71", "MIO72", "MIO73", "MIO74",
    -+			       "MIO75";
    -+			low-power-disable;
    -+		};
    -+
    -+		conf-tx {
    -+			pins = "MIO64", "MIO65", "MIO66", "MIO67", "MIO68",
    -+			       "MIO69";
    -+			bias-disable;
    -+			low-power-enable;
    -+		};
    -+
    -+		mux-mdio {
    -+			function = "mdio3";
    -+			groups = "mdio3_0_grp";
    ++			function = "sdio0";
    ++			groups = "sdio0_0_grp";
     +		};
    ++	};
     +
    -+		conf-mdio {
    -+			groups = "mdio3_0_grp";
    -+			slew-rate = <SLEW_RATE_SLOW>;
    -+			bias-disable;
    ++	pinctrl_usb0_default: usb0-default {
    ++		mux {
    ++			function = "usb0";
    ++			groups = "usb0_0_grp";
     +		};
     +	};
     +};
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +&psgtr {
     +	clocks = <&gtr_refclk0>, <&gtr_refclk1>, <&gtr_refclk2>;
     +	clock-names = "ref0", "ref1", "ref2";
    ++
     +	status = "okay";
     +};
     +
     +&qspi {
     +	clocks = <&zynqmp_clk QSPI_REF>, <&lpd_lsbus>;
     +	num-cs = <1>;
    ++
     +	status = "okay";
     +
     +	flash: flash@0 {
    -+		#address-cells = <1>;
    -+		#size-cells = <1>;
     +		compatible = "jedec,spi-nor";
     +		reg = <0x0>;
    ++		#address-cells = <1>;
    ++		#size-cells = <1>;
     +		spi-max-frequency = <50000000>;
     +		spi-rx-bus-width = <4>;
     +		spi-tx-bus-width = <1>;
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +};
     +
     +&sdhci0 {
    ++	assigned-clock-rates = <187498125>;
    ++	bus-width = <8>;
    ++	cap-mmc-hw-reset;
     +	clocks = <&zynqmp_clk SDIO0_REF>, <&lpd_lsbus>;
    -+	pinctrl-names = "default";
    -+	pinctrl-0 = <&pinctrl_sdhci0_default>;
    -+	non-removable;
     +	disable-wp;
    ++	mmc-hs200-1_8v;
     +	no-sd;
     +	no-sdio;
    -+	mmc-hs200-1_8v;
    -+	cap-mmc-hw-reset;
    -+	bus-width = <8>;
    ++	non-removable;
    ++	pinctrl-0 = <&pinctrl_sdhci0_default>;
    ++	pinctrl-names = "default";
     +	xlnx,mio-bank = <0>;
    -+	assigned-clock-rates = <187498125>;
    ++
     +	status = "okay";
     +};
     +
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +	clocks = <&zynqmp_clk SDIO1_REF>, <&lpd_lsbus>;
     +	disable-wp;
     +	no-1-8-v;
    ++
     +	status = "okay";
     +};
     +
     +&uart0 {
     +	clocks = <&zynqmp_clk UART0_REF>, <&lpd_lsbus>;
    ++
     +	status = "okay";
     +};
     +
     +&uart1 {
     +	clocks = <&zynqmp_clk UART1_REF>, <&lpd_lsbus>;
    ++
     +	status = "okay";
     +};
     +
     +&usb0 {
    -+	phy-names = "usb3-phy";
     +	phys = <&psgtr 1 PHY_TYPE_USB3 0 1>;
    -+	pinctrl-names = "default";
    ++	phy-names = "usb3-phy";
     +	pinctrl-0 = <&pinctrl_usb0_default>;
    ++	pinctrl-names = "default";
     +	reset-gpios = <&gpio 44 GPIO_ACTIVE_LOW>;
     +
     +	status = "okay";
    @@ arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts (new)
     +		 <&zynqmp_clk DP_AUDIO_REF>,
     +		 <&zynqmp_clk DP_VIDEO_REF>;
     +	clock-names = "dp_apb_clk", "dp_aud_clk", "dp_vtc_pixel_clk_in";
    -+	phy-names = "dp-phy0", "dp-phy1";
     +	phys = <&psgtr 3 PHY_TYPE_DP 0 2>,
     +	       <&psgtr 2 PHY_TYPE_DP 1 2>;
    ++	phy-names = "dp-phy0", "dp-phy1";
    ++
     +	status = "okay";
     +};
-- 
2.56.0

