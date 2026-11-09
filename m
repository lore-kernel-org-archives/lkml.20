Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218325;
	b=gQTVeYSeDg/AHBIrAJZEwXE2PGWaanMHzpP6t2UZoEqmfTKsz26b/BDTxn/mRbyGJQmB
	 DMfFGWurzDmwXn4PiFQ6JGYXrcwFGLRn70fu6agQkzHaeLgDDqO12VXlwLlSRJV257y7z
	 6IBGpne1Qc8ZmwnCKkOyKdAn6LXuftzJELJN4ElDFHFxass6FcNiqDLs/ElQ0JV1WKse3
	 qRYBrLy5rcEFvkUPFUk8ViZw5p8ALZPIEZNmFXbwRDeaol4XlqwMRHyMbQm7+siKpxJiZ
	 LCZ1uBM/HQAeSrghHyIkbRH3Hmmyen1rTeA43nAQgR3chA9QP21i+e/AOqdYT9uH5cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4rgpk92s+uUA0iNQbnwRD1KF0Q5tk5w5GCL0hUC4RNk=;
	b=o2IZn3h0S8FXZLUB+7pWEXOMPLZK4tr9BHm9rv/hrz4GwD1g3VW/fGOw+pZSIrBY+Yfs
	 zz5Fu2Ajxxpie6hgxNkERlwC5YSZ0JtNP5ctiop3i6i1sSvOLMZrlejNrEdqkXE5k+N+H
	 g0oGqz87SGBlTshgm5HcDKYs4G6D6Ya0NtSnmNpmCJgybirv+xfXhteFPcDJWCFN13XmA
	 4fAHQKBKM4dVceIkhoMOArSV1K/MuucfeHj+vztzfkvDqzUXXVVCD99W5rmNgU10/kyyk
	 c52GmPGRkxnYsTnUZkkZSOBM4RixRr3C23aIiXKRaq3lsvIp4bqFEbYI8PrseXFfwMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=df3Em4wW;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCD606EE8E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7FCD606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=df3Em4wW
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so672997c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218324; x=1794823124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rgpk92s+uUA0iNQbnwRD1KF0Q5tk5w5GCL0hUC4RNk=;
        b=df3Em4wWC4kCdN5zZz+GN6jW2ZdHa7KSL6Ltg+xSu+7L/5KfVXMYKobVlu3JZxRwv5
         A/TUJLRDnx0mFI3oPFGq+A+gOgsdZAWarQ6vuHp5m3l8FkfERRbRlcqKXMtyW0jVGgzo
         6drTkhVj19J5IeUvXH+/L8ETQDMI6EIo6QHyhfiRcy6g90xGyYOqbqstYsrQKjmxedfk
         zFfWrpkNV7LRGAooHlLaU+OYd9XcW2y1FqYlMmKTSgtDE/RU6St/nHFYJMmqCeLmvJxF
         JJWIoOAhNWuppivCS9ccwqAiHWDtx10L5raQhaqb3hfndcamhOMqqTVAVGyG4zRfluMn
         ghaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218324; x=1794823124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4rgpk92s+uUA0iNQbnwRD1KF0Q5tk5w5GCL0hUC4RNk=;
        b=k2nvW5+1DHxa+opHgKnT5+qHIa472Biwktx3xcvOJkWmqWwl6Rin4+WLFMFsHi6QbS
         SqC1CfkMW8tGD86dP+YQddxaOETgssK0gx4i5awjOcGj4zyg0FbJvx9OpFQidZuuvyXx
         5vbOV2J4qg9yJhgocYbWDkrIimewx0FmxZ/5GyLYxX5q4tKKHtF+cMejkehJQgUMjoTP
         v29U8z5YgSOlIQAAHBIqFoXX77wbEuxQ/2hMN/wRtZmwCt3EmPzs3qNRSAYR8BCkC5rZ
         OOFljbCzEe3QS8nsAYmN/+qZMFjq/BT47Hf7PzpZloNgZ0W888JJb/RBlMiD9aiwF92K
         6luw==
X-Forwarded-Encrypted: i=1; AL+hErGF3S+IAVp9xoRoZ5TTV4/DgRaVDCipdriTr4bQkUGM27wsuzj6fSSxx1N36snYkp2aI0pGhLU0vWDa1as=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PGPx2RfxRvyyPOZyLd6mws+L7ZwswXxfltGnw4wxkm+HxsZ/N
	qkbn8reG2Cn4Se1yZYkigWSqvOVp6Jw68dkvCKcUPr3BKg6UPWBY0tf2zRVGdLejd6A=
