Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218320;
	b=W6/PsPlCA5lMJC+R94JPKX+sT4J+yVDNCkg6EHPV9jWaE+ND7fZ25/JzW0KhHtrv3DHs
	 QgacsLipHPALTuUZOB+TEmyZMJ7+mc5UAecQEAk3J2lgu1XXvtyjU6DtrhcqbGgTV9+gD
	 9IH4YKZcMun7Xw3kukIcekg+2dykr+O2C24CQGbCKA3udwlqs+0S+r81WutwmwReTGiqo
	 ZmqKj9Irotr2vvjTJHdYIfs50i5qgosIC4GccgKe81V3Ue/bhX3dJLxlRX9eyu6+TgV8s
	 YsSvhwen/5pTS7BVPZtEoNUlqKKv7UmUPq/O8B+RH2Po8nCXCMRAJaaaKPmXbbvlF8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kx24bYSuwimQQDmmD1Ej+/DYmuScFRik6OAh3kEd/h8=;
	b=Zvmz8xq4bt1ERLMu5YIki+iW/o/DVWc6bfAElZ1Whx5qDEHwL1IIIavQ13CcjUBD4jPq
	 a1RRBmRwVVv3u1IotrfXcfCJCDdCcVT18qZx6aYXdZ2PpnLFnsbsn+Myyub0ri56RVsXM
	 YOimMoiymnKdm3nihVhve77HonaK+DAkBqZRdAksbx8/oBWhQCpJxvVQt02boZAzJg0Gy
	 ZoOqvEVUuJcTR2YCgxYlGZMvWuMGhuXn8gn+SDKUXd4QV2+hLf2KYkg+1vu8RYSZ8boJs
	 6YFuUBldKy+5N/CjJgtB6yA33IAMixYN1rPYKjUn7zwG1I3cU1oUCEQpu8hMi92qgWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DqmNMmOA;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F40A606D807
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F40A606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DqmNMmOA
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso99396c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218319; x=1794823119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kx24bYSuwimQQDmmD1Ej+/DYmuScFRik6OAh3kEd/h8=;
        b=DqmNMmOAom9DkVYO/araYHmZPrxPQOwtvpbWJMbYP1KrMYYUd2+m8KD+3FdrNWQsCX
         BB89tLsm9MG+zNiLQf+UKfub6/8Gy8a4slM4lxGEj/+7y2K0DUGjsrF+kTUBipECAOwH
         RPpBMHNHIzRFQq/4SMSci2PfcMxE4bEwXit48P5J9WCcB5OH+UHWagQ/R9LC2hhZoWn1
         2IhC6Xeg8C61fs5N5UhysRnNZPy9mrs5H450rT9i+WlvtxoXlQaGXGRN8PwaQjPbI95r
         N2mGktkr3cuT5z5jUGRX2NYK/3IMTXQC8iOxjNTmz26tAxG5Zeq1Jts3ePXY4DaAyuE5
         KXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218319; x=1794823119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kx24bYSuwimQQDmmD1Ej+/DYmuScFRik6OAh3kEd/h8=;
        b=BDaus2b7gVZDQPOlLDqbtRC9vmIiM0sQsy7ftAkD4Zj5XuDuKOSjD6ditXKXgkVV7F
         YrT5oKYysdCQyqGJRIXoa9MVhUU9xjfv9AsFLl/UmdXP+zn4bSgYlN8D1Xu4JUOJHf25
         8RQtbT8sSrTgOALs0saFK799z+/K48APjkvOuJQm5vF3mAWpX0cdc9NpTqgWKSvUA2RL
         zmdsUpmEFM9W/2tVXg7gM5V9jS9owM8Ne7AuMtv+KYBPkNQVBOtDfwCcYdY0DxZGyfnT
         QyafqA2ZRA7OPRVdXeq1EMuuixLAPi6SvdgihhhK9QPYpgYTbLojToiStpzSYqLXYu4I
         H/Kg==
X-Forwarded-Encrypted: i=1; AL+hErFY4Md4mtecHaM0gJ1bYIyQNy+7WRohUvfLsG7rX4Up38Sm/9iPTHvOzJkGXVs8CfNDj3K1KMBYX2pS8gs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oobGmkEK0+bq1J2cyEw7gmjiv5a8c0C8XkgqHxd5JP5mZleJs
	2D9T58wL2pPY87NXVpCtt8yG6js3H6jS2iNJ1FvHNps6pv18tdQarJDmO71IEJ/q7FE=
