Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFA01EB1AA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792012579; cv=none; b=BqLXkggEUr2ZS4zbAMBSrBqFV1NrcCBQlgX4EGbph9ioNF/JIJyHdY3DynMPxwlvhVADLursjvqg/ZKa79kJMMDNr5HXm0yfN5RH/Zw1bCg+inrgBAmLjap4URPqFYSEh8PzrAJnrjWDU2TleNtFyP8INT4y6mmRWTYTGOU6yAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792012579; c=relaxed/simple;
	bh=2YPbw4ijLQC5YPAZVxJY+LLFZVCCcWM+C2SOu1ThUWw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iQksgB+3jLHoh/hpc0pbjOmY7iaqqRcFZJvQfqML4gEPw9XGfO8+4Yi7OYchj1S77710yM6LkcPoij8MAnj6Ar65SlR8l72NsyqgAmooBr1FoMOJiv/UlXu9fDpLLkrhFmtTW6lQL2nvAG2iFaCPmrdyESsc4cyzSU7zb5TBin8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wHPwfnc1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wHPwfnc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D4F1F000C4;
	Wed, 14 Oct 2026 21:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792012577;
	bh=sLczMfcbTDkoBgkV9qbzR8bM6PnzlWrtoAMW7ghjW5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=wHPwfnc1aFL4h4B6Qqbfm4Y79W4TejKdqJENP2t9KGj9HqeNOt0t6saaPuCgfAEDp
	 UM7Y8SlJbflypjFzTvtRGWyJNVEmfsB39HN87On8jUXMzEwQgXoxWDn5ryAtefQuJr
	 06N2C0Lh9LDRvG4fDD4vDLG2py7+ULucIVj2OVNw=
Date: Wed, 14 Oct 2026 14:16:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>
Subject: Re: [PATCH v5 0/9] mm/collapse: separate a collapse from its
 callers
Message-Id: <20261014141616.6d79df8fc8c6ef7d41df5afc@linux-foundation.org>
In-Reply-To: <20261014171145.3292736-1-kas@kernel.org>
References: <20261014171145.3292736-1-kas@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 18:11:33 +0100 "Kiryl Shutsemau (Meta)" <kas@kernel.org> wrote:

> There is no line between the collapse engine and the callers that ask for
> a collapse.  khugepaged.c holds both, and they reach into each other.
> 
>  - Sixteen tests through the collapse path read cc->is_khugepaged to work
>    out what they are allowed to do, when every one of those decisions was
>    made by the caller before it asked.
> 
>  - collapse_single_pmd() does both halves of a collapse behind one call.
>    Where it gives up mmap_lock between them is buried in the anonymous
>    scan on one side and ahead of the file scan on the other.
> 
> Start drawing the line.  The caller states what it allows in a policy,
> and the collapse code reads the policy instead of asking who called.  The
> scan of a PTE table and the collapse that follows get a function each,
> with the mmap_lock drop between them in one place.

Thanks, updated.

> Changes since v4
> ================
> 
>   https://lore.kernel.org/all/20260928100630.21870-1-kirill@shutemov.name/
> 
>  - Patches 10-13 dropped.
> 
>  - Patch 7: the changelog no longer mentions a release for the control,
>    which v4 dropped.
> 
>  - Patch 9: collapse_scan_anon(), collapse_pmd() and collapse_anon()
>    replace collapse_scan_anon_pmd(), collapse_run_pmd() and
>    mthp_collapse() (David).  The scan_* fields in collapse_control are
>    commented as anonymous-only and file-only (Zi).  Comments that named
>    collapse_scan_pmd() for the anonymous scan follow the rename.
> 
>  - Acked-by from David Hildenbrand on 5 and 8; Reviewed-by from Zi Yan on
>    5 and 8 and from Baolin Wang on 5; Tested-by from Baolin Wang on 5;
>    Acked-by from Zi Yan on 9.

Here are the v3->v4 changes for the nine remaining patches:


 mm/collapse.h   |   16 ++++++++++------
 mm/khugepaged.c |   28 ++++++++++++++--------------
 2 files changed, 24 insertions(+), 20 deletions(-)

--- a/mm/collapse.h~b
+++ a/mm/collapse.h
@@ -100,16 +100,20 @@ struct collapse_control {
 	DECLARE_BITMAP(eligible_ptes, MAX_PTRS_PER_PTE);
 
 	/*
-	 * What a scan found and the run after it needs.  Live only between the
-	 * two, and read by nobody else.
-	 *
-	 * The file side takes a reference while it still has the VMA, since a
-	 * file collapse works on the page cache and never sees one; the run is
-	 * what gives it back.
+	 * What a scan found and the collapse after it needs.  Live only between
+	 * the two, and read by nobody else.
 	 */
+
+	/* Anonymous only: orders to try, referenced and swap PTE counts */
 	unsigned long scan_orders;
 	int scan_referenced;
 	int scan_unmapped;
+
+	/*
+	 * File only.  A file collapse works on the page cache and never sees a
+	 * VMA, so the scan takes a reference to the file while it still has
+	 * one, and the collapse gives it back.
+	 */
 	struct file *scan_file;
 	pgoff_t scan_pgoff;
 };
