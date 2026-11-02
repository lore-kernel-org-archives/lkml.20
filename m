Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647843;
	b=ArQsTg8/k+k2ZCuhBKklCe0qEqzbeWEl1oeWvH6oIIuYqpu9iAVrH9unqjNHsKRbhuSz
	 hleBkq/z+AceztbtzMbUvQ+LEG9BYr/GtMYGBZIltQ5fNPd/y0UGp/9mu5LjoB51c+ZhC
	 0oZrastG+OLq2kiJXewhgNae0A/iHplQq3UZZf3KeqrGh788lIHZuuoS9RlSjr7O+bEMk
	 mqiqr6Q6DG3Chjs9/JFDUaDK/2aLI0X/EmxK/TtQ3GS/OJ22YLT22M0c8gDvLd4JO5T18
	 D3rrriEc5PLurgw4ajKedyJEDg8aa8lV6l0ZRpLrTiiv7TKQh5o+9eVMBphmumZTH8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647843;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=raRdFfKQG3ctF9Rx/PRY8SMQGHRdhOgJO6NWXsk2doQ=;
	b=4DmTO9JzKdjeIctBZHR5J7tFk58Sp9EsCq0nesfA/+XvUe+89OHLF6zjrhaf8JH6yxeP
	 dke/mCV2WnI5im/AtB/N38NI03CjKzqA6RTx46DgfRDxX8hABx9QwEhuuZwhrTu6PAv78
	 jp/cRVfs/DEZpJlqhRSFGzCdyeognHj/3xMat14nFhMu78FfZCvLhQX9ynDo4jglMPVG1
	 spwQgwxxqYMERgr5nuNQ/HWbgx5RogYIZqfhtTOxykXv7JbRHzmtGT/yKfWeKvPXzZ/K+
	 8hh+pR1UqfCTeGgZQyiWacEtlyuD57tjHXdslruH7p3yBVR22Hioyb5h/bTMfhy+6MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=MKnnxfMi;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6132606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6132606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=MKnnxfMi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=raRdFfKQG3ctF9Rx/PRY8SMQGHRdhOgJO6NWXsk2doQ=; b=MKnnxf
	MibGczrzkmbcauZqJ6WSN2EtKBURVekAiOKKVnCxjQUcjc2UszWqQcgXztGvyiK+TdJ7gyTd+fbRX
	ygT+a64vCOF3oG3IGXNzXQJTTm6uF7ACusqHYdaCdIr7oQmkGzlCiQGjjEzsYVHmxemMDoqdPQwhQ
	mlpTwBKtZBIau721Z4G4sISRKr8Z/O8tjv39S7sBQS9t3wo4KHUF+d3yJaUrwGPbY/RQcaQ8AZY7e
	FhvZruzPODFN0wHznsEHp/3RtKpdCa2kQRF+khjt/mo8b7xUx8fKys19LisUqMCy2Va8eEwCTfQyS
	wRxgMy7smnxjDf6CIn/Bm1s8nPGQ==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xNxjk-00000001W8x-0RGy;
	Mon, 02 Nov 2026 19:30:32 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	linux-mm@kvack.org,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH 3/8] mm/gup: split out folio grab-and-store helper
Date: Mon,  2 Nov 2026 14:30:21 -0500
Message-ID: <20261102193026.3860700-4-riel@surriel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102193026.3860700-1-riel@surriel.com>
References: <20261102193026.3860700-1-riel@surriel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

follow_page_pte() does two things once it has resolved a present PTE
to a page: run the per-PTE safety checks (write-fault, unshare), then
grab a folio reference and hand the page back: fault it in if pinning,
mark it dirty/accessed, and fill the caller's array slot.

Split the second part into gup_grab_folio_pages(), which
takes its inputs as parameters, so the checks and the grab-and-store
can be applied at different granularities. The name states what the
helper does, not 'commit', and it takes the PTE's dirtiness as a bool.

The helper stores the pages but leaves the cache flushes to the
caller: split them into gup_flush_pages(), which follow_page_pte()
runs after dropping the PTE lock. Storing one slot under the lock is
cheap; flushing is not, and needs no lock once the folio reference
is held.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 101 +++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 29 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f7d940e7e5ffb..27ae2a1d7c36d 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -650,6 +650,25 @@ static void gup_fill_pages(struct vm_area_struct *vma, unsigned long address,
 	}
 }
 
