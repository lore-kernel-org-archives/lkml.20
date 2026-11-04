Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794176;
	b=Vb6pM7j+/CoOld/iNCJffnGGz2kUzDbzRRzArAtmvlLcDv4BiGxakEXcFqDc3t5dLc43
	 oCt2mpLDDTP/kG2XSWBJU9BZ5V5030BmHXp1vlVtKuvV4Gizt/QpJN45PHYFzlg6ErPkt
	 Kx4/2+wgvGZQ9L8vzJ7lAZxxfKTH4ZLTKM87t1CReeOl2mjZ1ILV6t31Ht0gq1Qw0IMP4
	 oCKPFQKw7YFomhe+yucewTLH1khdU6QpVN4he5+rtAdfNhqPEDDhpePV78Cu2OlUjOa15
	 RWm9rAN/mlU7LDjO2qqDUp27GPmUXIaiIDA6Vj0PYfnXvfnHdqcCllA5eaDB/AW666A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794176;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=1q50kbPjm0laMW43CAFUAOZZKVJRQfTQZ2GnkZN13bI=;
	b=m7vscti4SnsD7YtvSVixNGdqwzm0EdXgAg+0NkXwH7K8+3gCjz97MBw7pjxcMN6UOsAX
	 KtUG5/KgTQyTSAnCmKl8HQn25tokfOoCBcSTVUvlf3HgTymZVRioMmYwNjCvk9/EQiBzV
	 QL8wDhX93VtdxGSeodaxaACmd/r+TxLiswKWozXdJ/ol2cYMBiG717l2qNCzQ0zcHqsPs
	 cD/6DIIl+HYoWW4sh8s5Tm0hR964xXFPdvaG86t0kKxGeb9hUOtzDFwu2fIy3qbr2dmO0
	 wuSrCwWwK6x1LmnlZx1o1ivb5kK/WjH4VR1zaSuvbKY3+dbm5eBj8l0E8PFZzat6x8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBacwDrO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5923C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IBacwDrO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69461F000C1;
	Wed,  4 Nov 2026 12:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794175;
	bh=1q50kbPjm0laMW43CAFUAOZZKVJRQfTQZ2GnkZN13bI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IBacwDrOzTcQPD6MCzu5ag+D5mCuIXCB25VBCeCuKwjRnD/yTDiBogxZl5jYquVve
	 N/U4Xgvva0AWTbh/czKe742mHd0uC0vYPThPEpYAb2YXeBo/pqTK+v1ukztA+/Pz9V
	 HGxTNqvaVYGHwy/p4rTyhbTlyW9BGHVeFn07LX1lyc1fPobEvsKQcEkbo5IzuUG1tN
	 buCEbkuRpb111d29csvEspHKSAFNA22GtU1fjipNnyVIefLnc0YZJnuaMMHlbqkqaJ
	 GY2c7l+XEoMg8KeeS7WKj1xOWOGD2D5PSrPbF8ucj879OhUM4eGyMevn3pT8EDNefA
	 jEdUudXx0W4Sg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Alexander Graf <graf@amazon.com>,  Andrew
 Morton <akpm@linux-foundation.org>,  Chen Pei <cp0613@linux.alibaba.com>,
  George Guo <guodongtai@kylinos.cn>,  Kexin Liu <liukexin@kylinos.cn>,
  Sourabh Jain <sourabhjain@linux.ibm.com>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH 1/2] kho: skip zero-sized lowmem and global bootmem areas
In-Reply-To: <auoo0EOKJLn9GUIw@kernel.org> (Mike Rapoport's message of "Tue, 3
	Nov 2026 20:32:48 +0200")
References: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
	<20261103-kho-bootmem-sizing-v1-1-45aa74098f34@kernel.org>
	<2vxza4nqm27n.fsf@kernel.org> <auoo0EOKJLn9GUIw@kernel.org>
Date: Wed, 04 Nov 2026 13:09:32 +0100
Message-ID: <2vxzwlqslrwj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 03 2026, Mike Rapoport wrote:

> On Tue, Nov 03, 2026 at 03:14:36PM +0100, Pratyush Yadav wrote:
>> Hi Mike,
>> 
>> On Tue, Nov 03 2026, Mike Rapoport (Microsoft) wrote:
>> 
>> > The lowmem and the global bootmem areas can have zero size, for example
>> > when none or all of the memory is below ARCH_LOW_ADDRESS_LIMIT, or when
>> > either of those areas is explicitly set to zero with kho_bootmem=.
>> >
>> > For a zero-sized allocation memblock returns an address without reserving
>> > anything, and that empty area is recorded in kho_bootmem. If there is no
>> > memory below ARCH_LOW_ADDRESS_LIMIT, allocation of the empty lowmem area
>> > fails and KHO gets disabled.
>> >
>> > Extract a helper that checks for zero size and allocates memory from
>> > memblock, and use it to skip empty areas the same way as empty per-node
>> > areas are skipped.
>> >
>> > Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
>> > Reported-by: Chen Pei <cp0613@linux.alibaba.com>
>> > Closes: https://lore.kernel.org/all/20261026131851.9942-1-cp0613@linux.alibaba.com
>> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> 
>> Thanks for the patch! LGTM for the most part, one minor nitpick below.
>> 
>> > ---
>> >  kernel/liveupdate/kexec_handover.c | 61 ++++++++++++++++++--------------------
>> >  1 file changed, 29 insertions(+), 32 deletions(-)
>> >
>> > diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
>> > index 6f1f55fe31819..f268c57413a7e 100644
>> > --- a/kernel/liveupdate/kexec_handover.c
>> > +++ b/kernel/liveupdate/kexec_handover.c
>> > @@ -820,6 +820,27 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
>> >  	return false;
>> >  }
>> >  
>> > +static int __init kho_reserve_bootmem_area(int *idx, phys_addr_t size,
>> > +					   phys_addr_t end, int nid)
>> > +{
>> > +	phys_addr_t addr;
>> > +	int i = *idx;
>> > +
>> > +	if (!size)
>> > +		return 0;
>> > +
>> > +	addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES, 0, end,
>> > +					nid, true);
>> > +	if (!addr)
>> > +		return -ENOMEM;
>> > +
>> > +	kho_bootmem[i].addr = addr;
>> > +	kho_bootmem[i].size = size;
>> > +	*idx = i + 1;
>> > +
>> > +	return 0;
>> 
>> I reckon it will be cleaner if you update kho_bootmem_cnt here directly.
>> So you directly do:
>> 
>> 	kho_bootmem[kho_bootmem_cnt].addr = addr;
>> 	kho_bootmem[kho_bootmem_cnt].size = size;
>> 	kho_bootmem_cnt++;
>> 
>> You won't have to pass around *idx and you won't need the final
>> kho_bootmem_cnt assignment.
>
> Ack.
>  
>> You might also want to have a kho_bootmem_max_cnt and do some bounds
>> checking here.
>
> Hmm, feels like over protecting. And if future patches will miss it AI will
> yell anyway :)

All right, fair enough.

-- 
Regards,
Pratyush Yadav
