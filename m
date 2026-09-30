Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1268A51DAE1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790831; cv=none; b=F5W+1TyMVE+9KWZ5vIJg5VvsUJrTlP0N2YFnh7iOkQfCNEqrcgEEzpdxTWb9nRDLWF46ole62GrlqKyFg3hODW+Q0jmAxRBcthYc/wPALB/ULi4c17ecdwlN1A7i1KllVUP2WmSDR8aQNd1ik3sKPdnMxA661uM15wIUt6ztX14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790831; c=relaxed/simple;
	bh=/u9v33iWlwBpydsQ/YBjmpqjj1cY7t5FLqRteGGl3iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ifdo7mLZZVZbXymc+8bifwcnP4HYAU7OwkV7mokA0O70jQxDkgKzyfSVPKmy30SpzvOqxlhLMgAI9uHmryp3oIDMo+/t9omLHl4R94KL1X3I8KucoDqvuki6Bnf0V5TnCLLX0bQY1NhqmthUWKn511FzA96ocjbtTJvU8LejqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wi3QbhlE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wi3QbhlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F711F000FF;
	Wed, 30 Sep 2026 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790790830;
	bh=H5f6mYX7zUuljbbM5ONB5c1sCOASZNSuLoqxUSnKaRg=;
	h=From:Date:Subject:To:Cc;
	b=Wi3QbhlEoSR4I60NqHejXvoGMpBnPpP34GsGzASRn0RUonsJouN4btDCSSW7RH0/I
	 wpPZ2zLtPTteoi7Ay4NajoD8B+vgDZl+K8efvNE6wltkkQVPWnw4oMKLMRlv+13TvH
	 zsPmd2CHk9Rnz23V/TCW1Vnw5mNKoghhi/kxDn0n8+nWubGwiYAFQWcsGw1mf+WABC
	 L/8WSe7227y8BpByehY5OvuAdEAiPg7xdY4K3F/YrnVBfmqGPnzcikByv9UsMev+0S
	 kzvyWaiMiQiDFjFJ6CQr6TnKE+Mpbwj7sJbRS5HcrXeUGJgZCj3QtJ6Rt2/OhN3JD+
	 q0uHHIuRv9fhA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 30 Sep 2026 18:53:36 +0100
Subject: [PATCH v2] mm/vma: don't remove VMA from rmap if pgoff unchanged
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-speed-up-inplace-rmap-v2-1-ac1aa19708aa@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7RgooJWV9zAs2jLARCzNVImGc
 HcrF3D5XvLfXyGSMEVoshWEFo48+wTqkIEbjR8IuUsMKlen/KJqjIGow1dA9mEyjlAeJqDOdW9
 tqSvd15C2Qajn9969tYlHjs9ZPvvNUvzsv+JSYIHWWFdpR2eny+udxNN0nGWAdtu2LyRtCb67A
 AAA
X-Change-ID: 20260925-speed-up-inplace-rmap-808fbb3848f5
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, 
 Lance Yang <lance.yang@linux.dev>, Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ljs@kernel.org, 
 Pan Deng <pan.deng@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15717; i=ljs@kernel.org;
 h=from:subject:message-id; bh=/u9v33iWlwBpydsQ/YBjmpqjj1cY7t5FLqRteGGl3iY=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLL2+qy0MJ4q8JyDf6vLP6U3cTlG0+5+Wv4jw8oiIsPwt
 NHXIJE7HaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZjIs0JGhmty7/bvKLpqrsC0
 SNfYUmjDmYePDy1zY81Knpd86cRitY2MDJ/15W/39ssUL7htsbCrXHxe5Tzt9GXN6d217B2sigd
 CuAE=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

When updating a VMA, vma_prepare() unconditionally removes it from its rmap
interval trees under the rmap lock, and vma_complete() reinserts it before
releasing the lock.

This is wholly unnecessary if its page offset (file rmap) or anonymous page
offset (anon rmap) is unchanged.

So, track whether they will change in the newly introduced
vp->file_pgoff_unchanged and vp->anon_pgoff_unchanged fields, and use them
to determine whether to remove the VMA or not.

The rmap lock keeps things safe as no rmap walks can concurrently occur
during the operation.

Additionally, some architectures (arm, parisc, nios2, csky) have dcache
flush rmap walkers which take only flush_dcache_mmap_lock(), which is
likewise held across the operation.

