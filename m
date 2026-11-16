Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862905;
	b=aKxIZwzT5IpCs6mOt76WJfwb9U+St3IC+x4FBWC5yvjycLhw6PcQEoCYVJQvbEs7Oxhd
	 65RqnL6bhp0OLg6+wGHJiVXU9vcNf3MxPahbtu+SAzqVGKZCoy37/Yp1hkJx042tphbFT
	 aEzpMiDAMHMJL0RelIgVrYtPKjZSMX8IIx0h3g0iKCPa7xmBr6Yps6TJNWYCLZPVBozqS
	 waC/KqMXpid6ZBHX/qU8Ygouq/aAKHvUN31ZzSrUCtBlnH7qzZCG4eZdbI2jIi9mO7g+c
	 NMjnqjOYsepG38c7kVWZDIukPnT3CcPLUxlrNO9wA9rby15vcWNpljt90jQI4ipPFBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862905;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2AUyPLHoJGA+N57VqGbbG58eC0VGEyt9DiA6L7vBhoI=;
	b=hiLH5jQ7YLoDTDoM0iaYW85VhereOTTGW56YSlgzkO0YvJPPk3WzDobIxXjxhS9kSS0U
	 3lnHbu5uWiPsI84AjgDaCEjov22EcSUQEUvvM0D2ZdtYKRx3YWlc+N1eismqbFc9DqIyC
	 6P+WjzdmC6q2LBb8RxueUQCMfYhbysg+XwWxzSCQm9EhHLsK8e/uMHLAWQu4mVquMqy/4
	 kyYcyvGpjDWY/dJ3vaskGb8QnHjhMku7C8aWhrsrf1G8FN7ipIRLqOdcOFoNTGx+P5i46
	 Lr8CXzgb6NWyivqjTV3jYphzCPBtDg/D6A9Er2E229Pec0twMmqrT5TVA09+zNlix5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=G0nOB+yz;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B25606A884
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B25606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=G0nOB+yz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=2AUyPLHoJGA+N57VqGbbG58eC0VGEyt9DiA6L7vBhoI=; b=G0nOB+
	yzoiynRlRZGccPLBbvd0KJyvXs7KutAcOce9vx/b6CRQHn5N0JxXwvbz7vOT1N6AtkwGz5bC6caB7
	xtc0Po3BGnwjZt1g9HGf/yKm/H0GiOlB7GiGH+L3OcdMH4gRjEZflleiRRVb+/wJOxCGBsMA5gHUk
	97OdlfdD7TG415WzHhjUf979x7Sudnijc3cmbDD4eBKKeNXopuIY/d0hJ8vDkcwGVdTDgu83ka39H
	Ab4qQQdAkN5v//MCBYpqfLaNrKtZch9nQTQ6EmWQSRvsRrJ0JDwn8HtJ+EjAj5EcC7W1cgR6wsn3m
	+83cOEuul5zCvFQ98wZ0Pyvf4mYQ==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xT3pS-00000007LIv-2CpY;
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
Subject: [PATCH v5 5/8] mm/gup: break out gup_lookup_pte() helper
Date: Mon, 16 Nov 2026 16:01:24 -0500
Message-ID: <20261116210127.3837898-6-riel@surriel.com>
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

follow_page_pte() is 92 lines and does two separate things: work out
which page a PTE maps, if any, and commit to the page it found. The
first half reaches the second through five exit paths, two of which
unwind the PTE lock in different ways.

Split the resolve half into gup_lookup_pte(), which returns the page it
resolved, NULL when the PTE cannot be followed, or the errno the caller
must report. follow_page_pte() is left with one unlock and one exit.

no_page_table() can look up the page cache, so the case that needs it is
recorded and the call made after dropping the PTE lock, as before.

A none PTE still returns before any write check runs, so a FOLL_WRITE
failure can never reach the recorded call: the caller consults
no_page_table() for exactly the same PTEs the old code did.

No functional changes intended.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 mm/gup.c | 100 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 56 insertions(+), 44 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index efb2ad64be80..3aed0bc1c2b4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -965,74 +965,86 @@ static long gup_grab_fill_folio_pages(struct folio *folio,
 	return 0;
 }
 
