Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15F34F0531
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534648; cv=none; b=EnaIyBcIam6G6nVrgJ4SMcLkcMRI91jLb+4wHpyTw3BlkLAl62jWBkFq+BxzceZ4AHp+B7j8jboQ+IDGalL77+HPEvOFNQiClX8EU03FsbNnx2W99tfDsTYAGA/AERwwvEAJWnIeo57RwYnl8K/sYwE2BYkSZhLpcjMY49mfwrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534648; c=relaxed/simple;
	bh=+Cj83DNNCelBx+9Z3BZjXb5ZzXg4eTZtKEyCQOW558M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSvMR8vfUS5DddI7xYPCaTICPt9yEhrZHRsEXv9xmNsXhBgm+s4ZwOM09ZCaH/bYLyE7mmljBT65gprEy8AgKOJVUWsr17N9zliXaX2Wb8hqGC1tg3uSPpcULNVSSBc2PD9I7ULn+fBky6MBUwi/XTMPaYbZExQt98tssMad560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=e16hbKIp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SKTzj4/4; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="e16hbKIp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SKTzj4/4"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EA54E14000EA;
	Fri,  4 Sep 2026 11:10:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 04 Sep 2026 11:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788534644; x=
	1788621044; bh=r93rUlDolzw1y/GkO8pLufE2QiyunUPjQLxePIB9XW4=; b=e
	16hbKIphh+Ow3R7n0z+kJKD9ONUcVEFDCOGO2E8vrb2+imltlrO3ZhsCKXNPWqgR
	7t1oGPD+d6GWvatfWUgRTQl1YvqEEtCj05McCzMhto5h8BkBnx1pJJ18OkincXRF
	FFHWckDj7ojS1nF6KX/cQRbsAruYHmm2jy4LutA4RJITCMu2fOAV3o/jkzdp5krm
	zhlQuYCsFyQD8aQ8DA5I0tDFmPnmHO8KEV/WEMoCqpZyUgk7dJ4KJSie1OA9GZIL
	lL9Gi4riD1jtYuU+tbFhCbUBijquLPLJCKdzre9Qw++W6tSNOb84dc+2Palhop1L
	mfPAwYKMpdXeavMKG9RRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788534644; x=1788621044; bh=r
	93rUlDolzw1y/GkO8pLufE2QiyunUPjQLxePIB9XW4=; b=SKTzj4/4U68GjSc+o
	Hi5BEucItBtyQ69SNx773bFJp5k0BkWpJui5LB1oLLE0Puz7qfWuxAfe38rc/oAs
	KcHEvUq6fxJ8YXJlzH3lWtUACOaQJb0vdEDaMWAGUhvoduDu7BDVipipdsV8WJYG
	CT2phgyWyWLyNi+zUUJmOaQfCRgywLud1aD5K18LdJ+8JJaYZu69LGEoERyl3ElP
	APFGLwSaEJnIiF6pnpZYPZq9Ud3hsHc0sGPPLWiU+2iFypA5CpjA6U4KDpJaklOE
	98vuCMre3jUuV4Prttan7KiAS5WIGCuOXtBcOhyDbFmMv1g7geuE2/QhMIDQOoxB
	+Ynrw==
X-ME-Sender: <xms:dN-aaqSP8YVs8lVYFLP3hOWacJCUyapFECY8gzjTj7oiQatpW8mnMQ>
    <xme:dN-aaqdZvdTs_K1DE5oPOEox3QVApzUpzbb_zIqsM1N6jyuACbQtYeytEOojBf6oH
    za0bo_jdklZ05Wy9r2ewag02fqdQQqCxVt8m2rCw4ydUZY7jvWQfLXN-A>
