Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC7472F67
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354188; cv=none; b=MFrYNEy1WTQ1K4Ce8dhgKecBYmfsTN2uGXlzba/Jk2oIHI0o7UEMlcLx/SrdPqOLZHVj0klKX9Hin2R+wPH9bzlvLtHnNqW21pBjllBnCBBplRuQWErxbJ5EpS2wVNEFnES9Qvuvp6Fam5rOA4jv5m+kIOU+f11X4jGC9vMQ+mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354188; c=relaxed/simple;
	bh=eKuncRXadHtUXZ6AlotSF+UPNH2nCnaMzqt7skcSilY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qf6RSxWtyyGbo7faSWIFo4+AQnYWvxumXPQwLmBU49AsWHcfwapIZhi4Ft2XmvOXomWuIlDbmfbhINl/BIsarcmMVlPmBhHXq8k3Osu5gIs3SySWVYFxphn387gIojih+Eccc7MhFm/96Ik1csbLo1X0NbDa7ClaiSLuuK8wRew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fhgap0Td; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fhgap0Td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FAA1F000E9;
	Wed,  2 Sep 2026 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354186;
	bh=55piGikadtmJH1rIAu+iSuv/SoXijTMBydHFoHOIF78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fhgap0Tdy96ASi/jfo0oS4aNZPngYqI6TtOna07FCUaWWn+eE8binwwGqEM+9LyQ6
	 JXKT0t7wxQ5+kj+hmV2pt06nXrKDXw+HIgy3FTTMeZLXSyiYt09LRXZmw/HM98+mDc
	 QLTuZdumxNEl5gVqmNMGYuC8ulx41fJ4pqyle3Ajub4W/XZo5uUFv9Z+kHtMRF4E77
	 TOZn4KHK9Gv9hQ4XrFHTxOQT+Na+lTnC2V3yvjYoZNkqUY5CG+JyAyerrk6LZLp5xN
	 fNOlbJQkTI7ekBmEYHJGM4Ex1Y389cGI2hthXggIL6Xg+YyFcThLbsojMR2t0EQFBc
	 wyYAMX1R2oTAQ==
Date: Wed, 2 Sep 2026 14:02:58 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nimrod Oren <noren@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <apgdNQgHw4BW3bPG@gremlin>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260901204449.GK3004@cmpxchg.org>
 <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>
 <20260901220917.GM3004@cmpxchg.org>
 <69C018F5-A1C8-47AD-9567-3497AA6808EC@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69C018F5-A1C8-47AD-9567-3497AA6808EC@nvidia.com>

