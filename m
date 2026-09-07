Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A825E3F106B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753068; cv=none; b=S6An5F8LGzAd4CSaQym4qDb14OKkKWBvX88jFlCKewtzcTPdpwRSz0Uq+ru+XQUDCI2wI4eavmhbu+ZJXsy0zaJ7It9dzOw80ZGmgPmb7eVJ4OnFusYJcmNc++JNk9ma+9YBlDSDH7DQyOEbGc5vIOWBjdoCtMSVchalUE4uIZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753068; c=relaxed/simple;
	bh=+tgSDgH6S7J+Zg6W+yYzI/2ILAKRsH2eO7aDyQDfgW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1uQMQd+VbIpN8E75/MUy991Wrb2upH3OdNnI/vs7C2ewyIoH9JUOE11PgkSzlnIXmJvUWiQyvYqh5nBwSWDPFrXqmyuhgv5jdAHcHhM/Wo02DZsFDLeuMykuXOygiKl1nq8XoeLbDpsk5uSb1GuyuS036cgL4x68i/k0v64gE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gqhIIhSV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gqhIIhSV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54CED1477;
	Sun,  6 Sep 2026 20:51:01 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D7F83F7B4;
	Sun,  6 Sep 2026 20:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753065; bh=+tgSDgH6S7J+Zg6W+yYzI/2ILAKRsH2eO7aDyQDfgW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gqhIIhSVw4zQJJQkhhusDab2g/XO6q3GBktFLRdavIFx9RKYlLKdI2sZ3MKJ/eEkF
	 HKjtOAfI324zpGwNyHTXwyr5oR2BTGFEvqYTFzpfLSDZ2EocS4q6Zpt5tNGlFUxJV1
	 7Jh9ACpfVGd3Kylj8zsPjCzJUf/kIa9RJrkPthuY=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V2 08/14] arm64/mm: Enable pgtable descriptor for FEAT_D128
Date: Mon,  7 Sep 2026 09:20:23 +0530
Message-ID: <20260907035030.2839978-9-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907035030.2839978-1-anshuman.khandual@arm.com>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable pgtable descriptor fields and related accessors for FEAT_D128. First
expand ptval_t as 128 bits, add all D128 specific pgtable descriptor fields
and update accessors like ptval_get/set() and ptval_xchg_relaxed(). Also do
ensure that ARM64_PA_BITS_52 specific handlings are not applicable for D128
which does not follow PA bits folding mechanisms as in FEAT_[LPA|LPA2].

Although all the above changes gets enabled only with CONFIG_ARM64_D128.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/assembler.h     |   4 +-
 arch/arm64/include/asm/pgtable-hwdef.h | 133 +++++++++++++++++++++++++
 arch/arm64/include/asm/pgtable-prot.h  |  20 +++-
 arch/arm64/include/asm/pgtable-types.h |   4 +
 arch/arm64/include/asm/pgtable.h       |  52 +++++++++-
 arch/arm64/mm/proc.S                   |   2 +-
 6 files changed, 208 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 0b58b550e8dc..1402f90f0030 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -623,7 +623,7 @@ alternative_else_nop_endif
  * 	ttbr:	returns the TTBR value
  */
 	.macro	phys_to_ttbr, ttbr, phys
-#ifdef CONFIG_ARM64_PA_BITS_52
+#if defined(CONFIG_ARM64_PA_BITS_52) && !defined(CONFIG_ARM64_D128)
 	orr	\ttbr, \phys, \phys, lsr #46
 	and	\ttbr, \ttbr, #TTBR_BADDR_MASK_52
 #else
@@ -632,7 +632,7 @@ alternative_else_nop_endif
 	.endm
 
 	.macro	phys_to_pte, pte, phys
-#ifdef CONFIG_ARM64_PA_BITS_52
+#if defined(CONFIG_ARM64_PA_BITS_52) && !defined(CONFIG_ARM64_D128)
 	orr	\pte, \phys, \phys, lsr #PTE_ADDR_HIGH_SHIFT
 	and	\pte, \pte, #PHYS_TO_PTE_ADDR_MASK
 #else
diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index 1ee1a6d9db6d..16fb74c47b74 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -101,6 +101,137 @@
 #define CONT_PMD_SIZE		(CONT_PMDS * PMD_SIZE)
 #define CONT_PMD_MASK		(~(CONT_PMD_SIZE - 1))
 
