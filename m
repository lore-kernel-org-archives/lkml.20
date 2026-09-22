Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9012930568B;
	Tue, 22 Sep 2026 05:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056640; cv=none; b=EErdkkyLbuLioiEXhr1pda+wGM3rpWlldeVfWLvMYorJbcLUADN3kRtItf+AdZ64dImUH63/oaeltwx4OgS/cBrmLL269/AYGtIUnCwOG13b1bwgmdGloSToyuNpaHbvmnBOOVQPeKD8lqxXL+2oiYC9EYuDcQJMngfvH4Uwv1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056640; c=relaxed/simple;
	bh=oA4X8bg4D69EtOBe5V6cBG+ESypw2o0LdcbV1QdnU98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAZ9dK/KyMgKRV5kMhH7jPL7HoRs+3aR1uaRPgWrJjgf3YeyUk7DO4ptumgN6zaCJ/CCLNhIxu6vnWPRN3zCYcQdEy0ie6fhp2W5u2JxgNFMq9qq/ldIn3QMoAmMcNwsLryxRwUv3HI81Uz4SdLxh0CzxxWQg1QYtmXrEr2Og9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+bx1QbA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+bx1QbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4481F000FF;
	Tue, 22 Sep 2026 05:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790056639;
	bh=+ObChoFplMy58dVx0xmB9riQUjVBXhcLJqj+sig+tvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H+bx1QbAFtCK5w8M9OLBwMjmshn4FWUiM1fycWLxf1SkhL43AQrFieZcHFmE4hLD7
	 L01DQCz8u9gjWUXZHVl4yoTr35oGoeOxVRwlyyli2yh3joHBvr2bDgrG/P1Gwxnjp4
	 YU5rWSRq0+ZliYAOl716wxH5pV6K88X22O+wziPNMz4YOCA8PmNkr0y9cqXTH/afTF
	 AIjOAQGxDNSj9LhUrUQ5dXXTcJ8U7cxZSUMA6EiztqiDPY8n/S5MrMvWllIw47pb4u
	 4RNeLomvR5MwdcZRd1Jc4Vnx4G5VblBp8nrsrn18gr1MR6hcFNL7oCIQU6mxN8Owij
	 LRVYFNUFrY6tQ==
Date: Tue, 22 Sep 2026 11:27:10 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <arIYtjmSKCs14SqO@sumit-xelite>
Mail-Followup-To: Vincent Donnefort <vdonnefort@google.com>,
	catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921110050.3977591-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>

Hi Vincent,

On Mon, 21 Sep 2026 at 12:00:42 +0100, Vincent Donnefort wrote:
>This series is a follow-up to the discussion that has started here [1].
>
>When memory is lent to the Secure world via FF-A, CPU speculative
>accesses from NS to the lent pages can still occur as long as it retains
>a cacheable mapping to it.
>
>Ideally, lent memory would be "no-map" but that would mean giving up
>MiBs of useful memory, so let's try to do better with the help of a CMA
>pool.
>
>On arm64, modifying the direct map at runtime is generally restricted
>because the linear map defaults to block mapping and splitting blocks at
>runtime may trigger fatal page fault, unless the CPU implements BBML3
>or the entire direct map was mapped at page granularity from boot.
>Forcing last-level mappings system-wide incurs a severe penalty we want
>to avoid. Instead, this series introduces targeted last-level mappings
>for designated memory regions, along with the "arm,ffa-lend-pool" CMA
>driver to manage unmapping and remapping on lend/reclaim transitions:
>
>1. memblock:
>   - Introduce MEMBLOCK_PTEMAP to force PTE mappings only for a specific region.
>
>2. set_memory infrastructure:
>   - Introduce can_set_direct_map_range() to check if a specific address
>     range is mapped with last-level entries and can be modified safely.
>   - Introduce __set_direct_map_*() variants that bypass redundant checks
>     when the caller has already validated the range.
>
>3. "arm,ffa-lend-pool" driver
>   - Introduce the "arm,ffa-lend-pool" CMA reserved-memory driver, which
>     unmaps pages prior to lending (ffa_prepare_lend()) and restores them
>     when reclaimed (ffa_lend_reclaimed()).
>
>4. Optee support
>   - Hook OP-TEE dynamic protected memory pools to "arm,ffa-lend-pool" for
>     both SMC (via DT memory-region phandle) and FF-A (via
>     ffa_lend_pool_attach()) transports.


Thanks for your proposal in trying to solve this hard problem of
unmapping pages from kernel linear map. I remember discussing this
problem last year at LPC too.

Have you had a chance to look at a more generic MM proposal around this
issue here [1]?

One of the major concern for me with your proposal is tying the
protected memory allocation to fixed sized platform specific pool size
based on DT. Then the cost of granular mappings/unmapping if the
platforms choose to enlarge these pools.

As you maybe aware one of the major use-cases here for protected DMAbufs
is the secure media pipeline use-case which is memory intensive
workload. IMO, the solution proposed at [1] seems to address it although
people have flagged rough edges there but should be addressable.

Can you try a port of [1] for arm64 since the author did all the work
with x86 as reference?

[1] https://lore.kernel.org/all/20260726-page_alloc-unmapped-v3-0-6f5729aa9832@google.com/

-Sumit

