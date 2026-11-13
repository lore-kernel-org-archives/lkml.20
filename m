Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540984;
	b=0DcKwVmSlvcRgFWfLYocPOERftTwFf6HkHj6cQ3+O664r9b4BUOb7WkJwF9SboDVz1HW
	 03ZGOGleiOO2etiEizmoUAJdmMuZ4pS2ygSWXlxmUScrMAybZK8g0nxYIZA0XJ6rZRwLV
	 yh8JUMbmVde1FUXPQjleJR8iQve3uBMJ33WNBGqxZqyaB2jdy8JpEl2KSM4xOJG88wASx
	 zoB0OixFgayGUDGpY2XbdQ8hP3C2phSr5K5hVc8EdXtysY9nT/ldmlBJvFQ2DWK0tEsrf
	 VWjOdO+nRHQeYniKqD1jjw9CPCw05rwFy9A5CwgtWgtGhVwKuLDdCioKzSv65Dq7I3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gbL+rkfXz3c48YpcD0yByu0+R0Meu6xgHsW1cv593pY=;
	b=fmNFKhARD0BicZjLvoxbj4lQXXz9XRhAxSYaCbkyqGaP7rdXPRkeeO9wae7lfkN10Xst
	 SjCB+I3uoJx3xnNYBbbQn6FDqBtY5IsPb3UfYYBlD5YvZP1rGfYdU4sdPfnQgd6PWY0Lu
	 Df9hwFJ8MMvqiAqgG45VOhUf3s34QVTcSkzYFNZu193251UHja7oYgxB9ehBv/fjJdpGu
	 K+WOKGzpiCodNXr685NlQgF68pmZy6EN0qYVcwL1aejqbi+asvacYKUvnmgUhtGXgy7Al
	 bvl/xHgxaZH9VhhRc56yljrrfwRAo9zSoRLC3JUHIG2KSkdtvFTfHZuaEhHLZ3sUflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X9s5RjTp;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B337A606A8BA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B337A606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X9s5RjTp
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37000e7234bso1300746eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540983; x=1795145783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbL+rkfXz3c48YpcD0yByu0+R0Meu6xgHsW1cv593pY=;
        b=X9s5RjTpkz6nWDyuHDHy5F6SJkZPFFNu1oGKj57ln7na8YMUVNs5PyKtnfusSfUKh2
         A1i0xwDtjOA5WxldmFqiZRALXJIVTUEx8cLuNmYwRm+DQ5XXOQejM+Er7DEpsmsH+Q6E
         CvpKCpj/a5EYnXRjGEacyzC31nIB8+WqVCLvYidBhgpaJ7v4oBJrZJwZ3ByUYMwcmCkZ
         d0iK9NsvOo3NrwmE++vG7QZDMo1RcS9VAQG3puhGoqwOhas0jdZ0YSH89LHu6Vb3uIYW
         5vGb6wqprkAzTJYUajUbyjgY3E1qpLxWo3if9iGUJ4oBm4+Lcf8NYMHZDYiSAGp0m481
         1Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540983; x=1795145783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbL+rkfXz3c48YpcD0yByu0+R0Meu6xgHsW1cv593pY=;
        b=0bYTPs9E+hlb0CDYcmocbxMcIaOE+NMYz6V1gfMBUG1cKSgeZM0+EHbhf6SGDQGrxX
         3WVa20j4yGMS1iCV/rGJVgIGuG7vfAwLwMKvL2mPcq7Iq3X4Us9LhMSwUn3iceysqylT
         tvu7J5aXcVDK5cTC/t8Ii/HIHN5J3yVIqgIYsOJpQJn7/z+hjmCT1AKU0hpmJ/oFdr69
         EQ11PN7KnOVRqFMHuL2m2nzhZ3h+tnynfyXZHI4HcrR1G4uSe276cR8djHl6qYzIboNU
         vtdIVhOtgrliqy7HFsnkNbYwbN8B8biwAaNzUt2wCsfl4w6tdn6ltNySTKYWTX6xvIko
         1TEg==
X-Forwarded-Encrypted: i=1; AL+hErFLUJbKsBWHrGY8qFIB/zRoEWV0MOn8XWcSBjJvoMChNndph++oIX6yZHriSlFXdzBwhHtGbKyGyQdwQck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fawzptj80r7ve1o0eCOUReGHKchrNIXpbpYBWPJhK0gpt662n
	JgACFcTqSNeHEnwQUSnrbTdjROksc/Yf7tVg/WnDCntfNgXMy1mBQJuyYhoNEnf+3i4=
