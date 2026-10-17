Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBFE1DFDA1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201007; cv=none; b=f67uRtNfHiuTvIZXgcnh9POHhiZYkeb55D7yLet5ZlHe3DTrCgLty7wWZvKbh4lp0aLJc1SxZvT0bYWT1cMpk/rQeTzvHicjdv7Uj6CV00yEDyT7JIHibIQOWHPs1dukf6HcEiw6gQSpVxtSZSxkCPMOhEpxLOi5uqXJGtqoGmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201007; c=relaxed/simple;
	bh=wA/d1m64eiCKvLtGmRQj9FgppDSunaFyzHXVzWElm1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XHYuH5l3NELGoZcySkYZ6FT/A/c3uqo0kKQIYLos7ujx2U6i0BVJkGKuyutNlC0SMYsnXjq0x2cxtZAFQ0tF5dp+4SCpYY6mLlGtiKo0PIT7WVwSXMeo4yTOT6K01jmMSEWh9kEnBfUOfvt81qO2PVd3jZwfZ3Yasrk8TqkDB4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHtLe-00HJES-F9;
	Fri, 16 Oct 2026 21:36:34 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Waterman <andrew@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] riscv: mm: Skip the icache flush for special PTEs
Date: Fri, 16 Oct 2026 21:36:34 -0400
Message-ID: <20261017013634.792220-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mapping device memory executable crashes the kernel: an mmap() with
PROT_EXEC of a physical range outside RAM, from /dev/mem, from a PCI
BAR's sysfs resource file, from a frame buffer or from any driver whose
mmap() uses remap_pfn_range(), io_remap_pfn_range() or vmf_insert_pfn(),
oopses in flush_icache_pte() with the page table lock held; the task
never completes its exit and its parent's wait() hangs. On QEMU virt
with the riscv64 defconfig of v7.3-rc7, mapping the PCIe ECAM window
from /dev/mem:

mmap(/dev/mem, phys 0x30000000, PROT_READ|PROT_EXEC, MAP_SHARED)
Unable to handle kernel paging request at virtual address ff1c000000c00008
Oops [#1]
epc : flush_icache_pte+0x74/0xa0
 ra : do_remap_pfn_range+0x2b2/0x3ee
...
note: test[52] exited with preempt_count 2

With CONFIG_FLATMEM (32-bit, or a 64-bit configuration without
SPARSEMEM) nothing faults: pte_page() of a pfn outside RAM is a pointer
outside mem_map, and flush_icache_pte() tests and sets a bit of whatever
memory it lands on. The privilege needed is that of the device file
(root for /dev/mem and the PCI resource files). Present since the port
was merged (v4.15).

__set_pte_at() calls flush_icache_pte() for every present executable
PTE. flush_icache_pte() does the flush once per folio: it takes
page_folio(pte_page(pte)) and tests and sets PG_dcache_clean. A special
PTE (pte_mkspecial(), what remap_pfn_range() and vmf_insert_pfn() write
into a VM_PFNMAP mapping) maps a frame the kernel does not manage as a
page: there is no struct page behind it, so pte_page() returns a vmemmap
address with no memory section, or with FLATMEM a pointer outside the
array.

Skip the flush for special PTEs, as arm64 does since
commit 71fdb6bf61bf ("arm64: Do not synchronise I and D caches for
special ptes"). These mappings are device memory or buffers the kernel
never wrote code into on the user's behalf; a user that writes code
into one and executes it has to flush with the cache flush system
call, as for any memory it writes itself.

Found while formally verifying remap_pte_range() against the kernel
binary.

Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Every pte_special() PTE goes through this path: remap_pfn_range() and
    io_remap_pfn_range() (remap_pte_range() writes pte_mkspecial(pfn_pte())),
    vmf_insert_pfn() (insert_pfn()), and the huge variants through
    set_pmd_at()/set_pud_at(), which also land in __set_pte_at(). The
    pte_special() bit is _PAGE_SPECIAL (RSW bit 8) on every riscv
    configuration; ARCH_HAS_PTE_SPECIAL is selected unconditionally.
    
    Non-special PTEs are unchanged: anonymous, page cache and
    vm_insert_page() mappings keep the per-folio flush. A RAM-backed
    VM_PFNMAP mapping (dma_mmap_coherent() of an allocated buffer, /dev/mem
    over RAM) loses the flush it used to get; nothing in the kernel writes
    instructions into such a buffer for userspace to execute, and the
    PG_dcache_clean state of those pages was never maintained for that use.
    
    Reproducer (QEMU virt, riscv64 defconfig, as /init with /dev/mem c 1 1
    in the initramfs; the PCIe ECAM window is at 0x30000000, any non-RAM
    range does):
    
      riscv64-linux-gnu-gcc -O2 -static -o test exec_mmio_mmap.c
      qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic \
          -bios /usr/share/qemu/opensbi-riscv64-generic-fw_dynamic.bin \
          -kernel Image -initrd initramfs.cpio -append "console=ttyS0 rdinit=/init"
    
      unpatched: Unable to handle kernel paging request at virtual address
                 ff1c000000c00008, epc : flush_icache_pte+0x74/0xa0,
                 ra : do_remap_pfn_range+0x2b2/0x3ee; the task never exits
      patched:   mapped at 0x7fffab55d000, first word 0x00081b36
                 (the host bridge's vendor and device ID)
    
      #include <fcntl.h>
      #include <stdint.h>
      #include <stdio.h>
      #include <stdlib.h>
      #include <sys/mman.h>
      #include <unistd.h>
    
      int main(int argc, char **argv)
      {
      	unsigned long phys = argc > 1 ? strtoul(argv[1], NULL, 0) : 0x30000000UL;
      	volatile uint32_t *p;
      	int fd;
    
      	fd = open("/dev/mem", O_RDONLY | O_SYNC);
      	if (fd < 0) {
      		perror("open /dev/mem");
      		return 2;
      	}
      	printf("mmap(/dev/mem, phys 0x%lx, PROT_READ|PROT_EXEC, MAP_SHARED)\n", phys);
      	fflush(stdout);
      	p = mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_SHARED, fd, phys);
      	if (p == MAP_FAILED) {
      		perror("mmap");
      		return 2;
      	}
      	printf("mapped at %p, first word 0x%08x\n", p, p[0]);
      	return 0;
      }

 arch/riscv/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 40b1ed4f3ea8..7a4d60ccabb0 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -628,7 +628,8 @@ void flush_icache_pte(struct mm_struct *mm, pte_t pte);
 
 static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 {
-	if (pte_present(pteval) && pte_exec(pteval))
+	/* A special PTE has no struct page for flush_icache_pte() to track. */
+	if (pte_present(pteval) && pte_exec(pteval) && !pte_special(pteval))
 		flush_icache_pte(mm, pteval);
 
 	set_pte(ptep, pteval);

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0