X-ME-Received: <xmr:dN-aaufo3jcEzCoyuKlA_-JSDhnZ2fG7b8tGvsBoBCAV2E2C5gg6IT5cqpc>
X-ME-Proxy-Cause: dmFkZTET6cjphBfz4H8Wg4Mwj3Q2fsO4rbzY0RZa6uwdK6ABZ7pEhWaf3DWE0Wh23XozXl
    YXqBYYUtwtfZ1qQ9wX2bCqZqo/yq027VrzWqESBcvph06bOS8vyiOGOCS0fh2RY7A/kSFI
    L9MElk4eZ3HddGFY9A2GQHzM4/P7C4mhUDQ1iVikEtpcmuF5W8uFTm0u0CjZbROqFnINk4
    xO1zzX/Hj74YRRcHjJyG4ygWf0Hx5RhGZptpxeuVNBh7kD8dz0lfmQnwRvV5yZ57YM54K9
    KH8vVIjAAxpTayQfOZqnAJ2Uka0rmt6zQ0IYLz8TzxO+2W2OgPHZMW2lenfH2WoNpxg3Fu
    Is3rPBrDcBofCc7b6n/mkzPMHKzzFB4wzBYnbd1msgXXEWv5pcCEVAkkpXV9YTA1f+AM90
    fYGiwvFVPfibntr1gJm7N6PIziBa7N46Lwg7LpYrTxie3Cplo8XWo5c5qbj8fii7o4EfVR
    zfSbEJevvnyN65ADRgmIr9g+rY4WZTz40ZJjjzhrz6KlTzdXqInEhXD/5UgvIKmrLiG/Ei
    WEbYbLJho2MkPL6L3dEmJJAHfoOP0bVno1RgvPqFSrXsgRxEx+FsUvVjz0Lo15IVXh8/9y
    v+lUAhRzWHZNhw1wTWJu6ajdwVgYkVDa1b2c/L4M/R8ruWXpUUg6Ab5PYxIA
X-ME-Proxy: <xmx:dN-aag9QRbModmiuTHX39hOOaiOW8GTLktNsBrZUhACQ9OPB_Kx7SQ>
    <xmx:dN-aauOv47StyTeP06AAtQn17IJ3VLia6JNfjwlXkHhWlrwhneBaRw>
    <xmx:dN-aauVsVvaHMOGs_pr-ZDBBKpXGRxcTYIItV63WTJrjwl_k6fnKbA>
    <xmx:dN-aaujadB2sSllencJVymi7sN1WwQVxXbhhkyxQmz6sU3KZ2FZiIQ>
    <xmx:dN-aagJCCAOwwXx_QqpiiiRNFp4Z8eh543cm-fFgO3rKd89LmCCMImoz>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 11:10:44 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 08/12] mm/collapse: separate scanning a PTE table from collapsing it
Date: Fri,  4 Sep 2026 16:10:22 +0100
Message-ID: <1a1bc537850bd7ef73bed5ac4985634bb8dd95e1.1788533997.git.kas@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788533997.git.kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

A collapse is two jobs.  One reads a PTE table under mmap_lock and decides
whether the range is worth collapsing.  The other allocates, isolates,
copies and flushes, and wants the lock given up first.

collapse_single_pmd() did both, so the boundary between them was somewhere
in the middle of a function.

Give each half its own function:

  - collapse_scan_pmd() scans one table and only reads.  The anonymous
    scan that used to carry that name keeps its body as
    collapse_scan_anon_pmd(), and collapse_scan_pmd() is now the entry
    that picks the anonymous or the file side.

  - collapse_run_pmd() does the collapse the scan asked for.
    SCAN_SUCCEED from the scan means there is something to run; anything
    else is why there is not.

collapse_single_pmd() is now the two of them with the mmap_lock drop in
between, so its callers see what they saw before.

Scan results (beyond SCAN_SUCCEED) communicated via collapse_control
structure: the orders, the referenced and swapped-out counts, and for a
file the file itself and the offset in it.

A file collapse works on the page cache and never sees a VMA.  The scan
takes the file reference while it still has VMA and the run unpins it
when it is done.

Tracing changes with it.  mm_khugepaged_scan_pmd now fires before
mm_collapse_huge_page instead of after it.  Its status field already reads
SCAN_SUCCEED for an accepted table, so what the collapse then made of that
table is mm_collapse_huge_page's to report, per order.

