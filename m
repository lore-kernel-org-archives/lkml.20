Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362725;
	b=t9GGvr8BADbE8fgDwde3sjp52eNODXCrG0qnYfXdsVZh1ZT1i7gorUvuK2qVU991CNhI
	 VebG0uZdzIRKNuw1X1qPrY2cs4+6QiLK5VRbBxysyXvstp4wmY01Iye33liG0EwuQ9BIp
	 W0217rBQEK/oLBOsax7RTz3iZDprobuhq5XobmCnjuBhTR7O6A/F1I3qY3rAgOW6ivNni
	 VEnEUb/K1PyXd1xHjixH9PiiZJbQP9jBznlUEmlz9SUpLZcaX0j16PDeB0H0GpXJmkJYi
	 eKw+WKJ9gKeViGDwGh50zBAT4qDcMKrak82CFTjRAdYKW35Ge4RStNglJUf7Q2HUYag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362725;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XF7Kruz+VERXXGFD6bAbGW0IgqysTyfQGfE+6WQ3Rdc=;
	b=VGbE2jTZ1tbBAfxlGJjySUdsG5GkgLe2Bzuq0JeJyV+tCoPurcKtPrvt5fO/gqKm2klS
	 VPYVGFNLpfwZ8k+GUWZ6kOYUsOy998/u6lSjhB/rXQPJzZ7RnFk9avWmyA2mNM6p8hJ63
	 44HCLyD4gkT6akzMBK9PTlEPm63A8YLOSPE+s/LUUQvZnFBj66rgKij1a3NWttsOlSLu0
	 SXrNf9KEXQ5DvPldbDq0cyxG3uUeC7eP9YZfG6ZPgYIuk2C//tp313UztwKBb1Zhek848
	 YzPr2tkzIOY9JV1pyT5FLlP30I8RGv0UCnqdqVJ/npj0x1n6ZJvTZZGl3N9qg+ztYgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=o7DNZa5W;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACA2606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACA2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=o7DNZa5W
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73AE51682;
	Fri, 30 Oct 2026 05:18:40 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6F853F673;
	Fri, 30 Oct 2026 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793362723; bh=mr1vCM3m++CO0IeLTY678K5+pJpgcJelaLHGSOLgJ9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7DNZa5W8dfrCyTf2ZgrNZIvuu8obc5U5C1jkwLAnbAvVgeKwB8JmCLIDeB/wtVNE
	 CNqiM/jmsJVuclsTTf2gAYx24q09ZI0hj4JN1PIB0ts8iJsrdOXHnBgBJZrWjn/v+s
	 J9U4iDL/WTblD9WdYZHTd2inWTTqaOO/8BSS6do0=
Date: Fri, 30 Oct 2026 12:18:39 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Usama Anjum <usama.anjum@arm.com>, Linu Cherian <linu.cherian@arm.com>,
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
Message-ID: <auSLH65dv2nEctXd@arm.com>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <b6f0d10a-d098-43cc-b923-0245af5f51f0@arm.com>
 <auR9iDfUxqz3ExP8@willie-the-truck>
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
In-Reply-To: <auR9iDfUxqz3ExP8@willie-the-truck>

On Fri, Oct 30, 2026 at 11:20:40AM +0000, Will Deacon wrote:
> On Wed, Oct 28, 2026 at 02:47:19PM +0000, Usama Anjum wrote:
> > On 23/05/2026 2:47 pm, Linu Cherian wrote:
> > > From: Ryan Roberts <ryan.roberts@arm.com>
> > > 
> > > There are 3 variants of tlb flush that invalidate user mappings:
> > > flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> > > would previously unconditionally broadcast their tlbis to all cpus in
> > > the inner shareable domain.
> > > 
> > > But this is a waste of effort if we can prove that the mm for which we
> > > are flushing the mappings has only ever been active on the local cpu. In
> > > that case, it is safe to avoid the broadcast and simply invalidate the
> > > current cpu.
> > > 
> > > So let's track in mm_context_t::active_cpu either the mm has never been
> > > active on any cpu, has been active on more than 1 cpu, or has been
> > > active on precisely 1 cpu - and in that case, which one. We update this
> > > when switching context, being careful to ensure that it gets updated
> > > *before* installing the mm's pgtables. On the reader side, we ensure we
> > > read *after* the previous write(s) to the pgtable(s) that necessitated
> > > the tlb flush have completed. This guarrantees that if a cpu that is
> > > doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> > > entry cannot have been seen by any other cpu and we can flush only the
> > > local cpu.
> > > 
> > > Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> > > [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> > > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > > ---
> > > Changelog from RFC v1:
> > > - Adapted for v7.1 flush tlb API changes
> > >   No changes in core logic
> > > - Collected Rb and Tb tags
> > > - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
> > >   hence retained dsb(ishst) in flush_tlb_user_pre	
> > > 
> > > 
> > > Testing with 7.1-rc4 :
> > > +-----------------------+---------------------------------------------------+-------------+
> > > | Benchmark             | Result Class                                      |  Improvement|  
> > > +=======================+===================================================+=============+
> > > | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> > > +-----------------------+---------------------------------------------------+-------------+
> > > | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> > > | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> > > +-----------------------+---------------------------------------------------+-------------+
> > 
> > I tested this patch using a synthetic Firecracker benchmark on a 192-CPU
> > arm64 host, with Linux v7.3 on both the host and guests. Each worker
> > repeatedly creates a fresh 1-vCPU microVM, boots Ubuntu, verifies an echo
> > response over the serial console, and shuts the guest down, waiting for
> > Firecracker to exit before starting the next VM. Each guest has 256 MiB of
> > RAM, with two VM slots per workload CPU.
> > 
> > With 4 KiB guests, the unpatched workload stops scaling between 64 and 96
> > CPUs: throughput falls from approximately 68 to 65 completed lifecycles/s
> > despite the additional CPUs.
> > 
> > Applying the patch to the guest substantially improves throughput at higher
> > concurrency. At 128 workload CPUs, I measured:
> > 
> >   Guest pages  Unpatched  Guest patched only  Host patched only
> >   -----------  ---------  ------------------  -----------------
> >   4 KiB        73.83/s    108.55/s (+47.0%)    74.09/s (+0.4%)
> >   64 KiB       86.46/s    105.04/s (+21.5%)    90.15/s (+4.3%)
> > 
> > The host uses 4 KiB pages throughout. The host-only difference with 4 KiB
> > guests is small enough that I would regard it as essentially unchanged.
> 
> Sorry, but I haven't understood the setup here. If each guest ("microVM")
> only has 1 vCPU, then why does this patch have any effect in the "guest
> patched only" case?

I wonder whether it's the repeat TLBI workaround just doing more DVM
traffic. Turned off when no broadcast is needed.

> Additionally, the non-broadcast TLB invalidation will
> be upgraded to broadcast by the hypervisor.

I have a hack that makes things even faster (opportunistic
HCR_EL2.FB=0). I may post it once I understand the implications
properly.

-- 
Catalin
