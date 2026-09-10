Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40DD4825CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041791; cv=none; b=P8afAz38cxPMwIUPKVlgb9xAtAQQZsKgwSB78PyWRAxNTk6PFVVf4eV2yuQAW9kIbnq3t8oj/MJZY1maPC2S2b719AYK3R0MTKYHbmhwhHfhec+UZYsDbaGElPz8cKBEG5PkPwzYvfgF2/3FlRdqmsZN7NMAu/NvmRNWkxk6ENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041791; c=relaxed/simple;
	bh=YBHrSEcRxpQBAJBkpCgju4aZIhAPhowSY8zdrX1ZCxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBTCfiGulVbST9uz574c97CSa+nErhJLoBvNX/L0IhI1XL0dGhjuhAZgUCLkiAje5B43ff5pI3MzjU+cSVfYhoN1ZlutGBKLu01VwbE0txGIO5HKlpy4s0DSudAVtqvO/sML9QRruPnA4XaDKzndN8rOobaBzbw6tbbWcxphwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=csNCK16C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bKrmnTez; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="csNCK16C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bKrmnTez"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 096237A0063;
	Thu, 10 Sep 2026 08:03:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 10 Sep 2026 08:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789041788; x=
	1789128188; bh=kpOrfAtuUuey4lAYKV0xF7Nvz8qXoEbNkfYNAyopBF4=; b=c
	sNCK16CKEi2s5emKL1cvcwYx6Sa/NQ5ooLbF4lmvC8MhDw2wisf+1Ungv5cOmvlK
	WYjr3ckTr7NWzAC2gXbDJ6TW8rh3zNh6fd0dFNteb4GJBU0gg142EmvNzCIIUywu
	ROFZfhRDnyIpols8ofo9cTA53xvwdBa0+dCQCK+Fax9kX3R8GZZk5WfMqIsEb93O
	QcRR1HQ8dyEebWOtsudne8zY/uhZlDBWIOPJexQpOHSuKiLSr56sf9echxmGiW4o
	EsLvaBTTKlK77Hqy9sTIv7xhzR6uL7WQ3Ou8y6yIWLeNxugdQnFhGQjOn0D1o4ls
	XJRfcB4HUjK09XF27afww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789041788; x=1789128188; bh=k
	pOrfAtuUuey4lAYKV0xF7Nvz8qXoEbNkfYNAyopBF4=; b=bKrmnTezqC8+vQj/C
	xhJUHZcCchh1J1z3ldAQOj6PeZkDpbz7tSzdFwC2n67vIXCbEhGhJU8gL0NY93tj
	Ootw2wkgHaPYUUT6S0efB0T9QJa7wkcsMzxWVcGaKw/BnT4rbczTbhFnzHug97mH
	eUHiZ9NNL7m14Nja8DBUSGQe8x9zYA7qnVJLWkrkYIQFMLdcpHzivUzd33/F+xnc
	RIE6ocN965IDbRdLLFII/k71BCNgxibPWUmcq39v1gf4wvliVFa8PCHZHSQAmyIt
	5/R6Xdw8B5SRphYaxxs9FNkI8imC1SI/ki3UO0a/ocLso+ejlJJ8HzSgjS+6RQ6V
	UhfDA==
X-ME-Sender: <xms:fJyianPMAdW3GwhW0lg-5a0NGhIn8ThX7j72Kk9j_OR5tMM0PAguyw>
    <xme:fJyiat4dvMzw2M7RoY_ttErSoEHMHaf9pAMJmfMXe2oENe_WnZWjkHKc0c0jg6tA_
    YS_jfzxZvz7-97WU7M_11YFdFLI-kUB40YBtphZNkNpfh71anszqKg>
X-ME-Received: <xmr:fJyiasbHd_69_hsVr-GlMxSe85LoDmFIf0ReSW3RbLvP6GtcHAzYqQur-Hc>
X-ME-Proxy-Cause: dmFkZTGH8GFWwEUBtPxKJ67Rq2x/vdej+Q6nUCGcsDIesBFp0X3hc4jYyZuxmlnDOcFOMj
    pjMT1hhilwwz+XztIrpfsk+jOgPg51Zko9HtX5FOXtwZM/xuJUIPYajGOB/mCLABcXoBUN
    tOK7IZxc0LQBxYWwS3D6Gb3+L6Rzatr9ZhNURjEQibWJdyHQU+pHQvTtQJMa086Ym+yd6R
    IInk1eh8W3seorGmDJU/iV1zGzfJwWvedZT0VKJsUgZ7fACBrQNd9k3L4EzTZNF344phSI
    j6ov0R0Vo2eJRufAS9ocD/WtRYG80u0cUfKpHkiyow/cp96ftI+MA3MvYDL4cDgvN+YPme
    tp92wygh8UvLM6PCYZaDNz8msbrI5zSvPvb1pIQHvDWn9s3+Yn0I14Z4qCm6i2YJ5WJXO9
    Zxa3QdhU5laepvew+dp+2M4dNa1cHgJcn6Yrd+E7A2ncU09Ya/eisbEbE6eBK3l/neISFL
    XLLv1OBTXWjf/tIgacW38eVhc79/2zgtxZUvViJtIzxSKs9jhdd9qk6Qn6N+IfCie094eb
    MrWqU1AWU5364KeQICC4uA8zbhIidrwdWihtI9VdYatJ5LhfCnPTnd2t4RV+8VJuxxyiX9
    IehlICSYK1zeiTMF/ze/yFdZNVBmxEzCIqhYxb5+M1Oui8PZs4C8Z8TX9hSQ
