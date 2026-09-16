Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9176B3EC817
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541084; cv=none; b=qJ8n4TSg78phjQc/WeXi/XC2I74+Rn2Na/edyEvO2XiwaDj0WNT39f71B9rmnfZQTWdlQUHEvbMBx6pbMkHZYt6Pb4wBhFMGQ1WFXlmEtfWWZHfvjFYky+RKXvwVKu9ycEjvRPwhDO/Wu39X1egD4yGTq32kbx8emRApdjGH3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541084; c=relaxed/simple;
	bh=o5WJM3/QFSVrnnx6cWLQ5UPoN7IuOCV+HHfC3SmFVvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRdrCS/JRfNL3dTDJsP0wZFcNc39cjyx6zoMh2V/qUFp2Erpe1ypj4BAWevReM83nMbLcSf5NxX2vVUT4wKU5cCZr5CGLShyJtZLgQIZQAfi0opcoeM6jxuR8svhwOs95B3XLanqeHYsObnGe1uLqBtX7AktbHrfiM0FO//FrSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BbqzPG7G; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BbqzPG7G"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fe517774so7193265ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789541080; x=1790145880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iM8j8Wu3fwHIWd8x6lR8eMq2Esw45qvi78c+WOmPzrM=;
        b=BbqzPG7GWtNylKccSg71VixFuJecxTQ3lf0YDea9jtfstudOs3EP5CzM468Aw2krl4
         6sz/apRIEAFfPPtKqTfPv2fhrbYqR+O9I+Kx17I3GVceIZKlWD7jbs87t9f6QR+tMoI8
         KgA88X4cLLcYxSLLIJ8GTZ0k/M5MtaNkOSglQ487/Nf9+VKh5se42taGsfEmiF42UUTi
         znlLbNxAoVCvx9xyBGgb+pAhIrShQqSUyVmeloqQll6hSeWV7JZqeGg9LEEM2Ft+Yg2F
         Ds38Vyj42FZpz0LkSlgdWA4cZ88kn9gHwoLTBRnVhzz+V1PY+8US6uwu1WtsuH5TV6Lg
         BHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541080; x=1790145880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iM8j8Wu3fwHIWd8x6lR8eMq2Esw45qvi78c+WOmPzrM=;
        b=dTuNfdT0SSwgooMwftSuFr+lz7maqm7KkdnFO+/gSUazB707wXVih/O/0tdXPG50Wi
         f5YMi8oYEdhvDunB1gPh/tMUGhiMCh16IO7caWPeBmae/yX7kRzkTfU8uIiA6YanAov0
         CA9YwaWuicXerlcUG6es7ugnzuhahAeU2i+PuYEbTey87MmTDoX0ItGct4QSr2kTJW4S
         T56vucajazzW6A2EJaQpH3n++ArTv8B7Yx1aH4qCgUoViZXizceU1HoqHQDH63xEw1FG
         t3vc/EKPBoo7q4h8BNo8eCVS5Ybr5a4r3IiiXu9ks/r+0fPLNwBzkBj3fCE6BfqJbjz7
         KPtA==
X-Forwarded-Encrypted: i=1; AKwUvBwGdzqobmhdymWGGKMxX1msuUTdtNYYxoYzbcJ/TGiUbCcM/98wdsXETSYG4Kd7GgGE1M4/CKYSWvGjpb8=@vger.kernel.org
X-Gm-Message-State: AFuF++lKZPX9tHQVuSD9aCPkqt5L6NydJtG2FMMZzJfN8n10w5TJor3q
	vcRrNYggIsa2oLESbx0MELR39zQua9FtgZ1GKRmYXIHjfvDZxm1Lq8mgC1dRHv+Zgvc=
X-Gm-Gg: AYBFou0Q50Cd0ozaCGa7a2xzRZXRfvYzZRG2uFfIn4hOwxEYPYDQCiUTf46YdvUL6DI
	bgTT6fvq9oVjrDuI9GUQxXWsQ4/6RObl/4/NCqD/RHrZgvFaSvifZ5pkTUysTi5y2gLC455Mu2A
	xfHhTB0x7aoxBZuIqBL5R4Egwgwmbb8bUBBAIYFSo6x3moIPgK1axJyWjvwc0t3fSOUXlxMRnEk
	rRNlwvUSYoN6E4vHJImSLv4bzCV/4Gqn8tSxA54nEDdViVKE8vE3SeWCDrKI/iOmtnv8DukoWwl
	FF9qcJ60izPxsCfsB+A+BRaYPrOddwS/1POlbWhmYQr3HA74I27uXd21VfLgH/fMbSzpIGtTE7V
	jfKwxm8EwF5OxMvcQv3o0tYfkrMdh2CLv4I5LqL9X2lfq77QSVg9fsKxl/3XJlSwNtYwiVmr6F9
	qsO6Fb6RJ38PBQcvpfxrW7l2RGJpS+W0Kq5/KPCALSF1nedJWNvX1jHG9xxAO3Gop9yLv2lqfds
	FC16DLdiIZiDt9ju0HOQUho9emlDg==
X-Received: by 2002:a17:902:c94a:b0:2d8:d4cc:be68 with SMTP id d9443c01a7336-2dd8e7b5ca2mr29021055ad.21.1789541079708;
        Tue, 15 Sep 2026 23:44:39 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f0592asm6074755ad.62.2026.09.15.23.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:44:39 -0700 (PDT)
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
Subject: [PATCH v4 10/11] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Wed, 16 Sep 2026 14:43:40 +0800
Message-ID: <20260916064341.1825793-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916064341.1825793-1-songmuchun@bytedance.com>
References: <20260916064341.1825793-1-songmuchun@bytedance.com>
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
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 10 ++++------
 mm/sparse.c         |  3 +--
 mm/sparse.h         |  6 ++----
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 39f0cfeefc6a..96506f594924 100644
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
 	const int order = section_compound_order(ms);
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
index cc28bb41fdb1..b75921c622ed 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -250,8 +250,7 @@ static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
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
index a5111087ee3a..530692cdd516 100644
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

