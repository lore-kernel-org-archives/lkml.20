Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BFC49E159
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002420; cv=none; b=SWSf/LTLOKeU5faoHRxCsg+wzwhUhRHKVoW0jaZs57pvdcng/cxJwMbkp0Hour/LH5E+P6PqCCSywH7GdLPZMq9xxyale+90+y6DX0srbtWbrBRJwlnwdolo0wRLtnhjytpKfpQ+ZsUCWMeD8BFrhl42JMGJjZSpvv9sKORrN/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002420; c=relaxed/simple;
	bh=s21KYmbWMUL5+lM0jS/uNX199WycDfBZtk7pUPTs4c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q5nhkhn525UGuj6wMt9VFaLzFc5ilfZDWeBLaK6AW8C+OkfR3nVtUob9aLTe0iidqBNoFORDm61HxzCytYDrcfsrQrg3QEvaBGmQyN9rvvh+//XPj+kkin2j6QvWK4TkIl8KzOXLdCTswgUnQZ4s6n7IXUI/R4YVUD7iJui5nVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xsPtNmpM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xsPtNmpM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 38EF14E4096B;
	Mon, 21 Sep 2026 14:53:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F20FC5FFB2;
	Mon, 21 Sep 2026 14:53:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0445B1032906F;
	Mon, 21 Sep 2026 16:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790002410; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=YIrNPxWdOhK7e8TNUkyAnoQLyi/9GZU5lkXMuOGGMWQ=;
	b=xsPtNmpMVxHhJ7js+nP2TN/lhzAYZ0kCrnLmIsun0//rxysuJMH15+oSxIEgI7o4NWYHNA
	//pUIoUXKhbzvJMKzMRzLmz8K13XnFglr11OYUY4KoY1vyCOBHupL4mdW6FzMActyBEBI2
	myZ1+kFFhvtyoVYCPPx6bo1TL1y5pANBgkz+pK9g1UcRbW0C9ELbsa8lVPi3Ra8vygwoW1
	+Blxpa7RO4+g/96ReTYyFnVWcxG9CmukRgILVx/YpXk1gX8KDsz5YRyJQxxqxkqbqGh1JC
	42KH0S22XbpiYjLkKrYLBostPT+xpNECMXjYF5pNKZBsGVCPl7XAVhiKSMK+4w==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v4 0/7] dts: ti: k3-j7: Reserve memory for LPM metadata
Date: Mon, 21 Sep 2026 16:53:18 +0200
Message-ID: <20260921145325.300025-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

For TI Jacinto SoCs (J7200, J721S2, J784S4, J722S, J742S2) which support
low power modes, a chunk of memory is reserved for LPM metadata, needed
for saving ATF context and the certificate information of ATF and OPTEE
and the DM image. This LPM metadata area is firewalled to be accessed
only by TIFS.

At boot time, U-Boot R5 SPL copies the DM image into this memory region
so that it doesn't have to be reloaded from storage at resume, speeding
up the resume time.

U-Boot R5 SPL/TIFS use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

NB: Unlike for Sitara, this memory region is not part of the DM memory,
which is not retained across suspend, so the Sitara binding can't be
re-used here.

Patch 1 adds a new binding for this layout.
Patch 2 skips the firewalled lpm-metadata memory region
The other patches add the memory region for the TI Jacinto SoCs (J7200,
J721S2, J784S4, J722S, J742S2)

Changes since v3:
- rebase on v7.3-rc4
- skip mapping the firewalled lpm-metadata memory region
Link to v3: https://lore.kernel.org/lkml/20260703143717.177362-1-richard.genoud@bootlin.com/

Changes since v2:
- Split the DTS changes per ipc-firmware.dtsi
- Reference the LPM carveout through a phandle
- Add a dt-bindings patch documenting the "lpm-metadata" memory-region
  name for the Jacinto layout.
- Use the generic @memory node naming instead of @lpm-memory.
- Clarify how the DM image is handled
Link to v2: https://lore.kernel.org/lkml/20260427160326.370415-1-richard.genoud@bootlin.com/

Changes since v1:
- add specific lpm region for j742s2 and j784s4 instead of the common
  one since the addresses are not the same.
- add j721s2 lpm_memory_region
- change j722s addresse to prevent holes
Link to v1: https://lore.kernel.org/lkml/20260312113446.1857592-1-p-mantena@ti.com/

Richard Genoud (TI) (7):
  dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
  remoteproc: k3: skip mapping firewalled lpm-metadata memory region
  arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j722s-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j742s2-ti-ipc-firmware: Reserve memory for LPM
    metadata

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 18 ++++++++--
 .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 12 +++++--
 .../dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     | 12 +++++--
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 12 +++++--
 arch/arm64/boot/dts/ti/k3-j742s2-evm.dts      |  2 ++
 .../dts/ti/k3-j742s2-ti-ipc-firmware.dtsi     | 24 +++++++++++++
 .../dts/ti/k3-j784s4-ti-ipc-firmware.dtsi     | 15 ++++++++
 drivers/remoteproc/ti_k3_common.c             | 36 +++++++++++++------
 8 files changed, 111 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi


base-commit: 93f51579e7df248780214094418f205253383cc5
