Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395304;
	b=ZzTc87ssMO0WhJ2cjgSgC02dYg4FvdBsqi3HM7F0/0vPw+t+qatGHDGMT9LO9iuo0HVf
	 y0dAbqEUrY+qfzE8qMiFuNTBTm1nCR8b77smSkNPCBs97U8pOV/WpqK3YPfDiVY1k6Ob6
	 GLwSFHWXRIg2/MfRu9VlSj5c2H3NqRrscNOfXt/9E1PaEMqxvu37aoOuzYDHCvKkvnD8O
	 h2rKVhzD4+J8FjBIUcqrlxYm4sxFY4y90fsre3ceLnfkFM3qg94dWDYErqYbud0lRjaAR
	 ZNKZvo8XF4Tf3RUro9blAA/kw5mRvObB7InASEmjqxHGuhsAbhRHtXFYSLDAMxao2rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=IbCldHU5Mwk7c5H3z6Uc6u4VrcQ6WVCcsNry6NcYtQ0=;
	b=Su42+0Q7jckYh5RctGCQ2dcDekdCFc9+Sjig26EIUUhPD2VY39tZNMtYTuvDm9/VVeoF
	 8fb93pvoE91aYzfr1cn6WTCsvB7MMSeYWDvVPIw45CopmlBy6feWXWhYwtmy8uIHfKmBS
	 LUA+qGpeXs3DWpCQ+NP2kWzej5ikFK6yw/HLPWRgkTK9uQz6jgozpg2iTD9AcZLV9RxlO
	 kCJJ20wtMPTcGkJQ1jeN0BOiU/dCtk63mNptz5TG0RhNiBQifkU8I401/2A7R8bOrzhy9
	 ZEYp/TPHCT/xK9yO97A8G6xLG8QgHnCbNg97dLps19jCUmf759H999RC4Q8fbcF/Yag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jKj7+f0A;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24965606A89B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24965606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jKj7+f0A
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso23266065e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395302; x=1795000102; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbCldHU5Mwk7c5H3z6Uc6u4VrcQ6WVCcsNry6NcYtQ0=;
        b=jKj7+f0AhFaEp2+3Z+0D8x6LnwhhprpmAEOQC7tSuRjUXh/9L8c2NzSGapEFDAP7R3
         mnKR9li7kmEtmur++A1lnIfOjYV9wyoHPxl8LWcv4BZcNiZ2WEIrgvOTcSgyNpylfCxU
         27rfen40+PyJ6NRfE7Z81HvVJEEAzqyp6d87taSV5MltmOqXn6TsbFG1FUXrc/k0Xk8i
         coyZYxxigytDcMAe0UVLA9iokiPn6VTB6EDOebZ4CM2nCV5dysA5RcCWV72tIvJc/DQX
         ymtVpxN53Cp6J53JzET3iOMAYT8bwmnDYyXcGY6LLjG4afFWLffeztSiiS8P/cuoYQBL
         AvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395302; x=1795000102;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbCldHU5Mwk7c5H3z6Uc6u4VrcQ6WVCcsNry6NcYtQ0=;
        b=kQCsKvNCyupoJoHUiTxUnfUhYUD8fytLTn7GnHAPo1hrJgb8sfVXZP/5TVugkpW5EE
         CRz1OIWKG86RkTqtZ0kfkOT5WUbc1JdJst/3xErUHFcggtFmRxMH2JzI5Pa1/49fA1i0
         O9LOgr8xgfHUluPQx75jPq/igA/1VBEl2fKiB37HuLynmfiv6QzorHBDB9Nz0yjHZsR3
         3GeLQQWmGEGtOHOoPWl7lW1lqcUMk1QHBEb5V1db/WVjQUreoy+dNxj4Qx9KgtpFlDzF
         uc5CM1fmkLU68ZyEcQQvlQ7o4/ijhRfi+Vv78NXr3eU6z7oxaBV8Jai56c0wM/wG3LPo
         g4sQ==
X-Forwarded-Encrypted: i=1; AL+hErHVOAcbjzOAfjr2Pslsw6fUOujyCfQ4UaB4mG14OGFWpJ2nzYBFVdjykLjvAAW8g4rQIzcuWoxztQuv7rM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rajzyPNLGMlp8Zdmfp0gViPQGcNR7exYoaESRGKo7nImFzZ0n
	lLxTMyPV0O8g4/wTT7EW6xl/xX78qs9F17YDQdRI+EsHONhS+1QyRLzeMAPWQU/qyWnEhHSnFpL
	vTKMBjkNe7jaHN5hUbmtdiw==