+#ifdef CONFIG_ARM64_D128
+
+/*
+ * Hardware page table definitions.
+ *
+ * Level -1 descriptor (PGD).
+ */
+#define PGD_SKL_SHIFT		109
+#define PGD_SKL_MASK		GENMASK_U128(110, 109)
+#define PGD_SKL_TABLE		(_AT(pgdval_t, 0) << PGD_SKL_SHIFT)
+
+#define PGD_TYPE_TABLE		_AT(pgdval_t, (PTE_VALID | PGD_SKL_TABLE))
+#define PGD_TYPE_MASK		_AT(pgdval_t, (PTE_VALID | PGD_SKL_MASK))
+#define PGD_TABLE_AF		(_AT(pgdval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
+#define PGD_TABLE_PXN		_AT(pgdval_t, 0)		/* Not supported for D128 */
+#define PGD_TABLE_UXN		_AT(pgdval_t, 0)		/* Not supported for D128 */
+
+/*
+ * Level 0 descriptor (P4D).
+ */
+#define P4D_SKL_SHIFT		109
+#define P4D_SKL_MASK		GENMASK_U128(110, 109)
+#define P4D_SKL_TABLE		(_AT(p4dval_t, 0) << P4D_SKL_SHIFT)
+#define P4D_SKL_SECT		(_AT(p4dval_t, 3) << P4D_SKL_SHIFT)
+
+#define P4D_TYPE_TABLE		_AT(p4dval_t, (PTE_VALID | P4D_SKL_TABLE))
+#define P4D_TYPE_MASK		_AT(p4dval_t, (PTE_VALID | P4D_SKL_MASK))
+#define P4D_TYPE_SECT		_AT(p4dval_t, (PTE_VALID | P4D_SKL_SECT))
+#define P4D_SECT_RDONLY		(_AT(p4dval_t, 1) << 7)		/* nDirty */
+#define P4D_TABLE_AF		(_AT(p4dval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
+#define P4D_TABLE_PXN		_AT(p4dval_t, 0)		/* Not supported for D128 */
+#define P4D_TABLE_UXN		_AT(p4dval_t, 0)		/* Not supported for D128 */
+
+/*
+ * Level 1 descriptor (PUD).
+ */
+#define PUD_SKL_SHIFT		109
+#define PUD_SKL_MASK		GENMASK_U128(110, 109)
+#define PUD_SKL_TABLE		(_AT(pudval_t, 0) << PUD_SKL_SHIFT)
+#define PUD_SKL_SECT		(_AT(pudval_t, 2) << PUD_SKL_SHIFT)
+
+#define PUD_TYPE_TABLE		_AT(pudval_t, (PTE_VALID | PUD_SKL_TABLE))
+#define PUD_TYPE_MASK		_AT(pudval_t, (PTE_VALID | PUD_SKL_MASK))
+#define PUD_TYPE_SECT		_AT(pudval_t, (PTE_VALID | PUD_SKL_SECT))
+#define PUD_SECT_RDONLY		(_AT(pudval_t, 1) << 7)		/* nDirty */
+#define PUD_TABLE_AF		(_AT(pudval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
+#define PUD_TABLE_PXN		_AT(pudval_t, 0)		/* Not supported for D128 */
+#define PUD_TABLE_UXN		_AT(pudval_t, 0)		/* Not supported for D128 */
+
+/*
+ * Level 2 descriptor (PMD).
+ */
+#define PMD_SKL_SHIFT		109
+#define PMD_SKL_MASK		GENMASK_U128(110, 109)
+#define PMD_SKL_TABLE		(_AT(pmdval_t, 0) << PMD_SKL_SHIFT)
+#define PMD_SKL_SECT		(_AT(pmdval_t, 1) << PMD_SKL_SHIFT)
+
+#define PMD_TYPE_MASK		_AT(pmdval_t, (PTE_VALID | PMD_SKL_MASK))
+#define PMD_TYPE_TABLE		_AT(pmdval_t, (PTE_VALID | PMD_SKL_TABLE))
+#define PMD_TYPE_SECT		_AT(pmdval_t, (PTE_VALID | PMD_SKL_SECT))
+#define PMD_TABLE_AF		(_AT(pmdval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
+#define PMD_TABLE_PXN		_AT(pmdval_t, 0)		/* Not supported for D128 */
+#define PMD_TABLE_UXN		_AT(pmdval_t, 0)		/* Not supported for D128 */
+
+/*
+ * Section
+ */
+#define PMD_SECT_USER		(_AT(pmdval_t, 1) << 115)	/* PIIndex[0] */
+#define PMD_SECT_RDONLY		(_AT(pmdval_t, 1) << 7)		/* nDirty */
+#define PMD_SECT_S		(_AT(pmdval_t, 3) << 8)
+#define PMD_SECT_AF		(_AT(pmdval_t, 1) << 10)
+#define PMD_SECT_NG		(_AT(pmdval_t, 1) << 11)
+#define PMD_SECT_CONT		(_AT(pmdval_t, 1) << 111)
+#define PMD_SECT_PXN		(_AT(pmdval_t, 1) << 117)	/* PIIndex[2] */
+#define PMD_SECT_UXN		(_AT(pmdval_t, 1) << 118)	/* PIIndex[3] */
+
+/*
+ * AttrIndx[2:0] encoding (mapping attributes defined in the MAIR* registers).
+ */
+#define PMD_ATTRINDX(t)		(_AT(pmdval_t, (t)) << 2)
+#define PMD_ATTRINDX_MASK	(_AT(pmdval_t, 7) << 2)
+
+/*
+ * Level 3 descriptor (PTE).
+ */
+#define PTE_SKL_SHIFT		109
+#define PTE_SKL_MASK		GENMASK_U128(110, 109)
+#define PTE_SKL_SECT		(_AT(pteval_t, 0) << PTE_SKL_SHIFT)
+
+#define PTE_VALID		(_AT(pteval_t, 1) << 0)
+#define PTE_TYPE_MASK		_AT(pteval_t, (PTE_VALID | PTE_SKL_MASK))
+#define PTE_TYPE_PAGE		_AT(pteval_t, (PTE_VALID | PTE_SKL_SECT))
+#define PTE_USER		(_AT(pteval_t, 1) << 115)	/* PIIndex[0] */
+#define PTE_RDONLY		(_AT(pteval_t, 1) << 7)		/* nDirty */
+#define PTE_SHARED		(_AT(pteval_t, 3) << 8)		/* SH[1:0], inner shareable */
+#define PTE_AF			(_AT(pteval_t, 1) << 10)	/* Access Flag */
+#define PTE_NG			(_AT(pteval_t, 1) << 11)	/* nG */
+#define PTE_GP			(_AT(pteval_t, 1) << 113)	/* BTI guarded */
+#define PTE_DBM			(_AT(pteval_t, 1) << 116)	/* PIIndex[1] */
+#define PTE_CONT		(_AT(pteval_t, 1) << 111)	/* Contiguous range */
+#define PTE_PXN			(_AT(pteval_t, 1) << 117)	/* PIIndex[2] */
+#define PTE_UXN			(_AT(pteval_t, 1) << 118)	/* PIIndex[3] */
+#define PTE_SWBITS_MASK		_AT(pteval_t, GENMASK_U128(100, 91))
+
+#define PTE_ADDR_LOW		(((_AT(pteval_t, 1) << (55 - PAGE_SHIFT)) - 1) << PAGE_SHIFT)
+
+/*
+ * AttrIndx[2:0] encoding (mapping attributes defined in the MAIR* registers).
+ */
+#define PTE_ATTRINDX(t)		(_AT(pteval_t, (t)) << 2)
+#define PTE_ATTRINDX_MASK	(_AT(pteval_t, 7) << 2)
+
+/*
+ * PIIndex[3:0] encoding (Permission Indirection Extension)
+ */
+#define PTE_PI_MASK	GENMASK_U128(118, 115)
+#define PTE_PI_SHIFT	115
+
+/*
+ * POIndex[3:0] encoding (Permission Overlay Extension)
+ */
+#define PTE_PO_IDX_0	(_AT(pteval_t, 1) << 121)
+#define PTE_PO_IDX_1	(_AT(pteval_t, 1) << 122)
+#define PTE_PO_IDX_2	(_AT(pteval_t, 1) << 123)
+#define PTE_PO_IDX_3	(_AT(pteval_t, 1) << 124)
+
+#define PTE_PO_IDX_MASK		GENMASK_U128(124, 121)
+#define PTE_PO_IDX_SHIFT	121
+
+#else /* !CONFIG_ARM64_D128 */
+
 /*
  * Hardware page table definitions.
  *
@@ -215,7 +346,9 @@
 #define PTE_PO_IDX_2	(_AT(pteval_t, 1) << 62)
 
 #define PTE_PO_IDX_MASK		GENMASK_ULL(62, 60)
+#define PTE_PO_IDX_SHIFT	60
 
+#endif /* CONFIG_ARM64_D128 */
 
 /*
  * Memory Attribute override for Stage-2 (MemAttr[3:0])
diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 09d7c00cf405..f7df22f222b2 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -13,10 +13,15 @@
 /*
  * Software defined PTE bits definition.
  */
