Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C42485CC7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988460; cv=none; b=cro5z/okPVW4SdrRx0i9AW86Pyl8ov8mY9UIcIXBoRnYmkcLsEE/qsP/CB7pm4iPnpb033QnLzcYxq25tQDbllZ3g7Ykpb0ZO0F91c1c0i5GW6xccMsBT/eyPo4l3CZ9vFbUoAJ9D5GfQZzcAk4oRkXjV5lIgusFY8PzVWEaUp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988460; c=relaxed/simple;
	bh=eN7iTn1wD0hv6E0Nm6zoniYYsyYKikUiM6fMfXhhLZk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=H2uDbbENAznTiaMJLByUC5FtnNOzv/4a/dhjFLxwiQ7988IUgRlKhpstGUnd0g43Gm68iT/lqBS9r4+KU3fTua9o7O8G5Vi7cdXsnApYCQHEmU8rTPUtGSPUoWvvR7ZWVnhwgdwe+Kww7gIBhBnsUzzes13ftMxxjFlx0tKexRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cL1ePzLd; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cL1ePzLd"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48706ee8fbaso1469962f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988457; x=1790593257; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tq21iXQPKKynEPw3Uhq/hZUwml7pvAbpZ0OeTPKe4Go=;
        b=cL1ePzLdXpoaQCdwKfWWbIXi4KNrhcpsvlpbejQ0aKMC9bZeESWteK1EuSoHg2/UIF
         DWNHrHsWQD/Rlw0ZqgfYNOBb1WUCP7P24iCPyJ6o0eD7fAhPHyvcSZOr02Z9pDbQIlVv
         SmhDq8gPdS+tIbrkuAsZW8HIoWKkqhJiiAeADpV5SJIayjc2FBIDijk8lTnLCEqT5TGa
         m4M/XpgzXq0UDsIuTRfUVu8r6tXEfGAR44zf9pH8FUez1n/keZqbcDM5mPWJjxbzgPM+
         l+iOl7wWlDBSAm8pl4GocAyaZJG8LvqahYWWPVnfJKY8Ue7bSc2kBSyUUdyQ9VJ4JISz
         sCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988457; x=1790593257;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tq21iXQPKKynEPw3Uhq/hZUwml7pvAbpZ0OeTPKe4Go=;
        b=L+oFLeyHlpUxyEAbRBaPeYb7uUM8cZB25Oz6tGuT4eHqxYUPZsnpEyqIldc03AJLcH
         51H4kitlXe4p0DMrLiObIox7K3OLSL3BYu0Ob0IQ6UZwMg5gne/beSkYQUE0dau5yL30
         zytFIvfrKRh2v/RSH1rGbuf2sB0LDChJxbuGGrnam2g9wQR1GNtb0rvF0pHdMyEngpyB
         ho7VlnVSTZz6GHCAsk8ANyrBlqvp/mWhgce5ojbQns6770cNV03gsxa+oClqjGSGtA20
         7yu3+BtRa7SL3d14DNNt2Lb7lvIrMyLlGm4AR5VH+Bka4lGoaHpVHCu8EMyPVKfe22jg
         TfTA==
X-Forwarded-Encrypted: i=1; AKwUvBza67s2BbzBtxsGm8TvMvKFxlpFSSzxesZfsCHUJGIedbfU6GmWhBwqscmAZ0GXZQjTq6Dxnp8+HoQ2i9E=@vger.kernel.org
X-Gm-Message-State: AFuF++nBm/a8cYnSJdB1yfqrkcRcvlhpIXLdE8eFLzuJH9RnS44/zNHW
	rmSKa8b2HhCeFovNX4EuGpNDyGvpkae8nRqDQ6Vi+2i+UXV3QJ5GFjvudxjkH4T5v2iZLXN/VMB
	ztvaMFEPNQPun4RJp5hIKqA==
X-Received: from wrbep8.prod.google.com ([2002:a05:6000:42c8:b0:488:5ffc:4b74])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6f05:0:b0:487:10b6:1ce2 with SMTP id ffacd0b85a97d-4871e2158d7mr13645670f8f.1.1789988455971;
 Mon, 21 Sep 2026 04:00:55 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-1-vdonnefort@google.com>
Subject: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
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
for designated memory regions, along with the "arm,ffa-lend-pool" CMA
driver to manage unmapping and remapping on lend/reclaim transitions:

1. memblock:
   - Introduce MEMBLOCK_PTEMAP to force PTE mappings only for a specific region.

2. set_memory infrastructure:
   - Introduce can_set_direct_map_range() to check if a specific address
     range is mapped with last-level entries and can be modified safely.
   - Introduce __set_direct_map_*() variants that bypass redundant checks
     when the caller has already validated the range.

3. "arm,ffa-lend-pool" driver
   - Introduce the "arm,ffa-lend-pool" CMA reserved-memory driver, which
     unmaps pages prior to lending (ffa_prepare_lend()) and restores them
     when reclaimed (ffa_lend_reclaimed()).

4. Optee support
   - Hook OP-TEE dynamic protected memory pools to "arm,ffa-lend-pool" for
     both SMC (via DT memory-region phandle) and FF-A (via
     ffa_lend_pool_attach()) transports.

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

v2:
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
  arm64: Introduce can_set_direct_map_range()
  arm64: Introduce __set_direct_map*()
  arm64: Add support for MEMBLOCK_PTEMAP
  firmware: arm_ffa: Introduce ffa-lend-pool
  optee: Add support for arm,ffa-lend-pool
  dt-bindings: reserved-memory: Add Arm FF-A lend pool
  dt-bindings: firmware: optee: Add memory-region property

 .../arm/firmware/linaro,optee-tz.yaml         |   5 +
 .../reserved-memory/arm,ffa-lend-pool.yaml    |  55 ++++
 arch/arm64/include/asm/set_memory.h           |   7 +
 arch/arm64/mm/mmu.c                           |  23 +-
 arch/arm64/mm/pageattr.c                      |  72 ++++-
 drivers/firmware/arm_ffa/Kconfig              |   5 +
 drivers/firmware/arm_ffa/Makefile             |   1 +
 drivers/firmware/arm_ffa/lend_pool.c          | 261 ++++++++++++++++++
 drivers/tee/optee/Makefile                    |   1 +
 drivers/tee/optee/core.c                      |   6 +
 drivers/tee/optee/ffa_abi.c                   |  13 +-
 drivers/tee/optee/ffa_lend_pool.c             |  72 +++++
 drivers/tee/optee/optee_private.h             |   4 +
 drivers/tee/optee/protmem.c                   |  20 +-
 drivers/tee/optee/smc_abi.c                   |  21 +-
 include/linux/arm_ffa.h                       |  23 ++
 include/linux/memblock.h                      |  18 ++
 mm/memblock.c                                 |  30 ++
 18 files changed, 608 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml
 create mode 100644 drivers/firmware/arm_ffa/lend_pool.c
 create mode 100644 drivers/tee/optee/ffa_lend_pool.c


base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
-- 
2.55.0.1082.g2b9226bbc0-goog

