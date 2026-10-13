Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00523F485E;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886889; cv=none; b=neCZ7B5WAqsCRh9PvX02JtVmm1E3p2RsaOnvejKUDH5uPuZ7SDWWD9bYQWRv2pZwtg02R9fxA/ddJ67XvxcOjEhRAKJfQQFyAjBrfMgoxggJ5qzl7wZ2UeuoN8FrorvqUeK9MUQgMk4z0R0aMtGjc1k2e/xPEA9N3muhtoLH+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886889; c=relaxed/simple;
	bh=dFFoT0sSzbe9riLAKq84I+CKVyv+cf0b8B6dj4urwW0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kZWLeyy6kjMF73OYsP4U+XjUkYKVcaqmrC05YjMgkHQMHvpABpOTA/y3zEQv5UTosIKh18GDRX8KnHIYlmtWrfWEkWGjuzWMl3IvuCgvDUKJNCfCla8oCQaGDA5mSa2rSUdhzcjgWeIBnnQHmMXyUPL6dt1pmLfJcN7GS3DojQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZ2AXqb6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZ2AXqb6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62A37C2BCF4;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791886889;
	bh=dFFoT0sSzbe9riLAKq84I+CKVyv+cf0b8B6dj4urwW0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BZ2AXqb6NCo6Sa7bgsTzVP6B7IkVvpbJ52Q6jHxPO3mh5yrJ4gG7N9inszvQ8PlR6
	 oxmyLFvYWJP/uIl7eNluAQ+mOVMU6SjLFbfJyMq0EHc2Epng1wEZe0eZg3RJWCixlH
	 u5ANMGqhXDWV8P9zLx03pq8cIhQ7n8nFH4ge1uMoDVBvjVujMApQ0bR9CrpVTFjQ0u
	 qYQY93qmpf7fsJ1z052AxH2IoDrvyM+AgY/63f7to/rwN5+TeG82brkvNgrsgEdQxM
	 60+Jz0vgalbZHykI19k5ybpDzmUMEUZjsDeuwozGkO6/ountqHrTBGA5X7HT1sS3YV
	 O2n8rLF6jzfBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB47CA9ED2;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Subject: [PATCH v3 0/7] riscv: Add device tree support for UltraRISC DP1000
Date: Tue, 13 Oct 2026 18:21:24 +0800
Message-Id: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACUGzmoC/2WQ3U4DIRCFX6XhWgwMf0tjjO9hvBhgsBjb6rJdN
 U3fXZYatXp5MnO+k3OOrNJYqLL16shGmkst+10T6mrF4gZ3j8RLapqBACsMAD88TyOOpUaepsp
 9wqAQlLTBsuZ5GSmX9867fzjreghPFKcF8vUx0uuhBU3nN7alWrEHrVc3PccLx9PbFuOvtBm44
 B6VD3lIQUl19327jvvtbWfjFDedkw3YpCxJ1JiCNR4HCTlpqU2KCGR9kF4bdelyyZAEMRhtWwY
 qvVC80C5aCMq4PDidvaTFFbASb8HbMjWj0EqLLGMSKVIewFOwkE3QA5I3CJGkCymzZZNNqdN+/
 OiTz7JP0FsPoP+sO8vW2UoMDimQJ3PZudNm+CEsu/0hLKsZCjp6p52L/win0+kT3TrtogQCAAA
 =
X-Change-ID: 20260522-ultrarisc-dts-9dab3a2316b6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886887; l=6630;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=dFFoT0sSzbe9riLAKq84I+CKVyv+cf0b8B6dj4urwW0=;
 b=o9apMkQKLGfqaUJ5/zRMiDeMERvxlGehBrgWtfjtqQsGAukbDYOeGpo1ObLeN8dhWI00NBrIm
 q7m47tevAoeBE8nKq/3LyK0zgPfnOulU013ktiSjIK5HumSrtmrGIu7
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
 .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 203 +++++
 arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h     |  63 ++
 .../ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi    |  79 ++
 .../boot/dts/ultrarisc/dp1000-shenrongda-m0.dts    | 113 +++
 arch/riscv/boot/dts/ultrarisc/dp1000.dtsi          | 899 +++++++++++++++++++++
 13 files changed, 1508 insertions(+)
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


