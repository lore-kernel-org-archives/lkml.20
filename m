Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792834094;
	b=EJtF/6u7eRjnvBuGSzQH+gMkN1iI1mTrmsLVmE3EJJor1zPKgiSeHNO7W25R1fnuji0v
	 jjtlyulm9RzWuFuaWqx2f9vzTZPQ3p/OQylPE5lZNjGhp05fQJGdyj1SE8eJAIO5qlP+t
	 H5u6IC/UL3vukmx7+4j93tYoGWCkpyQmOLVrfd853N6Ot9aj1bnHCEdeeFVyy6NnGDFfd
	 w0+ZLuC8wtOFqajf49vnCiFu7XlUqAEOsnr7K4I7KGoAo3eXGCSIDXzouCuwiehPReJlu
	 aP3zfuJdesAVXTF/7imwmQanXkbwPIHawJn2WS3tp8bXoLj93mqtCJOb0iNmeilBEqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834094;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Dd1vbHCbHw9s/WeyYJ4AEMVcOoEpOXxcbL8u77wu9UE=;
	b=FKi10GoOzNM7SvkrIdca81GohaLW/RTqh/tTNr/uRsSv6PUnSatnHsEmQGWTGGvDpY0r
	 QCVq983sZB67uVpnCVJhuPxL0E1AMGOr1HqIt59+7oHyD0iSdnTMP+9DgHQ0E5cJStVck
	 RLi1V5ZifDumATFGh3qB0FVxHctvdYJ07sO4OtablKSF2uxubEAIa8K73VzzLPVSd1iR8
	 3MGgngf+e5jIgGugR0DEw4c/H3LI1qdW3lhnQYZTDhIIxKYKEN/3siWRUoBapcvyNFNV2
	 S683w/BEGG0DB6ZyuzU+eBU2nkl4SX30LHkJbOy5RybXluGuftkiHntcbiPj83x/Z6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRBkIjOy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCFC606AC32;
	Sat, 24 Oct 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRBkIjOy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792834094;
	b=KdVgN5ei3TQLX38SZjX/eURPIptUYKHVYVv9xAGjnZJVc4O2v/WWaMyFAIfejYPSZjap
	 DyOON4O2vgnjJ+YXgiY4/U3FQr1FwL56/e5YZu3QFz4xzsKB9GK/ixVY6dDQXoaITpa8x
	 yL/+FwD3CI22tNBoSgCd7OF/mFijUIgFq18Q9mPT7FHWzW7HvJtEjQjlnf/rifeX/m79a
	 kpEVxb4HR1gGpi6/EOgzLYY4pPr0lN0zDpC18n64WVRiUP3Dt3LAriSRjyTv58pR8BpC+
	 71kglgaU4XzB3CmiFGi38HTsmgKPMMW6S7RGQbubypRjTmqv8ESrzmUZ4T7SSqf5TzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792834094;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Dd1vbHCbHw9s/WeyYJ4AEMVcOoEpOXxcbL8u77wu9UE=;
	b=T4U01IXgWbm0b2N7CSpemJzpMwiHMYT0u206UarUCjiej0OI9dhJyjGC14/tdfq3T3/G
	 cDIv7O8xcq+zPVWx/dPEkpdPEbHnSSAAzibxsQCw5w02B/AAZYeM9c2QNVxQNPglfd5/b
	 vPEXLKXcZ5yLgVhAStQXXiVAO+tj9yGeCIxZQWLqtloWR/kVMcRvVE2d/EsoCU2wBuE7y
	 1rv0evwtJLl9xl8ncEv6gRzGh9Pya2So69/5b5x+wVw2r3Uyat4oK0HcUVkAgWTWvsOEk
	 fvT9/graCbImWrIGft4C0A5mA7+2A+6QAakhFkUkr+uDVW0sCUngfxCCejpwNJ8EGWQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B7971F01828;
	Sat, 24 Oct 2026 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834094;
	bh=Dd1vbHCbHw9s/WeyYJ4AEMVcOoEpOXxcbL8u77wu9UE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=WRBkIjOy/gZoZVfkLTdnsaanVKwx0Ypkb6cHmq8Kf/kadpaJ3t3Z6B3HuVWw/iylh
	 cNuLlMqKmxmVaEyyil6r91QV54uGgQ9JWv0y8B8i54Q3lccSGbMR6Yin4N6eXomsZy
	 yqMvhuCNsIWRWz6EhfnBvzSsbX0pNSQ/wxl+jMW8Y5+pNJ1LQY9wabNcRQu8kF7vK+
	 rlysIGoDk511l5j0V2ZV17VIWkMC4nR8kW6MB7uJqEZtJe1CmrYJ9kAjjsTKzVygIh
	 GMyej+UL7UuraiL6MEMwKBgAkRiJoVjjTIjfzCVeYaqN4UIJqiwtZRlj6t+F16P7OH
	 Jfl/6IsnrgWEA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8D9EA4477B;
	Sat, 24 Oct 2026 09:28:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Subject: [PATCH v6 0/7] riscv: Add device tree support for UltraRISC DP1000
