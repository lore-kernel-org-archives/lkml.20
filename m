Received: from mta0.migadu.com (out-85.mta0.migadu.com [91.218.175.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EABB43DEDA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792019; cv=none; b=ZhHGxFP0Lrax8MsE+BPSJPGgboSqXhC3ZG46wWvIc0sUqPiPTLsQyG2h/Wi9RbV9j04FaE7pqHA7Xw5NWnNopMPuqkFnsZwb4vKsNjct/FqwlC8veEbiwSWfToESKbpxZJPdZvMXIN/kYM5mrF0poavdV5doroajmXhWTXVMELI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792019; c=relaxed/simple;
	bh=cURnagGbe65KxHto5z5GRrb+Q5ygp/yQROgYwU7FvL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DS+C3E8FDpt9Ujd8d4RnmKB3CPmpKvq1zoQYN9hjP4UIrxnQLS62ScZbpm5VhUzu3r5m2rwjN6AGq5ttfol4v13gglGvI82zBzj5pvtn5KXNfpQNwltCSpRlPKSyGw91QicnzPNRmpnIQVwpC5jqZwwsjugxbtrZvUk9JLASEI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NxekGmVy; arc=none smtp.client-ip=91.218.175.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NxekGmVy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cURnagGbe65KxHto5z5GRrb+Q5ygp/yQROgYwU7FvL0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791792016; v=1; x=1792396816;
 b=NxekGmVyft9ApLSPsL5b6NRZ/mWbEQwZ0gXuPfeX0ChkMtlKBcXBEP0IuJcs56vvsPHFUiHM
 PUQ/X4prTYLMjAXjbvgOGY5zDfWEwzVoYVdv1eBYBOjeKmPfGjntZYM2cvkJMAo1TMLYPDlaW0t
 FeBiH4hHAhGx74htjaz60ot0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a442068e8d46539c;
	Mon, 12 Oct 2026 08:00:15 +0000
X-Mizu-Trace-ID: a442068e8d46539c
X-Migadu-Flow: FLOW_OUT
From: haoran.jiang@linux.dev
To: linux-kernel@vger.kernel.org
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	Haoran Jiang <jianghaoran@kylinos.cn>
Subject: [PATCH] LoongArch: add KASAN_VMALLOC support
Date: Mon, 12 Oct 2026 15:59:13 +0800
Message-Id: <20261012075913.127702-1-haoran.jiang@linux.dev>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Haoran Jiang <jianghaoran@kylinos.cn>

For the page table of the VMALLOC shadow region,
only a partial page table needs to be established,
allowing the complete page table entries to be
populated on demand during use.

---
1,Through the kasan_shallow_populate_pgd/p4d/pud/pmd/pte functions,
page tables are established for the modules and vmalloc regions,
but the page tables are not fully populated; the complete page
tables are established automatically when vmalloc is used.
If the address is pgd-aligned, the page table is established
down to the pgd level; if it is pud-aligned, it is established
down to the pud level, and so on. While establishing the
/pgd/pud/pmd levels, the page table entries must be initialized
to none. For example, a pmd entry of none is an invalid_pte_table.
Only in this way can the correct page tables be established at
use time. At the same time, boundary issues must be considered
when the address is not aligned. For example, mem_to_shadow(MALLOC_END)
and mem_to_shadow(vmemmap) are in the same pmd, and the region
[mem_to_shadow(vmemmap), mem_to_shadow(VMEMMAP_END)] needs to be
mapped to page 0. To avoid affecting the mem_to_shadow(vmemmap) region,
only the pmd entries for [mem_to_shadow(MALLOC_END) & PMD_MASK, mem_to_shadow(MALLOC_END)]
need to be initialized to invalid_pte_table. The remaining pmd entries are left as they are.

2,The removal of kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_START),
mem_to_shadow((void *)KFENCE_AREA_END)) achieves the same effect as
kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE, true);
 both map this region to a shared zero page. (KASAN_SHADOW_START, KASAN_SHADOW_END)
