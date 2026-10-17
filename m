Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024FE3B42F2;
	Sat, 17 Oct 2026 03:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792206730; cv=none; b=WjMpABRCRN/x2M01AL6yVFKoiBuVsC70zk20JQ7PXvQg2KpUGZQbzT9J9evDLOxM1SE1wC1+Wl0vNIOtaLI+dSvCfzQhVsuWzc65Ox0YNCNnUOfD0ZtVFBN9rG2YIQqN216ADGZmBDisQ1hjCJpT1xqTmo96rxXF86c3mUkCpmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792206730; c=relaxed/simple;
	bh=2B7R18j6bcZQAq0aIetlfTUxGElhT/YSCSUN6yZw/ro=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JUVNjk+ETmAHFyikisK/hEUiaJvJrhOJiId+zxxwjn80ZcBrX2XGn5l+9+KI+P9mUj6hSWioJhII89ibuu6SWejVGtpCzHtfetAbEXfFJfaAa/z3WUXOBd8ckJGyO2Y12RVBux/SiaGnt9yW4X3HXAxB5sr4HrUxPlss1ZcQMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1NOOALiy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1NOOALiy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72731F000C4;
	Sat, 17 Oct 2026 03:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792206728;
	bh=Gzd6R4kXyaI9HHxLjr1N3XSpTiCwIBCoqOgIfzXjZTE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=1NOOALiy3mqY+yAiTp5t+cV2XykkM0Q53+883i9ROQbvGIqJBYaYnc4fpngT4X/XQ
	 yP86WlnY0bZJg6va2xK2tJmnKD6bbWgVblISYHmd85mWLIe8s4tiAvppPQl8/kQl0C
	 USfftFje4AVWndWWFQZZo1zjF+0btHvt6W2s15qA=
Date: Fri, 16 Oct 2026 20:12:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt
 <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Daehyeon Ko
 <4ncienth@gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
Message-Id: <20261016201207.c122f6a7e0607c31a9d9634f@linux-foundation.org>
In-Reply-To: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Oct 2026 12:34:33 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> So far the assumption has been that mm->mm_lock_seq overflow is benign,
> resulting only in readers spuriously falling back to the mmap lock, however
> it turns out that this was an unsafe assumption.
> 
> If a VMA can be spuriously considered write locked that means read lock
> exclusion does not take place, and thus a VMA can end up write-locked with
> concurrent readers.
> 
> Since overflow only occurs every 2^31 write lock/unlock cycles, resolve the
> issue by resetting every VMA's vma->vm_lock_seq each time such an overflow
> occurs.
> 
> This is done in vma_end_write_all(), which is called when the mmap write
> lock is released, i.e. in mmap_write_unlock() and mmap_write_downgrade().
> 
> Care must be taken, as resetting the sequence count at overflow means
> changing the seqcount of VMAs which are already attached and observable.
> 

Updated mm-unstable, thanks.

> Fixes: 5e31275cc997 ("mm: add per-VMA lock and helper functions to control it")
> Andrew - no stable tag please.
> 
> I will do the stable backports manually, they can be solved with a different
> approach.
> 

Wilco.  It's a little unusual - we'd normally add the cc:stable and
wait for -stable people to say "hey this needs rework".  But if the
upstream patch happens to apply to the -stable tree then yes, that
would be a problem.

> Also, since, we're so close to the merge window I'm applying this against
> mm-unstable.
> 
> So I think it's fine to just send it (early :) in the merge window.

Yeah, I'm adding late-arriving backportable fixes into the second-week
pile.  21 cc:stables in there so far...

> v2:
> * Updated comment in vma_seqcount_is_write_locked() to mention the VMA
>   being attached.
> * Renamed reset_vma_seqcounts() to __mm_reset_vma_seqcounts().
> * Used acquire semantics in vma_start_reads() to avoid race with reset -
>   there is another acquire immediately after this one so it should just be
>   noise perf-wise.
> * Removed stable tag, will do the backports manually (just make the value
>   64 bits...)
> * Updated comments to reflect changes.
> * Added user-facing effects as per Vlasta ;)

Here's how v2 altered mm.git:


 Documentation/mm/process_addrs.rst |    6 ++--
 include/linux/mm_types.h           |    6 ++--
 include/linux/mmap_lock.h          |    4 +--
 mm/mmap_lock.c                     |   33 +++++++++++++++------------
 4 files changed, 27 insertions(+), 22 deletions(-)

--- a/Documentation/mm/process_addrs.rst~a
+++ a/Documentation/mm/process_addrs.rst
@@ -827,9 +827,9 @@ is odd, then the VMA is write-locked. If
 A VMA's sequence count is not updated on unlock, so after 2^31 write lock/unlock
 cycles the mm sequence count would wrap and match stale VMA values again. To
 prevent this, when the mm sequence count wraps to zero,
