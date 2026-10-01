Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2249DBB2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847815; cv=none; b=Fc9XrUmYvWSCNYcPYrBEMmWxRr+fBuSPnQu/NtIK6XdfqMqXz5Pv9l8Ys+y1xTdu7zOoAB+VJjg/3vQzu2AIV7MERiPZavDGMsW8ItANNSJEbg3JZwNDgKYPgLzlK/2tfa3QgincO/0N1DL9v3IgCztdATuvyYrqkI2thHYZvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847815; c=relaxed/simple;
	bh=MjXLhVGQfAFZo6hXSJA538fXQoM2GQ6qZzvXuuY3Uy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N35hORbBQwCsHTKc2dhMLriiv+5sPtiw+K0LtcDwfMYPHqSZI+A4MKE0kUg+ERCrTXQxaMckHSHthsQ31oUw1hSZ10EWSmYnKuDia630BEji5XYvvTE2024o4wvA9BkL2ljgzOFoGoZY0Yhyz0vRGcGY/NdGlc84b42+OTTvpdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+ZGWA7Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+ZGWA7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380101F000FF;
	Thu,  1 Oct 2026 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790847812;
	bh=e+XRcejTV4IZ9IRyIfMHCzXNizpGInRrcgDa9DbFEcE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=k+ZGWA7Zvt9CHiS61jSQB+Ngtrapp8Sb8dsKy857lqKunJtjOgYTU1J2LDlylCKw6
	 TsH2sESvZ+eMjDA9QMWjKFzH5mfc5h4CbryX/WKq8YIh9nEc+ZIhq8aHZFBoqkGl+4
	 hBn+CEbL2GtQefNwq1kYbaUVEKcVftNzeR9UCCThRhI0lD3SeCxcm4es5QmlOhBPXp
	 98qOEkvRtz/sPx7+iW51GYJIxI3FEPqKAaReV3PZktW04iyzV84dqunLtc8Yc4iutK
	 gXaXvrwPHVy3bl8HsKv9zhN/WMOdKreFMKcJ2DHN52OacEUCBsS5ZSmOCWlfrezZBh
	 V9xc/r+KgdHUQ==
Message-ID: <b2133cff-ce69-4a45-bf33-c44b774dee7b@kernel.org>
Date: Thu, 1 Oct 2026 11:37:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] mm/collapse: open-code collapse_single_pmd() in
 its two callers
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-11-kirill@shutemov.name>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260928100630.21870-11-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/28/26 12:06, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> A scan and a collapse want different things from mmap_lock.  The scan
> reads one PTE table under the lock the caller holds, refuses most of the
> time, and the caller moves on to the next table without letting go.  The
> collapse allocates, may sleep in writeback and takes the lock for write
> itself, so the lock it is handed is of no use to it.
> 
> collapse_single_pmd() kept that boundary inside itself.  It dropped the
> lock on some paths and not others, and reported which by way of a bool
> its callers had to carry along and then act on. 

Let me think this through. collapse_scan_file: it doesn't actually need the MM at
all. The only reason is to do tracing. Rather stupid, it just should not consume
the MM at all anymore. Consequently it doesn't even need the mmap lock. But the
caller needs the mmap lock to figure out the file + range from the vma (the
per-vma lock would also be sufficient for that).

Also, I guess we can convert some of the scanning to use per-vma locks in the
future, whereby we would actually want to scan with the per-vma lock held.

I do wonder about one thing: should we really care so much about keeping the
mmap lock locked? Meaning, why not provide a single collapse_single_pmd() that

* Is always called without the mmap lock (as is)
* Always returns with the mmap lock unlocked (change)

Sure, we drop+re-acquire the mmap lock a couple of times and lookup the vma, but
isn't that actually being nice to the other parts of the system? In the future
 it would simply get called with the per-vma lock and would return with it unlocked.

In the good old days, looking up VMAs was expensive, but nowadays ... not sure
if it still matters?

khugepaged? Not sure if this matters. madvise? I suspect many real users operate
on a single PMD only (e.g., tcmalloc, jemalloc). For the other ones, not sure if
dropping the lock every PMD is really a problem?