already covers (mem_to_shadow((void *)VMALLOC_START), mem_to_shadow((void *)KFENCE_AREA_END)).
Other architectures such as arm64/riscv need kasan_populate_early_shadow
because clear_shadow(KASAN_SHADOW_START, KASAN_SHADOW_END) is performed before
 kasan_populate_early_shadow, so the reserved region must be mapped to the zero
page again. On LoongArch, however, the entire shadow space is first mapped to
page 0 via kasan_pgd_populate, and then page tables are established for the
required regions, which is simpler and clearer.

3,pgd_none/p4d_none/pmd_none/pte_none were added to the definitions of
__pgd_none/__p4d_none/__pud_none/__pmd_none/__pte_none respectively
because kasan_populate_early_vm_area_shadow requires them.
kasan_populate_early_vm_area_shadow establishes complete KASAN shadow
page table mappings for the early vmalloc regions before vmalloc_init.
At this point, complete page tables need to be established, but
kasan_populate_early_vm_area_shadow is called after step 1, at which time
only incomplete page tables have been established for the vmalloc region.
The condition for a page table entry to be none requires the
pgd_none/p4d_none/pmd_none/pte_none checks. Only by correctly determining
whether an entry is none can the complete page tables be established properly.

Test：

https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git

CONFIG_KUNIT=y

CONFIG_KASAN_KUNIT_TEST=m

Add `kunit.enable=1 kasan_multi_shot` to the cmdline.

Test with 3-level 16K pages and 4-level 4K pages respectively.

before this patch:

...

[  502.760009]     ok 68 vmalloc_oob # SKIP Test requires CONFIG_KASAN_VMALLOC=y

...

[  504.016000] # kasan: pass:49 fail:0 skip:26 total:75
[  504.016092] # Totals: pass:49 fail:0 skip:26 total:75
[  504.016171] ok 1 kasan

after this patch:

...

[  531.630760]     ok 68 vmalloc_oob

...

[  532.891057] # kasan: pass:50 fail:0 skip:25 total:75
[  532.891142] # Totals: pass:50 fail:0 skip:25 total:75
[  532.891219] ok 1 kasan

Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>

---
 arch/loongarch/Kconfig         |   2 +
 arch/loongarch/mm/kasan_init.c | 173 ++++++++++++++++++++++++++++++---
 2 files changed, 164 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 2067d1f2ad7a..c95c6fd8a138 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -119,6 +119,7 @@ config LOONGARCH
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN if 64BIT
+	select HAVE_ARCH_KASAN_VMALLOC
 	select HAVE_ARCH_KFENCE if 64BIT
 	select HAVE_ARCH_KGDB if PERF_EVENTS
 	select HAVE_ARCH_KSTACK_ERASE
@@ -187,6 +188,7 @@ config LOONGARCH
 	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_FORCED_THREADING
 	select IRQ_LOONGARCH_CPU
+	select KASAN_VMALLOC if KASAN
 	select LOCK_MM_AND_FIND_VMA
 	select MMU_GATHER_MERGE_VMAS if MMU
 	select MMU_GATHER_RCU_TABLE_FREE
diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index 92ca0ba86406..962c37316200 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -17,28 +17,28 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 #define __pgd_none(early, pgd) (0)
 #else
 #define __pgd_none(early, pgd) (early ? (pgd_val(pgd) == 0) : \
-(__pa(pgd_val(pgd)) == (unsigned long)__pa(kasan_early_shadow_p4d)))
+((__pa(pgd_val(pgd)) == (unsigned long)__pa(kasan_early_shadow_p4d)) || pgd_none(pgd)))
 #endif
 
 #ifdef __PAGETABLE_PUD_FOLDED
 #define __p4d_none(early, p4d) (0)
 #else
 #define __p4d_none(early, p4d) (early ? (p4d_val(p4d) == 0) : \
-(__pa(p4d_val(p4d)) == (unsigned long)__pa(kasan_early_shadow_pud)))
+((__pa(p4d_val(p4d)) == (unsigned long)__pa(kasan_early_shadow_pud)) || p4d_none(p4d)))
 #endif
 
 #ifdef __PAGETABLE_PMD_FOLDED
 #define __pud_none(early, pud) (0)
 #else
 #define __pud_none(early, pud) (early ? (pud_val(pud) == 0) : \