The two calls to that tracepoint become one.  They differed in what the
collapse between them changed; with the collapse no longer here, both
carry the same arguments.  failed_pfn is set only where a PTE was refused,
so it is -1 exactly when the result is SCAN_SUCCEED.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/collapse.h   |  14 ++++++
 mm/khugepaged.c | 121 ++++++++++++++++++++++++++++++++++--------------
 2 files changed, 100 insertions(+), 35 deletions(-)

diff --git a/mm/collapse.h b/mm/collapse.h
index 05282eed9a35..f03cad8ed40e 100644
--- a/mm/collapse.h
+++ b/mm/collapse.h
@@ -100,6 +100,20 @@ struct collapse_control {
 
 	/* Each bit marks a PTE the scan accepted as a collapse source */
 	DECLARE_BITMAP(eligible_ptes, MAX_PTRS_PER_PTE);
+
+	/*
+	 * What a scan found and the run after it needs.  Live only between the
+	 * two, and read by nobody else.
+	 *
+	 * The file side takes a reference while it still has the VMA, since a
+	 * file collapse works on the page cache and never sees one; the run is
+	 * what gives it back.
+	 */
+	unsigned long scan_orders;
+	int scan_referenced;
+	int scan_unmapped;
+	struct file *scan_file;
+	pgoff_t scan_pgoff;
 };
 
 #endif	/* __MM_COLLAPSE_H */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 511ffb381fe9..120af57540df 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1550,14 +1550,14 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
 	return last_result;
 }
 
-static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
-		struct vm_area_struct *vma, unsigned long start_addr,
-		bool *lock_dropped, struct collapse_control *cc)
+static enum scan_result collapse_scan_anon_pmd(struct vm_area_struct *vma,
+		unsigned long start_addr, struct collapse_control *cc)
 {
 	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
 	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
 	unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER);
 	enum tva_type tva_flags = cc->policy.tva_type;
+	struct mm_struct *mm = vma->vm_mm;
 	pmd_t *pmd;
 	pte_t *pte, *_pte, pteval;
 	int i;
@@ -1737,19 +1737,17 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 out_unmap:
 	pte_unmap_unlock(pte, ptl);
 	if (result == SCAN_SUCCEED) {
-		/* collapse_huge_page() expects the lock to be dropped before calling */
-		mmap_read_unlock(mm);
-		result = mthp_collapse(mm, start_addr, referenced,
-				       unmapped, cc, enabled_orders);
-		/* mmap_lock was released above, set lock_dropped */
-		*lock_dropped = true;
-		trace_mm_khugepaged_scan_pmd(mm, -1, referenced, none_or_zero,
-					     SCAN_SUCCEED, unmapped);
-	} else {
-out:
-		trace_mm_khugepaged_scan_pmd(mm, failed_pfn, referenced,
-					     none_or_zero, result, unmapped);
+		cc->scan_orders = enabled_orders;
+		cc->scan_referenced = referenced;
+		cc->scan_unmapped = unmapped;
 	}
+out:
+	/*
+	 * failed_pfn is only set where a PTE was refused, so it is -1 on the
+	 * path that returns SCAN_SUCCEED.
+	 */
+	trace_mm_khugepaged_scan_pmd(mm, failed_pfn, referenced,
+				     none_or_zero, result, unmapped);
 	return result;
 }
 
@@ -2759,30 +2757,58 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	return result;
 }
 
-/*
- * Try to collapse a single PMD starting at a PMD aligned addr, and return
- * the results.
- */
-static enum scan_result collapse_single_pmd(unsigned long addr,
-		struct vm_area_struct *vma, bool *lock_dropped,
-		struct collapse_control *cc)
+static void collapse_control_init(struct collapse_control *cc)
 {
-	struct mm_struct *mm = vma->vm_mm;
-	bool triggered_wb = false;
-	enum scan_result result;
-	struct file *file;
-	pgoff_t pgoff;
+	cc->progress = 0;
+	cc->scan_file = NULL;
+}
 
