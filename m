Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE06C486624
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847890; cv=none; b=hBxWlsblcQ2gLLfB3MNFSHZVrxd7V/Y1g7vEd4ngetOK04Y0mEVXhMCSou8kQ9Hm8DgpoVJBM2DXfZu07OEsuc+9BMZdG0hF5cAAz22E9CKevRXHga7c6/7aV1fAc6gmyhX7ps2LaV8EmKiXyKvIAZ8dWCtN/upHZXQaOluOBUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847890; c=relaxed/simple;
	bh=Fucb+sl9nfCsiqQfaI/j3sVJ9rSyNnuwL/cuXtatQmY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a0+XZRGAXm6rHLqBydq/n25OJsKPwgKWNzdRGxkE44wOAD1D5lHfC1/8lw203Mq6ZQJSwvtfPzySG/CwqvP3c8PCZaN0yWmTosyNCpPDs2CYrAUeG97h4LRzzU5wANRvjr4h6SSEyGfbfqg+OiTSu0LaAFAzBuvIiEJwsayWBfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=wtbL8sbN; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="wtbL8sbN"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uOTDgBkjYJFHvNQbfBQWTD/6fFe89tZAtGOjlb0y990=;
	b=wtbL8sbN6tNfhYL36YDbdr/ivXINVqVkk90pUmq92rN8cLBL20/oYfcOC+UfURGULymSn/Yf1
	u0XqUbwXc5kYu2UuEba9a35jtyCNeRQF9KydgYEbxyPLIDONF88jLBvoo555mEitZA4/pudQ3PI
	/DPolqoyPJU9gC8IkMbs54k=
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KF1XKkzHnH5S;
	Fri, 28 Aug 2026 00:24:01 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 3ACEA4058E;
	Fri, 28 Aug 2026 00:24:37 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:36 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 11/18] mm: enable per-NUMA node kernel text and rodata replication
Date: Fri, 28 Aug 2026 00:11:51 +0800
Message-ID: <20260827161158.3618409-12-panov.nikita@huawei.com>
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
 arch/arm64/mm/context.c |  1 -
 arch/arm64/mm/mmu.c     |  8 ++++++--
 include/linux/mm.h      |  3 +++
 init/main.c             | 17 +++++++++++++++++
 mm/mm_init.c            |  3 +++
 5 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 3afdae62784e..0f4a28b87469 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -11,7 +11,6 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
-#include <linux/numa_kernel_replication.h>
 
 #include <asm/cpufeature.h>
 #include <asm/mmu_context.h>
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index fa12461c0d8e..4bc8b748e303 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1040,10 +1040,10 @@ void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 				 pgd_pgtable_alloc_special_mm, flags);
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
 static void populate_mappings_prot(phys_addr_t phys, unsigned long virt,
 				   phys_addr_t size, pgprot_t prot)
 {
-#ifdef CONFIG_KERNEL_REPLICATION
 	int nid;
 
 	for_each_memory_node(nid) {
@@ -1051,10 +1051,14 @@ static void populate_mappings_prot(phys_addr_t phys, unsigned long virt,
 			page_to_phys(walk_to_page_node(nid, (void *)virt)),
 			virt, size, prot, NULL, 0);
 	}
+}
 #else
+static void populate_mappings_prot(phys_addr_t phys, unsigned long virt,
+				   phys_addr_t size, pgprot_t prot)
+{
 	early_create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL, 0);
-#endif /* CONFIG_KERNEL_REPLICATION */
 }
+#endif /* CONFIG_KERNEL_REPLICATION */
 
 static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
 				phys_addr_t size, pgprot_t prot)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8a7083c02203..0f3592038823 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4240,6 +4240,9 @@ extern int __meminit early_pfn_to_nid(unsigned long pfn);
 #endif
 
 extern void mem_init(void);
+#ifdef CONFIG_KERNEL_REPLICATION
+extern void preallocate_vmalloc_pages(void);
+#endif
 extern void __init mmap_init(void);
 
 extern void __show_mem(unsigned int flags, const nodemask_t *nodemask, int max_zone_idx);
diff --git a/init/main.c b/init/main.c
index d9d936707c19..249307e46818 100644
--- a/init/main.c
+++ b/init/main.c
@@ -109,6 +109,7 @@
 #include <linux/unaligned.h>
 #include <linux/vdso_datastore.h>
 #include <linux/hazptr.h>
+#include <linux/numa_kernel_replication.h>
 #include <net/net_namespace.h>
 
 #include <asm/io.h>
@@ -1038,12 +1039,20 @@ void start_kernel(void)
 	 * These use large bootmem allocations and must precede
 	 * initalization of page allocator
 	 */
+	numa_replication_init();
 	setup_log_buf(0);
 	vfs_caches_init_early();
 	sort_main_extable();
 	trap_init();
 	mm_core_init();
 	maple_tree_init();
+	/*
+	 * Kernel text replication should be done before
+	 * alloc/init first mm struct, due to it is necessary
+	 * to setup per-NUMA node translation tables and kernel
+	 * instances properly.
+	 */
+	numa_replicate_kernel_text();
 	poking_init();
 	ftrace_init();
 
@@ -1571,6 +1580,14 @@ static int __ref kernel_init(void *unused)
 	free_initmem();
 	mark_readonly();
 
+	/*
+	 * RODATA replication is done here due to
+	 * it is necessary to finalize the kernel
+	 * and modules initialization before
+	 */
+	numa_replicate_kernel_rodata();
+	numa_replication_fini();
+
 	/*
 	 * Kernel mappings are now finalized - update the userspace page-table
 	 * to finalize PTI.
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1533aebafb68..d2b13d8887c8 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2679,6 +2679,9 @@ void __init mm_core_init(void)
 	ptlock_cache_init();
 	pgtable_cache_init();
 	debug_objects_mem_init();
+#ifdef CONFIG_KERNEL_REPLICATION
+	preallocate_vmalloc_pages();
+#endif
 	vmalloc_init();
 	/* If no deferred init page_ext now, as vmap is fully initialized */
 	if (!deferred_struct_pages)
-- 
2.34.1

