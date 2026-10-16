Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CE23F4101;
	Fri, 16 Oct 2026 11:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150489; cv=none; b=l6nFOYmULsXLDzTs0jTWvGswqLaZ4SarXQ1wsEclaU1J2DqAopnjCO9A9fGccaLp1UOmW3smcCNZgkvvYcJTyys7fybSXINxGZtSLq2vZmQ18ouFNUBR5KHz2J8X/c4LKOTvnY4gxaoeAE+y8SK0in0A7w3pAeTELtj8am4+VYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150489; c=relaxed/simple;
	bh=di3crQpqffVZ11P1HYYwBI3VJ7kjI4iXi6Edj023gHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Up3+bSPkW2r15o1hHUcLJeGYF6/NuF8fJ/TBy0rB0Q5n2W1r8odKBtW+GQ/dL5rxQjf+oKNEd6BbNtjMBsErO2aoV1XlN1Ofvc2tE2cj5wcY1DXqM38CLzYAqkMr6G0Iaabb/rqRDOjLAZ1xB4odeWSx/8mn8HHq9j4sihUeES4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDoFnZAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDoFnZAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20311F000C4;
	Fri, 16 Oct 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792150487;
	bh=J4Pzmcqwh2wHRFsEx+8XafyiGzh+G+LbFBMq6o7e9ag=;
	h=From:Date:Subject:To:Cc;
	b=gDoFnZAom0CpAkjudsJ5NDD8RkMV/eTr6vMsXxScp4qE6pmhIxyhKusBf9XFiITRA
	 slrSZQ40Xs0pSJobQpvZYeuWeJMilqSVUxQP7VHiG8q1ei9lX7x6bq6g4Ud3hkQasJ
	 OZ3MsI5wd6gtbQuuWtkuaCceApqqJ+14mGIyIzNp3PAidke9kh82Sga7ZIpndu3WFH
	 gXhQjgO7LApxVL2mWiZsIZNHrv1g2L02MrCvahFMG45dRm9QIpbKUTDWflD8fQvt2B
	 DJLnd2dEfdnpLVdP9Y7Fz2I2oTEgvVIdnqJW6ZmU2xye9j0/tzsH6UMrayncDCSgrs
	 hHKw3I1lOvhQg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Fri, 16 Oct 2026 12:34:33 +0100
Subject: [PATCH v2] mm/vma: avoid spurious write locks when mm->mm_lock_seq
 overflows
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhOI0RceQ/DorQDNFRqpqZqC
 He3cgGX7+f/91dILJ4TXKoVhLNPPi4F9KECO5llZPSuMGilG1JU4+DfmO8GQ7QzxswyhPhCHhy
 drekb5hbK9iFcirv31hWefHpG+ew3mX7pP2MmJFTUc69PtWuduc4sC4djlBG6bdu+HuzIdbsAA
 AA=
X-Change-ID: 20261015-fix-vma-lock-overflow-efd18cab6ee9
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, ljs@kernel.org, 
 Daehyeon Ko <4ncienth@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=17211; i=ljs@kernel.org;
 h=from:subject:message-id; bh=di3crQpqffVZ11P1HYYwBI3VJ7kjI4iXi6Edj023gHg=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLIucV9OcFRvVpvjql1/qcXjnlrAYyX50DP/RPVvHQnjW
 320J7i0o5SFQYyLQVZMkeX5F/H9QSJh8zov+LvBzGFlAhnCwMUpABNRzmH4p10fk6m1dWdksnXz
 +vhskWqdX3P/X85/IVHtIxvWfHHuSkaGXzePVTKflXXtun/vYNgrpXNyWbMvrQq+UVb7evtbG/M
 CVgA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

So far the assumption has been that mm->mm_lock_seq overflow is benign,
resulting only in readers spuriously falling back to the mmap lock, however
it turns out that this was an unsafe assumption.

If a VMA can be spuriously considered write locked that means read lock
exclusion does not take place, and thus a VMA can end up write-locked with
concurrent readers.

Since overflow only occurs every 2^31 write lock/unlock cycles, resolve the
issue by resetting every VMA's vma->vm_lock_seq each time such an overflow
occurs.

