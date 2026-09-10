Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CA33C3C14
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022065; cv=none; b=XKUxcmQBDBfhf9tf5qHKCZqj+aiZtZ3oV8q8cvEP4LySesQOAknyRp5Ro6dnh+HbZSdqzMo2Dw19zE8Se8P56ExpmCXNyb//XP0XPmcJdQM38vZ5curEaTUoT3pbuXUZdcqsMxC702vRKbYqPZWyI0bfcboKkdLK5evrOW3MgKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022065; c=relaxed/simple;
	bh=2Z6fwz9ROGJGr1Glv8JiwUCw0S2bDYQJkl8yYB6iumM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBKfnAkSvurLn98bMQLxQqLzFQh2iuUNBJ+eyDGKn7Nh5/4+QlE3IKo5q1ysbxIaTbAKh62X9KwRVZ1HPOPIc89D66F76WHm1UsyqP0ODBag9J9ZsHVqcMjddLpotRKOcWrWz7HN8ePav9jXLx0PBw/DOX4z0JeBuzYb13CzUiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=D+Bduy8D; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="D+Bduy8D"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so4851056a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789022063; x=1789626863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXG9/IxdCoEJBswfQ8yvwYsfNZpsrq28j+tV3JTmESo=;
        b=D+Bduy8DbU8YeSzjrIrtMcOOqfk2bkwJYQ9wIrobZdTea0L8ArmJFmALeFl02fY6XN
         5GxaWfNILYQbbZSqRfBbnWeQmvTVTXT4rfTOyvxqUmyQbz4sD7zQuwtyTiBAAvJwk0tM
         +qlUfdsFIMzUNPjNtfGQYMSAj77TzBdTL8bIFwN4EFqOnpjkaAG1plzyAObqBCUDsgvJ
         rlgLtmnHSOPiR7FwV//F4tjF73gM1mwqo8rygn57nD29+ctToRXEy8WS/o/zlJF5b4PO
         TMuyJipoRsE2ucaIsvq0ngoq77xYKKidveY2tXgWEnkQw4QXodAtvlinvkerlRgFVVxF
         QNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022063; x=1789626863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXG9/IxdCoEJBswfQ8yvwYsfNZpsrq28j+tV3JTmESo=;
        b=Z98x4EWPQFwabIoeazE99wlrymrj79BhRfsV/CTEanitbtEpO2jzPxbSe3wfa1vivn
         Nm/fDHVAEr5X0n1PJs83OV2H9e+qnmHdxKIOsr5c5uy+j/9xiOY3vXRvhK26/MeMneH5
         A/kC6LD6Eh2aRwfLZVRqSo0l4F+Z6anm2uYSArSUOvyVGcqbntMZfF4V/HWByP/0ihU8
         w3mu+DfUGwLNfIisRcG6bi05xrcdhPhTfAQGN0dkp2NCtH4y8trS/D7MFMnfolxa95D7
         xLUs7KxG+rGe1hBdEmPsPkeBnRI+dP2NHMeh1aOYAqA+DTgx7e9QSysLYRtnM/Oj2KJS
         G+Nw==
X-Forwarded-Encrypted: i=1; AKwUvByPsfaMtKlGZbKxMbzcpjOxpMhSTS+ILdkGaK5BzbKIqLvETeIrLGHINTeV0O+dadu3hY/RhGLNx4rMNns=@vger.kernel.org
X-Gm-Message-State: AFuF++ku9vbn5X5pFXeGUoYKovDx/GCJxppzaTdAT+GbCCQt/01Fyd1O
	JbSLyKhB4dW5XCXYBWMbfpFAB0NRVUkZP5+zeLsZs4j59Tl0jUvw1bHG4VGlUNe8hJ8=
