Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348758;
	b=boqqkI5keRNDwWJlSJ6D27ZYqCeAVY8D1hNdGu33Hgwu0aBxNObRsUnWhO3oUwz+VrD/
	 w5WaaEVUESyibggRrfDbwJjDDkZTE/ZTILlDDSk4yEctuHta4NL3NcwzBOfiCBr5Q+c5A
	 3dLGjDmXmJz8xD/Sc0fRGJjl2K7nDOJwruVlONGiK7Co6aibPQQ3JueARd16HeV7HA99R
	 n+oI7jNvP5R/DySDlcm0Kz4kpLTVfob7y+OoZnorM2Z61vfRfo1V6oVB4fwP2o8CBZbRc
	 9D8m9uy0j6Kl3+fpWCevUTSqsMbB+PBRev+fiKo8KYortYLPrePIYodI6zG/5/NwO0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348758;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=htf0XnCq8b3mGZpyFUeRWCE6zqOV8+iGrdXbpt9HnI4=;
	b=t4CXavbPe8qSqZgt9BATOpEsBpInf9T79N/yUwXrXZ6i8+oId5fCUyqUCVHXYzDJctVI
	 cQwP+y1l6V4kelggrLD2nnDqDZcpKQlgIt7sMM0b7exS9xR7w4LLAet6tWdmdVkiycggf
	 6J0LtBfp5UfZgGwLslnJ5OGqhK6hyh6+s9H00/VHM/kPZPKsTHNQWKIp1czdTtoGuBevg
	 61b6/Cr0OkKf9ZouIy3skA05cx8nxbx3Qn8iuDR6lcz5s6I2yE/3i8bOI2IM402jL1N7o
	 Eiz7e5wWIH+cHidZl8EmUc54YFrrcfAoLXGGF2XayX/ntI7VsLJxWo/ADsdpZ1LIlhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ncM5MH9O;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24561606A31C;
	Fri, 30 Oct 2026 08:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24561606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ncM5MH9O
X-UUID: 84dfcceed43b11f18dc8c9802ae25ab1-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=htf0XnCq8b3mGZpyFUeRWCE6zqOV8+iGrdXbpt9HnI4=;
	b=ncM5MH9OiDXnAMTTfYf0ACPVHJ23Z8v6Lomf7KRzk/qFLgelf9qT6jetllI7MafB1AU7OAL47L59aY1x85doyqoVZyASr4fVXk6ZOdVEuOZ5MFJ64ZLTnCUx5whZKBbqzxmzzOme///MIIitcuMR/BHGNrrv3MCvk30JnzJ5V+w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ef037393-0584-4e12-9a23-3620b3bfe4c3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:1262e7ec-b50c-48b5-b20a-bfe3130e16d3,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 84dfcceed43b11f18dc8c9802ae25ab1-20261030
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2146420178; Fri, 30 Oct 2026 16:25:52 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 16:25:50 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 16:25:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat
	<YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 0/4] add support platform nhi driver
Date: Fri, 30 Oct 2026 16:25:35 +0800
Message-ID: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This patch series introduces support for platform bus-based USB4/Thunderbolt
Host Interface (NHI) controllers on embedded SoCs, along with two fixes/
improvements in the Thunderbolt core connection manager.

Historically, the Thunderbolt NHI driver has assumed a PCI bus binding
(pci.c), with tb_domain_init()/exit() tightly coupled to the PCI module
lifecycle. Modern ARM64 SoCs integrate the USB4 NHI controller directly
onto the platform bus, described via Device Tree or ACPI.

This series decouples the core domain initialization from the PCI driver
and adds a dedicated platform driver (plat.c) supporting standard platform
probing, OF/ACPI device tables, runtime PM, and an optional dedicated
out-of-band wakeup IRQ.

Additionally, this series resolves two issues observed during runtime PM
and link training:
1. Premature link-up timeout when bringing up USB3 adapters on links with
   multiple retimers.
2. Kernel warnings when authorizing/de-authorizing PCIe tunnels on switches
   that have been marked unplugged or lost during suspend.

Patches in this series:
======================
Patch 1: thunderbolt: add platform nhi driver
  Decouples tb_domain_init()/exit() using subsys_initcall() and adds plat.c
  to support memory-mapped NHI host controllers on the platform bus with
  Device Tree (CONFIG_OF) and ACPI (CONFIG_ACPI) match tables.

Patch 2: thunderbolt: add support optional dedicated wakeup irq
  Adds support for an optional dedicated wakeup interrupt for platform NHI
  controllers using dev_pm_set_dedicated_wake_irq(), allowing out-of-band
  wake-up lines from SoC power management units during low-power states.

Patch 3: thunderbolt: improve usb3 adapter link up timeout value
  Increases tb_wait_for_port() timeout from 1.0s to 2.5s. In the USB4 spec,
  Phase 5 (Link Equalization) alone is permitted up to 1000 ms. When factoring
  in Phase 3/4 and retimer transaction delays across multiple retimers, link
  training can legitimately take 1.2s to 1.5s+. The previous 1.0s timeout
  caused premature aborts and disconnects upon wakeup.

Patch 4: thunderbolt: fix pcie tunnel create/destroy core dump
  Checks sw->is_unplugged in tb_switch_set_authorized(), tb_disconnect_pci(),
  and tb_tunnel_pci(). When de-authorizing an unplugged/lost switch via sysfs,
  this prevents redundant lookups and eliminates false-positive
  WARN_ON(!tunnel) stack traces when tunnels have already been destroyed.

Testing:
========
Tested on ARM64 platform hardware with USB4 hubs and downstream PCIe/USB3
devices across plug/unplug, system suspend/resume, and runtime PM transitions,
the kernel boots from UEFI/ACPI.

Chunfeng Yun (4):
  thunderbolt: add platform nhi driver
  thunderbolt: add support optional dedicated wakeup irq
  thunderbolt: improve usb3 adapter link up timeout value
  thunderbolt: prevent pcie tunnel activation/teardown warnings

 drivers/thunderbolt/Makefile |   2 +-
 drivers/thunderbolt/domain.c |  10 +-
 drivers/thunderbolt/nhi.c    |   2 +
 drivers/thunderbolt/nhi.h    |   1 -
 drivers/thunderbolt/pci.c    |  26 +-----
 drivers/thunderbolt/plat.c   | 171 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c |   8 +-
 drivers/thunderbolt/tb.c     |   7 ++
 drivers/thunderbolt/tb.h     |   2 -
 include/linux/thunderbolt.h  |   2 +
 10 files changed, 200 insertions(+), 31 deletions(-)
 create mode 100644 drivers/thunderbolt/plat.c

-- 
2.43.0

