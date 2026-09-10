Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A648663E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041796; cv=none; b=PX4lOcZrXYFeyDTeW8ibntamXwcJxD2FceSzwhehtiI/XI8lFRP2w0kKILBhR6141eEGEgLWJ/h8BE2t0ShxKtVZfym5LtPOYnSAie5m0NR7EvEKSXCtmjSNfogdxPwKsFUk2gdN4o5+A7XXwzrZ1VkBUILavaT4jiziTHhoGeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041796; c=relaxed/simple;
	bh=sB7GXY8tz8WCai8H2INDDIfL/6ubnxNVvg6UUEURYAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DiPCF9pnXAnlfbbqAi5RsfVyt3CSDEJzleiWAPrm/68BUIdh5kl1SP8ybCCJuk/TUQKzwZPm9loJYq7jKf2ZIjq+mj0mDAd//Wny1EtBKUxqKTdkz4ClD1blO+UnUuP9pS73f8HGl+/4tk0zFi1ty5pxB0HlTPXvQ0+GxH+fChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=JYuMWBx4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XAB7hUSF; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="JYuMWBx4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XAB7hUSF"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B07721D000AF;
	Thu, 10 Sep 2026 08:03:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 10 Sep 2026 08:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789041793; x=
	1789128193; bh=U3fJN6p296lB8xQAGr9+sipff9HImTdOJUAonJMUUhM=; b=J
	YuMWBx4T1Oe8RKUAsbsHTo9RuPm9QxNeyXXP7Kur7rWtkK21LZKwq7Pl6DwcMct0
	5s3FS1tKOS8vh8/x1CI8GtIw0E/6Z9QuoZTw5rqLF/ikTvt5ur3h+cZCv1dfgPN2
	fVh3UrlWEuuQs/0y13eddIgQe8utwbFytt0wPWL/NOsf+kAUPz8FMpFpskiabVeZ
	u8rkxQd0VlGS03Fsz5eAOd8ts8cFjJOeGoePwAiK6+WwMFDcD/tvY3iv4zt64bdR
	1nRZ9a9Tu42BnT+kMUCIdqMCKdduJfNYCLKe/Ru07GaQUnYmkJ8CUoHuaejSk0FR
	EVGhzwnuaB/pEzq7nQ6Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789041793; x=1789128193; bh=U
	3fJN6p296lB8xQAGr9+sipff9HImTdOJUAonJMUUhM=; b=XAB7hUSFpA12cCPJM
	OMDqYRLFct9E/qNWpFh9WOaKkBgGDBuo0OWLQ0k4cdSWLGEe6I01MZxXtkTHRvyl
	quHDuLMGAUPV/7a8RT1THTqviv3A/hRciKXzJgXngMUngjH1sDRmpAikw1nvPpHH
	wlthYfptb5vddwMXqBj3fvOudK8I8FsX1W7IeKhqqg+j3nxLhzpcWMNQ8zUyskIZ
	59jitQ/Hfw1XQp60giP7FFJjdgHCLYTc3fvBDub8fRX5XrBkEGBxTq6tXhE26e+8
	YY3sRCZXt+je++5NcBa3utZyv2QZTsk3OZFBQshOWcSsAqCY09cUPhlXgiY+XdCB
	UDZIg==
X-ME-Sender: <xms:gZyiavy00eWV_iPEYIGlDAipRFfDzzfGK5wh4Fr1fEQPPk1_8g7kEA>
    <xme:gZyiajM2eezg6hqzbA1onUy8PIsZYGl441XjwnbCIO8R699VZDXIJMrDhcnCZvQgr
    LbHSAyJ0UxalSLBCPi6UajbfvBXFj5LrJijCUNZQWQg1OhTQaAKGAg>
