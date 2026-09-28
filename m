Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0254973AB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590022; cv=none; b=tlsWvtH+GdLaaHCmTEj4it/MdUo/J3+iIidF4U9sA9lGz8qyLVH8CHgCrR2ndfuSQmsmk+VlT5QHPRXJi0YUvysQuOWl1RqZmnCDBuiDwOE1qCQtnrQrFut4buNXMv6XpMJ/Ze5oxxtcK5yuAhfRc/qw35u60R/6bE9ug7xgEoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590022; c=relaxed/simple;
	bh=C58mO2c+80CjmZmV5hY6yZCYTHvRBnjYblTqIyJbruY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5L8PcIB5up/juTU1Q41vzH+YYMi7lXmO53dj5gksus5FOGVIxcTow3Msggm7gNT1E189lkvwDbmjoa3yhreLVpU7L93orNgvHdLeTYjtTwad9RXZSVfvP6ZadfoGqXrkj1u2i9+QIGTLsLs3a5R+LDtIMSRFbR7vKr8kYIiaig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=AmWKCuID; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MsmQriMp; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="AmWKCuID";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MsmQriMp"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 4FD9AEC010F;
	Mon, 28 Sep 2026 06:06:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 28 Sep 2026 06:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790590013; x=
	1790676413; bh=oWKPNIKfY0rqdjZgSUWg4womJUTPnzMTQIwidhHr41E=; b=A
	mWKCuIDUAgQiCrVitkzMxEVbXR56mm7opJabbh6Dcc75IKbQHSlEvDo4ry8GYrLY
	E+FM7mXfo5o5TwnUXM/PDbRmwYHSd2spOpE/baR7oGqZE6hQ5wruFn1VIqfc61Df
	3SAlGexcUJc6jSoiOwVZ//KClODtiEY4CWg0EsYt7fnRElU+RQOu8ZtDXhGxrJaz
	dx3zyuBRwM1ReZlm8jvo7JTBLqelwZMhMxIwQE+o9HvvjNfI1Q5X1exh/kug3SEq
	XFoV4XWP9YCbvix5aX/xbGbXft/NbHtA85rS2ysJ/O3vj5xlyQdOuzDunbYaA/Bd
	lpgNr0mUkwKh4mxDX1U4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790590013; x=1790676413; bh=o
	WKPNIKfY0rqdjZgSUWg4womJUTPnzMTQIwidhHr41E=; b=MsmQriMp6PYwXl+J9
	kKdvVVlPHcpxXe6HVYwD11kMimxqlVMvvEIXjP5XFZJf2ySkBUqiMLaauV2wY9I7
	q+TfBG5dFTXi6O94PzO+cxWH4w/C+ik8wExyC/b072CnxPoFjtztzo+N70yWff6W
	E0qgJbEQv4xvfabmFnFEfhKKlC7F4JbHtn+m60kjZqDd/WMjh5eVx5cHcWINIbLb
	D3ZyeNiQKmMraQwDtXvgIQlrUmNHoRNjgGT+/WV+f2uL9wwSGI1HGidInwI0huqi
	O/8s36QgczDKmWRW7AV2hF1cZPR0vTHzZ0yZ9jrj3MTUh8kKRrOrxkh5EACNkD2f
	Qs1mQ==
X-ME-Sender: <xms:PTy6aonFefb7MpihKUN0UjEZKeWNQ6oB5evOea8NmYvWU862Ir3yaw>
    <xme:PTy6ajzw4op_0YTjMTGLZMsj02IJlgEASuavj8CoW06M-AbaYrKKFi48RH6esnJPN
    Sg5DHkmjpq6YVk-9dJQTPJSxdbNCHFb-cELo2vlubNNDWzl2htLoHeN>