X-Gm-Gg: AYBFou34ePhCkGZ/AYNqXLZOYr6xC004hpDwVNdowrQFD35+GmFB7V6qG9XyCYFs4Gq
	F6jdDD6RZgkjGClrOczalybHItPGcSv0PkEFzbfB70HXfBHVnZl4wp14PqEChW6sWNPbU4TeqJM
	5Aw5iIZx3U5Af5LOTIDAy3E8W4LxapRrFxX58mV4hfAcXdA5xZ3s09JTwVlNdsVoaojNsNzudqb
	E2Bqs79g3NEwIvagjjysaHeBGplXqVnNn9rogOaHgruEupN/VrLrFwPJEhhpTmLdaN/S0gTbVUi
	XbYqOKmCi5hu0PgzpspOHddnH+405KZOcHJImxCmcvp2KxBcfg1UQiUJpgO8GZy9T5FSphmtgg5
	6EkfhytzabFp2NkGUMd2EXkrMdw1jQulWeNvf7LVuvOJP/o4R4N8U0rr7/KOWOy4odRQ3K5peBv
	4NtRIzDJ+yF3RS9fNziVCmU2W0RVSeSDeSumOCJniC0hdJGn14BA+hWmJlZN7yYUBf2rAS9uNgc
	5z6vyCAUbLHH01FXsgSPnxZZvZPB1IvwQojwgEKAOj11D77dL2KObZCMyPHixmXlXNDL+DpRLRk
	RGUJUxOknZZPg0DAWgXGmXEY+x82FGxshQ5MnaQ7rCAek9dmbcF3tst2s5F7gA4=
X-Received: by 2002:a05:701b:450c:10b0:192:fd91:c567 with SMTP id a92af1059eb24-1b39fe87361mr6354138c88.11.1794218323426;
        Mon, 09 Nov 2026 01:58:43 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:42 -0800 (PST)
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
Subject: [PATCH 06/11] mm/hugetlb: initialize all struct pages for bootmem hugepages
Date: Mon,  9 Nov 2026 17:58:01 +0800
Message-ID: <20261109095807.41547-7-songmuchun@bytedance.com>
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

Boot-time gigantic hugepages currently leave the head struct page to
the generic memmap initialization path while the HugeTLB code
initializes the remaining struct pages itself.

Mark the full hugepage noinit and initialize the head struct page in
hugetlb_folio_init_vmemmap() as well, so the whole compound-page setup
is handled in one place.

This can also reduce memblock metadata overhead when many boot-time
HugeTLB pages are reserved, because physically contiguous hugepages
can be covered by fewer noinit regions.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ff6f837b6df0..d2aaad235458 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3216,15 +3216,7 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 		list_add_tail(&m->list, &huge_boot_pages[nid]);
 		m->flags |= HUGE_BOOTMEM_ZONES_VALID;
 		hugetlb_vmemmap_optimize_bootmem_page(pfn, huge_page_order(h));
-		/*
-		 * Only initialize the head struct page in memmap_init_reserved_pages,
-		 * rest of the struct pages will be initialized by the HugeTLB
-		 * subsystem itself.
-		 * The head struct page is used to get folio information by the HugeTLB
-		 * subsystem like zone id and node id.
-		 */
-		memblock_reserved_mark_noinit(__pa((void *)m + PAGE_SIZE),
-				huge_page_size(h) - PAGE_SIZE);
+		memblock_reserved_mark_noinit(__pa(m), huge_page_size(h));
 	}
 
 	return true;
@@ -3255,22 +3247,23 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 }
 
 static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
+					      unsigned long pfn,
 					      struct hstate *h,
+					      enum zone_type zone, int nid,
 					      unsigned long nr_pages)
 {
-	int ret;
+	struct page *head = &folio->page;
 
 	/*
 	 * This is an open-coded prep_compound_page() whereby we avoid
 	 * walking pages twice by initializing/preparing+freezing them in the
 	 * same go.
 	 */
-	__folio_clear_reserved(folio);
+	__init_single_page(head, pfn, zone, nid);
 	__folio_set_head(folio);
-	ret = folio_ref_freeze(folio, 1);
-	VM_BUG_ON(!ret);
+	set_page_count(head, 0);
 	hugetlb_folio_init_tail_vmemmap(folio, h, 1, nr_pages);
-	prep_compound_head(&folio->page, huge_page_order(h));
+	prep_compound_head(head, huge_page_order(h));
 }
 
 /*
@@ -3328,8 +3321,9 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 	list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
-		const unsigned long pfn = folio_pfn(folio);
+		const unsigned long pfn = PHYS_PFN(__pa(m));
 		const unsigned long nr_pages = pages_per_huge_page(m->hstate);
+		const enum zone_type zone = zone_idx(pfn_to_zone(pfn, nid));
 		unsigned long nr_struct_pages = nr_pages;
 
 		h = m->hstate;
@@ -3342,11 +3336,10 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		prev_h = h;
 
 		VM_BUG_ON(!hstate_is_gigantic(h));
-		WARN_ON(folio_ref_count(folio) != 1);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
 			nr_struct_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
-		hugetlb_folio_init_vmemmap(folio, h, nr_struct_pages);
+		hugetlb_folio_init_vmemmap(folio, pfn, h, zone, nid, nr_struct_pages);
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-- 
2.54.0

