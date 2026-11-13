Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540928;
	b=X+BsQ8nQg9DA+GeflciCctX962dGmeR7svO8gCHZNryPI5zX6nvZnwRNtKNBPdqVaOWH
	 snyvcZYKQdQhHinDJqr0BXFCPH8vj88QhJ2ISlXSei8Rp/IRs5M5mcisfFKvFvMQJNZsX
	 VOeBLoaNmULkDLVF4fZ55qAxcfnk+DARQR6uxKToq+xe5LhtxdG1LPL7u3Pbo2VzIKXVr
	 mLCkrEMh8ibY3DPL185/W3izgSnHkbKz7WZazuYe4sywXSbhTOQjWJmPA5dHfkpPvLZYu
	 BcmVBDfazQaWOio9d//mFhom2inwS69GolDN2AMMSHVqpHyTMSaXOyTqEQ6Qa1dqTuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fx9BDQQeKoTDNDbEhBwBM0FWpMS6IvOY7MZ4EVdx3a0=;
	b=l70K9Qo+Ja+kZwwifcJw9a0jtYit1VR/NVa6NPkEohQ28PI8elKZjpJsYP3XZ5TJfIYI
	 GYA8RFdtpSn9SWErm2Ro/U7ToZ3rn70HTmoROG8elhmUHhFPYc13HABqEXVPAlbzrLegS
	 MHRGfpgTKssy219l8WJTcVIgx/r/Ie7D+RcTc3afFWMue6LTx+haTJtQ15gMsovqUAuXn
	 GYdVYH+oXvIwQ2e1SDkmHIokcaYHIaF3ceR0au/opx44EIQhB30Ygx8YqY7uOP1Z12xB5
	 FHTuqkNJN24t2CncsZXIkiW3NxP606NdiZHu1kSYtYRlvAjISlNSWQAUSfOiDgZy4GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XBHclOgH;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1E0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1E0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XBHclOgH
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so854811eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540927; x=1795145727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fx9BDQQeKoTDNDbEhBwBM0FWpMS6IvOY7MZ4EVdx3a0=;
        b=XBHclOgH90pwqFxwUnnRUXMvEWaDS0FBvdmS4OaQnVWZSqUWcieqbuR7qTqy3tUxbE
         uUA2RG93lm5eExZvR/7pipvxot0IV0Un2dYarhsM4KjkU1aF/HdFarjTWtoJFlvseo8y
         8dQZy+ZuswaAeDVKafpf00NHMxwlWWcavt7L4qst7m+MWCWT9GcBAhwgmKJdRVHHJt8t
         CU2vg79rjJgdnQRrB+A2t3LwgV7vdF/RjNuYU8PLrrTlbKuj9gp98ihEI08kHzLDtWEp
         AQM2ESRMbW0JZgPKdTokSABBCOTmqQ18cCgU8XuUaWUw67w4P26BNccQ3t4oqlBZBAZq
         JnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540927; x=1795145727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fx9BDQQeKoTDNDbEhBwBM0FWpMS6IvOY7MZ4EVdx3a0=;
        b=U52rNYR5hmgQEK+sGmtSktf5aEECDvD5ZCjY9+KN20cv3Fdi7IId1Mn+dWq2531NBL
         LLdpSRGOzSBNnDZKeRzpUZNMcI8wgG1EtcCrcEJssnfr3j/apAPdUR8f8os9YpG/fUVr
         U0MA8mQiBlJyjJYtUd8MO2pk4zG/GBgbSdYCC4whXjwjv4TBLRVVj/NxcyaluJG4/x7L
         cV2FexsFcBiSTTgA3L/hr06F+l4xfebzB7AqVzUxLYi7lu4wHEUh9WLMGj+QVvTfvhgq
         b4SoJzcBhsyBZp2BB9vZXP61v98Rlzpwo0VFMLlpc3dnOQ69KaM8prHT9YjA3nUl8B9Y
         +KUw==
X-Forwarded-Encrypted: i=1; AL+hErHr2DZoouRXiCZQEJRzTelbnNqlhJKokyzqRXKCESzt60YGuDbqg6DmsirjPUivdgVaIqwZHvBgEKKODcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l42Y3MEBz8SLjKzvpoSzq4wNb/mLrGwTJFoFVPk17rCrD2AVA
	3SYffZp5njvUZLiFvSeJUUKV6MhnLKjuRV22pYKXGvfhqPaeVVuSYIeZRuPP2T51JlY=
