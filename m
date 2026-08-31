Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293C53C9EEE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162916; cv=none; b=A+5mpetIqMclkU/VHnpUGKCD6UGChkimdLJ4/WKDHV/AcGK5afVRi/mIV+bnXxwoWgRsJcQtlLRSdFeGdmdAZqgMQK8QXamasIJ32JtA2sJRqV6c5EXaMZ2OhvNnTHgE5Y5caHWgRf2qUoOy7LN2ETQvm4uKhcHt/mTrbMlF3+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162916; c=relaxed/simple;
	bh=0craoejHz+yL27FxB85ch1A7TZcJ/6nPjXoONqTOYGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nj/D3e6GHEAf6crLKbNk0U+pUAtvYE/kuCw58kIX2ZOeCh1orTqdTPU6mDq9YDP4dZZkXMRMPGi1fDhdDGwigCGwPpts/Qw+jwACYjZryJ7qb5XimB5WdL/XskJwjCEetrprj+WBFlp7ba8Di4MI03aS++MsMEv/ACWq/y0eAdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DFM58fR5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DFM58fR5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so2825370b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162914; x=1788767714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Uns/ZJlTRrXsZn1DdaJluablabo4P2O8/HR8HKp5bE=;
        b=DFM58fR5HSPLFJhOX23ETEp/9cXZuuukBeywrABjaW3Wh0ls4YBzOhMOeBR9Qq5/85
         bIg8H9pV6pT2SXGMJsdZlxtwWRqa2VuMoex+gQdTqnRmWWsHQv/IpfiAXb5xLLTRGdjR
         eBOusAYJ+0anPgnymRH4i/4/TBgisTGdNABwe25v/37FF4UT9kRckXXMQMG09XvdxSqm
         1DS2BvpGTNw6kmH8NKIE1BD3NhAtwxO1rtVu+JRjQ+LRf80RY4y8a2jodicUkuHA7yUJ
         as9wWtkF/ZPqDII32qwPqPbHGTE3g2SRbTWf9KyTxGqs5XPQ3UizdnrQdN3nO4FXB4wU
         U7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162914; x=1788767714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Uns/ZJlTRrXsZn1DdaJluablabo4P2O8/HR8HKp5bE=;
        b=f/oUXavaPCEbX87iFUQ0fEzZu7ZSi8eAdxxkNYRExDuqu2D8qpw9I4Q92uihDZ33Oo
         pPg5vShvrNgYylftBDtqWwLiFL5S/DFwVj9I7vhNZ3TjRQYJE0aXNdZjnmMoIs+H8730
         yyJkysqd+ZRcMbaIIsdBF5Rqrhiozb33bgZLucFLhytnocvwqhWuCbAmrzRQ9V50IS1L
         K0kqkV2rNxR+Hzs8dCOddqo/78k4akAnO/lQiLxkgs9wicFfiH//yQ7A6fikCT62iTA2
         7FjwRzPfQOtX447Y3rJioFXxe5BWF7e416KuxqP0MZ7l+HKO4PToXgpqFmlJ4nzIBzcz
         ULKg==
X-Forwarded-Encrypted: i=1; AHgh+RozcgO6Ga/pnbFr+I3hPeGLGX6Btk0Ep3CjRhms8zkPuZ8i4lpOUcpH0Pvwr55sr1XJ5xHsAVv1mwK+fR8=@vger.kernel.org
X-Gm-Message-State: AFuF++keDX4pmPt3vzF9342bT2JYLRMzkpwIVDCa7pgyEWHoV+T7un9v
	y4MgSQpZ13XsC3TD+JQTY6ShxwJEzBDPvWMgejd0VWou7+z54kwIWSV6byWpLh+uqhw=
