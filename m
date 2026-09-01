Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EB049C4C7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287360; cv=none; b=KYQgG0X/Dqnn31BpdQ3cB9ZZokHsmswFK7hKNKQWr/cs/M+RQj9iOqhYAf0rCk7zT6bKc3MXo39t954fL4CtjQrEaEAoVkYag5qoK+wjmFnYGgXGvcdiKrF4ij9lHupzkaLdRkkHlOx0UlEquJ+9+sFsuYTGOV7m+2cDeRVntHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287360; c=relaxed/simple;
	bh=hEnNJDWu/iKivIKNptkuLs6mjqBw72pkpWIdB/8pOYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfAqFSRm99QTxv9I3/7qe1jWrHOsmSrMgusLwC3tKkKx6NmXTBcbutGQWVV104LPcIJQUZhO5aDxt5C8u5nsVJIPuB3tG/CtgiuRVuSQJgTbNyvUcBtspk8AvnYvq78Qw+dMecWiWGE678lgkaDxeO0+TdrgVw17T8Ga0PECxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=Xd5Vb38D; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="Xd5Vb38D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788287350;
	bh=hjDwQHd1TIkqr3Ad7cKo//QgmO9EQnnm4D2U1FbPu7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xd5Vb38DOHYqf5jsTX1OBL+XUPeo0hHAoghwuBZciNUCRhXiDYAyxd6pFmlef4HVE
	 tHBMDb+HaKLbtKDPcHOVJ6k+sYFn5RqYb2ntCV1Oy+b3e3zM5MvAq1YToHABCvKdkk
	 eaMN4SxmTkSiUMfjcESTBhstBDNuUZCEX3p2S23Fq8MXLALsdrMxTtOEWyXnyObG0I
	 cL5MpnlfkRzQ6y1BGyaeuTwvFStA0la/KwaN+hFn+q/So+nPxBzUxVw6XAbe1EYc5s
	 TfoEukUdQc8yH2Gxy6D0pNdzPk1WR5DKKFcSSexlFahl6vxCc2CHz701X3ZO9Pw9kt
	 oQRT3B0hndkYw==
Received: from compudjdev.. (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hZDsL4tHhzWP6;
	Tue, 01 Sep 2026 14:29:10 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Martin Liu <liumartin@google.com>,
	David Rientjes <rientjes@google.com>,
	christian.koenig@amd.com,
	Shakeel Butt <shakeel.butt@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Yu Zhao <yuzhao@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	David Carlier <devnexen@gmail.com>,
	Josh Law <objecting@objecting.org>,
	linux-mm@kvack.org
Subject: [PATCH v21 4/6] mm: reorder mm_struct flexible array to place mm_cpumask first
Date: Tue,  1 Sep 2026 14:28:49 -0400
Message-ID: <20260901182857.26690-5-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>
References: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder the mm_struct flexible array layout from:

  [HPCC tree items][mm_cpumask][mm_cid]

to:

  [mm_cpumask][mm_cid][alignment padding][HPCC tree items]

The previous layout placed the HPCC tree items first, which required
mm_cpumask() to skip past them using percpu_counter_tree_items_size().
This created a boot-time initialization ordering dependency: any use of
mm_cpumask() before percpu_counter_tree_subsystem_init() would compute
the wrong pointer offset, reading from or writing to the HPCC items
region instead of the actual cpumask.

On powerpc, switch_mm_irqs_off() accesses mm_cpumask() early in boot
via VM_WARN_ON_ONCE(!cpumask_test_cpu(cpu, mm_cpumask(prev))), which
could fire spuriously or cause silent memory corruption if the HPCC
subsystem was not yet initialized.

By placing mm_cpumask first, mm_cpumask() remains a simple
&mm->flexible_array with no runtime dependency on HPCC initialization.
The HPCC tree items are accessed via get_rss_stat_items_offset(), which
skips past the cpumask and mm_cid with appropriate cacheline alignment
padding. This accessor is only used during mm_struct initialization
(percpu_counter_tree_init_many), not on context switch or other hot
paths.

Introduce the PERCPU_COUNTER_TREE_ITEMS_ALIGN() macro to handle the
SMP cacheline alignment vs !SMP no-op in a single place, used by both
the static init_mm flexible array initializer and the runtime offset
computation.

The cost is at most one cacheline (typically 64 bytes) of padding per
mm_struct between the mm_cid data and the HPCC tree items.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: Martin Liu <liumartin@google.com>
Cc: David Rientjes <rientjes@google.com>
Cc: christian.koenig@amd.com
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: SeongJae Park <sj@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Yu Zhao <yuzhao@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: David Carlier <devnexen@gmail.com>
Cc: Josh Law <objecting@objecting.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
---
 include/linux/mm.h                  |  1 +
 include/linux/mm_types.h            | 47 +++++++++++++++++------------
 include/linux/percpu_counter_tree.h |  3 ++
 kernel/fork.c                       |  4 ++-
 4 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7dd6fdda9bc8..ffbcd18c4ecb 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3453,6 +3453,7 @@ static inline struct percpu_counter_tree_level_item *get_rss_stat_items(struct m
 	unsigned long ptr = (unsigned long)mm;
 
 	ptr += offsetof(struct mm_struct, flexible_array);
+	ptr += get_rss_stat_items_offset();
 	return (struct percpu_counter_tree_level_item *)ptr;
 }
 
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 96ad6ac20b11..b26160b85f93 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1435,11 +1435,12 @@ struct mm_struct {
 	} __randomize_layout;
 
 	/*
-	 * The rss hierarchical counter items, mm_cpumask, and mm_cid
-	 * masks need to be at the end of mm_struct, because they are
+	 * The mm_cpumask, mm_cid masks, and rss hierarchical counter
+	 * items need to be at the end of mm_struct, because they are
 	 * dynamically sized based on nr_cpu_ids.
-	 * The content of the flexible array needs to be placed in
-	 * decreasing alignment requirement order.
+	 * The HPCC counter tree items are placed last and aligned
+	 * with PERCPU_COUNTER_TREE_ITEMS_ALIGN to satisfy their
+	 * cacheline alignment requirement.
 	 */
 	char flexible_array[] __mm_struct_flexible_array_aligned;
 };
