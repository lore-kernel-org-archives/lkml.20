Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71F73D904C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022057; cv=none; b=NgdvY6KFwidxwUN6LjwXjdmFGq+U4lGDiH/vYlYMHXKNW9ViAI4wKIWFMEM4ZBldHa1ZDVyvgLiZfBRk62ETInb4D+Ra+I7CToq5vCOCjim6R99a+iwBdZW8qb9T+kgNyZV7DzxNTCj+j9ko7dZGwy5JTA1qGAMhM2gu7r7bk7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022057; c=relaxed/simple;
	bh=J3/NKoHHwAFLAgCGzlMxl8zo8az9ychwjCKQWWmP+TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGimSl2UxctkJ9+UBYoURGoyXEkZZkd7bEtbbLWGWJSSfbacxWUFp2lWRU83K8RgayIfu6cHJ2tgWae0Qke5myh1gz3w6S9uBt1hyxjifLE2Pl9FaS/gl+FHgED0XRVyWJkWcz+rB02BD6mMDXT5wBEWvonSVPrY2Kg/zogHBIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QEdQgoqZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QEdQgoqZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d942c7cc2fso57509845ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022055; x=1789626855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytFcTktewPTS6VkWuTaJ4fUtmqPUIIlqGvc8eyNaYzM=;
        b=QEdQgoqZ+1Y9s0PbzZoUjjB4IuW72ME5NFyR9UZlz7Mu9+H7KKm0SUDxkgZnu3v3/r
         jXwRS0E78rW0K3vF/LKhff7u3pgVcbYWBl1BP3Tm/q/UeyNnvrBz3FR0F2+qsUbIvQvG
         SkkqPhrcX1qLLSz2+vfOTmtyAxKPl0cfIjftdH30MwjsTCYuRiXsti+fwInrzuigkYDi
         aTORQu1RZWYG1pjAqsJFazs0yxAo4klvCT5Ktcx0JeNMSrRlw65dlG2OID9LWLuMv30F
         P41CUaByDBbP+AJGke1GbZJAK2ZfdjNsmtDLGyRto6HDOdN5S2zEzoA9ZyQyX75zLrjS
         8Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022055; x=1789626855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytFcTktewPTS6VkWuTaJ4fUtmqPUIIlqGvc8eyNaYzM=;
        b=VDHEIie4KwwyXG5WmeyFqdwkNn2uXENo1lYNyYCJVIbovGJ6XJBjnF42+mNinuprkW
         2jTe/YFhNYtekgNi1MGU+V56VIAkZfpXJW9JxyRhjXzf1QWfSE0oTXbdo7Y4EBFk3+jE
         D9c96pdoXP8FHQs4RDsaGHX496xpVp3XS9liwDH4armVO2gWR541sRnGYj4NGmfU1Ygk
         f2Rlwf6UJKGYL4xO2aMsspEyIa3kJ2Vpyy/4KCQ9fb2epVAAzx1YCEBBA029x8OpACjy
         oWUPpLay79zSkoT59+PjeVFaL4FmvY6Bz56I1WrhmwaGpZZRr36sXHz9xSAnKJK7ODYB
         ITPw==
X-Forwarded-Encrypted: i=1; AKwUvByOKg0bZPz6kdq4kK3I/Ntm0DFXspuHJKipkAsEWPv7JdATuumFtdcKLEWSJvawszh9v1jJFfscyReM3N4=@vger.kernel.org
X-Gm-Message-State: AFuF++nLMRINwcmOW2e6Av7t6VFinEzjhR61ZuPU9ZTW2+HfszAJTqV6
	fPeGo36b4WU8mVzJxheLv0zDbGH5ZthqYbZ+r39MESXKvEEgW173LOAiKBvvY8CmfOU=
X-Gm-Gg: AYBFou3qmoeg55t/oCcNUbSnMCwv2/sXOKghuVOdcYIFuA82grJXErDhPCi+wbe612E
	fJn0Tsd3CYYLHc4+hX0ppST1aaoarb2k6rHtyivCWqsbXuvB/d4mcqhGvsfYz4/NdB5HiLcO3Vp
	C/I7dJqHGGTZjCHSRDDqSlxkksw82dpjG//UIQ+zucG0K9TSN7dQY7x+sr8uQNeyFY57aqADMfx
	MMC/g/BwuejDZq5dxH4Bqg7nONWZeg6X7sIZSyDZW2JL1W8RlpFM5S/zmtgmrbBaIHk+qRlzeSc
	s7PQ+LGXUaeXJNCGWIhaW1zhAfGmbgOf9QN4BiVLgDVrigXVddfOz6cq2A6EucrB9K4oaSPjZTU
	yrPOetPSt5z69tFh5pcx7GC/vct8VrJbupqckyuCXZDrcSKbAN4Tl08Xn0NhWlaMbyGzYfrDjqR
	iY7QSegiOedoSd62qRga//IsKsEIzp2G+lwrF7YboyUvhlVYyMqOaKytE/W2ivC6H4gvnCxncw5
	Q5Mje2tsY2amDtZm/DtCqAUtZj3wqOJ+SNqd4GFB6cp/g==
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr61270657a91.15.1789022054775;
        Wed, 09 Sep 2026 23:34:14 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.34.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:34:13 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	David Laight <david.laight.linux@gmail.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH v6 13/17] mm/sparse: remove section_map_size()
Date: Thu, 10 Sep 2026 14:32:52 +0800
Message-ID: <20260910063256.64386-14-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910063256.64386-1-songmuchun@bytedance.com>
References: <20260910063256.64386-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

section_map_size() no longer provides any shared logic.

After the sparse-vmemmap changes, its only remaining user is the
!CONFIG_SPARSEMEM_VMEMMAP path in __populate_section_memmap(), which can
compute the size inline with PAGE_ALIGN(sizeof(struct page) *
PAGES_PER_SECTION).

Remove section_map_size() and inline the remaining calculation.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Make the local vmemmap allocation size const
  (suggested by David Hildenbrand)
- Collect Acked-by from David Hildenbrand

v2:
- Collect Acked-by from Mike Rapoport
---
 include/linux/mm.h |  1 -
 mm/sparse.c        | 15 ++-------------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 441bd39eab73..b19711b6dbc6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5140,7 +5140,6 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
 }
 #endif
 
-unsigned long section_map_size(void);
 struct page * __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap);
diff --git a/mm/sparse.c b/mm/sparse.c
index d19c173b40fe..cc28bb41fdb1 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -208,23 +208,12 @@ void __init sparse_sections_init(void)
 		memory_present(nid, start, end);
 }
 
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-unsigned long __init section_map_size(void)
-{
-	return ALIGN(sizeof(struct page) * PAGES_PER_SECTION, PMD_SIZE);
-}
-
-#else
-unsigned long __init section_map_size(void)
-{
-	return PAGE_ALIGN(sizeof(struct page) * PAGES_PER_SECTION);
-}
-
+#ifndef CONFIG_SPARSEMEM_VMEMMAP
 struct page __init *__populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap)
 {
-	unsigned long size = section_map_size();
+	const unsigned long size = PAGE_ALIGN(sizeof(struct page) * PAGES_PER_SECTION);
 
 	return memmap_alloc(size, size, __pa(MAX_DMA_ADDRESS), nid, false);
 }
-- 
2.54.0

