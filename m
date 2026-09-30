Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAB04E0216
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776614; cv=none; b=hsHhz9GLOBYkUNKgtK88MfgvbR709YIi36eXbqgVbzLZ6bc+yXvUFqUNdxgVPwvtSjrgjcVObIhKdGP9LvPWXC+/2vQYFfTLp7EPaLXoE1LiYMLRx/rQG7i9YDaCZ+R0YYdGQzx9x5ulHij1ZB+p+xQZN4AA2QNI8actvzdeivQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776614; c=relaxed/simple;
	bh=KGCrAR/T2WVSS15NlOOPgq4g/mbcRioGXInGYY/rJ0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkSesDlfOiBuwpCZAB+GjI1WqhUTw+bvEEW/Cl7oRzitYBvWQHkaeUeLPf1AiMezmzEjZ1GNnHpM2LoEfREtby1w7aNd41kG0YE2WT0/V6xQuKUymBB6KVr8yYxpn+jGz+lhmCJVZ65/YlxwbvPkN2zHGsQE2cQS/fXbQ5me+7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KX/pAzmK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KX/pAzmK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71741F00893;
	Wed, 30 Sep 2026 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776593;
	bh=znvmixE620ZLsCnkyAYTT60sRef1h2y+RevyjPTXKGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KX/pAzmKvjL+zW903MKIS/9UG1/kayV/HuruPhBpyGYAzcCCSmY0BZFifpyLfJ12M
	 TQLAuJ/Fo6M4/+d08kbi6luqxo0j6BYG1R+kawX1AmrYWt/DKid7R1iFg32me3RBVs
	 G4Bd1JbKgoQ0amWJ7B978omM6valSQ84uanhp0XqH6gWtfTevIwcCK3NoZTfGX2hOO
	 apRyfm+Pq49ddv0eJLpOdXlg+CArU1F2c+9baxWVUd2L778UWU0rpJla/5pj6pKL8T
	 wwqY5djzHfasLp+TCDBlU1Ct1mrAVKdHP+nEEWRAJpOOY5tXxb/u7u+sNqqP5mctKm
	 X0TilY7BSa4IA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] riscv: convert pgtable_l4|l5_enabled to inline function
