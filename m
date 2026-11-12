Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501097;
	b=42AmT0sFIKbH5k/rsIOyRBxi4/SA04H6tUSL/mxnZUa3tGU1FlfRLOyYMY2p6VjsQxg1
	 G/iQeZGuFxeZENHxRz/sfkETHsKtYbR1AD5q7nx8kQjYRHbvb1SWneXrcsdVKqiA5yzIr
	 ZGYvx0u7pTbrt6+Gd+H5HmbVcz8s4DPy+RtCk7wRUZm6G7YEygEjGZe/sQsWYWJziwWrt
	 jA3xaEIpf+v+4j395VYu4P2Cmqg2HNlHo/XCRJ4ww518L38/IY5cRqmztzEJzwgnr19QY
	 n2fdT4t/NdFG6KS7EQiDAB038Tzj2YS+syRGZmdWxkipKhJdj65XBv6KQwTJJs4oUMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501097;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=fM1F37ajfW1X2Ejd4MabbS3O0qayrImsgtwmgKJ3m1k=;
	b=wUEvYwJoSsiHrz+3G2z3DCAEL5eGJlYz9Y/o4W6MWFWV/Ig0g8H2ik4nw8mWyaZAz2gJ
	 P3KjXAC9vQvFu4imlA8InHunZ0TNicSVTh22E8vIqF+4VjOD729sFFu6RsQ5exbQJSxbb
	 DUHlO6raeYdyteWmt4Y+ygBXtmeqxvcnlkIem1ZB9NaKuZhnU/tUQ9nhelcA2F8dqDEfB
	 8/l7nxZEDH1TK1TXon3BON0h1m0K+6OHxDXIwoSHrVYU/6Rs8C6wZ3tvv+EOojy3zQdQy
	 AUG5g2jqhQn5HXjohzKFEem169E7h2w77FXoJ/ufN1pzagf7EYvrl2emJ4J5ZKQZa+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DrAHLCKn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746EB606A89A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DrAHLCKn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277471F000C4;
	Thu, 12 Nov 2026 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501097;
	bh=fM1F37ajfW1X2Ejd4MabbS3O0qayrImsgtwmgKJ3m1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DrAHLCKn1bRo+j2iB8Gm/6/ByguSGg8kL2GjVYsgwjdyCngzpM37sVtJeLW2Tq799
	 f+VNuOHN9yozjPFXIhHO0T9GF24x22VWhaWOpzgonJabCEJrNO/aeb7wejAJuET6ZJ
	 lIUnpmX0mVcyPWgBWTltgfnDATTHKpwQ4HyQWjCo3BYFdBZD3IDF1R8CldVd8PJvkp
	 AIV4RQpo/wohOfB4zUmUyxtemf9R+FPjMy33mfkX/XF52EIoqqIK+DySiDSINh4u9/
	 rTckFIdZCTht0qfkXzirL1N98CCRxdEdxPhvEf0PgvdB1mwzwTBCigsQOz+j0hugqD
	 OA2fmAzf3tEHw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 18:31:11 +0200
Subject: [PATCH 6/9] x86/mm/pat: remove CPA_ARRAY
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
Message-Id: <20261112-fixes-x86-v1-6-791adb8d6670@kernel.org>
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

Since commit a919198b97c8 ("x86/mm: Remove the unused
set_memory_array_*() functions") the only user of CPA_ARRAY is the CPA
self test.

Remove CPA_ARRAY and the address array case from the self test.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/cpa-test.c   | 15 ++++-------
 arch/x86/mm/pat/set_memory.c | 61 ++++++++++++++++----------------------------
 2 files changed, 27 insertions(+), 49 deletions(-)

diff --git a/arch/x86/mm/pat/cpa-test.c b/arch/x86/mm/pat/cpa-test.c
index ad3c1feec990d..e56a6942f8732 100644
--- a/arch/x86/mm/pat/cpa-test.c
+++ b/arch/x86/mm/pat/cpa-test.c
@@ -22,7 +22,7 @@
 static __read_mostly int print = 1;
 
 enum {
-	NTEST			= 3 * 100,
+	NTEST			= 2 * 100,
 	NPAGES			= 100,
 #ifdef CONFIG_X86_64
 	LPS			= (1 << PMD_SHIFT),
@@ -111,7 +111,6 @@ static unsigned long addr[NTEST];
 static unsigned int len[NTEST];
 
 static struct page *pages[NPAGES];
-static unsigned long addrs[NPAGES];
 
 /* Change the global bit on random pages in the direct mapping */
 static int pageattr_test(void)
@@ -169,7 +168,6 @@ static int pageattr_test(void)
 				break;
 			}
 			__set_bit(pfn + k, bm);
-			addrs[k] = addr[i] + k*PAGE_SIZE;
 			pages[k] = pfn_to_page(pfn + k);
 		}
 		if (!addr[i] || !pte || !k) {
@@ -177,16 +175,13 @@ static int pageattr_test(void)
 			continue;
 		}
 
