Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540956;
	b=0WmyqSv8yoX6XJ/P9aVANQtMacq6LrDKrFUx1rUHcKa7jdgAaklm12qP5eqAfKu85jnI
	 Bi/X1WqgEh+FjddSOJiE3rBpIZtwgKRjPuWk89WbVL+hz8S7PbDzQPPBG1/z3eubNYmJk
	 N31dWMBXFvmY6RB/d4aYCgHKGryulsKWk4hb62L4gu3/eR6415L/7aEDbIAd6t149DYWK
	 +0RDUPbB31/L2b/Pgu+jDfUdJm8mg+DutBkosNlCC0MiU3RzgMtu81Giu+c3qc9C9aX0A
	 4823hQ/XCnJz2k0KpA3NUukWA/NCti5ASOr/bf+5JnRLDb4XhtYbs7Kt+4BwD6Jp1yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mTrWbknatFVsI+awgWDkyqVXl5d5IMgRvIrLdIBP3VA=;
	b=aksZhqeRvE6HKOzf60or0Mucdl9Kp6v+13E78+MAZ5HBR+p3h30GPhb3/ufqNFGmsEcy
	 9VOWUaQhHTp0Rh+kzz3RNkSkMrvW45d/skvIfgjl7hDRb6QIichUtN9IXjrFzU8erbHdA
	 MKx1PWWsWS0XowwPesmwSTh7OLZrVdwNBp0SgMMagbAl7/456sGmUpQLkfMDhOKu/FIlO
	 1RJLyU7SbA6Zv3Wl3yGxeP+zkm+M9D2a2a/AP8dU2oMzzJlBcrJg9Cn9QahjHxMitv+sH
	 nI8ZsnFP99AJXc2D97Z6f+1lwtVu0/Rg+PPA/69NuOVy945r4FQW2+KRlvOL9TrgT4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MlbNm1GF;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94521606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94521606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MlbNm1GF
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso324282a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794540955; x=1795145755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTrWbknatFVsI+awgWDkyqVXl5d5IMgRvIrLdIBP3VA=;
        b=MlbNm1GFC6JfwDpLk1o0/1k+wRV1QqZ5U9JysiHqAumyb4N56NdBNlQ7SMHI3Sp56m
         CZHjFv5F51XsrSCVusPH+lv68nie6a88j4nv2gadzb9sEry9pz6kOgsCYHWlq+YRgcmo
         1bzfNnjPBn7Do2xiiB96cHjYmvmFDL4iC9kVMDaqvlLFCXPbNBBk/CcGEObA+4E7V4NE
         05Ij02VYyijiQK8gHfGhlsHDraEYz3kzqrCO5uZcQSzqGEVr9WA6CoRHz0LXIysN5BHg
         5MrXHW0U0LHOLAa3nltNFYg9ChAW27C7+lJT2HLlMkMHbt731ldXZsClgIMx01kBFKG2
         NgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540955; x=1795145755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mTrWbknatFVsI+awgWDkyqVXl5d5IMgRvIrLdIBP3VA=;
        b=fq1T0UFz3IGvzAUhN93Y/RVMZrACPq9OVw0VSJFMt9A6gdWW/mXeHr+1NcUGqks+tQ
         ZnCQdR8KptYm0mfN3z3al2929etbWYbt2cleEDMcrdUa5f2ZKuojjoqRNhkNEyziwLPx
         Lne7MEh9G5WjYuRvIfp2SAEIM197y0NpsqoHFrPx2ojF5TbKFR6Gz1xKlQjWXSnCI+vm
         sQNcd0svRKMJwu59ee6f8WIVfgU01mXVXyelSkwkeUJxlK2ty45XI9eBio+E+6hQbq7e
         2tM3anzU4DtGyK81sI2FVgC3w20g8lOC9Votp7ApcpnCSA86Zq1FE6sKrCtwIr49Urek
         VpNA==
X-Forwarded-Encrypted: i=1; AL+hErE+g5HZeHj60P6xLyhk2l0ACPaZxH+T5N+5OIcmam8jIkWSHNXcFh19xif6BfVKwSxfy/eoThhY2fzIHXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L/OyoG+PQdAKYhdy3u2+Xreiz6dxwaGXIdhj2RmCL80u+zzUG
	zfReQpkHhi3wOBbq0sb7K28O1khYSkWIYaixRK5j1rPGwa2ucedYKDNmNrkpSTuotGA=
X-Gm-Gg: AYBFou3ROTLc4bKY7h/vUr0xr9zfJXf4ZH42fj0AVp18+2wlSTzMQf3xmIe7IQEtWpy
	cPbze+doj/U1L/5TansjW6hT+v9SORnvVMYr23goPoWwqY/Die43f6K0Kd8inSTauGtm9cYP+pr
	nJj1RMaoL8hdO0XlRrKYZJxCtBBvStF3ZVEYj8LQw3/K0Mqv8QAPtk5PUVyBfBr5nrzF2q43Ao7
	av5VPXzT/aqGqJE2ez85baQR/9QdQx4md+4B8y9cQOhK1B41UxiilJeB6zsOeX5Ur+w2AH8OE9S
	3xvphJDTk7BLzhbnR+j3QEG3ERltN+pXBgvzKnJU7J8+taA/kItG5gt9WfK3CjlR0Vlo7F+dRYP
	gyL9tLMT+6O907b7X+7OAWk9vglMtTkm/PG62w3rMUFdqBkhdNqVbWvtNXifNJTiDN0GJnHh74y
	9xWHzBCNIdS5y1+PlvgNeu7K5NITOZk7WWt49gwhGJA2/UE9muJJU0mIx1zflI66tqGJaEXOpi5
	JIFUAjmxq1er8FURQ/QgZ3UrKJlYsRrIfnJMPTG4w8E3H21f3k2J+sbU32U9Vwfr9PAgOacmjhL
	Xi5iKmmMol2choBqMrAp+tqNoOhKgxu2Lpm3FQi4z64eUAozgL4kLQqhP+M1jqK/sdb+/gLwu2O
	gGuRELfY=
X-Received: by 2002:a05:7300:f694:b0:375:fb27:2c59 with SMTP id 5a478bee46e88-37966c4a50emr1738130eec.20.1794540954454;
        Thu, 12 Nov 2026 19:35:54 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2959426eec.15.2026.11.12.19.35.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 19:35:53 -0800 (PST)
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
Subject: [PATCH v2 08/14] mm/hugetlb: initialize all struct pages for bootmem hugepages
Date: Fri, 13 Nov 2026 11:34:36 +0800
Message-ID: <20261113033442.62970-9-songmuchun@bytedance.com>
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
index 3a307bc6db17..2716a83a7386 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3243,15 +3243,7 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
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
@@ -3295,22 +3287,23 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
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
@@ -3368,8 +3361,9 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 	list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
-		const unsigned long pfn = folio_pfn(folio);
+		const unsigned long pfn = PHYS_PFN(__pa(m));
 		const unsigned long nr_pages = pages_per_huge_page(m->hstate);
+		const enum zone_type zone = zone_idx(pfn_to_zone(pfn, nid));
 		unsigned long nr_struct_pages = nr_pages;
 
 		h = m->hstate;
@@ -3382,11 +3376,10 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
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

