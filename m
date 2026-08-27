Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB10F46EF87
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847891; cv=none; b=N8QMUhpE0zyggoDpsvimLOUgqcamWJzizxTsUoqOs6spqehckEhI2mkIXdEfsqCAUqTFjllB8JAhUwv8L+hMEOuj9s0A+LTTJaWisJUK/GS5aNzbk7oRIqZniG9vF4gpx4t/dsbBJzzKDEBVfL58/vhhAsqHbL0IBWDjXeeggSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847891; c=relaxed/simple;
	bh=myF9nUyNOrWsUYnQdiGqU/xU6L1O7Ec2QLtHgUSVHAg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bqxjthVUZR5VzLiKRBU/uAZlf5aA1WT35Kfkl6MG0MiTWvTNK27Wvifa/9uJ/5jGtfL/eA9/LhHuXdJYTbIXjNkQVZqgrnQ4cbwTl7ZA1NTmEHVOhpfXDE1KnELXtEvEz4OR36oYi+BLfuOl49psCLu1gOVFtSfnvrNdGJqiEmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=2vyssauP; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="2vyssauP"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0XCpW5x2XMrFIuKJOAuq9yTaq6svDVv7iaV8fimo4Ec=;
	b=2vyssauPjk6VH8NkuDtsmgc01fHaaBh+AtFJ/Uqy3Y/Sa9M7GMOXeYlq1BQeRxV30kfBCpukO
	aMdlH6P3npTN9LuNOspLX8cWn5Uv/RvSNrfupyVFQsqRJwdII4pIuru0XhMYJ11TzAw98l9nLaf
	/Qp+Oy7j5GjC6AjtS3uPEg4=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KV6Vk9zJ46Yq;
	Fri, 28 Aug 2026 00:24:14 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 7396940572;
	Fri, 28 Aug 2026 00:24:36 +0800 (CST)
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
Subject: [RFC PATCH 05/18] mm: per-NUMA node replication core infrastructure
Date: Fri, 28 Aug 2026 00:11:45 +0800
Message-ID: <20260827161158.3618409-6-panov.nikita@huawei.com>
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

In current design mutable kernel data modifications don't require
synchronization between translation tables due to on 64-bit platforms
all physical memory already mapped in kernel space and this mapping
is persistent.
No need to synchronize userspace at all. Due to separate ttbrs for
userspace and kernel are used

TT overview:
                   NODE 0                   NODE 1
              USER      KERNEL         USER      KERNEL
           ---------------------    ---------------------
     PGD   | | | | |   | | | |*|    | | | | |   | | | |*|
           ---------------------    ---------------------
                              |                        |
            -------------------      -------------------
            |                        |
           ---------------------    ---------------------
     PUD   | | | | |   | | |*|*|    | | | | |   | | |*|*|
           ---------------------    ---------------------
                              |                        |
            -------------------      -------------------
            |                        |
           ---------------------    ---------------------
     PMD   |READ-ONLY|MUTABLE  |    |READ-ONLY|MUTABLE  |
           ---------------------    ---------------------
                  |       |                  |     |
                  |       --------------------------
                  |               |          |
                --------       -------      --------
   PHYS         |      |       |     |      |      |
    MEM         --------       -------      --------
                <------>                    <------>
                 NODE 0        Shared        NODE 1
                               between
                               nodes
