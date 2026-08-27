Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1543911B8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803139; cv=none; b=DrvR6IHn0m1p4oK1I4TDilvkqG48seGM6lsfoyACAfmBIk8I4oYw3oZuBGEUHL5WOvO3GDfESciGsQYA6VcyPyZb8CBmiS0pZ4bSHE//yGDpCfFyI7Bag1BgvI96N7bW/AmFwdCGP4uYA1UvOJL1xSEOqgpJype21XnKzWB4rq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803139; c=relaxed/simple;
	bh=eUJlr3S+tlnMUkhMti83bQSlzulWI/N3YDgJQpZ1gRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7m5/oh0ekiS2VJrpXbravSNlVrrkPODFmIMqEiUwJv1R8KNfBZqHDLqxeta/5F2C0RTWGzVaXToW34GcXtUrD7xoZETemju0W9UdcdztLB2mD7//FgPsHazzM5d24xwjqXXH2crXIIVy/ZYsBdd50DxBKZivC3KUpcsH5v5QM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6T2VY52; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6T2VY52"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-44cedfaab6bso1075874fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803126; x=1788407926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvseZbNFrrFaJ94HsfVR4G6O+oWFmL5cv2VdBlThlw8=;
        b=l6T2VY52EshXeZ7V9TE5moRDMo0p0ZIqyj7KLrlp70Sb1y1ZOwvWJAwvOlRX4nkfHc
         HSqB6m9QeP5H/7NnO76lAYnzHyqWUqvfsjeOcWo6h5WlvWxglsdLsZKKTY58+R0+gkQe
         A2ovlbH6I64TY5YIcnMmhid0dcHE8rwzCFyg+b5QqAtUW1uOMx6dmUE9L9TFGeTEGqTj
         g0ALzdJ+DddJJqWOQ00/sIHYxkCU3xuoj13HE3GI7zvkS29laYadne2/kY0Vxlur9ZAE
         VLX5xxQeWh74VzEpDf87aAdDpHqrBo2HwNkmM5I0332M74KzqfsE29lo/XauXCOxB7nD
         5nvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803126; x=1788407926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvseZbNFrrFaJ94HsfVR4G6O+oWFmL5cv2VdBlThlw8=;
        b=tA5LeTuQ8oAQnQ93YFk3B5xNm2+5v4SdSTo2g+Pw/XbGNEXhpq+Ccljw66oPOX9NHx
         YNio2q8IN9I0ykw/qS4BFzZj6OCnz/lhJkJMzMzJZNI8JGCgsLO9dLCBXW10kNO7nY8X
         A1EtDPROUkkzBuXE+d0Des2AqAj/UY+fpf8q1p6FmjFGpV4XG8oOF+Fv/+zPs8rIEMcq
         kqRNo8RE2OPC6IXf5X/zciv6oupLwUkz7lswP/UMjOrDdNLc/Ehg6//YDz3SWXZdZvFw
         Fv4KzWoxymRJ8TkH+EuaI3bSK4g/CnUs+W0giimvP16AkkgCEHoeuRyXTS7l/AtFctUr
         Tnqw==
X-Gm-Message-State: AFuF++mID+IkSR5Pkk1Rb/lNU0GJOpOyso0wJkSWrz5V1iCMgtI8PEyh
	aHky1O+J2SA9+rtzAjdleeI1A5Y9hQkdMJR9WlsxX++24CQAQ5M6Z2YNNfSpxNzF
X-Gm-Gg: AR+sD11SmuHwm06ZfdHUQjqPLOuDL8UBGdTMHs0JVZPxCC2Zel+M4yOGQg3HX9ZEUtO
	795KeTFlaLYQx0/tjcTrVAxgsecVzNmtudOPnXC4WlGcua2x8LYIWirnNDmv8CYNe+sEfgW9Kpu
	miUZfk0CGWwEKXZdefH1cU+xpL8W8D7fTsdtx+xErUB6yUxbkuTHU3X22TJfLiqqZ/67bVV4wzj
	Omw3WSF+hhutvBwYSWBRkaUdbnyupIGD45ZhhNO9Lq5urI4gNNWI1BxauYwMIGWVlKn+SrzjKBp
	ACl06QKd7tSM6KMev/zj5SCteN0UT9hyPz1lT+UIyiOFHWZQ1Os8GUrJQywA/yU6Y8HerL3AWtR
	bvcpQGUR6rghmlKPXJf31FsqlRwKPxUIbFbltP3ThMEc2EhXJJm78rCA2vyfi7Nui7y+32Ys/Jp
	cS4aws+H9zbD4krdPTRlmR3OJGZkAUcPmIpiOKxdZvU7RoO4oU+pwjv+f9zPGoBlZax/dGqeokH
	7Cw60gLUDZUrDzjAkN5D7xw4joYLiVDcz/XaQ0tvh851Pxa3+GP+9UqRNaHkf7VVV968QKgsyX6
	AXJx2EsIWLmC18w7YwQ=
X-Received: by 2002:a05:6870:e389:b0:448:908d:27e0 with SMTP id 586e51a60fabf-465989452aemr13363935fac.4.1787803125939;
        Wed, 26 Aug 2026 20:58:45 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-467367af2bfsm900825fac.6.2026.08.26.20.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 26 Aug 2026 21:58:36 -0600
Subject: [PATCH 4/8] lockdep: Convert 5 graph arrays to chunked tables
 backed by slab pool
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-lockdep-memblock-v1-v1-4-e2db855391ec@gmail.com>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
In-Reply-To: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787803120; l=42873;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=eUJlr3S+tlnMUkhMti83bQSlzulWI/N3YDgJQpZ1gRU=;
 b=cB7AHJ6XuTEDG6SRTQFs6Zaldk12EY0oXpgNsgphfGtV9GmGc7wAwoLiutTxAxC75FI5t0b2x
 8Rk4hwP4zhCCHTVquEnx0MEZKAGNQym0hm6ASiGMyE+yikQ0LkL5q52
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Replace the monolithic static .bss tables for lock_classes, list_entries,
lock_chains, chain_hlocks, and stack_trace with 2D chunked arrays
(DECLARE_CHUNKED_ARRAY) backed by the early memblock slab pool.

Retain 1 static chunk (Chunk 0) in .bss per consumer (~320 kB total) to
cover early bootstrap locking before memblock is initialized:
- lock_classes: 409 items in Chunk 0 (160 B each)
- list_entries: 1,365 items in Chunk 0 (48 B each)
- lock_chains:  2,048 items in Chunk 0 (32 B each)
- chain_hlocks: 32,768 items in Chunk 0 (2 B each)
- stack_trace:  8,192 items in Chunk 0 (8 B each)

Update allocators (alloc_lock_chain(), alloc_chain_hlocks(),
alloc_list_entry(), save_trace()) to claim new 64 KB slabs dynamically
from the memblock reservoir under graph_lock when chunk capacity is
exhausted.

Replace flat array pointer arithmetic with embedded struct indices
(class->class_idx and chain->chain_idx).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/lockdep.h            |   1 +
 include/linux/lockdep_types.h      |   2 +-
 kernel/locking/lockdep.c           | 600 ++++++++++++++++++++++++-------------
 kernel/locking/lockdep_internals.h |  63 ++--
 4 files changed, 436 insertions(+), 230 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 4c96959d8ad7..0ebb9a3e1bea 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -340,6 +340,7 @@ static inline void lockdep_set_selftest_task(struct task_struct *task)
 # define lock_set_class(l, n, key, s, i)	do { (void)(key); } while (0)
 # define lock_set_novalidate_class(l, n, i)	do { } while (0)
 # define lock_set_subclass(l, s, i)		do { } while (0)
