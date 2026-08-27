Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1EE47CA87
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847889; cv=none; b=j+EGMRDhZEgp9LEywaPBF1cIPLxl7T5GNQ9DM/OoEchopuukAgbUN83NhHJ70oIfd9GoeTlCEe3LBcj5bP9TpjaX4Vws3YiGTDcoObZe7ucMoJN4jEj0tNeHX4QWfxlGaZ6fZ2eab1Kxz+ZuToUi5JHR6gfnx11U+KSmw+HWcQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847889; c=relaxed/simple;
	bh=wsoq5ycG3ToejydWj8Zt1+Cz6fm27uvK0qo+ezLvB6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fituS+DY7ennWxUY5nOeNrYX/HLf6OUbpK3g48+OAijDd4PQUyTGeaYJx9tp5VcJHatzuSIsfSojhZCYq7n2a7Pspa3kQLuXx44BLeA+kLFStU9cDlkvGBLrMVR5B6/vRCqsc6grWMGvYbJoNyVAxoswKJuTXJh/F6MkJDlv3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=SKY3L7vC; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="SKY3L7vC"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UfxEk7T6JyEQqsUbsOIOBOw3o1DLsBcu07jRZivHztM=;
	b=SKY3L7vCGkgTSi/KQ22wZIdzfe/u4jTApdIfM0GcFZOaP2qSaY8c/zr5l1/36iDTjFDpDUA7O
	UrwwRuiQncZvbhNNPoZvfOw1Z+UzhAVIvBPmVXFX0z5iJfvI9onj3Yu6VZSipEiJJQo/FQPTKvD
	IEPRflEz2cCmIVDQejLXU5M=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KV2tftzJ46Dv;
	Fri, 28 Aug 2026 00:24:14 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id EBE4940572;
	Fri, 28 Aug 2026 00:24:35 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:35 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 03/18] mm: allow per-NUMA node local P4D/PUD/PMD/PTE allocation
