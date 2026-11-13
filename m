Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540960;
	b=WpaDZv9w+Veya59xn/zQDjv0pwtS9E/IjFqytqWJ+xSbUbHH2f0H6nOLPwAM2M3GGgQ6
	 SCsN+q0SV/LergSp23bGKKeWvyjyT84M4hP5vYaw6HZQXcwKP1fWIBGEPVJL3+l+mKte3
	 OfwFI+bg7vMZk9V009r7rz4mgaHyFxSX6NsLQLY5ZAB3iUdYUAcP66wlIfkpjEg+TJWyV
	 xV8wKsIJ102n+Ho4U5RyxkWug8ayHH+FULwvFEM9DsuhFMFLMDwbiRIu6NCn5YGdYi9hZ
	 qUWIVDW9al7UD1gHWqRxjwtsjQ4kmh9AiwRGJqHvaYMZCHOUTYKSKQlWRnhISppGAZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cbR+hSewc7EqaRywLF99e8RUZ/FL9vDU2C+TKhD5kQc=;
	b=GuM2uzlASMpj39/0eE6xZ3rA+57eoHp/NgezccGQg0yJgJd4n7iR8OkqDDo548rfRASR
	 Uhryi0K29Fo7QBNBmLMcYKHWzmN6nnLdvR1TkU7il7rTDYLCtnwiAhT7KKHFItWJefCsm
	 CYaPxtbvB2+zTsbR2M1qckPFARIuB5UaqpkIWIDFVWdgjoaFE5T1Ip/Jgajkg4bw6UCdy
	 6K+2yEhltQ/k1Dd5ScwtWebKJiT+1zWJnIHiYQogM99WKaHeSiqAEDGRXKwxQ1OuO8Rba
	 Xg+N6Bn5KhOzDCCY9h+F5qDCsJLudHbB3sLal/hswui816cllHSNmavKGy3vf1Jw11A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gVX8E0fH;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EA2606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EA2606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gVX8E0fH
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37198ed3727so1887036eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540959; x=1795145759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbR+hSewc7EqaRywLF99e8RUZ/FL9vDU2C+TKhD5kQc=;
        b=gVX8E0fH9H2VTdtFYotxFZiNjkiGwebqv//jnqJzmHFG4VfnxsUq4fy1zcfuvioNxO
         5ChLskAHnn7bWd4WvWrkzsMTuthnOCG11+h25jSBfeXbemCDvaNOz6m/MtvzFd5MPwFB
         /rECsdWbma+9vHuxJoFbM+255KCfLG06wLv4kBWVOkAGrRSxd1MWc9JpA7BquBRe3rsn
         CBE4qOkLpn9wqyS/U6E3U4VcZHW0S5icVPYYJkIEGStTh9/QErA4j9RUTMFw9f5RPaoP
         V9bruKloSlPFMceqOSlU8T3V9y0O8Ypy5dme1Om3kMEDolnDcNkVvBwsHiocFvA2k2Jy
         njKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540959; x=1795145759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cbR+hSewc7EqaRywLF99e8RUZ/FL9vDU2C+TKhD5kQc=;
        b=PQD3sQV+gyqVEf0Oa64H1sa/LQ3SQturRV9r98v7/FGwEXOM+uVMQVmFnyh6/p/OPm
         LYf8gnlPq+Opp4VFJuKXtkKxOZSle8949G5N6uJiuFEebiMt7K4D9Rdgfs+GxGha5xak
         Lz8RSiKaLoO4siSm3cMe17zFbBqGDpDGYCfmbZH8rgZv8+ug9pe+X+pTc61DYADX+Xrs
         HF+MNcHK1li0JM3M9G9fwtEfvdBsagWkFRHhli1qYnOuEjYfWfGSNXic0gKGzcR5SrB8
         sfyUWaIbodJuRfiEFrs81DowbBeLobbIkcP6u+r0sHxhsbDZ4VjsPgFI6cvkogbNSUDb
         mWEQ==
X-Forwarded-Encrypted: i=1; AL+hErHA81IJTtpwNXQNwmXHZM2KOnkT78ZcvqBi68rF7o0gFTkv+uWx94AusmJWMY3toNOAdPZFsNEktVzY9w0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QmfQCZ0WTDMHN6LizG24fnLteQU0ntiCJ5R+fjZ1OYOgJzOtE
	md1ebz9tpsf0b6eJcGv01cssNJc58+Q8j4BR8hmOLKThDldqMgjCoF5DjTjjRGHzzLk=
