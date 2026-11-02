Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647843;
	b=EQx1ogXCp/u4WJyqJLXnbZE69Tfs0NwMrS83RiDEJmNf6xD+ozqBluF0JQIIlB1cbmXY
	 9OZSI59lZg5kBfmuNSPM5sfMFFzKubSB2EnMwFfG/qh3AYGu11kWlnnKTRThrq6EDQPtt
	 ts3m06zLgtPX9RUtnG46+0N5FF8eX4qVn+RI4DxYsMrALEbXeMAf8X0R4ePIonAP7yEKT
	 2UoybZw0q6VsqbkEScoTdPEKjlDvG/SHVEciple6NV64ZRDtFyGyswCs42AJ+b42jmyMe
	 3bzIwDON6+ApusTJY3c8A3HtzbE0j+e9j5lNfWe69itWdHBFdI22Nn0e5NO9hrGTDEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647843;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K4zW81m8lz2rVHicSvgVGAJW0sedRnDfC1U5tufjT9M=;
	b=MBy1FzTasLC1ApG/9i2NLuVNrhpd7FmI6GvOsKbOWGXgtKuWpaXL3mKkvV7qDFmEgEIZ
	 2hGi5G1T3aDXCCI7pKmS6XY5g7C1EAPGDHbgVs0NMSf+0+tgADagIxtJStmmy3vHlSosW
	 KD3EFBvPRV8kIc5FfKDZIXKXUyGzs3EmGIBmE7qaILtZ3HEuUQYqCQp1BUeUVXMzByMlT
	 rhbCM6xBPh7LBXe4zvPE9MsoFrt/M0RXu9hGE3FK0Vcpg+GidWiR8oTvp2USh6vyoHtpH
	 SH3Ly+ro55VDUTw4lwZp4UIbvLCUf6unhJi1h06Tw2mJWxaVKJiYvzmUTI6R/P7TiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b="d4f04/pQ";
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4123606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4123606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=d4f04/pQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=K4zW81m8lz2rVHicSvgVGAJW0sedRnDfC1U5tufjT9M=; b=d4f04/
	pQEYXAThvRzHyhhzOr/tEv8hkX5De7iclJDHyvRjKQ5JzKKqpwZ/hRGdcvVF1FTqf9TKbjENa2oTG
	GXejnNKOMk51gZTLRJ4w2YwoetLEZO7ZmKmpmQONUV2/OMpTWqJKF2B4TN+5s8oIDz1zcGONOGUKs
	TRO8j4fs9HVR6Du5dh5Emau7A4XvPEUhSJmumYB0tfWjn8iX5MJb/5YgO8AluFNq12ZQOHn4nBLif
	cxrLL59ji2iqB9eoVRtyN3T0wlgGP41++xpYA33sI/yHTYbswqISpw8V+Y/isGKb/A9cKA8D2qmaR
	Z4aZqMO70SS2ev01VT1bqgR+7YKA==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xNxjk-00000001W8x-0zAX;
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
Subject: [PATCH 7/8] mm/gup: walk multiple PTEs per follow_page_pte() call
Date: Mon,  2 Nov 2026 14:30:25 -0500
Message-ID: <20261102193026.3860700-8-riel@surriel.com>
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

follow_page_pte() looks at one PTE per call, so __get_user_pages() calls
it once per page, restarting the pgd/p4d/pud/pmd descent and retaking the
PTE lock each time.

Walk every PTE from @address to the page-table/VMA/@end boundary in one
call instead. Adjacent pages from different folios, or plain base pages
with no folio relationship at all, are covered by the same call under one
lock.

A failure on the first PTE is returned as before. A failure after that
ends the walk, and __get_user_pages() retrying the read gets the error.

The pages[] slots are stored under the lock, but the cache flushes run
after it is dropped, over the pages the walk stored: holding one page
table can cover up to PTRS_PER_PTE pages, and the flush helpers need no
lock once the folio references are held.

Measured with mm/gup_test.c, median get time over 16 iterations on a
256 MB MADV_HUGEPAGE region in a 4 CPU VM. Folio size was confirmed
through the per-size anon_fault_alloc counters, 4100 folios for 64 kB
and 128 for 2 MB:

  gup_test -L -m 256 -n 65536 -r 16 -t
                        before      after
  4 kB base pages      2753 us     1178 us   (2.3x)
  64 kB mTHP           2946 us     1361 us   (2.2x)
  2 MB THP (control)     72 us       70 us

Base pages and mTHP gain about the same amount, because what is saved is
the page-table descent that no longer restarts per page, not anything
folio-specific. 2 MB THP does not reach follow_page_pte(), so it stays
flat.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 77 ++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 27 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 9e7eb8a323bbf..67e20b326be6e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -937,44 +937,67 @@ static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
 	return 0;
 }
 
+/*
+ * Walk the PTEs from the start address to the end of this page table or VMA,
+ * whichever comes first, and commit every page found.
+ *
+ * A failure on the first PTE is returned to the caller. A failure after that
+ * is a short read; __get_user_pages() retrying the read will get the error.
+ *
+ * Return: the number of pages stored in @pages, 0 when no mapping exists at
+ * the start address, or a negative errno for a failure on the first PTE.
+ */
 static long follow_page_pte(struct vm_area_struct *vma,
-		unsigned long address, pmd_t *pmd, unsigned int flags,
-		struct page **pages)
+		unsigned long address, unsigned long end, pmd_t *pmd,
+		unsigned int flags, struct page **pages)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	bool need_no_page_table = false;
-	struct page *page;
+	pte_t *ptep, *orig_ptep;
+	unsigned long walk_end, base;
+	unsigned long nr = 0;
 	spinlock_t *ptl;
-	pte_t *ptep, pte;
-	long ret;
+	long ret = 0;
 
-	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
+	orig_ptep = ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
 	if (!ptep)
 		return no_page_table(vma, flags, address);
-	pte = ptep_get(ptep);
 
-	ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
-	if (!ret && page) {
+	base = address;
+	walk_end = min(pmd_addr_end(address, end), vma->vm_end);
+
+	for (; address < walk_end; address += PAGE_SIZE, ptep++) {
+		pte_t pte = ptep_get(ptep);
+		struct page *page;
+
+		ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
+		if (ret || !page) {
+			/*
+			 * no_page_table() may look up the page cache, so it
+			 * cannot run under the PTE lock. A none PTE returns
+			 * from gup_lookup_pte() before any write check runs,
+			 * so this is the same call the old code made -- not a
+			 * new failure mode for FOLL_WRITE.
+			 */
+			if (!ret && pte_none(pte))
+				need_no_page_table = true;
+			break;
+		}
 		ret = gup_grab_folio_pages(page_folio(page), page,
-						     1, pte_dirty(pte), flags, pages);
-		if (!ret)
-			ret = 1;
-	} else if (!ret && pte_none(pte)) {
-		/*
-		 * no_page_table() may look up the page cache, so it cannot run
-		 * under the PTE lock. A none PTE returns from gup_lookup_pte()
-		 * before any write check runs, so this is the same call the old
-		 * code made -- not a new failure mode for FOLL_WRITE.
-		 */
-		need_no_page_table = true;
+						     1, pte_dirty(pte), flags,
+						     pages ? pages + nr : NULL);
+		if (ret)
+			break;
+		nr++;
 	}
+	pte_unmap_unlock(orig_ptep, ptl);
 
-	pte_unmap_unlock(ptep, ptl);
-
+	if (nr) {
+		gup_flush_pages(vma, base, pages, nr);
+		return nr;
+	}
 	if (need_no_page_table)
 		return no_page_table(vma, flags, address);
-	if (ret > 0)
-		gup_flush_pages(vma, address, pages, ret);
 	return ret;
 }
 
@@ -994,7 +1017,7 @@ static long follow_pmd_mask(struct vm_area_struct *vma,
 	if (!pmd_present(pmdval))
 		return no_page_table(vma, flags, address);
 	if (likely(!pmd_leaf(pmdval)))
-		return follow_page_pte(vma, address, pmd, flags, pages);
+		return follow_page_pte(vma, address, end, pmd, flags, pages);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
 		return no_page_table(vma, flags, address);
@@ -1007,14 +1030,14 @@ static long follow_pmd_mask(struct vm_area_struct *vma,
 	}
 	if (unlikely(!pmd_leaf(pmdval))) {
 		spin_unlock(ptl);
-		return follow_page_pte(vma, address, pmd, flags, pages);
+		return follow_page_pte(vma, address, end, pmd, flags, pages);
 	}
 	if (pmd_trans_huge(pmdval) && (flags & FOLL_SPLIT_PMD)) {
 		spin_unlock(ptl);
 		split_huge_pmd(vma, pmd, address);
 		/* If pmd was left empty, stuff a page table in there quickly */
 		return pte_alloc(mm, pmd) ? -ENOMEM :
-			follow_page_pte(vma, address, pmd, flags, pages);
+			follow_page_pte(vma, address, end, pmd, flags, pages);
 	}
 	ret = follow_huge_pmd(vma, address, end, pmd, flags, pages);
 	spin_unlock(ptl);
-- 
2.53.0-Meta