-#define PTE_WRITE		(PTE_DBM)		 /* same as DBM (51) */
+#define PTE_WRITE		(PTE_DBM)		 /* same as DBM (51 / 116) */
 #define PTE_SWP_EXCLUSIVE	(_AT(pteval_t, 1) << 2)	 /* only for swp ptes */
+#ifdef CONFIG_ARM64_D128
+#define PTE_DIRTY		(_AT(pteval_t, 1) << 91)
+#define PTE_SPECIAL		(_AT(pteval_t, 1) << 92)
+#else
 #define PTE_DIRTY		(_AT(pteval_t, 1) << 55)
 #define PTE_SPECIAL		(_AT(pteval_t, 1) << 56)
+#endif
 
 /*
  * PTE_PRESENT_INVALID=1 & PTE_VALID=0 indicates that the pte's fields should be
@@ -28,7 +33,11 @@
 #define PTE_PRESENT_VALID_KERNEL (PTE_VALID | PTE_MAYBE_NG)
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
-#define PTE_UFFD		(_AT(pteval_t, 1) << 58) /* userfaultfd tracking */
+#ifdef CONFIG_ARM64_D128
+#define PTE_UFFD		(_AT(pteval_t, 1) << 94) /* userfaultd tracking */
+#else
+#define PTE_UFFD		(_AT(pteval_t, 1) << 58) /* userfaultd tracking */
+#endif /* CONFIG_ARM64_D128 */
 #define PTE_SWP_UFFD		(_AT(pteval_t, 1) << 3)	 /* only for swp ptes */
 #else
 #define PTE_UFFD		(_AT(pteval_t, 0))