X-ME-Received: <xmr:PTy6aszNp0jeyLfSYB7B2QXD1WZzRyJMkyH9c9ri2WjoOqxhXMviToJCK-8>
X-ME-Proxy-Cause: dmFkZTG4PJbO3UAUv73kvgZEv1qLl5z3Oxsi3Ojn/Cc1gjyQPAY4pttCRQI27MH3dZhDE1
    QOPy+mv452PPCSDsPFoXsadZBBemUC7OEPjfBcMnl1HRY+YTKUqrnPjkqBcWGUry80H8PC
    /K6WQA/dTtmOEop/aiwEwk7y/N5mXgzmzQwcpgiHqOtfdhP6k3WxKdxsMyJsyB6Hvye7b7
    y8KqhRd53u+yghVVISP0UmiTClCERv2XAI4oMribMzYWNytre02a5omAhHuTKchvkb64ds
    QZyxNlGi6Daf2p9KIHOOPKsvpCSjo6Or9ZEQkSNGQE8W6NOQ2qvEeUYlVLLdnIfc4NbbF7
    6+92MXsEBFk/lKdQvQJWcRCdIaKUVaupqBI/8KQYqfoV0zOqd8Lt3lOs6hspZ6QQ5bg0U5
    9U4fj1CaDjrXK7HCfVVEH1NRPCsS3hnwglNtIpDOXv8QVPh6weUaH0igOisJ7WB/m5YKSG
    BzQUmCLb9h1C/6/F00/owax1adrxXWjA9rYs/S+cODsSb7rmGH7N+quBmHtbbZ4/h3jD04
    I5kRvTZgBDaNZztX18cu5J2GZFzsMceemtIkjAHDe/KEW25m5Be+t2nu/IFZjZ/0JvDP2E
    nzmOssHESkWNiFUPGGFkpODXQaxQLrFcY30dYSZIQRN9rrflD7wmrMhtSIUg
X-ME-Proxy: <xmx:PTy6aq_ADXV3XwR9M323mAmZ6VgUo3SXCqaZ0A9LDlteBRQFOz-CVg>
    <xmx:PTy6ak_3C6JBUi2pHzQVlqTwXIJfNQAZ5e7ROKU_cyDPjNrQ0OyPOw>
    <xmx:PTy6alfiRdsjhHIw7SAIglbz2TlmmD8bebKA1BkW8ClD52e5AuP4Dw>
    <xmx:PTy6aouo7opHGrp9Sy3dmK4bCSxpbGlMveIbPPdK0k5LjGCcQ65P9w>
    <xmx:PTy6atHe6jd37Fqgixvxd_UMkvt4LDckZbT0q8yzSakPtrOX0aZb5PX2>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:06:52 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v4 10/13] mm/collapse: open-code collapse_single_pmd() in its two callers
Date: Mon, 28 Sep 2026 11:06:24 +0100
Message-ID: <20260928100630.21870-11-kirill@shutemov.name>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928100630.21870-1-kirill@shutemov.name>
References: <20260928100630.21870-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

A scan and a collapse want different things from mmap_lock.  The scan
reads one PTE table under the lock the caller holds, refuses most of the
time, and the caller moves on to the next table without letting go.  The
collapse allocates, may sleep in writeback and takes the lock for write
itself, so the lock it is handed is of no use to it.

collapse_single_pmd() kept that boundary inside itself.  It dropped the
lock on some paths and not others, and reported which by way of a bool
its callers had to carry along and then act on.  Both callers already
act on a drop, khugepaged by ending its walk and madvise_collapse() by
looking its VMA up again.  The code that has to know is not the code
that does it.

Open-code it in the two callers.  Each scans under the lock it already
holds and, when the scan found work, gives the lock up before running
the collapse.  The scan then has one rule, called locked and returning
locked, and the run another, called unlocked.  Nothing is left to
report, so khugepaged's lock_dropped and madvise_collapse()'s
mmap_unlocked both go.  The engine never touches a lock it did not
take, and how a caller locks its scan is the caller's business alone.

khugepaged's walk carries on to the next table while the scan keeps
refusing, and ends once a collapse has taken the lock from under it.
madvise_collapse() re-finds its VMA after a collapse, which it did
before, and now uses a NULL vma to say that it has to.  It still reports
the drop to its own caller, from the line that does it.

Preparation for moving madvise_collapse() out of khugepaged.c: what it
needs from the engine is then two calls with one lock rule each.

The lock is given up and taken again at the same points as before.  No
functional change.

Assisted-by: LLM
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 103 +++++++++++++++++++++++-------------------------
 1 file changed, 50 insertions(+), 53 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 2b044e63d8c9..be8a26e1de49 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2833,28 +2833,6 @@ static enum scan_result collapse_run_pmd(struct mm_struct *mm,
 	return result;
 }
 
-/*
- * Try to collapse a single PMD starting at a PMD aligned addr, and return
- * the results.
- */
-static enum scan_result collapse_single_pmd(unsigned long addr,
-		struct vm_area_struct *vma, bool *lock_dropped,
-		struct collapse_control *cc)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	enum scan_result result;
-
-	result = collapse_scan_pmd(vma, addr, cc);
-	if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
-		return result;
-
-	/* The collapse takes its own locks, so give this up */
-	mmap_read_unlock(mm);
-	*lock_dropped = true;
-
-	return collapse_run_pmd(mm, addr, result, cc);
-}
-
 static void collapse_scan_mm_slot(unsigned int progress_max,
 		enum scan_result *result, struct collapse_control *cc)
 	__releases(&khugepaged_mm_lock)
