Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791351;
	b=1VVLCddYlzzJrzCrvPExHhdY/FGoPP3C5QEkSPufVJrE/NSi8Tp7eM+yW9FCr4c++ZHd
	 JlIpmnG2suw33T/oW9mrYEk+Pv1OPwF6ydjnf3jd0mkQk+vDmI7hMXEeq+83pn/E0QIE1
	 UWrgvNijXShmMzaoe/XSy+fG+dAZJpnbdgUlQBwWl+M8u0eV9tfrdv7uFO9aIZPc2mhxs
	 wZsiM7hcRyRB0PPNscDLO0OnMUpBlN3CGi38mFeEcR51B/FObqZHVGdGgiId1eqePkSQT
	 BrEmnvCabg9IO14X7zBrYkNMYUbephAxmTArmrg6IG8J8hn5J7szMEBoP/phk6kPU4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791351;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PhlIWW6g3N+AFu1LsfAztQ3Wt3gvl8nW98AXZASgM/A=;
	b=ehO4OGuetP5NxGnS1z0oPGvGCe8zdsH16STFI+WUOwxMiMcX5FBS/GgPthTcwN2kNXvI
	 FlIXmnsJKBv2AqaRNB7OZ6+9gD8FzOpsdzpFmaiBpYAaB3AenQ8A1M31ofeFjz59/OYxM
	 2cuXdpt3ZqnDPArAGNV7Rx13411jqjbDp55RvGeVfvhKjeA1Ea9qNRtqx5JVwQ0/FtNOt
	 8MmUEAKTEw5c9ZQ+kDBEs81lUv5MwBj5UdmV2LRI/HoNt4PLpffyVYEF+6f4Qjc8ZHNGA
	 ejmEYkBAbddEf4vAn+eCyuA7mzBELOQVMEKaaQnAUKod8Af6oGpAtfyiFgXFPNGiZLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzQFw0Fc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA43606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzQFw0Fc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC30B1F00A16;
	Wed,  4 Nov 2026 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793791350;
	bh=PhlIWW6g3N+AFu1LsfAztQ3Wt3gvl8nW98AXZASgM/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PzQFw0FctCGUG1qHhQ27pa7aqyd7BxJUFvbnrW/uv19RT1NEp+QBsPx9tWUT0MRKZ
	 EP/IgnjNU2qQXaN6ydBSAjnVmbibh1JigkN4pF0k4b4TVFlN6vXgsHaMIv4OLWjbtW
	 9JZAxCVdX8vntYR8F2GsWdf0v+5nIZntQeHoeycoXS6Lh2ud8VSmqn3XOp3F5vl6Gk
	 1UEiBKOXa+yKIeI0dmRVCCjCuoSXB1eQLxtei9hnz4GTO95SjGcSospGRBVSQlJ3qW
	 ekL/wjVM9kPF4GBBy0057j6cy9SYv1Kl52peqE0i5VtsYdAP5nRfejwHQD75bTPkD2
	 5zQx0FPWv/hpg==
Date: Wed, 4 Nov 2026 13:22:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>,
	Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] kho: skip zero-sized lowmem and global bootmem areas
Message-ID: <ausVbqZd9qgZf4zc@kernel.org>
References: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
 <20261103-kho-bootmem-sizing-v1-1-45aa74098f34@kernel.org>
 <auo3PzmisfK3br1l@google.com>
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
In-Reply-To: <auo3PzmisfK3br1l@google.com>

On Tue, Nov 03, 2026 at 02:48:36PM -0500, Pasha Tatashin wrote:
> On 11-03 13:49, Mike Rapoport (Microsoft) wrote:
> > The lowmem and the global bootmem areas can have zero size, for example
> > when none or all of the memory is below ARCH_LOW_ADDRESS_LIMIT, or when
> > either of those areas is explicitly set to zero with kho_bootmem=.
> > 
> > For a zero-sized allocation memblock returns an address without reserving
> > anything, and that empty area is recorded in kho_bootmem. If there is no
> > memory below ARCH_LOW_ADDRESS_LIMIT, allocation of the empty lowmem area
> > fails and KHO gets disabled.
> > 
> > Extract a helper that checks for zero size and allocates memory from
> > memblock, and use it to skip empty areas the same way as empty per-node
> > areas are skipped.
> > 
> > Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> > Reported-by: Chen Pei <cp0613@linux.alibaba.com>
> > Closes: https://lore.kernel.org/all/20261026131851.9942-1-cp0613@linux.alibaba.com
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  kernel/liveupdate/kexec_handover.c | 61 ++++++++++++++++++--------------------
> >  1 file changed, 29 insertions(+), 32 deletions(-)
> > 
> > diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> > index 6f1f55fe31819..f268c57413a7e 100644
> > --- a/kernel/liveupdate/kexec_handover.c
> > +++ b/kernel/liveupdate/kexec_handover.c
> > @@ -820,6 +820,27 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
> >  	return false;
> >  }
> >  
> > +static int __init kho_reserve_bootmem_area(int *idx, phys_addr_t size,
> > +					   phys_addr_t end, int nid)
> > +{
> > +	phys_addr_t addr;
> > +	int i = *idx;
> > +
> > +	if (!size)
> > +		return 0;
> > +
> > +	addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES, 0, end,
> > +					nid, true);
> > +	if (!addr)
> > +		return -ENOMEM;
> > +
> > +	kho_bootmem[i].addr = addr;
> > +	kho_bootmem[i].size = size;
> > +	*idx = i + 1;
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * kho_reserve_bootmem - Reserve a contiguous chunk of memory for kexec
> >   *
> > @@ -832,7 +853,7 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
> >  static void __init kho_reserve_bootmem(void)
> >  {
> >  	int nid, i = 0, max_nr_bootmem;
> > -	phys_addr_t addr, size;
> > +	phys_addr_t size;
> >  
> >  	if (!kho_enable)
> >  		return;
> > @@ -852,56 +873,32 @@ static void __init kho_reserve_bootmem(void)
> >  	 * reserve bootmem area in low memory for lowmem allocations in the
> >  	 * next kernel
> >  	 */
> > -	size = bootmem_size_lowmem;
> > -	addr = memblock_phys_alloc_range(size, BOOTMEM_ALIGNMENT_BYTES, 0,
> > -					 ARCH_LOW_ADDRESS_LIMIT);
> > -	if (!addr) {
> > +	if (kho_reserve_bootmem_area(&i, bootmem_size_lowmem,
> > +				     ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NODE)) {
> >  		pr_err("Failed to reserve lowmem bootmem\n");
> 
> You are adding a helper that returns an error code and then ignoring it 
> at all call sites. Even though it can only return -ENOMEM right now, 
> dropping the return value is not good practice.

I don't think error code is important here.
Even if some theoretical future update will change
kho_reserve_bootmem_area() to return anything but -ENOMEM I don't see why
the error code should be printed at all.

And anyway, that would be the part of that change.

-- 
Sincerely yours,
Mike.
