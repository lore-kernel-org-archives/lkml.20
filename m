Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359246;
	b=V7KowBUiw/dcAr2lBcPaXfPmYeztIXNR+y80vpCMLt44P8uVTZnIBm0X2gTRtDsai2k2
	 v2Go8cXR5ZZaidPz1UEdjdmU7YtwdtyFe+l9F+MiSuMS/yLmPdXePu0EyABe/1iYweb1y
	 GdDWgUhiOJ/DYmdaEEShtsA0yWBUsgBBP1R3enIqQwA7ja2LiVjhSF+YwN8pxhMeQWjIF
	 +ueT0vSmvMdKqGm3w3nOv34P7mEFn7BP2SEqbktk3KpzGAlSB61aMJiyEu7tDdx6I5zBM
	 RhLvnjp3h0iFMAYmaDy8IwX1Lou20x89yospKv38htKoVJl8e0LfdfAPJ2MrRx7MSMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359246;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5CuUDHSZWz+erT0w+UfPQPNxS4F/uosSHNPefWZBdyg=;
	b=eUMhHhOGyJd9IX6c6CTPr/diOqHwJ8rn//OiKIwPAJzpWjtBNKZXQJnmJ+HfCy/tk6vX
	 0Nn3J0LN9E6AMZpmxnL449JBEo6NLcjUlZEoNbzuuDDowPA2a1HdVxol4PcZ9KSUHHkE6
	 hsRnti8PDGaC7C8P4fYt3PU7VADmdBvDUlimvbyNPWh4QdGB0OlxMbqm6EUpaIMDQ0pf2
	 azly9nH5voGM46aBW5rnF6tdnf+Dqps114sxhabnh1+VKTDJMknnMMVWMDmgdh5xCWJ5D
	 xd0f194WwNzCkvXhPygW1TEuUVbQiVEJExFU+fNLZna7KmJ74SZ237q8+9SdNSEIDmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YWKXDREp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416E0606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YWKXDREp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BC01F00A02;
	Fri, 30 Oct 2026 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359245;
	bh=5CuUDHSZWz+erT0w+UfPQPNxS4F/uosSHNPefWZBdyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YWKXDREpHohFhFm/tgSgP271KsCBtGJ+juwgbl/qrlz1PNqk7lv3ChHCD8OrNiS5Y
	 DAnK6FDSSRb4ka31uJ7B3X6BB3YE3oBzbdMtVg79oZwdzcnI7puSmEWHj8molXBHWR
	 aPxAK4nlU6erZtS0QyO2mZ/2UeYPTdNpgAu4Mw1pojP7XtEl+UVJLAavpiM1M+WP8d
	 TmB7aOFiUVDQZgBtjm1N+ZYKaoyZgoOhAVw7vcBE2irOcBYPVEVx4TROUQL2AyD1gP
	 rkWFH1pbIIyJD71FjpFDjjuYkyULGQJ+LjBMCl6fLg/XpnjERoAaIsmDobBGHwBcH7
	 z2ivjfZCLxryQ==
Date: Fri, 30 Oct 2026 11:20:40 +0000
From: Will Deacon <will@kernel.org>
To: Usama Anjum <usama.anjum@arm.com>
Cc: Linu Cherian <linu.cherian@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <auR9iDfUxqz3ExP8@willie-the-truck>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <b6f0d10a-d098-43cc-b923-0245af5f51f0@arm.com>
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
In-Reply-To: <b6f0d10a-d098-43cc-b923-0245af5f51f0@arm.com>

On Wed, Oct 28, 2026 at 02:47:19PM +0000, Usama Anjum wrote:
> On 23/05/2026 2:47 pm, Linu Cherian wrote:
> > From: Ryan Roberts <ryan.roberts@arm.com>
> > 
> > There are 3 variants of tlb flush that invalidate user mappings:
> > flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> > would previously unconditionally broadcast their tlbis to all cpus in
> > the inner shareable domain.
> > 
> > But this is a waste of effort if we can prove that the mm for which we
> > are flushing the mappings has only ever been active on the local cpu. In
> > that case, it is safe to avoid the broadcast and simply invalidate the
> > current cpu.
> > 
> > So let's track in mm_context_t::active_cpu either the mm has never been
> > active on any cpu, has been active on more than 1 cpu, or has been
> > active on precisely 1 cpu - and in that case, which one. We update this
> > when switching context, being careful to ensure that it gets updated
> > *before* installing the mm's pgtables. On the reader side, we ensure we
> > read *after* the previous write(s) to the pgtable(s) that necessitated
> > the tlb flush have completed. This guarrantees that if a cpu that is
> > doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> > entry cannot have been seen by any other cpu and we can flush only the
> > local cpu.
> > 
> > Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> > [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > ---
> > Changelog from RFC v1:
> > - Adapted for v7.1 flush tlb API changes
> >   No changes in core logic
> > - Collected Rb and Tb tags
> > - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
> >   hence retained dsb(ishst) in flush_tlb_user_pre	
> > 
> > 
> > Testing with 7.1-rc4 :
> > +-----------------------+---------------------------------------------------+-------------+
> > | Benchmark             | Result Class                                      |  Improvement|  
> > +=======================+===================================================+=============+
> > | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> > +-----------------------+---------------------------------------------------+-------------+
> > | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> > | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> > +-----------------------+---------------------------------------------------+-------------+
> 
> I tested this patch using a synthetic Firecracker benchmark on a 192-CPU
> arm64 host, with Linux v7.3 on both the host and guests. Each worker
> repeatedly creates a fresh 1-vCPU microVM, boots Ubuntu, verifies an echo
> response over the serial console, and shuts the guest down, waiting for
> Firecracker to exit before starting the next VM. Each guest has 256 MiB of
> RAM, with two VM slots per workload CPU.
> 
> With 4 KiB guests, the unpatched workload stops scaling between 64 and 96
> CPUs: throughput falls from approximately 68 to 65 completed lifecycles/s
> despite the additional CPUs.
> 
> Applying the patch to the guest substantially improves throughput at higher
> concurrency. At 128 workload CPUs, I measured:
> 
>   Guest pages  Unpatched  Guest patched only  Host patched only
>   -----------  ---------  ------------------  -----------------
>   4 KiB        73.83/s    108.55/s (+47.0%)    74.09/s (+0.4%)
>   64 KiB       86.46/s    105.04/s (+21.5%)    90.15/s (+4.3%)
> 
> The host uses 4 KiB pages throughout. The host-only difference with 4 KiB
> guests is small enough that I would regard it as essentially unchanged.

Sorry, but I haven't understood the setup here. If each guest ("microVM")
only has 1 vCPU, then why does this patch have any effect in the "guest
patched only" case? Additionally, the non-broadcast TLB invalidation will
be upgraded to broadcast by the hypervisor.

But I'm certain I'm misunderstanding what you've tested here, as the
numbers indicate that something did change.

Will