IOW, how bad would the following simplification be (prototype that needs more
work and thought):

From a688929aa137bedfdb6b1420a1a7015e1087664a Mon Sep 17 00:00:00 2001
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Thu, 1 Oct 2026 11:22:26 +0200
Subject: [PATCH] tmp

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/khugepaged.c | 105 ++++++++++++++++++------------------------------
 1 file changed, 39 insertions(+), 66 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 87bbba6ce59a..3085e8b34ff7 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2858,43 +2858,42 @@ static enum scan_result collapse_run_pmd(struct mm_struct *mm,
 
 /*
  * Try to collapse a single PMD starting at a PMD aligned addr, and return
- * the results.
+ * the results. mmap_lock must be held for reading on entry and is always
+ * dropped on return.
  */
 static enum scan_result collapse_single_pmd(unsigned long addr,
-		struct vm_area_struct *vma, bool *lock_dropped,
+		struct vm_area_struct *vma,
 		struct collapse_control *cc)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	enum scan_result result;
 
 	result = collapse_scan_pmd(vma, addr, cc);
-	if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
-		return result;
 
 	/* The collapse takes its own locks, so give this up */
 	mmap_read_unlock(mm);
-	*lock_dropped = true;
 
-	return collapse_run_pmd(mm, addr, result, cc);
+	if (result == SCAN_SUCCEED || result == SCAN_PTE_MAPPED_HUGEPAGE)
+		result = collapse_run_pmd(mm, addr, result, cc);
+
+	return result;
 }
 
