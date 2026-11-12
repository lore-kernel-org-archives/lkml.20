Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501100;
	b=r51OtB3Pzu3bJbUhRzCaJhLufu5c511Pfa//l4leIJ5v56MnsGokCqPpJKgSAWNi842Z
	 rCUQ4spwWINqxDmzW1wkB3NVgb1GG2Wf3DvgzhVjmyqwHJR6wQ3tzmXPXZ27TAR2rJkdD
	 EQW9SMXk1nimim1DQAQaEQVZi6EKvfue+OhsPtEphpO/PiJGDCJd4JjQQF6VBkmcy/d1j
	 tntESqYdD1TaYh5d4a9OvprSMuLnsWpzyUxnQPKEgvDVC4kJ0pdPIigEnpvNHyZlf1Gee
	 jhClhcre3sTetBe+WBjsdgSI8AbhttUgrgoQ6xnhkFurHGRo/Y3sFxLitl7Xw0dM0rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501100;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=0qTAoMlfVwe+Os/5rLF2Gt/+Oi1IPI5tNdO9Xum7mo0=;
	b=AQahXgVrsoyUtX5X256AwCeNaFv/7+gUq8QJxp8rQt4oX4PZ6wQdICpxWZ8bsgAvQZS4
	 djVD0svKlEd9rmcJbc9RRPHBtEfrjKoGffL/b+8aHI9oUnHxhA8SchnrhTLmnc5rZWgZW
	 iTE/JZkm3G29SA9oMFNeK6ZwQuwNbShrCsatwpGxMMGYQvlmlZ4i86Wfe7LiEt6l/AgIm
	 CSqmP7OHpg9FTx5Y5fFhsmxh+STq3AI7llHDtanC7T2w8tRYA4W8OEeVmV4aU6gY1I+qW
	 vz6HotaxKt8iVIwBIM829WlL5cPt2rpJyh/FgGI2/pLhVPReVuDzxsEUq5Jom7lIIyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6onAiDK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0FA606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6onAiDK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877F11F000CA;
	Thu, 12 Nov 2026 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501100;
	bh=0qTAoMlfVwe+Os/5rLF2Gt/+Oi1IPI5tNdO9Xum7mo0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=W6onAiDKoHN5euFcjLbuEIXZefdBE996oyZc1xz89eqrQWmZdlemQQHIxm/dXK4Hj
	 BtkD3FrgkFiCX2DpwUmkkuyI/ElG6ZMf0tdYA6dQqk94YCoJdApE9L0OHsGtB5XN85
	 l/1kk10bREcwoGYsd/SkwR7Ljt7RFUC3nQVCuF9wM5x85/rquuyyfPCfn9UZecl8G7
	 86YfOrt+wk+2Sy50ZfqdPLMZvArFf4iLV+shRBvFS9zZJQ7jXBaogQC8tEWd1QYp2d
	 buj1/VFbRNdgqZHGTbqBn4T2ZwStTVzGy0ZLDk4NIGKk35oBh0T8MwLDRnrjMxNASC
	 Hi1m8YQoVgCKw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 18:31:12 +0200
Subject: [PATCH 7/9] x86/mm/pat: pass the address to CPA by value
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-fixes-x86-v1-7-791adb8d6670@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

cpa_data::vaddr is a pointer because it could point to an array of
addresses with CPA_ARRAY. With CPA_ARRAY gone it always points to a
single address on the caller's stack.

Every caller has to keep a local variable alive just to take its
address, and the alias processing creates temporaries for the same
reason.

Store the address in cpa_data itself.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/cpa-test.c   |  4 +--
 arch/x86/mm/pat/set_memory.c | 78 +++++++++++++++++++++-----------------------
 2 files changed, 39 insertions(+), 43 deletions(-)

