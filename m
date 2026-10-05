Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9B54DE704;
	Mon,  5 Oct 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221459; cv=none; b=lWRHfYwJR2Xsdn3IbMPf+AvKypny0mmFERB6QoQFSjHxDl0pfHiZpLBFAW5OmIcfQFFv8Babik9DKlYniurLfDcsrVg3Yc8ksI4qH+nRM4L3sjFQXgGFGYjz42tn46R+G93WrN5WxeTnETnbelycqjxoZyApHXUCQyIK0abEoI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221459; c=relaxed/simple;
	bh=VE0wQgjYwXHoQ7emTf0R1cJxbq53jScQq27h5b96Hbw=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Fd4iaiYjF0wXwhAmgcVLXy19NO2OGg1tY2hXDhSHysIGtWfDYbd23RnMPghXxTT4SdiZVOpw1jpqTnEHus6sJu88QBm3ykn/gE3Zt+IiinFtI5ALQ1DUaaDSoANj6DBXhE5/00c11R5kZ3Q+BNytHjE/1R92I9raGgdLZlBpb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=YkB3gfNK; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="YkB3gfNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221443; bh=06i4WcQESlvt9d5hVxVL6XtfxJGmUMnEYGAhzyyvOHw=;
	h=From:To:Cc:Subject:Date;
	b=YkB3gfNKOChzQuefRW2U32oLrvzMvYg4k8/6tnvhtaJYU9q5nGI4QhqA93p/LIEGY
	 RLFcOnQE8xoCkU8thEj8LafLEWCPnsYUwMDCKIfWsP8WHzV468Aj5QcO6dv3pbzAjt
	 QMeFcJ63fXQNu1vJjsg1bC1eJcJ1BiMGSfN/0t/g=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7A82281B; Tue, 06 Oct 2026 01:30:40 +0800
X-QQ-mid: xmsmtpt1791221440tyu2bvv5v
Message-ID: <tencent_71C80AF592B6FB36817B3040A6EE18B3A007@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeA7tiWD0PBvbLeyhmaygXeK0maMxBTlhgBNqV2vidODyNH0TEtN
	 PssLlhnZOBvks2JZZNF+BqwVqwbmeGyxlA0faH3r3PFAy2aMzCkglnQRtoAgE1SOn0/uh6/EGTZA
	 rg0lEKp5DGFAbr6T0giiDYhLwrLGh3cxwHQ7V+J7L8nH3/XnednF+Hju5MY/NM5c2NULAsMLu6El
	 tI/6ezyqQVSDXbactoM3r0QhQtT4dWJFVtJl0z4KdCXCXERESaPFQGGZWIL/Vsc8lg9qivJIJLq3
	 z+vVkGEuqYk/iIGPlKyHysVq6OeJxeBlYjCjyTM2LejusmbjQ4SYeJXKBhRRdQOePgIEK32enJYy
	 bp7Ha9EPqGMKlCZBLNoXU48DBTPKN1dWkFLAg91WZ5WQKZygC/1MEMMEBdWRg5ie5cMVEqrjFYSx
	 e7wyD5J0hvgfiUr9BgPB+kTJ4DhURKdAbDM9SWzoZP8un7RdLvCzBEdpWUeDjN+TXWqJu+RQ5wiU
	 hH94yzueGcD1bEoSSxOShIU4HTIR2KzGj4mpLWLMBXxqI6Fp4wR1i1qISDKGqqn4ZYVnqYjsOVsH
	 pEo8JRgtRvJLqzH6670oBDYWksSpK9C/c5g9Ja5aOF9g0aQvYArL+KjMYSys4McTh2RXGf68snqT
	 9UMliQkJgnNvgKxJpMCR8ikAaKf0g2mzkarsO3LiNaUOhrNOSzJSsnbrrGBou/XXVExX/EQX07OR
	 /LuyaoQYHpZGUw9KwUOEz9FPfZVvErcUjngPMoBXHX+yvQD99/xJPgN7Yu1nWYiCm1QnAr6Wy4bB
	 XqJLex8/wbGCWNx0GkHdBdXllYUP08283EcRHZWfhnGlFuIqHFbunoROKBJuDAa3YIiSpY5gL5re
	 GxdBE3mKKMydJkd84NdxORJOhM2hN0eiy6ND3bl/O943Zhm8fro9kXFi3SlWS6qkdQ8B3W7X0eug
	 xHLZmW/J9GNz6yETA/p9GGC11uORKdV2buct+xN3U3pmL6KaRqcwjoKw6/iITxkhlLZxrXF2pI+M
	 DgIciDppJ8DMPIVc8lHOeM1BdF8w6bKVQ0CAm++XCiLEKErPzp6s6G++SHYYG7XQKxFxbPZAyADg
	 RvgEX+
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Date: Tue,  6 Oct 2026 01:30:36 +0800
X-OQ-MSGID: <20261005173039.707304-1-2254650260@qq.com>
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

