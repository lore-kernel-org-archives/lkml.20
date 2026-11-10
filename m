Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298240;
	b=Q7JOfvjKdV/moPvuh8WL6txRuAek/iKccjow75ck1MfO6BU2VJ9MAnOVvQLTvvC9h19N
	 aEpC0HbhHZzWBCe8BvnhJHUbfFIn8JE+NCMOqc69lRgTLJhIZty3iVc6aEROWLOUzdgX5
	 dyT2mX8aM/xD3VI+OyjzqMytaJMCay1/kEQk3h7TlnHbC5udqtWcBCSxHnSow6h2aRUP3
	 jZ1GWMFvFYp2vYl014Sz+8Kvp/pAT1UdNR0u2WjzLSru1X4J/eRs2hotNw1MAENSSVshV
	 Wfyeeoovz8SSxBzTRYL084M6/hE1IHwCZlv4YDxDMSef27+ojQ+O07CmWu0gsMkQ5YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298240;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ui3CpIlEJ97q+nx0KroTiGNw6xa+MjE5Cl5DE9+vJM8=;
	b=h24hHU8/aAtu7RmcvAhfUHnTmpCV1OsNN/KgvGnXuXdzH8UF9SeJ0u0Zh3GRbtK89A8d
	 kU7OEL+s10pqaruX4nT7HBizWvypyTlXVfNN63GqqVVAd846XSkVudfa+77JzsZHWQ7Hl
	 SR4zKUs/mSbUFcwGx6xAtTM0eZKGqkk1tXxxziGRnvUmPcU1IGVS0CAnEDe8muvasfR5M
	 72qM6kb5G/09DvEc0oCEWADZhjvcMNMnx5xNC9gG2tARGU6LyCCgHftg3kHaTL1/qhOad
	 SrmYPuZK+MZ2NBVu/xaE2nyVQ8n1CA6C+rnYN9UedLIR6eNpDWOeu3NsM4eDy7Glwgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxFnCQ1v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E10D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxFnCQ1v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BAC1F0089F;
	Tue, 10 Nov 2026 08:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298240;
	bh=ui3CpIlEJ97q+nx0KroTiGNw6xa+MjE5Cl5DE9+vJM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bxFnCQ1vPDFtFhBtQXiw1XsFAyyZg6NDQfzLHIRS/5b13h5u4kxxfAjjPkKbKvBe2
	 jhlpGMLgkSD9sxDvSMWVG4LyQEueUBCf1S8+y03mKbbkRPIT9aaYtnyG4LMZGTaqZH
	 ZbIy4osRecG4YG+xtlQgRFUZYnhFVS4oc8s2lJ3ps7+ywH2RhrsgHy1ox6TrXOVZWN
	 K1iZSFF5NdfNaC0ngnKtFtrzC7ZCEet1bpagm3ORVeAPera5uPloH3yhsY4MrTlBEx
	 vZ/nvI32EiOiBtPEzh3d7FrmhSARS93F/rMbBvOffiE4/oCTeL/2PLtvbBLzPaBdJr
	 NrvGVJnjSPnYA==
Date: Tue, 10 Nov 2026 10:10:33 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ivy Lopez <skunkolee@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/cma: simplify cma_declare_contiguous_multi()
Message-ID: <avLReYfv2iMARmk2@kernel.org>
References: <20261106-cma-multi-v1-1-054eae6e2c1c@kernel.org>
 <4acf6df8-8cdf-4f71-830d-9233db151b2a@kernel.org>
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
In-Reply-To: <4acf6df8-8cdf-4f71-830d-9233db151b2a@kernel.org>