+/*
+ * Flush the caches for @nr pages stored in @pages. The caller already
+ * holds folio references, so the pages cannot go away; this runs
+ * without any page table lock held.
+ */
+static void gup_flush_pages(struct vm_area_struct *vma, unsigned long address,
+		struct page **pages, unsigned long nr)
+{
+	unsigned long i;
+
+	if (!pages)
+		return;
+
+	for (i = 0; i < nr; i++) {
+		flush_anon_page(vma, pages[i], address + i * PAGE_SIZE);
+		flush_dcache_page(pages[i]);
+	}
+}
+
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
 static inline bool can_follow_write_pud(pud_t pud, struct page *page,
@@ -822,6 +841,54 @@ static inline bool can_follow_write_pte(pte_t pte, struct page *page,
 	return !userfaultfd_pte_wp(vma, pte);
 }
 
+/*
+ * Grab a folio reference for @nr pages starting at @page, mark the folio
+ * accessed (and dirty for FOLL_WRITE), and store the pages for the caller.
+ * The caller flushes the caches after dropping the page table lock.
+ */
+static long gup_grab_folio_pages(struct folio *folio,
+		struct page *page, unsigned long nr, bool dirty,
+		unsigned int flags, struct page **pages)
+{
+	unsigned long i;
+	long ret;
+
+	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
+	ret = try_grab_folio(folio, nr, flags);
+	if (unlikely(ret))
+		return ret;
+
+	/*
+	 * We need to make the page accessible if and only if we are going
+	 * to access its content (the FOLL_PIN case).  Please see
+	 * Documentation/core-api/pin_user_pages.rst for details.
+	 */
+	if (flags & FOLL_PIN) {
+		ret = arch_make_folio_accessible(folio);
+		if (ret) {
+			gup_put_folio(folio, nr, flags);
+			return ret;
+		}
+	}
+	if (flags & FOLL_TOUCH) {
+		if ((flags & FOLL_WRITE) && !dirty && !folio_test_dirty(folio))
+			folio_mark_dirty(folio);
+		/*
+		 * pte_mkyoung() would be more correct here, but atomic care
+		 * is needed to avoid losing the dirty bit: it is easier to use
+		 * folio_mark_accessed().
+		 */
+		folio_mark_accessed(folio);
+	}
+
+	if (pages) {
+		for (i = 0; i < nr; i++)
+			pages[i] = page + i;
+	}
+
+	return 0;
+}
+
 static long follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmd, unsigned int flags,
 		struct page **pages)
@@ -877,39 +944,15 @@ static long follow_page_pte(struct vm_area_struct *vma,
 	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
 			     !PageAnonExclusive(page), page);
 
-	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
-	ret = try_grab_folio(folio, 1, flags);
-	if (unlikely(ret))
+	ret = gup_grab_folio_pages(folio, page, 1,
+			pte_dirty(pte), flags, pages);
+	if (ret)
 		goto out;
-
-	/*
-	 * We need to make the page accessible if and only if we are going
-	 * to access its content (the FOLL_PIN case).  Please see
-	 * Documentation/core-api/pin_user_pages.rst for details.
-	 */
-	if (flags & FOLL_PIN) {
-		ret = arch_make_folio_accessible(folio);
-		if (ret) {
-			gup_put_folio(folio, 1, flags);
-			goto out;
-		}
-	}
-	if (flags & FOLL_TOUCH) {
-		if ((flags & FOLL_WRITE) &&
-		    !pte_dirty(pte) && !folio_test_dirty(folio))
-			folio_mark_dirty(folio);
-		/*
-		 * pte_mkyoung() would be more correct here, but atomic care
-		 * is needed to avoid losing the dirty bit: it is easier to use
-		 * folio_mark_accessed().
-		 */
-		folio_mark_accessed(folio);
-	}
-
-	gup_fill_pages(vma, address, page, 1, pages);
 	ret = 1;
 out:
 	pte_unmap_unlock(ptep, ptl);
+	if (ret > 0)
+		gup_flush_pages(vma, address, pages, ret);
 	return ret;
 no_page:
 	pte_unmap_unlock(ptep, ptl);
-- 
2.53.0-Meta