If the VMA remains in the tree, it's necessary to keep the augmented
rb_subtree_last field updated to reflect its changed range.

Provide mapping_rmap_tree_[pre, post]_update() and
anon_rmap_tree_[pre, post]_update_vma() (replacing the existing logic in
the anonymous case) to handle both the changed and unchanged cases.

For the anon rmap case, with CONFIG_DEBUG_VM_RB set, avc->cached_vma_last
is also updated when propagating in place.

When performing a VMA shrink or a split where the VMA is the lower one, the
page offset cannot change, so set the flags unconditionally in these cases.

When merging VMAs the page offset is unchanged only in some cases, so
update init_multi_vma_prep() to set the flags only if the page offsets
remain the same.

Finally, while we're here, also update expand_upwards() similarly.

These changes ultimately result in less rmap lock contention.

Pan Deng reported results using the UnixBench/excel benchmark on a 2-socket
192 core, 384 thread x86-64 system for v7.3-rc4 with/without the patch
applied:

Execl Throughput, index score:

                    avg    %stdev      min        max
  v7.3-rc4        3511.5     0.44%    3494.5    3543.4
  + patch         4069.0     0.48%    4047.4    4109.5 (+15.9%)

Average wait on file rmap lock in ms, 5 runs per kernel:

               avg      %stdev     min       max
  v7.3-rc4    9.470     2.91%     9.070     9.820
  + patch     8.420     3.34%     8.100     8.770 (-11.1%)

Profiling data obtained during the operation highlighted the file rmap lock
as the primary source of contention.

Suggested-by: Pan Deng <pan.deng@intel.com>
Reviewed-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
v2:
* Added Suggested-by, as per Pan.
* Added tags (Thanks Rik!)
* Updated commit message to provide perf data from Pan (thanks! :).
* Renamed pgoff_unchanged to file_pgoff_unchanged as per Pedro.
* Implemented mapping_rmap_tree_[pre, post]_update() and
  anon_rmap_tree_[pre, post]_update_vma() to separate out logic into the
  rmap/interval tree code as per Pedro.
* Since this change touched other code, and expand_upwards() is one such
  case, correctly mark it as pgoff unchanged.

v1:
https://lore.kernel.org/r/20260925-speed-up-inplace-rmap-v1-1-babc48ce7c83@kernel.org
---
 include/linux/mm.h                |  10 ++++
 mm/interval_tree.c                | 101 ++++++++++++++++++++++++++++++++++++++
 mm/vma.c                          |  74 +++++++++++-----------------
 mm/vma.h                          |   2 +
 tools/testing/vma/include/stubs.h |  22 +++++++++
 5 files changed, 164 insertions(+), 45 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6e71eaa4af3f..6da674fe3a93 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4357,6 +4357,12 @@ void mapping_rmap_tree_insert_after(struct vm_area_struct *vma,
 				    struct address_space *mapping);
 void mapping_rmap_tree_remove(struct vm_area_struct *vma,
 			      struct address_space *mapping);
+void mapping_rmap_tree_pre_update(struct vm_area_struct *vma,
+				  struct address_space *mapping,
+				  bool pgoff_unchanged);
+void mapping_rmap_tree_post_update(struct vm_area_struct *vma,
+				   struct address_space *mapping,
+				   bool pgoff_unchanged);
 struct vm_area_struct *
 mapping_rmap_tree_iter_first(struct address_space *mapping,
 			     pgoff_t pgoff_start, pgoff_t pgoff_last);
@@ -4374,6 +4380,10 @@ void anon_rmap_tree_insert(struct anon_vma_chain *avc,
 			   struct anon_vma *anon_vma);
 void anon_rmap_tree_remove(struct anon_vma_chain *avc,
 			   struct anon_vma *anon_vma);
+void anon_rmap_tree_pre_update_vma(struct vm_area_struct *vma,
+				   bool anon_pgoff_unchanged);
+void anon_rmap_tree_post_update_vma(struct vm_area_struct *vma,
+				    bool anon_pgoff_unchanged);
 struct anon_vma_chain *
 anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
 			  pgoff_t pgoff_start, pgoff_t pgoff_last);
