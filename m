Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311389;
	b=BMci1VXzg9v9nBDlx2l5Kj4Jc0pzzii+C7gzaf1d1kfzYciqV06Z+JPDclAhLsA8ccUU
	 860GY5iEANqhXDzyn4TvOkSGvbZYoaNROEtMN0hSnf3pOcu9oyG1ErVyTlTI4xYYgSZ74
	 om3bPqgUl6fiV+9Xe+qeZEW4D4BkGglnwAeWt20u9LCjuj0J6HRbAADgDkctQL8fNBsXt
	 biI6rjrTAvQA5jbFlGSrZCmyCQMHDZ71EQw7lbhc1fP1PpPkOQsmiXgphZQjGwVV6wetH
	 JoSO8iBX6b/6ePLODqTMUJRNPmGQDyoNqHR9G3ennh0aApDvGMbFJg07V0lb4f9ApGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311389;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-MTK;
	bh=CZ27xK6IHcnAGaEHdGwRWZS9iObODCSj/ll8dw4bp3g=;
	b=k+O3AX075wZD1bgCqTUKA4Dz/09jFrPdH5xCqdQUSRrKDC6LQzaGl203D3RbG33n7vQP
	 MMW8lmdkYRr0LTbgF4AeAmm93MffW6UmVlW/Podzv/k6TCoOPwmShdlyK16vJYXDEyHSP
	 X3AIaTFP5cfKydKYMZ+hylqk4H4CSlfBQGOMEriJ4TW11ccGlWQYuVznIVsO7GrDvNuh+
	 pzzv8qParK1W+BrTZ0U5wzlLBsGuNc6BBLnyQkWtNp+8mtvMJLlndUR7IyYQ4r+x9/aQ7
	 7yXVq8961EBC379+fLdKfgTESAXlrDnBdlqFD+/6cF75pknNgWKN+3gzjEI3TQ/F9xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lPucZqKA;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952BF606A325;
	Tue, 10 Nov 2026 11:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 952BF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lPucZqKA
X-UUID: d0a88980dcfc11f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CZ27xK6IHcnAGaEHdGwRWZS9iObODCSj/ll8dw4bp3g=;
	b=lPucZqKA38DBAKjXCwSkuvUDU74rHZ9lwl+/f8s4V8oTxkWroqZv/iRqSi6Hm3DoQKxETHNuVZdvgSlIPVergtr0aMokt5Mejp1Xs/SLNV0PxzYAn36A1NW9ZfawKlxXBHPrDWDh/gJiST6aktAKKAIZ9HHQdtgpUIlJyYe3Xfo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:dfeb11cd-2ef8-45dd-9375-212006edb065,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:81b91457-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d0a88980dcfc11f18dc8c9802ae25ab1-20261110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 568629884; Tue, 10 Nov 2026 19:49:41 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:40 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 19:49:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 0/7] thunderbolt: Add support platform NHI driver
Date: Tue, 10 Nov 2026 19:48:48 +0800
Message-ID: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-MTK: N

Historically, the USB4 / Thunderbolt subsystem has had a hard dependency
on PCI, bundling the core framework, the PCIe-attached Native Host
Interface (NHI) driver (pci.c), and the Intel Connection Manager (icm.c)
into a single module (thunderbolt.ko).

Modern ARM64 SoCs (such as MediaTek MT8901 / MT8992) integrate the USB4
host router / NHI directly as an MMIO platform device rather than sitting
on an external PCIe bus. Furthermore, embedded and SoC-based platforms
often do not include PCIe-attached host routers or require Intel ICM
support, making a mandatory PCI dependency and bundled PCIe code
undesirable.

This series decouples PCIe NHI and Intel ICM support from the Thunderbolt
core framework, introduces a generic platform NHI driver supporting DT and
ACPI bindings, and addresses link training timing and race condition issues
observed during suspend/resume and authorization.

Overview of Changes
===================

