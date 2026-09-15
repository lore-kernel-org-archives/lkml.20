Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006233B7B98
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476748; cv=none; b=BjYFyG6Hd5aIOVA6j7KLpbBKQzu/WyPWERFyIv+Yr7azfXkJW+Haf1u1/lvxXI8io7/T6IlAHF0A+jSOFawU5XUOxsf6VS30aONMiooPATbzy37E4y1wq2C/KR1XjuJ1Myc5eVNs0tYr2+YOjoWehJLIa9oVdO+L/Z+1z5oeSqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476748; c=relaxed/simple;
	bh=WWF/4smeRnfirh4nYNTP9cLXbnNRFoO23Fnip8I7muc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+8exmQjh8c/rtnyOiUXk0L5QF4w32wQqyVfR0tWwoGP2jtYSu87tkpUXd/xLcQvSDz9RRFGTvAggOuLRv4u11hvfFTQjJNMJHQYyl7YROdcTUw+DIzluN+LuqYxmmaE2B5KYpRpaBVgCUAdFAVNrxkm6CAWggo6B9xVNGRk1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W70QDnQs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W70QDnQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8361F000FF;
	Tue, 15 Sep 2026 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789476746;
	bh=xxbZuNqffFNOIdaT0/KALBdxjs/EeQM9S6uRMEGgp/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W70QDnQstn6nkN/6eJiK2L4CeDsYQO7VSfN7e5dtSZ9Ip+oOiS4tiuercU+j1EL0A
	 gF+UjpVEYA1DcaJ4esEkfojNun5QzqHaHSgaqvE4BJkRmC0dsCKiGA3dcfX0NtwulD
	 FIUeb+eHkwdo6ox84GTqw6Bw0FMqiazL/tSZ31KRkXk6TAN3a+rFXIC3gMJHzTz91I
	 duvpOe4F6k2PLkHX2wDNgb9YQc2iR3BpMSeRiWY73IG5FxkzTVFzLoQQdOuaZp9IYC
	 agaxHZ1CCCLbjb3uWuLCJoNfjMOGCvR5qAaOaHtNZOPFSExjrWcuzFpyHUZt0fLjTD
	 NudaPCN+36Vcg==
Date: Tue, 15 Sep 2026 15:52:20 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Liu, Yuan1" <yuan1.liu@intel.com>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Wei Yang <richard.weiyang@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"Zou, Nanhai" <nanhai.zou@intel.com>,
	Chen Zhang <zhangchen.kidd@jd.com>,
	"Zeng, Jason" <jason.zeng@intel.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>,
	"Deng, Pan" <pan.deng@intel.com>,
	"Li, Tianyou" <tianyou.li@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous check
 when changing pfn range
Message-ID: <aqk_hNZCVCyx5Mj_@kernel.org>
References: <20260914072929.1883794-1-yuan1.liu@intel.com>
 <20260914072929.1883794-3-yuan1.liu@intel.com>
 <aqjfyGeQaL4g2EcA@kernel.org>
 <PH7PR11MB69325D48C3419508FFD8B8BEA3BA2@PH7PR11MB6932.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB69325D48C3419508FFD8B8BEA3BA2@PH7PR11MB6932.namprd11.prod.outlook.com>

On Tue, Sep 15, 2026 at 10:40:01AM +0000, Liu, Yuan1 wrote:
> > -----Original Message-----
> > From: Mike Rapoport <rppt@kernel.org>
> > Sent: Tuesday, September 15, 2026 2:04 PM
> > To: Liu, Yuan1 <yuan1.liu@intel.com>
> > Cc: David Hildenbrand <david@kernel.org>; Oscar Salvador
> > <osalvador@suse.de>; Wei Yang <richard.weiyang@gmail.com>; linux-
> > mm@kvack.org; Zou, Nanhai <nanhai.zou@intel.com>; Chen Zhang
> > <zhangchen.kidd@jd.com>; Zeng, Jason <jason.zeng@intel.com>; Chen, Yu C
> > <yu.c.chen@intel.com>; Deng, Pan <pan.deng@intel.com>; Li, Tianyou
> > <tianyou.li@intel.com>; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v9 2/2] mm/memory_hotplug: optimize zone contiguous
> > check when changing pfn range
> > 
> > Hi,
> > 
> > On Mon, Sep 14, 2026 at 03:29:29AM -0400, Yuan Liu wrote:
> > > When move_pfn_range_to_zone() or remove_pfn_range_from_zone() updates a
> > > zone, set_zone_contiguous() rescans the entire zone pageblock-by-
> > pageblock
> > > to rebuild zone->contiguous. For large zones this is a significant cost
> > > during memory hotplug and hot-unplug.
> > >
> > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > index 1533aebafb68..d40a8ff23370 100644
> > > --- a/mm/mm_init.c
> > > +++ b/mm/mm_init.c
> > > @@ -817,22 +817,39 @@ void __meminit init_deferred_page(unsigned long
> > pfn, int nid)
> > >   *   zone/node above the hole except for the trailing pages in the last
> > >   *   section that will be appended to the zone/node below.
> > >   */
> > > -static void __init init_unavailable_range(unsigned long spfn,
> > > -					  unsigned long epfn,
> > > -					  int zone, int node)
> > > +static unsigned long __init init_unavailable_range(unsigned long spfn,
> > > +						   unsigned long epfn,
> > > +						   int zone, int node)
> > >  {
> > > +	unsigned long next_chunk_pfn __maybe_unused = spfn;
> > >  	unsigned long pfn;
> > > -	u64 pgcnt = 0;
> > > +	u64 online_pgcnt = 0, pgcnt = 0;
> > > +	bool is_online = true;
> > >
> > >  	for_each_valid_pfn(pfn, spfn, epfn) {
> > >  		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
> > >  		__SetPageReserved(pfn_to_page(pfn));
> > >  		pgcnt++;
> > > +
> > > +		/*
> > > +		 * With vmemmap, at this stage all pages in an early section
> > > +		 * have a valid memmap and are marked as online. However, only
> > > +		 * subsections in the subsection map are actually online.
> > > +		 */
> > 
> > I'm having trouble parsing this comment. Shouldn't is say that some
> > subsections in a section can be offline because of holes?
> > 
> > Other than that
> > 
> > Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Maybe we could add some more comments here
> /*
>  * With vmemmap, at this stage all pages in an early section
>  * have a valid memmap and are marked as online. However,
>  * subsection-sized holes within a section are offline, only
>  * subsections in the subsection map are actually online.
>  */

I don't see how adding almost identical cryptic comment in another place
helps.
 
> > > +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> > > +		if (pfn >= next_chunk_pfn) {
> > > +			is_online = pfn_section_valid(__pfn_to_section(pfn),
> > pfn);
> > > +			next_chunk_pfn = min(SUBSECTION_ALIGN_UP(pfn + 1),
> > epfn);
> > > +		}
> > > +#endif
> > > +		if (is_online)
> > > +			online_pgcnt++;
> > >  	}
> > >
> > >  	if (pgcnt)
> > >  		pr_info("On node %d, zone %s: %lld pages in unavailable
> > ranges\n",
> > >  			node, zone_names[zone], pgcnt);
> > > +	return online_pgcnt;
> > >  }
> > >
> > >  /*
> > 
> > --
> > Sincerely yours,
> > Mike.

-- 
Sincerely yours,
Mike.