X-ME-Proxy: <xmx:fJyiaiHMqfdgMbBG1H29PH5UnVyhxr8hf9mi1cE6WvotgZUA3WwqWQ>
    <xmx:fJyiatlC3dmZW10b1w_J-O8JT5RZu8ZRRjyoMRaSfuxmexsfH0zNPw>
    <xmx:fJyiahkIefiv1EEaCRzYFScty8FZvlydcCxnopYa_ZlkHcijepCxlQ>
    <xmx:fJyiaiUIevjvjrFKYQPzmdKaGMbcGYs0t0h-8fWOaChIFUrpI7uQ4w>
    <xmx:fJyiaslRzJDAVYGzxiTCcvEu87mSWyoLk11i7LOONedwIlcewRBPylGb>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 08:03:08 -0400 (EDT)
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
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v2 09/12] mm/collapse: open-code collapse_single_pmd() in its two callers
Date: Thu, 10 Sep 2026 13:02:29 +0100
Message-ID: <20260910120238.2529819-10-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910120238.2529819-1-kirill@shutemov.name>
References: <20260910120238.2529819-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_scan_pmd() and collapse_run_pmd() each have a clear locking
contract.  The scan is called with mmap_lock held for reading and returns
with it still held.  The collapse is called without it.

collapse_single_pmd() kept that boundary inside itself.  It dropped the
lock on some paths and not others, and reported which by way of a bool its
callers had to carry along and then act on.

Open-code it in the two callers.  Each scans under the lock it already
holds and, on SCAN_SUCCEED, gives the lock up before running the collapse.
khugepaged's lock_dropped and madvise_collapse()'s mmap_unlocked both go:
the code dropping the lock is now the code that wanted to know.

khugepaged's walk carries on to the next table while the scan keeps
refusing, and ends once a collapse has taken the lock from under it.
madvise_collapse() re-finds its VMA after a collapse, which it did before,
and now uses a NULL vma to say that it has to.  It still reports the drop
to its own caller, from the line that does it.

The lock is given up and taken again at the same points as before.  No
functional change.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 102 +++++++++++++++++++++++-------------------------
 1 file changed, 49 insertions(+), 53 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index c26907300c23..9bdf12128357 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2857,28 +2857,6 @@ static enum scan_result collapse_run_pmd(struct mm_struct *mm,
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
-	if (result != SCAN_SUCCEED)
-		return result;
-
-	/* The collapse takes its own locks, so give this up */
-	mmap_read_unlock(mm);
-	*lock_dropped = true;
-
-	return collapse_run_pmd(mm, addr, cc);
-}
-
 static void collapse_scan_mm_slot(unsigned int progress_max,
 		enum scan_result *result, struct collapse_control *cc)
 	__releases(&khugepaged_mm_lock)
@@ -2941,7 +2919,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 		VM_BUG_ON(khugepaged_scan.address & ~HPAGE_PMD_MASK);
 
 		while (khugepaged_scan.address < hend) {
-			bool lock_dropped = false;
+			unsigned long addr;
 
 			cond_resched();
 			if (unlikely(collapse_test_exit_or_disable(mm)))
@@ -2951,23 +2929,29 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
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
+			/* Nothing to collapse here, and the lock is still ours */
+			if (*result != SCAN_SUCCEED) {
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
+			*result = collapse_run_pmd(mm, addr, cc);
+			if (*result == SCAN_SUCCEED)
+				khugepaged_pages_collapsed++;
+			goto breakouterloop_mmap_lock;
 		}
 	}
 breakouterloop:
@@ -3236,7 +3220,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	unsigned long hstart, hend, addr;
 	enum scan_result last_fail = SCAN_FAIL;
 	int thps = 0;
-	bool mmap_unlocked = false;
 
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
@@ -3259,25 +3242,40 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
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
+		/* Nothing to collapse here, and the lock is still ours */
+		if (result != SCAN_SUCCEED)
+			goto tally;
 
+		/* The collapse takes its own locks, so give this up */
+		mmap_read_unlock(mm);
+		*lock_dropped = true;
+		vma = NULL;
+
+		result = collapse_run_pmd(mm, addr, cc);
+tally:
 		switch (result) {
 		case SCAN_SUCCEED:
 		case SCAN_PMD_MAPPED:
@@ -3299,17 +3297,15 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
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
 	collapse_control_release(cc);
 	kfree(cc);
-- 
2.54.0