-	mmap_assert_locked(mm);
+static void collapse_control_release(struct collapse_control *cc)
+{
+	/* A scan that took a file reference should have been run */
+	if (WARN_ON_ONCE(cc->scan_file)) {
+		fput(cc->scan_file);
+		cc->scan_file = NULL;
+	}
+}
+
+static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
+		unsigned long addr, struct collapse_control *cc)
+{
+	mmap_assert_locked(vma->vm_mm);
+	/* Whatever the last scan found has to have been run by now */
+	if (WARN_ON_ONCE(cc->scan_file)) {
+		fput(cc->scan_file);
+		cc->scan_file = NULL;
+	}
 
 	if (vma_is_anonymous(vma))
-		return collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
+		return collapse_scan_anon_pmd(vma, addr, cc);
 
-	file = get_file(vma->vm_file);
-	pgoff = linear_page_index(vma, addr);
+	/*
+	 * A file collapse works on the page cache and never sees a VMA, so take
+	 * what it needs from this one while it is still here.  Judging the
+	 * range needs the page cache and no lock, so it happens in the run.
+	 */
+	cc->scan_file = get_file(vma->vm_file);
+	cc->scan_pgoff = linear_page_index(vma, addr);
+	return SCAN_SUCCEED;
+}
 
-	mmap_read_unlock(mm);
-	*lock_dropped = true;
+static enum scan_result collapse_run_pmd(struct mm_struct *mm,
+		unsigned long addr, struct collapse_control *cc)
+{
+	struct file *file = cc->scan_file;
+	bool triggered_wb = false;
+	enum scan_result result;
+	pgoff_t pgoff;
+
+	if (!file)
+		return mthp_collapse(mm, addr, cc->scan_referenced,
+				     cc->scan_unmapped, cc, cc->scan_orders);
+
+	cc->scan_file = NULL;
+	pgoff = cc->scan_pgoff;
 retry:
 	result = collapse_scan_file(mm, addr, file, pgoff, cc);
 
@@ -2812,6 +2838,28 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 	return result;
 }
 
+/*
+ * Try to collapse a single PMD starting at a PMD aligned addr, and return
+ * the results.
+ */
+static enum scan_result collapse_single_pmd(unsigned long addr,
+		struct vm_area_struct *vma, bool *lock_dropped,
+		struct collapse_control *cc)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	enum scan_result result;
+
+	result = collapse_scan_pmd(vma, addr, cc);
+	if (result != SCAN_SUCCEED)
+		return result;
+
+	/* The collapse takes its own locks, so give this up */
+	mmap_read_unlock(mm);
+	*lock_dropped = true;
+
+	return collapse_run_pmd(mm, addr, cc);
+}
+
 static void collapse_scan_mm_slot(unsigned int progress_max,
 		enum scan_result *result, struct collapse_control *cc)
 	__releases(&khugepaged_mm_lock)
@@ -2954,10 +3002,10 @@ static void khugepaged_do_scan(struct collapse_control *cc)
 
 	lru_add_drain_all();
 
+	collapse_control_init(cc);
 	/* One policy for the whole pass, so every table is judged the same */
 	collapse_policy_khugepaged(&cc->policy);
 
-	cc->progress = 0;
 	while (true) {
 		cond_resched();
 
@@ -2988,6 +3036,8 @@ static void khugepaged_do_scan(struct collapse_control *cc)
 			khugepaged_alloc_sleep();
 		}
 	}
+
+	collapse_control_release(cc);
 }
 
 static bool khugepaged_should_wakeup(void)
@@ -3184,8 +3234,8 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	cc = kmalloc_obj(*cc);
 	if (!cc)
 		return -ENOMEM;
+	collapse_control_init(cc);
 	collapse_policy_forced(&cc->policy);
-	cc->progress = 0;
 
 	lru_add_drain_all();
 
@@ -3242,6 +3292,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	}
 out_nolock:
 	mmap_assert_locked(mm);
+	collapse_control_release(cc);
 	kfree(cc);
 
 	return thps == ((hend - hstart) >> HPAGE_PMD_SHIFT) ? 0
-- 
2.54.0

