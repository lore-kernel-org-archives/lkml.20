Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40A38D01E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780899; cv=none; b=t0cLoN7F2+B1F5mcN/XgbpeR0ESFVRwsY18OAX+/RhipbXwMwQCfR6uUh2mEc8x7Duwbc5TWJA9t+Inf9IRTEo9dmPLMFbMpep0OHmO1cfG9kfm4VfaQbGzrXFtEP3HCdxsMQvM4NGp4fJ/UDsOEtzI/ItjF3iQ5ktlIC4qtziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780899; c=relaxed/simple;
	bh=NDO5vNRrR/2G5o/dxu0VXQ+i4TZ+z6J3nWS0ErYFkiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4L4R19l1RtoqH5W5Ik7GKqfR4OYamhL9XX2RdfMy+wuDTjCP9SpykgNkVvVPGDMymDNkIj2r6+m7fykmr7CX9tSO3FWgZuAaApbqbsKLJ1jkvn+fyosG9IyFTKlk43ayIrcS3LSfrdaH9l6yvXJDm+GJJXLVH5WdJoTkdflpj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=AyPW34Ia; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uPfu0Eqx; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="AyPW34Ia";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uPfu0Eqx"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EE35714001D8;
	Mon,  7 Sep 2026 07:34:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 07 Sep 2026 07:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788780895; x=
	1788867295; bh=fWx0DbLW8qAZZRs4+ZsE6vtll+xh6TeqEINUEyOgfe0=; b=A
	yPW34IaIRTM66iQ9XsJPsecWv0PXSqfmzE7wRKJDT0PrsJJ28glcmBi0pBVdkPPD
	bK+WPMFG7HwhVj2w4yfj7MW3VNH+KbIus2zdlJRUQ26QkrWWuXpnAQkccqMbLAfL
	y49nYTmdDrXtmWCfugZ+WFvs0vk4z1IOPj+vJAknVVlglHV9s38HlJoyTEPS5Uxv
	ZAWQ+LnKynilZJ5P4uaM8HlWI5TCBJiE+/+URcUxvWW0205siyJ/Kzt9Xxf3H29Q
	T286i+gDl7kNkpH7Q8l33t/oNhSoinLFT+c16ZnyzVND+4p7C3thyHUAP1Mj6p2S
	Bu/dLjhy/e4AmT0roq1RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788780895; x=1788867295; bh=fWx0DbLW8qAZZRs4+ZsE6vtll+xh6TeqEIN
	UEyOgfe0=; b=uPfu0Eqxj2xgUvfwOSn+PqBDsK1T9zQwutEjei1NtdUDsWD+gaP
	PTgaIFgy+83t3X+ZVbEQ2xdPBAMs1fVeOCiGZwZG7+WHl8oceU5KOjw18IeL5esn
	XTE8PPDiNoZWBLapRJQyb8NyUC6jmRbaGcasiWxetfSSJ8httadOoIm1VjPDpint
	4pyIxHDxjunx/QEPOywqapgFny4muTyMXuY6Y8mEPjPBIJZ+zfIbI7nmnxJTWRxK
	AOoY921YuyIyKC2zSUgQQxyTooG6/33ciN1vm2djWrqZ5PMuSLSodUStcd4JBhQg
	sMz0obfP6S7DiqN4J7SiF3cenmUolAumNEg==
X-ME-Sender: <xms:X6GeapcfkYxT2A2ohemLljnVPoFgz51rWm_C8Rc98dAlnBY25zZpLg>
    <xme:X6Geak3Y_5oBJDUsii36d6lQLobCykUZ41VgnjZHh50xnVhrzpKPYCxA2Gs24PfDO
    8CxiKpk5h0q-XwW-VglzBj2tRp849uDCqryeH8mBhS7dFzD_ZvtaECz>
X-ME-Received: <xmr:X6Geap7YeNcFmXtokjsGKwHaqlPgchexbA_99-ZncI7UjsQ71uub-zW7M2A>
X-ME-Proxy-Cause: dmFkZTErDfl4/otd5YNtthRf4cxh2TQv0o92HXYZHQBP5hNg1afoRfVV+1ZmzYb50peX4b
    4FLUUm8T0n2qnqvx01lcjtMrB926vxXLOQDIM7Twq16cdTsbe5GNTylIq9/kV1IAMfy1j9
    Mz9LGp1LvA4jcNkRtB9cv+CYJVXSOfq/h4BrZBOkQGi9vj2NpZ/JFuFHxr/nRV+frpXnBL
    OBXetV18cCP7MjVbHZK95UA5KGCn37MYH4HHlr678h+UmWdmNwMegQo3UWROD5OtXQUjIc
    Drdu306EMJMpieljYtOwNmvakrXQkzro/CHeny9rGrF3xi8Bhcss2M0zw/M1MyKXJ99IjL
    ZsdS4V9pzfFiqjiPDTmYyn3XFkHJq9c97F3apN6kdHS0X88mPuTHa649/xcP+XdnA25NxG
    tuMVQR4zOtRaM4n+F6XD8E2DAaF4PGiqxG9XEmxvPo+OoP0kspMgGtx1PxD5UzmFO2oCs0
    KspTFaim0omfhjiEV7jsR8lskjYtWFrtnjuST3WJB/vEcZpSrRmrtiTfZFGUHRNdUc/xIY
    a7VoG4BxalFf9Tjq4oTWoR9ykrBtb/v9MbQDSaPHKEztImoQgo1KL6rUuLoYxiD5e3hu4v
    gNOM4EVz9ydLV/4VXRXNuc4+KE4QaCPnp3d8XK/CVvpQpTMNQVcFDVNKk/HA