diff --git a/mm/interval_tree.c b/mm/interval_tree.c
index 7bbbf15cfbf0..9e24bb99fd80 100644
--- a/mm/interval_tree.c
+++ b/mm/interval_tree.c
@@ -64,6 +64,51 @@ void mapping_rmap_tree_remove(struct vm_area_struct *vma,
 	__mapping_rmap_tree_remove(vma, &mapping->i_mmap);
 }
 
+static void mapping_rmap_tree_update_inplace(struct vm_area_struct *vma)
+{
+	/* Propagate all the way up the tree. */
+	__mapping_rmap_tree_augment.propagate(&vma->shared.rb, NULL);
+}
+
+/**
+ * mapping_rmap_tree_pre_update() - Prepare the file rmap tree for a change to
+ * be made to @vma.
+ * @vma: The VMA about to be updated.
+ * @mapping: The file rmap to which @vma belongs.
+ * @pgoff_unchanged: Whether @vma's page offset will remain unchanged.
+ *
+ * The file rmap lock must be held across the entire update.
+ */
+void mapping_rmap_tree_pre_update(struct vm_area_struct *vma,
+				  struct address_space *mapping,
+				  bool pgoff_unchanged)
+{
+	/* If the pgoff has changed, then remove and reinsert afterwards. */
+	if (!pgoff_unchanged)
+		mapping_rmap_tree_remove(vma, mapping);
+}
+
+/**
+ * mapping_rmap_tree_post_update() - Update the file rmap tree to reflect a
+ * change that has been made to @vma.
+ * @vma: The VMA that has been updated.
+ * @mapping: The file rmap to which @vma belongs.
+ * @pgoff_unchanged: Whether @vma's page offset remained unchanged.
+ *
+ * mapping_rmap_tree_pre_update() must have been called prior to this.
+ *
+ * The file rmap lock must be held across the entire update.
+ */
+void mapping_rmap_tree_post_update(struct vm_area_struct *vma,
+				   struct address_space *mapping,
+				   bool pgoff_unchanged)
+{
+	if (pgoff_unchanged)
+		mapping_rmap_tree_update_inplace(vma);
+	else
+		mapping_rmap_tree_insert(vma, mapping);
+}
+
 struct vm_area_struct *
 mapping_rmap_tree_iter_first(struct address_space *mapping,
 			     pgoff_t pgoff_start, pgoff_t pgoff_last)
@@ -111,6 +156,62 @@ void anon_rmap_tree_remove(struct anon_vma_chain *avc,
 	__anon_rmap_tree_remove(avc, &anon_vma->rb_root);
 }
 
+static void anon_rmap_tree_update_inplace(struct anon_vma_chain *avc)
+{
+#ifdef CONFIG_DEBUG_VM_RB
+	avc->cached_vma_last = avc_last_pgoff(avc);
+#endif
+	/* Propagate all the way up the tree. */
+	__anon_rmap_tree_augment.propagate(&avc->rb, NULL);
+}
+
+/**
+ * anon_rmap_tree_pre_update_vma() - Prepare the anon rmap trees for a change
+ * to be made to @vma.
+ * @vma: The VMA about to be updated, which has an anon rmap assigned and is
+ *       already inserted on its interval trees.
+ * @anon_pgoff_unchanged: Whether @vma's anonymous page offset will remain
+ *                        unchanged.
+ *
+ * The anon rmap lock must be held across the entire update.
+ */
+void anon_rmap_tree_pre_update_vma(struct vm_area_struct *vma,
+				   bool anon_pgoff_unchanged)
+{
+	struct anon_vma_chain *avc;
+
+	if (anon_pgoff_unchanged)
+		return;
+
+	/* If the pgoff has changed, then remove and reinsert afterwards. */
+	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
+		anon_rmap_tree_remove(avc, avc->anon_vma);
+}
+
+/**
+ * anon_rmap_tree_post_update_vma() - Update the anon rmap trees to reflect a
+ * change that has been made to @vma.
+ * @vma: The VMA that has been updated.
+ * @anon_pgoff_unchanged: Whether @vma's anonymous page offset remained
+ *                        unchanged.
+ *
+ * anon_rmap_tree_pre_update_vma() must have been called prior to this.
+ *
+ * The anon rmap lock must be held across the entire update.
+ */
+void anon_rmap_tree_post_update_vma(struct vm_area_struct *vma,
+				    bool anon_pgoff_unchanged)
+{
+	struct anon_vma_chain *avc;
+
+	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma) {
+		if (anon_pgoff_unchanged)
+			anon_rmap_tree_update_inplace(avc);
+		else
+			anon_rmap_tree_insert(avc, avc->anon_vma);
+	}
+}
+
 struct anon_vma_chain *
 anon_rmap_tree_iter_first(struct anon_vma *anon_vma,
 			  pgoff_t pgoff_start, pgoff_t pgoff_last)
