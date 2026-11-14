Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645012;
	b=06Drpu5eF16nD2qM3Gl6DXHELUuhZOgv2GMFuFq9SasY5HtnPR+a4TFdJLthtPo7xLXP
	 zNufSvYbsklf/eRT+kQST/3FD2C/yBOJJa1cjqhPy0NAUxxM/FHnpMzVmGDy8HG15Dgqj
	 bTvGQ6310PrT4A3FUlGKdbh6ME4D/iJeUBfY829kDlN4QrRkC+Fh+xx0yX9oDx7rbC3kG
	 1sIB7LPg1S+wI4x/5yjXW+Y2t49QYTiPZrM6+kEWIoIRlTwhz/p5oqD2boNqiq8lEWMDx
	 0j6X4PwKZY+/AGGceCqpOE6p97cfPSS692GSAb5DKseHZjdJ3YvLMC2PiXHLIeoV8RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645012;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:To:Date:Message-Id:
	 X-Lms-Return-Path:X-Mailer:Cc:Mime-Version:From:Subject:
	 Content-Transfer-Encoding:Content-Type;
	bh=X/E8rE53z/h6J1QRHBaStJJ7ym5OmsZ7MzTsgKR+Y+c=;
	b=XjU0Qw4sgOJHYamPtBLIJQGxCKUWV1Ar9iSEGEB/+x12Mr11S2f8/KCbTxF0us6gh37x
	 YJFv876Ptr3jylq0gcgGtBGFkFTzeW0QDL8R1Sn5oO9P+Yn6XV1FCwSlfN/Ei3oPS3Eaq
	 cFIi+Pnj47SCmx4JtXESJ+Fg23yvv3N84eB39et+F2pUOvOK4GT9tA3Ur7L6KvVCaQeHQ
	 Qgc2HEDPxRAO0NQmfC1MCi0YXyegCQhlj2eiOqvR5UFcxbs6jPwshW5ncnidh45He2j37
	 uppFegYCo1rriKKYUH9g2bMS8N1lWsXL5t4k7DwGCym+xl0jSDUusVxq5qXimj7jbRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=NsHziZzt;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71119606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71119606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=NsHziZzt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794645005; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=X/E8rE53z/h6J1QRHBaStJJ7ym5OmsZ7MzTsgKR+Y+c=;
 b=NsHziZztJI5Sg250MxW4+6/9FYsnbDTcSPeD3zQKnCYStVNhDGwngUPlomuR6HKjiwASmc
 /PMBBHOAl1J1HQ9rnMTmCENM0x553tXlmpnD+0Ymq3nN/x4KFhJZaIrm4QvfYVqrV+PwYq
 h5A+flWzaS8dMCd9fc3IMSdIs4o6aNH4q+jl0aJkK80+SWBjA1t2c7QxuRemue4ZTpwqdJ
 PPN2ztrJdhEaIpKfA9ksCvzxkAJOBNSLSftpN9VrNoZluUkbADeIRCFwg/HWEJnLGIGSVU
 Tf1n8xTCzWmjk/S9D5PuL3f2hBMf8BG0sNyD2qeZf7h07DOD+KpxMqJEYjEMWQ==
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Date: Sat, 14 Nov 2026 16:29:40 +0800
Message-Id: <20261114082940.66057-1-zhaogongyi@bytedance.com>
X-Lms-Return-Path: <lba+26af81c0b+a310cc+vger.kernel.org+zhaogongyi@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: [PATCH] riscv: mm: Fix /dev/mem read/write range validation
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

RISC-V uses the generic valid_phys_addr_range(), which checks only the
upper limit. A pwrite() to physical address 0 on QEMU virt can therefore
reach write_mem() -> xlate_dev_mem_ptr() -> __va(), triggering a
hardened usercopy BUG ("vmalloc 'no area'"). UART MMIO with iomem=relaxed
triggers the same fault.

Limit read/write to ranges fully covered by System RAM with valid PFNs
at or above the physical start of the linear map. This rejects holes
and MMIO before the __va() access. Keep the mmap() range policy unchanged.

