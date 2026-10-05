Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490A64FC8C7;
	Mon,  5 Oct 2026 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221602; cv=none; b=u7/loUbLe2uI6uv8cv8vhbpfen3zcPqcM4QMJWSFDi1xuG4CLYw4cD+lbAM7XewSkapWL/vD5Pt07x2d0A0ra2ztj1IkuxoVni0YuDhul+aKaUUiYellsYgMvTl0NLA/x22L7KcjIWhmmh2hdugsXXRlaETFardZ9KcNamEDzrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221602; c=relaxed/simple;
	bh=VE0wQgjYwXHoQ7emTf0R1cJxbq53jScQq27h5b96Hbw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=OzT4Ob4AbuCU6xUJo87MUS8nHK67N5b6Z46QrijYVBJ179ty0ESxF2PZsGXg86IvJlzrY4Kx1beh4us1xZ3ueu0rXUT8KL9I1rbuhNr6nmoZ//5aBchR0EU6q/yqz45IpT0hSd+N0aIG5+11AJjOFa6qroCPsjLoQzkuSVzYuSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vEVNBgE9; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vEVNBgE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221592; bh=06i4WcQESlvt9d5hVxVL6XtfxJGmUMnEYGAhzyyvOHw=;
	h=From:To:Cc:Subject:Date;
	b=vEVNBgE9bXkG7ny5INeAyekjas8ERoiSySS1Xsna0hZBEEXYf0J4k/1xCVeKAfiqs
	 MznJX1OyqhNcSNNjcOI+lAoeXkmzONdQCrgGEoSL5VJjx/Onznhh49BSpOcgUrQVwW
	 cVH895LZchFOeaoGp9uST67Hs+dgwZ2zMkWN37Ms=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8493A252; Tue, 06 Oct 2026 01:33:09 +0800
X-QQ-mid: xmsmtpt1791221589t8fu07obf
Message-ID: <tencent_AFCC7B9046C57B49E6FDBD8009981E935006@qq.com>
X-QQ-XMAILINFO: Nx5J06Esz7r7GeE/XHa3dCNz59OfJGVkoXqRXygwwtoTU4VYjug57S68tanRxP
	 UQRzBBrqj4wX5zSj7WZ5ceCrkvlQ97O9gVeHca132oRSjklCu+/P5TwOoSCggdtEWCCW5ukmTUew
	 g1D4dld8qheyrWkG9q4FFiBnPXE3odYFT6z0m5zJ5OhZ3LWNS1RKJi8E5IOXFxlb1UEXJzIkI2gm
	 XK5Vg3ccA15ShAnk85fUTjGeFdtGg8mJ3P4AUNcdK1piKl9/LrHzPtuenJX3SZ8dT+1cspASMSOG
	 qPH9iUkpI282MkQGd3c2G/guzcl6gLg6sg/rtkS2rR+pd7zRpYPPNrcGRmMdP8oc4NyQ085PePN1
	 m0Imq9kl9haTphx06PU+nPUTwgg6rOfbkoveGu0/dBJejUtiuTKTLSBv9whdV5RBiLYM6JriErv4
	 BlcNAtO+cTI1QR50F7nMlkWQb3OhY80x6Pp13EjCf8ZAV4HgjlMvebi1mBUV8/mTUk62ZIZkxXZy
	 2rtZodl/hG8G2LYt221URqc0lHS4bP2oI4O+MEBuuFmZdNIq/x21J+L1WvBbVp6KhK3gxJHES+9z
	 S31b74dDE89hi2qsOON2KX8jniM8DdnsUpVNS6q5W/gpbZISi95zWJdoCEEsvo4PVYwg100jNyc7
	 XkkokXheo4a9lhoiX/HsR/cfDl4c9sFkbs9f/3tt2QU87z0VkSgC0NdBbJZzdk9FeQMUhIvv1Gyy
	 Li2AFwQF1RttoHC4oWoNbv9WbDnA/kimgMdcfnfJ6v110RbDrkAw318I2VMuLkB0ERQCeEFDO5X2
	 NMjKoahjgNpIaX05ALdGMbh3X17J+NxKw7dGo9vRkbC1SaNWTTjVdL7FFlWUUCPGvNhrdUJnLuyV
	 zEAoOt2b06Q7YNueT13HdYSKDhWzYeibdfms0GB1G14umxUJU+gOdA/vPn4V1CA5q6/G5RzrmLg1
	 F3xLBq46wdWULGauA18S9Ca5ySU4yd/f6IvAkvPijvjxDREAaj1t5zYhJhYqwDU7edPopM2GN+GV
	 z1ghKBBKKUAglGW1UGVjqcfRLrYd5qzrIqE2Ph8ATS2BXM2EbV7Y9bUjfMBnJSC6aCpym8CA3vNH
	 q/2CDFr+BYQ/0KSFSoBERZ9LuGFECp/G6TyT6/u/bjwpwzoz7znaylomgF1A==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 0/3] arm64: zynqmp: Add support for ALINX EdgeBoard FZ3A
Date: Tue,  6 Oct 2026 01:33:05 +0800
X-OQ-MSGID: <20261005173308.710986-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ALINX EdgeBoard FZ3A is a single board computer from ALINX based on
the Xilinx Zynq UltraScale+ XCZU3EG SoC.

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

The Paddle-Mobile FPGA accelerator is not included. Its PL description
depends on vendor-specific IP and an out-of-tree driver.

Tested on ALINX FZ3A hardware with Linux 7.3.0-rc5: the board boots from
SD card into userspace over the serial console, gem3 negotiates
1000Mbps/Full duplex with phy-mode = "rgmii-id", and the eMMC runs in
HS200 mode.

The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
dt_binding_check.

Changes since v1:
  - Use the correct vendor prefix 'alinx' instead of 'ebdee', and rename
    the board and DTS file accordingly (Krzysztof Kozlowski)
  - Describe the board as a single board computer with the SoC, DDR4 and
    eMMC on one PCB, not a carrier board with a MYIR SoM (Andrew Lunn)
  - Add the MDIO bus and describe the KSZ9031 PHY with phy-handle
    (Andrew Lunn)
  - Enable eMMC HS200 on sdhci0: drop no-1-8-v, add pinctrl and
    mmc-hs200-1_8v
  - Drop power-source and bias-high-impedance from pinctrl_gem3_default,
    which only produce spurious warnings on the board's pre-2023.1 PM
    firmware

Pufan Jin (3):
  dt-bindings: vendor-prefixes: Add ALINX vendor prefix
  dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
  arm64: zynqmp: Add ALINX EdgeBoard FZ3A

 .../bindings/soc/xilinx/xilinx.yaml           |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 350 ++++++++++++++++++
 4 files changed, 354 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts

Range-diff against v1:
1:  d6e565186 < -:  --------- dt-bindings: Add EBDEE vendor prefix
2:  f546b0d1a < -:  --------- dt-bindings: soc: xilinx: Add EBDEE EdgeBoard FZ3A
3:  b114e1da4 < -:  --------- arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development board
4:  c33ea63b7 = 1:  c33ea63b7 dt-bindings: vendor-prefixes: Add ALINX vendor prefix
5:  888548b4e = 2:  888548b4e dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
6:  cd96303fb = 3:  cd96303fb arm64: zynqmp: Add ALINX EdgeBoard FZ3A

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0