diff --git a/mm/vma.c b/mm/vma.c
index 077e23694143..ad6be42cc65a 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -201,8 +201,15 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
 	if (vp->file)
 		vp->mapping = vma->vm_file->f_mapping;
 
-	if (vmg && vmg->skip_vma_uprobe)
+	if (!vmg)
+		return;
+
+	if (vmg->skip_vma_uprobe)
 		vp->skip_vma_uprobe = true;
+	if (vma_start_pgoff(vma) == vmg_start_pgoff(vmg))
+		vp->file_pgoff_unchanged = true;
+	if (vma_start_anon_pgoff(vma) == vmg_start_anon_pgoff(vmg))
+		vp->anon_pgoff_unchanged = true;
 }
 
 /*
@@ -299,38 +306,6 @@ static void __remove_shared_vm_struct(struct vm_area_struct *vma,
 	flush_dcache_mmap_unlock(mapping);
 }
 
-/*
- * vma has an anon rmap assigned, and is already inserted on its interval
- * trees.
- *
- * Before updating the vma's vm_start / vm_end / vm_pgoff fields, the
- * vma must be removed from the anon rmap's interval trees using
- * anon_rmap_tree_pre_update_vma().
- *
- * After the update, the vma will be reinserted using
- * anon_rmap_tree_post_update_vma().
- *
- * The entire update must be protected by exclusive mmap_lock and by
- * the anon rmap root lock.
- */
-static void
-anon_rmap_tree_pre_update_vma(struct vm_area_struct *vma)
-{
-	struct anon_vma_chain *avc;
-
-	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-		anon_rmap_tree_remove(avc, avc->anon_vma);
-}
-
-static void
-anon_rmap_tree_post_update_vma(struct vm_area_struct *vma)
-{
-	struct anon_vma_chain *avc;
-
-	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-		anon_rmap_tree_insert(avc, avc->anon_vma);
-}
-
 /*
  * vma_prepare() - Helper function for handling locking VMAs prior to altering
  * @vp: The initialized vma_prepare struct
@@ -359,16 +334,19 @@ static void vma_prepare(struct vma_prepare *vp)
 
 	if (vp->anon_vma) {
 		anon_vma_lock_write(vp->anon_vma);
-		anon_rmap_tree_pre_update_vma(vp->vma);
+		anon_rmap_tree_pre_update_vma(vp->vma, vp->anon_pgoff_unchanged);
+		/* The adjacent VMA's start is moved, so its page offset changes. */
 		if (vp->adj_next)
-			anon_rmap_tree_pre_update_vma(vp->adj_next);
+			anon_rmap_tree_pre_update_vma(vp->adj_next, false);
 	}
 
 	if (vp->file) {
 		flush_dcache_mmap_lock(vp->mapping);
-		mapping_rmap_tree_remove(vp->vma, vp->mapping);
+		mapping_rmap_tree_pre_update(vp->vma, vp->mapping,
+					     vp->file_pgoff_unchanged);
 		if (vp->adj_next)
-			mapping_rmap_tree_remove(vp->adj_next, vp->mapping);
+			mapping_rmap_tree_pre_update(vp->adj_next, vp->mapping,
+						     false);
 	}
 
 }
@@ -386,8 +364,10 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 {
 	if (vp->file) {
 		if (vp->adj_next)
-			mapping_rmap_tree_insert(vp->adj_next, vp->mapping);
-		mapping_rmap_tree_insert(vp->vma, vp->mapping);
+			mapping_rmap_tree_post_update(vp->adj_next, vp->mapping,
+						      false);
+		mapping_rmap_tree_post_update(vp->vma, vp->mapping,
+					      vp->file_pgoff_unchanged);
 		flush_dcache_mmap_unlock(vp->mapping);
 	}
 
@@ -406,9 +386,9 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
 	}
 
 	if (vp->anon_vma) {
-		anon_rmap_tree_post_update_vma(vp->vma);
+		anon_rmap_tree_post_update_vma(vp->vma, vp->anon_pgoff_unchanged);
 		if (vp->adj_next)
-			anon_rmap_tree_post_update_vma(vp->adj_next);
+			anon_rmap_tree_post_update_vma(vp->adj_next, false);
 		anon_vma_unlock_write(vp->anon_vma);
 	}
 