diff --git a/arch/x86/mm/pat/cpa-test.c b/arch/x86/mm/pat/cpa-test.c
index e56a6942f8732..eef7fae6399bb 100644
--- a/arch/x86/mm/pat/cpa-test.c
+++ b/arch/x86/mm/pat/cpa-test.c
@@ -177,7 +177,7 @@ static int pageattr_test(void)
 
 		switch (i % 2) {
 		case 0:
-			err = change_page_attr_set(&addr[i], len[i],
+			err = change_page_attr_set(addr[i], len[i],
 						   PAGE_CPA_TEST);
 			break;
 
@@ -218,7 +218,7 @@ static int pageattr_test(void)
 			failed++;
 			continue;
 		}
-		err = change_page_attr_clear(&addr[i], len[i], PAGE_CPA_TEST);
+		err = change_page_attr_clear(addr[i], len[i], PAGE_CPA_TEST);
 		if (err < 0) {
 			printk(KERN_ERR "CPA reverting failed: %d\n", err);
 			failed++;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index dcc9fa2d4b47f..94b661c5f7885 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -40,7 +40,7 @@
  * The current flushing context - we pass it instead of 5 arguments:
  */
 struct cpa_data {
-	unsigned long	*vaddr;
+	unsigned long	addr;
 	pgd_t		*pgd;
 	pgprot_t	mask_set;
 	pgprot_t	mask_clr;
@@ -314,7 +314,7 @@ static unsigned long __cpa_addr(struct cpa_data *cpa, unsigned long idx)
 		return (unsigned long)page_address(page);
 	}
 
-	return *cpa->vaddr + idx * PAGE_SIZE;
+	return cpa->addr + idx * PAGE_SIZE;
 }
 
 /*
@@ -1855,8 +1855,8 @@ static int __cpa_process_fault(struct cpa_data *cpa, unsigned long vaddr,
 		return -EFAULT;
 	} else {
 		WARN(1, KERN_WARNING "CPA: called for zero pte. "
-			"vaddr = %lx cpa->vaddr = %lx\n", vaddr,
-			*cpa->vaddr);
+			"vaddr = %lx cpa->addr = %lx\n", vaddr,
+			cpa->addr);
 
 		return -EFAULT;
 	}
@@ -1948,7 +1948,6 @@ static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary);
 static int cpa_process_alias(struct cpa_data *cpa)
 {
 	struct cpa_data alias_cpa;
-	unsigned long laddr = (unsigned long)__va(cpa->pfn << PAGE_SHIFT);
 	unsigned long vaddr;
 	int ret;
 
@@ -1964,7 +1963,7 @@ static int cpa_process_alias(struct cpa_data *cpa)
 		    PAGE_OFFSET + (max_pfn_mapped << PAGE_SHIFT)))) {
 
 		alias_cpa = *cpa;
-		alias_cpa.vaddr = &laddr;
+		alias_cpa.addr = (unsigned long)__va(cpa->pfn << PAGE_SHIFT);
 		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_FLUSHTLB);
 		alias_cpa.curpage = 0;
 
@@ -1991,10 +1990,9 @@ static int cpa_process_alias(struct cpa_data *cpa)
 	 */
 	if (!within(vaddr, (unsigned long)_text, _brk_end) &&
 	    __cpa_pfn_in_highmap(cpa->pfn)) {
-		unsigned long temp_cpa_vaddr = (cpa->pfn << PAGE_SHIFT) +
-					       __START_KERNEL_map - phys_base;
 		alias_cpa = *cpa;
-		alias_cpa.vaddr = &temp_cpa_vaddr;
+		alias_cpa.addr = (cpa->pfn << PAGE_SHIFT) +
+				 __START_KERNEL_map - phys_base;
 		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_FLUSHTLB);
 		alias_cpa.curpage = 0;
 
@@ -2103,7 +2101,7 @@ static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary)
 	return ret;
 }
 
