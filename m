Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222095;
	b=ZXuNqhcvP/W3bO2C7TBg6lS3bjziKEBMPxYPALeGRy+EYQUs/1gHMUTY/66AwPxfxBWe
	 suFDoQ3oyBlzpLS4nhelP3bFSnGNJvLvdq+hOnj6uKGR64aWoRTG/tBMnj4bYImljsXFm
	 YtQaSkxC8dEM3EfW3oDyG10QzXgWjrudiRDQ4F+BwP8BTZ6EdvK1vzT+sR12TH3h7UOVc
	 bjGMzl9uTZiRIhm4aJNXfCzv6RgfuX20jsc6dUVFE1CGlnWwZxpGIV6DebfQYraEdsgsj
	 Mi2EHkdQE8vFJT+JgVsNwI/opKlMy2NO5hDnIX76gnIrDVNkJZrCi2hsPR6EH4aovzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222095;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-Id:Received:
	 Received:X-Zmail-TransId:X-Mailer:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-MSS:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=beIBcyFN1BRe102pheZSrLOLmlqrYfQKPZrVFcddlco=;
	b=j+f6KSBkhBzEog6qtR6R//Sp2dXmrJ+IK0deplDScOjytjy5RLZyWj/49f01qVvH4WH8
	 Xbk8roRV5rk0HSwGgyR4eko0EsNKE4gJHV00L3WyECacb7d43IgtnaelaWXb6k89kI8V+
	 c8uwrBj8oGP+qFtGcLYfISGT5GoFoidU7h6qVf5hJrkMRqRZmYAj3oF/GZRtp1vBXzyE5
	 lrALq4X7E78eFykQFXRbze3478HA2XIhNZvgomXUgb8i8I+DTBIGmG9ZX30HMzLWvzGtP
	 9YKFNHN3GYLYAr/5yotn7DEYwmRrmrynSZ/TK/WzYOge5INHalZpOq6ag/jXuZBDcYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=ZUs+FV59;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C40606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C40606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=ZUs+FV59
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jNRft36Scz8XrrJ;
	Mon, 09 Nov 2026 19:01:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794222086;
	bh=itkllB25WknucUpyACa0RC+UTO1VRBYX5JFqDj30goQ=;
	h=Date:From:To:Cc:Subject;
	b=ZUs+FV59KZ0bCuO+9b9BlOaIB9EPgu2xXOJA5LA0i1SUxrGoC2mk0QErmqMo+mrNS
	 DCTsaMNvXU/5VnIOYvrMCOOioOtXONIwGs4xWAvj536yWpRIBHwKnzOeYDb56VFgEL
	 f3Ash0CLECXby8f6HMsAUffLs94HxSfBMqe9qe0UbAsdv4qRJji12lBCHPhDCdyupY
	 7iCP2Ojtscw0OU90z3ETTGk6i+NukgzlLR0+EoBI0x+1Hbjllj3t0q/+ZqzOxAFqxg
	 dy/lEd8rlIk82FkX7wBKR1XLxCBGRX0xKzPGZWu7p4mt+V9I/yOAo2NXTR2oyffhSs
	 JF/09UXTx5txQ==
Received: (from root@localhost)
	by mse-db.zte.com.cn id 6A9B1Nf3015337;
	Mon, 9 Nov 2026 19:01:23 +0800 (+08)
	(envelope-from li.hanting@zte.com.cn)