>
>Testing:
>========
>
>Tested with QEMU v8 using OP-TEE OS (built with CFG_CORE_DYN_PROTMEM=y)
>under both SMC and FF-A transports [2]
>
>static void dump_direct_map(const char *label)
>{
>	printf("\n=== %s ===\n", label);
>	fflush(stdout);
>	system("sed -n '/Linear Mapping start/,/Linear Mapping end/p' /sys/kernel/debug/kernel_page_tables");
>	fflush(stdout);
>}
>
>int main(int argc, char *argv[])
>{
>	int heap_fd;
>	int dmabuf_fd;
>	struct dma_heap_allocation_data data = { 0 };
>	size_t size = 1024 * 1024; /* 1MB */
>
>	if (argc > 1)
>		size = strtoul(argv[1], NULL, 0);
>
>	dump_direct_map("BEFORE ALLOCATION");
>
>	heap_fd = open("/dev/dma_heap/protected,secure-video", O_RDWR);
>	if (heap_fd < 0) {
>		perror("open /dev/dma_heap/protected,secure-video");
>		return 1;
>	}
>
>	printf("\nOpened /dev/dma_heap/protected,secure-video\n");
>	printf("Allocating %zu bytes of protected memory via DMA heap...\n", size);
>
>	data.len = size;
>	data.fd_flags = O_RDWR | O_CLOEXEC;
>	if (ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &data) < 0) {
>		perror("ioctl DMA_HEAP_IOCTL_ALLOC");
>		close(heap_fd);
>		return 1;
>	}
>
>	dmabuf_fd = data.fd;
>	printf("Successfully allocated %zu bytes! dmabuf_fd = %d\n", size, dmabuf_fd);
>
>	dump_direct_map("DURING LEND (EXPECT HOLE IN DIRECT MAP)");
>
>	printf("\nReleasing dmabuf_fd...\n");
>	close(dmabuf_fd);
>	close(heap_fd);
>
>	dump_direct_map("AFTER RECLAIM (RESTORED DIRECT MAP)");
>
>	return 0;
>}
>
>[1] https://lore.kernel.org/all/20260807-tegra-vpr-v4-7-5510d16af89e@nvidia.com/
>[2] https://optee.readthedocs.io/en/latest/building/gits/build.html#qemu-v8
>
>Changelog:
>
>v2:
>  - Rename MEMBLOCK_LLMAP to MEMBLOCK_PTEMAP (Mike)
>  - Warn on conflicting MEMBLOCK_NOMAP and MEMBLOCK_PTEMAP flags (Mike)
>  - Drop DT "ll-map" property and mark MEMBLOCK_PTEMAP from ffa_lend_pool_setup() (Rob, Thierry)
>  - Drop "reusable" and "no-map" property checks from ffa_lend_pool_setup() (Rob)
>  - dt-bindings: Document arm,ffa-lend-pool (Rob)
>  - Rework the Optee support with a separate ffa_lend_pool.c file.
>  - use walk_kernel_page_table_range_lockless() for
>    can_set_direct_map_range() to fix folded page table (Sashiko)
>  - Add missing TLB flush in ffa_prepare_lend()
>  - Disable hibernation
>  - Rebase on linux-next (next-20260918) to use the new set_direct_map*() ranges (Mike)
>
>v1 (https://lore.kernel.org/all/20260902104712.2399797-1-vdonnefort@google.com/)
>
>Vincent Donnefort (8):
>  memblock: Introduce MEMBLOCK_PTEMAP
>  arm64: Introduce can_set_direct_map_range()
>  arm64: Introduce __set_direct_map*()
>  arm64: Add support for MEMBLOCK_PTEMAP
>  firmware: arm_ffa: Introduce ffa-lend-pool
>  optee: Add support for arm,ffa-lend-pool
>  dt-bindings: reserved-memory: Add Arm FF-A lend pool
>  dt-bindings: firmware: optee: Add memory-region property
>
> .../arm/firmware/linaro,optee-tz.yaml         |   5 +
> .../reserved-memory/arm,ffa-lend-pool.yaml    |  55 ++++
> arch/arm64/include/asm/set_memory.h           |   7 +
> arch/arm64/mm/mmu.c                           |  23 +-
> arch/arm64/mm/pageattr.c                      |  72 ++++-
> drivers/firmware/arm_ffa/Kconfig              |   5 +
> drivers/firmware/arm_ffa/Makefile             |   1 +
> drivers/firmware/arm_ffa/lend_pool.c          | 261 ++++++++++++++++++
> drivers/tee/optee/Makefile                    |   1 +
> drivers/tee/optee/core.c                      |   6 +
> drivers/tee/optee/ffa_abi.c                   |  13 +-
> drivers/tee/optee/ffa_lend_pool.c             |  72 +++++
> drivers/tee/optee/optee_private.h             |   4 +
> drivers/tee/optee/protmem.c                   |  20 +-
> drivers/tee/optee/smc_abi.c                   |  21 +-
> include/linux/arm_ffa.h                       |  23 ++
> include/linux/memblock.h                      |  18 ++
> mm/memblock.c                                 |  30 ++
> 18 files changed, 608 insertions(+), 29 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/reserved-memory/arm,ffa-lend-pool.yaml
> create mode 100644 drivers/firmware/arm_ffa/lend_pool.c
> create mode 100644 drivers/tee/optee/ffa_lend_pool.c
>
>
>base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
>-- 
>2.55.0.1082.g2b9226bbc0-goog
>
