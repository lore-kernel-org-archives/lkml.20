Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDBF399D08
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228606; cv=none; b=kW7BmX5+8uepnJz3CSOdnarqAXxZKtVeTXqAY3Rl/ZlJyhhj6vnAmak6seT89j19FMf5760swVaADnD5A1fsFc8CiJr5W/mWcfixDcs4dSK9sQmqZxvqlNKKkBRmw5R8MiTcvNCV+B7ouzVUzrlp2VIPXdZGKqBye+oQaEP4VkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228606; c=relaxed/simple;
	bh=UyNcwb9UBjEd4LNKzNSR126TJWgimVj/XZKwh+zDpgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5IPthgjNvi4uBLyvV8RzecULGQ+H1qCDWwVeReow5F51Nlnj21O+tBPUuLPJLPdC9KTDwzWT4hE/O0dZfEE82Zu3BDC1IeUfsFbL/SRvhYOPlik9Il3DimiZyQubHTjLZcYUk9Hct6T+gbQeLM+fZluF2sC3AL8MwkAK9CHXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iU7BKP7/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iU7BKP7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790228604; x=1821764604;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UyNcwb9UBjEd4LNKzNSR126TJWgimVj/XZKwh+zDpgg=;
  b=iU7BKP7/r2vcbgSLvJVfqKpPMSWlZ9SswyYH18EScara4h1Xbqy4DbbI
   4KLTIspgZrXo6zOyW9ciNzcmqHcYjtJh77ofgivRbXBeQAkqHr8frZKrE
   akhJinkizp3aKBLOc5hGrN7+1x1uwa++L9KFTkwq0B/NpJKfCxYO4QXZ4
   tNDZEfmNAImK+KKS8Cgs6JPr0z5IdquqSOAR+/5iFSUJQi4PNHJYc69gY
   yZZEmJWOisxtTEVo4Zy8i7GMYMdMWQ5XQmk5cuzCiscyfFC3lQwpCVOXU
   +LT1gsvxJX0sfnoX/FTS82gTqa2VxypbqUVEuFh7RhmDjNi+b8e34PMa5
   Q==;
X-CSE-ConnectionGUID: mtPmBJ9dQaqmWUGiMnaq+Q==
X-CSE-MsgGUID: YxAAmUxERsS5qQXl8vf/rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89761769"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89761769"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 22:43:23 -0700
X-CSE-ConnectionGUID: D9IIlMmRR+qJbdbJs9L2lw==
X-CSE-MsgGUID: 47sN1UB9R5mCTtuwQLSFOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="303452120"
Received: from linux-pnp-server-17.sh.intel.com ([10.239.166.49])
  by orviesa002.jf.intel.com with ESMTP; 23 Sep 2026 22:43:20 -0700
From: Pan Deng <pan.deng@intel.com>
To: akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Tianyou Li <tianyou.li@intel.com>,
	Wangyang Guo <wangyang.guo@intel.com>,
	Zhiguo Zhou <zhiguo.zhou@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>
Subject: [PATCH] mm/vma: avoid redundant file rmap tree re-insert on new_below=0 split
Date: Thu, 24 Sep 2026 13:43:01 +0800
Message-ID: <20260924054301.2330822-1-pan.deng@intel.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Splitting a file-backed VMA removes it from the mapping's i_mmap interval
tree and re-inserts it, two O(log n) walks with rebalancing, all inside
the i_mmap_rwsem write-side critical section.  For a file mapped by many
processes that lock is a single serialization point, so the cost translates
into reduced exec throughput.

While the re-insert is needed whenever the sort key changes, it is not for
a new_below=0 split: there the new VMA takes the upper half and only the
original VMA's vm_end shrinks, so vma_start_pgoff(), the sort key of the
interval tree, stays constant and the VMA is already in the correct
position.