X-ME-Proxy: <xmx:X6GearL74dgTOe7SicwsoS-FQRmAwV9Ed0u7Qzr-dvBAgcBzF0GtrQ>
    <xmx:X6GeatbOWc5wF4knmiSA6CyLesMEA5sBbAEFuDj0YPvRwej9K0WKIw>
    <xmx:X6Geag3W6LCkhseiSHRwQ2QAfSGH4s2amOt1F_KKjnik1BUsD2kz3A>
    <xmx:X6GeanMcTSi-h-C25ptT_eOVGUixYA21vbXVlicx-DoQmjLkNe-xKQ>
    <xmx:X6GeahOYnKafK6gxCngN5Oz6xXgAQu_3h8lqcDE8Ol11Ll0wVodPJtmW>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 07:34:54 -0400 (EDT)
Date: Mon, 7 Sep 2026 12:34:53 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 08/12] mm/collapse: separate scanning a PTE table from
 collapsing it
Message-ID: <ap6hM1Mt0PFWloM1@thinkstation>
References: <cover.1788533997.git.kas@kernel.org>
 <1a1bc537850bd7ef73bed5ac4985634bb8dd95e1.1788533997.git.kas@kernel.org>
 <DL7VP2ZBCB4J.9NUOEM7GWXR6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL7VP2ZBCB4J.9NUOEM7GWXR6@nvidia.com>

