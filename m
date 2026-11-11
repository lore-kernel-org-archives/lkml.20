Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385618;
	b=yuDoJF72oq0J1IxEJRK/WB9HJfIq90Bo2AZ9NvpQzn/RCdhrqDeTon8FJHDvd5lt36vp
	 JMYiF9prp3ddDoKKQY2K7NC0QY02owVoiYrru76p257T/AW7YjcOEyHRUSxQshCe5Avl5
	 zyVe/sdoHraf8WDzwptFWpFlFz2XqXieEmsRwYQdB9ZNWZJB2uf27h7ysAAAHuBuWd8NW
	 D3vKy3nH8+hYb4oHFn4DND1Cbwdj5VRErvqcKmvXAgExhLXoKwtPGEX4+JGJcAosvx5Hg
	 gY5v/IPHMJdMNjzcdZmtEMaq+GXpyYfD3K44EDS4XUaCXtNwV0rFysj0FEuGe9pTFdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385618;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PbZEjgVXvDK8Kgt+gDF1qseEqGMNX5lwx+fvKLN2KlU=;
	b=w/kW7S67H2/9NMKb5u4ljMbicYr/44CT3EUgWDN16aJQR/9Ygim3MCoIa6zY4f2ei+i7
	 slD3Ix92TZH5nsMdwqEXLELfhJVpV3wB0dfoiER6DIkIQTwGt5BsLEdh8OG3f1jmpBrS5
	 pcIPJ2dN95yY/RFWKl2XjWcQj9mzFdHzhfvJJ7NFsSm5+xLSAw9361HJlb5KjbE1FReaD
	 1Qkk22dKtNVvGuu8uWvi7oeeqTyivJ6jU9auFW5XcfzZeUMWAnhpOpmykYrAKsmk6GdI7
	 narBpPjKOkEhW4Dclhfc1zpuOya1DV4zgS+OuBj4n7Nv4J4NRbtgBj4gA1Z7+XJKZnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z2yz/HGR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7CA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2yz/HGR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F221F00A05;
	Wed, 11 Nov 2026 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385617;
	bh=PbZEjgVXvDK8Kgt+gDF1qseEqGMNX5lwx+fvKLN2KlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z2yz/HGRzmYSvQvNgV67yt87aPCx9/zsbsS1SeMWnjmYqjoz6Vlkpxfdp24lOa+2U
	 7y/hdkwhwsxLT47Do3IxTVA95ZRIWFepZdyVHxxaRI3JuipVKrwCI3o3VtQUu+ZKjJ
	 OzGxICDXrhjgVOsKCquA4syGsxF7w0y4MYURwdUg9lPRIA0jHeL505rmrMmQkgQNUN
	 NX/IG7iXkVHF41wjDSUEx1mC8B9vBW22qbSbqeSnFwwXMgbFz1r5Fzo+vZHswXM8dM
	 u1iCw/dqNnqFezdo4efFPrjWaypkyLhGq6msNhZ97Gw+i/PebXHjgpAM6Q6P410K+e
	 QzQgz7RqhEWWg==
Date: Wed, 11 Nov 2026 09:26:51 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Frank van der Linden <fvdl@google.com>,
	Ivy Lopez <skunkolee@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/cma: simplify cma_declare_contiguous_multi()
Message-ID: <avQmyzQZhwRPQJxa@localhost.localdomain>
References: <20261111-cma-multi-v2-1-4e2dddb2a2d8@kernel.org>
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
In-Reply-To: <20261111-cma-multi-v2-1-4e2dddb2a2d8@kernel.org>

On Wed, Nov 11, 2026 at 12:14:40AM +0200, Mike Rapoport (Microsoft) wrote:
> When cma_declare_contiguous_multi() cannot allocate a CMA area as a
> single range, it falls back to collecting a list of up to CMA_MAX_RANGES
> largest free ranges above 4G, reserves them in memblock and adds them to
> cma->ranges.
> 
> The list and subsequently cma->ranges are supposed to be sorted in the
> order of base addresses of the "allocated" ranges.
> 
> This implementation has two bugs:
> 
> * The allocation may fail even when there is enough free memory because
>   list_insert_sorted() sorts the list in the wrong order.
> 
>   When the list is full, the largest range is evicted rather than the
>   smallest, the final list is not sorted by address, and the smallest
>   ranges are used first.
> 
> * the function may report success while it reserved less memory than
>   requested because sizesum accounts for ranges that were skipped.
> 
> And overall it is a lot of list management and open coded range
> selection for no real gain.
> 
> Replace the current code with a loop that finds the largest free range
> above 4G, reserves as much of it as needed and repeats until the entire
> area is reserved or CMA_MAX_RANGES ranges are used.
> 
> After successful alocation sort the cma->ranges by their base address.
> 
> The new code scans free memory once for every range rather than once
> for all ranges, so it is slightly slower, but it is way simpler and more
> robust.
> 
> Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
> Reported-by: Ivy Lopez <skunkolee@gmail.com>
> Closes: https://lore.kernel.org/all/cover.1792032699.git.skunkolee@gmail.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs
