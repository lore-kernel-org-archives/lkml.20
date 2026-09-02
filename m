Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1764449F10B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355661; cv=none; b=OO6KxbBjnLjDw+wSi7KRtyvaANJepHNfoUmIF/ctyhrlN3PZDREKogh8Rqad3peeNH9UsHcR39Guo5/05x8ThouY1bGcahT2AlZd2QNNOQu6y/5cq1y29YYuNE26cYfsrqLkXkTcA6cv2q4xEp9Qo+e/xYjc1/QfEX42nFyOeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355661; c=relaxed/simple;
	bh=46EGZ5pqfojB4SEknL4ghE/O+NrgMIaCGgz/FeaouIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTn9iAEy1U48deM/1pkiuDb7sVOlABSMqY2Rapwv7d+/3If61+F1DRevwyrO1VcfQD+23hLJXw0/MfU4iLRiaIhpYSJDz2bM3sfsX+Io0JuW9GGdS1fP7+j5Px6R+buS2rHAwrc8bkdmp4oLePGXy0aa1CuISWW8bXEZWothFwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ofKbxAXN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ofKbxAXN"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c250f28f1cdso172799466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788355654; x=1788960454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zt5M13bJdXW7K7qyVlwwml2r+oge4XhKrpcO5BXQh9I=;
        b=ofKbxAXNtAzivtKRsGVB85Itd0b0Oy6YbN2Xs1wGHxV1lwAt7HTvTH1RijoRYa+i2S
         OTq0/h0iG1g2O+uUMTLrNZFaZ6TqdffnophWz4XsJFiGwxk590vdQP7bTJ+sR0Hpfto/
         bsUvooe6hGjrjx/fuGKOSW+A5WViz58TiJ82burSvpfe0YbXBemHpsa9fH7skW/yeufl
         Od+iJYl6k1nsXG0VWrpFotkdJdaaPkJdmEipfwDGIEzGdWTWhFqcFsZAtNSKCuoxwPy1
         rAzaCVN9OlEtzj69O5uDQn8vUMSVw9PqHdUS83jxxFvj6l8wZqS4AxX8ZgIDuWsxWdRZ
         SApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355654; x=1788960454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zt5M13bJdXW7K7qyVlwwml2r+oge4XhKrpcO5BXQh9I=;
        b=JxnxFkPTSCytwxdXbsDRD5k9FgqRu0YFcyoPsdqCyxP7jQRoyawQppr2zic1Y2sJ8w
         4C/0blwjNKrkmxgH0rt6MyGEI8Q8yFfkwvdT6KRXmmSK+d2LnkJGK3WSTU7jlgvdosWo
         wNlKipOksGh/wWjhWBROs7blg3/Ywp6eocaf84p+cYN0xZDJ3iHUSASYWCiqEI+uIMVN
         jaztkx2lz16/3G8HwKZgwu16rRy5Xa68bpUopurdbU9TULgqIzKQkWp565Pa7CUIA+iN
         Av3SnrwCwD5IYhzrgWbr91Z7AoF84Feet4L7W/zFrKCgl6Xw9rPINgbf799ZG31rkzhA
         cJAg==
X-Forwarded-Encrypted: i=1; AKwUvBxE0QlO+ymKWxvOIdiPtc4hIjNTvqVaunSr2MYjAnWEPlsEZYNYmuFZVBluTptExLiohF/mdWHx14neFVY=@vger.kernel.org
X-Gm-Message-State: AFuF++nQFBAKb56O3EXy6Q+AapWvLm/Ua+uNiFP1I1pg+aaVT97szjGp
	CPMAL/W6w7pBoGCOiO2cVJ33RpxhftwpqRikJiLy9/MQAtsttyRGvuLnZj2RA2xCxg==
