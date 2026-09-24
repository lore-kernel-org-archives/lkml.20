Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FE40B0FE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236696; cv=none; b=ohTSF2wgafLKQUJeNuR2GUv5nu6sVO35U+l/B4odd8EMmyZWPfBCPa4aD+/z0kxJXJx9MIQZc8LyGCwaGjgz+QdcRz1O1FjQoRnIGTkYyDX+OOFUWTAwzlXFgWxUZELAPhpdjWaM1VfDrYAcrNZFlHRR+dOpn4A6QujvGVoV7HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236696; c=relaxed/simple;
	bh=T84KkTvJYaKvataEAB5oU4K6zrwIT/mCEUvsHRkJx5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePrh+spHOHMNk8wSiuBQoWjYRsUwcMXuX4j22PA9z3CunshXsqIPJrAYH16Ul8j43p2IGJFPJVgzxNWu262xqRHujXLbHoQy/jNKrEAObgVZhDZOZB8L3xncFsyMB+fSSY1vV5ZulHsQ1/lpnOXrh9rm1qjf5uLMvXgUHT5Qb0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JKf88rX0; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JKf88rX0"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so1195613a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790236693; x=1790841493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypgv34u1izH3x2bQ0aB2L9cYWw/W1JF39DJ+G9Ytha0=;
        b=JKf88rX0fXIzCm8p1v23maA8NCvGSmVbfKY56lc7HThyCoWaAnhEqQbkrjpxLGgL8H
         ULujok8iWIh3fzOrUig9fnkdFdbMwg9N3lPn5rZyVTH6pWKGJVPz3t6PNCAhX/4bVNBY
         QGXspepH+6stKSM81JzbrWdjsT+G/OxnQ2x7THWWuNacyDgGiofvJEuqeeGLDRhlKtmU
         4vKtwchdH2/Qm+6ccMMvxMD+W2KbJYtFBS6I5vfHIEMbVfCC2A148BRJU9nMr9dEwEpQ
         tYb+r6kACpHPP+Ko6HfRD2twOtyprPD8Glggs4sy6bUtVzoGsmZ+buWcE76QjvR5p5hR
         ggNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236693; x=1790841493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypgv34u1izH3x2bQ0aB2L9cYWw/W1JF39DJ+G9Ytha0=;
        b=RLLVuFSwKVAGakduJ3l25ulXVJc34kOAlTt+uQW1Jb4E5k0z/Aim+0kzhNfHfXf6ZJ
         8Aj2OJ07MhRidrWLCfnFFgYcoSZqRvdS+6CW0oB3j9JuV0BspDt3lYzz/fse3Cr1Py/G
         /0cE6nuuJF94PQdxf83GDabSNE85sd2Xm/w9IhtZbHENkwLtCfTJr862GCAr6XcmhY0c
         Na6JJKQ1aanD/6z3l27iZ4ouPwwXIoBk80TjguOk2LfMRNuVo6xPt7IhjitCPtxwtncH
         kEaw5fsNwMT9VlPhJxXEm7igNxDtm+mztYfqkp+OPFDARc/YMeHr47JFyVvrDohGL5pH
         ItxA==
X-Forwarded-Encrypted: i=1; AKwUvBzCOIVfyQHlwpYmkZO5V2vzo6LHU2pbqbcfHysFvKfyW2wHxgy0dfaFyl3jebbReduS+UIyX1ZnS1v8oq8=@vger.kernel.org
X-Gm-Message-State: AFuF++nJJz9aywO714O7Vjl9EjOC93qWOAO888dpeFn0lF0QQonJd2pT
	5cEN9MbT0f6xbwpJcg1cZF++RfaLHyjmhMnqNvFFP2sqaZpza4Vdhm3DETM7Ti/c/oA=
X-Gm-Gg: AYBFou3Ms5tt+r9/heVF0ab1VhaUs7W9CtyWfFlJmOwhcB7gh/bSUQdPwYEs94k5Db3
	7yoQe9qKVDB1Ys/lt2kIoH4N0FA6RyJfpjSwlf6yrIS1KXS4JgJQwb9ClTcYycBFfbCtvtuLm6O
	A344uEolfsn30tr7IefC2pSE6Cn/+aWuZmRXIdZRDzZJukuc1j+tNagUq5W2fYNhs7CCyOCVBRM
	pscvk2q+iAa7iYeXZQEdZYIeZ59N0pmS/IJCrO+EV6nRGb5YLnWNJnXGGzOUy1qdedZmqYscCDX
	NL5AfRnE2UC5sBPyieSF+BHcNDuU5pg4LkzyCHklwZh1+dtzQA+TRkCOU01uA7ULtDvXTi4my6K
	Iw7nQREUfVqLo9buy5mVKhRgPSA5Bg+YErsQy5IMq5Dfpzno3+na0RLSFGFIsFT02qtUpD3bpA6
	iLzvVOEg/Tn23XpIVnjMXKhEKkLEBibKwJftxcnWBCeAqcvzq4LcMlqk7LDkj+1KaVY0+WhAp8s
	rg5oprQ0O4B8ZA0YKdb2FLRonixpw==