X-Gm-Gg: AR+sD10X4sTM6toCepQyFA2OsCV0OrYLOMDQoSUo6wm1o2LKSAtsiagDMSWiJkxZWk6
	gY/b0PPVfs5GQo7rA07K+r5JyFPukrvbnSYaxL/09mVmpG3JEKhmFXNgaxxWaTUBHe0Dfd7OQcE
	qcfjlBlEVPKEJsb0PzorKK/a6KrS2uOwdPNGgEkppc/DJI69hqUH5gHeLDfNcEuP+WvGewtUoDi
	MF+o5zEpFMEbhgnsJ6AwOizXcrNBPZqG2aCL/Kzz+vhZ15c15y6REnLgNstxoLJB/XlCih5RrQ7
	cLT/tO0CBzI1W+UEf87g/Ljl2p42ShH1ugVg1x/voHIxebycNNWYvu+082HKSnXyyZ/l3Ghz1lY
	MZxy8Iy4MZgWMU6tVhxdnfoLHiWohKieFXmlkzIyvOLmNsd08tnDffbta5HR0gv7iPIKj3akGQb
	zu6dv3Prz4WdeOU7CpgLXMczawz3Sts99QLkIMnsiT/czboRfyS8W7xcoCsXLb91YAEmpU3H1i+
	H0DPdl2SFy4p6UqdC2lUwkN
X-Received: by 2002:a05:6a00:845:b0:857:72ba:ff11 with SMTP id d2e1a72fcca58-85adca7066cmr2156632b3a.25.1788162914397;
        Mon, 31 Aug 2026 00:55:14 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.55.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:55:14 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 10/11] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Mon, 31 Aug 2026 15:53:41 +0800
Message-ID: <20260831075342.57563-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831075342.57563-1-songmuchun@bytedance.com>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

section_nr_vmemmap_pages() no longer uses the altmap or pgmap
arguments, so drop them from the helper and its callers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/sparse-vmemmap.c | 10 ++++------
 mm/sparse.c         |  3 +--
 mm/sparse.h         |  6 ++----
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index e655d9d1348f..4950ac2a1c01 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -131,8 +131,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
 			start, end - 1);
 }
 
-int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages)
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
 	const int order = section_order(ms);
@@ -637,7 +636,7 @@ static struct page * __meminit populate_section_memmap(unsigned long pfn,
 	struct page *page = __populate_section_memmap(pfn, nr_pages, nid, altmap,
 						      pgmap);
 
-	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages));
 
 	return page;
 }
@@ -648,7 +647,7 @@ static void depopulate_section_memmap(unsigned long pfn, unsigned long nr_pages,
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
 
-	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages));
 	vmemmap_free(start, end, altmap);
 }
 
@@ -658,8 +657,7 @@ static void free_map_bootmem(struct page *memmap)
 	unsigned long end = (unsigned long)(memmap + PAGES_PER_SECTION);
 	unsigned long pfn = page_to_pfn(memmap);
 
-	memmap_boot_pages_add(-section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
-							NULL, NULL));
+	memmap_boot_pages_add(-section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION));
 	vmemmap_free(start, end, NULL);
 }
 
diff --git a/mm/sparse.c b/mm/sparse.c
index 9349ed6326c0..adf057f54c0f 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -251,8 +251,7 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
 						nid, NULL, NULL);
 		if (!map)
 			panic("Failed to allocate memmap for section %lu\n", pnum);
-		memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
-							       NULL, NULL));
+		memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION));
 		sparse_init_one_section(__nr_to_section(pnum), pnum, map, usage,
 					SECTION_IS_EARLY);
 		usage = (void *)usage + mem_section_usage_size();
diff --git a/mm/sparse.h b/mm/sparse.h
index e511d99fc26b..5d0f407bde7e 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -70,12 +70,10 @@ static inline void sparse_sections_init(void) {}
  */
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 void sparse_init_subsection_map(void);
-int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
+int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages);
 #else
 static inline void sparse_init_subsection_map(void) {}
-static inline int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages,
-		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
+static inline int section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages)
 {
 	return DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE);
 }
-- 
2.54.0