This is done in vma_end_write_all(), which is called when the mmap write
lock is released, i.e. in mmap_write_unlock() and mmap_write_downgrade().

Care must be taken, as resetting the sequence count at overflow means
changing the seqcount of VMAs which are already attached and observable.

The mm's seqcount is guaranteed to be odd when a write lock is held, and
thus any write locked VMA will have an odd seqcount assigned.

Therefore resetting to an even value prevents spurious write locks, since
these can only occur with the mmap write lock held, at which point the mmap
seqcount will be odd.

However, vma_start_read() also checks vma->vm_lock_seq == mm->mm_lock_seq,
bailing if so (indicating a write lock).

This would cause any even reset value chosen to prevent VMA read locks from
being taken - avoid this by also checking whether the VMA seqcount is odd
before bailing on the read lock.

So far, vma->vm_lock_seq has defaulted to UINT_MAX, but this has been
unnecessary since commit e5e7fb278e59 ("mm: convert mm_lock_seq to a proper
seqcount"), since this is assigned when the VMA is still detached, and
cannot be observed.

Therefore perform both reset and initialisation of vma->vm_lock_seq by
simply setting vma->vm_lock_seq to zero.

The reset, performed in __mm_reset_vma_seqcounts(), only needs to
WRITE_ONCE() the value.

However the read of vma->vm_lock_seq in vma_start_read() needs to have
acquire semantics to pair with the smp_wmb() in do_raw_write_seqcount_end()
so a reader reading a reset value also observes VMA modifications made
under the write lock.

Since all VMA write locks were just released and the mmap write lock is
still held, there are no concurrent VMA writers.

Concurrent VMA readers are unaffected. New VMA readers observe either zero,
never a write lock, or the prior seqcount, behaving as before the reset.

Since this only occurs every 2^31 write lock/unlock cycles, the time taken
to update all VMAs is considered to be acceptable.

Also update comments, documentation and VMA userland tests to reflect the
change.

User facing effects are - dangerous races that could cause memory
corruption or NULL pointer derefences (especially on page table traversal)
are avoided.

Reported-by: Daehyeon Ko <4ncienth@gmail.com>
Closes: https://lore.kernel.org/all/20261015143735.1630957-1-4ncienth@gmail.com/
Fixes: 5e31275cc997 ("mm: add per-VMA lock and helper functions to control it")
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Andrew - no stable tag please.

I will do the stable backports manually, they can be solved with a different
approach.

Also, since, we're so close to the merge window I'm applying this against
mm-unstable.

So I think it's fine to just send it (early :) in the merge window.
---
v2:
* Updated comment in vma_seqcount_is_write_locked() to mention the VMA
  being attached.
* Renamed reset_vma_seqcounts() to __mm_reset_vma_seqcounts().
* Used acquire semantics in vma_start_reads() to avoid race with reset -
  there is another acquire immediately after this one so it should just be
  noise perf-wise.
* Removed stable tag, will do the backports manually (just make the value
  64 bits...)
* Updated comments to reflect changes.
* Added user-facing effects as per Vlasta ;)