X-ME-Received: <xmr:gZyiaveBM4pbIwV_8dYi5rdNKZKUtPyobM6deX3xrDuPFrneW3wfWpXrdlc>
X-ME-Proxy-Cause: dmFkZTGUwtybjwPNTLo6R8Djs851CxE4dYABoksc5DOLebDAdjF/7kz2LTXedMZaJHaEsl
    u+9R36zRT1ZhtRkJBR4Xz/EwBimHSAG+mwOmEGehzEiv3PYSuq6Z2mKTclu6l8ZCGLaRVv
    RupVEjOuMXLaHhEvmZ7MRnQK4S/jaA4Fn+A/pUOz8kiJx7aYiU9MigP37WKT+MGxNap2wz
    dRarL4pe9tmhsdpwwUXZj55Ji6mi71ZgLtAGecz1FGZAcB1ieVS0L457vxQ1F9sxIDxLwT
    QcbTU8EZJEacVnPbAL6aT/vW8eX/g2TSMrM6YxxBPc/XsEEo+/bzW/w+LZ0gFhc/ZZneV+
    vBUhDdd1wrc7OOZstiDjdJu3h/8fXkEkTVsJWdfGlzoNfbRCw8ttRXYEMeIWUbm/cXSR4L
    0eKZQ8+Dm52lOCDT4lAOt1AIzAq4SRNVZG94DY+1cHz6Wr+rdWScldoDGWCVh0TgCnQvX+
    Vsc8iMYu7wteWYcCiBcAtfKxwZV66W02PEgzgOvGxpevqvlGLEyzy8Mr8lBBhpF+WFjwU/
    60RCAixwv13lRN3dbWksHjFMLsqo3WnZ6aV0/CpAK5N13BPRs2YFczS7JV8rfw5eEboqu3
    c1ww/CKHpIPKYiFUkb1Cnqv8n2/vWAueO8W2qFX4yGVL8DFNiVEohvoyHhMw
X-ME-Proxy: <xmx:gZyiav4YDEMnD9T5yYUASUcgh3Dyc9fi2FLXvovlcsJMxUgXja6WaQ>
    <xmx:gZyiavKKgsUgzy-TipYLV6gIyG5zkzehSCCSig-EfTfN8mgYY4XMEA>
    <xmx:gZyiar4wq_HxErhgO-yqfRIEx9whimrsGik4KPEKbDctDAyVX9ZhIg>
    <xmx:gZyiamaUdbGZbaPtVQext43voPkENd4d85k9vIegT6zCxU79GRakUw>
    <xmx:gZyiavpWv7Dmhu5ZqVOwiZC6l-3X8UXuMqCmMjimgNd5vn2nN5rv5FvV>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 08:03:13 -0400 (EDT)
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
Subject: [PATCH v2 11/12] mm/collapse: declare the collapse interface in collapse.h
Date: Thu, 10 Sep 2026 13:02:31 +0100
Message-ID: <20260910120238.2529819-12-kirill@shutemov.name>
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

A collapse takes four calls:

  - collapse_control_init() - set up the control a caller carries;
  - collapse_scan_pmd() - scan one PTE table, under mmap_lock;
  - collapse_run_pmd() - collapse what the scan found, no mmap_lock;
  - collapse_control_release() - done with the control.

All four are static in khugepaged.c, as are collapse_possible_orders(),
which says what a VMA allows, and the revalidate a caller needs once a
collapse has given the mmap_lock up.  No other file can ask for a collapse
without them.

Declare them in collapse.h, with a comment stating the order they are
called in and who holds the lock over each step.

hugepage_vma_revalidate() becomes collapse_vma_revalidate(): it is part of
what a collapse offers now, not a helper of the daemon.

Preparation for implementing MADV_COLLAPSE in madvise.c.

No functional change.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/collapse.h   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 mm/khugepaged.c | 18 +++++++++---------
 2 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/mm/collapse.h b/mm/collapse.h
index 346859a2184f..1ebbbf63fb25 100644
--- a/mm/collapse.h
+++ b/mm/collapse.h
@@ -106,4 +106,48 @@ struct collapse_control {
 	bool scan_retract_only;
 };
 