-static void collapse_scan_mm_slot(unsigned int progress_max,
-		enum scan_result *result, struct collapse_control *cc)
+static enum scan_result collapse_scan_mm_slot(struct collapse_control *cc)
 	__releases(&khugepaged_mm_lock)
 	__acquires(&khugepaged_mm_lock)
 {
 	struct vma_iterator vmi;
 	struct mm_slot *slot;
 	struct mm_struct *mm;
-	struct vm_area_struct *vma;
+	struct vm_area_struct *vma = NULL;
 	unsigned int progress_prev = cc->progress;
+	enum scan_result result = SCAN_FAIL;
 
 	lockdep_assert_held(&khugepaged_mm_lock);
-	*result = SCAN_FAIL;
 
-	if (khugepaged_scan.mm_slot) {
-		slot = khugepaged_scan.mm_slot;
-	} else {
+	slot = khugepaged_scan.mm_slot;
+	if (!slot) {
 		slot = list_first_entry(&khugepaged_scan.mm_head,
 				     struct mm_slot, mm_node);
 		khugepaged_scan.address = 0;
@@ -2903,17 +2902,12 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 	spin_unlock(&khugepaged_mm_lock);
 
 	mm = slot->mm;
-	/*
-	 * Don't wait for semaphore (to avoid long wait times).  Just move to
-	 * the next mm on the list.
-	 */
-	vma = NULL;
+	/* Don't wait for mmap_lock. Move to the next mm if it is contended. */
 	if (unlikely(!mmap_read_trylock(mm)))
-		goto breakouterloop_mmap_lock;
+		goto out;
 
-	cc->progress++;
 	if (unlikely(collapse_test_exit_or_disable(mm)))
-		goto breakouterloop;
+		goto out_unlock;
 
 	vma_iter_init(&vmi, mm, khugepaged_scan.address);
 	for_each_vma(vmi, vma) {
@@ -2939,39 +2933,22 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			khugepaged_scan.address = hstart;
 		VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
 
-		while (khugepaged_scan.address < hend) {
-			bool lock_dropped = false;
+		if (khugepaged_scan.address >= hend)
+			continue;
 
-			cond_resched();
-			if (unlikely(collapse_test_exit_or_disable(mm)))
-				goto breakouterloop;
-
-			VM_WARN_ON_ONCE(khugepaged_scan.address < hstart ||
-				  khugepaged_scan.address + HPAGE_PMD_SIZE >
-				  hend);
-
-			*result = collapse_single_pmd(khugepaged_scan.address,
-						      vma, &lock_dropped, cc);
-			if (*result == SCAN_SUCCEED)
-				khugepaged_pages_collapsed++;
-			/* move to next address */
-			khugepaged_scan.address += HPAGE_PMD_SIZE;
-			if (lock_dropped)
-				/*
-				 * We released mmap_lock so break loop.  Note
-				 * that we drop mmap_lock before all hugepage
-				 * allocations, so if allocation fails, we are
-				 * guaranteed to break here and report the
-				 * correct result back to caller.
-				 */
-				goto breakouterloop_mmap_lock;
-			if (cc->progress >= progress_max)
-				goto breakouterloop;
-		}
+		result = collapse_single_pmd(khugepaged_scan.address, vma, cc);
+		if (result == SCAN_SUCCEED)
+			khugepaged_pages_collapsed++;
+		/* Move to the next address and look up its VMA again. */
+		khugepaged_scan.address += HPAGE_PMD_SIZE;
+		goto out;
 	}
-breakouterloop:
+out_unlock:
 	mmap_read_unlock(mm); /* exit_mmap will destroy ptes after this */
-breakouterloop_mmap_lock:
+out:
+	/* PMD scans and skipped VMAs account for their own progress. */
+	if (cc->progress == progress_prev)
+		cc->progress++;
 
 	spin_lock(&khugepaged_mm_lock);
 	VM_BUG_ON(khugepaged_scan.mm_slot != slot);
@@ -2998,6 +2975,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 
 	trace_mm_khugepaged_scan(mm, cc->progress - progress_prev,
 				 khugepaged_scan.mm_slot == NULL);
+	return result;
 }
 
 static int khugepaged_has_work(void)
@@ -3034,7 +3012,7 @@ static void khugepaged_do_scan(struct collapse_control *cc)
 			pass_through_head++;
 		if (khugepaged_has_work() &&
 		    pass_through_head < 2)
-			collapse_scan_mm_slot(progress_max, &result, cc);
+			result = collapse_scan_mm_slot(cc);
 		else
 			cc->progress = progress_max;
 		spin_unlock(&khugepaged_mm_lock);
@@ -3232,7 +3210,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	unsigned long hstart, hend, addr;
 	enum scan_result last_fail = SCAN_FAIL;
 	int thps = 0;
-	bool mmap_unlocked = false;
 
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
@@ -3255,24 +3232,23 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	lru_add_drain_all();
 
 	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
-		enum scan_result result = SCAN_FAIL;
+		enum scan_result result;
 
-		if (mmap_unlocked) {
+		if (addr != hstart) {
 			cond_resched();
 			mmap_read_lock(mm);
-			mmap_unlocked = false;
-			*lock_dropped = true;
 			result = hugepage_vma_revalidate(mm, addr, false, &vma,
 							 cc, HPAGE_PMD_ORDER);
 			if (result != SCAN_SUCCEED) {
 				last_fail = result;
-				goto out_nolock;
+				goto out;
 			}
 
 			hend = min(hend, vma->vm_end & HPAGE_PMD_MASK);
 		}
 
-		result = collapse_single_pmd(addr, vma, &mmap_unlocked, cc);
+		result = collapse_single_pmd(addr, vma, cc);
+		*lock_dropped = true;
 
 		switch (result) {
 		case SCAN_SUCCEED:
@@ -3295,17 +3271,14 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 		default:
 			last_fail = result;
 			/* Other error, exit */
-			goto out_maybelock;
+			goto out_lock;
 		}
 	}
 
-out_maybelock:
+out_lock:
 	/* Caller expects us to hold mmap_lock on return */
-	if (mmap_unlocked) {
-		*lock_dropped = true;
-		mmap_read_lock(mm);
-	}
-out_nolock:
+	mmap_read_lock(mm);
+out:
 	mmap_assert_locked(mm);
 	kfree(cc);
 
-- 
2.43.0


Based on that, I'd rather want to see collapse_single_pmd() to just inline the file
and anon paths, and see how we can further optimize the locking internally (e.g., perform
the pagecache scanning without the mmap lock).

-- 
Cheers,

David
