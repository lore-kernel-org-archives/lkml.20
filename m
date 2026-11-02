Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590002;
	b=wrW7KSocYl+VxdBgFAbEaVixsBtvUHrTw4Ww6kNoqfQBaEuH2tnfRyORR/7pahFc1pLu
	 bhcCnce0SuO+Frx9YBJ5oFq8HYMPRE/EHwIIkhSbeyH67t1JUmkNSETVrZMdhfg17RTix
	 dgI1eEjDnmyAm/3lAF86zbAEPq65OS21jbMUM6SNAE0toq2IZDqueXUoLZsx0FPVDqZpt
	 LIsxtpiUkXKzPUuIvevw6+y5oleGrbKUiyXiNydbZHj1YmuLCcPIJ9kKiBCbPWTs32kcB
	 DKf4CdQ3HXgnyEunYO5za4DkhpmVIrRaVXUG19AAyjRp+cB+l5HgRUkirZeaDPo6tIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yfJbCHPkvsGDzoNKnYVR1vPpM/uRL1Mk1pmv5Z8laks=;
	b=YFuJcriwURvDmaaSsIp6MgwTkpblhTaeqET6wfuqonE7oncv7H8VCZCaeeXmORhf8i4o
	 qJWy4/XSKzrh9PvzJd6bswbnkVGtC414SbC0gwdVKTdQ0PvpZWQrbpRX2noNnEGrk5jJF
	 JNQpbNtNNt36N5mrANfn/vaCa2y0H+RrwIAdLWChhGa/fr7KJ0zxKTtvsTSe2ucOMYuDc
	 qQqrhfmAtb8/fYt+TOb2MbpBVss85PUcI2+AkKzY02+lW9U9FQUYWHluV+efq28Uzn/00
	 ikXEqs7lXn+6nQun4QSpKbQJyWRepOxTZJF+dongOEWh8TiIzYkosoc1TlYTQgAEahg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SYweBN86;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048CE606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 048CE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SYweBN86
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so54230a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793590001; x=1794194801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfJbCHPkvsGDzoNKnYVR1vPpM/uRL1Mk1pmv5Z8laks=;
        b=SYweBN86zfD/XneEOafrq9qS5ygSGzrCPHIwP++Ax/cV0IIYukkSgm9K1BcrDHBqrd
         HANIpSO4jh5jki2SBWAmkQXuLLRfNQ0sqJcTVgqoP4VasH01CtMn563b3hh1RJCT1kOw
         Vb01UHMo4ZhjjHmOq45hg/vQQBllzlh9+CqqcDkSsZdPjIfzohA7Q8RhvKCcOYJS8Af8
         KrU5Yg0yGYYejX2M36/1KeA1pY0583Z6hbgXNHz5jAvr/uiDQm6WUdM2XZ0m5Ll3gXG8
         iC2QGqJCqGHx/xMqwLy0p+zfKS9wlmswN/3VytVgsNtTIuntpfDeazhtM39+P61WkhdQ
         T0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590001; x=1794194801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfJbCHPkvsGDzoNKnYVR1vPpM/uRL1Mk1pmv5Z8laks=;
        b=ubUoO8LVy1Xt3XzSLBQgCHhCElZuoZmly0LQLiAtuifD1C+SZsA0wQxk7bC8456sF1
         Q9DwBtVyU2f2VSUxeBmlJfqadaG1M+dwgbF27wvmFJeTKlbVTLKGGMUdRElX93Di78mw
         VTXa0iyzJJ+R8D43legbcn6JQQFH0UYugoNvF+4HnP0gVu/rEg2cX/bjhCRTIpSHra4z
         ZeHiHk1xfHmrNhcTgxn7MNwQLWfQjBtKMyCDgfEq56CkqBF3GHl0CJ1rFTsMejp8B+Jo
         4J1nqBPZc0bZ6WRp6Tf9AkbRGAAFdeTweTjRah+1Q1phFa47hvgltXST+y141iJJmvyW
         9r4w==
X-Forwarded-Encrypted: i=1; AKwUvByhdq8JjkEu2Raogv4VCkQEd3LZ+hJdAhu1zFudrrYi4laDFsIMR0kO+DZljv2vVCvkU2Fy/Jt65SrsgYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LvOvyWP34r37HmtEKji78nrIf0qkrMpz7xkrVvA3u+XYm7AiG
	QGqE3X3y3dq0HgPtlG+IRx4JrX2Wg2ESX8sUytmFX48RnhsYNFRHFcEvaQ8lIJZEqhDJXFnIc52
	mKH9v