+/* Which orders a VMA may collapse to, zero when it may not collapse at all */
+unsigned long collapse_possible_orders(struct vm_area_struct *vma,
+		vm_flags_t vm_flags, enum tva_type tva_flags);
+
+/*
+ * A caller states what it allows in cc->policy and then hands over one PTE
+ * table's worth of a VMA at a time:
+ *
+ *     collapse_control_init(cc)         once, before the first table
+ *     collapse_scan_pmd(vma, addr, ...) per table
+ *     collapse_run_pmd(mm, addr, cc)    when a scan found work
+ *     collapse_control_release(cc)      once, when done with the control
+ *
+ * The caller holds mmap_lock for reading over the scan and passes an address
+ * within @vma, aligned to the PTE table the scan is to judge.
+ *
+ * The scan returns with that lock still held.  It only reads, and almost every
+ * table it is offered has nothing to collapse, so a caller walks a whole VMA
+ * under the one lock it took to get there.  SCAN_SUCCEED means there is
+ * something to collapse; anything else is why there is not.
+ *
+ * The run is called without the lock and returns without it, taking what it
+ * needs in between: what it does -- allocate, isolate, copy, flush -- is slow
+ * enough that a writer would wait behind it.  The caller gives the lock up
+ * first, and with it @vma and anything derived under it, so a caller carrying
+ * on has to look up again with collapse_vma_revalidate().  The run revalidates
+ * for itself rather than trusting what the scan saw.
+ *
+ * A scan that found something has to be run: the file side takes a reference on
+ * the file while it still has the VMA to take it from, and the run is what
+ * gives it back.
+ */
+void collapse_control_init(struct collapse_control *cc);
+void collapse_control_release(struct collapse_control *cc);
+enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
+		unsigned long addr, struct collapse_control *cc,
+		unsigned long orders);
+enum scan_result collapse_run_pmd(struct mm_struct *mm, unsigned long addr,
+		struct collapse_control *cc);
+enum scan_result collapse_vma_revalidate(struct mm_struct *mm,
+		unsigned long address, bool expect_anon,
+		struct vm_area_struct **vmap, struct collapse_control *cc,
+		unsigned int order);
+
 #endif	/* __MM_COLLAPSE_H */
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 9e77f71a788d..77f34aedf0f2 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -498,7 +498,7 @@ void __khugepaged_enter(struct mm_struct *mm)
  * Check what orders are possible based on the vma and collapse type.
  * This is used to determine if mTHP collapse is a viable option.
  */
-static unsigned long collapse_possible_orders(struct vm_area_struct *vma,
+unsigned long collapse_possible_orders(struct vm_area_struct *vma,
 		vm_flags_t vm_flags, enum tva_type tva_flags)
 {
 	unsigned long orders;
@@ -1016,7 +1016,7 @@ static int collapse_find_target_node(struct collapse_control *cc)
  * Returns enum scan_result value.
  */
 
-static enum scan_result hugepage_vma_revalidate(struct mm_struct *mm, unsigned long address,
+enum scan_result collapse_vma_revalidate(struct mm_struct *mm, unsigned long address,
 		bool expect_anon, struct vm_area_struct **vmap,
 		struct collapse_control *cc, unsigned int order)
 {
@@ -1264,7 +1264,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 	}
 
 	mmap_read_lock(mm);
-	result = hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
+	result = collapse_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
 					 &vma, cc, order);
 	if (result != SCAN_SUCCEED) {
 		mmap_read_unlock(mm);
@@ -1299,7 +1299,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 	 * mmap_lock.
 	 */
 	mmap_write_lock(mm);
-	result = hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
+	result = collapse_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
 					 &vma, cc, order);
 	if (result != SCAN_SUCCEED)
 		goto out_up_write;
@@ -2743,13 +2743,13 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	return result;
 }
 
-static void collapse_control_init(struct collapse_control *cc)
+void collapse_control_init(struct collapse_control *cc)
 {
 	cc->progress = 0;
 	cc->scan_file = NULL;
 }
 
-static void collapse_control_release(struct collapse_control *cc)
+void collapse_control_release(struct collapse_control *cc)
 {
 	/* A scan that took a file reference should have been run */
 	if (WARN_ON_ONCE(cc->scan_file)) {
@@ -2758,7 +2758,7 @@ static void collapse_control_release(struct collapse_control *cc)
 	}
 }
 
-static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
+enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 		unsigned long addr, struct collapse_control *cc,
 		unsigned long orders)
 {
@@ -2802,7 +2802,7 @@ static enum scan_result collapse_scan_pmd(struct vm_area_struct *vma,
 	return result;
 }
 
-static enum scan_result collapse_run_pmd(struct mm_struct *mm,
+enum scan_result collapse_run_pmd(struct mm_struct *mm,
 		unsigned long addr, struct collapse_control *cc)
 {
 	struct file *file = cc->scan_file;
@@ -3256,7 +3256,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 		if (!vma) {
 			cond_resched();
 			mmap_read_lock(mm);
-			result = hugepage_vma_revalidate(mm, addr, false, &found,
+			result = collapse_vma_revalidate(mm, addr, false, &found,
 							 cc, HPAGE_PMD_ORDER);
 			if (result != SCAN_SUCCEED) {
 				last_fail = result;
-- 
2.54.0