Date: Fri, 28 Aug 2026 00:11:43 +0800
Message-ID: <20260827161158.3618409-4-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
Reply-To: <artem.kuzin@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 include/asm-generic/pgalloc.h       | 90 +++++++++++++++++++++++++++++
 include/asm-generic/pgtable-nop4d.h |  5 ++
 include/asm-generic/pgtable-nopmd.h |  5 ++
 include/asm-generic/pgtable-nopud.h |  5 ++
 include/linux/mm.h                  | 87 +++++++++++++++++++++++++++-
 mm/memory.c                         | 68 ++++++++++++++++++++++
 6 files changed, 259 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 051aa1331051..79d10806c0fc 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -85,6 +85,26 @@ static inline pgtable_t __pte_alloc_one_noprof(struct mm_struct *mm, gfp_t gfp)
 }
 #define __pte_alloc_one(...)	alloc_hooks(__pte_alloc_one_noprof(__VA_ARGS__))
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline pgtable_t __pte_alloc_one_node_noprof(unsigned int nid,
+					     struct mm_struct *mm, gfp_t gfp)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = pagetable_alloc_node_noprof(nid, gfp, 0);
+	if (!ptdesc)
+		return NULL;
+	if (!pagetable_pte_ctor(mm, ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
+
+	return ptdesc_page(ptdesc);
+}
+
+#define __pte_alloc_one_node(...) alloc_hooks(__pte_alloc_one_node_noprof(__VA_ARGS__))
+#endif
+
 #ifndef __HAVE_ARCH_PTE_ALLOC_ONE
 /**
  * pte_alloc_one - allocate a page for PTE-level user page table
@@ -99,6 +119,17 @@ static inline pgtable_t pte_alloc_one_noprof(struct mm_struct *mm)
 	return __pte_alloc_one_noprof(mm, GFP_PGTABLE_USER);
 }
 #define pte_alloc_one(...)	alloc_hooks(pte_alloc_one_noprof(__VA_ARGS__))
+
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline pgtable_t pte_alloc_one_node_noprof(unsigned int nid,
+					   struct mm_struct *mm)
+{
+	return __pte_alloc_one_node(nid, mm, GFP_PGTABLE_USER | __GFP_THISNODE);
+}
+
+#define pte_alloc_one_node(...)	alloc_hooks(pte_alloc_one_node_noprof(__VA_ARGS__))
+#endif
+
 #endif
 
 /*
@@ -154,6 +185,33 @@ static inline pmd_t *pmd_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 	return ptdesc_address(ptdesc);
 }
 #define pmd_alloc_one(...)	alloc_hooks(pmd_alloc_one_noprof(__VA_ARGS__))
+
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline pmd_t *pmd_alloc_one_node_noprof(unsigned int nid,
+					struct mm_struct *mm,
+					unsigned long addr)
+{
+	struct ptdesc *ptdesc;
+	gfp_t gfp = GFP_PGTABLE_USER;
+
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+
+	gfp |= __GFP_THISNODE;
+
+	ptdesc = pagetable_alloc_node_noprof(nid, gfp, 0);
+	if (!ptdesc)
+		return NULL;
+	if (!pagetable_pmd_ctor(mm, ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
+	return ptdesc_address(ptdesc);
+}
+
+#define pmd_alloc_one_node(...)	alloc_hooks(pmd_alloc_one_node_noprof(__VA_ARGS__))
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 #endif
 
 #ifndef __HAVE_ARCH_PMD_FREE
@@ -191,6 +249,27 @@ static inline pud_t *__pud_alloc_one_noprof(struct mm_struct *mm, unsigned long
 }
 #define __pud_alloc_one(...)	alloc_hooks(__pud_alloc_one_noprof(__VA_ARGS__))
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline pud_t *__pud_alloc_one_node_noprof(unsigned int nid,
+					  struct mm_struct *mm,
+					  unsigned long addr)
+{
+	gfp_t gfp = GFP_PGTABLE_USER;
+	struct ptdesc *ptdesc;
+
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+
+	gfp |= __GFP_THISNODE;
+	ptdesc = pagetable_alloc_node_noprof(nid, gfp, 0);
+	if (!ptdesc)
+		return NULL;
+	return ptdesc_address(ptdesc);
+}
+
+#define __pud_alloc_one_node(...)	alloc_hooks(__pud_alloc_one_node_noprof(__VA_ARGS__))
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 #ifndef __HAVE_ARCH_PUD_ALLOC_ONE
 /**
  * pud_alloc_one - allocate memory for a PUD-level page table
@@ -206,6 +285,17 @@ static inline pud_t *pud_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 	return __pud_alloc_one_noprof(mm, addr);
 }
 #define pud_alloc_one(...)	alloc_hooks(pud_alloc_one_noprof(__VA_ARGS__))
+
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline pud_t *pud_alloc_one_node_noprof(unsigned int nid,
+					struct mm_struct *mm, unsigned long addr)
+{
+	return __pud_alloc_one_node(nid, mm, addr);
+}
+
+#define pud_alloc_one_node(...)	alloc_hooks(pud_alloc_one_node_noprof(__VA_ARGS__))
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 #endif
 
 static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index 89c21f84cffb..95c03ceeeea0 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -48,6 +48,11 @@ static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
  * inside the pgd, so has no extra memory associated with it.
  */
 #define p4d_alloc_one(mm, address)		NULL
+
+#ifdef CONFIG_KERNEL_REPLICATION
+#define p4d_alloc_one_node(nid, mm, address)	NULL
+#endif
+
 #define p4d_free(mm, x)				do { } while (0)
 #define p4d_free_tlb(tlb, x, a)			do { } while (0)
 
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 36b6490ed180..9849760b3751 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -60,6 +60,11 @@ static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
  * inside the pud, so has no extra memory associated with it.
  */
 #define pmd_alloc_one(mm, address)		NULL
+
+#ifdef CONFIG_KERNEL_REPLICATION
+#define pmd_alloc_one_node(nid, mm, address)	NULL
+#endif
+
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
 }
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index 356cbfbaab24..0acbac9961d0 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -56,6 +56,11 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
  * inside the p4d, so has no extra memory associated with it.
  */
 #define pud_alloc_one(mm, address)		NULL
