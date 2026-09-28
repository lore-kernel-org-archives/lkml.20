Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F1497397
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590022; cv=none; b=Z2rirmTnIneQARGPZrCa/YNPv6bVgGLdRdBOpH69gEt2WqCUS5RbTznP9zORYdXCSKFeEIyGig1FsLaRi9Mr2IK8m0lXQIGwmH3ntA6T1pBnja8BY1Q1UXyK6p7NHM/zdyFxzAWEm2cM1fXHOglBWwYhhYPPwH1bgTQxUA+flhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590022; c=relaxed/simple;
	bh=dvf5h4cgwmRHJfRNie8N10Q5ZlawHkRTgIKdmCj2WRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hqc5bt8cgSdYUn8xc1VlaE9Mlvq8BE32ACYYEEcDvip8QPHm/nqMoLHs9rzk5rKSGjSoUubz4sR5BLzfpn5Li+9sundVEqEsSnr6innuqtoCLf1YUkfK+S8Cob0FKm09q02eNLBEUZdj6ReClTWWrNI3gKOw6XR9o8CLyBrL9pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=qNlv4uym; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kx4lJqVV; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="qNlv4uym";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kx4lJqVV"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 2E2E9EC011C;
	Mon, 28 Sep 2026 06:06:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 28 Sep 2026 06:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790590015; x=
	1790676415; bh=Gwcys0R8zu3t7D25+QkuyNJ3AyWPIUyF8hGHaRqZS8k=; b=q
	Nlv4uym2qFFSw3f0GIsB4vE6nEg4cDK7MUv/bBlkpLyQgYNd03zun6yxIoguO3KV
	SFvhZTU+AEE1tCZVu0YfRAntZhszsxA4J8pRjiTsLGYQLqc71Y1G1Z03cdTnZ2up
	vLiCROXsgHT5FHos+qdDnpMcX+PFirMJMKpoI1eCMv5NSMGaLzoWEgTWUia/4T+y
	y4iBjg3v02l3riLmWilXdw+tZaijEZedLrrj+LJ74r6UxBOlZa+t1/SK0/ZgVIy4
	cEWlgbSrlGms/59B0Z5xkV6rJTmb94iMu/Hzj4cTW2nwMurvP1YMid3aR1SEdIRr
	zZWfH4Y4M7oYXKKZ+iFyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790590015; x=1790676415; bh=G
	wcys0R8zu3t7D25+QkuyNJ3AyWPIUyF8hGHaRqZS8k=; b=kx4lJqVVP5OtKUc/u
	m9tuTS0gcOd19s5j1TqmxMW3NGOCjgON3k8G+Q244vjjOyCeul6D7kYoVQh+Oj3z
	02ygJf/1Gwma047kpiamYN1RWA8lmMvSQKEALyeXXGpiZePOfWQevfzroKIRh4m4
	tCjJzJt5HQDPC9MmdG7NrkraXF7qOL8gotYM6XYjngTZwYh3j/nvF+SuUT2BEPC/
	+B8+KAXJvaF9jaywRwKJMFfDpB0WUdHcjHa95TMMqLpd+IzjxzN/mSqWAgl6Eg8J
	I8MSU2x9hwBUseQGuGAy4XYgvhLTdMjawZ831BxwNPbJIs8vhYyogMKNdtDEBtid
	/T2QA==
X-ME-Sender: <xms:Pjy6aoIjvAWo9DtE2-qvryzg99LVHGkLAJuF23Z-rZ6uMnJNqRCatg>
    <xme:Pjy6akGpHjrcGd6ByBuvnD0aEzNGQtP2bR5psRNleqLssF2eNHeaeXrUoJWpk7K20
    sxWylxz3Xd-UT1K2X5y2BTORWorUt1oNozdgosuPB4xF4eqGpBfG2s>
