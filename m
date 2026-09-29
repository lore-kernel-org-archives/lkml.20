Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9336B067
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674279; cv=none; b=DZIC9oXOlD8e1OpIq0X90PqjKWrs7I7S7i+CuIZHvjplMls/CuOwRNu8T5kTId9k9uR9fV5J0j1NVzZGARhWhRagKlCh0RZO0MLHqY/XagenS/eUhHgM/K5E9dDZqpmN0qqz7zqBnXGD6bv5SWRGT5i8NC/hTEybL7+TNDhCn/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674279; c=relaxed/simple;
	bh=HXOaTKSj6n5nt9NKB55ee/mH9zUNQAEV8tfkrSP0oI8=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=QSg6yy5E8LgGP6p5hP+ggwFtgOQfL+FEjSN6nBLj0V2PkH5ohnx04AGhM2LsTBoCM3aoBxxWsCsPDeT5+uvmkKGwtycfdl10PxNTtczI0kq8k0Pb5B5mxID8cYWD++GgasLtE9TfkmoDtMaa1AyESOxVF084ehHoOWlTQRIBzG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hvCbb2Cz8z5B101;
	Tue, 29 Sep 2026 17:31:07 +0800 (CST)
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 68T9UosI001485;
	Tue, 29 Sep 2026 17:30:51 +0800 (+08)
	(envelope-from sun.wenhan@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid205;
	Tue, 29 Sep 2026 17:30:53 +0800 (CST)
X-Zmail-TransId: 2aff6abb854def5-521b0
X-Mailer: Zmail v1.0
Message-ID: <20260929173053186td0a5D4tn7cNBN-R8JyEp@zte.com.cn>
In-Reply-To: <c8bd7448-e9f3-72fc-9c91-db0c2525a3a1@kernel.org>
References: 202609220934.68M9Y2eC015972@mse-db.zte.com.cn,c8bd7448-e9f3-72fc-9c91-db0c2525a3a1@kernel.org
Date: Tue, 29 Sep 2026 17:30:53 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <sun.wenhan@zte.com.cn>
To: <pjw@kernel.org>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <jianjun.wang@linux.alibaba.com>,
        <liu.qingtao2@zte.com.cn>, <lv.yating@zte.com.cn>,
        <guo.chang2@zte.com.cn>, <deng.weixian@zte.com.cn>,
        <hu.yuye@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogYWxpZ24gcGNpZSBidXMgYXNzaWduIGxvZ2ljIHdpdGggQVJNNjQ=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 68T9UosI001485
X-TLS: YES
X-ENVELOPE-SENDER: sun.wenhan@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 29 Sep 2026 17:31:07 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6ABB855B.000/4hvCbb2Cz8z5B101

RISC-V currently relies on the asm-generic default of
pcibios_assign_all_busses() returning 1, so the kernel always
re-assigns all PCI bus numbers and ignores the bus numbers already
set up by the firmware. This has two downsides.

As UEFI 2.8 has brought mature firmware support to RISC-V servers,
the OS can trust and inherit the PCI bus enumeration done by the
BIOS, skipping a redundant re-enumeration at boot and improving the
boot time.

The unconditional re-assignment also causes bus numbering conflicts
during PCI rescan. When a root port that is not the last one in the
hierarchy is removed and the bus is rescanned, the kernel fails
with:

    pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under
    [bus 00-ff] (conflicts with (null) [bus 02])

Define pcibios_assign_all_busses() the same way as ARM64, so that
RISC-V also preserves the bus numbers assigned by the firmware by
default instead of always re-assigning them. This keeps RISC-V
consistent with the other major architectures.

Signed-off-by: sun wenhan <sun.wenhan@zte.com.cn>
---
 arch/riscv/include/asm/pci.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index cc2a184cfc2e..b2f91abebd61 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -15,6 +15,11 @@
 #define PCIBIOS_MIN_IO		4
 #define PCIBIOS_MIN_MEM		16

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
