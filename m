Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E173A6EF7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103048; cv=none; b=FQZJZF8lHOAu2o0Oi75hBxZdnGryzpsLotxnzSP94SESZHTmAOejs/BfZa90nT70Jphsc3f+JyDwcu9zjUNYSRp2msZOON15QOZDPOHwI28dg5cZdXBZ89aSg0+Ndpo9XMuAgoT2qXuTwz4osmud98AvwdjIs6ngXeTsoxugtf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103048; c=relaxed/simple;
	bh=XXJonAu5v5lmenvG0H3fDY0XU6EMxiTGRHxJPTiZN5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOHQe8bNkwE0RY9+nrCYTu5YBm1UgJysf5vTwKhYKq8uK7MTtOERtbWN7Vf2cS83qHrS+nDXv3AenTnPYHVH3KK6f+DQ6KoWeYB9jMe7hISlMoPtbzGMJmPCSzh5Uu/st3/2EEETbOv5na1xcuGVYdEH0ftYGiwzwlbpkJPrFf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=E57CwyRc; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="E57CwyRc"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so456229a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103046; x=1789707846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZbZ6WC7vZbHjIhgnid+8T29mCn5dRvITTk6eMnH6Vk=;
        b=E57CwyRcLDnZd7bIDcp1fJk8ryu52AKMO83H2R7foYaEl9FlsBHrCVFUcHt2e2mzIy
         EM3YUfrcOsveia8pE1AcqtyazgPk9PRrHUDW4AL4BDiYU0PUKZ8ovPsARF9vUorRtLfX
         wQ9BzO4zK7iM1aMBlAvQ0L3PZgaRB9K6vSJ4ZoLPA9Wes1qqrhNDSPva+CcpVAnWomQj
         wgsZXdosUltTSp62muiqS0idXLLZ8aFcs0YaOY7WRc2cusPWsWpkzCkfKnODeuUOboDL
         PlerVGL6chbJ/7/1nV/NUKsd7RqP9RMZ814hHosuqiQfXx+CrZX63p8pe4d7TbTULjWT
         2bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103046; x=1789707846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZbZ6WC7vZbHjIhgnid+8T29mCn5dRvITTk6eMnH6Vk=;
        b=e8RPE8OLi6zAB1fM/LVtwBky/yyAgPVgtGfL+HodCylnVz1qVYViPTmd4kyc8+2Sh5
         m4s5nPm4fKlZBzITZdbyJZovoNMFtcUnuNh1chaWpgJLjf/0Goi2cbONtDxipS2fjEZc
         tRQpeeO06FgeyTW4FDETIl7bih34LvLheC+WSEKoI9OKAdo+LkvYHI3mCzFKVYbG/EXb
         daklPaRbroVVkv0QLh9+uN4kPA5wHvdCFxhT2M6lPiYB15MYErP8yvsk9re3Lhvndxw0
         NXlDN76bEijkLwHm6P/8ER0Oz/NxWmQTk4mlzIZ7VpfgXIlWptibhUbc+Su4lGOvVgqn
         Kp1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzSfv6x4sUxq3qGxtFcpa1W+Ee3pcMLYx/+7v+cv5x6z6z2MV6JM4sbNiUoU0FbO6oTI3u0R+H/w0w1ids=@vger.kernel.org
X-Gm-Message-State: AFuF++nTJFuj4c8NGrriDz5/l4cP3Dbr4FMbFK1BQTFOquhYc9BD61Zf
	GZc9NgrQOLtCcfbI6APSI3R3s3G7eHC27arBocQVfTY5QXhbSxlmhN7k5o4wLKdkXhg=
X-Gm-Gg: AYBFou2Nc2VvhB1ceMkrYHSDzJj0NvDGqGVrC/1OLE7LZSPVaSGdbOySzPsWF5yER3s
	skDZ2ynkJGI0E74fcQqiZVoKMUxJHcrJpDK8U4jh8WpHvtlaGW3JupVKj/qq6wHAsWl7X+C65YI
	ZlSJymx6nAK89x/4R8Jo/w22vBzRFe1KbxWJaev5brQhOduWOTAwjTtOyD5IVS3F6G+b1kjLAU1
	LqOz15meK8dUG3ARNMuvrH3hSLBysBId2pxKY/ECLuNjYCi9EZGO/mWOsRT1qI6G8auF6ycIkJy
	mVfZjdlYh+kK66bv+RMMsn3FepQDEWGa9zsyqTN9L0qhI2xW5kfeMO5l9CWhkcjyJQkB3lDLWuG
	XhcknvOXfODyGj7w0lksWsNQaoORqFTcjgknYfnXfXQWoYO4AROI5L1t9BhjVl77SCWQ/4a1Cug
	Qp8hgO5S7Znzs1H5aZfVpSwV6/khjEUnbzeFJOtgQn3jAAPSuG4r2Xpbo+EuuZ4bu322mywUIUF
	nXJgQuFaw0JfLqlzfsXONl9tJT8FBzhLTQW