X-Received: from wmba9.prod.google.com ([2002:a05:600c:6dc9:b0:4a1:b748:caa2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b78:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4ba0938fdf4mr37001375e9.31.1794395302318;
 Wed, 11 Nov 2026 03:08:22 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:30 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-1-vdonnefort@google.com>
Subject: [PATCH v3 0/8] arm64: Unmap FF-A lent memory from direct map
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

This series is a follow-up to the discussion that has started here [1].

When memory is lent to the Secure world via FF-A, CPU speculative
accesses from NS to the lent pages can still occur as long as it retains
a cacheable mapping to it.

Ideally, lent memory would be "no-map" but that would mean giving up
MiBs of useful memory, so let's try to do better with the help of a CMA
pool.

On arm64, modifying the direct map at runtime is generally restricted
because the linear map defaults to block mapping and splitting blocks at
runtime may trigger fatal page fault, unless the CPU implements BBML3
or the entire direct map was mapped at page granularity from boot.
Forcing last-level mappings system-wide incurs a severe penalty we want
to avoid. Instead, this series introduces targeted last-level mappings
for designated memory regions, along with a generic "lendable-dma-pool"
CMA driver to manage unmapping and remapping on lend/reclaim transitions:

1. memblock:
   - Introduce MEMBLOCK_PTEMAP to force PTE mappings only for a specific region.

2. dma-mapping:
   - Introduce the "lendable-dma-pool" CMA reserved-memory driver, along with
     generic dma_zap_direct_map() and dma_restore_direct_map() APIs to unmap
     pages from the direct map and restore them.

3. arm64 direct map support:
   - Implement the "lendable-dma-pool" hooks.

4. OP-TEE support:
   - Hook OP-TEE dynamic protected memory allocation (tee_shm_alloc_dma_mem()) to
     dma_zap_direct_map() and dma_restore_direct_map().

Testing:
========

Tested with QEMU v8 using OP-TEE OS (built with CFG_CORE_DYN_PROTMEM=y)
under both SMC and FF-A transports [2]

static void dump_direct_map(const char *label)
{
	printf("\n=== %s ===\n", label);
	fflush(stdout);
	system("sed -n '/Linear Mapping start/,/Linear Mapping end/p' /sys/kernel/debug/kernel_page_tables");
	fflush(stdout);
}

int main(int argc, char *argv[])
{
	int heap_fd;
	int dmabuf_fd;
	struct dma_heap_allocation_data data = { 0 };
	size_t size = 1024 * 1024; /* 1MB */

	if (argc > 1)
		size = strtoul(argv[1], NULL, 0);

	dump_direct_map("BEFORE ALLOCATION");

	heap_fd = open("/dev/dma_heap/protected,secure-video", O_RDWR);
	if (heap_fd < 0) {
		perror("open /dev/dma_heap/protected,secure-video");
		return 1;
	}

	printf("\nOpened /dev/dma_heap/protected,secure-video\n");
	printf("Allocating %zu bytes of protected memory via DMA heap...\n", size);

	data.len = size;
	data.fd_flags = O_RDWR | O_CLOEXEC;
	if (ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &data) < 0) {
		perror("ioctl DMA_HEAP_IOCTL_ALLOC");
		close(heap_fd);
		return 1;
	}

	dmabuf_fd = data.fd;
	printf("Successfully allocated %zu bytes! dmabuf_fd = %d\n", size, dmabuf_fd);

	dump_direct_map("DURING LEND (EXPECT HOLE IN DIRECT MAP)");

	printf("\nReleasing dmabuf_fd...\n");
	close(dmabuf_fd);
	close(heap_fd);

	dump_direct_map("AFTER RECLAIM (RESTORED DIRECT MAP)");

	return 0;
}

[1] https://lore.kernel.org/all/20260807-tegra-vpr-v4-7-5510d16af89e@nvidia.com/
[2] https://optee.readthedocs.io/en/latest/building/gits/build.html#qemu-v8

Changelog:

v3:
  - Replace "arm,ffa-lend-pool" and OP-TEE "memory-region" DT binding with generic
    "lendable-dma-pool" compatible with "linux,cma-default" (Sumit).
  - move conflict check to flag-setting time in memblock_setclr_flag()
    (Mike)
  - Rebase onto v7.4-rc1.

v2 (https://lore.kernel.org/all/20260921110050.3977591-1-vdonnefort@google.com/):
  - Rename MEMBLOCK_LLMAP to MEMBLOCK_PTEMAP (Mike)
  - Warn on conflicting MEMBLOCK_NOMAP and MEMBLOCK_PTEMAP flags (Mike)
  - Drop DT "ll-map" property and mark MEMBLOCK_PTEMAP from ffa_lend_pool_setup() (Rob, Thierry)
  - Drop "reusable" and "no-map" property checks from ffa_lend_pool_setup() (Rob)
  - dt-bindings: Document arm,ffa-lend-pool (Rob)
  - Rework the Optee support with a separate ffa_lend_pool.c file.
  - use walk_kernel_page_table_range_lockless() for
    can_set_direct_map_range() to fix folded page table (Sashiko)
  - Add missing TLB flush in ffa_prepare_lend()
  - Disable hibernation
  - Rebase on linux-next (next-20260918) to use the new set_direct_map*() ranges (Mike)

v1 (https://lore.kernel.org/all/20260902104712.2399797-1-vdonnefort@google.com/)

Vincent Donnefort (8):
  memblock: Introduce MEMBLOCK_PTEMAP
  arm64: Add support for MEMBLOCK_PTEMAP
  dma-contiguous: Expose rmem_cma_ops
  dt-bindings: reserved-memory: Add lendable-dma-pool
  dma-mapping: Introduce lendable-dma-pool
  arm64: Introduce direct_map_is_ptemap()
  arm64: Add support for lendable-dma-pool
  optee: Add support for lendable-dma-pool

 .../reserved-memory/lendable-dma-pool.yaml    |  58 +++++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/set_memory.h           |   6 +
 arch/arm64/mm/dma-mapping.c                   |  71 +++++
 arch/arm64/mm/mmu.c                           |  22 +-
 arch/arm64/mm/pageattr.c                      | 121 ++++++++-
 drivers/tee/optee/protmem.c                   |  48 +++-
 include/linux/dma-map-ops.h                   |   9 +
 include/linux/dma-mapping.h                   |  16 ++
 include/linux/memblock.h                      |   9 +
 kernel/dma/Kconfig                            |   3 +
 kernel/dma/Makefile                           |   1 +
 kernel/dma/contiguous.c                       |   4 +-
 kernel/dma/contiguous.h                       |  10 +
 kernel/dma/lendable.c                         | 243 ++++++++++++++++++
 mm/memblock.c                                 |  39 ++-
 16 files changed, 630 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml
 create mode 100644 kernel/dma/contiguous.h
 create mode 100644 kernel/dma/lendable.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.542.g3ef89b7020-goog

