Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227561;
	b=Dq0jxROLcByGelmtfAB/tkSoBy1dwZx+PiJGG0tGMdR9wFAdV4ejI96cNNufTlWvJYS8
	 +wOJIc9YEWrG5Vgl0jxMQyouI/Na3c8hsMyrKlS9LWfW5A+ZzeB5+BQQ0Rs33HzPRdJIp
	 czvQisRDHr4Tb0iX+UWhvlHXXreKLshfIXg3fVxd7smcjs0hjKa0nMCubi+s4d4/hSKnx
	 TCPrIbwop7PemL6QXFpgBFSgI2YmnRrLaREZe9dVBztNUjZs9vixcqgWk6c735qzjOsRL
	 kc863lFOWsiIeiTBLy/VnLAOVj3lKO/df2H3qYb1BiweNH55h3ulhDapSiGY83T32Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227561;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=O0m3LG1TSGw1pl4wrdSXysmWFFd72Xwpe4g0cR8PTVs=;
	b=tAJyzWmtDps4GAczcxX/OfOGQKGShpcwaavQYwy0vaGJOzFN46hjtVydHDgZr96dDcZq
	 1OH6i97AjLitS0/y9LytCyqi7BxPq8NjYNqW255XYA4Ebi+P9o/PRWRhd4BXmqDVFCPT4
	 ZcjkhFyqtSZYZSNNx/THrK7UQxNdNDSBHuhnW8g4fmnr5spiB7VNXCbDu//6BT+0mdmyC
	 4vXHSj3tTQehKCA5EE4y+Ngn/tQv5+WU51opaYOZrga9VtfkhvkvhWvdvoBXeptYRf08H
	 hO2nINtQLym+WWPWC0tm1xMT1UHCvF1PNEcNilsosYzMdvyy0XLGrnIbpoGl240emEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O6zSV6AD;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8A8606D828
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F8A8606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O6zSV6AD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85A881BA8;
	Mon,  9 Nov 2026 04:32:37 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7FBC3F632;
	Mon,  9 Nov 2026 04:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794227560; bh=jgTt0m9myglWZu/F2zsSCv7Hlde3huyTl+uIVrhL1pc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O6zSV6ADLb+2dw7TL4s2du5r2X3O8T9grQMMx63wdw0frJ3ISrEqJnBSTdoFsCGn+
	 qI/w1HVzJRAwg0+eLvzZl0qXpr9o08iF3SqHPihczfjwiMLh5Z/JTjAhfyPZpQ/uUg
	 7DFiDIPExDC+LXgWhXMruI1vguXDE5lQ/gaCkl7I=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 09 Nov 2026 12:32:27 +0000
Subject: [PATCH v3 3/6] mm: gup: move gup_must_unshare() and
 INTERNAL_GUP_FLAGS to gup.c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-refactor_gup_fast-v3-3-2aaef02df0e1@arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
In-Reply-To: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6133; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=jgTt0m9myglWZu/F2zsSCv7Hlde3huyTl+uIVrhL1pc=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq8b1duRloqYMc+JZKOmgdOeurSbfd/E4SfH9H5
 16ooShkiCKJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCavG9XQAKCRBt1cPRWsUx
 MxQxC/0ZeP9kUeFguyGFERYtz+cwMA0d4iAsOi1YW9qLdaay2HKD3xNI0IHssMLcpUK7cfa3XlS
 5UG2N0NV93oCxw6VDzLHWvP+ksSXJGfbeCde2KfQYqlIfaYl9jSe4Ma5yvchoAn1lVxGpltB45J
 V9Gx++6Loh/uHF6BlfakBxzRsJI2iJl3FfmaLYWSRR/VoQB6eJEIX26ofg1znk9U3TDTYyxyPpv
 ON9T0EVd5gDeMTx4Fm3wQq2jh3/8RnPa2CfSX1OYSsgkywYyGc56UXkczvHQo19NffyB7/1nXGX
 Dp0acOBgYAPygU2Mb7YAJP4Kt5mDca+LlrjIH/c7I+0+5zhhT4OycdnHc32P3oRe9aMPjWQgli7
 39gaoW/GMEtvnl00WsiXk/d7dtSR2pG7xZakb4afUfiKleCnc2fFOIomd1r3UKwqasMeFeMqzQt
 cqnP1mAzHWHG/NiH7ieQTQ2EPB7+uLRUliRZFEQc7rv38LB8zRTwVXtwtDlm+HwlLgJvU=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

gup_must_unshare() and INTERNAL_GUP_FLAGS are used in gup.c only.
Move gup_must_unshare() and INTERNAL_GUP_FLAGS from internal.h to gup.c

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/gup.c      | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 mm/internal.h | 70 -----------------------------------------------------------
 2 files changed, 69 insertions(+), 70 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 7f9348c633d58..bfe83ce1411d5 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -633,6 +633,71 @@ static struct page *no_page_table(struct vm_area_struct *vma,
 	return NULL;
 }
 
