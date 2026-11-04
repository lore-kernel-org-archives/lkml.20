Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806338;
	b=5b4+ZMc2cJghKi+QW69h2W3YFLUW/BdqoEWxiQcrhobyqmf4t1JQfpe2muOCR9JfRLvE
	 LE7GRF7tkZ0gbF2WPfP6irRWzr5z/dBCD+DPR39E1jmShcXuwRjtc/Sjjz3hGJSbGdh5x
	 58p2Zv0XSZq78YOC2KjfJQ6XZL/Xfkwmpn3d75kdr3i7BgzZXPZzZ5Hl7flxRV9QLLnSd
	 L/y0x6gg23p7MbNwL1FXX+i2rJAsCcFa7FDxwJUXt/CoEIu9eRs0q6RQudKjfhA0WBVSW
	 QF7nNSsiD4fRdCqgV0MX/d/gyzGGbhG3EbcTqxeOR9pEWUk0XMO0bjLV3H9O54PDyug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RsAyHrXNfqX02yWykA3lATIbdnc5zjm5tP62HlWexE4=;
	b=wNEOp6Th6wp6VQ3D1DysJRHAnQTZwLwfruzSWx5UqNRFDF4rCk51f84vtI+oy3RRIdhN
	 SvWCHFAr/+DebnLzL2cDlJvswsqEYpJn+79raeRxycMtYEZ4yg8AOC0MR7GgF71GQuv0o
	 ZlwrBqSFAnuogsAel+OScpqBGCwwqwZ9AY9Ot3C0CMgvf0Z9bIs1Idp2G3OROd96uhawG
	 plHpKxnr0oNNSeSUmOkT/c3F38I8x7prCdX8HFD/4EQ31ygpOXsyaPOGFzCwpkqlwCTIy
	 xqYpopaLo5X8NHn49T83oK5cbTeb6Od0xTcTAX9k71YgY4n8djslTR9Je8BjYnG6Tmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XdxsdlM0;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B4606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB5B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XdxsdlM0
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc91ddf447so256204137.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793806337; x=1794411137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RsAyHrXNfqX02yWykA3lATIbdnc5zjm5tP62HlWexE4=;
        b=XdxsdlM06m3uGABbDeUXYTHem9YVhYsCw3OUFWgItFKoUkP1JD8Gf8c7KFiUlOVldU
         ybF2dGi9vR/ziniU4pNwFlTaSERVMBp2Rh/LUOPSBUVyJXypH7L7OF9NmMBpzE4/aXdi
         uCGQbmNoqMM6Y4vMcqTHRkycxLHsUr8l1hiqiBxw16nTgQKEWSzwQzIzYjJD8Dq/3KCf
         BFRzRzSGaPyyoimz5FREvefh9s9mNqaNwIqTz70+yMed8SyGIg+iFvP78c7Egva8YIk9
         4CWKWIPkcAxbBV9QSZdWKS2L8uWXDaSZ6Od3PK2Gu0JpRWJs4+Rb9+6VjaW7ohLQNZve
         UJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806337; x=1794411137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsAyHrXNfqX02yWykA3lATIbdnc5zjm5tP62HlWexE4=;
        b=FKagQWE2f2Rx1UhJfP3S/61WER8ifXFAN2LihnBH3cMor0Oq7PuXkrYF4QhFR136dl
         Koqig+9XEsHatsk045wQp9oovgEFGFO+9zy/J8o0E0z2N0iA+tzQpAYKd/eGVDbpS45/
         TYTPSYGt7ivJUIfEnwcWAkCvn+M2gMQLyv9mvYV5czSx6UvWH5ou3DmUIK1uPg3+SiUe
         W965Sp4V7Wna1PnUPKSPtBiJBwVsP88u7f9zmVybmA4kfvjBWnfuksZjdYNIde0VfZa3
         x5HxKyCvubv5g6TiQYmZ/+Zbw/3q6N8yKgYoptPydqj4DImUTHJDYx0TwkVi/b0RvpIN
         GraQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIc9ddBgk++P8qE3PH3KN0WD067N+qBdDSMo5fekIzp+UExjU4nb51EJeO/zaEbMFYsmWI/T4Ji1PeZtI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m/ftSwCQqD21JiIfM2vtD0+PVGZGsvcX6XGNkQxFiNH7s0GoK
	NXK+M6GoAfhifW0K7L/t3Q8OzUK7JyjHKepxqiFvX3OJfh9Sf4+duaB9woI+Hk/JjFk=
X-Gm-Gg: AYBFou2fDyxl+K5WovWfBd/mLIfIOn6wk0yc0v2DGI47gyVfCu09wm1vzTH2ShpM4+G
	YEQV2QZ6hp95BiWmkpTtCqwdCeRjKmE/M9wyE7e7gcTlM930iKwE2qp14lECeP6TqSuP6YJE3kJ
	B5ijj5kNzjIZszRhEasrWhmhuGyWfPACuBshuFJ+BKPMOXcuIFpbI+v2QzT5jaGc9fxLkumuUJ4
	ndGzztY65CF4EqSVRxyfPhgcXiP6uMZXuezBfpgyw//ILFng4Yz6qw2glYU0WE4wO4RqVkY2R9a
	AYhjdi7jl1Q4c2UZYPn5NxgrKk0I91fkqL36K6HmJGJLYAP4AtKV5g4CRM17F0Fw7e8W37DOgGo
	Lg1RgeYo1miySRiCbRof+AXnpY7yx/aDmi4AnTmEeryhw9/uXlN6gabQBittchl5fqvPihXgdTg
	XBOBUtJTgXVXFld0r99+dLUc15BqLtkGRxp9PJQvWG6rOmIKRYXdhxzixuuF4fragxoM8D3RrzO
	dn8xc4kKzxqOBgArItnruOt0zSOy1ti+9NfSn0BDdvQczcHmZwKa/Jtxcn7YWrtl93OB9FJFTgo
	/fYFkGjzHpfy6mTHBRkfHKnT9M2Y5EHX0TNncIOx4v4pWFrNNnW6BDRXsxb36c9Mcx6RTeO44Bu
	aKy9Ae0KXRXH30b7uGxN0LDGIa/j70vU=