* - entries unique in each table

Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Co-developed-by: Artem Kuzin <artem.kuzin@huawei.com>
Signed-off-by: Artem Kuzin <artem.kuzin@huawei.com>
Co-developed-by: Nikita Panov <panov.nikita@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 include/linux/mm_types.h                |   3 +
 include/linux/numa_kernel_replication.h |  89 +++
 mm/Makefile                             |   2 +
 mm/numa_kernel_replication.c            | 740 ++++++++++++++++++++++++
 4 files changed, 834 insertions(+)
 create mode 100644 include/linux/numa_kernel_replication.h
 create mode 100644 mm/numa_kernel_replication.c

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6d815f6440c9..06c42b7918a5 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1419,6 +1419,9 @@ struct mm_struct {
 #ifdef CONFIG_MM_ID
 		mm_id_t mm_id;
 #endif /* CONFIG_MM_ID */
+#ifdef CONFIG_KERNEL_REPLICATION
+	pgd_t **pgd_numa;
+#endif
 	} __randomize_layout;
 
 	/*
diff --git a/include/linux/numa_kernel_replication.h b/include/linux/numa_kernel_replication.h
new file mode 100644
index 000000000000..34aa063d42e6
--- /dev/null
+++ b/include/linux/numa_kernel_replication.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _LINUX_NUMA_REPLICATION_H
+#define _LINUX_NUMA_REPLICATION_H
+
+#ifdef CONFIG_KERNEL_REPLICATION
+
+#include <linux/mm_types.h>
+#include <linux/nodemask.h>
+#include <linux/module.h>
+#include <linux/mm.h>
+
+#include <asm/numa_replication.h>
+
+extern nodemask_t replica_nodes;
+
+#define for_each_memory_node(nid)			\
+	for (nid = first_node(replica_nodes);		\
+	     nid != MAX_NUMNODES;			\
+	     nid = next_node(nid, replica_nodes))
+
+#define this_node_pgd(mm) ((mm)->pgd_numa[numa_node_id()])
+#define per_node_pgd(mm, nid) ((mm)->pgd_numa[nid])
+
+static inline bool numa_addr_has_replica(const void *addr)
+{
+	return ((unsigned long)addr >= PAGE_TABLE_REPLICATION_LEFT) &&
+		((unsigned long)addr <= PAGE_TABLE_REPLICATION_RIGHT);
+}
+
+void __init numa_replication_init(void);
+void __init numa_replicate_kernel_text(void);
+void numa_replicate_kernel_rodata(void);
+void numa_replication_fini(void);
+
+void numa_setup_pgd(void);
+void __init_or_module *numa_get_replica(void *vaddr, int nid);
+int numa_get_memory_node(int nid);
+void dump_mm_pgtables(struct mm_struct *mm,
+		      unsigned long start, unsigned long end);
+
+#else
+
+#include <linux/mm.h>
+
+#define this_node_pgd(mm) ((mm)->pgd)
+#define per_node_pgd(mm, nid) ((mm)->pgd)
+
+static inline void numa_setup_pgd(void)
+{
+}
+
+static inline void __init numa_replication_init(void)
+{
+}
+
+static inline void __init numa_replicate_kernel_text(void)
+{
+}
+
+static inline void numa_replicate_kernel_rodata(void)
+{
+}
+
+static inline void numa_replication_fini(void)
+{
+}
+
+static inline bool numa_addr_has_replica(const void *addr)
+{
+	return false;
+}
+
+static inline bool is_text_replicated(void)
+{
+	return false;
+}
+
+static inline void *numa_get_replica(void *vaddr, int nid)
+{
+	return lm_alias(vaddr);
+}
+
+static inline void dump_mm_pgtables(struct mm_struct *mm,
+				    unsigned long start, unsigned long end)
+{
+}
+
+#endif /*CONFIG_KERNEL_REPLICATION*/
+#endif /*_LINUX_NUMA_REPLICATION_H*/
diff --git a/mm/Makefile b/mm/Makefile
index e7245cb88c66..e2bbc04a48d3 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -148,3 +148,5 @@ obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
 obj-$(CONFIG_MEM_ALLOC_PROFILING) += alloc_tag.o
