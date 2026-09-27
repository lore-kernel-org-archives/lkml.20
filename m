Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A433B637A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477747; cv=none; b=ZKPaMPEiECZXTuvKLz/L4qI4QylHSOramJksXUNHheR6FWKXeL54pZDSWd18BIvnEMUFMxtmXCAUmnq1NyXc+eKWLlhTKnDrpBFa3nbaFYGaIdod69XaBDORCLzyvlM48PXZBnNw3bRES5LsNu0d0MpeR2WHmJtoqVsiILS0CEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477747; c=relaxed/simple;
	bh=dX1NF946TUb0fsJwDFBQI5wjoIzyGFvWnGsw2DRu0Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDcebuRfB5BC0Vlao0n+PaXFQaJYc7N71MFZMyn5/YGr4hDqt6sB6pyYVQa4BPGX4JA5D7a6mRpA/6xY5qepqKY0uW3dYFjzKQ4bmGLyE+vyXETvPL1nI9o8tBeJlU5pZ/cR+xv8fSMsXiVOy0sBj+uSNjjGPy0JZLABhclONUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dC3cUWt5; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dC3cUWt5"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0df0bb2d6so515341a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477746; x=1791082546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CIuL28jJc9rBcE3veHd1eORcVK0n34BpltfpMfOrf4=;
        b=dC3cUWt5qkl0lSCXBC35zZCH8fwFnC1CPpHNkc/3rrQ4eTxmYrwqXk4AsWiqAFGcv2
         oGQGp70wmSeviUvCGgWf6A/icWK8AfyrEaBDHrSHNocGlkGgHqUrEzttxkQjG/2rKMp9
         Hqd5qDYYvKP/9eTxltsPj9sj/JKwKV8GAIgd1FD0TwtxFmIbexKlEtMbu8ABR5Mf7thi
         a6jX4krao8xd8DM9e2OHqV/Kccb8WTpLY8wWyfSkvSnpq6EUyA88wtL1DrgWI0tvUsb+
         f5rnHB7MJA+w0J4Ay/Fp8FfS3F/2fNacKDe6ot2rMnhcWvLHEK5DHZ0jlcpZL9lXKcHz
         HDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477746; x=1791082546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CIuL28jJc9rBcE3veHd1eORcVK0n34BpltfpMfOrf4=;
        b=KvBUDk1YnMWGDArRXLgOouDGmewdpI/A3FhA6Gg19HKJlRubpZ3fGf68BpkaY/ORDK
         XzJV/XlJk+Q3rdaFTBwpmiCxVtGe05oiPz6jwEAe4ND21Qaaje+cRPmqW5Okk8XuF5Qr
         lAXJwYrriVIOhOhFP8ayBJTE3tXm74jQA5VuQp3JQJoRTOQLhTIRyjGyHanpoZb8XU6s
         /7oQVZZsvzTfi3hSBykAYqFc/BaIjCpMbfSFHFjMNH6dxFpawPq33l+Kic3PkSEeNzVp
         Vrldz6le+DiE5ssJsLJSX5BvfRJdLsXmn89rt2iHxsnI9F2cxhKFlTu3BY0tttWgJ4uU
         Ifmg==
X-Forwarded-Encrypted: i=1; AKwUvBy8PPrOLKFEJ2KTthpxDudeKo1CLEn1yLc0+8W5NzZZCL9/Tc6bDUdYS9tsp1QxFL5Q8OVxdJD/dAdd7gY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQVP0WXZKKXbdNFhJkaRsGlGpOa6w049F9dfUkwRXlsA0tnf8/
	u9btqTjoaoRLqR6KWv3M+TfELf+PFsfBLJNe9CFyjclwDK5pfILYbjrZ4nLHgNrH4E8=
X-Gm-Gg: AYBFou0S841ghpS5nwRhUk7fqBHZg8v49lP1aSCW08/q/KZ1bLz7g+avrm74cFRMznv
	mMdsYv2AX8HcfySrye3xHKQP5iYKvn8UIuSN5YCSDX8i4QuEx9tdD9IG+jRGCjf9GQXfAqznWQb
	eenv1bnWKI/4kvEKxlbW2JwhtfhpXA8V7J8Ii4bz54fUhJxUkfteiUoGSR8DWCG7W5Hmo/se4Hr
	a6u+9zUU4kL/kLQDR1DZRYpokzZQxUjGoO+REBnO23QtLp/d/nHvQsL7szAZ6cRqLHVjLTmrZaB
	SEMZRUUzQeuh4/H9DkjN/4Ue+xLBxCm66W4Dx2vSWMNO+eoCpntEKzhsDUuHFKPhyPsXNQ1JK5J
	lDlba7k4xnd/NB7B/3NCPnGTnLrxZdFTk4kwspZplmq1c6PpPe1hicxBkUNFvYI3OxzcDmGDRaK
	N/nOZNq/JyESakgUoYIRaFlfQB4TH+4P31UFkbjc2/N1VT5ztXILLKFcBcnEOdmD+v2rWVKFZtC
	t3uCZDRKU3PgAmtO33uNeToH6p+zXk=
X-Received: by 2002:a17:90b:380a:b0:3a0:be2d:3853 with SMTP id 98e67ed59e1d1-3a0be2d3c4emr5473938a91.8.1790477745543;
        Sat, 26 Sep 2026 19:55:45 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:45 -0700 (PDT)
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
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v5 11/12] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Sun, 27 Sep 2026 10:54:40 +0800
Message-ID: <20260927025441.741633-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-1-songmuchun@bytedance.com>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
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
index b6378826b9a2..b617ff1b985d 100644
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
@@ -666,7 +665,7 @@ static struct page * __meminit populate_section_memmap(unsigned long pfn,
 	struct page *page = __populate_section_memmap(pfn, nr_pages, nid, altmap,
 						      pgmap);
 
-	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages));
 
 	return page;
 }
@@ -677,7 +676,7 @@ static void depopulate_section_memmap(unsigned long pfn, unsigned long nr_pages,
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
 
-	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages));
 	vmemmap_free(start, end, altmap);
 }
 
@@ -687,8 +686,7 @@ static void free_map_bootmem(struct page *memmap)
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