Message-Id: <202611091101.6A9B1Nf3015337@mse-db.zte.com.cn>
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl1.zte.com.cn with SMTP id 6A98Ea6W097280;
	Mon, 9 Nov 2026 16:14:36 +0800 (+08)
	(envelope-from li.hanting@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid203;
	Mon, 9 Nov 2026 16:14:38 +0800 (CST)
X-Zmail-TransId: 2afb6af180ee1f1-e104d
X-Mailer: Zmail v1.0
Date: Mon, 9 Nov 2026 16:14:38 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <li.hanting@zte.com.cn>
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <ljs@kernel.org>,
        <rppt@kernel.org>
Subject: =?UTF-8?B?W1JGQyBQQVRDSF0gcmlzY3Y6IG1tOiBhbGxvY2F0ZSBzcGxpdCBsaW5lYXIgbWFwcGluZyBwYWdlIHRhYmxlcyB2aWEgdGhlIHN0YW5kYXJkIHBhZ2UgdGFibGUgYWxsb2NhdGlvbiBBUElz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-db.zte.com.cn 6A9B1Nf3015337
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: li.hanting@zte.com.cn
X-SOURCE-IP: 10.5.228.131 unknown Mon, 09 Nov 2026 19:01:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF1A806.000/4jNRft36Scz8XrrJ

Hi,

Commit 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel
page tables") recently fixed a latent inconsistency in the x86 CPA code
(assigned CVE-2026-97525): __split_large_page() allocated the new PTE
page with a bare pagetable_alloc(), bypassing pte_alloc_one_kernel(), so
the page table constructor never ran and the resulting page was neither
flagged PG_table, nor accounted in NR_PAGETABLE, nor marked as a kernel
page table.

While looking at the fallout of that commit, I noticed that RISC-V
open-codes the same pattern when splitting the linear mapping on behalf
of set_memory_*(): __split_linear_mapping_{pmd,pud,p4d}() allocate the
new page table pages with bare alloc_page(GFP_KERNEL) - three call
sites in arch/riscv/mm/pageattr.c, introduced by 311cd2f6e253 ("riscv:
Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear
mappings").

The consequences are the same as on pre-fix x86: page tables that live
in init_mm without the PG_table flag, without NR_PAGETABLE accounting
and without the kernel ptdesc marking.

To be clear about severity: this is a latent inconsistency, not an
exploitable bug today. RISC-V never collapses the split linear mapping
back, and these page tables are never freed, so there is no free-path
mismatch of the kind the x86 fix was concerned about. But the
accounting mismatch is real (/proc/vmstat under-counts kernel page
tables), and any future work that frees these tables - linear map
memory hotplug, collapse support or anything similar - would inherit
the exact bug class the x86 fix addressed.

This RFC aligns the three sites with the standard allocation paths:

 - the PTE level switches to pte_alloc_one_kernel(), exactly like the
   x86 fix;

 - the PMD and PUD levels have no *_alloc_one_kernel() variant today,
   so a small local helper wraps pagetable_alloc() +
   __pagetable_ctor() + ptdesc_set_kernel(), mirroring what the
   generic PTE path does. GFP_PGTABLE_KERNEL also brings in
   __GFP_ZERO, which the open-coded allocation was missing.

No functional change is intended; the observable difference is that
split linear mapping page tables now show up in
/proc/vmstat:nr_page_table_pages.

Open questions:

 1. Would it make sense to provide generic pmd_alloc_one_kernel() /
    pud_alloc_one_kernel() variants in asm-generic/pgalloc.h so that
    architectures do not have to open-code this dance? This is the
    main reason this is an RFC rather than a regular patch.

 2. Since these tables are never freed today, is it preferable to take
    this alignment now (my preference: it removes a trap for any
    future free-path work), or defer it until such work actually
    lands?

    (Note: the generic CPA rework series "[PATCH RFC 00/18] arch, mm:
    create a generic set_memory/change_page_attr core" would eventually
    replace this code entirely; this patch is intended as a small fix in
    the meantime. The series author has said he is waiting for such
    fixes to settle before posting a non-RFC version.)

Comments welcome.

Signed-off-by: Hanting Li <li.hanting@zte.com.cn>

---
 arch/riscv/mm/pageattr.c | 65 ++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -3,9 +3,11 @@
  * Copyright (C) 2019 SiFive
  */

+#include <linux/mm.h>
 #include <linux/pagewalk.h>
 #include <linux/pgtable.h>
 #include <linux/vmalloc.h>
+#include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include <asm/bitops.h>
 #include <asm/set_memory.h>
@@ -93,6 +95,26 @@
 };

 #ifdef CONFIG_64BIT
+/*
+ * Kernel page tables allocated for the split linear mapping are never
+ * freed today, but they must still go through the page table constructor
+ * so that they are flagged PG_table, accounted in NR_PAGETABLE and marked
+ * as kernel page tables, like any other kernel page table allocated via
+ * the standard allocation APIs.
+ */
+static struct ptdesc *alloc_kernel_pgtable(void)
+{
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, 0);
+
+	if (!ptdesc)
+		return NULL;
+
+	__pagetable_ctor(ptdesc);
+	ptdesc_set_kernel(ptdesc);
+
+	return ptdesc;
+}
+
 static int __split_linear_mapping_pmd(pud_t *pudp,
 				      unsigned long vaddr, unsigned long end)
 {
@@ -109,23 +131,22 @@
 			continue;

 		if (pmd_leaf(pmdp_get(pmdp))) {
-			struct page *pte_page;
 			unsigned long pfn = _pmd_pfn(pmdp_get(pmdp));
 			pgprot_t prot = __pgprot(pmd_val(pmdp_get(pmdp)) & ~_PAGE_PFN_MASK);
 			pte_t *ptep_new;
 			int i;

-			pte_page = alloc_page(GFP_KERNEL);
-			if (!pte_page)
+			ptep_new = pte_alloc_one_kernel(&init_mm);
+			if (!ptep_new)
 				return -ENOMEM;

-			ptep_new = (pte_t *)page_address(pte_page);
-			for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep_new)
-				set_pte(ptep_new, pfn_pte(pfn + i, prot));
+			for (i = 0; i < PTRS_PER_PTE; ++i)
+				set_pte(ptep_new + i, pfn_pte(pfn + i, prot));

 			smp_wmb();

-			set_pmd(pmdp, pfn_pmd(page_to_pfn(pte_page), PAGE_TABLE));
+			set_pmd(pmdp, pfn_pmd(page_to_pfn(virt_to_page(ptep_new)),
+					      PAGE_TABLE));
 		}
 	} while (pmdp++, vaddr = next, vaddr != end);

