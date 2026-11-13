Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605796;
	b=LnE+B+3qxOUBUrxNLtIwGvSRxEAsxqouSyN8LL2sZYh2UrmegrxbAt+lXK6pISmWggYw
	 np1L3ygFqNEKP/s47bTWGtZ1qFUm+rh87Q9R1xzjFIUyoIQqNqYq6FTsFrDnkiTAXzmmD
	 fVofwGmxtrs2Y8p8xWak2VfcCgrL4iTFYO/1/eS/2fy2wkDipAqoxZIrDwa/FQwmpEYZt
	 oXL4A5VTsM6vcRgTjKQ+740QHMSk8A4X+Isw+WxKUPmlZRFNcZyJmlIwDEDcS85bxlcC6
	 KnchRnu0KNkpHskY0+ygby82T2rh/YByP8Kw/4qVltLzIM1i6majxJQJvK7GqzdAtig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605796;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gPnwUEYSLzTZbVkXhySPm5pvIGF62+NCNEQU3h43Vfs=;
	b=lywfXcdVxLtdT8gGukiySnAID6nIf9GBXALQvXeNlUxlAPHTwpPB0EFMG1YbwNUelgOJ
	 cl5H/Ocq3yVCObaIxkX2EpunIlubmtbP0mSQGklcL/sbXNFRdqoI85kOdTKW9GFiou0Wm
	 4CyBJxqxUVqCadwCtPGSv43L4kCMQyO8ol/p5ktR+upsnm+yH7sw6VMQQYPoSpaH+4mcV
	 5qRR01ISoiIq+ioc985EORYIA3NSo+dOW3XrOA8BIiZuH4j/oZo1WRfOQ/j4ORk/Kf0WT
	 JIPZdBbUJRTBZsHivOAVV14cxx7WMKVD3DHeMuOp11N+Ggd525gRu+JwMABtY2q537A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Es9ITffG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057B4606A33B;
	Fri, 13 Nov 2026 21:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Es9ITffG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D687C1F000C4;
	Fri, 13 Nov 2026 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794605795;
	bh=gPnwUEYSLzTZbVkXhySPm5pvIGF62+NCNEQU3h43Vfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Es9ITffGVAtood3TqPcxQb1Vt3coZJAUP7xQjoHCBAEfyAThAoU0esJYGe47Jb8lx
	 tAhr/oVOul1Hf6Gmf4ODeEYDIF3S1NyQP6SMomSmSGLMiEyZvW2hLAmO37IQRfj1fo
	 vUdmwrF3zE+lDdWBHX59HlHjVfkN8SZDNBZ8d3/bySQJ8m4vrTZim1fkIrAhv4Go8J
	 vmZ8HgDsThTDePpMqBj0Bsx5U8GvejEJ/LxReRNdJHxxrrtbaMy24Tjsm0oYszvyHT
	 Qa5QwI2NDCDywZzOH5DkLnbhgvhhdmurooxo5uaCpHLjeuUZ69010Zs2aWkkj+jo6C
	 +thSbPlFDdcBA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 13 Nov 2026 22:36:13 +0100
Subject: [PATCH 2/2] mm/mempolicy: limit shared policy ranges per inode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
In-Reply-To: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
To: Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6032; i=david@kernel.org;
 h=from:subject:message-id; bh=VjKpybYOrwS3f0sP0BeGTTuXV1Yff60dPS1hB88MhLw=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLK+N13YsvDL674K780d32W+yIv/dE38qfWT82bVHZkQo
 xDe6g9rO0pZGMQ4GGTFFFmCgu8bvHy5rrbajY8ZZg4rE8gQBi5OAZiInSsjwyfJys8f5DS+Pe1d
 Yug8d7FjHKfW9v0eFhvvHzl5JjRgvwUjw7Lj7MdN9H8eMi1aH/Lk0bszX4Lb/zavXMpVcnXHOg+
 Tj3wA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

Shared NUMA policy ranges can accumulate on an inode after its mappings
are removed. Currently, these nodes are effectively unbounded (even though
the allcoations are charged).

An unbounded tree can cause long rwlock hold times when replacing or
freeing policies. Instead of trying to fix that, it sounds more like
having many nodes is actually only a scenario for processes trying to
cause trouble. Most use cases will probably only use a handful of them,
not millions.

Add vm.max_shared_policy_count (inspired by vm.max_map_count), defaulting
to 1024 ranges per inode. Reject updates with -ENOMEM if they would
increase the count beyond the limit, taking merging, splitting etc.
into account.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 Documentation/admin-guide/sysctl/vm.rst | 18 +++++++++++
 include/linux/mempolicy.h               |  1 +
 mm/mempolicy.c                          | 57 +++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 3cb0138e850c1..8ef63d933821b 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -41,6 +41,7 @@ Currently, these files are in /proc/sys/vm:
 - legacy_va_layout
 - lowmem_reserve_ratio
 - max_map_count
+- max_shared_policy_count
 - mem_profiling         (only if CONFIG_MEM_ALLOC_PROFILING=y)
 - memory_failure_early_kill
 - memory_failure_recovery
