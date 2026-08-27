Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB377483BFA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847889; cv=none; b=EhqzjM1iCJHX9JSfm85XZmBA5+kQtyK+/+3N8zl5ZhQ2WztWS9oM609guupZLlUt4uXSniyA8aplJQJM6d0KdAJjyQmu5Z3c+qmVHeikYXjehFpJUwyVJsvMRRXhI27x3n07eA1FDCbUwr8F5BTOZ6vEoYA6JgVwwAhpSjrluUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847889; c=relaxed/simple;
	bh=pgoI14c19xZ43wko77ZwN8GGic+HffwtfhmOQJFlreQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kwbqeiuz1n1nhZcna8Ghbk1K4BTJGtRaNVHmMk/R4Y6Ti3Qk3AEx9CdV9tbJm19lRuQkaVpjKQ1h9DuJ76KX+1IZsjsIqeI9IVTeVkmzfIHkTMEiPY2fspxcnPJ2bKC+OiOYHhD6w4fA0y1Y5q3tq8eEk5yCZ4HSVcKAk26EtT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rrMP/6Ig; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rrMP/6Ig"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oMZ5AFZhqeXmEWrdBGYUKt+USNzuDSrHR09vQq45iZE=;
	b=rrMP/6IgeCyguD1XBUymEDs46U3PH2nQcOVjRM7NWTwXIBiKAc+v2wRktTvtj3dnhx+/A68o2
	ujUyEiKFJ0FYG9oClz7vuPt/2Wbq9ooYp17fibHkCYasLVZkNzjTArv/0GTYFmcY9o+umZmAbaw
	okn+6XU8oRhyoEmAUSQddQg=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KC66nqzHnH5L;
	Fri, 28 Aug 2026 00:23:59 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id D785540570;
	Fri, 28 Aug 2026 00:24:35 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:35 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 02/18] arm64: align kernel text and rodata
Date: Fri, 28 Aug 2026 00:11:42 +0800
Message-ID: <20260827161158.3618409-3-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
Reply-To: <artem.kuzin@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)

In order to comply with AArch64 page table entries type -
table and block descriptor format, we need to use correct alignment
for replicated memory areas. Physical blocks allocated for replicated areas
must have the same offset for all replicas and same relative offset
to the virtual address.
For simplicity, we just use an explicit alignment for kernel sections.
If 4K pages are used,  2MB alignment should be applied.
Otherwise CONT_PTE_SIZE alignment is used.

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 arch/arm64/kernel/vmlinux.lds.S | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index af1d72020976..aaf07e926c54 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -192,6 +192,13 @@ SECTIONS
 		_text = .;
 		HEAD_TEXT
 	}
+#ifdef CONFIG_KERNEL_REPLICATION
+#ifdef CONFIG_ARM64_4K_PAGES
+	. = ALIGN(PMD_SIZE);
+#else
+	. = ALIGN(CONT_PTE_SIZE);
+#endif
+#endif
 	.text : ALIGN(SEGMENT_ALIGN) {	/* Real text segment		*/
 		_stext = .;		/* Text and read-only data	*/
 			IRQENTRY_TEXT
@@ -207,10 +214,25 @@ SECTIONS
 	}
 
 	. = ALIGN(SEGMENT_ALIGN);
+#ifdef CONFIG_KERNEL_REPLICATION
+#ifdef CONFIG_ARM64_4K_PAGES
+	. = ALIGN(PMD_SIZE);
+#else
+	. = ALIGN(CONT_PTE_SIZE);
+#endif
+#endif
 	_etext = .;			/* End of text section */
 
 	/* everything from this point to __init_begin will be marked RO NX */
+#ifdef CONFIG_KERNEL_REPLICATION
+#ifdef CONFIG_ARM64_4K_PAGES
+	RO_DATA(PMD_SIZE)
+#else
+	RO_DATA(CONT_PTE_SIZE)
+#endif
+#else
 	RO_DATA(PAGE_SIZE)
+#endif
 
 	HYPERVISOR_RODATA_SECTIONS
 
-- 
2.34.1

