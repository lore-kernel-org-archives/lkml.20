Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3550C2A6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540376; cv=none; b=eV0xJg2pqkHNeSsHz7aewQSg1LdXoLV/CcUaPue7FjkxF/UDwuj0DeA3DVoEtEQx1UXqsz+TRopWhdhqT6azzf5DH3vJLOX2MTLOeoc1J75KQaIfWirpyNyD34cF3HzU6rbHgeyibcQKIP7VhAzIFabro2NQ0nhWf0tfJtGdUhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540376; c=relaxed/simple;
	bh=v5G9Orq7Gqi1P9DORs3zAuCa0G/NfP+hpX6AKkTpb6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xsv9bwodTAvqVF/kfOmuEvebwZBRwJMS6FQuVgPKtxFwo4nnohLryRdYTjKO6GOADk4Io/7P+sjw7KCFG7s4hoNg2f5lB5sfew0jF1banxPQxu8NWFJj16/lJ5eZOySMS3q2gFlM1VmEJpezYckNLW1IcTyG8UuX0Q/dn7wH4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcKHemWz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcKHemWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593FC1F00A3E;
	Fri,  4 Sep 2026 16:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788540373;
	bh=maBinTpgEptRAadbtAeA4Cful7CwIKDPrQsFPR09ghw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QcKHemWzOADUSWpVHigDqdv+C7oRjcVLvRNYL5g4HItAUbk+WUoLjWgsytshoBjig
	 GqwM8XZWmQad9GKDYRlzSXarRQ/7QkXbH19qEkwbRYxc1rwC8HmDr9MH2LjI1uKmTk
	 UTvKNLWoNE+Y1O48PcN5P7TMdilhIkPsfqmUQRSJ86+sKlLQn2RszsGQKEKLDvUVJT
	 pKbzx+ZDbJci7y59/5qa7Jho5MYd6kOey+1sCoTt9mk1LAXtXD0EzDeeD2JDh7sdAX
	 NTe7RoGbwpq1LEq8ogSHtkLdIYCMLKSCkqyQg92+7xzI4FmoaXPBm5ws0vyHhYh9fu
	 GMPx2vDK/ROqA==
Date: Fri, 4 Sep 2026 17:46:05 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nimrod Oren <noren@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <aprtAqgJyS-gJ77Q@gremlin>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260902162323.GO3004@cmpxchg.org>
 <aphS2TancJAZLND7@gremlin>
 <20260902183752.GP3004@cmpxchg.org>
 <aplzo5Jsb6f1MdaM@gremlin>
 <20260904154346.GB6641@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904154346.GB6641@cmpxchg.org>

On Fri, Sep 04, 2026 at 11:43:46AM -0400, Johannes Weiner wrote:
> On Thu, Sep 03, 2026 at 04:46:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Looking over the sub-thread (correct me if I'm wrong) the issues seem to be:
> >
> > - 512 MB pageblocks become unmoveable quicker than expected
> >
> > - When trying to convert a pageblock in try_to_claim_block() 256 MiB is required
> >   to be of the desired migratetype, and this is difficult to achieve vs. 1 MiB
> >   (yes clearly :)
> >
> > - AI training checkpointing was a problematic workload - big latency spikes and
> >   timeouts. Tonnes of unmoveable memory, order-0 allocations falling back to
> >   MIGRATE_MOVABLE (ugh), exhibiting try_to_claim_block() symptoms above.
> >
> > I hear all of this, and to be clear - this kind of real-world data, at scale, is
> > the kind of thing we should base decisions on more than anything else.
> >
> > Reality > theory every time (and the more you look into the kernel you more you
> > realise it's a tower of heuristics anyway, especially in classical reclaim :)
> >
> > I guess what you're trying to say here is the only way in these circumstances to
> > make headway would be to have more memory reserved.
> >
> > But is that the right conclusion? Aren't you still screwed once those reserves
> > are chomped up?
> >
> > Or are you saying the increased watermark levels gets you effective
> > kcompactd/kswapd sooner?
>
> +1 Exactly! The watermarks sit on top of that reserve. Both background
> reclaim and direct reclaim are thresholded such that there are always
> a few pageblocks worth of free space for the allocator to choose from,
> thus reducing the risk of fallbacks and block poisoning.

Right.

>
> > The TL;DR for me is - you have a workload that's broken already with larger
> > pageblock size - maybe you could test that with/without this patch and see if it
> > really does help?
> >
> > Anyway it seems to me all of this is essentially a (valid!) critique of
> > assumptions backed into the page allocator code.
>
> This part I don't quite follow. Why is the page allocator doing
> anything wrong here?

In this bit of the email we were talking about a function that lives in
page_alloc.c :)

>
> You tell it your largest routine allocation size. It groups smaller
> allocations by their ability to move into buckets of this size,
> coordinates a headroom of buckets for non-violating placements, and
> ensures reclaim kicks in when that headroom depletes.

Yup, but as discussed if something straddles the buckets it's useless (it can
only make guarantees about the buckets themselves), the target everything has in
mind is PMD (since we are bumping the reserves for THP explicitly), and
alignment/size requirements make smaller sizing useless for mTHP.

>
> You're giving it a very large bucket size and are not happy with the
> headroom that commands.

Yup.

>
> [ I'll reply to the other points in your email later. ]

--
Cheers, Lorenzo
