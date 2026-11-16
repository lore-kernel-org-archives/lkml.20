Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862903;
	b=kEe8irM3+kqhFKmbPhFKNxLI/nZM5dd3pWsFrcGid4iwKdgl13EqxHi3eOVR9KNVQR0X
	 Q/QKEJLeH3I6t72PfMTdxWw8sdlqaH46t1fXxOEkGuU0/3XwGGIMeXzMgTIEZBEZQ1/3+
	 A8aabOwfP9xz4zwPAnzHDoAjYF791Hiq150jH2J9bk+3ZhJ78gQr3zHfc1OuHKHRNdJeN
	 KSFqS8/fK5udbCGGtTWpBD46yFli8HnQ0A6mFo1UbeyUmAs7VqHlX+uER56pXgLwD5kP0
	 NhUgr8/9xa8/x88rJxDVngXWSfX9zpP6VOov6YklXi+eMzSzLk3+tdqmpAu5PAJhsvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862903;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y+Ow589OsLW9rn6bN/c8iI6gGetFJ89YNOlJdWeWBDI=;
	b=KOn3ItP9+zC+GEYguh5lqNr5fFq27QU1yox6M7TzwD1AW0JrUDNC2lt255icPtG5fvTb
	 L6osoXQ1ca0JElL3eh/mFeDZeJFtLjA5gowDm+NpGETHv8nuJF+A2eq1pjOV6liBCiLXr
	 I1XHiDqiWxWUJoS/+6lFnXXN0HzHyZhPQrzD7aA9OAi1wu7zT/nGm6sW4MIr5I79hnov8
	 oVBFM1BSrzbt2i2dj9Nv+ob6rb8iGnpO70xmaQj1X4FfA512eSlZVZjeWcY4hou62DZJ3
	 uI1pcrkri8tQEjy85KvH4vJVBwiriHMg+T3k+q8M6PFg+YAl3+LGO/zPxYIksZBAm3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=hmoX5406;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A4606A88E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2A4606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=hmoX5406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=y+Ow589OsLW9rn6bN/c8iI6gGetFJ89YNOlJdWeWBDI=; b=hmoX54
	06WjYFnkJJrVKqeWkKunQbfnUnocTW13GlSshENgUZOUv9enTOhor8CvrT+84upGVTtWdMpglimiH
	uqdS0288S5unSMpXw/4xsSXJ05uJVNy8nAcYmCISLfYEh4GL2Jq4NUHybT4jq0jMDehTKHlThIwDa
	rjhhL+Gjo77b3GaiPE4xbIqEmUsO7s6b4g2kirhyGTIhf537LEKEuPihWNHYZh+7iXXKilOGWAChV
	4K4jEq2XfrznHaiXfqUOC8WCAM/h5Vpl134CPWmi0rjYNgNtBcYWVmeGixCOjnFQBtWAwzSQSesSS
	lpKS3VKLv7xWGPUN9CJ58/6GGZ5Q==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xT3pS-00000007LIv-279h;
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
Subject: [PATCH v5 4/8] mm/gup: split out folio grab-and-store helper
Date: Mon, 16 Nov 2026 16:01:23 -0500
Message-ID: <20261116210127.3837898-5-riel@surriel.com>
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

follow_page_pte() does two things once it has resolved a present PTE
to a page: run the per-PTE safety checks (write-fault, unshare), then
grab a folio reference and hand the page back: fault it in if pinning,
mark it dirty/accessed, and store the caller's array slot.

Split the second part into gup_grab_fill_folio_pages(), which stores the
pages with gup_fill_pages(). The cache flushes stay with the caller in
__get_user_pages(), which runs gup_flush_pages() without any page
table lock held. Storing one slot under the lock is cheap; flushing is
not, and needs no lock once the folio reference is held.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 76 +++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 47 insertions(+), 29 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index c59d436be7ad..efb2ad64be80 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -921,6 +921,50 @@ static inline bool can_follow_write_pte(pte_t pte, struct page *page,
 	return !userfaultfd_pte_wp(vma, pte);
 }
 
+/*
+ * Grab a folio reference for @nr pages starting at @page, mark the folio
+ * accessed (and dirty for FOLL_WRITE), and store the pages for the caller.
+ * The caller (__get_user_pages()) flushes the caches with gup_flush_pages().
+ */
+static long gup_grab_fill_folio_pages(struct folio *folio,
+		struct page *page, unsigned long nr, bool dirty,
+		unsigned int flags, struct page **pages)
+{
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
+	gup_fill_pages(pages, page, nr);
+
+	return 0;
+}
+
 static long follow_page_pte(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmd, unsigned int flags,
 		struct page **pages)
@@ -976,36 +1020,10 @@ static long follow_page_pte(struct vm_area_struct *vma,
 	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
 			     !PageAnonExclusive(page), page);
 
-	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
-	ret = try_grab_folio(folio, 1, flags);
-	if (unlikely(ret))
+	ret = gup_grab_fill_folio_pages(folio, page, 1,
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
-	gup_fill_pages(pages, page, 1);
 	ret = 1;
 out:
 	pte_unmap_unlock(ptep, ptl);
-- 
2.56.0