-		switch (i % 3) {
+		switch (i % 2) {
 		case 0:
-			err = change_page_attr_set(&addr[i], len[i], PAGE_CPA_TEST, 0);
+			err = change_page_attr_set(&addr[i], len[i],
+						   PAGE_CPA_TEST);
 			break;
 
 		case 1:
-			err = change_page_attr_set(addrs, len[i], PAGE_CPA_TEST, 1);
-			break;
-
-		case 2:
 			err = cpa_set_pages_array(pages, len[i], PAGE_CPA_TEST);
 			break;
 		}
@@ -223,7 +218,7 @@ static int pageattr_test(void)
 			failed++;
 			continue;
 		}
-		err = change_page_attr_clear(&addr[i], len[i], PAGE_CPA_TEST, 0);
+		err = change_page_attr_clear(&addr[i], len[i], PAGE_CPA_TEST);
 		if (err < 0) {
 			printk(KERN_ERR "CPA reverting failed: %d\n", err);
 			failed++;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index a674433850dc9..dcc9fa2d4b47f 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -71,7 +71,6 @@ static const int cpa_warn_level = CPA_PROTECT;
 static DEFINE_SPINLOCK(cpa_lock);
 
 #define CPA_FLUSHTLB		0x01
-#define CPA_ARRAY		0x02
 #define CPA_PAGES_ARRAY		0x04
 #define CPA_NO_CHECK_ALIAS	0x08 /* Do not search for aliases */
 #define CPA_COLLAPSE		0x10 /* try to collapse large pages */
@@ -315,9 +314,6 @@ static unsigned long __cpa_addr(struct cpa_data *cpa, unsigned long idx)
 		return (unsigned long)page_address(page);
 	}
 
-	if (cpa->flags & CPA_ARRAY)
-		return cpa->vaddr[idx];
-
 	return *cpa->vaddr + idx * PAGE_SIZE;
 }
 
@@ -421,7 +417,7 @@ static void __cpa_collapse_large_pages(struct cpa_data *cpa)
 
 	guard(spinlock)(&cpa_lock);
 
-	if (cpa->flags & (CPA_PAGES_ARRAY | CPA_ARRAY)) {
+	if (cpa->flags & CPA_PAGES_ARRAY) {
 		for (i = 0; i < cpa->numpages; i++)
 			collapsed += collapse_large_pages(__cpa_addr(cpa, i),
 							  &pgtables);
@@ -1969,8 +1965,7 @@ static int cpa_process_alias(struct cpa_data *cpa)
 
 		alias_cpa = *cpa;
 		alias_cpa.vaddr = &laddr;
-		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_ARRAY |
-				     CPA_FLUSHTLB);
+		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_FLUSHTLB);
 		alias_cpa.curpage = 0;
 
 		/* Directmap always has NX set, do not modify. */
@@ -2000,8 +1995,7 @@ static int cpa_process_alias(struct cpa_data *cpa)
 					       __START_KERNEL_map - phys_base;
 		alias_cpa = *cpa;
 		alias_cpa.vaddr = &temp_cpa_vaddr;
-		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_ARRAY |
-				     CPA_FLUSHTLB);
+		alias_cpa.flags &= ~(CPA_PAGES_ARRAY | CPA_FLUSHTLB);
 		alias_cpa.curpage = 0;
 
 		/*
@@ -2072,7 +2066,7 @@ static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary)
 		 */
 		cpa->numpages = rempages;
 		/* for array changes, we can't use large page */