@@ -2917,7 +2895,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 		VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
 
 		while (khugepaged_scan.address < hend) {
-			bool lock_dropped = false;
+			unsigned long addr;
 
 			cond_resched();
 			if (unlikely(collapse_test_exit_or_disable(mm)))
@@ -2927,23 +2905,30 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 				  khugepaged_scan.address + HPAGE_PMD_SIZE >
 				  hend);
 
-			*result = collapse_single_pmd(khugepaged_scan.address,
-						      vma, &lock_dropped, cc);
-			if (*result == SCAN_SUCCEED)
-				khugepaged_pages_collapsed++;
+			addr = khugepaged_scan.address;
 			/* move to next address */
 			khugepaged_scan.address += HPAGE_PMD_SIZE;
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
+
+			*result = collapse_scan_pmd(vma, addr, cc);
+			/* Nothing to do here, and the lock is still ours */
+			if (*result != SCAN_SUCCEED &&
+			    *result != SCAN_PTE_MAPPED_HUGEPAGE) {
+				if (cc->progress >= progress_max)
+					goto breakouterloop;
+				continue;
+			}
+
+			/*
+			 * A collapse takes its own locks and is slow enough
+			 * that a writer should not wait behind it, so give the
+			 * lock up.  That ends this walk: vma and the mm are
+			 * whatever the collapse leaves them.
+			 */
+			mmap_read_unlock(mm);
+			*result = collapse_run_pmd(mm, addr, *result, cc);
+			if (*result == SCAN_SUCCEED)
+				khugepaged_pages_collapsed++;
+			goto breakouterloop_mmap_lock;
 		}
 	}
 breakouterloop:
@@ -3209,7 +3194,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	unsigned long hstart, hend, addr;
 	enum scan_result last_fail = SCAN_FAIL;
 	int thps = 0;
-	bool mmap_unlocked = false;
 
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
@@ -3232,25 +3216,40 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	lru_add_drain_all();
 
 	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
-		enum scan_result result = SCAN_FAIL;
+		struct vm_area_struct *found;
+		enum scan_result result;
 
-		if (mmap_unlocked) {
+		/*
+		 * A collapse gives the lock up, so the VMA has to be found
+		 * again after one: it can shrink while nothing is held.  A scan
+		 * that finds nothing to collapse leaves the lock alone, so a
+		 * range that is already collapsed walks on without relocking.
+		 */
+		if (!vma) {
 			cond_resched();
 			mmap_read_lock(mm);
-			mmap_unlocked = false;
-			*lock_dropped = true;
-			result = hugepage_vma_revalidate(mm, addr, false, &vma,
+			result = hugepage_vma_revalidate(mm, addr, false, &found,
 							 cc, HPAGE_PMD_ORDER);
 			if (result != SCAN_SUCCEED) {
 				last_fail = result;
-				goto out_nolock;
+				goto out_locked;
 			}
-
+			vma = found;
 			hend = min(hend, vma->vm_end & HPAGE_PMD_MASK);
 		}
 
-		result = collapse_single_pmd(addr, vma, &mmap_unlocked, cc);
+		result = collapse_scan_pmd(vma, addr, cc);
+		/* Nothing to do here, and the lock is still ours */
+		if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
+			goto tally;
 
+		/* The collapse takes its own locks, so give this up */
+		mmap_read_unlock(mm);
+		*lock_dropped = true;
+		vma = NULL;
+
+		result = collapse_run_pmd(mm, addr, result, cc);
+tally:
 		switch (result) {
 		case SCAN_SUCCEED:
 		case SCAN_PMD_MAPPED:
@@ -3272,17 +3271,15 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 		default:
 			last_fail = result;
 			/* Other error, exit */
-			goto out_maybelock;
+			goto out;
 		}
 	}
 
-out_maybelock:
+out:
 	/* Caller expects us to hold mmap_lock on return */
-	if (mmap_unlocked) {
-		*lock_dropped = true;
+	if (!vma)
 		mmap_read_lock(mm);
-	}
-out_nolock:
+out_locked:
 	mmap_assert_locked(mm);
 	kfree(cc);
 
-- 
2.54.0

