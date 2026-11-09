Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218347;
	b=tCS3+pX4Sl6kM0ATgfhDzJtTVK1SMpiJSFH6ktqacRac1wl45ZhiIh1UVl3GJMRQwkjd
	 DcYnIww+uX9i+mxIuSSkP2HKYOyFmO+7WRJNmGq0032VngJCuDozQnX9tKN/r7lmhDm/9
	 UtZ+LaRu/gAnd4vIR+3Gh0MduL6bLCFKRE1O0hrThFBR/mwBS/dAioO9GU55lGD7ZNqtP
	 vr0omoi7DhZqe1PIwbMzueWw02FQ/VfR7csHkZjdzEZFDchTO57bl3T4jHth7qaB9z0xj
	 Ts9O0sagsGLUpOBF6o7cS4nZmaTiQmnps4Wr1VvZXGPbNhwzOHZ33+2domSUt/YVgEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YPiscvubWXhHlJMFPIJv7vibxHEUj/a3SUt82Fx330I=;
	b=MWBufaCEEf7p/2naUdTSYn9xmJJviTzKDQibKo5dLEgO4Ml2rOeKfrrAcWMWGbh8fYhB
	 2O6WNvCT3Y34RYPTHFYwuMloGgMEEZ9dilUbTPhg8YXkB0Nu0iAygqp/Wd6rUvy6yorGR
	 w9+9U8QiVyXkDX3benupo5zWzuk44x8SQ7SeIZQntjT8SQ0WwjhapqRwPyEDGwiK8ll4y
	 fmj7Q9RiUCldCKEtWPQy2BCZFN2l6EYbUlea5OpaJqDOttOdG1hzNsr8CoJ8+ryOl8IsW
	 SKLUnhtk6Mj8fJ9F6S65ZHFe40nOQ82EVqnJ6DavOV+Gb98a4RRKHxcvvg4RWKLrSKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Qp6BZpI+;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE5606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDE5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Qp6BZpI+
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so673309c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218346; x=1794823146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPiscvubWXhHlJMFPIJv7vibxHEUj/a3SUt82Fx330I=;
        b=Qp6BZpI+J7e8jhrIm2GxdjPSKh7BuE5glUln43KE57gCJLDI9ij4ZqcnulI6txX1b+
         EKNvR03rHEbatbJIsB/y2qR77rpBVMiMPuIClRFPr7wjSIVTyX75HnGMQhUoPDCcG1sb
         0Dgkf2FF0q1K3A/MqZZvWVFJ2SxQuAu8uFSn/nITWmUAJ6lt7FEDKQ4WSxjfI+Y0tvcz
         RxUitAj4fP9lMxzkxeaVPk6wMwoC23gAzpsTCGfG4X22+X1osy6ban/FPcwk1hJ29dRJ
         NNqN8/oolZXN5IN7TJ6wAl8jw7CwNQHZOvJ9rcQwY4VAPnfXEfZ8ooqwlhg1g1IwxAvo
         Qxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218346; x=1794823146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPiscvubWXhHlJMFPIJv7vibxHEUj/a3SUt82Fx330I=;
        b=RPGiatwRYHRQY2HrkzdMloStkRr/vdxwECR6OB1E675PfsSL6ylz3GXvzeih4A3ou+
         PBRnuPDDqU/jetT3x4vFuuDUgVUeQ1KzeyytRqsgh9ZeGE1gfs919dySuyo6g9S8c8jU
         HqGz5fi4W8IFLoNzFbQHYdacQxv2/FHJzKi3ZIdStWl9vMGitmSYETCNHoZPj5wC+cG8
         C/OB8TUFaM2htxhmyirjrbMx4Imwu/hwyY+ANxM1rWlUV+6TRkqt+abZiVMmU4sFmYHp
         nq+G0imq9YC5o2uGj/wscmVdOGD4RqB0QsQdK0ZZiguN7m9uhFfna1y4QLivsXun1wPv
         OliA==
X-Forwarded-Encrypted: i=1; AL+hErF3LI5eyvMjspBwza7TJkNpjYDqz72x0Ury3Q8xEq/7MupjLeQ3FN0hofbrPLq81k/P90b2DNfLGD0eN3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b/dD0MhFc+FJK4EGhF7t+jZF6Ca0GEMQV7bg0PRD09MzL/1CR
	mFpajfbTBaTU9c8dGhtS0TSsV0qsqXdGSVCbpwW63iG2qJbCU7VRM/KIsC/J1AhTtEA=
