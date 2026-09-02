Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6727F471D03
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346274; cv=none; b=g0J1x9c3p9Jt7DPir1mn7cYH8VhHMK3ocENCglKa6PVJYijYb77o10oI56E191Y0AIPtHC4THExZLXthYbntfmTB4VMu0uoYMGpXyXhC2DgQf+wMVSY+ykoxENTzweBRZXhbL4HHal1q0EcXJu2ZMiKDb85DP/PKVeYVx7CulUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346274; c=relaxed/simple;
	bh=b8dYj5Mb3BDa4NaGc2pKKYPn/Bn+O6BIzVzZSjPQZ/s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oRYPHY+mwopquQ35PeLXK645cwdSnbYyCnkv8r3OYbY6nw60w0UE1jVwovFyLN2cnVmc83X+/dK40rsIO2cq2KFbF/HpU53RCGXr3II542hwCo2/VXCMOmGFqjKWT9iQs30MrgKAMoada4aHRmylUtSsDq4cowXNMh7MKHSWT0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jkSTbENv; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jkSTbENv"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso6862985e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346267; x=1788951067; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj637K00n75DiMuZkcJnY4d1CwmzO8C83BzSZ9fxg50=;
        b=jkSTbENvdw70mma+cEbL08uv5RzY4c817tlniRpqsLTqGRTMdKsdCU+/YXk8pdXX7X
         w7/3MA2rr2SWzLpBTNbFZDWNSwlODlMMenj8PcF9qFDO7dGC3XEJBEJfjSCeNLODwTBx
         hqHK3m9v1ZEiYVNDx78UkQAwes/nLUzDZ2f38mII62rrVlX4F60Ayc7yB+bhNJx/+ibE
         8XZCY9S5m0fzGQnrzbrghV7Vou1k727e0j5oe5Rap0fN1Ku/3VjSnwk58byjmJS6f1ui
         qeU5um2HBNejnSs4tYgHBt3lcuadYldhsXU6PtcVViSqmQDrY2xJO0XeKou79MDRTvHE
         w4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346267; x=1788951067;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fj637K00n75DiMuZkcJnY4d1CwmzO8C83BzSZ9fxg50=;
        b=YTVZQOiPI2G9ILP2wKFIEjuhG3vdbTh3lReKfQgu8dda63xbx6RZVzBlLVxwWuUt15
         c7crnUgf+1K2LmVw+mMGp4g9FDXXm84rqNKinQ/MG8x/h56OzhQilzPgQCFJHHu025pk
         ak9sgTPn09kXXzX6198wzBd31ucX3Wok6bLcU0hdF2PtZVP54fMJYTbraRJf/0r5FB85
         FcWDAT8jNPtbUM8Qi++wtUeVeAHEM6E0MuGWAPmzX5KoVrzrRBfwe65/D9ZS5uyM5ED4
         xeQsUCASF0prjM5b1NEZ93tiCQXUMXAb9WoSRgngsI/abfH9lIadwtsRXyr39BycXV6Q
         arXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrpz+DEwmpOAnEIK/KbweB6LOVuKM7VkYJY5S9CwrCtQWYTPw/Q15VWgp8bHQl8i+wPxaq22/8cMjX0JmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kCYzDVRPyvvc48C9VDH92/z4lDtjJGFwmRzukUGfRE8Zc28bW2
	SQHNRow9qIzwrRt3eanfnXi8m48NVxuu6TVYoLMXp/y3MtbCshgKR5CTufh0rfEqo5YJKLdjJcg
	rfcmDmUfoisspO6eVzgAQHA==
X-Received: from wmee9.prod.google.com ([2002:a05:600c:2189:b0:49c:e2b5:5573])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr63950535e9.16.1788346266751;
 Wed, 02 Sep 2026 03:51:06 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-1-vdonnefort@google.com>
Subject: [PATCH v9 00/10] arm64: Unmap FF-A lent memory from direct map
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
While standalone, it also provides primitives reusable for the VPR DMA
heap.

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

1. memblock & OF reserved memory ("ll-map"):
   - Introduce MEMBLOCK_LLMAP and the DT "ll-map" property for reserved-memory
     nodes to force last-level (PTE) mappings only for a specific region.

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

Vincent Donnefort (10):
  memblock: Introduce MEMBLOCK_LLMAP
  of: reserved_mem: Introduce "ll-map" property
  set_memory.h: Introduce can_set_direct_map_range()
  set_memory.h: Introduce __set_direct_map*()
  arm64: can_set_direct_map() if BBML3
  arm64: Implement can_set_direct_map_range()
  arm64: Implement __set_direct_map*()
  arm64: Add support for MEMBLOCK_LLMAP
  firmware: arm_ffa: Introduce ffa-lend-pool
  optee: Add support for arm,ffa-lend-pool

 arch/arm64/include/asm/set_memory.h  |   7 +
 arch/arm64/mm/mmu.c                  |  23 ++-
 arch/arm64/mm/pageattr.c             |  67 +++++++-
 drivers/firmware/arm_ffa/Kconfig     |   5 +
 drivers/firmware/arm_ffa/Makefile    |   1 +
 drivers/firmware/arm_ffa/lend_pool.c | 223 +++++++++++++++++++++++++++
 drivers/of/of_reserved_mem.c         | 104 ++++++++++---
 drivers/tee/optee/ffa_abi.c          |  13 +-
 drivers/tee/optee/protmem.c          |   8 -
 drivers/tee/optee/smc_abi.c          |  17 +-
 drivers/tee/tee_shm.c                |  11 +-
 include/linux/arm_ffa.h              |  21 +++
 include/linux/memblock.h             |   9 ++
 include/linux/set_memory.h           |  39 +++++
 mm/memblock.c                        |  50 ++++++
 15 files changed, 545 insertions(+), 53 deletions(-)
 create mode 100644 drivers/firmware/arm_ffa/lend_pool.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.970.g62bdec98f9-goog

