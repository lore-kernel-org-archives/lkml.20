Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15373955DB
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288837; cv=none; b=bBkqPsDgCUDjOuNuRW/ccEV7fJZfZOpw8zNEEA1zYvpvB14zII+asJE8Kpd7msdgXpasen8Etc2LAwiq7HCave97djXwgNSeFgFpxj5Lj/IDbxw7WltAGmIaul0XmUNemd0Wu4D8B2mExz9mD4GBo4B4xQGMEOILHWoElgxLWTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288837; c=relaxed/simple;
	bh=nXqKkthQoxndQtXnTGuAm/HrZbKfZvzgLQOPbI6ThFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FfSN0xCKT0n2U1v3a6JqD3Bbt/X6pA7m25y4BtqjGIOAh2lxKDU5UeurMaNyg+89fgtdqA4h+ZnV3e3KYiiYYzogq8Mo3ERftMDvYVlahca7BqpWLwleAu4PxoecXnBVqagbhYwi0n01EQluno9wRWKLCDNuqnTidpe0HC2GFXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a0tCJhS0; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a0tCJhS0"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a856865so1449044b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789288835; x=1789893635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbLBsQvqBa0OuqffzZ60qrRN9YSSPX5HFZkA81JtLUU=;
        b=a0tCJhS0cwtbeDHUKfB3SkC3/WMlpuUPzmLgNUM3lipjFXiqaNazZWiyj1YQDCC4i8
         v7IQFUqAXKM6OO+DA56jxEiUC68vG09qlZP/liMFqk0O8s/TnGX3lB/IFOnHCj43jzsC
         1EJCmqpmEy3McSuoc2SG6tXXVUc+bkrZqme6SW0SnpSm/DqruFVG0kmncNnkCQHXhh6b
         SOlO6BCoVVjomXUQKVR+5DPH/ncsgW3rQ4EbDEvQglaJnX51/HQDWWnueJCVx+OP4ae6
         MQpqSVNxGqTgn9RUqHD5gig9AJ8JjqUYVXGqaaQO/nBa5XuP3djvsRen+Hivd+I4GvAL
         T7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288835; x=1789893635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZbLBsQvqBa0OuqffzZ60qrRN9YSSPX5HFZkA81JtLUU=;
        b=n9BJqKPwpoEhiqGfGTPZBsSSRLyGQAplcB+CFKlTdwYYS0ja7QiQblzgHMd2JSAj5b
         8hzvHume1EvOkmBESWzK/ruUpSWLlh0jgvrC6XlbujWxjjKeAwp0+zENVaDV32cR5jFj
         gNgDiwZv311hPkR6cZmW/lr7VpN8NfTvaLw/BI88Etq7b840TKtoLMbbrBwI2kyDtfth
         6MAVeebuOevy205TKLjSjd/4qXJIxkklWn15wLLiED/4ttSpwLFb31NKE2LNkcGhUF3q
         iwnm44Pnh3aORwp80/fml38mYEnRBcJK7vemPP/KdpDcyyd9fnul6+cMLGcUfJL3UJ40
         b9Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwC3kGp2aPi1yuE2BV8qQBXJjjleRaI4G0XOg1K3jwIeTTNn+rPSxN0b6/oEL2g57j/o7oHgPSj8wmp/uU=@vger.kernel.org
X-Gm-Message-State: AFuF++n/U0nN5PQTnxCaYz6iHPTLq9D4tEM4sLaaRwxCwm5357I7S6l9
	KiJwnqWBKgluUEdsDErQ8+EGmEZRZXeSUgUP+5UxMi18FESv9CitXpOfpKNaKKsyVRU=
X-Gm-Gg: AYBFou3SSX8KGmybDm9G9Q0/SeMMjHtJb20mUyFuRsu6vyI1UzdQbzPkhIQq4tZggDN
	XjF+o+pSsJKmgmbHBEVQLf5qbCiE8gI8b8Vur6X3mT58BDTQ93Api3roG54vMc8Z7MRWrKJuhjI
	DeUfQOWXbZAj8zihjmcWNAmMnVzRQ1mw491l8Ug/8WNpJzjFfGJm+h5UIeoH9QyWiDWLdh3llLG
	34knhFfMH9JU0VlCkEVlqCsI7Fg3txuylVAfhiXWf3wfag/7E43TcmMASoVLGx/8IrLWRuqJOTU
	k58dSaL3ZPeYisWkOLsYwQQ7lbM7u+kqCUf8E4gxKaS5FmOZVlCRdF7afUAtDrg0QWsjKu8uU+3
	W5m88y4ztFvzc2jQbf36+qo9v+6j4LZZuOxsvxTx4rSWVqxkeTX6WjJaKmMDecEddtW3Su3SUhk
	CNYjmRS2ddgiJHNi0zT4kpxzilsSmZzQjHwrY8bEnL90Dyi4T7NCH0tKNOGBqmv+F5Ai2ArGTY8
	Qd3Osj5a9eTywr7RgaCkApQdYHVlnmrDIjHNg==
X-Received: by 2002:a05:6a00:2d9f:b0:857:72ba:ff11 with SMTP id d2e1a72fcca58-86b34f095b3mr19117087b3a.25.1789288835163;
        Sun, 13 Sep 2026 01:40:35 -0700 (PDT)
Received: from G6L4RL2QG9 ([2409:8a00:1832:cf0:5137:990:100e:cc7e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm3070531b3a.42.2026.09.13.01.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 01:40:34 -0700 (PDT)
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
Subject: [PATCH 2/6] mm/sparse-vmemmap: support device DAX in common vmemmap path
Date: Sun, 13 Sep 2026 16:37:30 +0800
Message-ID: <20260913083734.86802-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913083734.86802-1-songmuchun@bytedance.com>
References: <20260913083734.86802-1-songmuchun@bytedance.com>
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
 mm/sparse-vmemmap.c | 44 +++++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 878d29a4e862..e83821768c12 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -208,18 +208,27 @@ static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
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
+	 * At runtime (slab available), only ZONE_DEVICE pages trigger vmemmap
+	 * optimization, so device_zone() suffices. Note that pfn_to_zone()
+	 * cannot be used at runtime because the zone span is not set up now.
+	 */
+	zone = slab_is_available() ? device_zone(node) : pfn_to_zone(pfn, node);
 	page = vmemmap_shared_tail_page(order, zone);
 	if (!page)
 		return NULL;
 
+	/*
+	 * When a PTE entry is freed, a free_pages() call occurs. This get_page()
+	 * pairs with put_page_testzero() on the freeing path. This can only occur
+	 * when slab is available.
+	 */
+	if (slab_is_available())
+		get_page(page);
+
 	return page_address(page);
 }
 
@@ -231,27 +240,12 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 
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