v1:
https://lore.kernel.org/r/20261015-fix-vma-lock-overflow-v1-1-01beb245d9da@kernel.org
---
 Documentation/mm/process_addrs.rst | 14 ++++--
 include/linux/mm_types.h           | 12 +++--
 include/linux/mmap_lock.h          | 24 +++++++---
 mm/mmap_lock.c                     | 89 +++++++++++++++++++++++++++++++++-----
 tools/testing/vma/include/dup.h    |  2 +-
 tools/testing/vma/shared.c         |  8 ++--
 6 files changed, 120 insertions(+), 29 deletions(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index 78231995e490..04b649818cc1 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -819,9 +819,17 @@ All this is achieved by the use of per-mm and per-VMA sequence counts, which are
 used in order to reduce complexity, especially for operations which write-lock
 multiple VMAs at once.
 
-If the mm sequence count, :c:member:`!mm->mm_lock_seq` is equal to the VMA
-sequence count :c:member:`!vma->vm_lock_seq` then the VMA is write-locked. If
-they differ, then it is not.
+The mm sequence count :c:member:`!mm->mm_lock_seq` is incremented on both mmap
+write lock and unlock, so it is odd while the mmap write lock is held. If it is
+equal to the VMA sequence count :c:member:`!vma->vm_lock_seq`, and that value
+is odd, then the VMA is write-locked. If they differ, then it is not.
+
+A VMA's sequence count is not updated on unlock, so after 2^31 write lock/unlock
+cycles the mm sequence count would wrap and match stale VMA values again. To
+prevent this, when the mm sequence count wraps to zero,
+:c:func:`!vma_end_write_all` invokes :c:func:`!__mm_reset_vma_seqcounts` to
+reset every VMA's sequence count to zero, an even value which can never
+indicate a write lock.
 
 Each time the mmap write lock is released in :c:func:`!mmap_write_unlock` or
 :c:func:`!mmap_write_downgrade`, :c:func:`!vma_end_write_all` is invoked which
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 0dead656d3e3..1ed35d258d2e 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -992,15 +992,19 @@ struct vm_area_struct {
 	 * Can only be written (using WRITE_ONCE()) while holding both:
 	 *  - mmap_lock (in write mode)
 	 *  - vm_refcnt bit at VM_REFCNT_EXCLUDE_READERS_FLAG is set
+	 * The one exception is __mm_reset_vma_seqcounts(), which stores zero
+	 * (an even value, which can never indicate a write lock) under the
+	 * mmap write lock alone once the mm seqcount has wrapped, so a reader
+	 * holding only vm_refcnt may observe the value change from odd to zero.
 	 * Can be read reliably while holding one of:
 	 *  - mmap_lock (in read or write mode)
-	 *  - vm_refcnt bit at VM_REFCNT_EXCLUDE_READERS_BIT is set or vm_refcnt > 1
+	 *  - vm_refcnt bit at VM_REFCNT_EXCLUDE_READERS_BIT is set
 	 * Can be read unreliably (using READ_ONCE()) for pessimistic bailout
 	 * while holding nothing (except RCU to keep the VMA struct allocated).
 	 *
-	 * This sequence counter is explicitly allowed to overflow; sequence
-	 * counter reuse can only lead to occasional unnecessary use of the
-	 * slowpath.
+	 * Assigned the (odd) mm seqcount on write lock and not updated on
+	 * unlock, so a stale value would alias the mm seqcount again 2^31 write
+	 * lock/unlock cycles later. The reset described above prevents this.
 	 */
 	unsigned int vm_lock_seq;
 
diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index e5553f4a414c..11b3ffef3966 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -154,7 +154,7 @@ static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
 #endif
 	if (reset_refcnt)
 		refcount_set(&vma->vm_refcnt, 0);
-	vma->vm_lock_seq = UINT_MAX;
+	vma->vm_lock_seq = 0;
 }
 
 /*
@@ -229,8 +229,9 @@ static inline void vma_refcount_put(struct vm_area_struct *vma)
 
 /*
  * Use only while holding mmap read lock which guarantees that vma lock is not
- * contended (nobody can concurrently write-lock the vma). vma_start_read() should
- * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * contended (nobody can concurrently write-lock the vma). vma_start_read() need
+ * not be used in such cases, as the mmap lock already excludes VMA writers so
+ * its sequence number checks are redundant.
  * This functionality is used to obtain vma read lock and drop the mmap read lock.
  *
  * VMA can't be detached while we are holding mmap lock, therefore in practice this
@@ -252,8 +253,9 @@ static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int
 
 /*
  * Use only while holding mmap read lock which guarantees that vma lock is not
- * contended (nobody can concurrently write-lock the vma). vma_start_read() should
- * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * contended (nobody can concurrently write-lock the vma). vma_start_read() need
+ * not be used in such cases, as the mmap lock already excludes VMA writers so
+ * its sequence number checks are redundant.
  * This functionality is used to obtain vma read lock and drop the mmap read lock.
  *
  * VMA can't be detached while we are holding mmap lock, therefore in practice this
@@ -552,6 +554,8 @@ static inline int __must_check mmap_write_lock_killable(struct mm_struct *mm)
 	return ret;
 }
 
+void __mm_reset_vma_seqcounts(struct mm_struct *mm);
+
 /*
  * Drop all currently-held per-VMA locks.
  * This is called from the mmap_lock implementation directly before releasing
@@ -564,6 +568,16 @@ static inline void vma_end_write_all(struct mm_struct *mm)
 {
 	mmap_assert_write_locked(mm);
 	mm_lock_seqcount_end(mm);
+
+	/*
+	 * VMA seqcounts are not updated on unlock, so once the mm seqcount has
+	 * wrapped, any VMA still carrying a sequence number from before the
+	 * wrap would satisfy __is_vma_write_locked() when that number comes
+	 * round again, and readers would not be excluded. Reset every VMA's
+	 * seqcount so that no stale value survives the wrap.
+	 */
+	if (unlikely(!mm->mm_lock_seq.sequence))
+		__mm_reset_vma_seqcounts(mm);
 }
 
 static inline void mmap_write_unlock(struct mm_struct *mm)
diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
index 2f94ee0fdee2..83b7d3ded0dc 100644
--- a/mm/mmap_lock.c
+++ b/mm/mmap_lock.c
@@ -194,21 +194,38 @@ void __vma_exclude_readers_for_detach(struct vm_area_struct *vma)
 	WARN_ON_ONCE(!ves.detached);
 }
 
+/* Do the VMA, mm seqcounts indicate the VMA is write locked? */
+static bool vma_seqcount_is_write_locked(unsigned int vma_seq, unsigned int mm_seq)
+{
+	/* VMA and mm sequence numbers must match for a write lock. */
+	if (vma_seq != mm_seq)
+		return false;
+
+	/*
+	 * The VMA seqcount is always odd if locked. For an attached VMA an even
+	 * value can only be the zero stored by __mm_reset_vma_seqcounts(),
+	 * never a write lock.
+	 */
+	return vma_seq & 1;
+}
+
 /*
  * Try to read-lock a vma. The function is allowed to occasionally yield false
  * locked result to avoid performance overhead, in which case we fall back to
  * using mmap_lock. The function should never yield false unlocked result.
- * False locked result is possible if mm_lock_seq overflows or if vma gets
- * reused and attached to a different mm before we lock it.
+ * False locked result is possible if vma gets reused and attached to a
+ * different mm before we lock it.
  * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
  * detached.
  *
  * IMPORTANT: RCU lock must be held upon entering the function, but upon error
  *            IT IS RELEASED. The caller must handle this correctly.
  */
