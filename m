Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708996;
	b=Hdpk3HRZQrhWlOQGgNH53wXyvxYoVMmFz4Ztqm0REPGG/r4hmmbhFRQZyWxSdtyPwOWx
	 Fl7fEGq+adfTLr3M1saWnjGdq8xCavoVnUsh5hJVoLuO/WnV3wA0ZPB4sQnIrpReTRbRp
	 rPph5ZJXBWIbVt7klLr4VNk8/AFFMdgoQD4z2ldpAze1fehy/9SGnnfL7Y5DOtD9ETvSt
	 3nvFygi4w/z4KQIleS+Wv2DRvqfMRKx4FKzMizAUeDa/DIkppzpd6hF3hmh2NWFzd9d/p
	 sxHrjoCpszJhPdLY+BlUg0a8NCIm+qhb4l4iYN3C2Cu/tV7VxO8He3TTWL4KKgGio0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708996;
	h=DMARC-Filter:DKIM-Signature:In-Reply-To:Date:X-Lms-Return-Path:From:
	 Subject:X-Original-From:X-Mailer:To:Cc:References:Content-Type:
	 Mime-Version:Content-Transfer-Encoding:Message-Id;
	bh=ikdsUf5143hpiDaILAuysJHFLeRnHTQHDNJjwBmFwLY=;
	b=PwB1G6THq/mLMHjzDhrgiAtdOyLIVU8lW0dJWNbS4m1bcrnMh+Hr9IWyV5uwX2R1uiEK
	 8LA8horHh+EF9P/FEe6EFql18mm+hyyCFB9mKAPHmPtXAmWdjrw93wznxqPDDymgtUkZ5
	 1N1xRZTQxn28m5t3dwOCMaqMzL48KdYDox4K33v67JleUDSwKX55JaMJwFaL90xYn5N31
	 RWfoC9Ntr6tBeQbSEtC9aA5wFH00T2HkhIFnEOXSmm7+XS1md2cJe6Xu/qejnLgfdcPfo
	 hyYk5kMdSLEgmzKchADml+hh4MBjBsKwDQiJCWJ/N0IESZov8DXOl2fULqoWcG9sGuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b="BBrNWs3/";
	arc=none smtp.remote-ip=209.127.231.115