On Tue, Sep 01, 2026 at 09:49:58PM -0400, Zi Yan wrote:
> On 1 Sep 2026, at 18:09, Johannes Weiner wrote:
>
> > On Tue, Sep 01, 2026 at 05:09:52PM -0400, Zi Yan wrote:
> >> On 1 Sep 2026, at 16:44, Johannes Weiner wrote:
> >>
> >>> On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
> >>>> When THP is enabled, set_recommended_min_free_kbytes() may raise
> >>>> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> >>>> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
> >>>> heuristic to help keep pageblocks free and reduce fragmentation for THP
> >>>> allocations.
> >>>
> >>> We've had problems with compaction before when min_free_kbytes was too
> >>> small on large machines. Competing free space scanners do a lot of
> >>> work only to fight over a very small set of possible target pages.
> >>>
> >>> So I'm a bit uneasy that you didn't include any benchmark numbers with
> >>> this that prove basic functionality on larger hosts isn't regressed.
> >>>
> >>>> The recommendation scales poorly with larger base page sizes. With the
> >>>> default arm64 pageblock sizes, the contribution per eligible zone
> >>>> before applying the existing cap of 5% of low memory is:
> >>>>
> >>>>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
> >>>>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
> >>>>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> >>>
> >>> I question whether pageblocks need to be 512M on those machines to
> >>> begin with. After this patch, you're still asking the page allocator
> >>> to optimize grouping such that 512M pages can be allocated at
> >>> runtime. Only now you took away part of the mechanism to do so.
> >>>
> >>> If you're using 512M THPs, I would kind of assume it's on machines
> >>> with a memory size where 5.5G for defrag purposes isn't devastating.
> >>>
> >>> And if you're not, it would make more sense to lower the pageblock
> >>> size to the mTHP size you're actually using. And that would fix the
> >>> "excessive" min_free_kbytes issue as well.
> >>
> >> But lowering pageblock size requires a kernel compilation. That means
> >> maintaining two sets of kernels for different needs.
> >
> > That depends on whether anyone actually wants 512M pageblocks...
> >
> >> The ultimate solution is to enable better compaction to generate
> >> THPs bigger than a pageblock size, like Rik's super-pageblock
> >> proposal.
> >
> > ...or whether we can say, at that point, use gigablocks/cma+hugetlb.
> >
> > And then the static pageblock size for the fallback logic etc. can be
> > a smaller, saner default for everybody.
> >
> > Because the point you didn't address: it doesn't make really sense to
> > have 512M pageblocks on smaller machines, beyond the min_free_kbytes
> > issue: Fragmentation events will poison half a gig at once,
> > should_try_claim_block() becomes harder which results in less
> > conversions and more allocations falling through to stealing, page
> > isolation is more likely to fail, compaction locks and operates on
> > oversized chunks which is bad for latency and concurrency...
>
> I actually wonder why such a big pageblock would still result in a lot
> of fallbacks. Basically it indicates at some point kernel allocates a
> lot of unmovable pages that use many 512MB pageblocks and the life time
> of these unmovable pages are so diverse, leading to all these pageblocks
> remain unmovable and free pages spread across all these pageblocks. I
> thought bigger pageblocks can keep unmovable pages constrained within
> fewer pageblocks, leaving more contiguous free memory.
>
> Do you mind elaborating more on bigger pageblocks cause bigger issues?
> Maybe it is something more fundamental related to our unmovable page
> management (which almost does not exit)? It seems to me that the large
> pageblock amplifies the issues.
> >
> > Seems to me the excessive min_free_kbytes is just a symptom of a
> > deeper problem.
>
> Yes, our anti-fragmentation mechanism does not work as we expected,
> so that we need an excessive min_free_kbytes to get khugepaged working.
> I wonder why reclaim cannot get the extra free memory instead of
> reserving it via min_free_kbytes. Maybe we need a watermark boost
> when some consecutive THP allocations are seen to achieve similar
> effect of boosting min_free_kbytes?
>
>
> >
> >> After removing automatic min_free_kbytes boosting, user can still
> >> increase it via sysctl to restore the old free memory head room.
> >> It is much easier, right?
> >>
> >>>
> >>>> The automatic min_free_kbytes increase predates proactive compaction
> >>>> and many subsequent changes to compaction. Given those changes,
> >>>> increasing min_free_kbytes for THP by default is no longer clearly
> >>>> justified.
> >>>
> >>> That's pretty handwavy. How would these changes specifically eliminate
> >>> the need for compaction scratch space and allocator fallback options
> >>> to stave off fragmentation during placement?
> >>
> >> Extra free memory is still necessary. min_free_kbytes can be adjusted
> >> at machine boot time to achieve it, right?
> >
> > That argument cuts both ways, no? ;)
>
> Yes, but with current khugepaged code, min_free_kbytes is recalculated
> whenever any of THP, mTHP, and shmem THP enablements is changed. After
> the change, min_free_kbytes is basically a set and forget thing.

Yeah, overall we have gone back-and-forth on the 512 MiB page block thing,
different solutions have been proposed (Nimrod included a list of these in his
initial patches), and each one has not ended up suitable because they all seem
to hack in things that violate the assumptions built into the pageblock mode.

So I see this as a 2-stage thing - firstly eliminate the reservation issue so
people can practically stop having to deal with problems there. The second -
look at pageblocks/compaction more carefully.

And as Zi says, if you need a bigger min_free_kbytes, set a bigger
min_free_kbytes :)

My suggestion here was the 'so dumb it kinda makes sense' approach of - hey if
we want to limit reserve size to X just express it like that, don't play games
with page blocks.

But I like this solution a lot more - as Michal points out, with proactive
compaction and changes in how that code works, it doesn't really make sense for
this 'if THP is enabled set to arbitrary value' stuff.

So I'm absolutely for us just cutting this out now, and that frees people up to
solve the bigger issue underlying this that in an mTHP and ma-hoo-sive PMD size
world, pageblocks == PMD size makes absolutely no sense any longer.

I think Kiryl's upcoming work to make THP no longer treat PMD as the unit of
measure for everything will help, and hopefully if Rik can find a way to put
forward his GiB superpageblock stuff in a way that can be iteratively taken
upstream that could be some way forwards on compaction.

>
>
> Best Regards,
> Yan, Zi

--
Cheers, Lorenzo