This change skips the re-insert for that case.  vma_prepare() no longer
removes vp->vma from the tree; instead vma_complete() detects that case and
only recomputes shared.rb_subtree_last up the ancestor chain.  Everything
else keeps the remove + re-insert path.

The case is detected by comparing vma_start_pgoff(vp->insert) against
vma_start_pgoff(vp->vma): only a new_below=0 split leaves the former
greater.  __split_vma() adjusts pgoff via vma_add_pgoff(new,
linear_page_delta(vma, addr)), and linear_page_delta() is
(addr - vm_start) >> PAGE_SHIFT with addr strictly inside the VMA, so the
delta is at least one page and the new VMA's pgoff is strictly greater.
For new_below=1 the two are initially equal and vp->vma's pgoff then
increases, so the comparison is false both before and after the caller's
endpoint updates, and the original path is taken.

Inferring the case this way keeps the change small: struct vma_prepare
gains no field and no caller changes.

Moving the remove() out of vma_prepare() leaves vp->vma in the tree with a
possibly stale sort key across the caller's endpoint updates, so
vma_complete() re-keys it *before* inserting vp->adj_next: otherwise that
key-driven descent could place adj_next in the wrong subtree.

Measured on v7.3-rc4, on a 2-socket 192C/384T system running UnixBench
execl (384 concurrent execve of the same binary), dropping the redundant
remove + re-insert yields ~14% higher throughput by shortening the
i_mmap_rwsem write-side critical section during the file VMA splits that
execve performs on the shared libraries.

Signed-off-by: Pan Deng <pan.deng@intel.com>
Reviewed-by: Tianyou Li <tianyou.li@intel.com>
Reviewed-by: Wangyang Guo <wangyang.guo@intel.com>
Reviewed-by: Zhiguo Zhou <zhiguo.zhou@intel.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Assisted-by: LLM
---
 include/linux/mm.h                |  1 +
 mm/interval_tree.c                | 13 ++++++++
 mm/vma.c                          | 54 +++++++++++++++++++++++++++++--
 mm/vma.h                          |  1 +
 tools/testing/vma/include/stubs.h |  4 +++
 5 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..baf489343f86 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4181,6 +4181,7 @@ void mapping_rmap_tree_insert_after(struct vm_area_struct *vma,
 				    struct address_space *mapping);
 void mapping_rmap_tree_remove(struct vm_area_struct *vma,
 			      struct address_space *mapping);
+void mapping_rmap_tree_propagate(struct vm_area_struct *vma);
 struct vm_area_struct *
 mapping_rmap_tree_iter_first(struct address_space *mapping,
 			     pgoff_t pgoff_start, pgoff_t pgoff_last);
diff --git a/mm/interval_tree.c b/mm/interval_tree.c
index 7bbbf15cfbf0..3b81c990aab2 100644
--- a/mm/interval_tree.c
+++ b/mm/interval_tree.c
@@ -64,6 +64,19 @@ void mapping_rmap_tree_remove(struct vm_area_struct *vma,
 	__mapping_rmap_tree_remove(vma, &mapping->i_mmap);
 }
 
+/*
+ * Recompute shared.rb_subtree_last for vma and its ancestors, for a vma whose
+ * interval changed but whose vma_start_pgoff() (the tree's sort key) did not.
+ * The NULL stop node makes the walk run up to the root, though it ends early
+ * once the recomputed value stops changing.
+ *
+ * Wrapper because INTERVAL_TREE_DEFINE() above declares the callbacks static.
+ */
+void mapping_rmap_tree_propagate(struct vm_area_struct *vma)
+{
+	__mapping_rmap_tree_augment.propagate(&vma->shared.rb, NULL);
+}
+
 struct vm_area_struct *
 mapping_rmap_tree_iter_first(struct address_space *mapping,
 			     pgoff_t pgoff_start, pgoff_t pgoff_last)
