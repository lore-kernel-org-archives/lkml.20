Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862903;
	b=KxU8IPrj2YOvfBnaAQeWtSMTqZzrg/0MAoUDZHfeKhbqD/aUmfLUJdpyQGHxO0YxUPgf
	 AgihJTnugwgor0IjSZsGJHyvpw2zwayhFTnr+ZhbQ5A7Rst8X1CmYNNw8IxLETWa1TCWN
	 vjFdBrxO8bhGj45aPHCgyFlRAmyR17RnUgeujRZW1QRHMPByehgDA6lBLZl5ss9McqIrM
	 KdrVxApKUGndsiqOxAOU6b4o0BJ7r8HQHq810jzdTwZBfcgV43C735wBCIvT2VQXXgovU
	 u93uHjGv2jJkCmQqpOyz1BVCGeYq8eATIi9RbDgsjK8TJyZidkH7UNlVvys+7P2JUdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862903;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QebCm/HdUJNQJhaYSYkTX5nopMX74EmzXUpwCg5l4wY=;
	b=H9PDLuZgVtmEp6169/wzsvjNXu8vSYRrHbxGRnlHLi2EVIoQ7+/NvkmikNbCSH2PvTst
	 r/nzi7QL8caso2aciPCEi3l5SburxG8P3FVDgDMWw9FF8tXPPlk1NTLlPv1vo2LVM9O7J
	 bR0umdcXmoUQ4t9WH9o4fmr/WIGF30+WHPwIggj8GHFiuHvaZcGhgl02kH4QPvs0NlAeZ
	 KjoIS/u9eldXWohxTf++XHcSsAhdQa/MMXDoGiQmlKjf289L0R+/kzBQihZfwtbx/rnOL
	 hsYmUQf2NT1pjlZnx26G+8s6Fv98W2g6BKMB5ymix81ieqwW46J93c/6FOiEfuWzJ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=mh5uexrq;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AFF606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AFF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=mh5uexrq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=QebCm/HdUJNQJhaYSYkTX5nopMX74EmzXUpwCg5l4wY=; b=mh5uex
	rq+tCr2ByY0nyAqrEE3CMGD5Xfr8JGsmdFw60TyRMGJVGe56e4DvRZcfQ8kj7KYvILj+lcYxQzT10
	++QFcu9W15gkQv7WBmHlBlPqrI+OgucPtbt5Wj740nF2/tKfJz33YIx5WOGIwf6A+/HE9xyht7RvQ
	qBbI2pUZKi9ljESxWbvC2zc1GmyYKfrOYUovIniaKBmUtXNjeIiZWqZJ3cu1O80et3RC63kdmV+oh
	zOn7OW6GGbXyQX6K4ZJemr5w0hEO+rdBpB0YBzljASzPqoIIlTCHSFlbgl1moQkppWQro7rjIog4J
	16YVO+7ymiJTq+AMiiSEnOCXO5qg==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xT3pS-00000007LIv-1mDT;
	Mon, 16 Nov 2026 21:01:30 +0000
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Xu <peterx@redhat.com>,
	Rik van Riel <riel@surriel.com>
Subject: [PATCH v5 1/8] mm/gup: break out gup_fill_pages() helper
Date: Mon, 16 Nov 2026 16:01:20 -0500
Message-ID: <20261116210127.3837898-2-riel@surriel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116210127.3837898-1-riel@surriel.com>
References: <20261116210127.3837898-1-riel@surriel.com>
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

__get_user_pages() fills pages[] in an open-coded loop, and the
GUP-fast PTE, PMD and PUD leaf paths each have their own copy of
the same loop.

Move the store into a gup_fill_pages() helper, shared by the slow
and the fast paths. The helper keeps a pages==NULL check, so the
fault-in users that pass no pages array (faultin_page_range(),
populate_vma_page_range()) need no conditionals at their call
sites. Cache flushing stays open-coded for now; it moves into its
own helper in the next patch.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index b0a0019de80a..e0698d2075b4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -710,6 +710,25 @@ static inline bool gup_must_unshare(struct vm_area_struct *vma,
 	return gup_pages_not_requiring_unshare(vma, flags, folio, page, 1) != 1;
 }
 
+/*
+ * Store @nr_pages consecutive pages starting at @page into @pages.
+ * The caller must hold at least one reference on the folio, so it
+ * cannot go away, or get split while the array is filled.
+ *
+ * Some GUP users only fault pages in and pass no pages array.
+ */
+static void gup_fill_pages(struct page **pages, struct page *page,
+		unsigned long nr_pages)
+{
+	unsigned long i;
+
+	if (!pages)
+		return;
+
+	for (i = 0; i < nr_pages; i++)
+		pages[i] = page + i;
+}
+
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
 static inline bool can_follow_write_pud(pud_t pud, struct page *page,
@@ -1579,9 +1598,9 @@ static long __get_user_pages(struct mm_struct *mm,
 				}
 			}
 
+			gup_fill_pages(pages + i, page, page_increm);
 			for (j = 0; j < page_increm; j++) {
 				subpage = page + j;
-				pages[i + j] = subpage;
 				flush_anon_page(vma, subpage, start + j * PAGE_SIZE);
 				flush_dcache_page(subpage);
 			}
@@ -2946,7 +2965,6 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 	do {
 		pte_t pte = ptep_get_lockless(ptep);
 		struct page *page;
-		unsigned long i;
 
 		nr_batch = 1;
 
@@ -3017,8 +3035,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 			nr_batch = 1;
 
 		folio_set_referenced(folio);
-		for (i = 0; i < nr_batch; i++)
-			pages[nr_pages + i] = page + i;
+		gup_fill_pages(pages + nr_pages, page, nr_batch);
 		nr_pages += nr_batch;
 		folio = NULL;
 	} while (ptep += nr_batch, addr += nr_batch * PAGE_SIZE, addr != end);
@@ -3054,7 +3071,7 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 {
 	struct page *mapped_page, *page;
 	struct folio *folio;
-	unsigned long nr_pages, i;
+	unsigned long nr_pages;
 
 	/* See gup_fast_pte_range() */
 	if (pmd_protnone(orig))
@@ -3089,8 +3106,7 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp,
 		return 0;
 	}
 
-	for (i = 0; i < nr_pages; i++)
-		*(pages++) = page++;
+	gup_fill_pages(pages, page, nr_pages);
 	folio_set_referenced(folio);
 	return nr_pages;
 }
@@ -3101,7 +3117,7 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 {
 	struct page *mapped_page, *page;
 	struct folio *folio;
-	unsigned long nr_pages, i;
+	unsigned long nr_pages;
 
 	if (!pud_access_permitted(orig, flags & FOLL_WRITE))
 		return 0;
@@ -3133,8 +3149,7 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, pud_t *pudp,
 		return 0;
 	}
 
-	for (i = 0; i < nr_pages; i++)
-		*(pages++) = page++;
+	gup_fill_pages(pages, page, nr_pages);
 	folio_set_referenced(folio);
 	return nr_pages;
 }
-- 
2.56.0