X-Gm-Gg: AYBFou3fsITse/UlZfZtFt9f76nFbe0H44bQ3bB/WOwzUE09xyGnVZDb2461lG8tWgr
	BO1JOLPKn5Z5yV02VB3UH7y0N+T1kogXci3aefdnbkmy3HQsS5OZ1wr4yBn+D008HGcl3unSZsQ
	ugX59s3rLSnLDxW2takZuk00WJL1JJBtmjfZVABc1ujvvHKNNG7zJTbRafcsgclEq5C9hUb0WcN
	eheE+vwqlhxb4ykaYxEuncE+RAElEORLgZIrHF68SXoXxvoBc3GCcDqTZF5bFFkTSO4IuVQS/E4
	gOYYUyc9Te1n5LVxYTj/g/sFIqv6aUuDU4tFqJ9Myde0VDyDMn0edR2f5q0rlhPdrZkGrjRBPUJ
	SkfehdZs7Ew5AnmkBcCHpiSmpwV8jY/fZGH2QCSq/2aj2JsjZYHcEAM1o6BttFcBqut5H+q6rBg
	VlQT1EcDzlIpeCbPjxlsSsG6JH9TrW1v5njy6kaFmAyDd8Hn8s808PO9O8+/4rCs/8/9vsceta4
	mtpjZIr2F9uSpleMok+bCDKgPxFCU+/4LifzUJODlq8beBeEvggQKEtxzn7qVfwnow+T/63h5oU
	XA/eC+sT2Lhvo93eGYl8ewNPlK2cde409iRjoNJHCzhReOs3a6qO9qTBu1/zrQ==
X-Received: by 2002:a05:7301:db11:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-3796047be6bmr1058848eec.0.1794540982398;
        Thu, 12 Nov 2026 19:36:22 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.36.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:36:21 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 14/14] mm/mm_init: move pageblock migratetype init to memmap helpers
Date: Fri, 13 Nov 2026 11:34:42 +0800
Message-ID: <20261113033442.62970-15-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113033442.62970-1-songmuchun@bytedance.com>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
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

ZONE_DEVICE memmap initialization already initializes pageblock
migratetype after all struct pages have been initialized, while hugetlb
bootmem folios have their own duplicate bootmem-specific initialization.

Move the MIGRATE_MOVABLE pageblock initialization into the frozen memmap
initialization helpers instead, so the ZONE_DEVICE and hugetlb bootmem
paths can share the same initialization.

The old hugetlb_bootmem_init_migratetype() skipped CMA folios via
folio_test_hugetlb_cma(), but the shared helper always initializes
pageblocks as MIGRATE_MOVABLE. This is safe because cma_activate_area()
later overrides the migratetype for CMA pageblocks.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Fix the helper name in the commit message (reported by Sashiko).
---
 mm/hugetlb.c | 25 -------------------------
 mm/mm_init.c | 11 ++++++-----
 2 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f70c1373235f..a2b0912290f4 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3249,30 +3249,6 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	return true;
 }
 
-/*
- * memblock-allocated pageblocks might not have the migrate type set
- * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
- * here, or MIGRATE_CMA if this was a page allocated through an early CMA
- * reservation.
- *
- * In case of vmemmap optimized folios, the tail vmemmap pages are mapped
- * read-only, but that's ok - for sparse vmemmap this does not write to
- * the page structure.
- */
-static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
-							  struct hstate *h)
-{
-	unsigned long nr_pages = pages_per_huge_page(h), i;
-
-	WARN_ON_ONCE(!pageblock_aligned(folio_pfn(folio)));
-
-	for (i = 0; i < nr_pages; i += pageblock_nr_pages) {
-		if (!folio_test_hugetlb_cma(folio))
-			init_pageblock_migratetype(folio_page(folio, i),
-					  MIGRATE_MOVABLE, false);
-	}
-}
-
 static void __init prep_and_add_bootmem_folios(struct hstate *h,
 					struct list_head *folio_list)
 {
@@ -3280,7 +3256,6 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	struct folio *folio, *tmp_f;
 
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
-		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
 		account_new_hugetlb_folio(h, folio);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9a51cecee547..e402c5ed3152 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -759,6 +759,9 @@ void __meminit memmap_init_compound_page_frozen(struct page *head,
 	for (unsigned long i = 1; i < nr_pages; i++)
 		memmap_init_page_from_template(head + i, pfn + i, zone, &template);
 	prep_compound_head(head, order);
+
+	pageblock_migratetype_init_range(pfn, 1UL << order, MIGRATE_MOVABLE,
+					 /* isolate */ false, /* atomic */ false);
 }
 
 struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
@@ -1119,6 +1122,9 @@ static void memmap_init_zone_device_basepages(unsigned long start, unsigned long
 		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
 			cond_resched();
 	}
+
+	pageblock_migratetype_init_range(start, end - start, MIGRATE_MOVABLE,
+					 /* isolate */ false, /* atomic */ false);
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
@@ -1156,13 +1162,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 		memmap_init_compound_page_frozen(head, pfn, zone, pgmap->vmemmap_shift);
 		memmap_init_zone_device_head_fields(head, pgmap);
-		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
-			cond_resched();
 	}
 out:
-	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE,
-					 /* isolate */ false, /* atomic */ false);
-
 	pr_debug("%s initialised %lu pages in %ums\n", __func__,
 		nr_pages, jiffies_to_msecs(jiffies - start));
 }
-- 
2.54.0