X-Gm-Gg: AYBFou3v6olyoGVH/5nQYDCkFMUEsaHlGZQIDhDSw0F/ib3EFCmDSsZ2O4ca+Y8vl82
	xBs8RvRvfz3HMnBGK8t5/uVLPHWQ8nRrp966mX4+K6FWdN4Fv+A5Csl0FKAfWh4+QrdCK69AfEy
	dXEjZcZ/7mLGyaZSyr19r0pqtD4TxrDQTJVOy9mnXE4Fii13INU92QKKlXWPv/tfh6Hayu5shHw
	bQxZuWKXfcwFWylAerDSsGAtbJjA8w1EA5JP33FCpWeESG6DsP5LeSsa2GIoGVqKjfSDqc7NxGW
	r+tTXndK6Z8NnweYcXhNJaXQZr5tqpU7HB71mIuJm+bdB8xmDTzPGAKeR/Qu/aY977S1YgWkkPc
	TmQhAKomaEjwKnYqHObMotZKgIJaQMvV76+D+R+8FiWTVWO/lmKYDQ7NZLTSiSkc/FcfjBrvA2l
	6ms/ceujMRnolaJIksGR/6TuSvUiwy/ukAQy8q7sJmPmlHMorN8TJFIt9WDgCkkFLKPoWmBTdT2
	rNgyRPxnbewwN1/xRoDkkJBxWWdIJyf
X-Received: by 2002:a17:906:f58e:b0:c25:c954:faf2 with SMTP id a640c23a62f3a-c25d563a41cmr291059666b.21.1788355652676;
        Wed, 02 Sep 2026 06:27:32 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d796sm138037066b.40.2026.09.02.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:27:32 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:27:28 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/10] arm64: Unmap FF-A lent memory from direct map
Message-ID: <apgkQJai-2pjI75-@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>

This is of course v1, not v9...