Received: from va-2-115.ptr.blmpb.com (va-2-115.ptr.blmpb.com [209.127.231.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CBD606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CBD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=BBrNWs3/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793708983; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ikdsUf5143hpiDaILAuysJHFLeRnHTQHDNJjwBmFwLY=;
 b=BBrNWs3/gz8szEJoKNfnRRDZFTzpsfBmk33UQk0FFlGPSJ3xUEbx3x35XCl17IxWpgNI5d
 XK4hvYrC3TWoucupfpWDtjMFMZwn6Na+Cq//MDIMuOlxR2A63HudmbQvUBUS2luuhmMLdd
 jC1S+JyCvGaD/Mqrbn0Ayrepv5kpQv60bRf8pSmszvlMRnPo6+SqR063M2RCHuMPIzaAgV
 RcFkOmOtlO4YFM1MEjOmn8fEN7yBXFpJ1ZArDMZmJKAMBr5pkqWa9Jd33jIFt3QRLYEoum
 DvJY52y6TQfh9XVs9B9QGNV/M6EdPqyIinX/zvxBhQkpwUcNnBrm3xbGtNg8SQ==
In-Reply-To: <20261103122816.48037-1-lizhe.67@bytedance.com>
Date: Tue,  3 Nov 2026 20:28:15 +0800
X-Lms-Return-Path: <lba+26ae9d3b5+1d0f60+vger.kernel.org+lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH 2/3] mm/mempolicy: add cgroup weighted interleave plumbing
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
To: <tj@kernel.org>, <hannes@cmpxchg.org>, <mkoutny@suse.com>, 
	<akpm@linux-foundation.org>, <david@kernel.org>, <gourry@gourry.net>, 
	<ziy@nvidia.com>, <joshua.hahnjy@gmail.com>, 
	<ying.huang@linux.alibaba.com>, <ljs@kernel.org>, <liam@infradead.org>, 
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>
Cc: <cgroups@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, <bpf@vger.kernel.org>, 
	"Li Zhe" <lizhe.67@bytedance.com>
References: <20261103122816.48037-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261103122816.48037-3-lizhe.67@bytedance.com>

Add the kernel-side storage and lookup plumbing for per-cgroup weighted
interleave overrides. Each cgroup stores only an explicit override
table. Cgroups without one inherit the nearest ancestor override and
otherwise use the existing global weighted-interleave state.

The BPF control plane is built through a hidden derived Kconfig symbol,
so it follows the BPF syscall and BTF prerequisites without adding a
user-visible weighted-interleave knob.

Per-task weighted-interleave state continues to cache the current node
and the remaining dynamic weight quota. Weight changes and cgroup
migration are observed when that quota is refilled; the hot allocation
path does not revalidate the cached quota on every allocation.

Bulk weighted-interleave allocations continue to use wi_srcu for
concurrency protection.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/cgroup-defs.h |   5 ++
 include/linux/mempolicy.h   |  10 ++++
 kernel/cgroup/cgroup.c      |   2 +
 mm/Kconfig                  |   6 +++
 mm/mempolicy.c              | 104 ++++++++++++++++++++++++++++++++----
 5 files changed, 117 insertions(+), 10 deletions(-)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index cbfe8937647c..2dc1cb7336a5 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -29,6 +29,7 @@ struct cgroup;
 struct cgroup_root;
 struct cgroup_subsys;
 struct cgroup_taskset;
+struct weighted_interleave_state;
 struct kernfs_node;
 struct kernfs_ops;
 struct kernfs_open_file;
@@ -647,6 +648,10 @@ struct cgroup {
 #ifdef CONFIG_EXT_SUB_SCHED
 	struct scx_sched __rcu *scx_sched;
 #endif
+#ifdef CONFIG_BPF_WEIGHTED_INTERLEAVE
+	/* Explicit weighted-interleave override for this cgroup. */
+	struct weighted_interleave_state __rcu *wi_state;
+#endif
 
 	/* All ancestors including self */
 	union {
diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index 65c732d440d2..59bfb272da31 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -16,6 +16,7 @@
 #include <linux/pagemap.h>
 #include <uapi/linux/mempolicy.h>
 
+struct cgroup;
 struct mm_struct;
 
 #define NO_INTERLEAVE_INDEX (-1UL)	/* use task il_prev for interleaving */
@@ -304,4 +305,13 @@ static inline bool mpol_is_preferred_many(struct mempolicy *pol)
 }
 
 #endif /* CONFIG_NUMA */
+
+#ifdef CONFIG_BPF_WEIGHTED_INTERLEAVE
+void weighted_interleave_cgroup_free(struct cgroup *cgrp);
+#else
+static inline void weighted_interleave_cgroup_free(struct cgroup *cgrp)
+{
+}
+#endif
+
 #endif
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index a284225f8dc9..705bb2e85571 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -35,6 +35,7 @@
 #include <linux/magic.h>
 #include <linux/mutex.h>
 #include <linux/mount.h>
+#include <linux/mempolicy.h>
 #include <linux/pagemap.h>
 #include <linux/proc_fs.h>
 #include <linux/rcupdate.h>
@@ -5733,6 +5734,7 @@ static void css_free_rwork_fn(struct work_struct *work)
 			cgroup1_pidlist_destroy_all(cgrp);
 		cancel_work_sync(&cgrp->release_agent_work);
 		bpf_cgrp_storage_free(cgrp);
+		weighted_interleave_cgroup_free(cgrp);
 
 		if (cgroup_parent(cgrp)) {
 			/*
diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..43190060f25f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1530,6 +1530,12 @@ config ARCH_HAS_PTDUMP
 config PTDUMP
 	bool
 
+config BPF_WEIGHTED_INTERLEAVE
+	def_bool y
+	depends on NUMA
+	depends on CGROUPS
+	depends on BPF_SYSCALL
+	depends on DEBUG_INFO_BTF
 
 source "mm/damon/Kconfig"
 
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index fb9962302664..751a5e90a4e1 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -96,6 +96,7 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/compat.h>
+#include <linux/cgroup.h>
 #include <linux/ptrace.h>
 #include <linux/swap.h>
 #include <linux/seq_file.h>
@@ -112,6 +113,7 @@
 #include <linux/printk.h>
 #include <linux/leafops.h>
 #include <linux/gcd.h>
+#include <linux/jump_label.h>
 #include <linux/srcu.h>
 
 #include <asm/tlbflush.h>
@@ -170,6 +172,11 @@ static unsigned int *node_bw_table;
  */
 static DEFINE_MUTEX(wi_state_lock);
 
+#ifdef CONFIG_BPF_WEIGHTED_INTERLEAVE
+static DEFINE_STATIC_KEY_FALSE(wi_cgroup_weights_set);
+static DEFINE_MUTEX(wi_cgroup_lock);
+#endif
+
 /* Readers that sleep while walking iw_table hold this instead */
 DEFINE_STATIC_SRCU_FAST(wi_srcu);
 
@@ -212,18 +219,90 @@ static void wi_state_init_from(struct weighted_interleave_state *dst,
 }
 #endif
 
-static u8 get_il_weight(int node)
+static inline u8 wi_state_weight(const struct weighted_interleave_state *state,
+				 int node)
+{
+	return state ? state->iw_table[node] : 1;
+}
+
+#ifdef CONFIG_BPF_WEIGHTED_INTERLEAVE
+static struct weighted_interleave_state *wi_cgroup_state_rcu(struct cgroup *cgrp)
+{
+	struct weighted_interleave_state *state;
+
+	for (; cgrp; cgrp = cgroup_parent(cgrp)) {
+		state = rcu_dereference(cgrp->wi_state);
+		if (state)
+			return state;
+	}
+	return NULL;
+}
+
+static struct weighted_interleave_state *wi_task_state_rcu(void)
+{
+	if (static_branch_unlikely(&wi_cgroup_weights_set) && in_task())
+		return wi_cgroup_state_rcu(task_dfl_cgroup(current));
+	return NULL;
+}
+
+void weighted_interleave_cgroup_free(struct cgroup *cgrp)
+{
+	struct weighted_interleave_state *old_wi_state;
+
+	mutex_lock(&wi_cgroup_lock);
+	old_wi_state = rcu_dereference_protected(cgrp->wi_state,
+						 lockdep_is_held(&wi_cgroup_lock));
+	if (old_wi_state) {
+		rcu_assign_pointer(cgrp->wi_state, NULL);
+		static_branch_dec(&wi_cgroup_weights_set);
+	}
+	mutex_unlock(&wi_cgroup_lock);
+
+	wi_state_retire(old_wi_state);
+}
+#else
+static struct weighted_interleave_state *wi_task_state_rcu(void)
+{
+	return NULL;
+}
+
+#endif
+
+static struct weighted_interleave_state *wi_effective_state_rcu(void)
+{
+	struct weighted_interleave_state *state;
+
+	state = wi_task_state_rcu();
+	if (state)
+		return state;
+	return rcu_dereference(wi_state);
+}
+
+static u8 get_effective_il_weight(int node)
 {
 	struct weighted_interleave_state *state;
-	u8 weight = 1;
+	u8 weight;
+
+	rcu_read_lock();
+	state = wi_effective_state_rcu();
+	weight = wi_state_weight(state, node);
+	rcu_read_unlock();
+	return weight;
+}
+
+#ifdef CONFIG_SYSFS
+static u8 get_global_il_weight(int node)
+{
+	struct weighted_interleave_state *state;
+	u8 weight;
 
 	rcu_read_lock();
 	state = rcu_dereference(wi_state);
-	if (state)
-		weight = state->iw_table[node];
+	weight = wi_state_weight(state, node);
 	rcu_read_unlock();
 	return weight;
 }
+#endif
 
 /*
  * Convert bandwidth values into weighted interleave weights.
@@ -2144,7 +2223,7 @@ static unsigned int weighted_interleave_nodes(struct mempolicy *policy)
 		if (node == MAX_NUMNODES)
 			return node;
 		current->il_prev = node;
-		current->il_weight = get_il_weight(node);
+		current->il_weight = get_effective_il_weight(node);
 	}
 	current->il_weight--;
 	return node;
@@ -2228,8 +2307,8 @@ static unsigned int weighted_interleave_nid(struct mempolicy *pol, pgoff_t ilx)
 
 	rcu_read_lock();
 
-	state = rcu_dereference(wi_state);
-	/* Uninitialized wi_state means we should assume all weights are 1 */
+	state = wi_effective_state_rcu();
+	/* Uninitialized effective state means we should assume all weights are 1 */
 	if (state)
 		table = state->iw_table;
 
@@ -2734,10 +2813,15 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
 	me->il_weight = 0;
 	prev_node = node;
 
-	/* The page allocator may sleep, pin the weight table with SRCU */
+	/*
+	 * The page allocator may sleep. Pin the selected weight table with
+	 * SRCU, but choose the task/cgroup effective table under RCU.
+	 */
 	scp = srcu_read_lock_fast(&wi_srcu);
-	state = srcu_dereference(wi_state, &wi_srcu);
+	rcu_read_lock();
+	state = wi_effective_state_rcu();
 	table = state ? state->iw_table : NULL;
+	rcu_read_unlock();
 
 	/* calculate total, detect system default usage */
 	for_each_node_mask(node, pol->nodes)
@@ -3683,7 +3767,7 @@ static ssize_t node_show(struct kobject *kobj, struct kobj_attribute *attr,
 	u8 weight;
 
 	node_attr = container_of(attr, struct iw_node_attr, kobj_attr);
-	weight = get_il_weight(node_attr->nid);
+	weight = get_global_il_weight(node_attr->nid);
 	return sysfs_emit(buf, "%d\n", weight);
 }
 
-- 
2.20.1