Date: Wed, 30 Sep 2026 21:36:25 +0800
Message-ID: <20260930133628.22093-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930133628.22093-1-jszhang@kernel.org>
References: <20260930133628.22093-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the preparation of optimizing pgtable_l4|l5_enabled(). No
functionality change.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/pgalloc.h    | 14 +++----
 arch/riscv/include/asm/pgtable-32.h |  4 +-
 arch/riscv/include/asm/pgtable-64.h | 50 +++++++++++++---------
 arch/riscv/include/asm/pgtable.h    |  4 +-
 arch/riscv/include/asm/vmalloc.h    |  5 +--
 arch/riscv/kernel/cpu.c             |  4 +-
 arch/riscv/mm/init.c                | 64 ++++++++++++++---------------
 arch/riscv/mm/kasan_init.c          | 20 ++++-----
 arch/riscv/mm/pgtable.c             |  4 +-
 arch/riscv/mm/ptdump.c              |  4 +-
 10 files changed, 91 insertions(+), 82 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 770ce18a7328..0133f7ba41d7 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -41,7 +41,7 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 
 static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 {
-	if (pgtable_l4_enabled) {
+	if (pgtable_l4_enabled()) {
 		unsigned long pfn = virt_to_pfn(pud);
 
 		set_p4d(p4d, __p4d((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
@@ -51,7 +51,7 @@ static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d,
 				     pud_t *pud)
 {
-	if (pgtable_l4_enabled) {
+	if (pgtable_l4_enabled()) {
 		unsigned long pfn = virt_to_pfn(pud);
 
 		set_p4d_safe(p4d,
@@ -61,7 +61,7 @@ static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d,
 
 static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
 {
-	if (pgtable_l5_enabled) {
+	if (pgtable_l5_enabled()) {
 		unsigned long pfn = virt_to_pfn(p4d);
 
 		set_pgd(pgd, __pgd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
@@ -71,7 +71,7 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
 static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 				     p4d_t *p4d)
 {
-	if (pgtable_l5_enabled) {
+	if (pgtable_l5_enabled()) {
 		unsigned long pfn = virt_to_pfn(p4d);
 
 		set_pgd_safe(pgd,
@@ -82,21 +82,21 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 #define pud_free pud_free
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		__pud_free(mm, pud);
 }
 
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long addr)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 00f3369570a8..5003a7e0f0b0 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -33,7 +33,7 @@
 					  _PAGE_WRITE | _PAGE_EXEC |	\
 					  _PAGE_USER | _PAGE_GLOBAL))
 
-static const __maybe_unused int pgtable_l4_enabled;
-static const __maybe_unused int pgtable_l5_enabled;
+static inline bool pgtable_l4_enabled(void) { return false; }
+static inline bool pgtable_l5_enabled(void) { return false; }
 
 #endif /* _ASM_RISCV_PGTABLE_32_H */
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6e789fa58514..72b8c63469fa 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -10,14 +10,24 @@
 #include <linux/const.h>
 #include <asm/errata_list.h>
 
-extern bool pgtable_l4_enabled;
-extern bool pgtable_l5_enabled;
+extern bool _pgtable_l4_enabled;
+extern bool _pgtable_l5_enabled;
+
+static __always_inline bool pgtable_l5_enabled(void)
+{
+	return _pgtable_l5_enabled;
+}
+
+static __always_inline bool pgtable_l4_enabled(void)
+{
+	return _pgtable_l4_enabled;
+}
 
 #define PGDIR_SHIFT_L3  30
 #define PGDIR_SHIFT_L4  39
 #define PGDIR_SHIFT_L5  48
-#define PGDIR_SHIFT     (pgtable_l5_enabled ? PGDIR_SHIFT_L5 : \
-		(pgtable_l4_enabled ? PGDIR_SHIFT_L4 : PGDIR_SHIFT_L3))
+#define PGDIR_SHIFT     (pgtable_l5_enabled() ? PGDIR_SHIFT_L5 : \
+		(pgtable_l4_enabled() ? PGDIR_SHIFT_L4 : PGDIR_SHIFT_L3))
 /* Size of region mapped by a page global directory */
 #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
 #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
@@ -26,8 +36,8 @@ extern bool pgtable_l5_enabled;
 #define P4D_SHIFT_L3   30
 #define P4D_SHIFT_L4   39
 #define P4D_SHIFT_L5   39
-#define P4D_SHIFT      (pgtable_l5_enabled ? P4D_SHIFT_L5 : \
-		(pgtable_l4_enabled ? P4D_SHIFT_L4 : P4D_SHIFT_L3))
+#define P4D_SHIFT      (pgtable_l5_enabled() ? P4D_SHIFT_L5 : \
+		(pgtable_l4_enabled() ? P4D_SHIFT_L4 : P4D_SHIFT_L3))
 #define P4D_SIZE       (_AC(1, UL) << P4D_SHIFT)
 #define P4D_MASK       (~(P4D_SIZE - 1))
 
@@ -233,7 +243,7 @@ static inline struct page *pud_page(pud_t pud)
 #define mm_p4d_folded  mm_p4d_folded
 static inline bool mm_p4d_folded(struct mm_struct *mm)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		return false;
 
 	return true;
@@ -242,7 +252,7 @@ static inline bool mm_p4d_folded(struct mm_struct *mm)
 #define mm_pud_folded  mm_pud_folded
 static inline bool mm_pud_folded(struct mm_struct *mm)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		return false;
 
 	return true;
@@ -275,7 +285,7 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
 
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		WRITE_ONCE(*p4dp, p4d);
 	else
 		set_pud((pud_t *)p4dp, (pud_t){ p4d_val(p4d) });
@@ -283,7 +293,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 
 static inline int p4d_none(p4d_t p4d)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		return (p4d_val(p4d) == 0);
 
 	return 0;
@@ -291,7 +301,7 @@ static inline int p4d_none(p4d_t p4d)
 
 static inline int p4d_present(p4d_t p4d)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		return (p4d_val(p4d) & _PAGE_PRESENT);
 
 	return 1;
@@ -299,7 +309,7 @@ static inline int p4d_present(p4d_t p4d)
 
 static inline int p4d_bad(p4d_t p4d)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		return !p4d_present(p4d);
 
 	return 0;
@@ -307,7 +317,7 @@ static inline int p4d_bad(p4d_t p4d)
 
 static inline void p4d_clear(p4d_t *p4d)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		set_p4d(p4d, __p4d(0));
 }
 
@@ -323,7 +333,7 @@ static inline unsigned long _p4d_pfn(p4d_t p4d)
 
 static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		return (pud_t *)pfn_to_virt(__page_val_to_pfn(p4d_val(p4d)));
 
 	return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
@@ -342,7 +352,7 @@ pud_t *pud_offset(p4d_t *p4d, unsigned long address);
 
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		WRITE_ONCE(*pgdp, pgd);
 	else
 		set_p4d((p4d_t *)pgdp, (p4d_t){ pgd_val(pgd) });
@@ -350,7 +360,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 
 static inline int pgd_none(pgd_t pgd)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		return (pgd_val(pgd) == 0);
 
 	return 0;
@@ -358,7 +368,7 @@ static inline int pgd_none(pgd_t pgd)
 
 static inline int pgd_present(pgd_t pgd)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		return (pgd_val(pgd) & _PAGE_PRESENT);
 
 	return 1;
@@ -366,7 +376,7 @@ static inline int pgd_present(pgd_t pgd)
 
 static inline int pgd_bad(pgd_t pgd)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		return !pgd_present(pgd);
 
 	return 0;
@@ -374,13 +384,13 @@ static inline int pgd_bad(pgd_t pgd)
 
 static inline void pgd_clear(pgd_t *pgd)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		set_pgd(pgd, __pgd(0));
 }
 
 static inline p4d_t *pgd_pgtable(pgd_t pgd)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		return (p4d_t *)pfn_to_virt(__page_val_to_pfn(pgd_val(pgd)));
 
 	return (p4d_t *)p4d_pgtable((p4d_t) { pgd_val(pgd) });
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 40b1ed4f3ea8..a71671166852 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -75,8 +75,8 @@
 #define VA_BITS_SV48 48
 #define VA_BITS_SV57 57
 
-#define VA_BITS		(pgtable_l5_enabled ? \
-				VA_BITS_SV57 : (pgtable_l4_enabled ? VA_BITS_SV48 : VA_BITS_SV39))
+#define VA_BITS		(pgtable_l5_enabled() ? \
+				VA_BITS_SV57 : (pgtable_l4_enabled() ? VA_BITS_SV48 : VA_BITS_SV39))
 #else
 #define VA_BITS		VA_BITS_SV32
 #endif
diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index fefe94dc98e2..4d8b80ce570b 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -3,15 +3,14 @@
 #define _ASM_RISCV_VMALLOC_H
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-
-extern bool pgtable_l4_enabled, pgtable_l5_enabled;
+#include <asm/pgtable.h>
 
 #define IOREMAP_MAX_ORDER (PUD_SHIFT)
 
 #define arch_vmap_pud_supported arch_vmap_pud_supported
 static inline bool arch_vmap_pud_supported(pgprot_t prot)
 {
-	return pgtable_l4_enabled || pgtable_l5_enabled;
+	return pgtable_l4_enabled() || pgtable_l5_enabled();
 }
 
 #define arch_vmap_pmd_supported arch_vmap_pmd_supported
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..af84b97af3a1 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -292,9 +292,9 @@ static void print_mmu(struct seq_file *f)
 #if defined(CONFIG_32BIT)
 	sv_type = "sv32";
 #elif defined(CONFIG_64BIT)
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		sv_type = "sv57";
-	else if (pgtable_l4_enabled)
+	else if (pgtable_l4_enabled())
 		sv_type = "sv48";
 	else
 		sv_type = "sv39";
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f8994caefc70..fc74142fe6e6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -52,10 +52,10 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
 EXPORT_SYMBOL(satp_mode);
 
 #ifdef CONFIG_64BIT
-bool pgtable_l4_enabled __ro_after_init = true;
-bool pgtable_l5_enabled __ro_after_init = true;
-EXPORT_SYMBOL(pgtable_l4_enabled);
-EXPORT_SYMBOL(pgtable_l5_enabled);
+bool _pgtable_l4_enabled __ro_after_init = true;
+bool _pgtable_l5_enabled __ro_after_init = true;
+EXPORT_SYMBOL(_pgtable_l4_enabled);
+EXPORT_SYMBOL(_pgtable_l5_enabled);
 #endif
 
 phys_addr_t phys_ram_base __ro_after_init;
@@ -652,23 +652,23 @@ static void __meminit create_p4d_mapping(p4d_t *p4dp, uintptr_t va, phys_addr_t
 }
 
 #define pgd_next_t		p4d_t
-#define alloc_pgd_next(__va)	(pgtable_l5_enabled ?			\
-		pt_ops.alloc_p4d(__va) : (pgtable_l4_enabled ?		\
+#define alloc_pgd_next(__va)	(pgtable_l5_enabled() ?			\
+		pt_ops.alloc_p4d(__va) : (pgtable_l4_enabled() ?	\
 		pt_ops.alloc_pud(__va) : pt_ops.alloc_pmd(__va)))
-#define get_pgd_next_virt(__pa)	(pgtable_l5_enabled ?			\
-		pt_ops.get_p4d_virt(__pa) : (pgd_next_t *)(pgtable_l4_enabled ?	\
+#define get_pgd_next_virt(__pa)	(pgtable_l5_enabled() ?			\
+		pt_ops.get_p4d_virt(__pa) : (pgd_next_t *)(pgtable_l4_enabled() ? \
 		pt_ops.get_pud_virt(__pa) : (pud_t *)pt_ops.get_pmd_virt(__pa)))
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
-				(pgtable_l5_enabled ?			\
+				(pgtable_l5_enabled() ?			\
 		create_p4d_mapping(__nextp, __va, __pa, __sz, __prot) : \
-				(pgtable_l4_enabled ?			\
+				(pgtable_l4_enabled() ?			\
 		create_pud_mapping((pud_t *)__nextp, __va, __pa, __sz, __prot) :	\
 		create_pmd_mapping((pmd_t *)__nextp, __va, __pa, __sz, __prot)))
-#define fixmap_pgd_next		(pgtable_l5_enabled ?			\
-		(uintptr_t)fixmap_p4d : (pgtable_l4_enabled ?		\
+#define fixmap_pgd_next		(pgtable_l5_enabled() ?			\
+		(uintptr_t)fixmap_p4d : (pgtable_l4_enabled() ?		\
 		(uintptr_t)fixmap_pud : (uintptr_t)fixmap_pmd))
-#define trampoline_pgd_next	(pgtable_l5_enabled ?			\
-		(uintptr_t)trampoline_p4d : (pgtable_l4_enabled ?	\
+#define trampoline_pgd_next	(pgtable_l5_enabled() ?			\
+		(uintptr_t)trampoline_p4d : (pgtable_l4_enabled() ?	\
 		(uintptr_t)trampoline_pud : (uintptr_t)trampoline_pmd))
 #else
 #define pgd_next_t		pte_t
@@ -713,11 +713,11 @@ static uintptr_t __meminit best_map_size(phys_addr_t pa, uintptr_t va, phys_addr
 	if (debug_pagealloc_enabled())
 		return PAGE_SIZE;
 
-	if (pgtable_l5_enabled &&
+	if (pgtable_l5_enabled() &&
 	    !(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
 		return P4D_SIZE;
 
-	if (pgtable_l4_enabled &&
+	if (pgtable_l4_enabled() &&
 	    !(pa & (PUD_SIZE - 1)) && !(va & (PUD_SIZE - 1)) && size >= PUD_SIZE)
 		return PUD_SIZE;
 
@@ -769,14 +769,14 @@ u64 __pi_set_satp_mode_from_fdt(uintptr_t dtb_pa);
 
 static void __init disable_pgtable_l5(void)
 {
-	pgtable_l5_enabled = false;
+	_pgtable_l5_enabled = false;
 	kernel_map.page_offset = PAGE_OFFSET_L4;
 	satp_mode = SATP_MODE_48;
 }
 
 static void __init disable_pgtable_l4(void)
 {
-	pgtable_l4_enabled = false;
+	_pgtable_l4_enabled = false;
 	kernel_map.page_offset = PAGE_OFFSET_L3;
 	satp_mode = SATP_MODE_39;
 }
@@ -867,7 +867,7 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 
 	create_pgd_mapping(early_pg_dir,
 			   set_satp_mode_pmd,
-			   pgtable_l5_enabled ?
+			   pgtable_l5_enabled() ?
 				(uintptr_t)early_p4d : (uintptr_t)early_pud,
 			   PGDIR_SIZE, PAGE_TABLE);
 
@@ -879,7 +879,7 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 	local_flush_tlb_all();
 
 	if (hw_satp != identity_satp) {
-		if (pgtable_l5_enabled) {
+		if (pgtable_l5_enabled()) {
 			disable_pgtable_l5();
 			memset(early_pg_dir, 0, PAGE_SIZE);
 			goto retry;
@@ -1120,11 +1120,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 #ifndef __PAGETABLE_PMD_FOLDED
 	/* Setup fixmap P4D and PUD */
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		create_p4d_mapping(fixmap_p4d, FIXADDR_START,
 				   (uintptr_t)fixmap_pud, P4D_SIZE, PAGE_TABLE);
 	/* Setup fixmap PUD and PMD */
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		create_pud_mapping(fixmap_pud, FIXADDR_START,
 				   (uintptr_t)fixmap_pmd, PUD_SIZE, PAGE_TABLE);
 	create_pmd_mapping(fixmap_pmd, FIXADDR_START,
@@ -1132,10 +1132,10 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	/* Setup trampoline PGD and PMD */
 	create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
 			   trampoline_pgd_next, PGDIR_SIZE, PAGE_TABLE);
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		create_p4d_mapping(trampoline_p4d, kernel_map.virt_addr,
 				   (uintptr_t)trampoline_pud, P4D_SIZE, PAGE_TABLE);
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		create_pud_mapping(trampoline_pud, kernel_map.virt_addr,
 				   (uintptr_t)trampoline_pmd, PUD_SIZE, PAGE_TABLE);
 	create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
@@ -1406,7 +1406,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
 		if (!p4d)
 			goto failed;
 
-		if (pgtable_l5_enabled)
+		if (pgtable_l5_enabled())
 			continue;
 
 		lvl = "pud";
@@ -1414,7 +1414,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
 		if (!pud)
 			goto failed;
 
-		if (pgtable_l4_enabled)
+		if (pgtable_l4_enabled())
 			continue;
 
 		lvl = "pmd";
@@ -1624,13 +1624,13 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 
 	for (; addr < end; addr = next) {
 		next = pud_addr_end(addr, end);
-		pudp = pgtable_l4_enabled ? pud_base + pud_index(addr) : pud_base;
+		pudp = pgtable_l4_enabled() ? pud_base + pud_index(addr) : pud_base;
 		pud = pudp_get(pudp);
 		if (!pud_present(pud))
 			continue;
 
 		if (pud_leaf(pud)) {
-			if (pgtable_l4_enabled) {
+			if (pgtable_l4_enabled()) {
 				pud_clear(pudp);
 				if (is_vmemmap)
 					free_vmemmap_storage(pud_page(pud), PUD_SIZE, altmap);
@@ -1641,7 +1641,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		pmd_base = pmd_offset(pudp, 0);
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
-		if (pgtable_l4_enabled)
+		if (pgtable_l4_enabled())
 			free_pmd_table(pmd_base, pudp, is_vmemmap);
 	}
 }
@@ -1655,13 +1655,13 @@ static void __meminit remove_p4d_mapping(p4d_t *p4d_base, unsigned long addr, un
 
 	for (; addr < end; addr = next) {
 		next = p4d_addr_end(addr, end);
-		p4dp = pgtable_l5_enabled ? p4d_base + p4d_index(addr) : p4d_base;
+		p4dp = pgtable_l5_enabled() ? p4d_base + p4d_index(addr) : p4d_base;
 		p4d = p4dp_get(p4dp);
 		if (!p4d_present(p4d))
 			continue;
 
 		if (p4d_leaf(p4d)) {
-			if (pgtable_l5_enabled) {
+			if (pgtable_l5_enabled()) {
 				p4d_clear(p4dp);
 				if (is_vmemmap)
 					free_vmemmap_storage(p4d_page(p4d), P4D_SIZE, altmap);
@@ -1672,7 +1672,7 @@ static void __meminit remove_p4d_mapping(p4d_t *p4d_base, unsigned long addr, un
 		pud_base = pud_offset(p4dp, 0);
 		remove_pud_mapping(pud_base, addr, next, is_vmemmap, altmap);
 
-		if (pgtable_l5_enabled)
+		if (pgtable_l5_enabled())
 			free_pud_table(pud_base, p4dp);
 	}
 }
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 1f3aa9611187..84f87c8277c3 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -168,7 +168,7 @@ static void __init kasan_early_clear_pud(p4d_t *p4dp,
 	pud_t *pudp, *base_pud;
 	unsigned long next;
 
-	if (!pgtable_l4_enabled) {
+	if (!pgtable_l4_enabled()) {
 		pudp = (pud_t *)p4dp;
 	} else {
 		base_pud = pt_ops.get_pud_virt(pfn_to_phys(_p4d_pfn(p4dp_get(p4dp))));
@@ -193,7 +193,7 @@ static void __init kasan_early_clear_p4d(pgd_t *pgdp,
 	p4d_t *p4dp, *base_p4d;
 	unsigned long next;
 
-	if (!pgtable_l5_enabled) {
+	if (!pgtable_l5_enabled()) {
 		p4dp = (p4d_t *)pgdp;
 	} else {
 		base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(pgdp_get(pgdp))));
@@ -203,7 +203,7 @@ static void __init kasan_early_clear_p4d(pgd_t *pgdp,
 	do {
 		next = p4d_addr_end(vaddr, end);
 
-		if (pgtable_l4_enabled && IS_ALIGNED(vaddr, P4D_SIZE) &&
+		if (pgtable_l4_enabled() && IS_ALIGNED(vaddr, P4D_SIZE) &&
 		    (next - vaddr) >= P4D_SIZE) {
 			p4d_clear(p4dp);
 			continue;
@@ -221,7 +221,7 @@ static void __init kasan_early_clear_pgd(pgd_t *pgdp,
 	do {
 		next = pgd_addr_end(vaddr, end);
 
-		if (pgtable_l5_enabled && IS_ALIGNED(vaddr, PGDIR_SIZE) &&
+		if (pgtable_l5_enabled() && IS_ALIGNED(vaddr, PGDIR_SIZE) &&
 		    (next - vaddr) >= PGDIR_SIZE) {
 			pgd_clear(pgdp);
 			continue;
@@ -239,7 +239,7 @@ static void __init kasan_early_populate_pud(p4d_t *p4dp,
 	phys_addr_t phys_addr;
 	unsigned long next;
 
-	if (!pgtable_l4_enabled) {
+	if (!pgtable_l4_enabled()) {
 		pudp = (pud_t *)p4dp;
 	} else {
 		base_pud = pt_ops.get_pud_virt(pfn_to_phys(_p4d_pfn(p4dp_get(p4dp))));
@@ -277,7 +277,7 @@ static void __init kasan_early_populate_p4d(pgd_t *pgdp,
 	 * Note that this test is then completely equivalent to
 	 * p4dp = p4d_offset(pgdp, vaddr)
 	 */
-	if (!pgtable_l5_enabled) {
+	if (!pgtable_l5_enabled()) {
 		p4dp = (p4d_t *)pgdp;
 	} else {
 		base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(pgdp_get(pgdp))));
@@ -336,7 +336,7 @@ asmlinkage void __init kasan_early_init(void)
 				(__pa((uintptr_t)kasan_early_shadow_pte)),
 				PAGE_TABLE));
 
-	if (pgtable_l4_enabled) {
+	if (pgtable_l4_enabled()) {
 		for (i = 0; i < PTRS_PER_PUD; ++i)
 			set_pud(kasan_early_shadow_pud + i,
 				pfn_pud(PFN_DOWN
@@ -344,7 +344,7 @@ asmlinkage void __init kasan_early_init(void)
 					PAGE_TABLE));
 	}
 
-	if (pgtable_l5_enabled) {
+	if (pgtable_l5_enabled()) {
 		for (i = 0; i < PTRS_PER_P4D; ++i)
 			set_p4d(kasan_early_shadow_p4d + i,
 				pfn_p4d(PFN_DOWN
@@ -461,7 +461,7 @@ static void __init create_tmp_mapping(void)
 	memcpy(tmp_pg_dir, swapper_pg_dir, sizeof(pgd_t) * PTRS_PER_PGD);
 
 	/* Copy the last p4d since it is shared with the kernel mapping. */
-	if (pgtable_l5_enabled) {
+	if (pgtable_l5_enabled()) {
 		ptr = (p4d_t *)pgd_page_vaddr(pgdp_get(pgd_offset_k(KASAN_SHADOW_END)));
 		memcpy(tmp_p4d, ptr, sizeof(p4d_t) * PTRS_PER_P4D);
 		set_pgd(&tmp_pg_dir[pgd_index(KASAN_SHADOW_END)],
@@ -472,7 +472,7 @@ static void __init create_tmp_mapping(void)
 	}
 
 	/* Copy the last pud since it is shared with the kernel mapping. */
-	if (pgtable_l4_enabled) {
+	if (pgtable_l4_enabled()) {
 		ptr = (pud_t *)p4d_page_vaddr(p4dp_get(base_p4d + p4d_index(KASAN_SHADOW_END)));
 		memcpy(tmp_pud, ptr, sizeof(pud_t) * PTRS_PER_PUD);
 		set_p4d(&base_p4d[p4d_index(KASAN_SHADOW_END)],
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 9c4427d0b187..cd180f9abb5e 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -41,7 +41,7 @@ EXPORT_SYMBOL_GPL(ptep_test_and_clear_young);
 #ifdef CONFIG_64BIT
 pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 {
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled())
 		return p4d_pgtable(p4dp_get(p4d)) + pud_index(address);
 
 	return (pud_t *)p4d;
@@ -50,7 +50,7 @@ EXPORT_SYMBOL_GPL(pud_offset);
 
 p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
 {
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled())
 		return pgd_pgtable(pgdp_get(pgd)) + p4d_index(address);
 
 	return (p4d_t *)pgd;
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index f4b4a9fcbbd8..f765a63e2ca7 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -446,8 +446,8 @@ static int __init ptdump_init(void)
 
 	kernel_ptd_info.base_addr = KERN_VIRT_START;
 
-	pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
-	pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
+	pg_level[1].name = pgtable_l5_enabled() ? "P4D" : "PGD";
+	pg_level[2].name = pgtable_l4_enabled() ? "PUD" : "PGD";
 
 	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
 		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
-- 
2.53.0

