Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059448;
	b=wbIPmuinJw5fxcMDfwXOpWS5r8sOoHk6rw2PrddZr1Zwv8hZc6MKn24Lx/lK5WOo7lJm
	 tukmXSrYX40ahr5IBR51Wr95/1fRfG07rdei3LN4hF+7ehkGAypS1QhUgsxHpNOqI6BX0
	 xMhgWrdHflrRFoLGcoPuA6x4YPjfvLZyjyL4ZuJWNXb+bIuDPb15zSXI8CF2U2aZl5wLY
	 c391QUPhdF8QTWcnZ0Y3zzO5pniVfUDIxS7usJL0M4Aq7mT82OuL4PK7QmAPIehE2s3bX
	 u/DzKEPt5qB2ROwNpBQym17h1GOFez4fXjQ3LTk9jvvp4ckZ1R7SupYcTs+QGl+8Orw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=felPx3uV3OszLiAgjC6qYiNB56VtKrw17gOMSvN5MlY=;
	b=xmEWGUVBfkXj87zxVeJKaYrxBi1etKhySkethZeoD8rP8MWTI96NXfxVWDQ9+GqBMkB9
	 2cwRPpv1EUiuoqP5EgnmiWwwUJb1ctow6kDBjPGZEwgwCbKOf5W8/sJPRRqxOZE27vJxf
	 MJoITFZtOmba4+gj4uwkqZW9L1RN6dzmYVaYmbauyegYQpwbPT4TiyXeVDBdgENBuEDxw
	 R3lr8HhVUXFf9yRNCuUy7rNoahRP4Ip8060HUT42Rfcb5QWDlWTnfdAe8RfaN/LLYlzIG
	 H0BpE1rc8gprKEEFg26ec8+qPHT9PUnVRmZuTdoXxcZj9noIFwS12Y1Mt3SfO2DUxng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M4IGfEoT;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58665606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58665606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M4IGfEoT
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2442089eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059447; x=1794664247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=felPx3uV3OszLiAgjC6qYiNB56VtKrw17gOMSvN5MlY=;
        b=M4IGfEoTkpIR9zBfhzmX1FwTrWx44ZdphG+NXpYQkeQrnEpuEi6r+pI1ZURgPbYfIB
         kPDjCq4UY7YhXvgApPKxS/Ug49OCScjmnSHsXUERIWFAd1aS1mrhou5AvweOhWenM3od
         qeIZeVo9AAieRwFprBUQoQzHb2EdiYOU11DJlbKNbKF1x6CHgBcLNBaQGL2cK9TJzlkj
         60jLVr+w0JvMVqwNTFasDtrbY9r+PZst+UQefXa4KKJLeNMT2mQIbZ6CRrJf1jW+Bzcp
         EmELc5bmttVdKNGRQY5gDXNjejTAQZxh02hHBx+TuktQ2d7jBObNJUhU7NXK7ITtPkjT
         mQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059447; x=1794664247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=felPx3uV3OszLiAgjC6qYiNB56VtKrw17gOMSvN5MlY=;
        b=IEB3r/2ysgWiCnuntjvsBpNPDL/pT9DmByBMrozzO2hiJ6qvHW2GCMRBVGcAnB37RF
         1M+ggfIaUpUfCDXaZyliL8rlkvsX8cluP5P3YpBN1eb5ZiNS29AdU3jcGEcYs7AGGgcG
         0rK9BbyTAWceVeySOHP4FX24LS3pYAdovmPLz612ysS4UAYVM5ODRS6h5Og5BzNi+xdD
         OlDEDlMLXU9G+JB89fXmFNfUVfRV6giQ6gFgwIbji1zZNw+d56nhldPlk+6RGmbFf+eC
         IM8LNAwwIzQryu8NXKmVU75JpZ4tycXUKqOIe3/0LUFattQJJJvgmiOiT6idGWLVas2d
         VpEA==