X-ME-Received: <xmr:Pjy6au0S7HPIIXRTKsX15mCFrNPnxUMPoq2ohpq0zeLYgPpF-Bx0hkJjX5g>
X-ME-Proxy-Cause: dmFkZTF8+FzWl2kPFFw+2+MUnNndpG3Es29zlM3W8MqBD0QW9993JqL27RjsdWHL5iQTuv
    8LHkef+10EFcRNyu6aMfBJblGtUMhigK1wvWUg5pa/T2F4HZOycwBRl+2S+z7tqw2cJfHU
    gdsF/P6BOMqpKS9LZRm0d8oBtyKEEqCXwj8zji6pXjSixGW9yMDmevXCSXRhMug+RBOuj6
    H/TPGEbj0UBxBpkklI8Q2dk1KPN1FfxQ05T6kAzB+fcPQyWzSSafNh6004OlOqdREfhbRG
    BHI+j7BDMASDclZuapGmxVrXolh8JlQnm8Hn+THchpsYHB/1yAmWKg/yew9Ltzw86nEqr5
    LkwgIlcQ/5zusUTb4uYUipsjyIVsn0ddKXIy7/Ac2+sBl5e/yrfSLCnNoYrJETdKg/o8kF
    fzUTvtNjeshNyHb6EtUY+Sbn/hKe6TEGbR69JgnW7mIGuwd+rMn0PMpJ//XilUHiBXlSCM
    OSHSJ/SzT9IkHsx+m71fdnluE4UNRHogmQH6aUHc67kGTpU0B8tDYKc16c2n/ivHvkuF0i
    QC8Z7z9Jc+Peh6y4NcytFtgpHwLoBMiSEhQXSy3L73M+jKjP7qHHcG+IPB9+Zq2+qw61bM
    zixA4S9j4B+tGPkbqX4asZqoT3BZncVEvlTevF+TLtplJMHPi2WXUvW2NjnA
X-ME-Proxy: <xmx:Pjy6arzVpo_3L4kPXiWV_qyQmMcxYBjkAtL0cR2u4BpINbCPC56Lng>
    <xmx:Pjy6atibHyz5RiZ1hgc-3KS9FTFWAqLLMN29sRNZ9LSYoUsSfWRCBQ>
    <xmx:Pjy6aqwGwsffpvjYdhQ771x6rZnf-MltFiIDygIuxZ0PWIMhtF2q9w>
    <xmx:Pjy6arx-yvhPMlPLX_7DfiTmfN70kV1vlm_cWNJXWtoxYXB_JWNevg>
    <xmx:Pzy6aiKVCOKs94n55y3H0z-HkvYAXB5tZRC4xMIgJ5xw0KiBBoKInBhL>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:06:54 -0400 (EDT)
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
Subject: [PATCH v4 11/13] mm/collapse: work out the orders a VMA allows once per VMA
Date: Mon, 28 Sep 2026 11:06:25 +0100
Message-ID: <20260928100630.21870-12-kirill@shutemov.name>
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

The scan asked collapse_possible_orders() for every PTE table, for an
answer that is a property of the VMA.  Both callers walk a VMA a table at
a time, so let them work it out once and pass the mask in.  It is only
good while the lock that produced it is held, so madvise_collapse() takes
it again after every collapse.

The mask is then sampled once per VMA rather than once per table.  A thp
enabled knob written during a walk takes effect one VMA later, and cannot
widen a collapse: hugepage_vma_revalidate() tests the order again under
the lock the collapse retakes.

Assisted-by: LLM
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index be8a26e1de49..ed74d3268698 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1547,12 +1547,12 @@ static enum scan_result mthp_collapse(struct mm_struct *mm, unsigned long addres
 }
 
 static enum scan_result collapse_scan_anon_pmd(struct vm_area_struct *vma,
-		unsigned long start_addr, struct collapse_control *cc)
+		unsigned long start_addr, struct collapse_control *cc,
+		unsigned long enabled_orders)
 {
 	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
 	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
 	unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER);
-	enum tva_type tva_flags = cc->policy.tva_type;
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t *pmd;
 	pte_t *pte, *_pte, pteval;