X-Gm-Gg: AYBFou1nc8hE9J1+6N42M6wR++q+inMC1LyebmCDkDbQgiJ5ew+K3tl9Z247KcencOj
	rDFPEa5DvgKJTX/uyrYfQBBBNrKi9WYtcq9OXn2JaRp9kEhBsHghel6K3wQpOl9BpjNDwaU08Wj
	HdrlO6gM1FjYg1lGwLpdfthsTZa0NSQoiXxr/gx7EhvuCCfOyQrgfGdN3Y9CgUh5e4DHSgkdPn5
	2MZGxJpwmZ0E0yaNJRlVL56p2TGqoQSnLGT+8pdEeMivaKHmr25vWBtBT/jHJFdewTN7z32nRoX
	ofnLN+m8Ta8rRRKOT0Mtsj/CEmlFCSqKWgDkALBb3D6a7r5QbN9p5Vs2C55gqH3Zc+h/bF8EzGC
	8Mq1TiIcS4hBxmEmEO+i4/9QGFIw19Pwz5Tvu9+B10hVf/aS8hRW191z229VQ+UpSmW0xKnT6ON
	+lRYkeHG8o9kgfn7tszSeyZmsrCvmGmLimqX24TKf+xAr6J1cH55BTlm5JC4rYbydQyhf8qmxWp
	6VUiytWuS/+GIuVhhWgtGOfpqZXljqmzw7wIkzAw3S1vQgYbNlBgk7k6gS/PPC7U1yR4RWYkDI2
	IoOOz0fciJ+j+I17/Gmq8/yzcKAp3mngug5NixEyH90P6mV4FPftM7tMiLU35Q==
X-Received: by 2002:a05:7300:d58d:b0:36f:9d8:4a33 with SMTP id 5a478bee46e88-379675071a1mr1169403eec.31.1794540926434;
        Thu, 12 Nov 2026 19:35:26 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:25 -0800 (PST)
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
Subject: [PATCH v2 02/14] mm/hugetlb: optimize bootmem hugepage tail vmemmap init
Date: Fri, 13 Nov 2026 11:34:30 +0800
Message-ID: <20261113033442.62970-3-songmuchun@bytedance.com>
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

From: Li Zhe <lizhe.67@bytedance.com>

Boot-time HugeTLB allocation has to initialize tail struct pages itself
when HugeTLB vmemmap optimization (HVO) is unavailable or fails.  For
gigantic pages, this can cover a large number of tail pages.  Most state
installed by __init_single_page() and prep_compound_tail() is identical
for every tail page in the same huge page; only PFN-dependent fields need
refreshing.

Initialize the first tail page normally, then initialize the remaining
tails with hugetlb_init_tail_page().  This copies the already
initialized first tail page with memcpy() and refreshes only the
PFN-dependent fields in the destination page, while avoiding the full
__init_single_page() and prep_compound_tail() sequence for state that is
identical across tail pages in the same huge page.

The fallback path was measured on a v7.4-rc2 base with a temporary
jiffies-based printk modeled after the existing timing in
memmap_init_zone_device(), using 4K base pages and 64 boot-time 1G
hugepages.  HVO is unavailable on arm64; on x86-64,
hugetlb_free_vmemmap=off was used to exercise the fallback path.

  arch    base      with this patch  reduction
  arm64   360.8 ms  256.0 ms         29.05%
  x86-64  171.0 ms  165.0 ms          3.51%

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 23 ++++++++++++++++++-----
 mm/mm_init.c |  5 ++++-
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 88c9aa700533..ed3af959f615 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3266,6 +3266,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	enum zone_type zone = folio_zonenum(folio);
 	int nid = folio_nid(folio);
 	struct page *page = folio_page(folio, start_page_number);
+	struct page template;
 	unsigned long head_pfn = folio_pfn(folio);
 	unsigned long pfn, end_pfn = head_pfn + end_page_number;
 	unsigned int order = huge_page_order(h);
@@ -3274,11 +3275,23 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
 	 * we must initialize them ourselves here.
 	 */
-	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
-		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail(page, &folio->page, order);
-		set_page_count(page, 0);
-	}
+	if (start_page_number >= end_page_number)
+		return;
+
+	pfn = head_pfn + start_page_number;
+
+	/*
+	 * Seed a template from the first real tail page and refresh only
+	 * PFN-dependent fields before copying it.
+	 */
+	__init_single_page(page, pfn, zone, nid);
+	prep_compound_tail(page, &folio->page, order);
+	set_page_count(page, 0);
+	memcpy(&template, page, sizeof(template));
+
+	for (pfn++; pfn < end_pfn; pfn++)
+		memmap_init_page_from_template(pfn_to_page(pfn), pfn,
+					       folio_zone(folio), &template);
 }
 
 static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3988c19699bc..639880afe0ee 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -720,7 +720,10 @@ void __meminit memmap_init_page_from_template(struct page *page,
 	if (!is_highmem_idx(zone_idx(zone)))
 		set_page_address(template, __va(pfn << PAGE_SHIFT));
 #endif
-	memcpy_nontemporal(page, template, sizeof(*page));
+	if(zone_is_zone_device(zone))
+		memcpy_nontemporal(page, template, sizeof(*page));
+	else
+		memcpy(page, template, sizeof(*page));
 }
 
 struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
-- 
2.54.0