+obj-$(CONFIG_KERNEL_REPLICATION) += numa_kernel_replication.o
+
diff --git a/mm/numa_kernel_replication.c b/mm/numa_kernel_replication.c
new file mode 100644
index 000000000000..082aabc6b8bc
--- /dev/null
+++ b/mm/numa_kernel_replication.c
@@ -0,0 +1,740 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/kernel.h>
+#include <linux/pagewalk.h>
+#include <linux/numa_kernel_replication.h>
+#include <linux/memblock.h>
+#include <linux/pgtable.h>
+#include <linux/hugetlb.h>
+#include <linux/kobject.h>
+#include <linux/debugfs.h>
+
+#include <asm/sections.h>
+#include <asm/tlbflush.h>
+#include <asm/mmu_context.h>
+
+#define KERNEL_TEXT_START	((unsigned long)&_stext)
+#define KERNEL_TEXT_END		((unsigned long)&_etext)
+
+#define KERNEL_RODATA_START ((unsigned long)&__start_rodata)
+#define KERNEL_RODATA_END ((unsigned long)&__end_rodata)
+
+#define PMD_ALLOC_ORDER		(PMD_SHIFT-PAGE_SHIFT)
+#define PAGES_PER_PMD		(1 << PMD_ALLOC_ORDER)
+
+#define replication_log(data, fmt, args...)		\
+({							\
+	if (data && data->m)				\
+		seq_printf(data->m, fmt, ##args);	\
+	else						\
+		pr_info(KERN_CONT fmt, ##args);		\
+})
+
+struct numa_node_desc {
+	pgd_t *pgd;
+	void *text_vaddr;
+	void *rodata_vaddr;
+};
+
+static struct numa_node_desc __initdata_or_module node_desc[MAX_NUMNODES];
+
+struct dump_data {
+	struct seq_file *m;
+};
+
+struct dump_config {
+	int pgd_extra_info:1;
+	int p4d_extra_info:1;
+	int pud_extra_info:1;
+	int pmd_extra_info:1;
+	int pte_extra_info:1;
+	struct dump_data *data;
+};
+
+static bool text_replicated;
+/*
+ * The first ready NUMA node, used as a source node
+ * for kernel text and rodata replication
+ */
+static unsigned int master_node = INT_MAX;
+/*
+ * The case when machine has memoryless nodes is rare
+ * but possible. To handle memoryless nodes properly
+ * kernel replication maintains mapping node -> node with memory
+ * for all NUMA nodes.
+ */
+static int node_to_memory_node[MAX_NUMNODES];
+
+static bool pgtables_extra;
+static DEFINE_SPINLOCK(debugfs_lock);
+
+bool is_text_replicated(void)
+{
+	return text_replicated;
+}
+
+static void binary_dump(struct dump_data *data, unsigned long value)
+{
+	int i;
+
+	for (i = BITS_PER_LONG - 1; i >= 0; i--) {
+		if ((BITS_PER_LONG - 1 - i) % BITS_PER_BYTE == 0)
+			replication_log(data, "%-9d", i);
+	}
+	replication_log(data, "%d\n", 0);
+
+	for (i = BITS_PER_LONG - 1; i >= 0; i--) {
+		if ((BITS_PER_LONG - 1 - i) % BITS_PER_BYTE == 0)
+			replication_log(data, "|");
+
+		replication_log(data, "%d", (1UL << i) & value ? 1 : 0);
+	}
+	replication_log(data, "|\n");
+}
+
+static int pgd_callback(pgd_t *pgd,
+			unsigned long addr, unsigned long next,
+			struct mm_walk *walk)
+{
+	unsigned long val = pgd_val(*pgd);
+	struct dump_config *c = (struct dump_config *)walk->private;
+
+	if (!val)
+		return 0;
+
+	addr = addr & PGDIR_MASK;
+	next = (addr & PGDIR_MASK) - 1 + PGDIR_SIZE;
+
+	replication_log(c->data,
+			"PGD ADDR: 0x%p PGD VAL: 0x%016lx [%p --- %p]\n",
+			pgd, val, (void *)addr, (void *)next);
+
+	if (c->pgd_extra_info)
+		binary_dump(c->data, val);
+
+	return 0;
+}
+
+static int p4d_callback(p4d_t *p4d,
+			unsigned long addr, unsigned long next,
+			struct mm_walk *walk)
+{
+	unsigned long val = p4d_val(*p4d);
+	struct dump_config *c = (struct dump_config *)walk->private;
+
+	if (!val)
+		return 0;
+
+	addr = addr & P4D_MASK;
+	next = (addr & P4D_MASK) - 1 + P4D_SIZE;
+
+	replication_log(c->data,
+			"P4D ADDR: 0x%p P4D VAL: 0x%016lx [%p --- %p]\n",
+			p4d, val, (void *)addr, (void *)next);
+
+	if (c->p4d_extra_info)
+		binary_dump(c->data, val);
+
+	return 0;
+}
+
+static int pud_callback(pud_t *pud,
+			unsigned long addr, unsigned long next,
+			struct mm_walk *walk)
+{
+	unsigned long val = pud_val(*pud);
+	struct dump_config *c = (struct dump_config *)walk->private;
+
+	if (!val)
+		return 0;
+
+	addr = addr & PUD_MASK;
+	next = (addr & PUD_MASK) - 1 + PUD_SIZE;
+
+	replication_log(c->data,
+		"PUD ADDR: 0x%p PUD VAL: 0x%016lx huge(%d) [%p --- %p]\n",
+		pud, val, !pud_table(*pud), (void *)addr, (void *)next);
+
+	if (c->pud_extra_info)
+		binary_dump(c->data, val);
+
+	return 0;
+}
+
+static int pmd_callback(pmd_t *pmd,
+			unsigned long addr, unsigned long next,
+			struct mm_walk *walk)
+{
+	unsigned long val = pmd_val(*pmd);
+	unsigned long paddr = pmd_pfn(*pmd) << PAGE_SHIFT;
+	struct dump_config *c = (struct dump_config *)walk->private;
+
+	if (!val)
+		return 0;
+
+	addr = addr & PMD_MASK;
+	next = (addr & PMD_MASK) - 1 + PMD_SIZE;
+
+	replication_log(c->data,
+		"PMD ADDR: 0x%p PMD VAL: 0x%016lx huge(%d) [%p --- %p] to %p\n",
+		pmd, val, !pmd_table(*pmd), (void *)addr, (void *)next, (void *)paddr);
+
+	if (c->pmd_extra_info)
+		binary_dump(c->data, val);
+
+	return 0;
+}
+
+static int pte_callback(pte_t *pte,
+			unsigned long addr, unsigned long next,
+			struct mm_walk *walk)
+{
+	unsigned long val = pte_val(*pte);
+	unsigned long paddr = pte_pfn(*pte) << PAGE_SHIFT;
+	struct dump_config *c = (struct dump_config *)walk->private;
+
+	if (!val)
+		return 0;
+
+	addr = addr & PAGE_MASK;
+	next = (addr & PAGE_MASK) - 1 + PAGE_SIZE;
+
+	replication_log(c->data,
+		"PTE ADDR: 0x%p PTE VAL: 0x%016lx [%p --- %p] to %p\n",
+		pte, val, (void *)addr, (void *)next, (void *)paddr);
+
+	if (c->pte_extra_info)
+		binary_dump(c->data, val);
+
+	return 0;
+}
+
+static int pte_hole_callback(unsigned long addr, unsigned long next,
+			     int depth, struct mm_walk *walk)
+{
+	struct dump_config *c = (struct dump_config *)walk->private;
+
+	replication_log(c->data, "%*chole\n", depth * 2, ' ');
+
+	return 0;
+}
+
+static void dump_pgtables(struct mm_struct *mm,
+			  struct dump_data *data,
+			  unsigned long start, unsigned long end)
+{
+	int nid = 0;
+	int extra = pgtables_extra ? 1 : 0;
+	bool locked = false;
+	struct dump_config conf = {
+		.pgd_extra_info = extra,
+		.p4d_extra_info = extra,
+		.pud_extra_info = extra,
+		.pmd_extra_info = extra,
+		.pte_extra_info = extra,
+		.data = data,
+	};
+
+	const struct mm_walk_ops ops = {
+		.pgd_entry = pgd_callback,
+		.p4d_entry = p4d_callback,
+		.pud_entry = pud_callback,
+		.pmd_entry = pmd_callback,
+		.pte_entry = pte_callback,
+		.pte_hole  = pte_hole_callback
+	};
+
+	BUG_ON(data && data->m == NULL);
+
+	start = start & PAGE_MASK;
+	end = (end & PAGE_MASK) - 1 + PAGE_SIZE;
+
+	replication_log(data,
+			"----PER-NUMA NODE KERNEL REPLICATION ENABLED----\n");
+
+	if (rwsem_is_locked(&mm->mmap_lock))
+		locked = true;
+	else
+		mmap_read_lock(mm);
+
+	for_each_memory_node(nid) {
+		replication_log(data, "NUMA node id #%d\n", nid);
+		replication_log(data, "PGD: %p  PGD phys: %p\n",
+			mm->pgd_numa[nid], (void *)virt_to_phys(mm->pgd_numa[nid]));
+		walk_kernel_page_table_range(start, end, &ops, mm->pgd_numa[nid], &conf);
+	}
+
+	if (!locked)
+		mmap_read_unlock(mm);
+
+	replication_log(data,
+			"----PER-NUMA NODE KERNEL REPLICATION ENABLED----\n");
+}
+
+static void dump_kernel_pgtables(struct dump_data *data,
+				 unsigned long start, unsigned long end)
+{
+	dump_pgtables(&init_mm, data, start, end);
+}
+
+void dump_mm_pgtables(struct mm_struct *mm,
+		      unsigned long start, unsigned long end)
+{
+	dump_pgtables(mm, NULL, start, end);
+}
+
+static void cpu_dump(void *info)
+{
+	struct dump_data *data = (struct dump_data *)info;
+
+	spin_lock(&debugfs_lock);
+	numa_cpu_dump(data->m);
+	spin_unlock(&debugfs_lock);
+}
+
+static int stats_show(struct seq_file *m, void *v)
+{
+	int cpu;
+	struct dump_data data = {
+		.m = m,
+	};
+
+	for_each_online_cpu(cpu)
+		smp_call_function_single(cpu, cpu_dump, &data, 1);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(stats);
+
+static int pgtables_show(struct seq_file *m, void *v)
+{
+	struct dump_data data = {
+		.m = m,
+	};
+
+	dump_kernel_pgtables(&data,
+			KERNEL_TEXT_START, KERNEL_RODATA_END - 1);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(pgtables);
+
+static void debugfs_init(void)
+{
+	struct dentry *dir;
+	static struct dentry *debugfs_dir;
+
+	debugfs_dir = debugfs_create_dir("numa_replication", NULL);
+	if (IS_ERR(debugfs_dir)) {
+		pr_err("Failed to create debugfs entry for NUMA"
+			" replication: %ld\n",
+			PTR_ERR(debugfs_dir));
+		return;
+	}
+	dir = debugfs_create_file("stats", 0400, debugfs_dir,
+				  NULL, &stats_fops);
+	if (IS_ERR(dir)) {
+		pr_err("Failed to create debugfs entry for NUMA"
+			" replication stats: %ld\n",
+			PTR_ERR(dir));
+		return;
+	}
+
+	dir = debugfs_create_file("pgtables_kernel", 0400, debugfs_dir,
+				  NULL, &pgtables_fops);
+	if (IS_ERR(dir)) {
+		pr_err("Failed to create debugfs entry for NUMA"
+			" replication pgtables: %ld\n",
+			PTR_ERR(dir));
+		return;
+	}
+
+	debugfs_create_bool("pgtables_kernel_extra", 0600, debugfs_dir,
+			    &pgtables_extra);
+}
+
+/*
+ * The case, when machine has memoryless NUMA nodes
+ * should be handled in a special way. To do this we
+ * create node<->memory mapping to have an information
+ * about the node with memory that memoryless node can use.
+ */
+static void init_node_to_memory_mapping(void)
+{
+	int nid;
+
+	for_each_online_node(nid) {
+		int memory_nid;
+		int min_dist = INT_MAX;
+
+		node_to_memory_node[nid] = nid;
+		for_each_memory_node(memory_nid) {
+			int dist = node_distance(nid, memory_nid);
+
+			if (dist < min_dist) {
+				min_dist = dist;
+				node_to_memory_node[nid] = memory_nid;
+			}
+		}
+		pr_info("For node %d memory is on the node - %d\n",
+			nid, node_to_memory_node[nid]);
+	}
+}
+
+int numa_get_memory_node(int nid)
+{
+	return node_to_memory_node[nid];
+}
+
+/*
+ * The function creates replica of particular memory area
+ * and install replicated memory in translation table of
+ * required NUMA node.
+ */
+static void replicate_memory(void *dst, unsigned long start, unsigned long end, int nid)
+{
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+	pgprot_t prot;
+	unsigned int offset_in_pages = 0;
+	unsigned long vaddr = start;
+	struct page *pages = virt_to_page(dst);
+
+	memcpy(dst, lm_alias(start), end - start);
+	while (vaddr < end) {
+		pgd = pgd_offset_pgd(node_desc[nid].pgd, vaddr);
+		p4d = p4d_offset(pgd, vaddr);
+		pud = pud_offset(p4d, vaddr);
+		pmd = pmd_offset(pud, vaddr);
+
+		if (pmd_leaf(*pmd)) {
+			prot = pmd_pgprot(*pmd);
+
+			set_pmd(pmd, pfn_pmd(page_to_pfn(pages) + offset_in_pages, prot));
+			offset_in_pages += PAGES_PER_PMD;
+			vaddr += PMD_SIZE;
+			continue;
+		}
+		pte = pte_offset_kernel(pmd, vaddr);
+		prot = pte_pgprot(*pte);
+		__set_pte(pte, pfn_pte(page_to_pfn(pages) + offset_in_pages, prot));
+		offset_in_pages++;
+		vaddr += PAGE_SIZE;
+	}
+}
+
+static void __init replicate_kernel_text(int nid)
+{
+	replicate_memory(node_desc[nid].text_vaddr,
+			 KERNEL_TEXT_START, KERNEL_TEXT_END, nid);
+	numa_sync_text_replicas((unsigned long)node_desc[nid].text_vaddr,
+		(unsigned long)node_desc[nid].text_vaddr + (KERNEL_TEXT_END - KERNEL_TEXT_START));
+}
+
+static void replicate_kernel_rodata(int nid)
+{
+	replicate_memory(node_desc[nid].rodata_vaddr,
+			 KERNEL_RODATA_START, KERNEL_RODATA_END, nid);
+}
+
+//'-1' in next functions have only one purpose - prevent unsgined long overflow
+static void replicate_pgt_pte(pud_t *dst, pud_t *src,
+			      unsigned long start, unsigned long end,
+			      unsigned int nid)
+{
+	unsigned long left = start & PMD_MASK;
+	unsigned long right = (end & PMD_MASK) - 1 + PMD_SIZE;
+	unsigned long addr;
+
+	pmd_t *clone_pmd = pmd_offset(dst, left);
+	pmd_t *orig_pmd = pmd_offset(src, left);
+
+	for (addr = left;
+			(addr >= left && addr < right); addr += PMD_SIZE) {
+		pgtable_t new_pte;
+
+		if (pmd_none(*orig_pmd) || !pmd_table(*orig_pmd)  ||
+				pmd_val(*orig_pmd) == 0)
+			goto skip;
+
+		pmd_clear(clone_pmd);
+		new_pte = pte_alloc_one_node(nid, &init_mm);
+		pmd_populate_kernel(&init_mm, clone_pmd, page_to_virt(new_pte));
+		BUG_ON(new_pte == NULL);
+
+		copy_page(page_to_virt(pmd_pgtable(*clone_pmd)),
+				       page_to_virt(pmd_pgtable(*orig_pmd)));
+skip:
+		clone_pmd++;
+		orig_pmd++;
+	}
+}
+
+//'-1' in next functions have only one purpose - prevent unsgined long overflow
+static void replicate_pgt_pmd(p4d_t *dst, p4d_t *src,
+			      unsigned long start, unsigned long end,
+			      unsigned int nid)
+{
+	unsigned long left = start & PUD_MASK;
+	unsigned long right = (end & PUD_MASK) - 1 + PUD_SIZE;
+
+	pud_t *clone_pud = pud_offset(dst, left);
+	pud_t *orig_pud = pud_offset(src, left);
+
+	for (unsigned long addr = left;
+			(addr >= left && addr < right); addr += PUD_SIZE) {
+		pmd_t *new_pmd;
+
+		if (pud_none(*orig_pud) || !pud_table(*orig_pud)  ||
+				pud_val(*orig_pud) == 0)
+			goto skip;
+
+		pud_clear(clone_pud);
+		new_pmd = pmd_alloc_node(nid, &init_mm, clone_pud, addr);
+		BUG_ON(new_pmd == NULL);
+
+		copy_page(pud_pgtable(*clone_pud), pud_pgtable(*orig_pud));
+
+		replicate_pgt_pte(clone_pud, orig_pud, max(addr, start),
+				  min(addr - 1 + PUD_SIZE, end), nid);
+skip:
+		clone_pud++;
+		orig_pud++;
+	}
+}
+
+static void replicate_pgt_pud(pgd_t *dst, pgd_t *src,
+			      unsigned long start, unsigned long end,
+			      unsigned int nid)
+{
+	unsigned long left = start & P4D_MASK;
+	unsigned long right = (end & P4D_MASK) - 1 + P4D_SIZE;
+
+	p4d_t *clone_p4d = p4d_offset(dst, left);
+	p4d_t *orig_p4d = p4d_offset(src, left);
+
+	for (unsigned long addr = left;
+			(addr >= left && addr < right); addr += P4D_SIZE) {
+		pud_t *new_pud;
+
+		if (p4d_none(*orig_p4d) || p4d_val(*orig_p4d) == 0)
+			goto skip;
+
+		p4d_clear(clone_p4d);
+		new_pud = pud_alloc_node(nid, &init_mm, clone_p4d, addr);
+		BUG_ON(new_pud == NULL);
+
+		copy_page(p4d_pgtable(*clone_p4d), p4d_pgtable(*orig_p4d));
+		/*
+		 * start and end passed to the next function must be in
+		 * range of p4ds, so min and max are used here
+		 */
+		replicate_pgt_pmd(clone_p4d, orig_p4d, max(addr, start),
+				  min(addr - 1 + P4D_SIZE, end), nid);
+skip:
+		clone_p4d++;
+		orig_p4d++;
+	}
+}
+
+static void replicate_pgt_p4d(pgd_t *dst, pgd_t *src,
+			      unsigned long start, unsigned long end,
+			      unsigned int nid)
+{
+	unsigned long left = start & PGDIR_MASK;
+	unsigned long right = (end & PGDIR_MASK) - 1 + PGDIR_SIZE;
+
+	pgd_t *clone_pgd = pgd_offset_pgd(dst, left);
+	pgd_t *orig_pgd = pgd_offset_pgd(src, left);
+
+	for (unsigned long addr = left;
+			(addr >= left && addr < right); addr += PGDIR_SIZE) {
+		p4d_t *new_p4d;
+
+		/* TODO: remove last condition and do something better
+		 * In the case of a folded P4D level, pgd_none and pgd_huge
+		 * always return 0, so we might start to replicate empty entries.
+		 * We obviously want to avoid this, so the last check is performed here.
+		 */
+		if (pgd_none(*orig_pgd) || pgd_val(*orig_pgd) == 0)
+			goto skip;
+
+		pgd_clear(clone_pgd);
+		new_p4d = p4d_alloc_node(nid, &init_mm, clone_pgd, addr);
+		BUG_ON(new_p4d == NULL);
+
+		copy_page((void *)pgd_page_vaddr(*clone_pgd),
+				(void *)pgd_page_vaddr(*orig_pgd));
+		replicate_pgt_pud(clone_pgd, orig_pgd, max(addr, start),
+				  min(addr - 1 + PGDIR_SIZE, end), nid);
+skip:
+		clone_pgd++;
+		orig_pgd++;
+	}
+}
+
+static void replicate_pgt(int nid, unsigned long start, unsigned long end)
+{
+	replicate_pgt_p4d(node_desc[nid].pgd, init_mm.pgd, start, end, nid);
+}
+
+/*
+ * Page tables replication works in a way when first
+ * pgd level replicated and then the replication of the
+ * left part if done. The only part of pagetable that
+ * contains text and rodata is replicated. Obviously a
+ * part of upper layer entries of page table should be
+ * replicated too. As result, the pgd, p4d, pud and pmd
+ * layers are touched by replication. In particular, the
+ * page table sub-tree that cover kernel text and rodata.
+ */
+static void replicate_pgtables(void)
+{
+	int nid;
+
+	init_mm.pgd_numa = (pgd_t **)kmalloc(sizeof(pgd_t *) * MAX_NUMNODES, GFP_PGTABLE_KERNEL);
+	BUG_ON(!init_mm.pgd_numa);
+
+	for_each_memory_node(nid) {
+		node_desc[nid].pgd = numa_replicate_pgt_pgd(nid);
+		replicate_pgt(nid, PAGE_TABLE_REPLICATION_LEFT,
+				   PAGE_TABLE_REPLICATION_RIGHT);
+	}
+
+	init_mm.pgd = node_desc[numa_get_memory_node(master_node)].pgd;
+
+	for_each_online_node(nid) {
+		int memory_nid = numa_get_memory_node(nid);
+
+		init_mm.pgd_numa[nid] = node_desc[memory_nid].pgd;
+	}
+}
+
+/*
+ * Kernel text replication includes two steps:
+ * 1. page tables replication for init_mm
+ * 2. kernel text pages replication and
+ *    corresponding page table update.
+ * 3. setup page table, related to
+ *    current NUMA node on current cpu,
+ *    for other NUMA cpus page tables will
+ *    be updated later, during cpu initialization.
+ * Master node - the first NUMA node, used as
+ * a source for replicas. Memory for master node
+ * is expected to be already local.
+ */
+void __init numa_replicate_kernel_text(void)
+{
+	int nid;
+
+	replicate_pgtables();
+
+	for_each_memory_node(nid) {
+		if (nid == master_node)
+			continue;
+		replicate_kernel_text(nid);
+	}
+
+	text_replicated = true;
+
+	numa_setup_pgd();
+}
+
+void numa_replicate_kernel_rodata(void)
+{
+	int nid;
+
+	for_each_memory_node(nid) {
+		if (nid == master_node)
+			continue;
+		replicate_kernel_rodata(nid);
+	}
+
+	flush_tlb_all();
+}
+
+void numa_setup_pgd(void)
+{
+	numa_load_replicated_pgd(init_mm.pgd_numa[numa_node_id()]);
+}
+
+void __init_or_module *numa_get_replica(void *vaddr, int nid)
+{
+	unsigned long addr = (unsigned long)vaddr;
+	unsigned long offset = addr - KERNEL_TEXT_START;
+
+	BUG_ON(addr < KERNEL_TEXT_START || addr >= KERNEL_TEXT_END);
+	BUG_ON(node_desc[nid].text_vaddr == NULL);
+	BUG_ON(numa_get_memory_node(nid) != nid);
+
+	return node_desc[nid].text_vaddr + offset;
+}
+
+nodemask_t __ro_after_init replica_nodes = { { [0] = 1UL } };
+
+void __init numa_replication_init(void)
+{
+	int nid;
+
+	unsigned long align = PAGE_SIZE;
+#ifdef CONFIG_ARM64_4K_PAGES
+	align = HPAGE_SIZE;
+#else
+	align = CONT_PTE_SIZE;
+#endif
+	nodes_clear(replica_nodes);
+
+	for_each_node_state(nid, N_MEMORY) {
+		__node_set(nid, &replica_nodes);
+	}
+
+	for_each_memory_node(nid)
+		pr_info("Memory node: %d\n", nid);
+
+	init_node_to_memory_mapping();
+	master_node = page_to_nid(virt_to_page(lm_alias((void *)KERNEL_TEXT_START)));
+
+	pr_info("Master Node: #%d\n", master_node);
+	for_each_memory_node(nid) {
+		if (nid == master_node) {
+			node_desc[nid].text_vaddr = lm_alias((void *)KERNEL_TEXT_START);
+			node_desc[nid].rodata_vaddr = lm_alias((void *)KERNEL_RODATA_START);
+		} else {
+			node_desc[nid].text_vaddr = memblock_alloc_try_nid(
+					(KERNEL_TEXT_END - KERNEL_TEXT_START),
+					align, 0, MEMBLOCK_ALLOC_ANYWHERE, nid);
+
+			node_desc[nid].rodata_vaddr = memblock_alloc_try_nid(
+					(KERNEL_RODATA_END - KERNEL_RODATA_START),
+					align, 0, MEMBLOCK_ALLOC_ANYWHERE, nid);
+		}
+
+		BUG_ON(node_desc[nid].text_vaddr == NULL);
+		BUG_ON(node_desc[nid].rodata_vaddr == NULL);
+	}
+}
+
+void numa_replication_fini(void)
+{
+	int nid;
+
+	/*
+	 * Clear addresses form linear space
+	 */
+	for_each_memory_node(nid) {
+		node_desc[nid].text_vaddr = NULL;
+		node_desc[nid].rodata_vaddr = NULL;
+	}
+
+	debugfs_init();
+
+	pr_info("Replicated page table : [%p --- %p]\n",
+			(void *)PAGE_TABLE_REPLICATION_LEFT,
+			(void *)PAGE_TABLE_REPLICATION_RIGHT);
+
+	dump_kernel_pgtables(NULL, KERNEL_TEXT_START, KERNEL_RODATA_END - 1);
+}
-- 
2.34.1