On Wed, Sep 02, 2026 at 11:47:02AM +0100, Vincent Donnefort wrote:
> This series is a follow-up to the discussion that has started here [1].
> While standalone, it also provides primitives reusable for the VPR DMA
> heap.
> 
> When memory is lent to the Secure world via FF-A, CPU speculative
> accesses from NS to the lent pages can still occur as long as it retains
> a cacheable mapping to it.
> 
> Ideally, lent memory would be "no-map" but that would mean giving up
> MiBs of useful memory, so let's try to do better with the help of a CMA
> pool.
> 
> On arm64, modifying the direct map at runtime is generally restricted
> because the linear map defaults to block mapping and splitting blocks at
> runtime may trigger fatal page fault, unless the CPU implements BBML3
> or the entire direct map was mapped at page granularity from boot.
> Forcing last-level mappings system-wide incurs a severe penalty we want
> to avoid. Instead, this series introduces targeted last-level mappings
> for designated memory regions, along with the "arm,ffa-lend-pool" CMA
> driver to manage unmapping and remapping on lend/reclaim transitions:
> 
> 1. memblock & OF reserved memory ("ll-map"):
>    - Introduce MEMBLOCK_LLMAP and the DT "ll-map" property for reserved-memory
>      nodes to force last-level (PTE) mappings only for a specific region.
> 
> 2. set_memory infrastructure:
>    - Introduce can_set_direct_map_range() to check if a specific address
>      range is mapped with last-level entries and can be modified safely.
>    - Introduce __set_direct_map_*() variants that bypass redundant checks
>      when the caller has already validated the range.
> 
> 3. "arm,ffa-lend-pool" driver
>    - Introduce the "arm,ffa-lend-pool" CMA reserved-memory driver, which
>      unmaps pages prior to lending (ffa_prepare_lend()) and restores them
>      when reclaimed (ffa_lend_reclaimed()).
> 
> 4. Optee support
>    - Hook OP-TEE dynamic protected memory pools to "arm,ffa-lend-pool" for
>      both SMC (via DT memory-region phandle) and FF-A (via
>      ffa_lend_pool_attach()) transports.
> 
> Testing:
> ========
> 
> Tested with QEMU v8 using OP-TEE OS (built with CFG_CORE_DYN_PROTMEM=y)
> under both SMC and FF-A transports [2]
> 
> static void dump_direct_map(const char *label)
> {
> 	printf("\n=== %s ===\n", label);
> 	fflush(stdout);
> 	system("sed -n '/Linear Mapping start/,/Linear Mapping end/p' /sys/kernel/debug/kernel_page_tables");
> 	fflush(stdout);
> }
> 
> int main(int argc, char *argv[])
> {
> 	int heap_fd;
> 	int dmabuf_fd;
> 	struct dma_heap_allocation_data data = { 0 };
> 	size_t size = 1024 * 1024; /* 1MB */
> 
> 	if (argc > 1)
> 		size = strtoul(argv[1], NULL, 0);
> 
> 	dump_direct_map("BEFORE ALLOCATION");
> 
> 	heap_fd = open("/dev/dma_heap/protected,secure-video", O_RDWR);
> 	if (heap_fd < 0) {
> 		perror("open /dev/dma_heap/protected,secure-video");
> 		return 1;
> 	}
> 
> 	printf("\nOpened /dev/dma_heap/protected,secure-video\n");
> 	printf("Allocating %zu bytes of protected memory via DMA heap...\n", size);
> 
> 	data.len = size;
> 	data.fd_flags = O_RDWR | O_CLOEXEC;
> 	if (ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &data) < 0) {
> 		perror("ioctl DMA_HEAP_IOCTL_ALLOC");
> 		close(heap_fd);
> 		return 1;
> 	}
> 
> 	dmabuf_fd = data.fd;
> 	printf("Successfully allocated %zu bytes! dmabuf_fd = %d\n", size, dmabuf_fd);
> 
> 	dump_direct_map("DURING LEND (EXPECT HOLE IN DIRECT MAP)");
> 
> 	printf("\nReleasing dmabuf_fd...\n");
> 	close(dmabuf_fd);
> 	close(heap_fd);
> 
> 	dump_direct_map("AFTER RECLAIM (RESTORED DIRECT MAP)");
> 
> 	return 0;
> }
> 
> [1] https://lore.kernel.org/all/20260807-tegra-vpr-v4-7-5510d16af89e@nvidia.com/
> [2] https://optee.readthedocs.io/en/latest/building/gits/build.html#qemu-v8
> 
> Vincent Donnefort (10):
>   memblock: Introduce MEMBLOCK_LLMAP
>   of: reserved_mem: Introduce "ll-map" property
>   set_memory.h: Introduce can_set_direct_map_range()
>   set_memory.h: Introduce __set_direct_map*()
>   arm64: can_set_direct_map() if BBML3
>   arm64: Implement can_set_direct_map_range()
>   arm64: Implement __set_direct_map*()
>   arm64: Add support for MEMBLOCK_LLMAP
>   firmware: arm_ffa: Introduce ffa-lend-pool
>   optee: Add support for arm,ffa-lend-pool
> 
>  arch/arm64/include/asm/set_memory.h  |   7 +
>  arch/arm64/mm/mmu.c                  |  23 ++-
>  arch/arm64/mm/pageattr.c             |  67 +++++++-
>  drivers/firmware/arm_ffa/Kconfig     |   5 +
>  drivers/firmware/arm_ffa/Makefile    |   1 +
>  drivers/firmware/arm_ffa/lend_pool.c | 223 +++++++++++++++++++++++++++
>  drivers/of/of_reserved_mem.c         | 104 ++++++++++---
>  drivers/tee/optee/ffa_abi.c          |  13 +-
>  drivers/tee/optee/protmem.c          |   8 -
>  drivers/tee/optee/smc_abi.c          |  17 +-
>  drivers/tee/tee_shm.c                |  11 +-
>  include/linux/arm_ffa.h              |  21 +++
>  include/linux/memblock.h             |   9 ++
>  include/linux/set_memory.h           |  39 +++++
>  mm/memblock.c                        |  50 ++++++
>  15 files changed, 545 insertions(+), 53 deletions(-)
>  create mode 100644 drivers/firmware/arm_ffa/lend_pool.c
> 
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> -- 
> 2.55.0.970.g62bdec98f9-goog
> 

-- 
Vincent
