Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D3C39D6E5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103060; cv=none; b=L7NiSTGKQzda5VUjdiGduUvzj2kDPtgdZEiHChtK8YsSjURIFvZ7zjBe7tpcifExI7FLzFTFQdDKkDqSSsqSLz/Mgq7MkLLmpwuRbQvWISUBW5IZnxb4oqFkPOik+fc1rpSeE40qyxqeN1+IwXAWunz9mbZ5QAb1gxHZ6jmtoKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103060; c=relaxed/simple;
	bh=o5WJM3/QFSVrnnx6cWLQ5UPoN7IuOCV+HHfC3SmFVvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEF1ksMbf+N7WXXYlwhBvKgUKiNdVx3q+xSqhCghcFbh1/gpCY4qDyLKI4F/oEg7XKNWAl/33foLuMKWMZYrLVGuJNoB14tQJl0yuqmbWH0sS/dYhtsQvevMQE9flu+5ZMOpbKgF+SmCg3zQV9YPqZ1RSQD2MyWJHuHy1Unw4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AXRhn5PK; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AXRhn5PK"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso468242a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103056; x=1789707856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iM8j8Wu3fwHIWd8x6lR8eMq2Esw45qvi78c+WOmPzrM=;
        b=AXRhn5PKXzYGtdB6OaHb4lTuZqqB4h+EoDqk/IJOlI6InFnWnM90fsx01O3JR/Nhvh
         XFgNuYI3lxy9BxipCENY0G0CXPVDjPeZYRoXpc15Ms7QpDiSZAJhisGA1vxgr8Md3j92
         bBOOXxDM5KWKr2lfcwn5q9XAvc+IoWHNBw0HkFyjIZnBN4ZRhPCryeFy26+iKj00PLrw
         KbxVRoKC4Y9ijIS6NZs++3/3/hkfpBL++4FOIba3UknmxqshrxYpy8cobabXfdICRLs1
         FsogvXRrjgfa3HG7M9AfZ42xmbtE3ZlCvBn5M9Al4WWVYsqWlFNRVM2r6MKoISBfV1rL
         zwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103056; x=1789707856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iM8j8Wu3fwHIWd8x6lR8eMq2Esw45qvi78c+WOmPzrM=;
        b=qu6QVxEaUlRVYAlWHEn7BqfqY5fdWLh27Chxgfwjw4sLeTi/ScWB5hUWgBoveYj56B
         Cyri5fbsNvV4T4X3P08xK9TU4NMG93QvvJfOu5nqLpy/X3Xsg8z4xKHZ/A6PaIZsGJaK
         ezqeE/Nz8Y9cymrHVyxe56BHlakmDGA7U+9cLE7shbLThw9LUzKqXT9RitkTlzKdmzlZ
         NCGf1Hn60vIGkm44/YVN8Tgln7VzQE7lWpGKxShejlD9ynb7DpefVMu/vcl0fqMCAr60
         vAGI28MC93asugY/bcl4gpb+30kB8gU7inVbgPkCbcnNCiyacZFPLEOxB5l2M6zPYAvw
         zslg==
X-Forwarded-Encrypted: i=1; AKwUvBwE3BlITXFFQUUuHiGVVf/RuInXjwlYMElVtSbBO/OAcZSUxn8IAxTquQ58WhcekweXZ76AD1yK1U2NT9s=@vger.kernel.org
X-Gm-Message-State: AFuF++kZr36kmDlUPIGOlf7o40qPmmkeQ/q7oaeMBvOP/3yjudpinAFA
	YpUFDO2zarbGG2v8LBHn2o1EKApy49RZ6wE3GyYRzQR1fQ7dIoYxB/Qn3pHNQ3usYnA=
X-Gm-Gg: AYBFou03sopEjN7v70D+6QR16PITom6tDfVsf9cw1bunYT6kdnDHeXhV/4CMuIGHQn8
	ndiS+ekXtGyQTnCJlKzv0IOTTQtYAhPNs8zUMjcZmWfUE2j9xzFe6CRRsPvxr8svULP5Q67bclL
	Tcxytk5D6bT5aGp/5CQS+J99irhQ+xc6l+nI2FO2MKVC1fdPoAFYCBL+vuCn5ODNpbQ8wzUd7Db
	kzsO9ly0SP7LxbcZ9RkSe9F5a7JcGVK8N+b02KUrlpYjeAnYBe1+iZFm+qpQl77lQN446flE7Qa
	CcUaFPq02DcCMoLBmRXeMmL4lYA84b/SrhL7HE7M3VHlhkczicon52qb5CPHxK6cMGJFH5Wt4ui
	KULSLW+ueUEfC78wPQV9VwhMO6O5BMDjuleGsfuPDVaP6Pq072xRZLgr1P5dTxDLCG3Z17FEjjo
	X6ldNE9rZAOrLqN1yy5V1C0TjNuxvp+T7PJesCXjfZT8CkC8pdK9XwDeDX89yOVpoNuTBw16PSp
	22DaP8s//ZUJKZhvTRDM3AXvHbksb5Vrmgl
X-Received: by 2002:a17:90b:3ecc:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39d9bc382b7mr3533958a91.6.1789103056004;
        Thu, 10 Sep 2026 22:04:16 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.04.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:04:15 -0700 (PDT)
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
Subject: [PATCH v3 10/11] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Fri, 11 Sep 2026 13:02:27 +0800
Message-ID: <20260911050228.58884-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911050228.58884-1-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
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