MMIO read/write now returns -EFAULT even with iomem=relaxed. With
CONFIG_STRICT_DEVMEM=y, the existing RAM policy blocks the remaining
non-empty read/write ranges.

Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
RV64 and RV32 Image builds passed. RV64 QEMU covered the faulting
physical-0 and UART-MMIO writes, RAM/hole boundaries, and MMIO mmap.

 arch/riscv/include/asm/io.h |  4 ++
 arch/riscv/mm/Makefile      |  2 +-
 arch/riscv/mm/mmap.c        | 93 +++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/mm/mmap.c

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 92d5f831f..ef305ede2 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -32,6 +32,10 @@
 #define ioremap_wc(addr, size)	\
 	ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL_NC))
 
+#define ARCH_HAS_VALID_PHYS_ADDR_RANGE
+int valid_phys_addr_range(phys_addr_t addr, size_t size);
+int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
+
 #endif /* CONFIG_MMU */
 
 /*
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index b916a68d3..e3461bec3 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,7 +13,7 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o tlbflush.o
+obj-$(CONFIG_MMU) += extable.o fault.o mmap.o pageattr.o pgtable.o tlbflush.o
 obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pmem.o
diff --git a/arch/riscv/mm/mmap.c b/arch/riscv/mm/mmap.c
new file mode 100644
index 000000000..45a0ac740
--- /dev/null
+++ b/arch/riscv/mm/mmap.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/ioport.h>
+#include <linux/mm.h>
+#include <linux/pfn.h>
+#include <asm/io.h>
+#include <asm/page.h>
+
+struct devmem_ram_range {
+	unsigned long next_pfn;
+	unsigned long end_pfn;
+	bool complete;
+};
+
+static int devmem_ram_range_check(unsigned long pfn, unsigned long nr_pages,
+				  void *arg)
+{
+	struct devmem_ram_range *range = arg;
+	unsigned long last_pfn;
+
+	if (pfn != range->next_pfn)
+		return 1;
+
+	last_pfn = pfn + nr_pages - 1;
+	if (last_pfn < pfn)
+		return 1;
+	if (last_pfn > range->end_pfn)
+		last_pfn = range->end_pfn;
+
+	for (;;) {
+		if (!pfn_valid(pfn))
+			return 1;
+		if (pfn == last_pfn)
+			break;
+		pfn++;
+	}
+
+	if (last_pfn == range->end_pfn) {
+		range->complete = true;
+		return 0;
+	}
+
+	range->next_pfn = last_pfn + 1;
+	return 0;
+}
+
+/*
+ * You really should not be using read() or write() on /dev/mem. Restrict
+ * these operations to ranges that are completely covered by System RAM with
+ * valid struct page backing. Device access should use proper I/O accessors,
+ * and /dev/mem mmap() keeps its separate policy below.
+ */
+int valid_phys_addr_range(phys_addr_t addr, size_t size)
+{
+	struct devmem_ram_range range;
+	phys_addr_t end;
+	phys_addr_t linear_start;
+	unsigned long start_pfn;
+	unsigned long nr_pages;
+
+	if (!size)
+		return 1;
+
+	end = addr + size - 1;
+	if (end < addr)
+		return 0;
+
+	linear_start = __pa(PAGE_OFFSET);
+	if (addr < linear_start)
+		return 0;
+
+	start_pfn = PHYS_PFN(addr);
+	range.end_pfn = PHYS_PFN(end);
+	if (range.end_pfn < start_pfn)
+		return 0;
+
+	nr_pages = range.end_pfn - start_pfn + 1;
+	range.next_pfn = start_pfn;
+	range.complete = false;
+
+	return !walk_system_ram_range(start_pfn, nr_pages, &range,
+				      devmem_ram_range_check) &&
+	       range.complete;
+}
+
+/*
+ * Preserve the existing /dev/mem mmap() range policy. Access filtering for
+ * mmap() is still handled by range_is_allowed().
+ */
+int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
+{
+	return 1;
+}

base-commit: 79fc9d9467a113bb93f4539c11fa8c937982ff89
-- 
2.39.5 (Apple Git-154)
