Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB430483BFF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847890; cv=none; b=G0ErVpK/+sm3sGMzCsXnDBnB3HCcSh/Up1W1uYCPwtqU5z9zgdfTH8vY6byiHnY5R2wJ9zOWJfFBYv+6y9iNvht1KmsIXcUu/VOSkhAuR1KNrTesPNTrFR4AL5ypAYXkb4yrX50JfWC0nhGgXl9b1XE51nW8oy+Rt+yLcWGlLzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847890; c=relaxed/simple;
	bh=5ciELrr8Kk3fh+UFlH1sxexZsIYTzsnitGwn4d2bgZs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLsR1j6OBRyQ0yWxxjcDeM5a6Ih5cQLq0+55Dd1YUdO2LzxfsULN8cGa1jRnXrhxMF2favAQjX81ud3gAm/7jYah/HzYA2tAA4WfCWP4wc4VvuXsaaMSw+IOmY+L+SwOlm8Az2Hsbqz3uTCXcOqEvZxll1IDgoavGhRsxLraa48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=EywF5R3E; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="EywF5R3E"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CEcX3HXLMzVOuLicTphBIj/R1Bu+Rm00Soec5tDKcys=;
	b=EywF5R3EdvPAq5zPDcW+XuVFbk1/bBUity+jgaldkQtH15J6yMmiQLRhCnW/+p3b8uDcX0TO1
	Ax6VCwo0moAgqjpzspUqI4gkuwNmyv2ejH8HJreRveH306WGRUQxS41RlGX/9zjTKTQij6rPkqD
	t9bp17Vo0C1A4fOiICCfyes=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KD2c0vzHnH3v;
	Fri, 28 Aug 2026 00:24:00 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EC9B40570;
	Fri, 28 Aug 2026 00:24:36 +0800 (CST)
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
Subject: [RFC PATCH 04/18] arm64: add arch callbacks for kernel replication
Date: Fri, 28 Aug 2026 00:11:44 +0800
Message-ID: <20260827161158.3618409-5-panov.nikita@huawei.com>
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

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 arch/arm64/include/asm/numa_replication.h | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 arch/arm64/include/asm/numa_replication.h

diff --git a/arch/arm64/include/asm/numa_replication.h b/arch/arm64/include/asm/numa_replication.h
new file mode 100644
index 000000000000..441a399f9c51
--- /dev/null
+++ b/arch/arm64/include/asm/numa_replication.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_NUMA_REPLICATION_H
+#define __ASM_NUMA_REPLICATION_H
+
+#ifdef CONFIG_KERNEL_REPLICATION
+#include <asm/pgtable.h>
+#include <asm/tlbflush.h>
+#include <asm/pgalloc.h>
+#include <asm/memory.h>
+#include <asm/mmu_context.h>
+#include <linux/mm.h>
+#include <linux/seq_file.h>
+
+#define PAGE_TABLE_REPLICATION_LEFT  ((max((u64)_end - SZ_2G, (u64)MODULES_VADDR)) & PGDIR_MASK)
+#define PAGE_TABLE_REPLICATION_RIGHT ((((u64)_end + SZ_2G) & PGDIR_MASK) + PGDIR_SIZE - 1)
+
+static inline pgd_t *numa_replicate_pgt_pgd(int nid)
+{
+	pgd_t *new_pgd;
+	struct page *pgd_page;
+
+	pgd_page = alloc_pages_node_noprof(nid, GFP_PGTABLE_KERNEL, 2);
+	BUG_ON(pgd_page == NULL);
+
+	new_pgd = (pgd_t *)page_address(pgd_page);
+	new_pgd += (PAGE_SIZE * 2 / sizeof(pgd_t)); //Extra pages for KPTI
+	copy_page(new_pgd, swapper_pg_dir);
+
+	return new_pgd;
+}
+
+static inline void numa_load_replicated_pgd(pgd_t *pgd)
+{
+	cpu_replace_ttbr1(pgd);
+	local_flush_tlb_all();
+}
+
+static inline ssize_t numa_cpu_dump(struct seq_file *m)
+{
+	seq_printf(m, "NODE: #%02d, CPU: #%04d, ttbr1_el1: 0x%p, COMM: %s\n",
+		numa_node_id(),
+		smp_processor_id(),
+		(void *)read_sysreg(ttbr1_el1),
+		current->group_leader->comm);
+	return 0;
+}
+
+static inline void numa_sync_text_replicas(unsigned long start, unsigned long end)
+{
+	caches_clean_inval_pou(start, end);
+	icache_inval_all_pou();
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+#endif /* __ASM_NUMA_REPLICATION_H */
-- 
2.34.1