-:c:func:`!vma_end_write_all` invokes :c:func:`!reset_vma_seqcounts` to reset
-every VMA's sequence count to zero, an even value which can never indicate a
-write lock.
+:c:func:`!vma_end_write_all` invokes :c:func:`!__mm_reset_vma_seqcounts` to
+reset every VMA's sequence count to zero, an even value which can never
+indicate a write lock.
 
 Each time the mmap write lock is released in :c:func:`!mmap_write_unlock` or
 :c:func:`!mmap_write_downgrade`, :c:func:`!vma_end_write_all` is invoked which
--- a/include/linux/mmap_lock.h~a
+++ a/include/linux/mmap_lock.h
@@ -554,7 +554,7 @@ static inline int __must_check mmap_writ
 	return ret;
 }
 
-void reset_vma_seqcounts(struct mm_struct *mm);
+void __mm_reset_vma_seqcounts(struct mm_struct *mm);
 
 /*
  * Drop all currently-held per-VMA locks.
@@ -577,7 +577,7 @@ static inline void vma_end_write_all(str
 	 * seqcount so that no stale value survives the wrap.
 	 */
 	if (unlikely(!mm->mm_lock_seq.sequence))
-		reset_vma_seqcounts(mm);
+		__mm_reset_vma_seqcounts(mm);
 }
 
 static inline void mmap_write_unlock(struct mm_struct *mm)
--- a/include/linux/mm_types.h~a
+++ a/include/linux/mm_types.h
@@ -992,9 +992,9 @@ struct vm_area_struct {
 	 * Can only be written (using WRITE_ONCE()) while holding both:
 	 *  - mmap_lock (in write mode)
 	 *  - vm_refcnt bit at VM_REFCNT_EXCLUDE_READERS_FLAG is set
-	 * The one exception is reset_vma_seqcounts(), which stores zero (an
-	 * even value, which can never indicate a write lock) under the mmap
-	 * write lock alone once the mm seqcount has wrapped, so a reader
+	 * The one exception is __mm_reset_vma_seqcounts(), which stores zero
+	 * (an even value, which can never indicate a write lock) under the
+	 * mmap write lock alone once the mm seqcount has wrapped, so a reader
 	 * holding only vm_refcnt may observe the value change from odd to zero.
 	 * Can be read reliably while holding one of:
 	 *  - mmap_lock (in read or write mode)
--- a/mm/mmap_lock.c~a
+++ a/mm/mmap_lock.c
@@ -202,8 +202,9 @@ static bool vma_seqcount_is_write_locked
 		return false;
 
 	/*
-	 * The VMA seqcount is always odd if locked. An even value can only be
-	 * the zero stored by reset_vma_seqcounts(), never a write lock.
+	 * The VMA seqcount is always odd if locked. For an attached VMA an even
+	 * value can only be the zero stored by __mm_reset_vma_seqcounts(),
+	 * never a write lock.
 	 */
 	return vma_seq & 1;
 }
@@ -268,17 +269,20 @@ static struct vm_area_struct *vma_start_
 	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
 	 * modification invalidates all existing locks.
 	 *
-	 * The only other writer is reset_vma_seqcounts(), which stores zero
-	 * (even, so never a write lock) after the mmap write lock's seqcount
-	 * has been released and before any new write lock can be taken, hence
-	 * the READ_ONCE().
+	 * ACQUIRE semantics are required for both reads.
 	 *
-	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
-	 * racing with vma_end_write_all(), we only start reading from the VMA
-	 * after it has been unlocked.
-	 * This pairs with RELEASE semantics in vma_end_write_all().
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
-	vma_seq = READ_ONCE(vma->vm_lock_seq);
+	vma_seq = smp_load_acquire(&vma->vm_lock_seq);
 	mm_seq = raw_read_seqcount(&mm->mm_lock_seq);
 	if (unlikely(vma_seqcount_is_write_locked(vma_seq, mm_seq))) {
 		vma_refcount_put(vma);
@@ -496,9 +500,10 @@ fallback:
  *
  * The stores below follow the smp_wmb() in do_raw_write_seqcount_end(), so
  * a reader that observes a reset value also observes this cycle's VMA
- * modifications (ordered by the smp_rmb() in raw_read_seqcount()).
+ * modifications (ordered by the ACQUIRE on vma->vm_lock_seq in
+ * vma_start_read()).
  */
-void reset_vma_seqcounts(struct mm_struct *mm)
+void __mm_reset_vma_seqcounts(struct mm_struct *mm)
 {
 	struct vm_area_struct *vma;
 	VMA_ITERATOR(vmi, mm, 0);
@@ -524,7 +529,7 @@ void reset_vma_seqcounts(struct mm_struc
 	for_each_vma(vmi, vma)
 		WRITE_ONCE(vma->vm_lock_seq, 0);
 }
-EXPORT_SYMBOL(reset_vma_seqcounts);
+EXPORT_SYMBOL(__mm_reset_vma_seqcounts);
 
 #ifdef CONFIG_LOCK_MM_AND_FIND_VMA
 #include <linux/extable.h>
_