+# define lockdep_early_init()			do { } while (0)
 # define lockdep_init()				do { } while (0)
 # define lockdep_init_map_type(lock, name, key, sub, inner, outer, type) \
 		do { (void)(name); (void)(key); } while (0)
diff --git a/include/linux/lockdep_types.h b/include/linux/lockdep_types.h
index 8acac0b59f69..fa0dcf3c3f70 100644
--- a/include/linux/lockdep_types.h
+++ b/include/linux/lockdep_types.h
@@ -114,6 +114,7 @@ struct lock_class {
 	 * "backward" graph nodes.
 	 */
 	struct list_head		locks_after, locks_before;
+	unsigned int			class_idx;
 
 	const struct lockdep_subclass_key *key;
 	lock_cmp_fn			cmp_fn;
@@ -121,7 +122,6 @@ struct lock_class {
 
 	unsigned int			subclass;
 	unsigned int			dep_gen_id;
-	unsigned int			class_idx;
 
 	/*
 	 * IRQ/softirq usage tracking bits:
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 68d82e46cbf6..1c8db52af1ac 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,7 +58,9 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/mm.h>
 #include <linux/memblock.h>
+#include <linux/reboot.h>
 
 #include <asm/sections.h>
 
@@ -148,6 +150,28 @@ static void lockdep_release_slab(void *slab, unsigned int *table_counter)
 		(*table_counter)--;
 }
 
+void lockdep_get_slab_stats(struct lockdep_slab_stats *st)
+{
+	st->total_slabs = lockdep_nr_slabs;
+	st->used_slabs = lockdep_slabs_used - lockdep_nr_free_slabs;
+	st->usage = ld_slabs;
+}
+
+#define BOOTSTRAP_LOCKDEP_ENTRIES 1024UL
+
+static struct lock_list list_entries[BOOTSTRAP_LOCKDEP_ENTRIES];
+static struct lock_list *list_entries_freelist;
+static struct lock_list *list_entries_cur = list_entries;
+static unsigned int list_entries_remaining = BOOTSTRAP_LOCKDEP_ENTRIES;
+
+static inline void free_list_entry(struct lock_list *entry)
+{
+	if (!entry)
+		return;
+	*(void **)entry = list_entries_freelist;
+	list_entries_freelist = entry;
+}
+
 #include <trace/events/lock.h>
 
 #ifdef CONFIG_PROVE_LOCKING
@@ -289,8 +313,6 @@ static inline int debug_locks_off_graph_unlock(void)
 }
 
 unsigned long nr_list_entries;
-static struct lock_list list_entries[MAX_LOCKDEP_ENTRIES];
-static DECLARE_BITMAP(list_entries_in_use, MAX_LOCKDEP_ENTRIES);
 
 /*
  * All data structures here are protected by the global debug_lock.
@@ -305,29 +327,25 @@ unsigned long nr_lock_classes;
 unsigned long nr_zapped_classes;
 unsigned long nr_dynamic_keys;
 unsigned long max_lock_class_idx;
-struct lock_class lock_classes[MAX_LOCKDEP_KEYS];
+
+DEFINE_CHUNKED_ARRAY(lock_class, struct lock_class);
+
+static void lockdep_print_watermarks(const char *bug_msg);
+
 DECLARE_BITMAP(lock_classes_in_use, MAX_LOCKDEP_KEYS);
 
 static inline struct lock_class *hlock_class(struct held_lock *hlock)
 {
 	unsigned int class_idx = hlock->class_idx;
 
-	/* Don't re-read hlock->class_idx, can't use READ_ONCE() on bitfield */
 	barrier();
 
 	if (!test_bit(class_idx, lock_classes_in_use)) {
-		/*
-		 * Someone passed in garbage, we give up.
-		 */
 		DEBUG_LOCKS_WARN_ON(1);
 		return NULL;
 	}
 
-	/*
-	 * At this point, if the passed hlock->class_idx is still garbage,
-	 * we just have to live with it
-	 */
-	return lock_classes + class_idx;
+	return idx_to_lock_class(class_idx);
 }
 
 #ifdef CONFIG_LOCK_STAT
@@ -388,7 +406,7 @@ void lock_stats(struct lock_class *class, struct lock_class_stats *stats)
 	memset(stats, 0, sizeof(struct lock_class_stats));
 	for_each_possible_cpu(cpu) {
 		struct lock_class_stats *pcs =
-			&per_cpu(cpu_lock_stats, cpu)[class - lock_classes];
+			&per_cpu(cpu_lock_stats, cpu)[class->class_idx];
 
 		for (i = 0; i < ARRAY_SIZE(stats->contention_point); i++)
 			stats->contention_point[i] += pcs->contention_point[i];
@@ -413,7 +431,7 @@ void clear_lock_stats(struct lock_class *class)
 
 	for_each_possible_cpu(cpu) {
 		struct lock_class_stats *cpu_stats =
-			&per_cpu(cpu_lock_stats, cpu)[class - lock_classes];
+			&per_cpu(cpu_lock_stats, cpu)[class->class_idx];
 
 		memset(cpu_stats, 0, sizeof(struct lock_class_stats));
 	}
@@ -423,7 +441,7 @@ void clear_lock_stats(struct lock_class *class)
 
 static struct lock_class_stats *get_lock_stats(struct lock_class *class)
 {
-	return &this_cpu_ptr(cpu_lock_stats)[class - lock_classes];
+	return &this_cpu_ptr(cpu_lock_stats)[class->class_idx];
 }
 
 static void lock_release_holdtime(struct held_lock *hlock)
@@ -555,9 +573,26 @@ static __always_inline void lockdep_recursion_finish(void)
 		__this_cpu_write(lockdep_recursion, 0);
 }
 
+static void lockdep_selftest_trace_start(void);
+static void lockdep_selftest_trace_finish(void);
+static void lockdep_report_stage(const char *domain, const char *stage_name);
+
 void lockdep_set_selftest_task(struct task_struct *task)
 {
-	lockdep_selftest_task_struct = task;
+	unsigned long flags;
+
+	if (task) {
+		lockdep_selftest_task_struct = task;
+		lockdep_selftest_trace_start();
+		return;
+	}
+
+	lockdep_selftest_task_struct = NULL;
+	raw_local_irq_save(flags);
+	lockdep_lock();
+	lockdep_selftest_trace_finish();
+	lockdep_unlock();
+	raw_local_irq_restore(flags);
 }
 
 /*
@@ -622,6 +657,7 @@ unsigned long nr_stack_trace_entries;
  * @nr_entries:	Number of entries in @entries.
  * @entries:	Actual stack backtrace.
  */
+#define STACK_TRACE_HASH_SIZE	(1 << CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS)
 struct lock_trace {
 	struct hlist_node	hash_entry;
 	u32			hash;
@@ -630,17 +666,80 @@ struct lock_trace {
 };
 #define LOCK_TRACE_SIZE_IN_LONGS				\
 	(sizeof(struct lock_trace) / sizeof(unsigned long))
-/*
- * Stack-trace: sequence of lock_trace structures. Protected by the graph_lock.
- */
-static unsigned long stack_trace[MAX_STACK_TRACE_ENTRIES];
+#define BOOTSTRAP_STACK_TRACE_ENTRIES 4096UL
+#define MAX_LOCKDEP_TRACE_DEPTH 48
+
+static unsigned long stack_trace[BOOTSTRAP_STACK_TRACE_ENTRIES];
+static unsigned long *trace_free_ptr = stack_trace;
+static size_t trace_remaining_longs = BOOTSTRAP_STACK_TRACE_ENTRIES;
+
+static void *trace_slabs[LOCKDEP_MAX_SLABS];
+static unsigned int nr_trace_slabs;
+
 static struct hlist_head stack_trace_hash[STACK_TRACE_HASH_SIZE];
 
-static bool traces_identical(struct lock_trace *t1, struct lock_trace *t2)
+struct lockdep_selftest_snap {
+	unsigned int nr_trace_slabs;
+	unsigned long *trace_free_ptr;
+	size_t trace_remaining_longs;
+	unsigned long nr_trace_entries;
+};
+static struct lockdep_selftest_snap selftest_snap;
+
+static void lockdep_selftest_trace_start(void)
+{
+	selftest_snap.nr_trace_slabs = nr_trace_slabs;
+	selftest_snap.trace_free_ptr = trace_free_ptr;
+	selftest_snap.trace_remaining_longs = trace_remaining_longs;
+	selftest_snap.nr_trace_entries = nr_stack_trace_entries;
+
+	lockdep_report_stage("selftest", "pre-test");
+}
+
+static void lockdep_selftest_trace_finish(void)
+{
+	unsigned int reclaimed_slabs = 0;
+	unsigned int i;
+
+	if (!debug_locks || !selftest_snap.trace_free_ptr)
+		return;
+
+	lockdep_report_stage("selftest", "peak-test");
+
+	for (i = selftest_snap.nr_trace_slabs; i < nr_trace_slabs; i++) {
+		lockdep_release_slab(trace_slabs[i], &ld_slabs.stack_traces);
+		trace_slabs[i] = NULL;
+		reclaimed_slabs++;
+	}
+	nr_trace_slabs = selftest_snap.nr_trace_slabs;
+	trace_free_ptr = selftest_snap.trace_free_ptr;
+	trace_remaining_longs = selftest_snap.trace_remaining_longs;
+	nr_stack_trace_entries = selftest_snap.nr_trace_entries;
+	memset(stack_trace_hash, 0, sizeof(stack_trace_hash));
+
+	if (reclaimed_slabs)
+		pr_info("lockdep: selftest complete : recycled %u trace slabs (%u kB) to pool\n",
+			reclaimed_slabs, (reclaimed_slabs * LOCKDEP_SLAB_SIZE) / 1024);
+
+	lockdep_report_stage("selftest", "post-test");
+}
+
+static inline void lock_trace_discard(struct lock_trace *trace, unsigned int max_entries)
+{
+	size_t needed_longs = LOCK_TRACE_SIZE_IN_LONGS + max_entries;
+
+	if ((unsigned long *)trace + needed_longs == trace_free_ptr) {
+		trace_free_ptr = (unsigned long *)trace;
+		trace_remaining_longs += needed_longs;
+	}
+}
+
+static inline void lock_trace_trim(struct lock_trace *trace, unsigned int unused_entries)
 {
-	return t1->hash == t2->hash && t1->nr_entries == t2->nr_entries &&
-		memcmp(t1->entries, t2->entries,
-		       t1->nr_entries * sizeof(t1->entries[0])) == 0;
+	if (unused_entries && trace_free_ptr) {
+		trace_free_ptr -= unused_entries;
+		trace_remaining_longs += unused_entries;
+	}
 }
 
 static struct lock_trace *save_trace(void)
@@ -648,40 +747,59 @@ static struct lock_trace *save_trace(void)
 	struct lock_trace *trace, *t2;
 	struct hlist_head *hash_head;
 	u32 hash;
-	int max_entries;
+	size_t needed_longs = LOCK_TRACE_SIZE_IN_LONGS + MAX_LOCKDEP_TRACE_DEPTH;
 
 	BUILD_BUG_ON_NOT_POWER_OF_2(STACK_TRACE_HASH_SIZE);
-	BUILD_BUG_ON(LOCK_TRACE_SIZE_IN_LONGS >= MAX_STACK_TRACE_ENTRIES);
-
-	trace = (struct lock_trace *)(stack_trace + nr_stack_trace_entries);
-	max_entries = MAX_STACK_TRACE_ENTRIES - nr_stack_trace_entries -
-		LOCK_TRACE_SIZE_IN_LONGS;
 
-	if (max_entries <= 0) {
-		if (!debug_locks_off_graph_unlock())
-			return NULL;
+	if (trace_remaining_longs < needed_longs) {
+		unsigned long *slab = lockdep_claim_slab(&ld_slabs.stack_traces);
 
-		nbcon_cpu_emergency_enter();
-		print_lockdep_off("BUG: MAX_STACK_TRACE_ENTRIES too low!");
-		dump_stack();
-		nbcon_cpu_emergency_exit();
+		if (unlikely(!slab))
+			goto out_fail;
 
-		return NULL;
+		trace_slabs[nr_trace_slabs++] = slab;
+		trace_free_ptr = slab;
+		trace_remaining_longs = LOCKDEP_SLAB_SIZE / sizeof(unsigned long);
 	}
-	trace->nr_entries = stack_trace_save(trace->entries, max_entries, 3);
 
-	hash = jhash(trace->entries, trace->nr_entries *
-		     sizeof(trace->entries[0]), 0);
+	trace = (struct lock_trace *)trace_free_ptr;
+	trace_free_ptr += needed_longs;
+	trace_remaining_longs -= needed_longs;
+
+	trace->nr_entries = stack_trace_save(trace->entries, MAX_LOCKDEP_TRACE_DEPTH, 3);
+	hash = jhash(trace->entries, trace->nr_entries * sizeof(unsigned long), 0);
 	trace->hash = hash;
 	hash_head = stack_trace_hash + (hash & (STACK_TRACE_HASH_SIZE - 1));
+
 	hlist_for_each_entry(t2, hash_head, hash_entry) {
-		if (traces_identical(trace, t2))
+		if (t2->hash == hash && t2->nr_entries == trace->nr_entries &&
+		    !memcmp(t2->entries, trace->entries,
+			    trace->nr_entries * sizeof(unsigned long))) {
+			/* Duplicate hit: rewind speculative allocation */
+			lock_trace_discard(trace, MAX_LOCKDEP_TRACE_DEPTH);
 			return t2;
+		}
 	}
-	nr_stack_trace_entries += LOCK_TRACE_SIZE_IN_LONGS + trace->nr_entries;
+
+	/* Novel trace: trim unused tail frames */
+	if (trace->nr_entries < MAX_LOCKDEP_TRACE_DEPTH)
+		lock_trace_trim(trace, MAX_LOCKDEP_TRACE_DEPTH - trace->nr_entries);
+
 	hlist_add_head(&trace->hash_entry, hash_head);
+	nr_stack_trace_entries += LOCK_TRACE_SIZE_IN_LONGS + trace->nr_entries;
 
 	return trace;
+
+out_fail:
+	if (!debug_locks_off_graph_unlock())
+		return NULL;
+
+	nbcon_cpu_emergency_enter();
+	lockdep_print_watermarks("BUG: lockdep stack trace allocation failed!");
+	dump_stack();
+	nbcon_cpu_emergency_exit();
+
+	return NULL;
 }
 
 /* Return the number of stack traces in the stack_trace[] array. */
@@ -1075,46 +1193,15 @@ static bool assign_lock_key(struct lockdep_map *lock)
 
 #ifdef CONFIG_DEBUG_LOCKDEP
 
-/* Check whether element @e occurs in list @h */
-static bool in_list(struct list_head *e, struct list_head *h)
-{
-	struct list_head *f;
-
-	list_for_each(f, h) {
-		if (e == f)
-			return true;
-	}
-
-	return false;
-}
-
-/*
- * Check whether entry @e occurs in any of the locks_after or locks_before
- * lists.
- */
-static bool in_any_class_list(struct list_head *e)
-{
-	struct lock_class *class;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(lock_classes); i++) {
-		class = &lock_classes[i];
-		if (in_list(e, &class->locks_after) ||
-		    in_list(e, &class->locks_before))
-			return true;
-	}
-	return false;
-}
-
 static bool class_lock_list_valid(struct lock_class *c, struct list_head *h)
 {
 	struct lock_list *e;
 
 	list_for_each_entry(e, h, entry) {
 		if (e->links_to != c) {
-			printk(KERN_INFO "class %s: mismatch for lock entry %ld; class %s <> %s",
+			pr_info("class %s: mismatch for lock entry %p; class %s <> %s",
 			       c->name ? : "(?)",
-			       (unsigned long)(e - list_entries),
+			       e,
 			       e->links_to && e->links_to->name ?
 			       e->links_to->name : "(?)",
 			       e->class && e->class->name ? e->class->name :
@@ -1126,7 +1213,8 @@ static bool class_lock_list_valid(struct lock_class *c, struct list_head *h)
 }
 
 #ifdef CONFIG_PROVE_LOCKING
-static u16 chain_hlocks[MAX_LOCKDEP_CHAIN_HLOCKS];
+static u16 get_chain_hlock(unsigned int offset);
+static void set_chain_hlock(unsigned int offset, u16 val);
 #endif
 
 static bool check_lock_chain_key(struct lock_chain *chain)
@@ -1136,14 +1224,14 @@ static bool check_lock_chain_key(struct lock_chain *chain)
 	int i;
 
 	for (i = chain->base; i < chain->base + chain->depth; i++)
-		chain_key = iterate_chain_key(chain_key, chain_hlocks[i]);
+		chain_key = iterate_chain_key(chain_key, get_chain_hlock(i));
 	/*
 	 * The 'unsigned long long' casts avoid that a compiler warning
 	 * is reported when building tools/lib/lockdep.
 	 */
 	if (chain->chain_key != chain_key) {
 		printk(KERN_INFO "chain %lld: key %#llx <> %#llx\n",
-		       (unsigned long long)(chain - lock_chains),
+		       (unsigned long long)chain->chain_idx,
 		       (unsigned long long)chain->chain_key,
 		       (unsigned long long)chain_key);
 		return false;
@@ -1152,42 +1240,15 @@ static bool check_lock_chain_key(struct lock_chain *chain)
 	return true;
 }
 
-static bool in_any_zapped_class_list(struct lock_class *class)
-{
-	struct pending_free *pf;
-	int i;
-
-	for (i = 0, pf = delayed_free.pf; i < ARRAY_SIZE(delayed_free.pf); i++, pf++) {
-		if (in_list(&class->lock_entry, &pf->zapped))
-			return true;
-	}
-
-	return false;
-}
-
 static bool __check_data_structures(void)
 {
 	struct lock_class *class;
 	struct lock_chain *chain;
 	struct hlist_head *head;
-	struct lock_list *e;
 	int i;
 
-	/* Check whether all classes occur in a lock list. */
-	for (i = 0; i < ARRAY_SIZE(lock_classes); i++) {
-		class = &lock_classes[i];
-		if (!in_list(&class->lock_entry, &all_lock_classes) &&
-		    !in_list(&class->lock_entry, &free_lock_classes) &&
-		    !in_any_zapped_class_list(class)) {
-			printk(KERN_INFO "class %px/%s is not in any class list\n",
-			       class, class->name ? : "(?)");
-			return false;
-		}
-	}
-
 	/* Check whether all classes have valid lock lists. */
-	for (i = 0; i < ARRAY_SIZE(lock_classes); i++) {
-		class = &lock_classes[i];
+	list_for_each_entry(class, &all_lock_classes, lock_entry) {
 		if (!class_lock_list_valid(class, &class->locks_before))
 			return false;
 		if (!class_lock_list_valid(class, &class->locks_after))
@@ -1203,38 +1264,6 @@ static bool __check_data_structures(void)
 		}
 	}
 
-	/*
-	 * Check whether all list entries that are in use occur in a class
-	 * lock list.
-	 */
-	for_each_set_bit(i, list_entries_in_use, ARRAY_SIZE(list_entries)) {
-		e = list_entries + i;
-		if (!in_any_class_list(&e->entry)) {
-			printk(KERN_INFO "list entry %d is not in any class list; class %s <> %s\n",
-			       (unsigned int)(e - list_entries),
-			       e->class->name ? : "(?)",
-			       e->links_to->name ? : "(?)");
-			return false;
-		}
-	}
-
-	/*
-	 * Check whether all list entries that are not in use do not occur in
-	 * a class lock list.
-	 */
-	for_each_clear_bit(i, list_entries_in_use, ARRAY_SIZE(list_entries)) {
-		e = list_entries + i;
-		if (in_any_class_list(&e->entry)) {
-			printk(KERN_INFO "list entry %d occurs in a class list; class %s <> %s\n",
-			       (unsigned int)(e - list_entries),
-			       e->class && e->class->name ? e->class->name :
-			       "(?)",
-			       e->links_to && e->links_to->name ?
-			       e->links_to->name : "(?)");
-			return false;
-		}
-	}
-
 	return true;
 }
 
@@ -1286,11 +1315,15 @@ static void init_data_structures_once(void)
 	INIT_LIST_HEAD(&delayed_free.pf[0].zapped);
 	INIT_LIST_HEAD(&delayed_free.pf[1].zapped);
 
-	for (i = 0; i < ARRAY_SIZE(lock_classes); i++) {
-		list_add_tail(&lock_classes[i].lock_entry, &free_lock_classes);
-		INIT_LIST_HEAD(&lock_classes[i].locks_after);
-		INIT_LIST_HEAD(&lock_classes[i].locks_before);
+	for (i = 0; i < lock_class_PER_CHUNK; i++) {
+		struct lock_class *class = &lock_class_chunk0[i];
+
+		class->class_idx = i;
+		list_add_tail(&class->lock_entry, &free_lock_classes);
+		INIT_LIST_HEAD(&class->locks_after);
+		INIT_LIST_HEAD(&class->locks_before);
 	}
+
 	init_chain_block_buckets();
 }
 
@@ -1371,7 +1404,7 @@ register_lock_class(struct lockdep_map *lock, unsigned int subclass, int force)
 	struct lockdep_subclass_key *key;
 	struct hlist_head *hash_head;
 	struct lock_class *class;
-	int idx;
+	int idx, i;
 
 	DEBUG_LOCKS_WARN_ON(!irqs_disabled());
 
@@ -1406,19 +1439,43 @@ register_lock_class(struct lockdep_map *lock, unsigned int subclass, int force)
 	/* Allocate a new lock class and add it to the hash. */
 	class = list_first_entry_or_null(&free_lock_classes, typeof(*class),
 					 lock_entry);
+	if (!class) {
+		if (nr_lock_class_chunks < LOCKDEP_MAX_SLABS) {
+			struct lock_class *chunk;
+			unsigned int chunk_idx = nr_lock_class_chunks;
+
+			chunk = lockdep_claim_slab(&ld_slabs.lock_classes);
+			if (chunk) {
+				memset(chunk, 0, sizeof(struct lock_class) * lock_class_PER_CHUNK);
+				for (i = 0; i < lock_class_PER_CHUNK; i++) {
+					struct lock_class *c = &chunk[i];
+
+					c->class_idx = chunk_idx * lock_class_PER_CHUNK + i;
+					INIT_LIST_HEAD(&c->locks_after);
+					INIT_LIST_HEAD(&c->locks_before);
+					list_add_tail(&c->lock_entry, &free_lock_classes);
+				}
+				/* Pairs with smp_load_acquire() in idx_to_lock_class() */
+				smp_store_release(&lock_class_chunks[chunk_idx], chunk);
+				nr_lock_class_chunks++;
+				class = list_first_entry_or_null(&free_lock_classes, typeof(*class),
+								 lock_entry);
+			}
+		}
+	}
 	if (!class) {
 		if (!debug_locks_off_graph_unlock()) {
 			return NULL;
 		}
 
 		nbcon_cpu_emergency_enter();
-		print_lockdep_off("BUG: MAX_LOCKDEP_KEYS too low!");
+		lockdep_print_watermarks("BUG: MAX_LOCKDEP_KEYS too low!");
 		dump_stack();
 		nbcon_cpu_emergency_exit();
 		return NULL;
 	}
 	nr_lock_classes++;
-	__set_bit(class - lock_classes, lock_classes_in_use);
+	__set_bit(class->class_idx, lock_classes_in_use);
 	debug_atomic_inc(nr_unused_locks);
 	class->key = key;
 	class->name = lock->name;
@@ -1439,7 +1496,7 @@ register_lock_class(struct lockdep_map *lock, unsigned int subclass, int force)
 	 * of classes.
 	 */
 	list_move_tail(&class->lock_entry, &all_lock_classes);
-	idx = class - lock_classes;
+	idx = class->class_idx;
 	if (idx > max_lock_class_idx)
 		max_lock_class_idx = idx;
 
@@ -1484,22 +1541,39 @@ register_lock_class(struct lockdep_map *lock, unsigned int subclass, int force)
  */
 static struct lock_list *alloc_list_entry(void)
 {
-	int idx = find_first_zero_bit(list_entries_in_use,
-				      ARRAY_SIZE(list_entries));
+	struct lock_list *entry;
 
-	if (idx >= ARRAY_SIZE(list_entries)) {
-		if (!debug_locks_off_graph_unlock())
-			return NULL;
+	if (list_entries_freelist) {
+		entry = list_entries_freelist;
+		list_entries_freelist = *(void **)entry;
+	} else if (list_entries_remaining > 0) {
+		entry = list_entries_cur++;
+		list_entries_remaining--;
+	} else {
+		struct lock_list *slab = lockdep_claim_slab(&ld_slabs.direct_deps);
 
-		nbcon_cpu_emergency_enter();
-		print_lockdep_off("BUG: MAX_LOCKDEP_ENTRIES too low!");
-		dump_stack();
-		nbcon_cpu_emergency_exit();
-		return NULL;
+		if (unlikely(!slab))
+			goto out_fail;
+
+		list_entries_cur = slab;
+		list_entries_remaining = LOCKDEP_SLAB_SIZE / sizeof(struct lock_list);
+		entry = list_entries_cur++;
+		list_entries_remaining--;
 	}
+
+	memset(entry, 0, sizeof(*entry));
 	nr_list_entries++;
-	__set_bit(idx, list_entries_in_use);
-	return list_entries + idx;
+	return entry;
+
+out_fail:
+	if (!debug_locks_off_graph_unlock())
+		return NULL;
+
+	nbcon_cpu_emergency_enter();
+	print_lockdep_off("BUG: lockdep pool exhausted!");
+	dump_stack();
+	nbcon_cpu_emergency_exit();
+	return NULL;
 }
 
 /*
@@ -3407,9 +3481,32 @@ check_prevs_add(struct task_struct *curr, struct held_lock *next)
 	return 0;
 }
 
-struct lock_chain lock_chains[MAX_LOCKDEP_CHAINS];
+DEFINE_CHUNKED_ARRAY(lock_chain, struct lock_chain);
 static DECLARE_BITMAP(lock_chains_in_use, MAX_LOCKDEP_CHAINS);
-static u16 chain_hlocks[MAX_LOCKDEP_CHAIN_HLOCKS];
+
+DEFINE_CHUNKED_ARRAY(chain_hlock, u16);
+static unsigned int total_chain_hlocks_capacity = chain_hlock_PER_CHUNK;
+
+unsigned int chain_hlocks_used(void)
+{
+	return total_chain_hlocks_capacity - (nr_free_chain_hlocks + nr_lost_chain_hlocks);
+}
+
+static inline u16 get_chain_hlock(unsigned int offset)
+{
+	u16 *p = idx_to_chain_hlock(offset);
+
+	return p ? *p : 0;
+}
+
+static inline void set_chain_hlock(unsigned int offset, u16 val)
+{
+	u16 *p = idx_to_chain_hlock(offset);
+
+	if (p)
+		*p = val;
+}
+
 unsigned long nr_zapped_lock_chains;
 unsigned int nr_free_chain_hlocks;	/* Free chain_hlocks in buckets */
 unsigned int nr_lost_chain_hlocks;	/* Lost chain_hlocks */
@@ -3459,7 +3556,7 @@ static inline int size_to_bucket(int size)
  */
 static inline int chain_block_next(int offset)
 {
-	int next = chain_hlocks[offset];
+	int next = get_chain_hlock(offset);
 
 	WARN_ON_ONCE(!(next & CHAIN_BLK_FLAG));
 
@@ -3468,7 +3565,7 @@ static inline int chain_block_next(int offset)
 
 	next &= ~CHAIN_BLK_FLAG;
 	next <<= 16;
-	next |= chain_hlocks[offset + 1];
+	next |= get_chain_hlock(offset + 1);
 
 	return next;
 }
@@ -3478,17 +3575,17 @@ static inline int chain_block_next(int offset)
  */
 static inline int chain_block_size(int offset)
 {
-	return (chain_hlocks[offset + 2] << 16) | chain_hlocks[offset + 3];
+	return (get_chain_hlock(offset + 2) << 16) | get_chain_hlock(offset + 3);
 }
 
 static inline void init_chain_block(int offset, int next, int bucket, int size)
 {
-	chain_hlocks[offset] = (next >> 16) | CHAIN_BLK_FLAG;
-	chain_hlocks[offset + 1] = (u16)next;
+	set_chain_hlock(offset, (next >> 16) | CHAIN_BLK_FLAG);
+	set_chain_hlock(offset + 1, (u16)next);
 
 	if (size && !bucket) {
-		chain_hlocks[offset + 2] = size >> 16;
-		chain_hlocks[offset + 3] = (u16)size;
+		set_chain_hlock(offset + 2, size >> 16);
+		set_chain_hlock(offset + 3, (u16)size);
 	}
 }
 
@@ -3563,7 +3660,7 @@ static void init_chain_block_buckets(void)
 	for (i = 0; i < MAX_CHAIN_BUCKETS; i++)
 		chain_block_buckets[i] = -1;
 
-	add_chain_block(0, ARRAY_SIZE(chain_hlocks));
+	add_chain_block(0, chain_hlock_PER_CHUNK);
 }
 
 /*
@@ -3584,14 +3681,33 @@ static int alloc_chain_hlocks(int req)
 
 	init_data_structures_once();
 
-	if (nr_free_chain_hlocks < req)
-		return -1;
-
 	/*
 	 * We require a minimum of 2 (u16) entries to encode a freelist
 	 * 'pointer'.
 	 */
 	req = max(req, 2);
+
+retry:
+	if (nr_free_chain_hlocks < req) {
+		if (nr_chain_hlock_chunks < LOCKDEP_MAX_SLABS) {
+			unsigned int chunk_idx = nr_chain_hlock_chunks;
+			unsigned int base_offset = chunk_idx * chain_hlock_PER_CHUNK;
+			u16 *chunk;
+
+			chunk = lockdep_claim_slab(&ld_slabs.chain_hlocks);
+			if (chunk) {
+				memset(chunk, 0, sizeof(u16) * chain_hlock_PER_CHUNK);
+				/* Pairs with smp_load_acquire() in idx_to_chain_hlock() */
+				smp_store_release(&chain_hlock_chunks[chunk_idx], chunk);
+				nr_chain_hlock_chunks++;
+				total_chain_hlocks_capacity += chain_hlock_PER_CHUNK;
+				add_chain_block(base_offset, chain_hlock_PER_CHUNK);
+			}
+		}
+		if (nr_free_chain_hlocks < req)
+			return -1;
+	}
+
 	bucket = size_to_bucket(req);
 	curr = chain_block_buckets[bucket];
 
@@ -3632,6 +3748,24 @@ static int alloc_chain_hlocks(int req)
 		return curr;
 	}
 
+	/* If fragmented and chunks remain, expand with a new chunk */
+	if (nr_chain_hlock_chunks < LOCKDEP_MAX_SLABS) {
+		unsigned int chunk_idx = nr_chain_hlock_chunks;
+		unsigned int base_offset = chunk_idx * chain_hlock_PER_CHUNK;
+		u16 *chunk;
+
+		chunk = lockdep_claim_slab(&ld_slabs.chain_hlocks);
+		if (chunk) {
+			memset(chunk, 0, sizeof(u16) * chain_hlock_PER_CHUNK);
+			/* Pairs with smp_load_acquire() in idx_to_chain_hlock() */
+			smp_store_release(&chain_hlock_chunks[chunk_idx], chunk);
+			nr_chain_hlock_chunks++;
+			total_chain_hlocks_capacity += chain_hlock_PER_CHUNK;
+			add_chain_block(base_offset, chain_hlock_PER_CHUNK);
+			goto retry;
+		}
+	}
+
 	return -1;
 }
 
@@ -3642,10 +3776,10 @@ static inline void free_chain_hlocks(int base, int size)
 
 struct lock_class *lock_chain_get_class(struct lock_chain *chain, int i)
 {
-	u16 chain_hlock = chain_hlocks[chain->base + i];
+	u16 chain_hlock = get_chain_hlock(chain->base + i);
 	unsigned int class_idx = chain_hlock_class_idx(chain_hlock);
 
-	return lock_classes + class_idx;
+	return idx_to_lock_class(class_idx);
 }
 
 /*
@@ -3710,10 +3844,10 @@ static void print_chain_keys_chain(struct lock_chain *chain)
 
 	printk("depth: %u\n", chain->depth);
 	for (i = 0; i < chain->depth; i++) {
-		hlock_id = chain_hlocks[chain->base + i];
+		hlock_id = get_chain_hlock(chain->base + i);
 		chain_key = print_chain_key_iteration(hlock_id, chain_key);
 
-		print_lock_name(NULL, lock_classes + chain_hlock_class_idx(hlock_id));
+		print_lock_name(NULL, idx_to_lock_class(chain_hlock_class_idx(hlock_id)));
 		printk("\n");
 	}
 }
@@ -3768,7 +3902,7 @@ static int check_no_collision(struct task_struct *curr,
 	for (j = 0; j < chain->depth - 1; j++, i++) {
 		id = hlock_id(&curr->held_locks[i]);
 
-		if (DEBUG_LOCKS_WARN_ON(chain_hlocks[chain->base + j] != id)) {
+		if (DEBUG_LOCKS_WARN_ON(get_chain_hlock(chain->base + j) != id)) {
 			print_collision(curr, hlock, chain);
 			return 0;
 		}
@@ -3783,25 +3917,64 @@ static int check_no_collision(struct task_struct *curr,
  */
 long lockdep_next_lockchain(long i)
 {
-	i = find_next_bit(lock_chains_in_use, ARRAY_SIZE(lock_chains), i + 1);
-	return i < ARRAY_SIZE(lock_chains) ? i : -2;
+	i = find_next_bit(lock_chains_in_use, MAX_LOCKDEP_CHAINS, i + 1);
+	return i < MAX_LOCKDEP_CHAINS ? i : -2;
 }
 
 unsigned long lock_chain_count(void)
 {
-	return bitmap_weight(lock_chains_in_use, ARRAY_SIZE(lock_chains));
+	return bitmap_weight(lock_chains_in_use, MAX_LOCKDEP_CHAINS);
+}
+
+static void lockdep_print_watermarks(const char *bug_msg)
+{
+	print_lockdep_off(bug_msg);
+	pr_err("Lockdep Stats: classes=%lu (chunks=%u), entries=%lu, chains=%lu (chunks=%u), hlocks=%u (chunks=%u)\n",
+	       nr_lock_classes, nr_lock_class_chunks,
+	       nr_list_entries,
+	       lock_chain_count(), nr_lock_chain_chunks,
+	       chain_hlocks_used(), nr_chain_hlock_chunks);
+	pr_err("Lockdep Slabs: total=%u, used=%u (classes=%u, entries=%u, chains=%u, hlocks=%u, trace=%u), free=%u\n",
+	       lockdep_nr_slabs, lockdep_slabs_used,
+	       ld_slabs.lock_classes, ld_slabs.direct_deps,
+	       ld_slabs.lock_chains, ld_slabs.chain_hlocks,
+	       ld_slabs.stack_traces,
+	       lockdep_nr_slabs > lockdep_slabs_used ? lockdep_nr_slabs - lockdep_slabs_used : 0);
+	show_mem();
 }
 
 /* Must be called with the graph lock held. */
 static struct lock_chain *alloc_lock_chain(void)
 {
-	int idx = find_first_zero_bit(lock_chains_in_use,
-				      ARRAY_SIZE(lock_chains));
+	int idx = find_first_zero_bit(lock_chains_in_use, MAX_LOCKDEP_CHAINS);
+	unsigned int chunk_idx;
+	struct lock_chain *chain;
 
-	if (unlikely(idx >= ARRAY_SIZE(lock_chains)))
+	if (unlikely(idx >= MAX_LOCKDEP_CHAINS))
 		return NULL;
+
+	chunk_idx = reciprocal_divide(idx, lock_chain_rv);
+	if (chunk_idx >= LOCKDEP_MAX_SLABS)
+		return NULL;
+
+	if (chunk_idx >= nr_lock_chain_chunks) {
+		struct lock_chain *chunk;
+
+		chunk = lockdep_claim_slab(&ld_slabs.lock_chains);
+		if (!chunk)
+			return NULL;
+
+		memset(chunk, 0, sizeof(struct lock_chain) * lock_chain_PER_CHUNK);
+		/* Pairs with smp_load_acquire() in idx_to_lock_chain() */
+		smp_store_release(&lock_chain_chunks[chunk_idx], chunk);
+		nr_lock_chain_chunks = chunk_idx + 1;
+	}
+
 	__set_bit(idx, lock_chains_in_use);
-	return lock_chains + idx;
+	chain = idx_to_lock_chain(idx);
+	memset(chain, 0, sizeof(*chain));
+	chain->chain_idx = idx;
+	return chain;
 }
 
 /*
@@ -3833,7 +4006,7 @@ static inline int add_chain_cache(struct task_struct *curr,
 			return 0;
 
 		nbcon_cpu_emergency_enter();
-		print_lockdep_off("BUG: MAX_LOCKDEP_CHAINS too low!");
+		lockdep_print_watermarks("BUG: MAX_LOCKDEP_CHAINS too low!");
 		dump_stack();
 		nbcon_cpu_emergency_exit();
 		return 0;
@@ -3843,9 +4016,9 @@ static inline int add_chain_cache(struct task_struct *curr,
 	i = get_first_held_lock(curr, hlock);
 	chain->depth = curr->lockdep_depth + 1 - i;
 
-	BUILD_BUG_ON((1UL << 24) <= ARRAY_SIZE(chain_hlocks));
+	BUILD_BUG_ON((1UL << 24) <= MAX_LOCKDEP_CHAIN_HLOCKS);
 	BUILD_BUG_ON((1UL << 6)  <= ARRAY_SIZE(curr->held_locks));
-	BUILD_BUG_ON((1UL << 8*sizeof(chain_hlocks[0])) <= ARRAY_SIZE(lock_classes));
+	BUILD_BUG_ON((1UL << (8 * sizeof(u16))) <= MAX_LOCKDEP_KEYS);
 
 	j = alloc_chain_hlocks(chain->depth);
 	if (j < 0) {
@@ -3853,7 +4026,7 @@ static inline int add_chain_cache(struct task_struct *curr,
 			return 0;
 
 		nbcon_cpu_emergency_enter();
-		print_lockdep_off("BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!");
+		lockdep_print_watermarks("BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!");
 		dump_stack();
 		nbcon_cpu_emergency_exit();
 		return 0;
@@ -3863,9 +4036,9 @@ static inline int add_chain_cache(struct task_struct *curr,
 	for (j = 0; j < chain->depth - 1; j++, i++) {
 		int lock_id = hlock_id(curr->held_locks + i);
 
-		chain_hlocks[chain->base + j] = lock_id;
+		set_chain_hlock(chain->base + j, lock_id);
 	}
-	chain_hlocks[chain->base + j] = hlock_id(hlock);
+	set_chain_hlock(chain->base + j, hlock_id(hlock));
 	hlist_add_head_rcu(&chain->entry, hash_head);
 	debug_atomic_inc(chain_lookup_misses);
 	inc_chains(chain->irq_context);
@@ -5222,7 +5395,7 @@ static int __lock_acquire(struct lockdep_map *lock, unsigned int subclass,
 	if (DEBUG_LOCKS_WARN_ON(depth >= MAX_LOCK_DEPTH))
 		return 0;
 
-	class_idx = class - lock_classes;
+	class_idx = class->class_idx;
 
 	if (depth && !sync) {
 		/* we're holding locks and the new held lock is not a sync */
@@ -5413,7 +5586,7 @@ static noinstr int match_held_lock(const struct held_lock *hlock,
 		if (DEBUG_LOCKS_WARN_ON(!hlock->nest_lock))
 			return 0;
 
-		if (hlock->class_idx == class - lock_classes)
+		if (hlock->class_idx == class->class_idx)
 			return 1;
 	}
 
@@ -5521,7 +5694,7 @@ __lock_set_class(struct lockdep_map *lock, const char *name,
 			      lock->wait_type_outer,
 			      lock->lock_type);
 	class = register_lock_class(lock, subclass, 0);
-	hlock->class_idx = class - lock_classes;
+	hlock->class_idx = class->class_idx;
 
 	curr->lockdep_depth = i;
 	curr->curr_chain_key = hlock->prev_chain_key;
@@ -5871,7 +6044,7 @@ static void verify_lock_unused(struct lockdep_map *lock, struct held_lock *hlock
 	if (!(class->usage_mask & mask))
 		return;
 
-	hlock->class_idx = class - lock_classes;
+	hlock->class_idx = class->class_idx;
 
 	print_usage_bug(current, hlock, LOCK_USED, LOCK_USAGE_STATES);
 #endif
@@ -6279,7 +6452,7 @@ static void remove_class_from_lock_chain(struct pending_free *pf,
 	int i;
 
 	for (i = chain->base; i < chain->base + chain->depth; i++) {
-		if (chain_hlock_class_idx(chain_hlocks[i]) != class - lock_classes)
+		if (chain_hlock_class_idx(get_chain_hlock(i)) != class->class_idx)
 			continue;
 		/*
 		 * Each lock class occurs at most once in a lock chain so once
@@ -6301,7 +6474,7 @@ static void remove_class_from_lock_chain(struct pending_free *pf,
 	 * hlist_for_each_entry_rcu() loop is safe.
 	 */
 	hlist_del_rcu(&chain->entry);
-	__set_bit(chain - lock_chains, pf->lock_chains_being_freed);
+	__set_bit(chain->chain_idx, pf->lock_chains_being_freed);
 	nr_zapped_lock_chains++;
 #endif
 }
@@ -6338,28 +6511,28 @@ static void zap_class(struct pending_free *pf, struct lock_class *class)
 	list_for_each_entry_safe(entry, tmp, &class->locks_after, entry) {
 		list_for_each_entry_safe(other, other_tmp, &entry->links_to->locks_before, entry) {
 			if (other->links_to == class) {
-				__clear_bit(other - list_entries, list_entries_in_use);
 				nr_list_entries--;
 				list_del_rcu(&other->entry);
+				free_list_entry(other);
 				break;
 			}
 		}
-		__clear_bit(entry - list_entries, list_entries_in_use);
 		nr_list_entries--;
 		list_del_rcu(&entry->entry);
+		free_list_entry(entry);
 	}
 	list_for_each_entry_safe(entry, tmp, &class->locks_before, entry) {
 		list_for_each_entry_safe(other, other_tmp, &entry->links_to->locks_after, entry) {
 			if (other->links_to == class) {
-				__clear_bit(other - list_entries, list_entries_in_use);
 				nr_list_entries--;
 				list_del_rcu(&other->entry);
+				free_list_entry(other);
 				break;
 			}
 		}
-		__clear_bit(entry - list_entries, list_entries_in_use);
 		nr_list_entries--;
 		list_del_rcu(&entry->entry);
+		free_list_entry(entry);
 	}
 	if (list_empty(&class->locks_after) &&
 	    list_empty(&class->locks_before)) {
@@ -6371,8 +6544,8 @@ static void zap_class(struct pending_free *pf, struct lock_class *class)
 		if (class->usage_mask == 0)
 			debug_atomic_dec(nr_unused_locks);
 		nr_lock_classes--;
-		__clear_bit(class - lock_classes, lock_classes_in_use);
-		if (class - lock_classes == max_lock_class_idx)
+		__clear_bit(class->class_idx, lock_classes_in_use);
+		if (class->class_idx == max_lock_class_idx)
 			max_lock_class_idx--;
 	} else {
 		WARN_ONCE(true, "%s() failed for class %s\n", __func__,
@@ -6450,8 +6623,8 @@ static void __free_zapped_classes(struct pending_free *pf)
 
 #ifdef CONFIG_PROVE_LOCKING
 	bitmap_andnot(lock_chains_in_use, lock_chains_in_use,
-		      pf->lock_chains_being_freed, ARRAY_SIZE(lock_chains));
-	bitmap_clear(pf->lock_chains_being_freed, 0, ARRAY_SIZE(lock_chains));
+		      pf->lock_chains_being_freed, MAX_LOCKDEP_CHAINS);
+	bitmap_clear(pf->lock_chains_being_freed, 0, MAX_LOCKDEP_CHAINS);
 #endif
 }
 
@@ -6773,12 +6946,16 @@ void __init lockdep_early_init(void)
 		lockdep_slabs[i] = (char *)pool + (i * LOCKDEP_SLAB_SIZE);
 
 	lockdep_nr_slabs = nr_slabs;
-	pr_info("lockdep: reserved %u slabs (%zu KB) from memblock\n",
+	lockdep_slabs_used = 0;
+
+	pr_info("lockdep: reserved %u slabs (%zu KB) from memblock for dynamic tables\n",
 		nr_slabs, slab_bytes / 1024);
 }
 
 void __init lockdep_init(void)
 {
+	init_data_structures_once();
+
 	pr_info("Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar\n");
 
 	pr_info("... MAX_LOCKDEP_SUBCLASSES:  %lu\n", MAX_LOCKDEP_SUBCLASSES);
@@ -6789,26 +6966,25 @@ void __init lockdep_init(void)
 	pr_info("... MAX_LOCKDEP_CHAINS:      %lu\n", MAX_LOCKDEP_CHAINS);
 	pr_info("... CHAINHASH_SIZE:          %lu\n", CHAINHASH_SIZE);
 
-	pr_info(" memory used by lock dependency info: %zu kB\n",
-	       (sizeof(lock_classes) +
+	pr_info(" memory used by lock dependency info: dynamic (bootstrap %zu kB)\n",
+	       (sizeof(lock_class_chunk0) +
 		sizeof(lock_classes_in_use) +
 		sizeof(classhash_table) +
 		sizeof(list_entries) +
-		sizeof(list_entries_in_use) +
 		sizeof(chainhash_table) +
 		sizeof(delayed_free)
 #ifdef CONFIG_PROVE_LOCKING
 		+ sizeof(lock_cq)
-		+ sizeof(lock_chains)
+		+ sizeof(lock_chain_chunk0)
 		+ sizeof(lock_chains_in_use)
-		+ sizeof(chain_hlocks)
+		+ sizeof(chain_hlock_chunk0)
 #endif
 		) / 1024
 		);
 
 #if defined(CONFIG_TRACE_IRQFLAGS) && defined(CONFIG_PROVE_LOCKING)
-	pr_info(" memory used for stack traces: %zu kB\n",
-	       (sizeof(stack_trace) + sizeof(stack_trace_hash)) / 1024
+	pr_info(" memory used for stack traces: dynamic (bootstrap %zu kB)\n",
+	       sizeof(stack_trace) / 1024
 	       );
 #endif
 
diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 3344361a1c3b..eaa23d9b4dd5 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -7,6 +7,15 @@
  * lockdep subsystem internal functions and variables.
  */
 
+#include <linux/types.h>
+#include <linux/reciprocal_div.h>
+#include <linux/log2.h>
+#include <asm/barrier.h>
+
+#define LOCKDEP_SLAB_SIZE	(64 * 1024)
+#define LOCKDEP_MAX_SLABS	512
+#define LOCKDEP_DEFAULT_SLABS	64
+
 /*
  * Lock-class usage-state bits:
  */
@@ -122,19 +131,25 @@ enum {
 #define MAX_LOCKDEP_CHAINS	(1UL << MAX_LOCKDEP_CHAINS_BITS)
 
 #define AVG_LOCKDEP_CHAIN_DEPTH		5
-#include <linux/reciprocal_div.h>
+#define MAX_LOCKDEP_CHAIN_HLOCKS (MAX_LOCKDEP_CHAINS * AVG_LOCKDEP_CHAIN_DEPTH)
 
-#define LOCKDEP_SLAB_SIZE	(64 * 1024)
-#define LOCKDEP_MAX_SLABS	512
-#define LOCKDEP_DEFAULT_SLABS	64
+/*
+ * Compile-time precomputation of struct reciprocal_value using the canonical
+ * Granlund-Montgomery algorithm matching lib/math/reciprocal_div.c.
+ */
+#define RECIPROCAL_VALUE_INIT(d) { \
+	.m = (u32)((((1ULL << 32) * ((1ULL << (ilog2((d) - 1) + 1)) - (d))) / (d)) + 1), \
+	.sh1 = (ilog2((d) - 1) + 1) > 0 ? 1 : 0, \
+	.sh2 = (ilog2((d) - 1) + 1) > 1 ? (ilog2((d) - 1) + 1) - 1 : 0, \
+}
 
 /*
  * Chunked Array Tables:
  * Replaces flat monolithic BSS arrays with 2D chunk pointer matrices.
  * Chunk 0 is statically allocated in BSS for early boot, while subsequent
  * chunks are claimed from the memblock reservoir via lockdep_claim_slab().
- * Indexing uses compile-time Granlund-Montgomery reciprocal divide
- * (~3-cycle multiply+shift, zero division instructions).
+ * Indexing uses a compile-time hybrid: single-cycle bit shifts for power-of-2
+ * elements, and Granlund-Montgomery reciprocal divide for non-power-of-2.
  */
 #define DECLARE_CHUNKED_ARRAY(name, type)					\
 	enum {									\
@@ -156,20 +171,16 @@ enum {
 		return &chunk_ptr[offset];					\
 	}
 
-#define DEFINE_CHUNKED_ARRAY(name, type)					\
+#define DEFINE_CHUNKED_ARRAY(name, type)						\
 	static type name##_chunk0[name##_PER_CHUNK];				\
 	type *name##_chunks[LOCKDEP_MAX_SLABS] = { name##_chunk0 };		\
 	static unsigned int nr_##name##_chunks = 1;				\
 	const struct reciprocal_value name##_rv =				\
 		RECIPROCAL_VALUE_INIT(name##_PER_CHUNK)
 
-struct lockdep_slab_usage {
-	unsigned int lock_classes;
-	unsigned int direct_deps;
-	unsigned int lock_chains;
-	unsigned int chain_hlocks;
-	unsigned int stack_traces;
-};
+DECLARE_CHUNKED_ARRAY(lock_chain, struct lock_chain);
+DECLARE_CHUNKED_ARRAY(chain_hlock, u16);
+void lockdep_chain_stats(unsigned int *nr_chunks, size_t *chunk_size, size_t *tail_used);
 
 #define LOCK_USAGE_CHARS (2*XXX_LOCK_USAGE_STATES + 1)
 
@@ -201,9 +212,27 @@ extern unsigned int max_lockdep_depth;
 extern unsigned int max_bfs_queue_depth;
 extern unsigned long max_lock_class_idx;
 
-extern struct lock_class lock_classes[MAX_LOCKDEP_KEYS];
+DECLARE_2D_RADIX(lock_class, struct lock_class);
 extern unsigned long lock_classes_in_use[];
 
+struct lockdep_slab_usage {
+	unsigned int lock_classes;
+	unsigned int direct_deps;
+	unsigned int lock_chains;
+	unsigned int chain_hlocks;
+	unsigned int stack_traces;
+};
+
+struct lockdep_slab_stats {
+	unsigned int total_slabs;
+	unsigned int used_slabs;
+	struct lockdep_slab_usage usage;
+};
+
+unsigned int chain_hlocks_used(void);
+unsigned long lock_chain_count(void);
+void lockdep_get_slab_stats(struct lockdep_slab_stats *st);
+
 #ifdef CONFIG_PROVE_LOCKING
 extern unsigned long lockdep_count_forward_deps(struct lock_class *);
 extern unsigned long lockdep_count_backward_deps(struct lock_class *);
@@ -286,7 +315,7 @@ static inline void debug_class_ops_inc(struct lock_class *class)
 {
 	int idx;
 
-	idx = class - lock_classes;
+	idx = class->class_idx;
 	__debug_atomic_inc(lock_class_ops[idx]);
 }
 
@@ -295,7 +324,7 @@ static inline unsigned long debug_class_ops_read(struct lock_class *class)
 	int idx, cpu;
 	unsigned long ops = 0;
 
-	idx = class - lock_classes;
+	idx = class->class_idx;
 	for_each_possible_cpu(cpu)
 		ops += per_cpu(lockdep_stats.lock_class_ops[idx], cpu);
 	return ops;

-- 
2.55.0