@@ -593,6 +573,8 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 
 	init_vma_prep(&vp, vma);
 	vp.insert = new;
+	vp.file_pgoff_unchanged = !new_below;
+	vp.anon_pgoff_unchanged = !new_below;
 	vma_prepare(&vp);
 
 	/*
@@ -1346,6 +1328,8 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	vma_start_write(vma);
 
 	init_vma_prep(&vp, vma);
+	vp.file_pgoff_unchanged = true;
+	vp.anon_pgoff_unchanged = true;
 	vma_prepare(&vp);
 	vma_adjust_trans_huge(vma, vma->vm_start, end, NULL);
 
@@ -3453,11 +3437,11 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 				if (vma_test(vma, VMA_LOCKED_BIT))
 					mm->locked_vm += grow;
 				vm_stat_account(mm, vma->vm_flags, grow);
-				anon_rmap_tree_pre_update_vma(vma);
+				anon_rmap_tree_pre_update_vma(vma, true);
 				vma->vm_end = address;
 				/* Overwrite old entry in mtree. */
 				vma_iter_store_overwrite(&vmi, vma);
-				anon_rmap_tree_post_update_vma(vma);
+				anon_rmap_tree_post_update_vma(vma, true);
 
 				perf_event_mmap(vma);
 			}
@@ -3530,12 +3514,12 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 				if (vma_test(vma, VMA_LOCKED_BIT))
 					mm->locked_vm += grow;
 				vm_stat_account(mm, vma->vm_flags, grow);
-				anon_rmap_tree_pre_update_vma(vma);
+				anon_rmap_tree_pre_update_vma(vma, false);
 				vma->vm_start = address;
 				vma_sub_pgoff(vma, grow);
 				/* Overwrite old entry in mtree. */
 				vma_iter_store_overwrite(&vmi, vma);
-				anon_rmap_tree_post_update_vma(vma);
+				anon_rmap_tree_post_update_vma(vma, false);
 
 				perf_event_mmap(vma);
 			}
diff --git a/mm/vma.h b/mm/vma.h
index 7a683272c0a8..074419f2c102 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -28,6 +28,8 @@ struct vma_prepare {
 	struct vm_area_struct *remove2;
 
 	bool skip_vma_uprobe :1;
+	bool file_pgoff_unchanged :1;
+	bool anon_pgoff_unchanged :1;
 };
 
 struct unlink_vma_file_batch {
diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/include/stubs.h
index e4acc6f1fe7b..5d4944581b8d 100644
--- a/tools/testing/vma/include/stubs.h
+++ b/tools/testing/vma/include/stubs.h
@@ -267,6 +267,18 @@ static inline void mapping_rmap_tree_remove(struct vm_area_struct *vma,
 {
 }
 
+static inline void mapping_rmap_tree_pre_update(struct vm_area_struct *vma,
+						struct address_space *mapping,
+						bool pgoff_unchanged)
+{
+}
+
+static inline void mapping_rmap_tree_post_update(struct vm_area_struct *vma,
+						 struct address_space *mapping,
+						 bool pgoff_unchanged)
+{
+}
+
 static inline void flush_dcache_mmap_unlock(struct address_space *mapping)
 {
 }
@@ -281,6 +293,16 @@ static inline void anon_rmap_tree_remove(struct anon_vma_chain *avc,
 {
 }
 
+static inline void anon_rmap_tree_pre_update_vma(struct vm_area_struct *vma,
+						 bool anon_pgoff_unchanged)
+{
+}
+
+static inline void anon_rmap_tree_post_update_vma(struct vm_area_struct *vma,
+						  bool anon_pgoff_unchanged)
+{
+}
+
 static inline void uprobe_mmap(struct vm_area_struct *vma)
 {
 }

---
base-commit: e8d0f6a1b2a447d02845984fa6288787543cb03c
change-id: 20260925-speed-up-inplace-rmap-808fbb3848f5

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