On Sat, Sep 05, 2026 at 10:30:16PM -0400, Zi Yan wrote:
> On Fri Sep 4, 2026 at 11:10 AM EDT, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> >
> > A collapse is two jobs.  One reads a PTE table under mmap_lock and decides
> > whether the range is worth collapsing.  The other allocates, isolates,
> > copies and flushes, and wants the lock given up first.
> >
> > collapse_single_pmd() did both, so the boundary between them was somewhere
> > in the middle of a function.
> >
> > Give each half its own function:
> >
> >   - collapse_scan_pmd() scans one table and only reads.  The anonymous
> >     scan that used to carry that name keeps its body as
> >     collapse_scan_anon_pmd(), and collapse_scan_pmd() is now the entry
> >     that picks the anonymous or the file side.
> >
> >   - collapse_run_pmd() does the collapse the scan asked for.
> >     SCAN_SUCCEED from the scan means there is something to run; anything
> >     else is why there is not.
> >
> > collapse_single_pmd() is now the two of them with the mmap_lock drop in
> > between, so its callers see what they saw before.
> >
> > Scan results (beyond SCAN_SUCCEED) communicated via collapse_control
> > structure: the orders, the referenced and swapped-out counts, and for a
> > file the file itself and the offset in it.
> >
> > A file collapse works on the page cache and never sees a VMA.  The scan
> > takes the file reference while it still has VMA and the run unpins it
> > when it is done.
> >
> > Tracing changes with it.  mm_khugepaged_scan_pmd now fires before
> > mm_collapse_huge_page instead of after it.  Its status field already reads
> > SCAN_SUCCEED for an accepted table, so what the collapse then made of that
> > table is mm_collapse_huge_page's to report, per order.
> >
> > The two calls to that tracepoint become one.  They differed in what the
> > collapse between them changed; with the collapse no longer here, both
> > carry the same arguments.  failed_pfn is set only where a PTE was refused,
> > so it is -1 exactly when the result is SCAN_SUCCEED.
> >
> > Assisted-by: Claude-Code:claude-opus-5
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> >  mm/collapse.h   |  14 ++++++
> >  mm/khugepaged.c | 121 ++++++++++++++++++++++++++++++++++--------------
> >  2 files changed, 100 insertions(+), 35 deletions(-)
> >
> 
> <snip>
> 
> >  
> > -	mmap_read_unlock(mm);
> > -	*lock_dropped = true;
> > +static enum scan_result collapse_run_pmd(struct mm_struct *mm,
> > +		unsigned long addr, struct collapse_control *cc)
> > +{
> > +	struct file *file = cc->scan_file;
> > +	bool triggered_wb = false;
> > +	enum scan_result result;
> > +	pgoff_t pgoff;
> > +
> > +	if (!file)
> > +		return mthp_collapse(mm, addr, cc->scan_referenced,
> > +				     cc->scan_unmapped, cc, cc->scan_orders);
> > +
> > +	cc->scan_file = NULL;
> > +	pgoff = cc->scan_pgoff;
> >  retry:
> >  	result = collapse_scan_file(mm, addr, file, pgoff, cc);
> 
> In the commit message, collapse_run_pmd() is said to do the collapse
> work, but collapse_scan_file() is scanning, right?
> 
> It seems that the code only separate anonymous scan and collapse.
> Why cannot pagecache code be separated in a similar way?

Will fold the patch below into v2:

diff --git a/mm/collapse.h b/mm/collapse.h
index 4baf2228d2c4..1ebbbf63fb25 100644
--- a/mm/collapse.h
+++ b/mm/collapse.h
@@ -95,13 +95,15 @@ struct collapse_control {
 	 *
 	 * The file side takes a reference while it still has the VMA, since a
 	 * file collapse works on the page cache and never sees one; the run is
-	 * what gives it back.
+	 * what gives it back.  A scan that found the PMD folio already in the
+	 * cache leaves only the PTE table to retract.
 	 */
 	unsigned long scan_orders;
 	int scan_referenced;
 	int scan_unmapped;
 	struct file *scan_file;
 	pgoff_t scan_pgoff;
+	bool scan_retract_only;
 };
 
 /* Which orders a VMA may collapse to, zero when it may not collapse at all */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4ae292a6392e..403e5fee942d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2722,20 +2722,13 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	else
 		cc->progress += HPAGE_PMD_NR;
 
-	if (result == SCAN_SUCCEED) {
-		if (present < HPAGE_PMD_NR - max_ptes_none) {
-			result = SCAN_EXCEED_NONE_PTE;
-			count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
-		} else {
-			result = collapse_file(mm, addr, file, start, cc);
-		}
-		trace_mm_khugepaged_scan_file(mm, -1, file, present, swap,
-					      SCAN_SUCCEED);
-	} else {
-		trace_mm_khugepaged_scan_file(mm, failed_pfn, file, present,
-					      swap, result);
+	if (result == SCAN_SUCCEED && present < HPAGE_PMD_NR - max_ptes_none) {
+		result = SCAN_EXCEED_NONE_PTE;
+		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
 	}
 
+	trace_mm_khugepaged_scan_file(mm, failed_pfn, file, present, swap,
+				      result);
 	return result;
 }
 
@@ -2758,6 +2751,9 @@ enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 		unsigned long addr, struct collapse_control *cc,
 		unsigned long orders)
 {
+	enum scan_result result;
+	pgoff_t pgoff;
+
 	mmap_assert_locked(vma->vm_mm);
 	/* Whatever the last scan found has to have been run by now */
 	if (WARN_ON_ONCE(cc->scan_file)) {
@@ -2768,14 +2764,31 @@ enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 	if (vma_is_anonymous(vma))
 		return collapse_scan_anon_pmd(vma, addr, cc, orders);
 
+	pgoff = linear_page_index(vma, addr);
+	result = collapse_scan_file(vma->vm_mm, addr, vma->vm_file, pgoff, cc);
+	switch (result) {
+	case SCAN_SUCCEED:
+		cc->scan_retract_only = false;
+		break;
+	case SCAN_PTE_MAPPED_HUGEPAGE:
+		/*
+		 * The page cache already holds the PMD folio; what is left is
+		 * to retract the PTE table, which is the run's job.
+		 */
+		cc->scan_retract_only = true;
+		result = SCAN_SUCCEED;
+		break;
+	default:
+		return result;
+	}
+
 	/*
 	 * A file collapse works on the page cache and never sees a VMA, so take
-	 * what it needs from this one while it is still here.  Judging the
-	 * range needs the page cache and no lock, so it happens in the run.
+	 * what it needs from this one while it is still here.
 	 */
 	cc->scan_file = get_file(vma->vm_file);
-	cc->scan_pgoff = linear_page_index(vma, addr);
-	return SCAN_SUCCEED;
+	cc->scan_pgoff = pgoff;
+	return result;
 }
 
 enum scan_result collapse_run_pmd(struct mm_struct *mm, unsigned long addr,
@@ -2792,8 +2805,13 @@ enum scan_result collapse_run_pmd(struct mm_struct *mm, unsigned long addr,
 
 	cc->scan_file = NULL;
 	pgoff = cc->scan_pgoff;
+
+	if (cc->scan_retract_only) {
+		result = SCAN_PTE_MAPPED_HUGEPAGE;
+		goto retract;
+	}
 retry:
-	result = collapse_scan_file(mm, addr, file, pgoff, cc);
+	result = collapse_file(mm, addr, file, pgoff, cc);
 
 	/* Dirty pages are worth a writeback and one more try, if asked for */
 	if (cc->policy.writeback_dirty && result == SCAN_PAGE_DIRTY_OR_WRITEBACK &&
@@ -2805,8 +2823,13 @@ enum scan_result collapse_run_pmd(struct mm_struct *mm, unsigned long addr,
 		triggered_wb = true;
 		goto retry;
 	}
+retract:
 	fput(file);
 
+	/*
+	 * A PMD folio is in the page cache, whether the collapse just put it
+	 * there or found it: retract the PTE table, and map the PMD if asked.
+	 */
 	if (result == SCAN_PTE_MAPPED_HUGEPAGE) {
 		mmap_read_lock(mm);
 		if (collapse_test_exit_or_disable(mm))
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