--- a/mm/khugepaged.c~b
+++ a/mm/khugepaged.c
@@ -646,7 +646,7 @@ static enum scan_result __collapse_huge_
 			goto out;
 		}
 
-		/* See collapse_scan_pmd(). */
+		/* See collapse_scan_anon(). */
 		if (folio_maybe_mapped_shared(folio)) {
 			/*
 			 * TODO: Support shared pages without leading to further
@@ -1099,7 +1099,7 @@ static enum scan_result check_pmd_still_
 
 /*
  * Bring missing pages in from swap, to complete THP collapse.
- * Only done if collapse_scan_pmd() believes it is worthwhile.
+ * Only done if collapse_scan_anon() believes it is worthwhile.
  *
  * For mTHP orders the function bails on the first swap entry, because
  * faulting pages back in during collapse could re-populate PTEs that
@@ -1460,8 +1460,8 @@ static unsigned int max_order_from_offse
 }
 
 /*
- * mthp_collapse() consumes the bitmap that is generated during
- * collapse_scan_pmd() to determine what regions and mTHP orders fit best.
+ * collapse_anon() consumes the bitmap that is generated during
+ * collapse_scan_anon() to determine what regions and mTHP orders fit best.
  *
  * Each bit in cc->eligible_ptes marks a PTE the scan accepted as a collapse
  * source. We start at the PMD order and check if it is eligible for collapse;
@@ -1476,8 +1476,8 @@ static unsigned int max_order_from_offse
  * If a collapse is permitted, we attempt to collapse the PTE range into a
  * mTHP.
  */
-static enum scan_result mthp_collapse(struct mm_struct *mm, unsigned long address,
-		struct collapse_control *cc)
+static enum scan_result collapse_anon(struct mm_struct *mm,
+		unsigned long address, struct collapse_control *cc)
 {
 	unsigned int nr_eligible_ptes, nr_ptes, max_ptes_none;
 	enum scan_result last_result = SCAN_FAIL;
@@ -1576,7 +1576,7 @@ done:
 	return last_result;
 }
 
-static enum scan_result collapse_scan_anon_pmd(struct vm_area_struct *vma,
+static enum scan_result collapse_scan_anon(struct vm_area_struct *vma,
 		unsigned long start_addr, struct collapse_control *cc)
 {
 	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
@@ -1612,7 +1612,7 @@ static enum scan_result collapse_scan_an
 	/*
 	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
 	 * scan all pages to populate the bitmap for mTHP collapse. The bitmap
-	 * is then checked again in mthp_collapse() for each attempted order.
+	 * is then checked again in collapse_anon() for each attempted order.
 	 */
 	if (enabled_orders != BIT(HPAGE_PMD_ORDER))
 		max_ptes_none = COLLAPSE_MAX_PTES_LIMIT;
@@ -2785,20 +2785,20 @@ static enum scan_result collapse_scan_pm
 	pgoff_t pgoff;
 
 	mmap_assert_locked(vma->vm_mm);
-	/* Whatever the last scan found has to have been run by now */
+	/* A scan that found work has to have been followed by collapse_pmd() */
 	if (WARN_ON_ONCE(cc->scan_file)) {
 		fput(cc->scan_file);
 		cc->scan_file = NULL;
 	}
 
 	if (vma_is_anonymous(vma))
-		return collapse_scan_anon_pmd(vma, addr, cc);
+		return collapse_scan_anon(vma, addr, cc);
 
 	pgoff = linear_page_index(vma, addr);
 	result = collapse_scan_file(vma->vm_mm, addr, vma->vm_file, pgoff, cc);
 	/*
 	 * SCAN_PTE_MAPPED_HUGEPAGE is work too: the page cache already holds
-	 * the PMD folio, and retracting the PTE table is the run's job.
+	 * the PMD folio, and collapse_pmd() still has to retract the PTE table.
 	 */
 	if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
 		return result;
@@ -2812,7 +2812,7 @@ static enum scan_result collapse_scan_pm
 	return result;
 }
 
-static enum scan_result collapse_run_pmd(struct mm_struct *mm,
+static enum scan_result collapse_pmd(struct mm_struct *mm,
 		unsigned long addr, enum scan_result result,
 		struct collapse_control *cc)
 {
@@ -2821,7 +2821,7 @@ static enum scan_result collapse_run_pmd
 	pgoff_t pgoff;
 
 	if (!file)
-		return mthp_collapse(mm, addr, cc);
+		return collapse_anon(mm, addr, cc);
 
 	cc->scan_file = NULL;
 	pgoff = cc->scan_pgoff;
@@ -2882,7 +2882,7 @@ static enum scan_result collapse_single_
 	mmap_read_unlock(mm);
 	*lock_dropped = true;
 
-	return collapse_run_pmd(mm, addr, result, cc);
+	return collapse_pmd(mm, addr, result, cc);
 }
 
 static void collapse_scan_mm_slot(unsigned int progress_max,
_