-static int change_page_attr_set_clr(unsigned long *addr, int numpages,
+static int change_page_attr_set_clr(unsigned long addr, int numpages,
 				    pgprot_t mask_set, pgprot_t mask_clr,
 				    int force_split, int in_flag,
 				    struct page **pages)
@@ -2128,8 +2126,8 @@ static int change_page_attr_set_clr(unsigned long *addr, int numpages,
 		 * in_flag of CPA_PAGES_ARRAY implies it is aligned.
 		 * No need to check in that case
 		 */
-		if (*addr & ~PAGE_MASK) {
-			*addr &= PAGE_MASK;
+		if (addr & ~PAGE_MASK) {
+			addr &= PAGE_MASK;
 			/*
 			 * People should not be passing in unaligned addresses:
 			 */
@@ -2142,7 +2140,7 @@ static int change_page_attr_set_clr(unsigned long *addr, int numpages,
 
 	vm_unmap_aliases();
 
-	cpa.vaddr = addr;
+	cpa.addr = addr;
 	cpa.pages = pages;
 	cpa.numpages = numpages;
 	cpa.mask_set = mask_set;
@@ -2182,14 +2180,14 @@ static int change_page_attr_set_clr(unsigned long *addr, int numpages,
 	return ret;
 }
 
-static inline int change_page_attr_set(unsigned long *addr, int numpages,
+static inline int change_page_attr_set(unsigned long addr, int numpages,
 				       pgprot_t mask)
 {
 	return change_page_attr_set_clr(addr, numpages, mask, __pgprot(0), 0,
 					0, NULL);
 }
 
-static inline int change_page_attr_clear(unsigned long *addr, int numpages,
+static inline int change_page_attr_clear(unsigned long addr, int numpages,
 					 pgprot_t mask)
 {
 	return change_page_attr_set_clr(addr, numpages, __pgprot(0), mask, 0,
@@ -2199,14 +2197,14 @@ static inline int change_page_attr_clear(unsigned long *addr, int numpages,
 static inline int cpa_set_pages_array(struct page **pages, int numpages,
 				       pgprot_t mask)
 {
-	return change_page_attr_set_clr(NULL, numpages, mask, __pgprot(0), 0,
+	return change_page_attr_set_clr(0, numpages, mask, __pgprot(0), 0,
 		CPA_PAGES_ARRAY, pages);
 }
 
 static inline int cpa_clear_pages_array(struct page **pages, int numpages,
 					 pgprot_t mask)
 {
-	return change_page_attr_set_clr(NULL, numpages, __pgprot(0), mask, 0,
+	return change_page_attr_set_clr(0, numpages, __pgprot(0), mask, 0,
 		CPA_PAGES_ARRAY, pages);
 }
 
@@ -2218,7 +2216,7 @@ int _set_memory_uc(unsigned long addr, int numpages)
 	 * that you cannot override IO areas with set_memory_*() as
 	 * these helpers cannot work with IO memory.
 	 */
-	return change_page_attr_set(&addr, numpages,
+	return change_page_attr_set(addr, numpages,
 				cachemode2pgprot(_PAGE_CACHE_MODE_UC_MINUS));
 }
 
@@ -2251,10 +2249,10 @@ int _set_memory_wc(unsigned long addr, int numpages)
 {
 	int ret;
 
-	ret = change_page_attr_set(&addr, numpages,
+	ret = change_page_attr_set(addr, numpages,
 				   cachemode2pgprot(_PAGE_CACHE_MODE_UC_MINUS));
 	if (!ret) {
-		ret = change_page_attr_set_clr(&addr, numpages,
+		ret = change_page_attr_set_clr(addr, numpages,
 					       cachemode2pgprot(_PAGE_CACHE_MODE_WC),
 					       __pgprot(_PAGE_CACHE_MASK),
 					       0, 0, NULL);
@@ -2281,14 +2279,14 @@ EXPORT_SYMBOL(set_memory_wc);
 
 int _set_memory_wt(unsigned long addr, int numpages)
 {
-	return change_page_attr_set(&addr, numpages,
+	return change_page_attr_set(addr, numpages,
 				    cachemode2pgprot(_PAGE_CACHE_MODE_WT));
 }
 
 int _set_memory_wb(unsigned long addr, int numpages)
 {
 	/* WB cache mode is hard wired to all cache attribute bits being 0 */
-	return change_page_attr_clear(&addr, numpages,
+	return change_page_attr_clear(addr, numpages,
 				      __pgprot(_PAGE_CACHE_MASK));
 }
 
@@ -2351,7 +2349,7 @@ int set_memory_x(unsigned long addr, int numpages)
 	if (!(__supported_pte_mask & _PAGE_NX))
 		return 0;
 
-	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_NX));
+	return change_page_attr_clear(addr, numpages, __pgprot(_PAGE_NX));
 }
 
 int set_memory_nx(unsigned long addr, int numpages)
@@ -2359,12 +2357,12 @@ int set_memory_nx(unsigned long addr, int numpages)
 	if (!(__supported_pte_mask & _PAGE_NX))
 		return 0;
 
-	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_NX));
+	return change_page_attr_set(addr, numpages, __pgprot(_PAGE_NX));
 }
 
 int set_memory_ro(unsigned long addr, int numpages)
 {
-	return change_page_attr_clear(&addr, numpages,
+	return change_page_attr_clear(addr, numpages,
 				      __pgprot(_PAGE_RW | _PAGE_DIRTY));
 }
 
@@ -2375,47 +2373,47 @@ int set_memory_rox(unsigned long addr, int numpages)
 	if (__supported_pte_mask & _PAGE_NX)
 		clr.pgprot |= _PAGE_NX;
 
-	return change_page_attr_set_clr(&addr, numpages, __pgprot(0), clr, 0,
+	return change_page_attr_set_clr(addr, numpages, __pgprot(0), clr, 0,
 					CPA_COLLAPSE, NULL);
 }
 
 int set_memory_rw(unsigned long addr, int numpages)
 {
-	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_RW));
+	return change_page_attr_set(addr, numpages, __pgprot(_PAGE_RW));
 }
 
 int set_memory_np(unsigned long addr, int numpages)
 {
-	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_PRESENT));
+	return change_page_attr_clear(addr, numpages, __pgprot(_PAGE_PRESENT));
 }
 
 int set_memory_np_noalias(unsigned long addr, int numpages)
 {
-	return change_page_attr_set_clr(&addr, numpages, __pgprot(0),
+	return change_page_attr_set_clr(addr, numpages, __pgprot(0),
 					__pgprot(_PAGE_PRESENT), 0,
 					CPA_NO_CHECK_ALIAS, NULL);
 }
 
 int set_memory_p(unsigned long addr, int numpages)
 {
-	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_PRESENT));
+	return change_page_attr_set(addr, numpages, __pgprot(_PAGE_PRESENT));
 }
 
 int set_memory_4k(unsigned long addr, int numpages)
 {
-	return change_page_attr_set_clr(&addr, numpages,
+	return change_page_attr_set_clr(addr, numpages,
 					__pgprot(_PAGE_KERNEL_4K),
 					__pgprot(0), 1, 0, NULL);
 }
 
 int set_memory_nonglobal(unsigned long addr, int numpages)
 {
-	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_GLOBAL));
+	return change_page_attr_clear(addr, numpages, __pgprot(_PAGE_GLOBAL));
 }
 
 int set_memory_global(unsigned long addr, int numpages)
 {
-	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_GLOBAL));
+	return change_page_attr_set(addr, numpages, __pgprot(_PAGE_GLOBAL));
 }
 
 /*
@@ -2433,7 +2431,7 @@ static int __set_memory_enc_pgtable(unsigned long addr, int numpages, bool enc)
 		addr &= PAGE_MASK;
 
 	memset(&cpa, 0, sizeof(cpa));
-	cpa.vaddr = &addr;
+	cpa.addr = addr;
 	cpa.numpages = numpages;
 	cpa.mask_set = enc ? pgprot_encrypted(empty) : pgprot_decrypted(empty);
 	cpa.mask_clr = enc ? pgprot_decrypted(empty) : pgprot_encrypted(empty);
@@ -2569,7 +2567,7 @@ static int _set_pages_array(struct page **pages, int numpages,
 	ret = cpa_set_pages_array(pages, numpages,
 				  cachemode2pgprot(set_type));
 	if (!ret && new_type == _PAGE_CACHE_MODE_WC)
-		ret = change_page_attr_set_clr(NULL, numpages,
+		ret = change_page_attr_set_clr(0, numpages,
 					       cachemode2pgprot(
 						_PAGE_CACHE_MODE_WC),
 					       __pgprot(_PAGE_CACHE_MASK),
@@ -2650,8 +2648,7 @@ int set_pages_rw(struct page *page, int numpages)
 
 static int __set_pages_p(struct page *page, int numpages, unsigned int cpa_flags)
 {
-	unsigned long tempaddr = (unsigned long) page_address(page);
-	struct cpa_data cpa = { .vaddr = &tempaddr,
+	struct cpa_data cpa = { .addr = (unsigned long)page_address(page),
 				.pgd = NULL,
 				.numpages = numpages,
 				.mask_set = __pgprot(_PAGE_PRESENT | _PAGE_RW),
@@ -2669,8 +2666,7 @@ static int __set_pages_p(struct page *page, int numpages, unsigned int cpa_flags
 
 static int __set_pages_np(struct page *page, int numpages, unsigned int cpa_flags)
 {
-	unsigned long tempaddr = (unsigned long) page_address(page);
-	struct cpa_data cpa = { .vaddr = &tempaddr,
+	struct cpa_data cpa = { .addr = (unsigned long)page_address(page),
 				.pgd = NULL,
 				.numpages = numpages,
 				.mask_set = __pgprot(0),
@@ -2756,7 +2752,7 @@ int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn, unsigned long address,
 	int retval = -EINVAL;
 
 	struct cpa_data cpa = {
-		.vaddr = &address,
+		.addr = address,
 		.pfn = pfn,
 		.pgd = pgd,
 		.numpages = numpages,
@@ -2799,7 +2795,7 @@ int __init kernel_unmap_pages_in_pgd(pgd_t *pgd, unsigned long address,
 	 * the *target* of a mapping, it's not useful while unmapping.
 	 */
 	struct cpa_data cpa = {
-		.vaddr		= &address,
+		.addr		= address,
 		.pfn		= 0,
 		.pgd		= pgd,
 		.numpages	= numpages,

-- 
2.53.0

