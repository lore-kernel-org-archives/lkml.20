Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759762;
	b=erFflSs6hstrM3bXyoFj9jlAZB2ulyJFvmfVGrJUWtaQL3AuJaRvAHOMXuGOwD7BjDEs
	 Ht4sc+KFpuKe3J83zg+yGMCk/hGv+LZYa/SWmClYpr6mseCaXuRLspEK+JiGtYUyZgArA
	 ISj5po3sNIFu51DuNZfzJcoln/01XOLV4q05HtGZJj1Y4n8jQy62jmNW+LaAOT23+TTxN
	 Gq4w7y9i39LncgjqrN4KpcoaxO3DjnnjCuQl2SMKh1CDaLIOqePxLO48O0Adx/nume3B5
	 hj0pIlL/nwngiCFsR6EjqG7gZ7ch1fp7N0XjmjmUt3DMxdsX/F7dKAusAxElgphlSqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2TFuv5HPs97W4rn6iXQiGwNXy4Qy4yQskKS9otILqUg=;
	b=5pzDPlIbribX3SzINiow8sL9L8TbtNhSFbYXFBjMcHDCyQ9PCDTM2xDiXfthbCTTFyAs
	 g+e2RJR8wrOwfkd6XMV02hDoh9gNRnrzVtd9o15bEVugoCATU/IYdartpoQ7PwymVZfb9
	 j65ylSqcS8pE0W5MgcR/BhHjtNbgZZYQOCNSVeW3N8py2Un3+7EBUUl7nyKYpwMKXXQ2+
	 w2X1B3/B4i1t2LaaiXg4QgAuV2zoLXxCswkyvHU+SW1zmgmo9rlYtQLi1+Tq9tbh2U6Jy
	 62xOq6h2f8KAFcUqhxVTsUbJNMgTkUffmbgLGVdydw9X/4viDRGU70vRmQ4wT1686aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="ii/eU2gU";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8C9606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8C9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ii/eU2gU
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06c60065fso244982b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759761; x=1794364561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TFuv5HPs97W4rn6iXQiGwNXy4Qy4yQskKS9otILqUg=;
        b=ii/eU2gUDUogdhZXIDQUJnhKmwrIMtc+p/NofPejX3ewZIsCKVX7H4y3NeOcY23nsm
         PAaPB984KFsNTV3LIMq7BIC2bjgm30w3u4W/SDWprxbDAdSFesct/bm13lLpqtwRia58
         asIkVdxNw4NCZwnoFOEWVGIGk+Yk72FgLfUfcVbATTx1urbCiJiKG+yUUdrj4uMhXJHa
         JH1TkGSSPbJ/lnZtfZfmQxUYwmWz4ltne+r/L2vvzdsC9cBMJFT88G289RPDfvFtyb1y
         9a5U3RteuF02C49sH7MNzfDwCKYFBLjQkaFCSt1Xgefx0gfd5bxvjMRVlPb9sjW91635
         AUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759761; x=1794364561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TFuv5HPs97W4rn6iXQiGwNXy4Qy4yQskKS9otILqUg=;
        b=s9DjKT5hFpHiLa71Yl2R/cYs6qB8u48UihGluhyXMqnOUNN4wnZaVotQpT6p6Mlzf8
         WMoWefzIQVkQv7MkHxC9ym9Q3S0SAs+OA+1nVUdu5J4Gl7RXmAu8ly0nXh/Smu4mVBpw
         IEQaLv/+b7k4xnCObxGl2AQ+DGQpffjMg/bc4YxzWCOpv9hn0HGyqNzkzqHuipsQ4QlU
         2oPZKUgKp6kz/XPD5mEwYrR5aZNB4ZKvj22GS2QmipxBfmRfZBd3v3L5Fhc1Qjy6PFIb
         qPypKr2b5/FaLjsKt5OqW4e21t3yb+Wz/q4Nz2WNQWwrKkeWRAHa9WImI7ilspX8I+BA
         KxBA==
X-Forwarded-Encrypted: i=1; AKwUvBxRaeackkVt+KzlXxb9BdkgOu0hkcgKTOlSRKW92duw+7zyXtbphdel/5T1Lqg2QU3jQGCqwwEFOQwcin4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YpRAposCllMD503AbMU+ww+St7YaoIqLk3tbD7532hLrOt82T
	gwSkDbaF246RFRST/mzasJCiLW5DOD7ooh5HVw6l9ph0IcqVnMYsgg/L+EWedTOsFH0=
X-Gm-Gg: AYBFou1VKbVtSipSrvIa9kwwFENiatJZl6QJM4RJYRPuXNp909kpWKLBsNbtMnitoDq
	HTXXZyFH1qHckoLVRRFUe8P+jg2g9eYzqUSXLimxA1OxxQYC2ofTWf5hDjnjDVczcWHA8Armd9J
	cyMEnGN/CJrbkMp1qzCKoCob35tpv0la4UHoo719udBkinL9gNNDhbvrtNpq6lgEPejd2wLcC+e
	pqkBVXBUPTw9g5GEzXWgNNe2hpdktYPEG7ryHRp2KaDtxJiYz+/BdgZDVf59dVi7zJ8exSRvtdb
	oaP1z7tmX8vY299/KKkY6kDTjJV/YoM8wA1acCRJfnA4y8eZuXtXn7BMNnkfnSBCj63gsWLom7F
	r/aTd+Nchbfie2JCqo6sHLePiJiAwSEbyZomeq8WidmOZEqTCX5bjRGbyG6Shh4hSNwPg4Qjb7L
	iW+zJnL309G4Z/OvcIiAtEjwnzmmn2dzereLpWvTWUDDqqMKWW8kDQYyzs5rU7DHq+qfRYIm9zF
	7PUYswHb4uHqHmN/arO3GdF/uhSqnTf2q2laB74vpZh828pF0BlxSjv7mw0lw9UPL6/ryKPc7SB
	pzsAT//gnh5CnMbSFn/4AHnMFxgOWrdOmG8DwF7GEPe8iuci9So=
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr12097630b3a.59.1793759760840;
        Tue, 03 Nov 2026 18:36:00 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:36:00 -0800 (PST)
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
Subject: [PATCH v3 05/12] mm: hugetlb_vmemmap: unify writable vmemmap page preparation
Date: Wed,  4 Nov 2026 10:35:03 +0800
Message-ID: <20261104023510.260766-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104023510.260766-1-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
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
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Use two tabs for the new helper parameter continuation (suggested by Mike
  Rapoport)
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
- Replace page_to_virt() with page_address()
---
 mm/hugetlb_vmemmap.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index d3058e106795..531150870aac 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -199,6 +199,20 @@ static void free_vmemmap_page_list(struct list_head *list)
 		free_vmemmap_page(page);
 }
 
+static struct page *vmemmap_dup_page_from_list(const struct page *src,
+		struct list_head *vmemmap_pages)
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