-(__pa(pud_val(pud)) == (unsigned long)__pa(kasan_early_shadow_pmd)))
+((__pa(pud_val(pud)) == (unsigned long)__pa(kasan_early_shadow_pmd)) || pud_none(pud)))
 #endif
 
 #define __pmd_none(early, pmd) (early ? (pmd_val(pmd) == 0) : \
-(__pa(pmd_val(pmd)) == (unsigned long)__pa(kasan_early_shadow_pte)))
+((__pa(pmd_val(pmd)) == (unsigned long)__pa(kasan_early_shadow_pte)) || pmd_none(pmd)))
 
 #define __pte_none(early, pte) (early ? pte_none(pte) : \
-((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
+(((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)) || pte_none(pte)))
 
 static void *mem_to_shadow(const void *addr)
 {
@@ -242,6 +242,160 @@ static void __init kasan_map_populate(unsigned long start, unsigned long end,
 	kasan_pgd_populate(start & PAGE_MASK, PAGE_ALIGN(end), node, false);
 }
 
+static void __init kasan_shallow_populate_pte(pmd_t *pmdp, unsigned long addr,
+					unsigned long end, int node)
+{
+	unsigned long next;
+	pte_t *ptep = pte_offset_kernel(pmdp, addr);
+
+	do {
+		next = addr + PAGE_SIZE;
+		if (__pte_none(false, ptep_get(ptep)))
+			pte_clear(&init_mm, addr, ptep);
+	} while (ptep++, addr = next, addr != end);
+}
+
+static void __init kasan_shallow_populate_pmd(pud_t *pudp, unsigned long addr,
+					unsigned long end, int node)
+{
+	unsigned long next;
+	pmd_t *pmdp = pmd_offset(pudp, addr);
+
+	do {
+		next = pmd_addr_end(addr, end);
+
+		if (__pmd_none(false, pmdp_get(pmdp))) {
+			phys_addr_t pte_phys = kasan_alloc_zeroed_page(node);
+
+			if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >= PMD_SIZE) {
+				kernel_pte_init(__va(pte_phys));
+				pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
+				continue;
+			} else {
+				memcpy(__va(pte_phys), kasan_early_shadow_pte,
+						sizeof(kasan_early_shadow_pte));
+				pmd_populate_kernel(NULL, pmdp, (pte_t *)__va(pte_phys));
+			}
+		}
+		kasan_shallow_populate_pte(pmdp, addr, next, node);
+	} while (pmdp++, addr = next, addr != end);
+}
+
+static void __init kasan_shallow_populate_pud(p4d_t *p4dp, unsigned long addr,
+					unsigned long end, int node)
+{
+	unsigned long next;
+	pud_t *pudp = pud_offset(p4dp, addr);
+
+	do {
+		next = pud_addr_end(addr, end);
+
+		if (__pud_none(false, pudp_get(pudp))) {
+
+			phys_addr_t pmd_phys = kasan_alloc_zeroed_page(node);
+
+			if (IS_ALIGNED(addr, PUD_SIZE) && end - addr >= PUD_SIZE) {
+#ifndef __PAGETABLE_PMD_FOLDED
+				pmd_init(__va(pmd_phys));
+#endif
+				pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
+				continue;
+			} else {
+				memcpy(__va(pmd_phys), kasan_early_shadow_pmd,
+						sizeof(kasan_early_shadow_pmd));
+				pud_populate(&init_mm, pudp, (pmd_t *)__va(pmd_phys));
+
+			}
+		}
+
+		kasan_shallow_populate_pmd(pudp, addr, next, node);
+	} while (pudp++, addr = next, addr != end);
+}
+
+static void __init kasan_shallow_populate_p4d(pgd_t *pgdp, unsigned long addr,
+					unsigned long end, int node)
+{
+	unsigned long next;
+	p4d_t *p4dp = p4d_offset(pgdp, addr);
+
+	do {
+		next = p4d_addr_end(addr, end);
+
+		if (__p4d_none(false, p4dp_get(p4dp))) {
+
+			phys_addr_t pud_phys = kasan_alloc_zeroed_page(node);
+
+			if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >= P4D_SIZE) {
+#ifndef __PAGETABLE_PUD_FOLDED
+				pud_init(__va(pud_phys));
+#endif
+				p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
+				continue;
+			} else {
+				memcpy(__va(pud_phys), kasan_early_shadow_pud,
+						sizeof(kasan_early_shadow_pud));
+				p4d_populate(&init_mm, p4dp, (pud_t *)__va(pud_phys));
+			}
+		}
+		kasan_shallow_populate_pud(p4dp, addr, next, node);
+	} while (p4dp++, addr = next, addr != end);
+}
+
+static void __init kasan_shallow_populate_pgd(unsigned long addr,
+					unsigned long end, int node)
+{
+	unsigned long next;
+	pgd_t *pgdp;
+
+	pgdp = pgd_offset_k(addr);
+
+	do {
+		next = pgd_addr_end(addr, end);
+
+		if (__pgd_none(false, pgdp_get(pgdp))) {
+
+			phys_addr_t p4d_phys = kasan_alloc_zeroed_page(node);
+
+			if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >= PGDIR_SIZE) {
+				pgd_init(__va(p4d_phys));
+				pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
+				continue;
+			} else {
+				memcpy(__va(p4d_phys), kasan_early_shadow_p4d,
+						sizeof(kasan_early_shadow_p4d));
+				pgd_populate(&init_mm, pgdp, (p4d_t *)__va(p4d_phys));
+			}
+		}
+
+		kasan_shallow_populate_p4d(pgdp, addr, next, node);
+	} while (pgdp++, addr = next, addr != end);
+}
+
+static void __init kasan_shallow_populate(unsigned long start, unsigned long end, int node)
+{
+	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
+	unsigned long vend = PAGE_ALIGN((unsigned long)end);
+
+	kasan_shallow_populate_pgd(vaddr, vend, node);
+}
+
+#ifdef CONFIG_KASAN_VMALLOC
+void __init kasan_populate_early_vm_area_shadow(void *start, unsigned long size)
+{
+	unsigned long shadow_start, shadow_end;
+
+	if (!is_vmalloc_or_module_addr(start))
+		return;
+
+	shadow_start = (unsigned long)mem_to_shadow(start);
+	shadow_start = ALIGN_DOWN(shadow_start, PAGE_SIZE);
+	shadow_end = (unsigned long)mem_to_shadow(start + size);
+	shadow_end = ALIGN(shadow_end, PAGE_SIZE);
+
+	kasan_map_populate(shadow_start, shadow_end, NUMA_NO_NODE);
+}
+#endif
+
 asmlinkage void __init kasan_early_init(void)
 {
 	BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_START, PGDIR_SIZE));
@@ -297,9 +451,6 @@ void __init kasan_init(void)
 	/* Maps everything to a single page of zeroes */
 	kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE, true);
 
-	kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_START),
-					mem_to_shadow((void *)KFENCE_AREA_END));
-
 	/* Populate the linear mapping */
 	for_each_mem_range(i, &pa_start, &pa_end) {
 		void *start = (void *)phys_to_virt(pa_start);
@@ -309,9 +460,9 @@ void __init kasan_init(void)
 			(unsigned long)mem_to_shadow(end), NUMA_NO_NODE);
 	}
 
-	/* Populate modules mapping */
-	kasan_map_populate((unsigned long)mem_to_shadow((void *)MODULES_VADDR),
-		(unsigned long)mem_to_shadow((void *)MODULES_END), NUMA_NO_NODE);
+	kasan_shallow_populate((unsigned long)mem_to_shadow((void *)MODULES_VADDR),
+			(unsigned long)mem_to_shadow((void *)VMALLOC_END), NUMA_NO_NODE);
+
 	/*
 	 * KAsan may reuse the contents of kasan_early_shadow_pte directly, so we
 	 * should make sure that it maps the zero page read-only.
-- 
2.43.0