-static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
-						    struct vm_area_struct *vma)
+static struct vm_area_struct *vma_start_read(struct mm_struct *mm,
+					     struct vm_area_struct *vma)
 {
+	unsigned int vma_seq;
+	unsigned int mm_seq;
 	struct mm_struct *other_mm;
 	int oldcnt;
 
@@ -220,7 +237,9 @@ static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
 	 * we don't rely on for anything - the mm_lock_seq read against which we
 	 * need ordering is below.
 	 */
-	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence)) {
+	vma_seq = READ_ONCE(vma->vm_lock_seq);
+	mm_seq = READ_ONCE(mm->mm_lock_seq.sequence);
+	if (vma_seqcount_is_write_locked(vma_seq, mm_seq)) {
 		vma = NULL;
 		goto err;
 	}
@@ -246,17 +265,26 @@ static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
 		goto err_unstable;
 
 	/*
-	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
-	 * False unlocked result is impossible because we modify and check
+	 * False unlocked result is impossible because a write lock sets
 	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
 	 * modification invalidates all existing locks.
 	 *
-	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
-	 * racing with vma_end_write_all(), we only start reading from the VMA
-	 * after it has been unlocked.
-	 * This pairs with RELEASE semantics in vma_end_write_all().
+	 * ACQUIRE semantics are required for both reads.
+	 *
+	 * __mm_reset_vma_seqcounts() might reset vma->vm_lock_seq to zero
+	 * after an overflow. A reader observing that zero must also observe
+	 * the VMA modifications made under the write lock which just ended, so
+	 * the ACQUIRE pairs with the smp_wmb() in do_raw_write_seqcount_end()
+	 * that precedes the reset stores.
+	 *
+	 * The ACQUIRE semantics for the mm_lock_seq read is required so that,
+	 * if we are racing with vma_end_write_all(), we only start reading from
+	 * the VMA after it has been unlocked. This pairs with the RELEASE
+	 * semantics in vma_end_write_all().
 	 */
-	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
+	vma_seq = smp_load_acquire(&vma->vm_lock_seq);
+	mm_seq = raw_read_seqcount(&mm->mm_lock_seq);
+	if (unlikely(vma_seqcount_is_write_locked(vma_seq, mm_seq))) {
 		vma_refcount_put(vma);
 		vma = NULL;
 		goto err;
@@ -466,6 +494,43 @@ struct vm_area_struct *lock_next_vma(struct mm_struct *mm,
 	return vma;
 }
 
+/*
+ * Called with mmap write lock held after mm->mm_lock_seq just overflowed (and
+ * therefore zero), with all VMA write locks now released.
+ *
+ * The stores below follow the smp_wmb() in do_raw_write_seqcount_end(), so
+ * a reader that observes a reset value also observes this cycle's VMA
+ * modifications (ordered by the ACQUIRE on vma->vm_lock_seq in
+ * vma_start_read()).
+ */
+void __mm_reset_vma_seqcounts(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+	VMA_ITERATOR(vmi, mm, 0);
+
+	mmap_assert_write_locked(mm);
+	VM_WARN_ON_ONCE(mm->mm_lock_seq.sequence);
+
+	/*
+	 * Failing to reset means stale vma->vm_lock_seq values could result in
+	 * those VMAs becoming spuriously write locked when mm->mm_lock_seq
+	 * happens to match their values.
+	 *
+	 * This is problematic, as it causes the VMA write lock to not exclude
+	 * readers, which can result in concurrent readers while a VMA write
+	 * lock is held.
+	 *
+	 * Avoid this by resetting to an even value (indicates no write lock
+	 * held).
+	 *
+	 * Readers will either observe zero (not write locked) or the previous
+	 * value, so this is safe.
+	 */
+	for_each_vma(vmi, vma)
+		WRITE_ONCE(vma->vm_lock_seq, 0);
+}
+EXPORT_SYMBOL(__mm_reset_vma_seqcounts);
+
 #ifdef CONFIG_LOCK_MM_AND_FIND_VMA
 #include <linux/extable.h>
 
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 718132580fac..f449129ea97a 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1225,7 +1225,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	vma->vm_lock_seq = UINT_MAX;
+	vma->vm_lock_seq = 0;
 }
 
 /*
diff --git a/tools/testing/vma/shared.c b/tools/testing/vma/shared.c
index 8c4826499f40..c1e0c2280101 100644
--- a/tools/testing/vma/shared.c
+++ b/tools/testing/vma/shared.c
@@ -65,7 +65,7 @@ struct vm_area_struct *alloc_and_link_vma(struct mm_struct *mm,
 	 * begun. Linking to the tree will have caused this to be incremented,
 	 * which means we will get a false positive otherwise.
 	 */
-	vma->vm_lock_seq = UINT_MAX;
+	vma->vm_lock_seq = 0;
 
 	return vma;
 }
@@ -97,13 +97,13 @@ int cleanup_mm(struct mm_struct *mm, struct vma_iterator *vmi)
 
 bool vma_write_started(struct vm_area_struct *vma)
 {
-	int seq = vma->vm_lock_seq;
+	unsigned int seq = vma->vm_lock_seq;
 
 	/* We reset after each check. */
-	vma->vm_lock_seq = UINT_MAX;
+	vma->vm_lock_seq = 0;
 
 	/* The vma_start_write() stub simply increments this value. */
-	return seq > -1;
+	return seq > 0;
 }
 
 void __vma_set_dummy_anon_vma(struct vm_area_struct *vma,

---
base-commit: 5ba29027115bc6717b8d6dc3296aae0240933811
change-id: 20261015-fix-vma-lock-overflow-efd18cab6ee9

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

