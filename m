Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1863955DB
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288865; cv=none; b=Lwl3zpfJxNot4JASDdeR5GCdw0zq/2iYoz1dI8f4Aynu3PO/HLjiJGfxuSl5webMNwjeWU+J4xSsewgc/dK6XH7EqQ/C/aUA+s/aqJoEK8u5t7Y+ytcWkaG1nDAOJKSCh3dwstcnhU+meaj+PN40vIaZ35MJeBHFW5fqdudmmj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288865; c=relaxed/simple;
	bh=MozHaV3HD0QD/OQbQsEZPaTLQzwYGseimf9ZDaMenIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQVLea4T0WauxeS+eyiVIdEVQfs0tYcoESxW9GGaNdBMfTtXlgZgbiuoexwQdasizEl0Axr1Xm/0qlp08AgstosEgzooURWTZotCQJIh22XdzEqI0izr0ybYmyYKPGsANVI/lRKA3abvpc4yMtk49OuC4KELZidYoY1o8elC0yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=gtdyzP9w; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="gtdyzP9w"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e2254dso113783b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789288863; x=1789893663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjqOF/lS/S8Rdm36whah2xYfroMiTrYUBQ+49bShAw0=;
        b=gtdyzP9wDJzfOw3E4TWVcG4GrP/YDfZlD44pU0GFQSpx0+Pnqcfq4BdQR0TJBewlOe
         hl+fgHKWi5x/yrvH8ygi8AUsUNXOXuynmne7Oudl37I7d9IfP3crchxv2lHWWHT4reL7
         UbJJxqlmkHER7P/VytJltS3naSuwVyS8T3PDxobwMlPXFkaEaK0n1Zx157g1jaRXEJc4
         JvCZy4M0RP+xC22CL9M+3cwCXc2fsgZ/NH8toMIVM9dQdrAcWZCx7+wlX24o+lHjOMvD
         4OmUGSXCnlOZ/KrYJBM37QRX8hinqJsdm0bCaDrrVw2hCwhGvPrcgPlKLSaT+hQOFUQc
         wQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288863; x=1789893663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjqOF/lS/S8Rdm36whah2xYfroMiTrYUBQ+49bShAw0=;
        b=j5QumrDYhuzVQnFyiuM4N3WKQZtZjxI1Bbf2+MMoQ2qBQU92Z/MizLMHxlsU4yy3x/
         DDpvHBaqaYj/7cTIgkZM1omqli0W3PcX8qTZRnorPHJdIPoBOkk2yOhtRptSLveaw2zB
         KFLvQnapak3oLe4a1oJHJR4H+2EBog1jM1VY01lKNDJQ1ZOCKk7BqDg8vkJJp0fWxW6K
         kFV5lFCtLXWk9ASaH7LCH+TJGhctgVGjfnbAZA/2FcLaUMU03/Or4b9uVirOE4OIDnZ1
         nP39X9eqyAWlSmppZeyoNPubhE3OQdZC3MjF2wbl6jtObDqaJA8UUngVNgLw493QLzet
         Vzsw==
X-Forwarded-Encrypted: i=1; AKwUvBzk9zltNtUXgAYtWaoUDYlnGj71H2Vk3a4pVpTI7OcMPf1JJc+VNKzbienJqIuuV25LxH+IvBT6NNgfc58=@vger.kernel.org
X-Gm-Message-State: AFuF++k2a1OxJwO+UcetAx8+O5Q40APVZUoWBeHbSaur+vrPNXXsRyCo
	b39TCV2KErQSY15+OXp+pkwANtgR96aqjv0lMrDlnv6vxFG3fGw9a0+889ISF63R3xQ=
X-Gm-Gg: AYBFou20mJ91H2Wx3WZauRcbBXp4nrSYq1bszsncgLIROTsT0Z2OSM0eKFutzgCqLA+
	prB2xQwEkeI5DB3UE+jwhbOWDpbhz8epMvOi0nnP50ZHbtqd6u9/Me8wx5TmkJf43sHgYvKTquN
	dWBiw3/aF5XlQ2zdVvaYKPCXUc0fz43SJqJl78VseHqiFO13zjNjHAf8PtBgeMeHXzMhPjGVnrT
	kyVl2gw4bBcS/QxOM8dc6QclrKOGDnSwVXY4XEq82xYEUm602J9VMaxHwrHBu6kbS+YcIkjdP+w
	NXCvmgW3RVa7YhwzBW0lNN2kx030P8vFczLs0UHKOaYF+WP16285B6RuQGk0AiNRkZpEKT9CPlg
	sgd9ohu9nI9GxidoiDy1rgug0N2AhTWLQzP1lM/HSGE279r8pVFKdgeP45XQqMjCc8iJfXKQE0L
	11JfLeDhh1986mhphxwhQls2S09th2SbnLGYw576hXMSC8Dyl23CzI8T2AvcoWpO8Aag8Qu8nBP
	GgiZ/R9XOtPZsAau8OrYIX9EYA=
X-Received: by 2002:a05:6a00:428e:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-86e2a4c9a44mr1541510b3a.1.1789288863105;
        Sun, 13 Sep 2026 01:41:03 -0700 (PDT)
Received: from G6L4RL2QG9 ([2409:8a00:1832:cf0:5137:990:100e:cc7e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm3070531b3a.42.2026.09.13.01.40.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 01:41:02 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH 5/6] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Sun, 13 Sep 2026 16:37:33 +0800
Message-ID: <20260913083734.86802-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913083734.86802-1-songmuchun@bytedance.com>
References: <20260913083734.86802-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmemmap_populate_compound_pages() is no longer used outside
radix_pgtable.c.

Make it static and drop the unused dev_pagemap argument from
its only remaining caller to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  6 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index da954e779744..8452a2714cb1 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -356,11 +356,5 @@ int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #define vmemmap_can_optimize vmemmap_can_optimize
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
 #endif
-
-#define vmemmap_populate_compound_pages vmemmap_populate_compound_pages
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap);
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index cb72d9ccf747..ee121cb4fc12 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1110,7 +1110,9 @@ static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
 	return pte_offset_kernel(pmdp, address);
 }
 
-
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node);
 
 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
 				      struct vmem_altmap *altmap)
@@ -1125,7 +1127,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	unsigned long pfn = page_to_pfn((struct page *)start);
 
 	if (section_vmemmap_optimizable(__pfn_to_section(pfn)))
-		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+		return vmemmap_populate_compound_pages(pfn, start, end, node);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
@@ -1221,10 +1223,9 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap)
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node)
 {
 	/*
 	 * we want to map things as base page size mapping so that
-- 
2.54.0