+
+#ifdef CONFIG_KERNEL_REPLICATION
+#define pud_alloc_one_node(nid, mm, address)	NULL
+#endif
+
 #define pud_free(mm, x)				do { } while (0)
 #define pud_free_tlb(tlb, x, a)		        do { } while (0)
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..95213a81907c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3595,8 +3595,24 @@ static inline int __p4d_alloc(struct mm_struct *mm, pgd_t *pgd,
 {
 	return 0;
 }
-#else
+
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline int __p4d_alloc_node(unsigned int nid,
+				   struct mm_struct *mm,
+				   pgd_t *pgd, unsigned long address)
+{
+	return 0;
+}
+#endif
+
+#else /* !__PAGETABLE_P4D_FOLDED */
 int __p4d_alloc(struct mm_struct *mm, pgd_t *pgd, unsigned long address);
+
+#ifdef CONFIG_KERNEL_REPLICATION
+int __p4d_alloc_node(unsigned int nid, struct mm_struct *mm,
+		     pgd_t *pgd, unsigned long address);
+#endif
+
 #endif
 
 #if defined(__PAGETABLE_PUD_FOLDED) || !defined(CONFIG_MMU)
@@ -3605,12 +3621,27 @@ static inline int __pud_alloc(struct mm_struct *mm, p4d_t *p4d,
 {
 	return 0;
 }
+
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline int __pud_alloc_node(unsigned int nid,
+				   struct mm_struct *mm,
+				   p4d_t *p4d, unsigned long address)
+{
+	return 0;
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 static inline void mm_inc_nr_puds(struct mm_struct *mm) {}
 static inline void mm_dec_nr_puds(struct mm_struct *mm) {}
 
 #else
 int __pud_alloc(struct mm_struct *mm, p4d_t *p4d, unsigned long address);
 
+#ifdef CONFIG_KERNEL_REPLICATION
+int __pud_alloc_node(unsigned int nid,
+		     struct mm_struct *mm,
+		     p4d_t *p4d, unsigned long address);
+#endif /* CONFIG_KERNEL_REPLICATION */
 static inline void mm_inc_nr_puds(struct mm_struct *mm)
 {
 	if (mm_pud_folded(mm))
@@ -3633,12 +3664,27 @@ static inline int __pmd_alloc(struct mm_struct *mm, pud_t *pud,
 	return 0;
 }
 
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline int __pmd_alloc_node(unsigned int nid,
+				   struct mm_struct *mm,
+				   pud_t *pud, unsigned long address)
+{
+	return 0;
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 static inline void mm_inc_nr_pmds(struct mm_struct *mm) {}
 static inline void mm_dec_nr_pmds(struct mm_struct *mm) {}
 
 #else
 int __pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address);
 
+#ifdef CONFIG_KERNEL_REPLICATION
+int __pmd_alloc_node(unsigned int nid,
+		     struct mm_struct *mm,
+		     pud_t *pud, unsigned long address);
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 static inline void mm_inc_nr_pmds(struct mm_struct *mm)
 {
 	if (mm_pmd_folded(mm))
@@ -3710,6 +3756,32 @@ static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long a
 	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
 		NULL: pmd_offset(pud, address);
 }
+
+#ifdef CONFIG_KERNEL_REPLICATION
+static inline p4d_t *p4d_alloc_node(unsigned int nid,
+		struct mm_struct *mm,
+		pgd_t *pgd, unsigned long address)
+{
+	return (unlikely(pgd_none(*pgd)) && __p4d_alloc_node(nid, mm, pgd, address)) ?
+		NULL : p4d_offset(pgd, address);
+}
+
+static inline pud_t *pud_alloc_node(unsigned int nid,
+		struct mm_struct *mm,
+		p4d_t *p4d, unsigned long address)
+{
+	return (unlikely(p4d_none(*p4d)) && __pud_alloc_node(nid, mm, p4d, address)) ?
+		NULL : pud_offset(p4d, address);
+}
+
+static inline pmd_t *pmd_alloc_node(unsigned int nid,
+		struct mm_struct *mm,
+		pud_t *pud, unsigned long address)
+{
+	return (unlikely(pud_none(*pud)) && __pmd_alloc_node(nid, mm, pud, address)) ?
+		NULL : pmd_offset(pud, address);
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
 #endif /* CONFIG_MMU */
 
 enum pt_flags {
@@ -3812,6 +3884,19 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
 	__pagetable_free(pt);
 }
 #endif
+
+#ifdef CONFIG_KERNEL_REPLICATION
+
+static inline struct ptdesc *pagetable_alloc_node_noprof(int nid, gfp_t gfp,
+						  unsigned int order)
+{
+	struct page *page = alloc_pages_node_noprof(nid, gfp | __GFP_COMP, order);
+
+	return page_ptdesc(page);
+}
+
+#endif
+
 /**
  * pagetable_free - Free pagetables
  * @pt:	The page table descriptor
diff --git a/mm/memory.c b/mm/memory.c
index 8b0c2c735d3d..05853e4fb266 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6906,6 +6906,28 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 EXPORT_SYMBOL_GPL(handle_mm_fault);
 
 #ifndef __PAGETABLE_P4D_FOLDED
+
+#ifdef CONFIG_KERNEL_REPLICATION
+int __p4d_alloc_node(unsigned int nid,
+		struct mm_struct *mm,
+		pgd_t *pgd, unsigned long address)
+{
+	p4d_t *new = p4d_alloc_one_node(nid, mm, address);
+	if (!new)
+		return -ENOMEM;
+
+	spin_lock(&mm->page_table_lock);
+	if (pgd_present(*pgd)) { /* Another has populated it */
+		p4d_free(mm, new);
+	} else {
+		smp_wmb(); /* See comment in pmd_install() */
+		pgd_populate(mm, pgd, new);
+	}
+	spin_unlock(&mm->page_table_lock);
+	return 0;
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 /*
  * Allocate p4d page table.
  * We've already handled the fast-path in-line.
@@ -6929,6 +6951,28 @@ int __p4d_alloc(struct mm_struct *mm, pgd_t *pgd, unsigned long address)
 #endif /* __PAGETABLE_P4D_FOLDED */
 
 #ifndef __PAGETABLE_PUD_FOLDED
+
+#ifdef CONFIG_KERNEL_REPLICATION
+int __pud_alloc_node(unsigned int nid,
+		struct mm_struct *mm,
+		p4d_t *p4d, unsigned long address)
+{
+	pud_t *new = pud_alloc_one_node(nid, mm, address);
+	if (!new)
+		return -ENOMEM;
+
+	spin_lock(&mm->page_table_lock);
+	if (!p4d_present(*p4d)) {
+		mm_inc_nr_puds(mm);
+		smp_wmb(); /* See comment in pmd_install() */
+		p4d_populate(mm, p4d, new);
+	} else  /* Another has populated it */
+		pud_free(mm, new);
+	spin_unlock(&mm->page_table_lock);
+	return 0;
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 /*
  * Allocate page upper directory.
  * We've already handled the fast-path in-line.
@@ -6974,6 +7018,30 @@ int __pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
 	spin_unlock(ptl);
 	return 0;
 }
+
+#ifdef CONFIG_KERNEL_REPLICATION
+int __pmd_alloc_node(unsigned int nid,
+		struct mm_struct *mm,
+		pud_t *pud, unsigned long address)
+{
+	spinlock_t *ptl;
+	pmd_t *new = pmd_alloc_one_node(nid, mm, address);
+	if (!new)
+		return -ENOMEM;
+
+	ptl = pud_lock(mm, pud);
+	if (!pud_present(*pud)) {
+		mm_inc_nr_pmds(mm);
+		smp_wmb(); /* See comment in pmd_install() */
+		pud_populate(mm, pud, new);
+	} else { /* Another has populated it */
+		pmd_free(mm, new);
+	}
+	spin_unlock(ptl);
+	return 0;
+}
+#endif /* CONFIG_KERNEL_REPLICATION */
+
 #endif /* __PAGETABLE_PMD_FOLDED */
 
 static inline void pfnmap_args_setup(struct follow_pfnmap_args *args,
-- 
2.34.1