X-Gm-Gg: AYBFou3hDdCT24wEQFMcSAmQvMOLT4SCBPczUqamAp+wzb6ACiZ/SFx8/B5A5Z2l4V0
	yxfY0PqncfoMbCma4tPxnvL39vdbbBaQLcy3PnMliKPgw1KTUyr495B+BUxYWn7QdnQLpd1NQx3
	Iq4G/YkTyKBqdn/dN2uRaMZ1g0s1zmsCr0u7+6uZTQ0M9rCw+FGq0n4aUBFsto2ITwiCf7BK0kM
	Z0xTKffaAwkd5bnPJCRTDwh05Er7SSfnqs4JJ9szdUDxqpEDFiIuFtjIv82vG9n4IfS/+AyGv4F
	vMYVMq2cf7a7wtRaDu1hWTtyB09BZd2rqvWiZxvvoKsBvbM4hnvIsKYCE2yts1s6yTXY62sVwdW
	RiQEKvITO6+yxhdutu2VHKWYEaXQLagEBBLJtnRfNeElTvgYGA4XjlpNupj1aa/uB8lDSEG8fkX
	sVHNWI8GwmH+tvplNvWUX9vMm8FYojtbC17XdpxDpCjyOd5ASGcvhrPxX8wHcz1SHHVpSuGoY0V
	hV5Sx0s2Xmd6NgKWXcmXtqOxEQVPcsvnbWFVtZ0Nc5ahOrlAPCVsyhg+4xu8oXTL9zKfaJrSEIz
	XHJ8CKRTcPV9hLC1UbPkiuLjHHiA9GU4qAQ/JR6H/EL7k5hRkZh3VqrHnwCB2g==
X-Received: by 2002:a05:7301:182e:b0:367:a092:3c73 with SMTP id 5a478bee46e88-377e1016111mr3830599eec.12.1794540959040;
        Thu, 12 Nov 2026 19:35:59 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:58 -0800 (PST)
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
Subject: [PATCH v2 09/14] mm/hugetlb: use common compound page initialization helper
Date: Fri, 13 Nov 2026 11:34:37 +0800
Message-ID: <20261113033442.62970-10-songmuchun@bytedance.com>
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

Boot-time gigantic hugetlb folios open-code the frozen compound
struct page initialization across two helpers.

Use memmap_init_compound_page_frozen() and remove the open-coded
helpers. This keeps the initialization rules shared with ZONE_DEVICE
instead of maintaining two implementations.

No functional change is intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 65 ++--------------------------------------------------
 1 file changed, 2 insertions(+), 63 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 2716a83a7386..6ee36ca5f435 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3249,63 +3249,6 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	return true;
 }
 
-/* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
-static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
-					struct hstate *h,
-					unsigned long start_page_number,
-					unsigned long end_page_number)
-{
-	enum zone_type zone = folio_zonenum(folio);
-	int nid = folio_nid(folio);
-	struct page *page = folio_page(folio, start_page_number);
-	struct page template;
-	unsigned long head_pfn = folio_pfn(folio);
-	unsigned long pfn, end_pfn = head_pfn + end_page_number;
-	unsigned int order = huge_page_order(h);
-
-	/*
-	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
-	 * we must initialize them ourselves here.
-	 */
-	if (start_page_number >= end_page_number)
-		return;
-
-	pfn = head_pfn + start_page_number;
-
-	/*
-	 * Seed a template from the first real tail page and refresh only
-	 * PFN-dependent fields before copying it.
-	 */
-	__init_single_page(page, pfn, zone, nid);
-	prep_compound_tail(page, &folio->page, order);
-	set_page_count(page, 0);
-	memcpy(&template, page, sizeof(template));
-
-	for (pfn++; pfn < end_pfn; pfn++)
-		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
-					       folio_zone(folio), &template);
-}
-
-static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
-					      unsigned long pfn,
-					      struct hstate *h,
-					      enum zone_type zone, int nid,
-					      unsigned long nr_pages)
-{
-	struct page *head = &folio->page;
-
-	/*
-	 * This is an open-coded prep_compound_page() whereby we avoid
-	 * walking pages twice by initializing/preparing+freezing them in the
-	 * same go.
-	 */
-	__init_single_page(head, pfn, zone, nid);
-	__folio_set_head(folio);
-	set_page_count(head, 0);
-	hugetlb_folio_init_tail_vmemmap(folio, h, 1, nr_pages);
-	prep_compound_head(head, huge_page_order(h));
-}
-
 /*
  * memblock-allocated pageblocks might not have the migrate type set
  * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
@@ -3363,8 +3306,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		struct folio *folio = (void *)page;
 		const unsigned long pfn = PHYS_PFN(__pa(m));
 		const unsigned long nr_pages = pages_per_huge_page(m->hstate);
-		const enum zone_type zone = zone_idx(pfn_to_zone(pfn, nid));
-		unsigned long nr_struct_pages = nr_pages;
+		const struct zone *zone = pfn_to_zone(pfn, nid);
 
 		h = m->hstate;
 		/*
@@ -3376,10 +3318,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		prev_h = h;
 
 		VM_BUG_ON(!hstate_is_gigantic(h));
-
-		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-			nr_struct_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
-		hugetlb_folio_init_vmemmap(folio, pfn, h, zone, nid, nr_struct_pages);
+		memmap_init_compound_page_frozen(page, pfn, zone, huge_page_order(h));
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-- 
2.54.0