diff --git a/mm/vma.c b/mm/vma.c
index f29abb30956b..e1dbfd5094cd 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -365,11 +365,43 @@ static void vma_prepare(struct vma_prepare *vp)
 
 	if (vp->file) {
 		flush_dcache_mmap_lock(vp->mapping);
-		mapping_rmap_tree_remove(vp->vma, vp->mapping);
+		/* vp->vma is re-keyed by vma_complete(), if it needs to be. */
 		if (vp->adj_next)
 			mapping_rmap_tree_remove(vp->adj_next, vp->mapping);
 	}
+}
 
+/*
+ * vma_split_keeps_rmap_key() - Check if vp->vma keeps its file rmap tree key
+ * @vp: The vma_prepare struct
+ *
+ * True only for a new_below=0 __split_vma(): the new VMA takes the upper half,
+ * so its vma_start_pgoff() is strictly greater, while vp->vma's (its key in the
+ * file rmap interval tree) is unchanged and its tree position still correct, so
+ * only shared.rb_subtree_last has to be recomputed.
+ *
+ * Relies on vp->insert being assigned by __split_vma() only; the check below
+ * catches a second assignment site whose VMA does not abut vp->vma.
+ */
+static bool vma_split_keeps_rmap_key(const struct vma_prepare *vp)
+{
+	if (!vp->insert ||
+	    vma_start_pgoff(vp->insert) <= vma_start_pgoff(vp->vma))
+		return false;
+
+	/*
+	 * Today only a new_below=0 __split_vma() reaches here, where the new
+	 * VMA abuts vp->vma at the split point once the caller has updated
+	 * vp->vma->vm_end.  If a future vp->insert user ever violates that,
+	 * fall back to the safe remove + re-insert instead of trusting the
+	 * fast path.
+	 */
+	if (vp->insert->vm_start != vp->vma->vm_end) {
+		VM_WARN_ON_ONCE(1);
+		return false;
+	}
+
+	return true;
 }
 
 /*
@@ -384,9 +416,27 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 			 struct mm_struct *mm)
 {
 	if (vp->file) {
+		if (vma_split_keeps_rmap_key(vp)) {
+			/*
+			 * Split paths go through init_vma_prep(), which
+			 * passes a NULL vmg, so vp->adj_next is never set.
+			 */
+			VM_WARN_ON_ONCE(vp->adj_next);
+			mapping_rmap_tree_propagate(vp->vma);
+		} else {
+			/*
+			 * Re-key vp->vma *before* the insert of vp->adj_next
+			 * below, so that the latter descends a valid
+			 * search tree: vp->vma is the only node left in
+			 * the tree that may carry a stale sort key
+			 * (vp->adj_next itself was removed in
+			 * vma_prepare()).
+			 */
+			mapping_rmap_tree_remove(vp->vma, vp->mapping);
+			mapping_rmap_tree_insert(vp->vma, vp->mapping);
+		}
 		if (vp->adj_next)
 			mapping_rmap_tree_insert(vp->adj_next, vp->mapping);
-		mapping_rmap_tree_insert(vp->vma, vp->mapping);
 		flush_dcache_mmap_unlock(vp->mapping);
 	}
 
diff --git a/mm/vma.h b/mm/vma.h
index 024fabe63560..3f791e4d13f6 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -23,6 +23,7 @@ struct vma_prepare {
 	struct file *file;
 	struct address_space *mapping;
 	struct anon_vma *anon_vma;
+	/* Set by __split_vma() only; see vma_split_keeps_rmap_key(). */
 	struct vm_area_struct *insert;
 	struct vm_area_struct *remove;
 	struct vm_area_struct *remove2;
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index d6136e19a8af..3b5184aeee54 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -267,6 +267,10 @@ static inline void mapping_rmap_tree_remove(struct vm_area_struct *vma,
 {
 }
 
+static inline void mapping_rmap_tree_propagate(struct vm_area_struct *vma)
+{
+}
+
 static inline void flush_dcache_mmap_unlock(struct address_space *mapping)
 {
 }
-- 
2.43.5