-		if (cpa->flags & (CPA_ARRAY | CPA_PAGES_ARRAY))
+		if (cpa->flags & CPA_PAGES_ARRAY)
 			cpa->numpages = 1;
 
 		if (lock) {
@@ -2129,15 +2123,7 @@ static int change_page_attr_set_clr(unsigned long *addr, int numpages,
 		return 0;
 
 	/* Ensure we are PAGE_SIZE aligned */
-	if (in_flag & CPA_ARRAY) {
-		int i;
-		for (i = 0; i < numpages; i++) {
-			if (addr[i] & ~PAGE_MASK) {
-				addr[i] &= PAGE_MASK;
-				WARN_ON_ONCE(1);
-			}
-		}
-	} else if (!(in_flag & CPA_PAGES_ARRAY)) {
+	if (!(in_flag & CPA_PAGES_ARRAY)) {
 		/*
 		 * in_flag of CPA_PAGES_ARRAY implies it is aligned.
 		 * No need to check in that case
@@ -2197,17 +2183,17 @@ static int change_page_attr_set_clr(unsigned long *addr, int numpages,
 }
 
 static inline int change_page_attr_set(unsigned long *addr, int numpages,
-				       pgprot_t mask, int array)
+				       pgprot_t mask)
 {
 	return change_page_attr_set_clr(addr, numpages, mask, __pgprot(0), 0,
-		(array ? CPA_ARRAY : 0), NULL);
+					0, NULL);
 }
 
 static inline int change_page_attr_clear(unsigned long *addr, int numpages,
-					 pgprot_t mask, int array)
+					 pgprot_t mask)
 {
 	return change_page_attr_set_clr(addr, numpages, __pgprot(0), mask, 0,
-		(array ? CPA_ARRAY : 0), NULL);
+					0, NULL);
 }
 
 static inline int cpa_set_pages_array(struct page **pages, int numpages,
@@ -2233,8 +2219,7 @@ int _set_memory_uc(unsigned long addr, int numpages)
 	 * these helpers cannot work with IO memory.
 	 */
 	return change_page_attr_set(&addr, numpages,
-				    cachemode2pgprot(_PAGE_CACHE_MODE_UC_MINUS),
-				    0);
+				cachemode2pgprot(_PAGE_CACHE_MODE_UC_MINUS));
 }
 
 int set_memory_uc(unsigned long addr, int numpages)
@@ -2267,8 +2252,7 @@ int _set_memory_wc(unsigned long addr, int numpages)
 	int ret;
 
 	ret = change_page_attr_set(&addr, numpages,
-				   cachemode2pgprot(_PAGE_CACHE_MODE_UC_MINUS),
-				   0);
+				   cachemode2pgprot(_PAGE_CACHE_MODE_UC_MINUS));
 	if (!ret) {
 		ret = change_page_attr_set_clr(&addr, numpages,
 					       cachemode2pgprot(_PAGE_CACHE_MODE_WC),
@@ -2298,14 +2282,14 @@ EXPORT_SYMBOL(set_memory_wc);
 int _set_memory_wt(unsigned long addr, int numpages)
 {
 	return change_page_attr_set(&addr, numpages,
-				    cachemode2pgprot(_PAGE_CACHE_MODE_WT), 0);
+				    cachemode2pgprot(_PAGE_CACHE_MODE_WT));
 }
 
 int _set_memory_wb(unsigned long addr, int numpages)
 {
 	/* WB cache mode is hard wired to all cache attribute bits being 0 */
 	return change_page_attr_clear(&addr, numpages,
-				      __pgprot(_PAGE_CACHE_MASK), 0);
+				      __pgprot(_PAGE_CACHE_MASK));
 }
 
 int set_memory_wb(unsigned long addr, int numpages)
@@ -2367,7 +2351,7 @@ int set_memory_x(unsigned long addr, int numpages)
 	if (!(__supported_pte_mask & _PAGE_NX))
 		return 0;
 
-	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_NX), 0);
+	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_NX));
 }
 
 int set_memory_nx(unsigned long addr, int numpages)
@@ -2375,12 +2359,13 @@ int set_memory_nx(unsigned long addr, int numpages)
 	if (!(__supported_pte_mask & _PAGE_NX))
 		return 0;
 
-	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_NX), 0);
+	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_NX));
 }
 
 int set_memory_ro(unsigned long addr, int numpages)
 {
-	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_RW | _PAGE_DIRTY), 0);
+	return change_page_attr_clear(&addr, numpages,
+				      __pgprot(_PAGE_RW | _PAGE_DIRTY));
 }
 
 int set_memory_rox(unsigned long addr, int numpages)
@@ -2396,12 +2381,12 @@ int set_memory_rox(unsigned long addr, int numpages)
 
 int set_memory_rw(unsigned long addr, int numpages)
 {
-	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_RW), 0);
+	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_RW));
 }
 
 int set_memory_np(unsigned long addr, int numpages)
 {
-	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_PRESENT), 0);
+	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_PRESENT));
 }
 
 int set_memory_np_noalias(unsigned long addr, int numpages)
@@ -2413,7 +2398,7 @@ int set_memory_np_noalias(unsigned long addr, int numpages)
 
 int set_memory_p(unsigned long addr, int numpages)
 {
-	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_PRESENT), 0);
+	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_PRESENT));
 }
 
 int set_memory_4k(unsigned long addr, int numpages)
@@ -2425,14 +2410,12 @@ int set_memory_4k(unsigned long addr, int numpages)
 
 int set_memory_nonglobal(unsigned long addr, int numpages)
 {
-	return change_page_attr_clear(&addr, numpages,
-				      __pgprot(_PAGE_GLOBAL), 0);
+	return change_page_attr_clear(&addr, numpages, __pgprot(_PAGE_GLOBAL));
 }
 
 int set_memory_global(unsigned long addr, int numpages)
 {
-	return change_page_attr_set(&addr, numpages,
-				    __pgprot(_PAGE_GLOBAL), 0);
+	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_GLOBAL));
 }
 
 /*

-- 
2.53.0