-static long follow_page_pte(struct vm_area_struct *vma,
-		unsigned long address, pmd_t *pmd, unsigned int flags,
-		struct page **pages)
+/*
+ * Resolve one present PTE to the page it maps. Returns no page and no error
+ * when the PTE cannot be followed but the caller may fault it in, and a
+ * negative errno when the caller must report the failure.
+ */
+static long gup_lookup_pte(struct vm_area_struct *vma, unsigned long address,
+		pte_t *ptep, pte_t pte, unsigned int flags, struct page **pagep)
 {
-	struct mm_struct *mm = vma->vm_mm;
-	struct folio *folio;
 	struct page *page;
-	spinlock_t *ptl;
-	pte_t *ptep, pte;
-	long ret;
 
-	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
-	if (!ptep)
-		return no_page_table(vma, flags, address);
-	pte = ptep_get(ptep);
+	*pagep = NULL;
+
 	if (!pte_present(pte))
-		goto no_page;
+		return 0;
 	if (pte_protnone(pte) && !gup_can_follow_protnone(vma, flags))
-		goto no_page;
+		return 0;
 
 	page = vm_normal_page(vma, address, pte);
 
 	/*
 	 * We only care about anon pages in can_follow_write_pte().
 	 */
-	if ((flags & FOLL_WRITE) &&
-	    !can_follow_write_pte(pte, page, vma, flags)) {
-		ret = 0;
-		goto out;
-	}
+	if ((flags & FOLL_WRITE) && !can_follow_write_pte(pte, page, vma, flags))
+		return 0;
 
 	if (unlikely(!page)) {
 		if (flags & FOLL_DUMP) {
 			/* Avoid special (like zero) pages in core dumps */
-			ret = -EFAULT;
-			goto out;
-		}
-
-		if (is_zero_pfn(pte_pfn(pte))) {
-			page = pte_page(pte);
-		} else {
-			ret = follow_pfn_pte(vma, address, ptep, flags);
-			goto out;
+			return -EFAULT;
 		}
+		if (!is_zero_pfn(pte_pfn(pte)))
+			return follow_pfn_pte(vma, address, ptep, flags);
+		page = pte_page(pte);
 	}
-	folio = page_folio(page);
 
-	if (!pte_write(pte) && gup_must_unshare(vma, flags, folio, page)) {
-		ret = -EMLINK;
-		goto out;
-	}
+	if (!pte_write(pte) &&
+	    gup_must_unshare(vma, flags, page_folio(page), page))
+		return -EMLINK;
 
 	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
 			     !PageAnonExclusive(page), page);
 
-	ret = gup_grab_fill_folio_pages(folio, page, 1,
-			pte_dirty(pte), flags, pages);
-	if (ret)
-		goto out;
-	ret = 1;
-out:
+	*pagep = page;
+	return 0;
+}
+
+static long follow_page_pte(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmd, unsigned int flags,
+		struct page **pages)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	bool need_no_page_table = false;
+	struct page *page;
+	spinlock_t *ptl;
+	pte_t *ptep, pte;
+	long ret;
+
+	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
+	if (!ptep)
+		return no_page_table(vma, flags, address);
+	pte = ptep_get(ptep);
+
+	ret = gup_lookup_pte(vma, address, ptep, pte, flags, &page);
+	if (!ret && page) {
+		ret = gup_grab_fill_folio_pages(page_folio(page), page,
+						     1, pte_dirty(pte), flags, pages);
+		if (!ret)
+			ret = 1;
+	} else if (!ret && pte_none(pte)) {
+		/*
+		 * no_page_table() may look up the page cache, so it cannot run
+		 * under the PTE lock. A none PTE returns from gup_lookup_pte()
+		 * before any write check runs, so this is the same call the old
+		 * code made -- not a new failure mode for FOLL_WRITE.
+		 */
+		need_no_page_table = true;
+	}
+
 	pte_unmap_unlock(ptep, ptl);
 	return ret;
-no_page:
-	pte_unmap_unlock(ptep, ptl);
-	if (!pte_none(pte))
-		return 0;
-	return no_page_table(vma, flags, address);
 }
 
 static long follow_pmd_mask(struct vm_area_struct *vma,
-- 
2.56.0