1. Modularization & Namespace Cleanups (Patches 1-3)
   - Patches 1 & 2 clean up internal interfaces before exporting. Core NHI
     functions are prefixed with standard tb_/tb_ring_ namespace prefixes.
     Intel ICM mailbox helpers (nhi_mailbox_cmd/mode) are moved into icm.c
     and made static, and interrupt work initialization is internalized in
     tb_nhi_probe().
   - Patch 3 drops the hard "depends on PCI" from CONFIG_USB4, introduces
     CONFIG_USB4_PCI to build PCIe NHI and ICM as an opt-in module
     (thunderbolt_pci.ko), and adds a .select_cm() hook in tb_nhi_ops to
     allow connection manager selection without core hardcoding.

2. Platform NHI Driver (Patch 4)
   - Introduces CONFIG_USB4_PLATFORM (thunderbolt_platform.ko), adding
     support for memory-mapped USB4 NHIs via Device Tree ("usb4-nhi-platform")
     and ACPI ("ACPI0015").
   - Implements platform-specific tb_nhi_ops hooks and runtime PM.
   - Adds support for an optional dedicated wakeup interrupt from an
     always-on power domain, necessary for SoCs where the primary NHI MAC/PHY
     power domain is gated during suspend.

3. Link Training and Disconnect Improvements (Patches 5-6)
   - Patch 5 increases the port link training timeout in tb_wait_for_port()
     from 1s to 2s. According to the USB4 specification, Phase 5 (Link
     Equalization) alone may take up to 1000 ms. When combined with Phases 2-4
     (~200 ms) and retimer command transaction delays across dual-retimer
     topologies, physical link establishment can legitimately exceed 1.2s–1.5s,
     which previously led to spurious disconnects during wakeups.
   - Patch 6 decouples the TB_PORT_UNPLUGGED wait time from the overall 2s
     link-up timeout. Under normal link training, the port enters
     TB_PORT_CONNECTING within ~200 ms. Capping TB_PORT_UNPLUGGED retries to
     400 ms allows genuine device disconnect wakeups to be handled promptly
     without waiting the full 2s.

4. Prevent Authorization/Teardown Race Warnings (Patch 7)
   - Prevents WARNING splats in tb_path_activate() and tb_disconnect_pci()
     when sysfs 'authorized' is modified while a downstream router is lost or
     unplugged during suspend/resume. Checking sw->is_unplugged avoids
     redundant lookups and activation attempts on already-freed tunnels.

Testing
=======
This series has been tested on MediaTek ARM64 SoC platforms with an
integrated platform USB4 NHI, verifying:
- Cold boot, device discovery, and tunnel allocation (PCIe, USB3).
- System/runtime Suspend and wake-on-connect/disconnect/remote wakeup.
- Concurrent sysfs authorization changes during disconnect events.
- Verification of modular builds with CONFIG_USB4_PCI=m and
  CONFIG_USB4_PLATFORM=m.

Chunfeng Yun (6):
  thunderbolt: Prefix NHI core functions with tb_ and tb_ring_
  thunderbolt: Move ICM mailbox functions to icm.c and internalize
    interrupt work
  thunderbolt: add platform NHI driver
  thunderbolt: increase the lane adapter link-up timeout value
  thunderbolt: decouple the waiting time of TB_PORT_UNPLUGGED and
    TB_PORT_UP
  thunderbolt: prevent pcie tunnel activation/teardown warnings

Konrad Dybcio (1):
  thunderbolt: Make PCIe NHI support opt-in

 drivers/thunderbolt/Kconfig    |  20 +++-
 drivers/thunderbolt/Makefile   |  10 +-
 drivers/thunderbolt/ctl.c      |   6 +-
 drivers/thunderbolt/domain.c   |  14 ++-
 drivers/thunderbolt/icm.c      |  59 +++++++++++
 drivers/thunderbolt/nhi.c      |  92 ++++--------------
 drivers/thunderbolt/nhi.h      |  16 ++-
 drivers/thunderbolt/pci.c      |  50 ++++------
 drivers/thunderbolt/platform.c | 172 +++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c   |  26 ++++-
 drivers/thunderbolt/tb.c       |   7 ++
 drivers/thunderbolt/tb.h       |   2 -
 drivers/thunderbolt/tunnel.c   |   1 +
 drivers/thunderbolt/xdomain.c  |   5 +
 include/linux/thunderbolt.h    |   4 +
 15 files changed, 356 insertions(+), 128 deletions(-)
 create mode 100644 drivers/thunderbolt/platform.c

-- 
2.45.2