X-Gm-Gg: AYBFou20x4RVuCvuMcjpCko9Lvt1h3aJUuXGC4HW8DsIFvPJ8FVsjZBA+OYdPpCWuYk
	91EgtaspFcJpXImNsXXCvDpbw8y7bhe+GRykaP93zLCuYbebBLvim2xx2rM9rt7myoexa/jcDyo
	6OmJO2xuxTtPA2idfn+Z2TBDSxe36Xrqgw4flJU9dnzb6Jrji94YmhoNwyCF3+e3xoIquwOMmCk
	QmFUhPNpaIG8uRJ49j0WiiFz87cVOaBaRmSATmxv+XnoY/vdDr9OtR3+TzycuPSsM1M9r9904M1
	zEi0ZLJzBHWqZNFwP7EpYJjnsaOeO9S4qhj2Gh2uLknWZqVe7lHTFxRxEaMtmrrZp2PrczpNas9
	Soet/XqrzLLQXiJK5vepf4ZAfjsZF2y6350pl401ZjUY7lqba8sZlXpXKO7g4r5KX9p8R7H2DcQ
	tJ0bw1+RHs5V0YU7d2M/jw9Rvl0EeMCI788VIMK+LsZtBSe8WVoNuBG0uvBUHczTrTgE/QnkBRD
	7yuQQaTdt3sRZe1NhSPDKa866ZEQcmpK0Qi/LkPXbmTqjsrSBk3nRPdwRXxLNQMjVcHGLbrbsH3
	6fqU9FQlXUoN4rb+EwEvCsUwifrlFYpsGQQ21Ity6YBVvXCgBu2Ca0Lz6+KZzfxmHYQjRrragWo
	MxDZMlv2o
X-Received: by 2002:a05:701b:21c8:b0:194:3a84:e67d with SMTP id a92af1059eb24-1b39fed20femr5517051c88.44.1794218318953;
        Mon, 09 Nov 2026 01:58:38 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:38 -0800 (PST)
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
Subject: [PATCH 05/11] mm/hugetlb: drop boot-time HVO handling for gigantic folios
Date: Mon,  9 Nov 2026 17:58:00 +0800
Message-ID: <20261109095807.41547-6-songmuchun@bytedance.com>
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

HugeTLB HVO is currently supported on x86-64, riscv64, and LoongArch.
On x86-64 and riscv64, gigantic HugeTLB pages are larger than the
section size, so the existing section-based vmemmap optimization
infrastructure is already sufficient to cover the whole folio.  On
LoongArch, HugeTLB HVO is supported without gigantic HugeTLB pages.

Therefore, boot-time HugeTLB HVO folios can rely on the section-based
vmemmap optimization infrastructure directly, without the extra bulk
optimization and fallback handling.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c         | 25 +++++++------------------
 mm/hugetlb_vmemmap.c | 17 +----------------
 2 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index da1c17f14a62..ff6f837b6df0 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3305,21 +3305,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	unsigned long flags;
 	struct folio *folio, *tmp_f;
 
-	/* Send list for bulk vmemmap optimization processing */
-	hugetlb_vmemmap_optimize_folios(h, folio_list);
-
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
-		if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
-			/*
-			 * If HVO fails, initialize all tail struct pages
-			 * We do not worry about potential long lock hold
-			 * time as this is early in boot and there should
-			 * be no contention.
-			 */
-			hugetlb_folio_init_tail_vmemmap(folio, h,
-					VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES,
-					pages_per_huge_page(h));
-		}
 		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
@@ -3343,6 +3329,8 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
 		const unsigned long pfn = folio_pfn(folio);
+		const unsigned long nr_pages = pages_per_huge_page(m->hstate);
+		unsigned long nr_struct_pages = nr_pages;
 
 		h = m->hstate;
 		/*
@@ -3356,13 +3344,14 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		VM_BUG_ON(!hstate_is_gigantic(h));
 		WARN_ON(folio_ref_count(folio) != 1);
 
-		hugetlb_folio_init_vmemmap(folio, h,
-					   VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES);
+		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
+			nr_struct_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
+		hugetlb_folio_init_vmemmap(folio, h, nr_struct_pages);
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
 			folio_set_hugetlb_vmemmap_optimized(folio);
-		section_set_compound_order_range(pfn, folio_nr_pages(folio), 0);
+		section_set_compound_order_range(pfn, nr_pages, 0);
 
 		list_add(&folio->lru, &folio_list);
 
@@ -3377,7 +3366,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		if (hugetlb_early_cma(h))
 			folio_set_hugetlb_cma(folio);
 		else
-			adjust_managed_page_count(page, pages_per_huge_page(h));
+			adjust_managed_page_count(page, nr_pages);
 		cond_resched();
 	}
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ba8e11e399b2..d73ceeef392e 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -552,7 +552,6 @@ static int hugetlb_vmemmap_pteify_folio(const struct hstate *h, struct folio *fo
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
 {
 	struct folio *folio;
-	unsigned long nr_to_optimize = 0;
 	LIST_HEAD(vmemmap_pages);
 	unsigned long flags = VMEMMAP_DEFER_TLB_FLUSH;
 
@@ -560,18 +559,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 		return;
 
 	list_for_each_entry(folio, folio_list, lru) {
-		int ret;
-
-		/*
-		 * Bootmem gigantic folios may already be marked optimized when
-		 * their vmemmap layout was prepared earlier, so skip them here.
-		 */
-		if (folio_test_hugetlb_vmemmap_optimized(folio))
-			continue;
-
-		nr_to_optimize++;
-
-		ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
+		int ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
 
 		/*
 		 * Splitting the PMD requires allocating a page, thus let's fail
@@ -583,9 +571,6 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 			break;
 	}
 
-	if (!nr_to_optimize)
-		return;
-
 	flush_tlb_all();
 
 	list_for_each_entry(folio, folio_list, lru) {
-- 
2.54.0

