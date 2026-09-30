Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF65187F2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777338; cv=none; b=Rfz4rJ207x2vmPEMWOgNwLZ6El+jFYVlksvOQNwGreeDc5AcKuMyQz4feIXBDqGEwcKpjDWEY0Y4xlgbLyJOlNibltly6mfU9c/gFxUF+CBVrRDBX50nL8KgGWMbx6e0yvSHocB7b+x3YjzqdFePbxHcwtTWSq/uup6VsNTOihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777338; c=relaxed/simple;
	bh=pGdUlZbkjqE4EsdUFIr/tq7VJ9PE4G9s3zixRCrKT7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pv6dIsmHclqHEf4y8WXKkmMkG5b6MOvJi2mCfCy7HUbWhcXGA5eQKnlAcalfzGE08jQkXBFyrMlxOHc6Hyng8FB1NYc/Hg/VPS16EkCiQYdKsiTbfAs7Qd3etm6E8Iz3/zEgDk+422o3J/5aPWrCsibocSGZIV8nLoGePUBxP24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GIWqvm68; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GIWqvm68"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c6bfce73so540745a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777328; x=1791382128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xa6t5Ld51NH0IkEH0Cbkiyr6aGf7JfNQsVmQ3uezLic=;
        b=GIWqvm68aUKCgUX8DjlcgsPIEZ6w3GZb3Kdpb1v7Bx9LZOSMcywDK30Eh3Vxa22eup
         7tZCzxu2SxbWEgzE8ElWUy/q1NrIqdJc4lnIqnVEg66IAKc2LoeQDfTdqhHUjYg+4P+n
         D/zriZUKMdCWhHXoiq4E3CmYJkRmxNaSU3a5ol5VLZ7dQRgh981B5EfvdxQSf5lVdkXB
         IExK6QL5lDxCOqCiisnRE622BmmUeVzrjcU3auJl7dxTi7ubEVqsnX0POXMbMKfGrFXI
         5TE7cOenMIiiatXVVztjfe9e2diBA952mXrH+pyTvfrDlxVVpITcoWS/1U1Bm4fT60F6
         nyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777328; x=1791382128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xa6t5Ld51NH0IkEH0Cbkiyr6aGf7JfNQsVmQ3uezLic=;
        b=dSrjj4dvC5QfdywXRmqh/dq15wl6BxJnDwTMtiazr4Y5Fc0Ax2an7JySu1tGjr6W7Y
         WEi2FTBPzvYV89T4z/UEXIGYFBpjpkx+n4mM66i5xR7gYq3uY70W9THmgZ51bofgnqEb
         tCwDgM1MCkixcumRrK+ZIfv1/QYsYmthsfH6OiM2ewu1QNjFwDMPp3PKoPFChnuEhY1P
         PIhiR+rT/eqVmQrhaCtXSQTjjvqpzHfYUHNMy35Yp1czsAx4IPTvlQdwAXiRys/9Us+p
         ZPgSVzygvaV7SmJMXspoE6bOToV1nJaBcNz1LdNusiZ9y9i4FGkYd9NESRCjOztGtxQF
         f/rA==
X-Forwarded-Encrypted: i=1; AKwUvBzTCb/pbbLW3Ywy1zX7li93IeeNl+iqmHTsPqd/OXITqQ9RHBC867H0SsUKfFpUFv7pC7bEOHmISI+S2uE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFLNDJ+sQW3kdmmnJavxMwHgyqLbaQGq3mAmbx3UrEuFyUx2AF
	K/BFdcsBeMgQN6lvs6Cpw9raqM+Uc5nIhPWpFOsvw0vLTDjUkxNu1ozZw7O8FVRJL8c=
X-Gm-Gg: AYBFou1pIErdHQUvsaryBQWoe2k6A7TdJ0rIGBRH6f4q8ZWKGCrGNZLvuOydJtpKVNY
	/l5EN9jtxurDDaM+5L0yZ9VLDLyKZDYjOd0dsqcMNY872AOalQ7a+SipkO79VWhG5hLWHGCupQ3
	QGrMgdjJhe0uz5jLbhDXBnfo5km4YA0tcIOMEPCA+XoyG2vL4n9dFTYQt1L2XFoz2GBhcTesz51
	eHKg8CpJW3MtNd/ePYA/nkaMDQRsfXWwH7IAUCXfccN+HJ1ALR1dJyKEzvEPX0xuOE2/jRVZ/RQ
	WRuObbBLmzdOOHryaRmWB2ul/1P8JBLfLudA3cua5M2lEpKiSkcac0liKm9cbB78cqvuI/JKyFR
	fR5/8z23TnE+rkbH1rKMm9lpuOvisteLEPhDX++qUnigdCUAzGG7WPzpugBcsJwJPiC/v7RofC1
	XEXwwR/OqIMgCjXp4jhVjKn0vfGI67bvhrRakfmHe982+Nn8su48awn33MjT+M7QiT57/YsyIzv
	hGLobwsE6t3XYM8S0MPkmxE
X-Received: by 2002:a17:90b:5404:b0:3a0:b959:4479 with SMTP id 98e67ed59e1d1-3a4d18a28a5mr1270065a91.38.1790777328422;
        Wed, 30 Sep 2026 07:08:48 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.08.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:08:47 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 11/12] mm/sparse-vmemmap: drop unused section_nr_vmemmap_pages() arguments
Date: Wed, 30 Sep 2026 22:06:26 +0800
Message-ID: <20260930140627.57431-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-1-songmuchun@bytedance.com>
References: <20260930140627.57431-1-songmuchun@bytedance.com>
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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from David Hildenbrand

v3:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 10 ++++------
 mm/sparse.c         |  3 +--
 mm/sparse.h         |  6 ++----
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 4cea94126cf6..4be85e194c78 100644
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
@@ -674,7 +673,7 @@ static struct page * __meminit populate_section_memmap(unsigned long pfn,
 	struct page *page = __populate_section_memmap(pfn, nr_pages, nid, altmap,
 						      pgmap);
 
-	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(section_nr_vmemmap_pages(pfn, nr_pages));
 
 	return page;
 }
@@ -685,7 +684,7 @@ static void depopulate_section_memmap(unsigned long pfn, unsigned long nr_pages,
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
 
-	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages, altmap, pgmap));
+	memmap_pages_add(-section_nr_vmemmap_pages(pfn, nr_pages));
 	vmemmap_free(start, end, altmap);
 }
 
@@ -695,8 +694,7 @@ static void free_map_bootmem(struct page *memmap)
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