@@ -131,11 +140,18 @@ static inline bool __pure lpa2_is_enabled(void)
 
 #endif /* __ASSEMBLER__ */
 
+#ifdef CONFIG_ARM64_D128
+#define pte_pi_index(pte)	(((pte) & PTE_PI_MASK) >> PTE_PI_SHIFT)
+#define pte_po_index(pte)	((pte_val(pte) & PTE_PO_IDX_MASK) >> PTE_PO_IDX_SHIFT)
+#else
 #define pte_pi_index(pte) ( \
 	((pte & BIT(PTE_PI_IDX_3)) >> (PTE_PI_IDX_3 - 3)) | \
 	((pte & BIT(PTE_PI_IDX_2)) >> (PTE_PI_IDX_2 - 2)) | \
 	((pte & BIT(PTE_PI_IDX_1)) >> (PTE_PI_IDX_1 - 1)) | \
 	((pte & BIT(PTE_PI_IDX_0)) >> (PTE_PI_IDX_0 - 0)))
+#define pte_po_index(pte)	FIELD_GET(PTE_PO_IDX_MASK, pte_val(pte))
+#endif
+
 
 /*
  * Page types used via Permission Indirection Extension (PIE). PIE uses
diff --git a/arch/arm64/include/asm/pgtable-types.h b/arch/arm64/include/asm/pgtable-types.h
index 2f2f5527930f..83160f8a19fd 100644
--- a/arch/arm64/include/asm/pgtable-types.h
+++ b/arch/arm64/include/asm/pgtable-types.h
@@ -17,7 +17,11 @@
  * Generic page table descriptor format from which
  * all level specific descriptors can be derived.
  */
+#ifdef CONFIG_ARM64_D128
+typedef u128 ptval_t;
+#else
 typedef u64 ptval_t;
+#endif
 
 typedef ptval_t pteval_t;
 typedef ptval_t pmdval_t;
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4b534be3f288..516681b6db37 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -84,18 +84,62 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	arch_flush_lazy_mmu_mode();
 }
 