X-Forwarded-Encrypted: i=1; AL+hErEHncrYpTsA8y30KkfiDpwzX9Atf4ctFd30rvxP0qqnQeS+v0M1gQ+VCHVQnFSc1PZcwLkyHbw5ZPjdo6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q2sL1BFUvY2wltazYjnbJtkXhqcZUZcvqZWA3yuTxohmVTpcU
	jfq57tuCxvP2C/DX1SXWhgvU42TNEB/jgjmXln5y1g7SqBAuZJYlgwcf
X-Gm-Gg: AYBFou39Nq0LOJ7bqgUaECeHWKL6+RoXDLC0r2dgz8/PE3ycfqVmKJwtPnBlbzPF+oe
	+VL89OSQeNKaK2ZcyirHuTvQnzWvXhU/E/OamKEp1Q/Q/+/BYNangd6J7XZDgLEAUC704uz5tnf
	gWvrqU8dN9GiisDCmVjACWwmZw/ULc8+ID5nBlwjxFBoI1PsxU+W5ljSthDXBe1EqRr+RY87474
	R4OqDUTFDV8Y9zAG8k0qx5GA2mr1ZJcKs9/hAKzmfm4QfEU9WmsSh1s86HMR4N7kZsniLMvR5qm
	TieK0nEo98jEwdN1X1NXUeoRuOzCS8/sThHWZI5QgTYlc04eRmvuZ0ZpAyAHKAiFJ1ITniVNZ2c
	6U//pDqqK5JRfcEDQvSwt2SW8P+noryOKuZZfLRrti2xBKVrJqbuZ+zo5GSRTGU6kDKrdku+Bpx
	1o4mmS3BkfUjEVtr19wgpwwNmXFj4dTTrVMOiqbGeIp6y4PXxQ/lFvtZ+ZvkTBR0+lm/yWm0n52
	Hh3Zz5H2S2ORotZkFgRFaiMzAmBPLWlpkzh7DgXCrrRSpBeCN5fuFuaaUVaIPzsPbLTOcwTHF0I
	zBt53XE5VJ90p+Svcpzzq+H/4bV5J91dCYcD2U0vXd0sgXV8WkE7Y3s8RA==
X-Received: by 2002:a05:693c:88cd:20b0:370:1333:5e84 with SMTP id 5a478bee46e88-37013335ee3mr5769315eec.11.1794059447224;
        Sat, 07 Nov 2026 05:50:47 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:46 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 07/10] mm/vmalloc: extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Sat,  7 Nov 2026 21:49:50 +0800
Message-Id: <20261107134953.748622-8-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
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

The pages array may hold several physically discontiguous chunks that
are mapped with the same @shift. If the virtual range is not aligned to
the chunk size, a PMD boundary can split a chunk, and the walk resumes
in the next PMD in the middle of it. arch_vmap_pte_range_map_size()
only checks CONT_PTE_SIZE alignment there and could map past the end of
the chunk, so clamp each PTE-level mapping to the remainder of the
current chunk.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 88 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 54 insertions(+), 34 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e3ea9581e68d0..f2dd9bef4de0f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -558,8 +558,11 @@ void vunmap_range(unsigned long addr, unsigned long end)
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
+	const unsigned long chunk_pages = 1UL << (shift - PAGE_SHIFT);
+	unsigned long pfn, size, chunk_end;
+	unsigned int nr_pages;
 	int err = 0;
 	pte_t *pte;
 
@@ -590,9 +593,13 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 			break;
 		}
 
-		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
-		(*nr)++;
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+		pfn = page_to_pfn(page);
+
+		/* A PMD boundary may split a chunk; never map past its end. */
+		chunk_end = addr + ((ALIGN(pfn + 1, chunk_pages) - pfn) << PAGE_SHIFT);
+		size = vmap_set_ptes(pte, addr, min(end, chunk_end), pfn, prot, shift);
+		nr_pages = PFN_DOWN(size);
+	} while (pte += nr_pages, *nr += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
@@ -602,60 +609,88 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 
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
@@ -670,7 +705,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -693,28 +728,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
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

