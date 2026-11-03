Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701080;
	b=RNt2/J6QjyeLgjJVg8OKTUsCCe8OY7fPmY0YzTF7KFqvPi4E8z5JjE9NumDh8aJ60pOC
	 5h6EY7krEKSQlEN8URb+5QM2ajQvAjlyOXjLmWYVauWK9WJuWKXf8C0Tb26QA+/hru+C/
	 YcPo/7PEc5sssDEVjz72Gwuwb14LW3ZkUXcVR3HlECBIV9Zd94Za5kZA87OJTvVfwJExx
	 pDL/FlqLjnLHjEfJwb8qAjqMfMsnf0uFXElD7P1vzidbOGUNLyxJC3DWVR60/Ktw13PV9
	 uxvYhzeEnyb72UnHp9vpfixNi67fPnSp1NkVE8INGUDgZP1ay0X2TNJvRyThlsqUIbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ze3zkZKDchYqmhLj/EpeAe13TGzwVFVPgW/gvJcl0x0=;
	b=0tRVy17UDm7kdHNFt8rZJrScQ+aXwG6VnYrLFlqTOaxtCKPMAbLXGTnyj/VQ+quS4UiA
	 jjNT2PhnsIVoS4Ko6RdgvF/9BMKTUCOxvQ0A2saJUrFqkeWMWYzsYLgygpGIjQ/hpLqT6
	 WFRt5LVS1A/k6zod4X3Hh8n+qFl+ZHly1VTgtbSHFOdySS3YQcaiwFT5N4f+A44haUaoy
	 1Oi2gNkKlm2SEeqFK8mtWowlw2WiOqn7bVOgLM1zLZzwRUGNF4S30o7x19sGBjP/Zo1a/
	 LPEQrMfe5G0yQ8sQK9QUzraXNp26RkkvYxZHX91PfNV2m5Al77rx8BqPVhZfryKGoqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hiE+Nkid;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A0D606A801
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A0D606A801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hiE+Nkid
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35829219da8so613146eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701079; x=1794305879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ze3zkZKDchYqmhLj/EpeAe13TGzwVFVPgW/gvJcl0x0=;
        b=hiE+Nkid+3Xdl3EnVv2vZBUqL3gbWe3pRZyiEV7mZR7efWh7+G6V+PGBTZcY3qvsPP
         V9F38EeZzirx90HcBA1nWd7XCKJVwfInQ1+c72ntu2hQA0eMZcHT36ab3Fr1QEApcUkb
         C3voTrstvHhw1i/xke1+mGFioRxwXwSEoxRW9qgKKuofExGlIeB0Q5g58HmG5mhEXvGh
         pUFYnVzY/rwCYk7lmP/PSg78/zpNYXGx6lXcuIfiiYRHcoSld1QFP+GYuTTCb9/mVEMH
         cUFrqOwNg330fNPlmqmNgyKUk3v6LHDP//jNXV+075NSsvrs+ko5FghPAibTwpttRWZa
         /DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701079; x=1794305879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ze3zkZKDchYqmhLj/EpeAe13TGzwVFVPgW/gvJcl0x0=;
        b=DdOIvbaX8+XerkKYZPqfVjlwRvHk2r/uIsQpGWPgfTh+ULHHknw+j33+ASu+6mPUE6
         rAjhoiadJvEXmAEpTcFpS4E0xBvUEpbaaCyKk3O3as2WiRfiNlAxBGmfJkx6imv8MtVB
         je5UejcAWcBwjrdeDaRWwWo0XBSLQGzq4cpg+XoOP+RjpLBtb25o1ce6CjkvH7UXJTSw
         bgWriUs3A1pRNgQuoJ3DyO5qKJ2EpG6NFtQinUmwFq3GeJK9g7ohtxxudsC1O66qhKCB
         OEtacoSMHGAm8dG6b5vBV+e1gtXaW9ndqr2iubIlOSv+Ugg4Yz5GLwgYAgpLci29CB3O
         RkPg==
X-Forwarded-Encrypted: i=1; AKwUvByb1AQNb0INBdmhbQJo0q6XbQv1chOUOmC/ghCyiDEfRtjG+2FTnFWPMKGKxf1ElXVgF8PbfVyXTApAal4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NSlTmM4B/cq3yltecPyinoEuVEpWMlqT0NZD8HIYTbZXVNOIx
	MPT28QEmI1MKD60S4bKNIg32GU7AxpWcL/ti5+gTb+4FcpAeKWwXvQZP
