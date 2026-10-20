Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497526;
	b=K+QK2l22fRCnAcBSKnmFrrAPhYaSeMuMfUgdYTv39nvF2JUOthnNEuepCgfLR23O5D80
	 bEW+zN3BjFNbwjytsVzaN5czVlKyfWsh8C88nPs859uhRitNd/PFJyqFgUrAtNg9SgtdS
	 M2Y258XkRAxQrEtUiD9e9jLyHxzy9POp7iQGIFq3YnmwCU1+ucFvQR4ISduyemDQVcoeP
	 md/nF15ly9k/s6+ilYja11AjpG6gCDf77c8cwsQmfTlaCpzQZe0dudHSK2mOQn4WaaQd0
	 9Ixd0/4qiFG3+CUiUQZ52cHyLDqmMOj8jmtX3GsPrsgsxKBkWQmvMiTBLgCorKDDCPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Wt7D3no7nuCFnhCnq0cbe/ydNVwY6qp6AQIlxupHhY=;
	b=OCUj4vYjGRpHkCVQzOTq/8vrKffLc/2LUbvbiGGsClZ0sJMuRsqVGOUBc5/a9fVn2Yo1
	 5+YTJDOyObTLx04g9f310t5X6eW9zK08rhBLY34vWUxlsnJz/NMpgr0KsLFjqBYiuplS6
	 K9wKtQsbsdgOEiBEnqKvCr45uE8H4/5XsRFi8ngk1WzBfwZOgrOzWz6fsdY8D7wGgiaBk
	 PM3cFYRybOLYUlpoZzNDvPBIr0t+gH+xgo7KKCLTPoQDn10pPgJaPQKQkypZLkBZQSL89
	 8nRrHTMTeZZCBEQ0cHz3dNkIBYZwdg2NPHFvNY2XHTrLUZxB1NIaZxQoZ42pPaj1rdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FGaGGchG;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C344606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C344606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FGaGGchG
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd60d155070so1384725a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792497525; x=1793102325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Wt7D3no7nuCFnhCnq0cbe/ydNVwY6qp6AQIlxupHhY=;
        b=FGaGGchG+zcj2wKAHQZyGccuY+LKeKarHBSv2PZ29nvBGdbMaU+9Eba/yvXq3Y4V9t
         NKbfDc0l5qzYGU2G7JavYg+AipPfNdLnE4cwvu9EUQCgMVUTSqAw/bGvYJVr+jhOhvuZ
         h47W6M766PvD0mpYUnaH4FX1SWYJ1l0NvRPURpDO2zlzkafOlTp2hs53tCUg4PdA4J64
         fQs3AKfs+w3h00cH9RevgQPkQT708qnx2ntKX1LpY4a0jnjxuvzP0eY4joXYTzZHHs7O
         RazL4LYorZMaKw6r6nymRvMtWlb6iWO1wCi6mXYjdv9TfXF4gQYQ4wVnswTr+ZIgoV7B
         rsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497525; x=1793102325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Wt7D3no7nuCFnhCnq0cbe/ydNVwY6qp6AQIlxupHhY=;
        b=nY3Of+smk4q2eZ1SZIjD7Gj5nPHVnZ/BwKjZJoj/Oo378Tne0LuZ29MvU9+L73mZ1s
         1nu/yT7GDXQ2AZ8KH9gTxUIKxyPV0JtR7H9ultV3YriOD6XXsOow2aEaPKJQDzs8yQAB
         n3spjgG29nQQm7uiBalY/wmYwntHlaiBxUfrfCe1e1CI0L07ErXLFN1Eh2AjNB14Xbsn
         hHbgAQHerPT0NIvWX2kUHOnuaHmMc9/dVRP423ZDSlaksE6GAp38XIgOqqLZjBHdUMAC
         Fs01fNsYhrNeb+JbL19cmJJfAXoc3ZlIqSi59UqomigL7pZp1mHD5nM8UaM3XEmanDsk
         3+Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzird/fZ/eGtC+lWWtFDzWajgPDoCx0q1H7QUVaC+2pwU/GHI5/dmKtaBUViFCxnsD7C5BX9XSmAlbFVJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeBfkZYs1ZHI0SQnZ2gfaxyOFfoQQtv84Xv9uBUauldIgIv/tv
	PQuurXk3DmR1cHCIyfnGxUl/gLyYtdv+V1uLasOIKUhImoWZEj+J3ZT+aFE5aLr35IE=
X-Gm-Gg: AYBFou0ua6OjzUCUQYnNxg40AnPuHD6HjklClmX5Iz2NBsnX+ed6623GIM9BQLxXECk
	L14mN/TCZSOxuaU8rbt6V6pw1yyRA1ChyoA+McdA+LToQjy5cCTtWi8D5CoXvu0fCmG+dEXu6Se
	s8eh+1Ca2l9hCmJXlqXSBTOt9CguAIeGX/ehwLW2SubvfnReR0nhvzTMIRTSlYMBOZkCl3EZbUL
	5iWmP7IQq8UvQL6IMMUchdmCgLMRy32jf3q8uvW3/qcX5SnZayiFzVYawggQFIKax+S9IjRojAV
	vgk4FKLBQtVcY94nD/3U4apPF2Wtme+3tnzIegY5PsaV4IHpjxJZHsmgmtiRtDTg5kp3ZGw998D
	kyGfOk/6jvGimlRi/UhEjScq0jlXtddxiDOMDQAlhLbva7qZgFHqr+KadZ6+/I0mHsJ8phMQyl7
	eeRIFegYT85bf3pQF4X8K/nbXawn3LRaQEPqO8YnWOsHpzv5JJmYYz/KFqjwyHhdKGz1bDljbVR
	ncJGx7qMhv6ZPhuxfEtjhFLFJwMrcs=
X-Received: by 2002:a17:90a:d44d:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3acef19cb63mr8571724a91.25.1792497524625;
        Tue, 20 Oct 2026 04:58:44 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm3448095a91.0.2026.10.20.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:58:44 -0700 (PDT)
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
Subject: [PATCH 05/12] mm: hugetlb_vmemmap: unify writable vmemmap page preparation
Date: Tue, 20 Oct 2026 19:58:17 +0800
Message-ID: <20261020115824.823278-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020115824.823278-1-songmuchun@bytedance.com>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
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
---
 mm/hugetlb_vmemmap.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ffb56ffed680..9ea961291b3a 100644
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
+	copy_page(page_to_virt(dst), page_to_virt(src));
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
@@ -251,15 +256,7 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 
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
 
@@ -497,7 +494,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    unsigned long flags)
 {
 	unsigned long vmemmap_start, vmemmap_end;
-	struct page *vmemmap_head, *vmemmap_tail;
+	struct page *vmemmap_tail;
 	int nid, ret = 0;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
@@ -529,9 +526,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 		goto out;
 	}
 
-	vmemmap_head = list_first_entry(vmemmap_pages, struct page, lru);
-	copy_page(page_to_virt(vmemmap_head), folio);
-
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
-- 
2.54.0

