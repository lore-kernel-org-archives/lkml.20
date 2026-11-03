Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730968;
	b=Q79cEr3ql+zjCsrTlrB+w7ielc4tOOJDI7i3pgBra/81d9o5GhX1rg/j2H2VBff6ELzW
	 HFAOjM4zPzIjleFAxg1toYlDXnR2eP6l40EQvbM4gZUQ7to9duZUcUuBSttsfkccAsyAY
	 w3hsm7yC/zL1N/bpMpYHFsgzyfSQDaTwRR7TS654KkZkb7WJQwpy0C5LCkEZodVwSFy0D
	 RPxDE5dFHfpFesrCepow18jBUq+ukDm0MJ8bHozL8E1m5j2ROLi49AbTkLdARaaXqgA9c
	 t08disWJIWlbbN10hx7OA7Swvimi/Z3yqVaOshS/HCPumqHgnp+UFxgfckDhyR+9kvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730968;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BXtqewBsP373CPIOAi6YTJNiMe9FVQMK+bBEbUQClZU=;
	b=ZRGUk2AqVIxHnKzW9F+WlVqIWewYS4AmfhE1gyyGQ+e4GoEpZ5MLIXegafmcNFVAIi7z
	 Ix1W9EUBKURvdqIX5HA1BMUYA71BgfrZEiwfl2fxwbVnvWW36KDn5F2Hqm8idTdA+PZT5
	 aslgRpyLGY84pqCL1C3wrsD49iSdFPBew/Ih47W0i701oMUFV9vXaS+kOLhknSGVjhEMk
	 xZyI0Cj7PcuaWYsVeBo3dE6O9Zxt3Ut+CqdT935SJ7hZrZFhLIvgqs7+bTapuoE0XUlUj
	 n93+N0Xb+muN886QmewExo1d/KQyqXm2TM5345UrJ1UvKnevqtnZakLzyeyrVK6zXGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UH8BzPZP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C7C606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UH8BzPZP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16B61F00A15;
	Tue,  3 Nov 2026 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730968;
	bh=BXtqewBsP373CPIOAi6YTJNiMe9FVQMK+bBEbUQClZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UH8BzPZP8cqAcgbW0cJ2L2+EeGFa8v1ugJxgyujaVpJRuRY+sSCplVUE39iUvpYeu
	 D6ecFGlEC6/3TCkletVwNohOQv2BJNrNjwk7jIgifq72h/eagD0XCTcNzHg9FYs0Wj
	 HlsU+MQghxeeGnDEUZNxmhKoSDPp8ER3jnt71KYlUs8BJsH3yp3I56jFVTzAPJDi3T
	 cI/VO1uVPhFX8+5NWFOi4/0yk7U/i8sJgZkThrJDsHx98cnlkrRyhWZk+pz6MJC5lV
	 ovSEHcqvAE49zuIHSkwCpalvys7U15hZlL6DBvwTR10SnI2vHvMkF3Nfb27NjxX9ow
	 DLArzvkvQGnTg==
Date: Tue, 3 Nov 2026 20:36:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>,
	Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] kho: fix bootmem sizing
Message-ID: <auopkIsiqxzg4anJ@kernel.org>
References: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
 <20261103-kho-bootmem-sizing-v1-2-45aa74098f34@kernel.org>
 <2vxz5wydnbuj.fsf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxz5wydnbuj.fsf@kernel.org>

On Tue, Nov 03, 2026 at 05:01:08PM +0100, Pratyush Yadav wrote:
> Hi Mike,
> 
> On Tue, Nov 03 2026, Mike Rapoport (Microsoft) wrote:
> 
> > Bootmem areas are sized from overlapping views of the memory reserved in
> > memblock:
> >
> > * the global area is sized from all reserved memory, including memory
> >   allocated on specific nodes, so on NUMA systems everything allocated
> >   on a node is accounted in both the global area and the area of that
> >   node.
> > * per-node sizes are calculated after the lowmem and the global areas
> >   are reserved. With CONFIG_NUMA=n all memblock regions belong to node 0,
> >   so the lowmem and the global areas are accounted in the size of node 0
> >   area and scaled once again.
> >
> > As a result, bootmem is about twice bigger than it should be on NUMA
> > systems and about four times bigger with CONFIG_NUMA=n. On small systems
> > reservation of the bootmem may fail and then KHO gets disabled.
> >
> > Make the areas cover separate parts of the reserved memory: the lowmem
> > area covers allocations below ARCH_LOW_ADDRESS_LIMIT, per-node areas
> > cover allocations above it on each node and the global area covers
> > allocations that are not bound to any node. Calculate all sizes before
> > reserving any of the areas.
> >
> > With CONFIG_NUMA=n the global area becomes empty and it is not reserved.
> >
> > Bootmem sizes in MiB in x86 QEMU VMs, before -> after:
> >
> >                      CONFIG_NUMA=y     CONFIG_NUMA=n
> >   1G,  1 node         176 ->   92       320 ->   80
> >   4G,  1 node         508 ->  332      1264 ->  316
> >   16G, 2 nodes       1268 ->  704      2944 ->  736
> >   32G, 4 nodes       2296 -> 1224      5196 -> 1300
> >   64G, 4 nodes       4344 -> 2248      9664 -> 2420
> >
> > Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> > Reported-by: Kexin Liu <liukexin@kylinos.cn>
> > Reported-by: George Guo <guodongtai@kylinos.cn>
> > Closes: https://lore.kernel.org/all/20260904025101.9959-1-dongtai.guo@linux.dev
> > Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> > Closes: https://lore.kernel.org/all/20260922131217.698809-1-sourabhjain@linux.ibm.com
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Thanks for the patch! My LLM caught an interesting problems that is
> worth considering.
> 
> On arm64, ARCH_LOW_ADDRESS_LIMIT is arm64_dma_phys_limit - 1, and
> dma_limits_init() sets the default value to PHYS_MASK + 1, and it can
> also be memblock_end_of_dram() in some cases. So on arm64, it is
> possible for lowmem to span the entire RAM.
> 
> Currently, that results in over-allocation of bootmem, and it ends up
> being 4x what it should be. While obviously problematic, it should still
> work. With this patch, all memory is in lowmem, and nothing ever goes to
> per-node bootmem (except for the node that hosts the lowmem area).
> 
> All this is from reading the code, I haven't tried anything out yet.
> 
> Not sure how to fix this though. Should we perhaps use
> min(ARCH_LOW_ADDRESS_LIMIT, U32_MAX) for the lowmem limit?

Argh :)

Maybe we reset lowmem to zero if memblock_end_of_DRAM() <
ARCH_LOW_ADDRESS_LIMIT?
 
> Also, a couple nitpicks below.
> 
> > ---
> >  kernel/liveupdate/kexec_handover.c | 83 ++++++++++++++++++++------------------
> >  1 file changed, 44 insertions(+), 39 deletions(-)
> >
> > +
> > +		lowmem = reserved_mem_size(ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NODE);
> > +		global = reserved_mem_size(MEMBLOCK_ALLOC_ANYWHERE, NUMA_NO_NODE);
> > +		global -= lowmem;
> 
> Nit: Please add a short comment above this to explain why you remove
> lowmem from global.

I prefer to extend the comment above the function to say that calculations
for global and node that includes lowmem remove that.
 
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