@@ -473,6 +474,23 @@ e.g., up to one or two maps per allocation.
 The default value is 65530.
 
 
+max_shared_policy_count
+=======================
+
+The maximum number of shared NUMA policy ranges stored on a single inode.
+This applies to tmpfs files, shared anonymous mappings, shmem-backed memfds
+and System V shared memory segments, and guest_memfds. The policies are
+shared by all mappings of the same inode and remain after all mappings are
+removed.
+
+An update that would increase the number of ranges beyond this limit fails
+with -ENOMEM; this includes splitting of existing ranges. Lowering the
+limit will not remove existing policies. Updates that preserve or reduce
+the count remain allowed even if it exceeds the limit.
+
+The default value is 1024. The minimum value is 1.
+
+
 mem_profiling
 ==============
 
diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index cd8f944209ca4..828e7de6dee73 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -113,6 +113,7 @@ static inline bool mpol_equal(struct mempolicy *a, struct mempolicy *b)
 struct shared_policy {
 	struct rb_root root;
 	rwlock_t lock;
+	unsigned int nr_nodes;
 };
 struct sp_node {
 	struct rb_node nd;
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 183bc3bd077cd..a54c6423faeaa 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -106,6 +106,7 @@
 #include <linux/rmap.h>
 #include <linux/security.h>
 #include <linux/syscalls.h>
+#include <linux/sysctl.h>
 #include <linux/ctype.h>
 #include <linux/mm_inline.h>
 #include <linux/mmu_notifier.h>
@@ -130,6 +131,28 @@
 static struct kmem_cache *policy_cache;
 static struct kmem_cache *sn_cache;
 
+static int sysctl_max_shared_policy_count __read_mostly = 1024;
+
+#ifdef CONFIG_SYSCTL
+static const struct ctl_table mempolicy_sysctls[] = {
+	{
+		.procname	= "max_shared_policy_count",
+		.data		= &sysctl_max_shared_policy_count,
+		.maxlen		= sizeof(sysctl_max_shared_policy_count),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ONE,
+	},
+};
+
+static int __init mempolicy_sysctl_init(void)
+{
+	register_sysctl_init("vm", mempolicy_sysctls);
+	return 0;
+}
+subsys_initcall(mempolicy_sysctl_init);
+#endif
+
 /* Highest zone. An specific allocation for a zone below that is not
    policied. */
 enum zone_type policy_zone = 0;
@@ -3006,6 +3029,7 @@ static void sp_insert(struct shared_policy *sp, struct sp_node *new)
 	}
 	rb_link_node(&new->nd, parent, p);
 	rb_insert_color(&new->nd, &sp->root);
+	sp->nr_nodes++;
 }
 
 /* Find shared policy intersecting idx */
@@ -3165,6 +3189,7 @@ void mpol_put_task_policy(struct task_struct *task)
 static void sp_delete(struct shared_policy *sp, struct sp_node *n)
 {
 	rb_erase(&n->nd, &sp->root);
+	sp->nr_nodes--;
 	sp_free(n);
 }
 
@@ -3197,6 +3222,30 @@ static struct sp_node *sp_alloc(unsigned long start, unsigned long end,
 	return n;
 }
 
+static int sp_check_node_limit(struct shared_policy *sp, struct sp_node *n,
+			       pgoff_t start, pgoff_t end, bool new)
+{
+	unsigned long new_nodes = new ? 1 : 0;
+
+	if (n && n->start < start) {
+		/*
+		 * Splitting adds one node for the old policy. Otherwise,
+		 * check the successor.
+		 */
+		if (n->end > end)
+			new_nodes++;
+		else
+			n = rb_entry_safe(rb_next(&n->nd), struct sp_node, nd);
+	}
+	/* Without a new node, or with a whole node removed, the count cannot grow. */
+	if (!new_nodes || (n && n->end <= end))
+		return 0;
+
+	if (sp->nr_nodes + new_nodes > READ_ONCE(sysctl_max_shared_policy_count))
+		return -ENOMEM;
+	return 0;
+}
+
 /* Replace a policy range. */
 static int shared_policy_replace(struct shared_policy *sp, pgoff_t start,
 				 pgoff_t end, struct sp_node *new)
@@ -3226,6 +3275,13 @@ static int shared_policy_replace(struct shared_policy *sp, pgoff_t start,
 		}
 	}
 	n = sp_lookup(sp, start, end);
+
+	ret = sp_check_node_limit(sp, n, start, end, new);
+	if (ret) {
+		write_unlock(&sp->lock);
+		goto err_out;
+	}
+
 	/* Take care of old policies in the same range. */
 	while (n && n->start < end) {
 		struct rb_node *next = rb_next(&n->nd);
@@ -3297,6 +3353,7 @@ void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol)
 
 	sp->root = RB_ROOT;		/* empty tree == default mempolicy */
 	rwlock_init(&sp->lock);
+	sp->nr_nodes = 0;
 
 	if (mpol) {
 		struct sp_node *sn;

-- 
2.43.0