+#ifdef CONFIG_ARM64_D128
+#define ptval_get(x)							\
+({									\
+	typeof(&(x)) __x = &(x);					\
+	union __u128_halves __v;					\
+									\
+	asm volatile ("ldp %[lo], %[hi], %[v]\n"			\
+		: [lo] "=r"(__v.low),					\
+		  [hi] "=r"(__v.high)					\
+		: [v] "Q"(*__x)						\
+	);								\
+	*(typeof(__x))(&__v.full);					\
+})
+
+#define ptval_set(x, val)						\
+({									\
+	typeof(&(x)) __x = &(x);					\
+	union __u128_halves __v = { .full = *(u128*)(&(val)) };		\
+									\
+	asm volatile ("stp %[lo], %[hi], %[v]\n"			\
+		: [v] "=Q"(*__x)					\
+		: [lo] "r"(__v.low),					\
+		  [hi] "r"(__v.high)					\
+	);								\
+})
+#else
 #define ptval_get(x)		READ_ONCE(x)
 #define ptval_set(x, val)	WRITE_ONCE(x, val)
+#endif
 
 static inline ptval_t ptval_cmpxchg_relaxed(ptval_t *ptep, ptval_t old,
 					      ptval_t new)
 {
+#ifdef CONFIG_ARM64_D128
+	return cmpxchg128_relaxed(ptep, old, new);
+#else
 	return cmpxchg_relaxed(ptep, old, new);
+#endif
 }
 
 static inline ptval_t ptval_xchg_relaxed(ptval_t *ptep, ptval_t new)
 {
+#ifdef CONFIG_ARM64_D128
+	union __u128_halves r = { .full = new };
+
+	asm volatile(
+	".arch_extension lse128\n"
+	"swpp %[lo], %[hi], %[v]\n"
+		: [lo] "+r" (r.low),
+		  [hi] "+r" (r.high),
+		  [v] "+Q" (*ptep)
+		:);
+	return r.full;
+#else
 	return xchg_relaxed(ptep, new);
+#endif
 }
 
 #define pmdp_get pmdp_get
@@ -157,7 +201,7 @@ static inline void pgprot_write(pgprot_t *prot, pgprot_t val)
 	__flush_tlb_range(vma, address, address + PMD_SIZE, PMD_SIZE, 2,	\
 			  TLBF_NOBROADCAST | TLBF_NONOTIFY | TLBF_NOWALKCACHE)
 
-#ifdef CONFIG_ARM64_PA_BITS_52
+#if defined(CONFIG_ARM64_PA_BITS_52) && !defined(CONFIG_ARM64_D128)
 static inline phys_addr_t __pte_to_phys(pte_t pte)
 {
 	pte_val(pte) &= ~PTE_MAYBE_SHARED;
@@ -272,7 +316,7 @@ static inline bool por_el0_allows_pkey(u8 pkey, bool write, bool execute)
 	(((pte_val(pte) & (PTE_VALID | PTE_USER)) == (PTE_VALID | PTE_USER)) && (!(write) || pte_write(pte)))
 #define pte_access_permitted(pte, write) \
 	(pte_access_permitted_no_overlay(pte, write) && \
-	por_el0_allows_pkey(FIELD_GET(PTE_PO_IDX_MASK, pte_val(pte)), write, false))
+	por_el0_allows_pkey(pte_po_index(pte), write, false))
 #define pmd_access_permitted(pmd, write) \
 	(pte_access_permitted(pmd_pte(pmd), (write)))
 #define pud_access_permitted(pud, write) \
@@ -1582,11 +1626,15 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 #define update_mmu_cache_pmd(vma, address, pmd) do { } while (0)
 
+#ifdef CONFIG_ARM64_D128
+#define phys_to_ttbr(addr)	(addr)
+#else
 #ifdef CONFIG_ARM64_PA_BITS_52
 #define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
 #else
 #define phys_to_ttbr(addr)	(addr)
 #endif
+#endif
 
 /*
  * On arm64 without hardware Access Flag, copying from user will fail because
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 12aacc74f764..4e8889961b15 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -222,7 +222,7 @@ SYM_FUNC_ALIAS(__pi_idmap_cpu_replace_ttbr1, idmap_cpu_replace_ttbr1)
 
 	.macro	pte_to_phys, phys, pte
 	and	\phys, \pte, #PTE_ADDR_LOW
-#ifdef CONFIG_ARM64_PA_BITS_52
+#if defined(CONFIG_ARM64_PA_BITS_52) && !defined(CONFIG_ARM64_D128)
 	and	\pte, \pte, #PTE_ADDR_HIGH
 	orr	\phys, \phys, \pte, lsl #PTE_ADDR_HIGH_SHIFT
 #endif
-- 
2.43.0