X-Received: by 2002:a17:90a:fc48:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39d9c3527b5mr3643408a91.24.1789103045863;
        Thu, 10 Sep 2026 22:04:05 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.04.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:04:05 -0700 (PDT)
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
Subject: [PATCH v3 08/11] powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Fri, 11 Sep 2026 13:02:25 +0800
Message-ID: <20260911050228.58884-9-songmuchun@bytedance.com>
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

The powerpc radix compound vmemmap population path still finds a reusable
tail page by walking the vmemmap page tables.

Switch it to the common vmemmap_shared_tail_page() helper instead, so it
can use the shared vmemmap page directly to simplify the code.

This removes the powerpc-specific tail-page lookup and its fallback path
and aligns the device DAX vmemmap optimization path with HugeTLB.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 80 +++---------------------
 1 file changed, 9 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index cf692b2b5f7b..ee068f24a79f 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -19,6 +19,7 @@
 #include <linux/string_helpers.h>
 #include <linux/memory.h>
 #include <linux/kfence.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
@@ -1250,59 +1251,6 @@ static pte_t * __meminit radix__vmemmap_populate_address(unsigned long addr, int
 	return pte;
 }
 
-static pte_t * __meminit vmemmap_compound_tail_page(unsigned long addr,
-						    unsigned long pfn_offset, int node)
-{
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-	pte_t *pte;
-	unsigned long map_addr;
-
-	/* the second vmemmap page which we use for duplication */
-	map_addr = addr - pfn_offset * sizeof(struct page) + PAGE_SIZE;
-	pgd = pgd_offset_k(map_addr);
-	p4d = p4d_offset(pgd, map_addr);
-	pud = vmemmap_pud_alloc(p4d, node, map_addr);
-	if (!pud)
-		return NULL;
-	pmd = vmemmap_pmd_alloc(pud, node, map_addr);
-	if (!pmd)
-		return NULL;
-	if (pmd_leaf(*pmd))
-		/*
-		 * The second page is mapped as a hugepage due to a nearby request.
-		 * Force our mapping to page size without deduplication
-		 */
-		return NULL;
-	pte = vmemmap_pte_alloc(pmd, node, map_addr);
-	if (!pte)
-		return NULL;
-	/*
-	 * Check if there exist a mapping to the left
-	 */
-	if (pte_none(*pte)) {
-		/*
-		 * Populate the head page vmemmap page.
-		 * It can fall in different pmd, hence
-		 * vmemmap_populate_address()
-		 */
-		pte = radix__vmemmap_populate_address(map_addr - PAGE_SIZE, node, NULL, NULL);
-		if (!pte)
-			return NULL;
-		/*
-		 * Populate the tail pages vmemmap page
-		 */
-		pte = radix__vmemmap_pte_populate(pmd, map_addr, node, NULL, NULL);
-		if (!pte)
-			return NULL;
-		vmemmap_verify(pte, node, map_addr, map_addr + PAGE_SIZE);
-		return pte;
-	}
-	return pte;
-}
-
 int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 					      unsigned long start,
 					      unsigned long end, int node,
@@ -1320,6 +1268,12 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	struct page *tail_page;
+	unsigned int order = pfn_to_section_compound_order(start_pfn);
+
+	tail_page = vmemmap_shared_tail_page(order, device_zone(node));
+	if (!tail_page)
+		return -ENOMEM;
 
 	for (addr = start; addr < end; addr = next) {
 
@@ -1349,10 +1303,9 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 			next = addr + PAGE_SIZE;
 			continue;
 		} else {
-			unsigned long nr_pages = pgmap_vmemmap_nr(pgmap);
+			unsigned long nr_pages = 1UL << order;
 			unsigned long addr_pfn = page_to_pfn((struct page *)addr);
 			unsigned long pfn_offset = addr_pfn - ALIGN_DOWN(addr_pfn, nr_pages);
-			pte_t *tail_page_pte;
 
 			/*
 			 * if the address is aligned to huge page size it is the
@@ -1377,23 +1330,8 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 				next = addr + 2 * PAGE_SIZE;
 				continue;
 			}
-			/*
-			 * get the 2nd mapping details
-			 * Also create it if that doesn't exist
-			 */
-			tail_page_pte = vmemmap_compound_tail_page(addr, pfn_offset, node);
-			if (!tail_page_pte) {
-
-				pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
-				if (!pte)
-					return -ENOMEM;
-				vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-
-				next = addr + PAGE_SIZE;
-				continue;
-			}
 
-			pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, pte_page(*tail_page_pte));
+			pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, tail_page);
 			if (!pte)
 				return -ENOMEM;
 			vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-- 
2.54.0

