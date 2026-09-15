Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C1D4CDA05
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498696; cv=none; b=V4ZUKCxze2/pp+qo1QuGoPeBKyp0gVh86s7fSGEnEG84Tq9S42b/NpNhpDL0Fr7OWZSfPheXI3U6Vhw3CeiH4cwZPZMoH3hm8mUa7z69LpDw6Y07b60vSaEMnEWMyJlCvl+SdGVx3weAkLNAqskSSNC23lAyjHrMtk4lwmmwzh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498696; c=relaxed/simple;
	bh=ggFtn17Kn6HgbRqAG6lgqwXgCsMMljQQWGGdAz3amsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYTMqWnBzZXCrDi2Xg59CPD/BrqMuz194ZMKJJ2bCpE0qoJzgpSNvQF6eALyyRsIT/fuhWFZTe32EvL1EB5opdRwLiWjcaw4a8LALphlVf33Dl9qj+KjkyOWabqxbLPTKKtmgV5VokiOliBV+EfKQwanTaE3eQ0dwFAvEIyJg9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ornEdJdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ornEdJdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234D91F00893;
	Tue, 15 Sep 2026 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789498695;
	bh=Adg+vPcTbfUMZ5IHqpKKaV5rPbxcS72fk9/u/WIjV+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ornEdJdU8li9pKZm5oIcW34Sa3zgmaht11Pxh4V83dj4oKcMfWo2Lql5P+A2DWj8e
	 qOYi8Dtg0RegxaXf46okYjSogAmttCzdkLZGpfiye2rJjA5o6QwY4G2Ul+EBAerLLE
	 AEu29/8P8nYXyn0vqC3FYMXnmPz1OfFBZQHB/HvOJONuZ5fcNq+Y1UTygQoZqvS2E1
	 DmaLXpZ/FjsI2I9dtGyFBWVD4fICo7rV1wHN5VfMgU7zDfBBDN26t2G05H7CjfYwcC
	 lXhoenDemhuneOwVhqhWq173RLTPCii/r1i8Zf86PjVb5m50R/paf+vey5FYgFWW8O
	 bbiDbDkkACiRQ==
Date: Tue, 15 Sep 2026 21:58:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yuan Liu <yuan1.liu@intel.com>, Oscar Salvador <osalvador@suse.de>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	Nanhai Zou <nanhai.zou@intel.com>,
	Chen Zhang <zhangchen.kidd@jd.com>,
	Jason Zeng <jason.zeng@intel.com>, Chen Yu <yu.c.chen@intel.com>,
	Pan Deng <pan.deng@intel.com>, Tianyou Li <tianyou.li@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous check
 when changing pfn range
Message-ID: <aqmVQeETYhbsl79A@kernel.org>
References: <20260914072929.1883794-1-yuan1.liu@intel.com>
 <20260914072929.1883794-3-yuan1.liu@intel.com>
 <aqjfyGeQaL4g2EcA@kernel.org>
 <209de483-a9a5-4d98-bda4-7998e8fdc7da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <209de483-a9a5-4d98-bda4-7998e8fdc7da@kernel.org>

On Tue, Sep 15, 2026 at 05:20:07PM +0200, David Hildenbrand (Arm) wrote:
> On 9/15/26 08:03, Mike Rapoport wrote:
> > Hi,
> > 
> > On Mon, Sep 14, 2026 at 03:29:29AM -0400, Yuan Liu wrote:
> >> When move_pfn_range_to_zone() or remove_pfn_range_from_zone() updates a
> >> zone, set_zone_contiguous() rescans the entire zone pageblock-by-pageblock
> >> to rebuild zone->contiguous. For large zones this is a significant cost
> >> during memory hotplug and hot-unplug.
> >>
> >> diff --git a/mm/mm_init.c b/mm/mm_init.c
> >> index 1533aebafb68..d40a8ff23370 100644
> >> --- a/mm/mm_init.c
> >> +++ b/mm/mm_init.c
> >> @@ -817,22 +817,39 @@ void __meminit init_deferred_page(unsigned long pfn, int nid)
> >>   *   zone/node above the hole except for the trailing pages in the last
> >>   *   section that will be appended to the zone/node below.
> >>   */
> >> -static void __init init_unavailable_range(unsigned long spfn,
> >> -					  unsigned long epfn,
> >> -					  int zone, int node)
> >> +static unsigned long __init init_unavailable_range(unsigned long spfn,
> >> +						   unsigned long epfn,
> >> +						   int zone, int node)
> >>  {
> >> +	unsigned long next_chunk_pfn __maybe_unused = spfn;
> >>  	unsigned long pfn;
> >> -	u64 pgcnt = 0;
> >> +	u64 online_pgcnt = 0, pgcnt = 0;
> >> +	bool is_online = true;
> >>  
> >>  	for_each_valid_pfn(pfn, spfn, epfn) {
> >>  		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
> >>  		__SetPageReserved(pfn_to_page(pfn));
> >>  		pgcnt++;
> >> +
> >> +		/*
> >> +		 * With vmemmap, at this stage all pages in an early section
> >> +		 * have a valid memmap and are marked as online. However, only
> >> +		 * subsections in the subsection map are actually online.
> >> +		 */
> > 
> > I'm having trouble parsing this comment. Shouldn't is say that some
> > subsections in a section can be offline because of holes?
> 
> 
> Maybe extending that a bit we could do
> 
> "With CONFIG_SPARSEMEM_VMEMMAP, early sections have a valid memmap for all PFNs
> and the sections are marked online. However, we might have offline subsections
> in such early sections, indicated by the subsection map. While we must
> initialize the entire valid memmap, account only the online pages according to
> the subsection map as online (see pfn_to_online_page())."
 
init_unavailable_range() already has large comment on top, adding something
like that there makes perfect sense to me :) 

How about a bit different version:

 * The function counts pages that should be added to
 * zone->pages_with_online_memmap.
 * With CONFIG_SPARSEMEM_VMEMMAP there could be offline subsections even though
 * the entire memory map is valid and all the early sections are online.
 * Count only pages in online subsections (see pfn_to_online_page()).
 
> -- 
> Cheers,
> 
> David

-- 
Sincerely yours,
Mike.