X-Gm-Gg: AYBFou2NEl6i4WBivZ/aApdQjcoJacDI2KqLSxKvAInKtriQVoNxxKjWecYdSjmLnmb
	72cgMyM69TU07eEjkNrbf9YxiZs20UpqFjPYes93jX3RC23R9BLBS1S7ks14rjxxIfiR4SmzlrL
	D7q5MZNj9PFuXqxqJPSJYtAXZt/ToG0aJIlKnuZkBHzHKNEPtkj9sEkzg/H5QqpNO2qxBu9aXra
	jKVkdRQ1UwhqRNGF+KOeGVU3u9jDFdZNPiphdVZaZOLNu8VMblmk+v346YmA7ecA+hK88lO/oRs
	kjKNdyes0rNzMRaFtn86xvvHlTmFrPiHGWtKbPsua0rPbvUnznfdD100wp4DCyDXCSYNH4ENJ7I
	zxTHz5rxec0DRiphir74mxL7/oQgyUqTTHXVXMa0nnuh4HS0VwHyWG4L/0//BRjtBklY/XzPDGR
	vbs6IhA48v2HVaRr+0IA1hIsQxxF4Gf3G6p2uRkKDKa+u3yaizIULPn7kSitEV18z55+zWlLdSU
	0eX5bYtIBbUhvwjh2BF1P/E2YvLNyN8H18=
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr58077953a91.22.1789022062790;
        Wed, 09 Sep 2026 23:34:22 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d84fdbae4sm1213094a91.14.2026.09.09.23.34.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:34:22 -0700 (PDT)
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
Subject: [PATCH v6 15/17] mm/hugetlb: remove HUGE_BOOTMEM_CMA
Date: Thu, 10 Sep 2026 14:32:54 +0800
Message-ID: <20260910063256.64386-16-songmuchun@bytedance.com>
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

Track early CMA hugetlb pages from the hstate instead of storing a
redundant bootmem flag. This removes the unused helper and keeps the
bootmem metadata minimal.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Collect Acked-by from Qi Zheng

v2:
- Collect Acked-by from Mike Rapoport
---
 include/linux/hugetlb.h |  1 -
 mm/hugetlb.c            | 14 ++++----------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 3559041a5a57..255a258f11d1 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -676,7 +676,6 @@ struct hstate {
 };
 
 #define HUGE_BOOTMEM_ZONES_VALID	BIT(0)
-#define HUGE_BOOTMEM_CMA		BIT(1)
 
 int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list);
 int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index fbc2ecafef9e..f9b609b84509 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3144,7 +3144,7 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	 */
 	INIT_LIST_HEAD(&m->list);
 	m->hstate = h;
-	m->flags = hugetlb_early_cma(h) ? HUGE_BOOTMEM_CMA : 0;
+	m->flags = 0;
 
 	/* CMA pages: zone-crossing is validated in hugetlb_cma_reserve(). */
 	if (!hugetlb_early_cma(h) &&
@@ -3220,11 +3220,6 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
 	prep_compound_head(&folio->page, huge_page_order(h));
 }
 
-static bool __init hugetlb_bootmem_page_earlycma(struct huge_bootmem_page *m)
-{
-	return m->flags & HUGE_BOOTMEM_CMA;
-}
-
 /*
  * memblock-allocated pageblocks might not have the migrate type set
  * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
@@ -3316,9 +3311,6 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 			folio_set_hugetlb_vmemmap_optimized(folio);
 		section_set_compound_order_range(pfn, folio_nr_pages(folio), 0);
 
-		if (hugetlb_bootmem_page_earlycma(m))
-			folio_set_hugetlb_cma(folio);
-
 		list_add(&folio->lru, &folio_list);
 
 		/*
@@ -3329,7 +3321,9 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		 * For CMA pages, this is done in init_cma_pageblock
 		 * (via hugetlb_bootmem_init_migratetype), so skip it here.
 		 */
-		if (!folio_test_hugetlb_cma(folio))
+		if (hugetlb_early_cma(h))
+			folio_set_hugetlb_cma(folio);
+		else
 			adjust_managed_page_count(page, pages_per_huge_page(h));
 		cond_resched();
 	}
-- 
2.54.0