@@ -149,24 +170,25 @@
 			continue;

 		if (pud_leaf(pudp_get(pudp))) {
-			struct page *pmd_page;
+			struct ptdesc *ptdesc;
 			unsigned long pfn = _pud_pfn(pudp_get(pudp));
 			pgprot_t prot = __pgprot(pud_val(pudp_get(pudp)) & ~_PAGE_PFN_MASK);
 			pmd_t *pmdp_new;
 			int i;

-			pmd_page = alloc_page(GFP_KERNEL);
-			if (!pmd_page)
+			ptdesc = alloc_kernel_pgtable();
+			if (!ptdesc)
 				return -ENOMEM;

-			pmdp_new = (pmd_t *)page_address(pmd_page);
-			for (i = 0; i < PTRS_PER_PMD; ++i, ++pmdp_new)
-				set_pmd(pmdp_new,
+			pmdp_new = (pmd_t *)ptdesc_address(ptdesc);
+			for (i = 0; i < PTRS_PER_PMD; ++i)
+				set_pmd(pmdp_new + i,
 					pfn_pmd(pfn + ((i * PMD_SIZE) >> PAGE_SHIFT), prot));

 			smp_wmb();

-			set_pud(pudp, pfn_pud(page_to_pfn(pmd_page), PAGE_TABLE));
+			set_pud(pudp, pfn_pud(page_to_pfn(ptdesc_page(ptdesc)),
+					      PAGE_TABLE));
 		}

 		ret = __split_linear_mapping_pmd(pudp, vaddr, next);
@@ -198,23 +220,23 @@
 			continue;

 		if (p4d_leaf(p4dp_get(p4dp))) {
-			struct page *pud_page;
+			struct ptdesc *ptdesc;
 			unsigned long pfn = _p4d_pfn(p4dp_get(p4dp));
 			pgprot_t prot = __pgprot(p4d_val(p4dp_get(p4dp)) & ~_PAGE_PFN_MASK);
 			pud_t *pudp_new;
 			int i;

-			pud_page = alloc_page(GFP_KERNEL);
-			if (!pud_page)
+			ptdesc = alloc_kernel_pgtable();
+			if (!ptdesc)
 				return -ENOMEM;

 			/*
 			 * Fill the pud level with leaf puds that have the same
 			 * protections as the leaf p4d.
 			 */
-			pudp_new = (pud_t *)page_address(pud_page);
-			for (i = 0; i < PTRS_PER_PUD; ++i, ++pudp_new)
-				set_pud(pudp_new,
+			pudp_new = (pud_t *)ptdesc_address(ptdesc);
+			for (i = 0; i < PTRS_PER_PUD; ++i)
+				set_pud(pudp_new + i,
 					pfn_pud(pfn + ((i * PUD_SIZE) >> PAGE_SHIFT), prot));

 			/*
@@ -224,7 +246,8 @@
 			 */
 			smp_wmb();

-			set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE_TABLE));
+			set_p4d(p4dp, pfn_p4d(page_to_pfn(ptdesc_page(ptdesc)),
+					      PAGE_TABLE));
 		}

 		ret = __split_linear_mapping_pud(p4dp, vaddr, next);
