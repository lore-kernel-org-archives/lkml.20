Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C73B4EAB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660006; cv=none; b=rng86WKtB89ZJzbQQZWdTqejlvzX669zEa6uHf+CEG907xhVZqcml8h8ohMBy6/Hju4CN9x5X+g8pzUjKGjYRU+VXGFDjAEdy7cE3B8A12++/GRJ9NWgg38+IafBKyMdycgzyASP56Ztd7xISB4bnCX+kwgAKUaILc5Uk4dpMyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660006; c=relaxed/simple;
	bh=j48kM5qxO02GEVLS5nBEi2kqBBnc1RNZaUNSbr9J30U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8aFnL7EU/Lo87NWGBPRwJViWb+SX/X4vdv+b1Jwh1bHBGI+AM/Sltfy12qtco4ngiUSrF1HqK3O1z30JYsJVLMLxeImws4gERNWS4viVx68M/avYexHxxkUAwfFV8iGHnRCRd7dSVX6Xx217wwVv3T+MKvlrjACRzoav/VZOG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=TZuKo/mM; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="TZuKo/mM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso496892a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790660005; x=1791264805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmCovH5RnTA7rUGZy7nldketI90h2YRpy62dJPhw5NA=;
        b=TZuKo/mM9jCO1/3ZAPv/phhmSrf5sfGXdkEMSqcBwug6f67VBRyGf9vAYVYBHQVSFw
         g3ps56ZGJTkk0C8Mkzu7IGfupkDoMZ/28UNXwkkDNEIMNdwZh8NUBTxINslv7A4bOx+A
         2mfA5rhVVGUbKETxZK+cC0nQvFNzIayX2nw8VyZ/qxMyJs6bi84XGExyuv3PLh6UsEZq
         8T/mrirBARnqBng8hvVfCRaXRRORJHtP0dhr9ykLcRdOgNOr5oDXgnFiLy36dfiSalNI
         eeIPnmkjtyIiK3p+Q4HDZtrEBSLo80s53L3GAuDlkJUDktC/oKuSDaPi98PQ+H2n1AvO
         6h2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660005; x=1791264805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmCovH5RnTA7rUGZy7nldketI90h2YRpy62dJPhw5NA=;
        b=2VYAKuQzqBNlPXw6t0yV9TgvZz8EVELVcXi3BBQDbCGLBG/YAzspXej8GCE+sp7bYd
         J/RoxUCeeSE4R9owefPldqyGhbxXYsZ8YUWZQlD7CEPNHaaq3Bqxu/5CxNK8N6MC9mUx
         0cP4PEaXhqThU/8KLZXmJEeePoGj6WlORHMnxPtH7RHY+KHpZYp0+p0Xr1vO49edSNdr
         Y5b5SIKp+JXD4QaNumlL5g2V/Adizfjy/C6MwEB2KnngPIWIf18OTppwsRM8u27GN41r
         4cNIry13KNnuokWem/rtHxbXcVtedT6K5Vtlc3DNvpNcqh9PbDSNwhKAm/Atsuwy4oZA
         WI9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQ5JO5GUkO0LqY8LPIuwdl4m58XS762fRB0b53RrTBEzp0LDeihBBpAZXjrG3v0/8JxdK0p2wD+8tGxC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIzrv4TMAXOPrANLMi6gVQJ1b1qNNlLhbYKVnVRqVqJOMjBzC1
	n89k86DMqLA2UVwKo+CF46S4sXaPf3jzXa1CE99g/OV2MuRoPJcXkWxZ2DI5auxb0po=
X-Gm-Gg: AYBFou0fGVV28Zh/sOmK/I6ohvm8XIuMaVghfwyhVPDHLkTVH3iEYtTePyRrP4mnAtl
	UomrknQMdgpsk9oAy0T+86UnG3olOLNbLDJbKoMAeXTu/0ZlHKGIIqa2PP0DW1iItHwQcEk0Ioa
	M/ljD2D1zbRbOOjuJYLzhptzdShqHp1Xb5MR3L/NrugjFki5/2vY6rmZnWAz7irX7nJfhvjysLt
	lcyzO+JqOvcwLJTf4hAs4mHwSthgMu9syi1Zm3hmxLzRD0tpHK05pBoskO9LYeiCgfjWVrNjwgP
	eNY+thpesFjMD3a0by5X6WuMEK9jqoF+W3hrgojaQkvmOK2ammhpnOrknYeKmwwAuL8QPybmc+z
	iFzk3RTlQrDfEqadR9BLu86lr8c99JheEDW6PfegZ/MiaDVTCXrGBhI5W1imYVwjgtaYUHKU63/
	1Mfy70vbb75+tqBmHiRfus1khjUt/fwSa+JlBn7A53hX/9A4AnZCYNNBJT2XEd9dgg3kMk3qRyB
	L/plG6+V8kTdzBbBms=
X-Received: by 2002:a17:90b:2682:b0:39e:6a80:b795 with SMTP id 98e67ed59e1d1-3a0bb60b2f7mr9941647a91.37.1790660004661;
        Mon, 28 Sep 2026 22:33:24 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm49251765ad.51.2026.09.28.22.33.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 22:33:24 -0700 (PDT)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v3 2/6] mm/sparse-vmemmap: support device DAX in common vmemmap path
Date: Tue, 29 Sep 2026 13:32:27 +0800
Message-ID: <20260929053231.66085-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929053231.66085-1-songmuchun@bytedance.com>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
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
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Collect Acked-by from Qi Zheng

v2:
- Expand comments around slab initialization to explain zone lookup and
  page refcounting (suggested by Qi Zheng)
---
 mm/sparse-vmemmap.c | 64 +++++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 8219abc6c3e5..ee4c113ca938 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -237,18 +237,43 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
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
 
@@ -260,31 +285,12 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 
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

