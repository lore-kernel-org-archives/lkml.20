Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB7D2472AE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291019; cv=none; b=VB4rTdtW9UP97XyQ9KB6K5QPuyti3DUZDPs6b+nUyyWAddATZn2mZLGE/lSE+redLaSAFffPuG1O65Av7KrpUgnc7akMoYV81+9UrVBPSHjYQI5UrNEIOmwTNH1V77q3n7Es60MvHKUrkf2/7Ae0HI8BQ86Zm373LgJ/WcnYZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291019; c=relaxed/simple;
	bh=Dqr0b5AvzV7wYDGxyuGiC8nKsnes/TzBhyS1p+WcOGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPBzVTi61tXG+ntq9WKeUu5rYoXjlwrY1KfulNBabhXZIPpvsuajYcxslcxRWazNkNp13r3cRDCTaKVM4TdPyWXkAw47tbdGnVW5QMuBWJuBOQ7R3d9Q13+F3BWr08bN/oV2oRxXcsqQZ4x81z5tsEcb6+lxkHVc9Pb1SKGm+XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIGlV-004O5Y-T7;
	Sat, 17 Oct 2026 22:36:49 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] riscv: mm: Define PAGE_KERNEL_RO
Date: Sat, 17 Oct 2026 22:36:49 -0400
Message-ID: <20261018023649.798595-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel mappings that generic code creates read-only are writable on
riscv. With HugeTLB vmemmap optimization (selected by riscv and on by
default with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON), the tail
vmemmap pages of every optimized huge page are remapped to one shared
page with PAGE_KERNEL_RO so that a stray write to a tail struct page
faults. On riscv that remap keeps _PAGE_WRITE, so such a write silently
changes the struct pages of every optimized huge page instead.
early_memremap_ro() (EFI system and configuration tables), the
firmware loader's vmap() of the loaded image, and acpi_os_ioremap() for
EFI runtime code and NOMAP regions, which asks for a read-only mapping
precisely to avoid a writable mapping of executable code, are affected
the same way.

riscv defines PAGE_KERNEL_READ but not PAGE_KERNEL_RO, so
include/linux/pgtable.h falls back to "#define PAGE_KERNEL_RO
PAGE_KERNEL". Define PAGE_KERNEL_RO as PAGE_KERNEL_READ. FIXMAP_PAGE_RO
then follows from asm-generic/fixmap.h: early_memremap_ro() now passes
0xe3 instead of 0xe7 to __early_ioremap().

Tested on QEMU virt (riscv64, defconfig with
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON and CONFIG_PTDUMP_DEBUGFS,
booted with hugepages=8): before, every vmemmap entry in
/sys/kernel/debug/kernel_page_tables has W set; after, the 28K of tail
vmemmap of each huge page is mapped R without W.

Fixes: a3c7d6b642e4 ("riscv: mm: hugetlb: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Reproducer (riscv64 defconfig + CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y
    CONFIG_PTDUMP_DEBUGFS=y, QEMU virt): a static /init that prints the vmemmap
    part of the kernel page table dump.
    
      #include <stdio.h>
      #include <string.h>
      #include <sys/mount.h>
      #include <sys/reboot.h>
    
      int main(void)
      {
      	char line[256];
      	int in = 0;
      	FILE *f;
    
      	mount("sysfs", "/sys", "sysfs", 0, NULL);
      	mount("debugfs", "/sys/kernel/debug", "debugfs", 0, NULL);
      	f = fopen("/sys/kernel/debug/kernel_page_tables", "r");
      	while (f && fgets(line, sizeof(line), f)) {
      		if (strstr(line, "---[ "))
      			in = strstr(line, "vmemmap start") != NULL;
      		if (in)
      			fputs(line, stdout);
      	}
      	fflush(stdout);
      	reboot(RB_POWER_OFF);
      	return 0;
      }
    
      riscv64-linux-gnu-gcc -static -O2 -o init init.c
      qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic -kernel Image \
        -initrd initramfs.cpio -append "console=ttyS0 hugepages=8"
    
    Before (all vmemmap entries writable):
      0xff1c000002000000-0xff1c000002200000  0xbec00000  2M PTE  D A G . . W R V
      0xff1c000002200000-0xff1c000002800000  0xbea00000  6M PMD  D A G . . W R V
    
    After (each huge page: 4K head W, 28K tail read-only, shared page 0x81fd0000):
      0xff1c0000020a1000-0xff1c0000020a8000  0x81fd0000  28K PTE D A G . . . R V
      0xff1c0000020a8000-0xff1c0000020a9000  0x81fd6000   4K PTE D A G . . W R V
      0xff1c0000020a9000-0xff1c0000020b0000  0x81fd0000  28K PTE D A G . . . R V

 arch/riscv/include/asm/pgtable.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 40b1ed4f3ea8..13447181ceb7 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -189,6 +189,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
 
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
 #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
+#define PAGE_KERNEL_RO		PAGE_KERNEL_READ
 #define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
 #define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
 					 | _PAGE_EXEC)

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.53.0

