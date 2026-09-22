Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B7D4B44D0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069655; cv=none; b=UubIyR6F6KuILRnoH2Rd82n3VXHU4IHyfxnzqcnS7rvy+mwmT8OD2D6lVabk76SaMUDEbfMHZLDC8xmZf90S0yDMZLEjhm4YSSR7sus3Fk9GudTIvL3kE6NF4AzBlZohOozTaBsCmtFDZhoHvHJnbLC4pj2nbK5gWt95Y+VsFW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069655; c=relaxed/simple;
	bh=vt/4hyiygjECgQYnHXxSXvAteT7Ou+tERkBB2Zcr72M=;
	h=Message-Id:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=SH+N/wGXfIIr0IybFFoMc9vfmNyfIwcJJixmoKDhDw27o4g1x7ma8XGuHt/2ZtFFNM+xjmJMZIPlUNmijyarHV/BO60IXTZbvJ+jLEXiIc+QFW2kAbF2RBmaEaUm7txpG6H/AbbDhS/yDGGcvub0eTic8XsoXA878E7WG2tgQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hpw0F2sx0z8XrrZ;
	Tue, 22 Sep 2026 17:34:05 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 68M9Y2eC015972;
	Tue, 22 Sep 2026 17:34:02 +0800 (+08)
	(envelope-from sun.wenhan@zte.com.cn)
Message-Id: <202609220934.68M9Y2eC015972@mse-db.zte.com.cn>
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl1.zte.com.cn with SMTP id 68M9JSH7006374;
	Tue, 22 Sep 2026 17:19:28 +0800 (+08)
	(envelope-from sun.wenhan@zte.com.cn)
Received: from mapi (njb2app06[null])
	by mapi (Zmail) with MAPI id mid205;
	Tue, 22 Sep 2026 17:19:30 +0800 (CST)
X-Zmail-TransId: 2afe6ab248228bc-51163
X-Mailer: Zmail v1.0
Date: Tue, 22 Sep 2026 17:19:30 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <sun.wenhan@zte.com.cn>
To: <pjw@kernel.org>
Cc: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <sun.wenhan@zte.com.cn>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <liu.qingtao2@zte.com.cn>,
        <lv.yating@zte.com.cn>, <guo.chang2@zte.com.cn>,
        <deng.weixian@zte.com.cn>, <hu.yuye@zte.com.cn>
Subject: =?UTF-8?B?wqBbUEFUQ0hdIHJpc2N2OiBhbGlnbiBwY2llIGJ1cyBhc3NpZ24gbG9naWMgd2l0aCBBUk02NA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-db.zte.com.cn 68M9Y2eC015972
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: sun.wenhan@zte.com.cn
X-SOURCE-IP: 10.5.228.131 unknown Tue, 22 Sep 2026 17:34:05 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AB24B8D.001/4hpw0F2sx0z8XrrZ

From: sun wenhan <sun.wenhan@zte.com.cn>


RISC-V currently relies on the asm-generic default of
pcibios_assign_all_busses() returning 1, so the kernel always
re-assigns all PCI bus numbers and ignores the bus numbers already
set up by the firmware. This has two downsides:

1. As UEFI 2.8 has brought mature firmware support to RISC-V servers,
the OS can trust and inherit the PCI bus enumeration done by the
BIOS, skipping a redundant re-enumeration at boot and improving
the boot time.

2. The unconditional re-assignment causes bus numbering conflicts
during PCI rescan. When a root port that is not the last one in
the hierarchy is removed and the bus is rescanned, the kernel
fails with:

pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under
[bus 00-ff] (conflicts with (null) [bus 02])

as reported for the same generic code in commit bd8cbe66c01d
("PCI: Make PCI bus renumbering configurable to avoid rescan
conflicts").

Define pcibios_assign_all_busses() the same way as ARM64,
so that RISC-V also preserves the bus numbers assigned by the
firmware by default instead of always re-assigning them. This keeps
RISC-V consistent with the other major architectures.

Signed-off-by: sun wenhan <sun.wenhan@zte.com.cn>
---
arch/riscv/include/asm/pci.h | 5 +++++
1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index cc2a184cfc2e..b2f91abebd61 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -15,6 +15,11 @@
#define PCIBIOS_MIN_IO   4
#define PCIBIOS_MIN_MEM    16

+/*
+ * Set to 1 if the kernel should re-assign all PCI bus numbers
+ */
+#define pcibios_assign_all_busses() (pci_has_flag(PCI_REASSIGN_ALL_BUS))
+
#if defined(CONFIG_PCI) && defined(CONFIG_NUMA)
static inline int pcibus_to_node(struct pci_bus *bus)
{
--
2.27.0
