Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730776;
	b=HNm5y+pTN2p2wrsR63A+fuTEq3hitDOQmPHSSFo6tndmnU1gmIbHHe1q7HvgEf6DuZ6V
	 B8AzkHzu1n9wRX1rdwY+i0IdkY1k8eIYE3dV+5eBGOUQQk6Gwb0v8h/k4LfKvOFpTSZ/n
	 6gp6PPgBuOKxLWpJ5QW3m+xqtLb+yMKcUqFRE8wjZHNiGyG9DLSNWRhZOzSSZBI+n1ACQ
	 9JdNSr3DlA+0zlTr2xyTwhtmg4piL/dtxG95l0vnqLWTAL2b/2Uo0G4+YyvA1i8OstvBR
	 bP23Lln+aPuIGR4iz7ejg1yfpGVhurcVaeAjbiXBqSYpdyV6mITs9XfS6LbOCai+XdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730776;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2mCcxNx71AdEX2AD/m5T8Vdk5yeOOOCszsNCu2WWj04=;
	b=feDaWiuZzPGRhEZha6LE3Iu47dpBoPp13HcKVt7tXUmQZaoSVLovPAYscGXUSYD4hDHn
	 CJzqJad9aTcbWFynB+coL0CVV2SWvpXD2JjteZpmRUkn+xz4k/HlbDkNndnExLd1RprZi
	 LTR74OXAMkY/Enz+fI4rLagZcb85zYKxRKvSdvHJsoHXJsw7DSNY4zVs9cdPh+ehKAPrO
	 SKSvbaxAiQbUH5Rs7+m7ewdRs7GqeP8ywLVI7ev2AFtVPpcRCeSb20sGiE5M7h46ruENb
	 HZi+iDRvPqJR5+6D0QlG1yJ/Xeh8q1WeIF9aibwTW0fx9akAqhX9Z6pnSy+vf34i4+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lR5Yhus4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C91606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lR5Yhus4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEA01F000C1;
	Tue,  3 Nov 2026 18:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730775;
	bh=2mCcxNx71AdEX2AD/m5T8Vdk5yeOOOCszsNCu2WWj04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lR5Yhus4sMJk9zLIVPqiiFVjJH0xhDD3dHHY5F6LOu4/L2NFRSH9bvWn1V9C+Hsm3
	 /StrnHWSpxAF+CQHwGSQZGDT9ZAZFrA1Vz90GiQ0u+YRNV+gRWxChJQp/pCaakQ/0h
	 UAX0wVKX37jwighHVY3DyieBqFQBxjvqWP4PNi9ei09VtUHSnfruGPDoZT0+GaPruL
	 P40ny61Lv6Z6CRJaKupElfIYfFTPlAL9Z+ZuRWXfcwqtNRre9U8pCgtFhF/G5qsobm
	 YHuqjNVz0Oy5WNXyhwqMA2uNRyVv0lxqOcbl/vsZ+MU2HT9CUQxk08Ezl6Jk5ES76i
	 AUWJk3WI1Y6og==
Date: Tue, 3 Nov 2026 20:32:48 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>,
	Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] kho: skip zero-sized lowmem and global bootmem areas
Message-ID: <auoo0EOKJLn9GUIw@kernel.org>
References: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
 <20261103-kho-bootmem-sizing-v1-1-45aa74098f34@kernel.org>
 <2vxza4nqm27n.fsf@kernel.org>
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
In-Reply-To: <2vxza4nqm27n.fsf@kernel.org>

On Tue, Nov 03, 2026 at 03:14:36PM +0100, Pratyush Yadav wrote:
> Hi Mike,
> 
> On Tue, Nov 03 2026, Mike Rapoport (Microsoft) wrote:
> 
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
> 
> Thanks for the patch! LGTM for the most part, one minor nitpick below.
> 
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
> 
> I reckon it will be cleaner if you update kho_bootmem_cnt here directly.
> So you directly do:
> 
> 	kho_bootmem[kho_bootmem_cnt].addr = addr;
> 	kho_bootmem[kho_bootmem_cnt].size = size;
> 	kho_bootmem_cnt++;
> 
> You won't have to pass around *idx and you won't need the final
> kho_bootmem_cnt assignment.

Ack.
 
> You might also want to have a kho_bootmem_max_cnt and do some bounds
> checking here.

Hmm, feels like over protecting. And if future patches will miss it AI will
yell anyway :)
 
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