@@ -1478,25 +1479,18 @@ static inline void __mm_flags_set_mask_bits_word(struct mm_struct *mm,
 			 MT_FLAGS_USE_RCU)
 extern struct mm_struct init_mm;
 
-#define MM_STRUCT_FLEXIBLE_ARRAY_INIT									\
-{													\
-	[0 ... (PERCPU_COUNTER_TREE_ITEMS_STATIC_SIZE * NR_MM_COUNTERS) + sizeof(cpumask_t) + MM_CID_STATIC_SIZE - 1] = 0	\
-}
-
-static inline size_t get_rss_stat_items_size(void)
-{
-	return percpu_counter_tree_items_size() * NR_MM_COUNTERS;
+#define MM_STRUCT_FLEXIBLE_ARRAY_INIT						\
+{										\
+	[0 ... PERCPU_COUNTER_TREE_ITEMS_ALIGN(					\
+			sizeof(cpumask_t) + MM_CID_STATIC_SIZE)			\
+	       + (PERCPU_COUNTER_TREE_ITEMS_STATIC_SIZE * NR_MM_COUNTERS)	\
+	       - 1] = 0								\
 }
 
 /* Future-safe accessor for struct mm_struct's cpu_vm_mask. */
 static inline cpumask_t *mm_cpumask(struct mm_struct *mm)
 {
-	unsigned long ptr = (unsigned long)mm;
-
-	ptr += offsetof(struct mm_struct, flexible_array);
-	/* Skip RSS stats counters. */
-	ptr += get_rss_stat_items_size();
-	return (struct cpumask *)ptr;
+	return (struct cpumask *)&mm->flexible_array;
 }
 
 static inline void mm_init_cpumask(struct mm_struct *mm)
@@ -1593,8 +1587,6 @@ static inline cpumask_t *mm_cpus_allowed(struct mm_struct *mm)
 	unsigned long bitmap = (unsigned long)mm;
 
 	bitmap += offsetof(struct mm_struct, flexible_array);
-	/* Skip RSS stats counters. */
-	bitmap += get_rss_stat_items_size();
 	/* Skip cpu_bitmap */
 	bitmap += cpumask_size();
 	return (struct cpumask *)bitmap;
@@ -1677,6 +1669,21 @@ static inline void mm_destroy_sched(struct mm_struct *mm) { }
 
 #endif /* CONFIG_SCHED_CACHE */
 
+static inline size_t get_rss_stat_items_size(void)
+{
+	return percpu_counter_tree_items_size() * NR_MM_COUNTERS;
+}
+
+/*
+ * Return the offset of the RSS stat HPCC items within the mm_struct
+ * flexible array. The items are placed after the cpumask and mm_cid,
+ * aligned to the cacheline boundary required by the tree level items.
+ */
+static inline size_t get_rss_stat_items_offset(void)
+{
+	return PERCPU_COUNTER_TREE_ITEMS_ALIGN(cpumask_size() + mm_cid_size());
+}
+
 struct mmu_gather;
 extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm);
 extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct mm_struct *mm);
diff --git a/include/linux/percpu_counter_tree.h b/include/linux/percpu_counter_tree.h
index 828c763edd4a..3e8a820e2d1d 100644
--- a/include/linux/percpu_counter_tree.h
+++ b/include/linux/percpu_counter_tree.h
@@ -66,6 +66,8 @@ struct percpu_counter_tree_level_item {
 
 #define PERCPU_COUNTER_TREE_ITEMS_STATIC_SIZE	\
 	(PERCPU_COUNTER_TREE_STATIC_NR_ITEMS * sizeof(struct percpu_counter_tree_level_item))
+#define PERCPU_COUNTER_TREE_ITEMS_ALIGN(offset)	\
+	ALIGN((offset), __alignof__(struct percpu_counter_tree_level_item))
 
 struct percpu_counter_tree {
 	/* Fast-path fields. */
@@ -167,6 +169,7 @@ void percpu_counter_tree_approximate_accuracy_range(struct percpu_counter_tree *
 #else	/* !CONFIG_SMP */
 
 #define PERCPU_COUNTER_TREE_ITEMS_STATIC_SIZE	0
+#define PERCPU_COUNTER_TREE_ITEMS_ALIGN(offset)	(offset)
 
 struct percpu_counter_tree_level_item;
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 5bad7a24d186..db398b6c5288 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -3126,7 +3126,9 @@ void __init mm_cache_init(void)
 	 * dynamically sized based on the maximum CPU number this system
 	 * can have, taking hotplug into account (nr_cpu_ids).
 	 */
-	mm_size = sizeof(struct mm_struct) + cpumask_size() + mm_cid_size() + get_rss_stat_items_size();
+	mm_size = sizeof(struct mm_struct) +
+		PERCPU_COUNTER_TREE_ITEMS_ALIGN(cpumask_size() + mm_cid_size()) +
+		get_rss_stat_items_size();
 
 	mm_cachep = kmem_cache_create_usercopy("mm_struct",
 			mm_size, ARCH_MIN_MMSTRUCT_ALIGN,
-- 
2.43.0