X-Gm-Gg: AYBFou17zxogkfLhC5ZskVHf7A0/1Sv01S8GPxzG1vpDszB/9ms7/YJDQN1Di1aGfPc
	/RjIYJ+8ZacHezjSu6uiECbDlK8w+Yb3SPb2LxtEh428FJ8U8fRuhsFKI0IfCUTa3EXo9OBt3Em
	XFePxS1OIjnd9T1mwyCnYyIQOhx1wDWw7y7yrpM02l9tApgTG5oUUEEi/wyKiluo/6FUTI1xD9C
	95Hs/Mi2j2541pFQ4MzyjGFljCgss9lgbhKJUtTVACTMSZ+2w0WrMEA5MEzHqp+VpsD+xvU8q8l
	rciOb6PlF6Ol9AR9xwyMROnUp8KqO9KoNDvhRIb3MY942QBybBHUFnTCMd1hSuZuUJgyzVHEnZ1
	Z0nsLGA7ovc13b8rcPSaWuEupJiVAIjs0sQd9F0pAmxRnB8Lzpsm+xkpgV0IWxBkahslO4TxVUK
	PwQwvcZH5McEakR3zJ9kT7fGn5PYkFgmAFjY32oDlKnoQRCZfIbznLH6J65bUdTLeGjUNYvU+1c
	+4WYwo7u3PUSKHzQwGCMfAXJGkGYXToz4ZK2sHK0F4iQWYmcu7Io9WBbl4es/c4friywf9PJ5Cg
	5z1IVi7HtA0t1UqNI1kRSd1NZMoIsg==
X-Received: by 2002:a05:693c:41ce:20b0:359:27e6:b684 with SMTP id 5a478bee46e88-36a2fd486a2mr23067415eec.3.1793701078964;
        Tue, 03 Nov 2026 02:17:58 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:58 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v11 07/10] mm/vmalloc: extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Tue,  3 Nov 2026 18:16:55 +0800
Message-Id: <20261103101658.766905-8-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
provides a clean interface by taking struct page **pages and mapping them
via direct PTE iteration. This avoids the page table rewalk seen when
using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.

Extend it to support larger page_shift values, and add PMD- and
contiguous-PTE mappings as well.

Rename it to vmap_pages_range_noflush_walk() since it now handles
more than just small pages.

For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
iterate over pages one by one via vmap_range_noflush(), which would
otherwise lead to page table rewalk. The code is now unified with the
PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 84 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 34 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e3ea9581e68d..61f2b6fbbcd9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -558,8 +558,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
+	unsigned long pfn, size;
+	unsigned int nr_pages;
 	int err = 0;
 	pte_t *pte;
 
@@ -590,9 +592,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 			break;
 		}
 
-		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
-		(*nr)++;
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+		pfn = page_to_pfn(page);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
+		nr_pages = PFN_DOWN(size);
+	} while (pte += nr_pages, *nr += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
@@ -602,60 +605,88 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pmd_t *pmd;
 	unsigned long next;
+	int err;
 
 	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
 	if (!pmd)
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+
+		if (shift >= PMD_SHIFT) {
+			struct page *page = pages[*nr];
+			phys_addr_t phys_addr;
+
+			if (WARN_ON(!page))
+				return -ENOMEM;
+			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
+				return -EINVAL;
+
+			phys_addr = page_to_phys(page);
+
+			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
+				*mask |= PGTBL_PMD_MODIFIED;
+				*nr += 1U << (PMD_SHIFT - PAGE_SHIFT);
+				continue;
+			}
+		}
+		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
+	int err;
 
 	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
 	if (!pud)
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pud++, addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
+	int err;
 
 	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
 	if (!p4d)
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages)
+/*
+ * It can take an array of pages which are not all contiguous, but it
+ * may have contiguous chunks, as hinted by @shift.
+ */
+static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, unsigned int shift)
 {
 	unsigned long start = addr;
 	pgd_t *pgd;
@@ -670,7 +701,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -693,28 +724,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
-	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
-
 	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
 		return -EINVAL;
 
-	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
+		page_shift = PAGE_SHIFT;
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
-
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
-					page_to_phys(pages[i]), prot,
-					page_shift);
-		if (err)
-			return err;
-
-		addr += 1UL << page_shift;
-	}
-
-	return 0;
+	return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-- 
2.34.1