@@ -1563,7 +1563,6 @@ static enum scan_result collapse_scan_anon_pmd(struct vm_area_struct *vma,
 	struct folio *folio = NULL;
 	unsigned long failed_pfn = -1;
 	unsigned long addr;
-	unsigned long enabled_orders;
 	spinlock_t *ptl;
 	int node = NUMA_NO_NODE, unmapped = 0;
 
@@ -1577,8 +1576,6 @@ static enum scan_result collapse_scan_anon_pmd(struct vm_area_struct *vma,
 
 	collapse_scan_reset(cc);
 
-	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
-
 	/*
 	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
 	 * scan all pages to populate the bitmap for mTHP collapse. The bitmap
@@ -2749,7 +2746,8 @@ static void collapse_control_init(struct collapse_control *cc)
 }
 
 static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
-		unsigned long addr, struct collapse_control *cc)
+		unsigned long addr, struct collapse_control *cc,
+		unsigned long orders)
 {
 	enum scan_result result;
 	pgoff_t pgoff;
@@ -2762,7 +2760,7 @@ static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 	}
 
 	if (vma_is_anonymous(vma))
-		return collapse_scan_anon_pmd(vma, addr, cc);
+		return collapse_scan_anon_pmd(vma, addr, cc, orders);
 
 	pgoff = linear_page_index(vma, addr);
 	result = collapse_scan_file(vma->vm_mm, addr, vma->vm_file, pgoff, cc);
@@ -2872,15 +2870,17 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 
 	vma_iter_init(&vmi, mm, khugepaged_scan.address);
 	for_each_vma(vmi, vma) {
-		unsigned long hstart, hend;
+		unsigned long hstart, hend, orders;
 
 		cond_resched();
 		if (unlikely(collapse_test_exit_or_disable(mm))) {
 			cc->progress++;
 			break;
 		}
-		if (!collapse_possible_orders(vma, vma->vm_flags,
-					      TVA_KHUGEPAGED)) {
+		/* One mask for the whole VMA */
+		orders = collapse_possible_orders(vma, vma->vm_flags,
+						  TVA_KHUGEPAGED);
+		if (!orders) {
 			cc->progress++;
 			continue;
 		}
@@ -2909,7 +2909,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			/* move to next address */
 			khugepaged_scan.address += HPAGE_PMD_SIZE;
 
-			*result = collapse_scan_pmd(vma, addr, cc);
+			*result = collapse_scan_pmd(vma, addr, cc, orders);
 			/* Nothing to do here, and the lock is still ours */
 			if (*result != SCAN_SUCCEED &&
 			    *result != SCAN_PTE_MAPPED_HUGEPAGE) {
@@ -3191,14 +3191,16 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 {
 	struct collapse_control *cc;
 	struct mm_struct *mm = vma->vm_mm;
-	unsigned long hstart, hend, addr;
+	unsigned long hstart, hend, addr, orders;
 	enum scan_result last_fail = SCAN_FAIL;
 	int thps = 0;
 
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	if (!collapse_possible_orders(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
+	orders = collapse_possible_orders(vma, vma->vm_flags,
+					  TVA_FORCED_COLLAPSE);
+	if (!orders)
 		return -EINVAL;
 
 	hstart = ALIGN(start, HPAGE_PMD_SIZE);
@@ -3236,9 +3238,11 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 			}
 			vma = found;
 			hend = min(hend, vma->vm_end & HPAGE_PMD_MASK);
+			orders = collapse_possible_orders(vma, vma->vm_flags,
+							  TVA_FORCED_COLLAPSE);
 		}
 
-		result = collapse_scan_pmd(vma, addr, cc);
+		result = collapse_scan_pmd(vma, addr, cc, orders);
 		/* Nothing to do here, and the lock is still ours */
 		if (result != SCAN_SUCCEED && result != SCAN_PTE_MAPPED_HUGEPAGE)
 			goto tally;
-- 
2.54.0