X-Gm-Gg: AYBFou2Jtw83E47KUNuIIUcGCjKIvcZB+fTybXBXBIc6m/zcWfZCJPFniySfRMSvIVu
	XR4crmM61Ewek/BSnEiPk+3nhMYgz94Bm8hfdduisgLmCsIfQTpIqS/YvWiL75TqbF1ilk9dHU6
	ZMTObfJEVJu74f33g6qMkRyhCCEDYo60dPJdrFZvyMaCvZ+T8xrLCdGgkJlwq/1jhc1KkB+JNOg
	bc4A9p9BWP44Za71DrgyWaoHlpsFGZnxvsmPxUQO6srsLhTBV4QaNU8S2iSPvwDdPjtyMJ917/M
	T7t5kmlP5ULTDvW2MLpCk5G9OKa3Uj0WhoJxXMu8v+7u0ZDsZ37Dnj2lqfp5chyO4oXYyuOGrst
	fbbfPvhxV23ZH/tSshIH+ZvllvC+Jo2d4wZPbOoogXEFcgRsOdygHjYEXfGBQvef2z+wsAAru9a
	iLWMj3xfi3KPhGqbpIb8X70NyCqnIJzYfAO1DYsBfdTVnX4Do3hJi8sBRDJWaT3BnkE4lgASAJk
	ThQz1pfraIQtjdomiBJIk52m9B4A2zhv4edDGeysdeUCkuMeFmtfqHLizy2yfsAlckGKRz/1iLp
	NQtF01InIwbnZDC3PqJb+2i/FLt/K5W0Z5M62pEcvdPp8C29MWc=
X-Received: by 2002:a17:90b:264c:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ae8970fd76mr6501604a91.20.1793590000904;
        Sun, 01 Nov 2026 19:26:40 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm12303317a91.10.2026.11.01.19.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:26:40 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 05/12] mm: hugetlb_vmemmap: unify writable vmemmap page preparation
Date: Mon,  2 Nov 2026 11:25:18 +0800
Message-ID: <20261102032525.3597743-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102032525.3597743-1-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
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

Installing a writable vmemmap page requires consuming a replacement page,
copying the current contents into it and making the copy visible before
publishing the new mapping.  HVO currently splits this sequence between
the page-table walker and its caller depending on the remap path.

Centralize the sequence in the walker so all writable replacements follow
the same copy-and-publish protocol.  This keeps page preparation with the
mapping update and removes path-specific handling from higher-level HVO
code.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
- Replace page_to_virt() with page_address()
---
 mm/hugetlb_vmemmap.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4b20a8efc067..c9635679a36d 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -199,6 +199,20 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
+static struct page *vmemmap_dup_page_from_list(const struct page *src,
+					       struct list_head *vmemmap_pages)
+{
+	struct page *dst = list_first_entry(vmemmap_pages, struct page, lru);
+
+	list_del(&dst->lru);
+	copy_page(page_address(dst), page_address(src));
+
+	/* Ensure updates to @dst page are visible before set_pte_at(). */
+	smp_wmb();
+
+	return dst;
+}
+
 static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 			      struct vmemmap_remap_walk *walk)
 {
@@ -211,16 +225,7 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 
 		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
 
-		head = list_first_entry(walk->vmemmap_pages, struct page, lru);
-		list_del(&head->lru);
-
-		/*
-		 * Makes sure that preceding stores to the page contents from
-		 * vmemmap_remap_free() become visible before the set_pte_at()
-		 * write.
-		 */
-		smp_wmb();
-
+		head = vmemmap_dup_page_from_list(page, walk->vmemmap_pages);
 		entry = mk_pte(head, PAGE_KERNEL);
 	} else {
 		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
@@ -253,15 +258,7 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 
 	VM_WARN_ON_ONCE(PageHead((const struct page *)addr));
 
-	dst = list_first_entry(walk->vmemmap_pages, struct page, lru);
-	list_del(&dst->lru);
-	copy_page(page_to_virt(dst), page_to_virt(src));
-
-	/*
-	 * Makes sure that preceding stores to the page contents become visible
-	 * before the set_pte_at() write.
-	 */
-	smp_wmb();
+	dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
 	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
 }
 
@@ -499,7 +496,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    unsigned long flags)
 {
 	unsigned long vmemmap_start, vmemmap_end;
-	struct page *vmemmap_head, *vmemmap_tail;
+	struct page *vmemmap_tail;
 	int nid, ret = 0;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
@@ -531,9 +528,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 		goto out;
 	}
 
-	vmemmap_head = list_first_entry(vmemmap_pages, struct page, lru);
-	copy_page(page_to_virt(vmemmap_head), folio);
-
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
-- 
2.54.0

