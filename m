Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCED353A8C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619123; cv=none; b=IH++p9dH7bo1uCM2Ufgn8oPKpGBYihg+ck3xl3KzsDg4yCWEGxlM7go+4T+pER8hd7AjjHwyhFy0wy3J2IUNc4s9n6mz25qLmQ4rQ8ox6fYHIL6IHhOyBDHvp7j+jE4Uq2/jh7M5D03WqXFd9G91hJY2ZW6jclRyvHkc7MAzmF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619123; c=relaxed/simple;
	bh=SRv7aofTwuhejRQFqCXZAqcOJ/ms4jJmArMHkuZUyMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLjBFCzM1JVXBbhcV9/372wcHMMJ82eH2+SiOweXO+bK6NcNXXvGzHT+hg/UGDc5s2tJqIWc33pDbFlGIkoR/CKt5D54JIijYLmF+mxeMx4n23aG8eoutkcEinZQL2CsSr77sUx11XGds9GLGBX1VRGeumBGN1orqVLuju+MNow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AzgjNwL6; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AzgjNwL6"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so230380a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791619121; x=1792223921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ma837HBXIsXlkZZedCno7jR/Be5/TxFOjn4ZcgPZXQ8=;
        b=AzgjNwL6Wkdx5p9fJu1C0KMtn1R1BSGDgJd1BNpFEj5BjmZzqrHN14gEBkdj035sok
         hEEjKiRJvZgvNLpzygG7/MHWfN6CgNJVhIZ/7dRDA5nWC7mpLoWy9JuWI2/xwKXu4PwH
         f1+IkRc95nVCka9LJHSPWad7hZtrGd7mJ4bKBc25bXglEHvaihzcitzQv64oFdhpqELB
         WOiNIhal2ECwvEBSqqxNb6Hf3jM1sGi6IuVs7h5jHPFSClacnzxfezjpfyUUPuagowpR
         Kok8uLwlgLgdHRJjb8RSL4U3Gqw665Yt0zDL6R+xdqggK9W56s0ZwM4z75WGUmfN0AaQ
         siww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619121; x=1792223921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ma837HBXIsXlkZZedCno7jR/Be5/TxFOjn4ZcgPZXQ8=;
        b=C1pniIYX3SAusmfKC4bYNZzskbv4Zop95TSI7s7QNX1WX/YT+YBUiWty0g9BTAYWjT
         RGyW6pi2BFFfxvv/v9BpX2IAX9dlu2h7SwGCx4hJFsR8cIf+or2Jfkq08LkpE5pY0X+W
         6wpTBN1mX11rPPuoz8rmO1j40fjwXQQMtLaoXBCjBLLgVdorUeGHz88s1T0GqQsZ7LpV
         9VwjNUt1LuU9qZBU3KWBucZ+zQuv8/uXnW2fENkEZNUtTlpgD9cSt4Dwwvs5on/IfGTK
         s2P1VmcHc2vPF6ToreJM9dlu5HfBTQTBZ7hkPyLKNeZ+bCtRKsNU5hmA7fokSIWLV/kw
         h8Hg==
X-Forwarded-Encrypted: i=1; AKwUvBz7/os59XBk0it3mFothh2BIcjLKYgLMPf86dUojYONNBLkNsX9Ez2VtgnnohuMAe7R8mDZMYhpRP3/lFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKkgbjRat8CrQj64srzuj54M7APW46Fio6ZPiaRIWSDTKswMzN
	nQuulitTPGbT2M+cc4SZD8YIuiraFYwbU9oRU8ribMiX7v6/RyRxpEa3sN/7NAue51Y=
X-Gm-Gg: AYBFou1sMd2WkWKlVYrIsKwNQ1ctQsujL4Ye50u2mCGH2ZSLuSSfx/+4dsYLcabFRZD
	VEjyqb8pDHoUkl2ePWJWMwkHdQif8Icw0ksffvc8p52e/tDusvllTniPePYoQP/+4545oH7ludH
	jgB52acS3SRkV2rBtvC0GsJ7kqCPNpgCHPoGXhElsIP1eBb6nYC39g2HW/l6PjiXhiAyimot0H4
	hxEbqU5/r6TGXVVLVRosfMZYLs9ZlVlC6m5ff55CsrVa2FHPx2ME2cwV0I7IlNiCXbh8ZGF4L00
	RHjZv9FLCfGTbbxH8BNCKMbDfg5YTubPf5uArYaYFSzDk3OEX7GGfTvcT9xIVxLGfGeqtUx394a
	vlyFIeUOioh4VEfHdbOQSZP11Z3OZpxmJcnDgLMUkefjjpLfezP/xxmR7ClhP0CcQsdJa6JRVEo
	zN1DKyUD40706In8fKNGjznyqEHgrwQgkky4ocqhnv8NVoLalTmfDJyi+81e2JNat9HqKluYQwI
	0lOfwDHgwW7FL26Rq2HVw/8W/t5/dlkOU0+wMzvDIoLMZXRtA==
X-Received: by 2002:a17:90b:1d4f:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ab3a954001mr3617692a91.30.1791619121000;
        Sat, 10 Oct 2026 00:58:41 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab57c05724sm3473569a91.4.2026.10.10.00.58.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 00:58:40 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v4 2/6] mm/sparse-vmemmap: support device DAX in common vmemmap path
Date: Sat, 10 Oct 2026 15:57:51 +0800
Message-ID: <20261010075755.83339-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010075755.83339-1-songmuchun@bytedance.com>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
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
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v4:
- Collect Reviewed-by from Lance Yang

v3:
- Collect Acked-by from Qi Zheng

v2:
- Expand comments around slab initialization to explain zone lookup and
  page refcounting (suggested by Qi Zheng)
---
 mm/sparse-vmemmap.c | 64 +++++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index b23efff80137..62327ac15206 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -241,18 +241,43 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
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
+	 *
+	 * The backing page may be shared by enough PTE mappings to exhaust
+	 * the positive range of its reference count. Stop populating the
+	 * vmemmap if another reference cannot be acquired.
+	 */
+	if (slab_is_available() && !try_get_page(page))
+		return NULL;
+
 	return page_address(page);
 }
 
@@ -264,31 +289,12 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 
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
-			 * above. Thus this try_get_page() is paired with the
-			 * put_page_testzero() on the freeing path.
-			 * This can only called by certain ZONE_DEVICE path,
-			 * and through vmemmap_populate_compound_pages() when
-			 * slab is available.
-			 *
-			 * Use try_get_page() to prevent the shared page refcount
-			 * from overflowing.
-			 */
-			if (slab_is_available() &&
-			    !try_get_page(pfn_to_page(ptpfn)))
-				return NULL;
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