Date: Sat, 24 Oct 2026 17:27:50 +0800
Message-Id: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABh63GoC/23Q3W7bMAwF4FcJfF0PEvVnBcOw9xh2QVJU46JpN
 svxNhR598lq0aZuLgWJ3xHPc1dkGqV0+91zN8kylvH0VA/+btfxAZ/upR9TPXegwCsH0J8f5wm
 nsXCf5tLHhGQQjPbkuzrza5I8/m3ej58v53KmB+F5RV5fTPL7XIPml2fdUUrBFrTffW05UYU+/
 TkiX6Ut0Ks+oomUh0RGm+9vd1/4dPzWbJz50JzswCfjRaPFRN5FHDTkZLV1iRHER9LROvNxKiQ
 nGtTgrK8ZaOyqRGUDeyDjQh6CzVHLOkVYpK/Bx3Gug8oaq7LmpBJLHiAKeciO7IASHQKLDpRyt
 3ZyGMt8mv61yhfdKmhbD2A37S667uw1UkAhieI+7ty0Bd6FtbeNsLbmhCzHYEPgm4J5E7TSZiu
 YVcjZCBFgVOmWYK+FuBVsFUwM6w841fJvCe5KgE9/cFXAHGKi5JmFt8LlcvkPSf55tsoCAAA=
X-Change-ID: 20260522-ultrarisc-dts-9dab3a2316b6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792834086; l=7609;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=Xf9HfLGGyX1dNdt7Zp8pflgTGhFNfF9oq5rvo2Q3qGs=;
 b=QQqUIjGIxmsH3EhEUnCJhYesw819qKbECeJOlTPwTfu9wMG0GZVV/WavaThhZm/o/qd/2UdBN
 eZpboXrfoyYB0Xayj+ZFE8lkcqGqQW2kNfqOlw3ZXYTqU7EuQIqSDvs
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

Add Devicetree support for the UltraRISC DP1000 RISC-V SoC and two
DP1000-based motherboards: Shenzhen Rongda M0 and Milk-V Titan.

DP1000 integrates eight UltraRISC CP100 CPU cores.  The SoC description
includes the CPU and cache topology, CLINT, PLIC, clock controller,
pinctrl, GPIO, four UARTs, two SPI controllers, four I2C controllers,
three PCIe root complexes, GMAC, and the DMA controller.

The Shenzhen Rongda M0 and Milk-V Titan device trees add their
board-specific pin multiplexing, RTC devices, and Ethernet PHY
configuration.  Both boards enable the three PCIe root complexes and
the GMAC described as disabled by default in the SoC DTS.  The Titan
description also provides its GPIO wakeup keys.

The binding patches add the vendor, CPU, board, and peripheral compatible
strings consumed by the new device trees.  The SPI, I2C, and AXI DMA nodes
use their respective generic DesignWare compatible strings as fallbacks.

An earlier version of the DP1000 SoC and board Devicetree support was
posted as part of a combined Devicetree and pinctrl series. The pinctrl
binding and driver were subsequently split out and merged separately.
This series carries the updated Devicetree portion.

Link: https://lore.kernel.org/all/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com/

The following prerequisites have been applied to their respective
subsystem trees but are not yet included in the base:

- net: stmmac: Add common internal RGMII delay handling and DP1000 support
  https://lore.kernel.org/netdev/20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com/

- dt-bindings: i2c: dw: Add compatible for UltraRISC DP1000 SoC
  https://patch.msgid.link/20260907-ultrarisc-dts-v2-6-5eb4c97477c5@ultrarisc.com

- dt-bindings: dma: snps,dw-axi-dmac: Add UltraRISC DP1000 compatible
  https://patch.msgid.link/20260907-ultrarisc-dts-v2-7-5eb4c97477c5@ultrarisc.com

Testing:
- Built dp1000-shenrongda-m0.dtb and dp1000-milkv-titan.dtb with
  ARCH=riscv and W=1.