On Mon, Nov 09, 2026 at 09:56:20PM +0100, David Hildenbrand (Arm) wrote:
> On 11/6/26 13:56, Mike Rapoport (Microsoft) wrote:
> > When cma_declare_contiguous_multi() cannot allocate a CMA area as a
> > single range, it falls back to collecting a list of up to CMA_MAX_RANGES
> > largest free ranges above 4G, reserves them in memblock and adds them to
> > cma->ranges.
> > 
> > The list and subsequently cma->ranges are supposed to be sorted in the
> > order of base addresses of the "allocated" ranges.
> > 
> > This implementation has two bugs:
> > 
> > * The allocation may fail even when there is enough free memory because
> >   list_insert_sorted() sorts the list in the wrong order.
> > 
> >   When the list is full, the largest range is evicted rather than the
> >   smallest, the final list is not sorted by address, and the smallest
> >   ranges are used first.
> > 
> > * the function may report success while it reserved less memory than
> >   requested because sizesum accounts for ranges that were skipped.
> > 
> > And overall it is a lot of list management and open coded range
> > selection for no real gain.
> > 
> > Replace the current code with a loop that finds the largest free range
> > above 4G, reserves as much of it as needed and repeats until the entire
> > area is reserved or CMA_MAX_RANGES ranges are used.
> > 
> > After successful alocation sort the cma->ranges by their base address.
> > 
> > The new code scans free memory once for every range rather than once
> > for all ranges, so it is slightly slower, but it is way simpler and more
> > robust.
> > 
> > Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
> > Reported-by: Ivy Lopez <skunkolee@gmail.com>
> > Closes: https://lore.kernel.org/all/cover.1792032699.git.skunkolee@gmail.com
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> 
> [...]
> 
> 
> Quite the simplification :)
> 
> >  int __init cma_declare_contiguous_multi(phys_addr_t total_size,
> >  			phys_addr_t align, unsigned int order_per_bit,
> >  			const char *name, struct cma **res_cma, int nid)
> >  {
> > -	phys_addr_t start = 0, end;
> > -	phys_addr_t size, sizesum, sizeleft;
> > -	struct cma_init_memrange *mrp, *mlp, *failed;
> > +	unsigned long size_mb = (unsigned long)total_size / SZ_1M;
> 
> Nit: could be const.

Ack.
 
> > +	phys_addr_t size, remaining, size_align;
> >  	struct cma_memrange *cmrp;
> > -	LIST_HEAD(ranges);
> > -	LIST_HEAD(final_ranges);
> > -	struct list_head *mp, *next;
> > -	int ret, nr = 1;
> > -	u64 i;
> > +	phys_addr_t start = 0;
> >  	struct cma *cma;
> > +	int nr = 0;
> > +	int ret;
> >  
> >  	/*
> >  	 * First, try it the normal way, producing just one range.
> >  	 */
> >  	ret = __cma_declare_contiguous_nid(&start, total_size, 0, align,
> >  			order_per_bit, false, name, res_cma, nid);
> > +	if (!ret) {
> > +		pr_info("Reserved %lu MiB at %pa\n", size_mb, &start);
> > +		return 0;
> > +	}
> >  	if (ret != -ENOMEM)
> > -		goto out;
> > +		goto err;
> >  
> >  	/*
> >  	 * Couldn't find one range that fits our needs, so try multiple
> > @@ -572,151 +556,56 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
> >  	 * aligned to @align, and a size that is aligned to
> >  	 * both @align and @order_to_bit, things will work out.
> >  	 */
> > -	nr = 0;
> > -	sizesum = 0;
> > -	failed = NULL;
> > -
> >  	ret = cma_new_area(name, total_size, order_per_bit, &cma);
> > -	if (ret != 0)
> > -		goto out;
> > +	if (ret)
> > +		goto err;
> >  
> >  	align = max_t(phys_addr_t, align, CMA_MIN_ALIGNMENT_BYTES);
> > -	/*
> > -	 * Create a list of ranges above 4G, largest range first.
> > -	 */
> > -	for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &start, &end, NULL) {
> > -		if (upper_32_bits(start) == 0)
> > -			continue;
> > -
> > -		start = ALIGN(start, align);
> > -		if (start >= end)
> > -			continue;
> > -
> > -		end = ALIGN_DOWN(end, align);
> > -		if (end <= start)
> > -			continue;
> > +	size_align = max_t(phys_addr_t, align, PAGE_SIZE << order_per_bit);
> >  
> > -		size = end - start;
> > -		size = ALIGN_DOWN(size, (PAGE_SIZE << order_per_bit));
> > +	remaining = total_size;
> > +	while (remaining && nr < CMA_MAX_RANGES) {
> > +		size = cma_find_free_range(align, size_align, nid, &start);
> 
> That's more a memblock helper than a cma helper :)

I'd keep it here in order not to encourage broader use :)
 
> [...]
> 
> > +	/* allocate from lower addresses first */
> > +	sort(cma->ranges, nr, sizeof(cma->ranges[0]), cma_range_cmp, NULL);
> 
> That's nice.
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks! 
 
> -- 
> Cheers,
> 
> David

-- 
Sincerely yours,
Mike.
