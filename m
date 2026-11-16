Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795887;
	b=QW8rBb0O0EHvb+AuqC/V3KBbnxhjopay3mcsbrAFrXgMR4wiagkEh05DHQzbnBhEOmGN
	 BZB8fPKGcYELn4jxVh5zHZ7FbY8XaL4IBQ5fBKiVTkXLuOHbF+ue9qpEzAYtNSviMblMl
	 60ekRPNPyLPDMtwPR9NU6mSeJpDPt41sezQryIaT/8AeIbwaBnBlv2R5GVVW7bFmLLArK
	 CrsdTsNPnFGyYluH6PNc1Bp7inrwnQ0JbCJG+HJrhoyJxxq4KhDxN8n8sR6OXFQdL5Lxl
	 cIwA15FIidPuDLFriBc2AdegPKi4Pr9/DaOGw8F+/m0CmTOUxGVbiChDIGsmownFj+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795887;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LsKScfO0dJa2srmU76Dlr1zeKCRPz7xQofnlV4WBL/E=;
	b=Knpf0Ng/2GflXvb4pXWRauND8BnW4xmS89kGhq2q2OK393+UOu2dp0q7xD0eq3PnqJum
	 TqtIpITSwNOWcxlc7qYdylGrtZ6IUxfQUOn40V2kuddmnSOtMWVn8dqpnuIy1XhMgfZlg
	 dK6LyIn1eml5vm3IMVy5RX+6ziUTvW/SLT6/8YG+0xM/Fa8e8JbAd3+8/+BPhzixQ94jh
	 kh3pM0OTTbyVqc9U4JHhQwlPZmFyKP5hdfp0rgbBROqvItPvC7HOE6y15d7QKsE1b9oy8
	 ieh7RhDwILbRqoejw4o72LcxctxZ/q3DxrYSwDGhyJW/pyn9im4PJUSOJSLftESZMHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3586606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3586606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmOX-004BHZ-Ne;
	Sun, 15 Nov 2026 21:24:33 -0500
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Waterman <andrew@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2] riscv: mm: Skip the icache flush for special PTEs
Date: Sun, 15 Nov 2026 21:24:33 -0500
Message-ID: <20261116022433.49952-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
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

An executable mmap() of memory outside RAM through remap_pfn_range() or
vmf_insert_pfn(), such as /dev/mem or a PCI BAR's sysfs resource file,
oopses in flush_icache_pte() with the page table lock held, and the task
never exits. With FLATMEM the kernel instead sets a bit in whatever
memory lies past mem_map.

__set_pte_at() calls flush_icache_pte() for every present executable
PTE, and flush_icache_pte() records the flush in the folio of
pte_page(). A special PTE may have no struct page behind it.

Skip the flush for special PTEs, as arm64 does since
commit 71fdb6bf61bf ("arm64: Do not synchronise I and D caches for
special ptes").

Reproduced on QEMU virt with the riscv64 defconfig by mapping the PCIe
ECAM window from /dev/mem with PROT_EXEC; the patched kernel maps it.

Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Changes in v2:
    - Reworded the source comment as suggested by Jisheng Zhang.
    - Shortened the commit message.
    - Rebased on v7.4-rc3.
    
    v1: https://lore.kernel.org/all/20261017013634.792220-1-nickolai@csail.mit.edu/
    
    This patch was prepared with the help of an AI coding assistant.
    
    Reproducer (QEMU virt, riscv64 defconfig, run as /init with /dev/mem
    c 1 1 in the initramfs; 0x30000000 is the PCIe ECAM window, any non-RAM
    range does):
    
      riscv64-linux-gnu-gcc -O2 -static -o test exec_mmio_mmap.c
      qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic \
          -kernel Image -initrd initramfs.cpio -append "console=ttyS0 rdinit=/init"
    
      unpatched: Unable to handle kernel paging request at virtual address
                 ff1c000000c00008, epc : flush_icache_pte+0x5c/0xa2,
                 ra : do_remap_pfn_range+0x284/0x3e6; the task never exits
      patched:   mapped at 0x7fff8418b000, first word 0x00081b36
    
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

 arch/riscv/include/asm/pgtable.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2ebd5fa5adc5..48eeeac1019b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -624,7 +624,11 @@ void flush_icache_pte(struct mm_struct *mm, pte_t pte);
 
 static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 {
-	if (pte_present(pteval) && pte_exec(pteval))
+	/*
+	 * Special PTE mappings are not intended to be executable and may not
+	 * even have an associated struct page.
+	 */
+	if (pte_present(pteval) && pte_exec(pteval) && !pte_special(pteval))
 		flush_icache_pte(mm, pteval);
 
 	set_pte(ptep, pteval);

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0