X-Received: by 2002:a05:6102:e0d:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7d072784174mr5342781137.30.1793806336602;
        Wed, 04 Nov 2026 07:32:16 -0800 (PST)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2770ffbb4sm1208724137.0.2026.11.04.07.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:32:15 -0800 (PST)
Date: Wed, 4 Nov 2026 10:32:14 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chen Pei <cp0613@linux.alibaba.com>, 
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 1/2] kho: skip zero-sized lowmem and global bootmem areas
Message-ID: <autM3_pSLuOGZQCh@google.com>
References: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
 <20261103-kho-bootmem-sizing-v1-1-45aa74098f34@kernel.org>
 <auo3PzmisfK3br1l@google.com>
 <ausVbqZd9qgZf4zc@kernel.org>
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
In-Reply-To: <ausVbqZd9qgZf4zc@kernel.org>

On 11-04 13:22, Mike Rapoport wrote:
> On Tue, Nov 03, 2026 at 02:48:36PM -0500, Pasha Tatashin wrote:
> > On 11-03 13:49, Mike Rapoport (Microsoft) wrote:
> > > The lowmem and the global bootmem areas can have zero size, for example
> > > when none or all of the memory is below ARCH_LOW_ADDRESS_LIMIT, or when
> > > either of those areas is explicitly set to zero with kho_bootmem=.
> > > 
> > > For a zero-sized allocation memblock returns an address without reserving
> > > anything, and that empty area is recorded in kho_bootmem. If there is no
> > > memory below ARCH_LOW_ADDRESS_LIMIT, allocation of the empty lowmem area
> > > fails and KHO gets disabled.
> > > 
> > > Extract a helper that checks for zero size and allocates memory from
> > > memblock, and use it to skip empty areas the same way as empty per-node
> > > areas are skipped.
> > > 
> > > Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> > > Reported-by: Chen Pei <cp0613@linux.alibaba.com>
> > > Closes: https://lore.kernel.org/all/20261026131851.9942-1-cp0613@linux.alibaba.com
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > >  kernel/liveupdate/kexec_handover.c | 61 ++++++++++++++++++--------------------
> > >  1 file changed, 29 insertions(+), 32 deletions(-)
> > > 
> > > diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> > > index 6f1f55fe31819..f268c57413a7e 100644
> > > --- a/kernel/liveupdate/kexec_handover.c
> > > +++ b/kernel/liveupdate/kexec_handover.c
> > > @@ -820,6 +820,27 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
> > >  	return false;
> > >  }
> > >  
> > > +static int __init kho_reserve_bootmem_area(int *idx, phys_addr_t size,
> > > +					   phys_addr_t end, int nid)
> > > +{
> > > +	phys_addr_t addr;
> > > +	int i = *idx;
> > > +
> > > +	if (!size)
> > > +		return 0;
> > > +
> > > +	addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES, 0, end,
> > > +					nid, true);
> > > +	if (!addr)
> > > +		return -ENOMEM;
> > > +
> > > +	kho_bootmem[i].addr = addr;
> > > +	kho_bootmem[i].size = size;
> > > +	*idx = i + 1;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * kho_reserve_bootmem - Reserve a contiguous chunk of memory for kexec
> > >   *
> > > @@ -832,7 +853,7 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
> > >  static void __init kho_reserve_bootmem(void)
> > >  {
> > >  	int nid, i = 0, max_nr_bootmem;
> > > -	phys_addr_t addr, size;
> > > +	phys_addr_t size;
> > >  
> > >  	if (!kho_enable)
> > >  		return;
> > > @@ -852,56 +873,32 @@ static void __init kho_reserve_bootmem(void)
> > >  	 * reserve bootmem area in low memory for lowmem allocations in the
> > >  	 * next kernel
> > >  	 */
> > > -	size = bootmem_size_lowmem;
> > > -	addr = memblock_phys_alloc_range(size, BOOTMEM_ALIGNMENT_BYTES, 0,
> > > -					 ARCH_LOW_ADDRESS_LIMIT);
> > > -	if (!addr) {
> > > +	if (kho_reserve_bootmem_area(&i, bootmem_size_lowmem,
> > > +				     ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NODE)) {
> > >  		pr_err("Failed to reserve lowmem bootmem\n");
> > 
> > You are adding a helper that returns an error code and then ignoring it 
> > at all call sites. Even though it can only return -ENOMEM right now, 
> > dropping the return value is not good practice.
> 
> I don't think error code is important here.

Perhaps, but it is just not elegant to add a function that returns an 
error, call that function from three places, and ignore that error every 
time.

What is wrong with:

err = kho_reserve_bootmem_area(...);
if (err) {
        pr_err("Failed to reserve lowmem bootmem: %pe\n", ERR_PTR(err));
        ...
}

> Even if some theoretical future update will change
> kho_reserve_bootmem_area() to return anything but -ENOMEM I don't see why
> the error code should be printed at all.
> 
> And anyway, that would be the part of that change.

I just don't see why not do it right away? If the function is only used 
as a boolean check, then just make it return a bool, and move prints 
inside.

In any case, this is not critical and I am not insisting on the change, 
but I think it would look better.

> 
> -- 
> Sincerely yours,
> Mike.

-- 
Pasha
