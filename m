Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2663B4EB6;
	Mon, 31 Aug 2026 16:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192024; cv=none; b=WZXNuNqnFMD9+BwNZx056fwDXHhOj8pXSaojhsgWahzNiLlom8QGb7qQYa/28Mj10HGF4ybeOgzf5MiAJq6xFTBUcs/XqKTEbcVujJg+T9FAiRGQIjZ/GXJxmh0DV8ZThmdTQn5nWWV/nqd9O5AbZLeTdHmWOjjkMcMLcxM07ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192024; c=relaxed/simple;
	bh=5g4IinDc0fgqtT/0LG/A2c25GrbLJW0Vq6YiVnRksHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDVYpbX5CBX2wHSWzzvLYZSR2YkhEzC9dC1/kCIwYv1erOhsOatzBO4kgYnIfe81FkS1n/z2pbZ42+gDjeygmlQhi1EJfGb4qdIePXgWkJoz2ecNSQjBL0Bad7N5Sl1Nj/RGGkQe39fXx4oxEY2Q4FJOdujTbb4hB+34dgcYJLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMmNyu28; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMmNyu28"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E921F000E9;
	Mon, 31 Aug 2026 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192022;
	bh=Ih88Ia/0BJN7Fm8iuou5qyhg3UJj/ugsQclFFOXLskw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iMmNyu284Cp1Ib61oBSDyZMXrSkHCwtuFZ2rKSHGECKvjm9amQ3YOVBb9ZHt5hUYm
	 p1F+g83rzca5F0Z5226WuIm0RrG9DufzQi//ktx3NzDT/hTE/TXknTqvTkXPSl2oh6
	 cKJHkB2IfckZQuiVHIViVlNtQ69HfbfUDPJYwVPbP/VfV5at2BIHWiI9OqAlA0n/NU
	 CoD40eMyda2Fsb7zZW5+LD/SS7GjXAEum6q6ZNnbelP8A01Kc6M3K6PHaCWnuNSIIw
	 Uv8I6Uf89hpv6uAVlYy9a+NIaw4U1xbrScrb498A9DJifghBlXryoxX/VDjmrwxHeF
	 gj1GROWBmNRBw==
Date: Mon, 31 Aug 2026 16:59:59 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Michal Hocko <mhocko@suse.com>, Nimrod Oren <noren@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Nirmoy Das <nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at
 1 GiB
Message-ID: <apWk0GYdNuPcE6zw@lucifer>
References: <20260831075635.2244437-1-noren@nvidia.com>
 <apVHXmSljK8HrIuA@tiehlicka>
 <apVKf8FgTG-l2EU_@gremlin>
 <784BE9B6-F891-4DFE-A4C5-D1986CE0F242@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <784BE9B6-F891-4DFE-A4C5-D1986CE0F242@nvidia.com>

On Mon, Aug 31, 2026 at 11:00:13AM -0400, Zi Yan wrote:
> On 31 Aug 2026, at 5:34, Lorenzo Stoakes (ARM) wrote:
>
> > On Mon, Aug 31, 2026 at 11:20:30AM +0200, Michal Hocko wrote:
> >> On Mon 31-08-26 10:56:35, Nimrod Oren wrote:
> >>> When THP is enabled, set_recommended_min_free_kbytes() may raise
> >>> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> >>> With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
> >>> pageblocks for every eligible populated zone before capping the result
> >>> at 5% of low memory.
> >>>
> >>> This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
> >>> configurations, but scales poorly with larger base page sizes. With
> >>> the default arm64 pageblock sizes, the contribution per eligible zone
> >>> before the 5% cap is:
> >>>
> >>>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
> >>>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
> >>>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> >>>
> >>> Consequently, min_free_kbytes can reach excessive and unwanted levels.
> >>>
> >>> Add an absolute 1 GiB cap to the recommendation, in addition to the
> >>> existing percentage cap. This bounds the automatic recommendation to a
> >>> sane value on systems with large pageblocks while preserving existing
> >>> behavior for typical systems with 2 MiB pageblocks.
> >>
> >> I would argue that the whole model of increasing min_free_kbytes for THP
> >> is wrong. This will trigger memory reclaim sooner and make the THP
> >> availability more likely but this was at times where we didn't have
> >> pro-active compaction and many changes in the compaction. So is this
> >> actually needed in general resp. only large pageblocks systems?
> >
> > Ohh even better :)
> >
> > I did find it strange that we increased accordingly.
> >
> > I'm more than happy to see this just die altogether if people agree that's
> > a sensible way forward...
>
> It sounds reasonable to me.
>
> My first reaction was that THP generation might be hurt due to fewer
> free pages. But probably the extra min_free_kbytes just moves reclaim earlier,
> like Michal said.
>
> After removing this automatic min_free_kbytes bump, user can retain the old
> behavior by setting a higher min_free_kbytes at boot time.

Nimrod - care to send a patch to just yank this min_free_kbytes change for
thp out? :)

This solves your problem another way and is neater overall.

>
> Best Regards,
> Yan, Zi

--
Cheers, Lorenzo