X-Received: by 2002:a17:90b:3852:b0:39d:f024:c7ec with SMTP id 98e67ed59e1d1-3a098d883b8mr1610039a91.16.1790236693438;
        Thu, 24 Sep 2026 00:58:13 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972eec92sm3575622a91.7.2026.09.24.00.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:58:12 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v2 2/6] mm/sparse-vmemmap: support device DAX in common vmemmap path
Date: Thu, 24 Sep 2026 15:52:55 +0800
Message-ID: <20260924075259.2013039-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924075259.2013039-1-songmuchun@bytedance.com>
References: <20260924075259.2013039-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The common vmemmap population path cannot yet handle optimized Device DAX
mappings on its own. It uses pfn_to_zone() to find the shared tail page,
but Device DAX populates its vmemmap at runtime before the ZONE_DEVICE span
is initialized.

Teach the common path to use device_zone() for runtime optimized vmemmap
population while retaining pfn_to_zone() for early boot. This allows the
same path to support both early boot mappings and Device DAX.

The backing PFN supplied by the Device DAX-specific population path is no
longer used, allowing the redundant lookup and population code to be
removed later.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Expand comments around slab initialization to explain zone lookup and
  page refcounting (suggested by Qi Zheng)
---
 mm/sparse-vmemmap.c | 56 +++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 919c94a36346..cdcc93714a9a 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -208,18 +208,39 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
 	struct page *page;
 	const unsigned int order = pfn_to_section_compound_order(pfn);
 
-	/*
-	 * Device DAX still relies on vmemmap_populate_compound_pages() for
-	 * head/first-tail allocation and tail-page reuse.
-	 */
 	if (!vmemmap_optimizable_pfn(pfn))
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
-	zone = pfn_to_zone(pfn, node);
+	/*
+	 * Before slab is available, vmemmap optimization is used for early
+	 * system RAM, whose zone can be determined from the PFN.
+	 *
+	 * Once slab is available, only ZONE_DEVICE memory reaches this
+	 * optimized population path. Its zone span has not been initialized
+	 * while its vmemmap is being populated, so pfn_to_zone() cannot be
+	 * used. Obtain ZONE_DEVICE directly from the node instead.
+	 */
+	zone = slab_is_available() ? device_zone(node) : pfn_to_zone(pfn, node);
 	page = vmemmap_shared_tail_page(order, zone);
 	if (!page)
 		return NULL;
 
+	/*
+	 * During early vmemmap population, the shared tail vmemmap backing
+	 * page is allocated from memblock before its struct page can safely
+	 * participate in page refcounting. Therefore, no reference can be
+	 * held for each shared PTE mapping, and the mappings must be unshared
+	 * before the vmemmap is depopulated.
+	 *
+	 * Once slab is available, the shared backing page is allocated from
+	 * the buddy allocator and can be refcounted. Hold one reference for
+	 * each shared PTE mapping. The architecture vmemmap teardown drops
+	 * the reference through __free_pages() when removing the mapping,
+	 * preventing the backing page from being freed while it is shared.
+	 */
+	if (slab_is_available())
+		get_page(page);
+
 	return page_address(page);
 }
 
@@ -231,27 +252,12 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 
 	if (pte_none(ptep_get(pte))) {
 		pte_t entry;
+		void *p = vmemmap_alloc_pte(pfn, node, altmap);
 
-		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap);
-
-			if (!p)
-				return NULL;
-			ptpfn = PHYS_PFN(__pa(p));
-		} else {
-			/*
-			 * When a PTE/PMD entry is freed from the init_mm
-			 * there's a free_pages() call to this page allocated
-			 * above. Thus this get_page() is paired with the
-			 * put_page_testzero() on the freeing path.
-			 * This can only called by certain ZONE_DEVICE path,
-			 * and through vmemmap_populate_compound_pages() when
-			 * slab is available.
-			 */
-			if (slab_is_available())
-				get_page(pfn_to_page(ptpfn));
-		}
-		entry = pfn_pte(ptpfn, PAGE_KERNEL);
+		if (!p)
+			return NULL;
+
+		entry = pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
 	} else if (WARN_ON_ONCE(vmemmap_optimizable_pfn(pfn)))
 		return NULL;
-- 
2.54.0