+/*
+ * Indicates for which pages that are write-protected in the page table,
+ * whether GUP has to trigger unsharing via FAULT_FLAG_UNSHARE such that the
+ * GUP pin will remain consistent with the pages mapped into the page tables
+ * of the MM.
+ *
+ * Temporary unmapping of PageAnonExclusive() pages or clearing of
+ * PageAnonExclusive() has to protect against concurrent GUP:
+ * * Ordinary GUP: Using the PT lock
+ * * GUP-fast and fork(): mm->write_protect_seq
+ * * GUP-fast and KSM or temporary unmapping (swap, migration): see
+ *    folio_try_share_anon_rmap_*()
+ *
+ * Must be called with the (sub)page that's actually referenced via the
+ * page table entry, which might not necessarily be the head page for a
+ * PTE-mapped THP.
+ *
+ * If the vma is NULL, we're coming from the GUP-fast path and might have
+ * to fallback to the slow path just to lookup the vma.
+ */
+static inline bool gup_must_unshare(struct vm_area_struct *vma,
+				    unsigned int flags, struct page *page)
+{
+	/*
+	 * FOLL_WRITE is implicitly handled correctly as the page table entry
+	 * has to be writable -- and if it references (part of) an anonymous
+	 * folio, that part is required to be marked exclusive.
+	 */
+	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
+		return false;
+	/*
+	 * Note: PageAnon(page) is stable until the page is actually getting
+	 * freed.
+	 */
+	if (!PageAnon(page)) {
+		/*
+		 * We only care about R/O long-term pining: R/O short-term
+		 * pinning does not have the semantics to observe successive
+		 * changes through the process page tables.
+		 */
+		if (!(flags & FOLL_LONGTERM))
+			return false;
+
+		/* We really need the vma ... */
+		if (!vma)
+			return true;
+
+		/*
+		 * ... because we only care about writable private ("COW")
+		 * mappings where we have to break COW early.
+		 */
+		return vma_is_cow_mapping(vma);
+	}
+
+	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
+		smp_rmb();
+
+	/*
+	 * Note that KSM pages cannot be exclusive, and consequently,
+	 * cannot get pinned.
+	 */
+	return !PageAnonExclusive(page);
+}
+
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
 static inline bool can_follow_write_pud(pud_t pud, struct page *page,
@@ -2503,6 +2568,10 @@ static long __gup_longterm_locked(struct mm_struct *mm,
 	return rc ? rc : nr_pinned_pages;
 }
 
+#define INTERNAL_GUP_FLAGS (FOLL_TOUCH | FOLL_TRIED | FOLL_REMOTE | FOLL_PIN | \
+			    FOLL_FAST_ONLY | FOLL_UNLOCKABLE | \
+			    FOLL_MADV_POPULATE)
+
 /*
  * Check that the given flags are valid for the exported gup/pup interface, and
  * update them with the required flags that the caller must have set.
diff --git a/mm/internal.h b/mm/internal.h
index 9b8864a8540aa..7a315c0a93f49 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1330,76 +1330,6 @@ enum {
 	FOLL_MADV_POPULATE = 1 << 22,
 };
 
-#define INTERNAL_GUP_FLAGS (FOLL_TOUCH | FOLL_TRIED | FOLL_REMOTE | FOLL_PIN | \
-			    FOLL_FAST_ONLY | FOLL_UNLOCKABLE | \
-			    FOLL_MADV_POPULATE)
-
-/*
- * Indicates for which pages that are write-protected in the page table,
- * whether GUP has to trigger unsharing via FAULT_FLAG_UNSHARE such that the
- * GUP pin will remain consistent with the pages mapped into the page tables
- * of the MM.
- *
- * Temporary unmapping of PageAnonExclusive() pages or clearing of
- * PageAnonExclusive() has to protect against concurrent GUP:
- * * Ordinary GUP: Using the PT lock
- * * GUP-fast and fork(): mm->write_protect_seq
- * * GUP-fast and KSM or temporary unmapping (swap, migration): see
- *    folio_try_share_anon_rmap_*()
- *
- * Must be called with the (sub)page that's actually referenced via the
- * page table entry, which might not necessarily be the head page for a
- * PTE-mapped THP.
- *
- * If the vma is NULL, we're coming from the GUP-fast path and might have
- * to fallback to the slow path just to lookup the vma.
- */
-static inline bool gup_must_unshare(struct vm_area_struct *vma,
-				    unsigned int flags, struct page *page)
-{
-	/*
-	 * FOLL_WRITE is implicitly handled correctly as the page table entry
-	 * has to be writable -- and if it references (part of) an anonymous
-	 * folio, that part is required to be marked exclusive.
-	 */
-	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
-		return false;
-	/*
-	 * Note: PageAnon(page) is stable until the page is actually getting
-	 * freed.
-	 */
-	if (!PageAnon(page)) {
-		/*
-		 * We only care about R/O long-term pining: R/O short-term
-		 * pinning does not have the semantics to observe successive
-		 * changes through the process page tables.
-		 */
-		if (!(flags & FOLL_LONGTERM))
-			return false;
-
-		/* We really need the vma ... */
-		if (!vma)
-			return true;
-
-		/*
-		 * ... because we only care about writable private ("COW")
-		 * mappings where we have to break COW early.
-		 */
-		return vma_is_cow_mapping(vma);
-	}
-
-	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
-	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
-		smp_rmb();
-
-	/*
-	 * Note that KSM pages cannot be exclusive, and consequently,
-	 * cannot get pinned.
-	 */
-	return !PageAnonExclusive(page);
-}
-
-
 static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
 {
 	/*

-- 
2.43.0