- Ran dt_binding_check for the modified and prerequisite bindings.
- Validated both DTBs against the relevant Devicetree schemas with
  CHECK_DTBS=y and all prerequisite changes applied.
- Boot-tested both DTBs on Shenzhen Rongda M0 and Milk-V Titan. Verified
  the CPU topology and CBO selftests, UART, SPI, I2C/RTC, system memory,
  and all three PCIe root complexes. The expected PCIe endpoints were
  enumerated on both boards.
- With the prerequisite GMAC series applied, ultrarisc-dwmac established
  1000 Mb/s full-duplex links with the YT8531S PHY on M0 and the RTL8211F
  PHY on Titan.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
---
Changes in v6:
- Rename the PLIC node to interrupt-controller@9000000 and the CLINT
  node to timer@8000000 to follow generic node naming conventions.
- Rename the PHY nodes to ethernet-phy@0 on both boards to match the
  Ethernet PHY binding.
- Link to v5: https://patch.msgid.link/20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com

Changes in v5:
- Drop the deprecated label properties from the Milk-V Titan PHY LED
  nodes so that LED names are composed from color and function
- Replace the deprecated snps,nr-gpios property with ngpios for all four
  DP1000 GPIO ports, preserving the existing GPIO counts.
- Link to v4: https://patch.msgid.link/20261019-ultrarisc-dts-v4-0-3979747cda2e@ultrarisc.com

Changes in v4:
- Move L2 cache nodes out of the CPU nodes and reference them using
  next-level-cache, following the standard Devicetree cache topology.
- Link to v3: https://patch.msgid.link/20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com

Changes in v3:
- Drop the DP1000 SPI binding patch, which has been merged, and the I2C
  and DMA binding patches, which have been applied.
- Correct the reg property address ranges and sizes for DMA and I2C nodes in the DP1000 base device tree.
- Link to v2: https://patch.msgid.link/20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com

Changes in v2:
- Remove the dependency on the DP1000 clock series, which has since
  been merged.
- Drop the generic DWMAC compatible patch; DP1000 GMAC support is handled
  by a separate prerequisite series.
- Drop the RISC-V CPU binding yamllint fix, which has been applied.
- Add DP1000-specific resource constraints and hardware descriptions to
  the SPI, I2C and DMA bindings.
- Correct the native chip-select count of SPI1 from three to four.
- Describe all eight per-channel DMA interrupts.
- Update the DP1000 GMAC nodes for the separate GMAC support series:
  remove the generic DWMAC fallback, use "rgmii-id" for both boards, and
  clarify the fixed MAC-side RGMII delays.
- Link to v1: https://patch.msgid.link/20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Jia Wang <wangjia@ultrarisc.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org

---
Jia Wang (7):
      dt-bindings: vendor-prefixes: Add shenrongda
      dt-bindings: riscv: cpus: Add UltraRISC CP100 compatible
      dt-bindings: riscv: Add UltraRISC DP1000 board compatibles
      dt-bindings: timer: Add UltraRISC DP1000 CLINT
      riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
      riscv: dts: ultrarisc: Add Shenzhen Rongda M0 board device tree
      riscv: dts: ultrarisc: Add Milk-V Titan board device tree

 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/ultrarisc.yaml       |  27 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/ultrarisc/Makefile             |   3 +
 .../dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi  | 108 +++
 .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 201 +++++
 arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h     |  63 ++
 .../ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi    |  79 ++
 .../boot/dts/ultrarisc/dp1000-shenrongda-m0.dts    | 113 +++
 arch/riscv/boot/dts/ultrarisc/dp1000.dtsi          | 865 +++++++++++++++++++++
 13 files changed, 1472 insertions(+)
---
base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
change-id: 20260522-ultrarisc-dts-9dab3a2316b6
prerequisite-message-id: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
prerequisite-patch-id: 92e6cf1352d54e283d7721dc1542b580b8a41be1
prerequisite-patch-id: 875c2058e9d8a983d785d7447374758f994dc847
prerequisite-patch-id: 060a9b129c32c623a52ab1ba66f7a357e54575ff
prerequisite-patch-id: 9aafbac6d2531a378b2057bf57787c814523f9d3
prerequisite-patch-id: d75120a112276bd966d37441bd4d631e1539d0e8
prerequisite-patch-id: f526d36e1a4adb659a812fd4145dca2e69b19453
prerequisite-patch-id: 7d5e12085468dba34526d9047c62b357f874f91e

Best regards,
--  
Xincheng Ji <jixincheng@ultrarisc.com>