X-Gm-Gg: AYBFou2F8Wqo0hwvAS9xAG84NSFM9zZ5zBEAQg56JUAV9nqBTZdQg+hnx9YO7yKej3b
	ouFm/UNuNA3+3Eeva33f3lPQtOuq468F8MHTNWD1IBOntzB6xVNfy7lyZzafcfWMiJk7CqHaCih
	kp9DFgoKpmoA6Dt+cgbYc8vjVoYnd1L4dcDDknuWsu1wR6M2aWcwVrE1puVq3jfMTpejFrRm+WV
	2HMQR3cd0la3KFBSzQmqW4IzsiZsXfUEqM0bhYyu1Q3nft27qS/y8//FZ+3FvKS0t6dvCysU8s0
	yc81b+iy/YH9whE1GK4pC8/XM0VpVqNs481lbJT7vjIPxyNo1ej+QrPtY8ezowV55cOs0hML68x
	/pA4hp2wmltDvybRVgopm7dGKTr7sEDHapDrJj64VDqr2O1m6sXziBtUpS6QgzGn8SJz3dUGW9a
	1GY6ZRLe+3O2FCrB6ci2CXAzgVslegRk1n4Ozew9acVPEKgEsSM2+rQCmiMgTjSzA4XNi4hlSWe
	00dwNIvenspbE0M7Zw5BTiUrdCZv/qNk8OenEMgrJZfmdZPZfFrLTiITJoM/Tl7x3sReu390Yav
	hectOMM0hidz9bzz4gKl0LbclR6DfeZtYg66nE93KkQjD6KDwBrk71mT7beJEg==
X-Received: by 2002:a05:7022:1505:b0:1b2:cb38:5412 with SMTP id a92af1059eb24-1b39fed4847mr6729682c88.42.1794218345436;
        Mon, 09 Nov 2026 01:59:05 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.59.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:59:04 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
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
Subject: [PATCH 11/11] mm/mm_init: move pageblock migratetype init to memmap helpers
Date: Mon,  9 Nov 2026 17:58:06 +0800
Message-ID: <20261109095807.41547-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109095807.41547-1-songmuchun@bytedance.com>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
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
initialization helpers instead. This makes memmap_init_page_frozen()
initialize the pageblock for single pages and
memmap_init_compound_page_frozen() initialize the whole range for compound
pages, so the ZONE_DEVICE and hugetlb bootmem paths can share the same
initialization.

The old hugetlb_bootmem_init_migratetype() skipped CMA folios via
folio_test_hugetlb_cma(), but the shared helper always initializes
pageblocks as MIGRATE_MOVABLE. This is safe because cma_activate_area()
later overrides the migratetype for CMA pageblocks.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 25 -------------------------
 mm/mm_init.c | 11 ++++++-----
 2 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ee47a3b09df3..5dfe9091b5ca 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3222,30 +3222,6 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
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
@@ -3253,7 +3229,6 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	struct folio *folio, *tmp_f;
 
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
-		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
 		account_new_hugetlb_folio(h, folio);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 61a720bb44dc..e05db8abde2f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -751,6 +751,9 @@ void __meminit memmap_init_compound_page_frozen(struct page *head,
 	for (unsigned long i = 1; i < nr_pages; i++)
 		memmap_init_page_from_template(head + i, pfn + i, zone, &template);
 	prep_compound_head(head, order);
+
+	pageblock_migratetype_init_range(pfn, 1UL << order, MIGRATE_MOVABLE,
+					 /* isolate */ false, /* atomic */ false);
 }
 
 struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
@@ -1110,6 +1113,9 @@ static void memmap_init_zone_device_basepages(unsigned long start, unsigned long
 		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
 			cond_resched();
 	}
+
+	pageblock_migratetype_init_range(start, end - start, MIGRATE_MOVABLE,
+					 /* isolate */ false, /* atomic */ false);
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
@@ -1150,13 +1156,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 		memmap_init_compound_page_frozen(head, pfn, zone, pgmap->vmemmap_shift);
 		memmap_init_zone_device_head_page(head, pgmap);
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

