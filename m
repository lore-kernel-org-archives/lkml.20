Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDAA3C584F;
	Mon, 31 Aug 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166635; cv=none; b=fh3/NHLdXpYH/+zUlnWKY01qcFlGW8311AcVfevVhEnw10b3Tn1RZBJoSOMN60uDqDaEVI8Alz/mxQWcmHbW/geu0L0yymFTIrhv/NoGj+TKQ2qhFBID0KqLL2nf/i4ZN4u8RHMPPWMjOU4bKctse0pKWARapevgZrAv6RkPX8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166635; c=relaxed/simple;
	bh=gojgHnVmjpV1nymW7MwpNd3iDopPDZ34Y4VMSpsgcD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgkFGHnAysf1ygXLq0O/bmsVAj1Fn8/cCrWN4zCuXLD8RnB1NTKb41y85Y2pqJpR829RvZVABYeI7gEAy4vEE3wozHSIdsjNqKtZcvcz0AmlsdWBO0NzlVOHLzErocTsTSM70pLrhLXfWLsSQfL0NNa7Y0fmEG5B6HM+9XUi+po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyqF/SjR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyqF/SjR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1274C1F000E9;
	Mon, 31 Aug 2026 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166633;
	bh=YpqPq4bvtMsOVeG0UN+yy/NuoFZ+H+t/+49d1u/I1io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EyqF/SjRvWc/h8CQwUE1TihCdfdXAUbBtv3y4A0dT6UbuMtRzhhG0ezD1YP8W6IB1
	 D1UC6+/yv2T3QyDTv/QKSDkuhr16a7cryNgwZ5B6fcR9kxnoN3Rzu1psKdUKxDkIYd
	 54XgUOPP0PK3+aGg3J5NrGYHZ2Olr6u5urt8HbFyNnKED5mKtDkI/30RyVIOpHeDT/
	 5ZCfkLhsWRwLFq0zE0aJsZM/2e1qpUcEmHgFIPds4GXPE1n0n8Q4v4jVTv8c8x70qs
	 5iGeZvi71UgCbxIg4rPs/lKJWa/iDnwILmdscXOHeUODYzlfByh+0KRz1cCHK442nz
	 QvYs+X0zqjPQg==
Date: Mon, 31 Aug 2026 09:57:04 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Nimrod Oren <noren@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Nirmoy Das <nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at
 1 GiB
Message-ID: <apVAEJtgAzX-kAwN@gremlin>
References: <20260831075635.2244437-1-noren@nvidia.com>
 <apU-lExw89P-zKgD@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apU-lExw89P-zKgD@thinkstation>

On Mon, Aug 31, 2026 at 09:47:29AM +0100, Kiryl Shutsemau wrote:
> On Mon, Aug 31, 2026 at 10:56:35AM +0300, Nimrod Oren wrote:
> > When THP is enabled, set_recommended_min_free_kbytes() may raise
> > min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> > With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
> > pageblocks for every eligible populated zone before capping the result
> > at 5% of low memory.
> >
> > This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
> > configurations, but scales poorly with larger base page sizes. With
> > the default arm64 pageblock sizes, the contribution per eligible zone
> > before the 5% cap is:
> >
> >   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
> >  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
> >  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> >
> > Consequently, min_free_kbytes can reach excessive and unwanted levels.
> >
> > Add an absolute 1 GiB cap to the recommendation, in addition to the
> > existing percentage cap. This bounds the automatic recommendation to a
> > sane value on systems with large pageblocks while preserving existing
> > behavior for typical systems with 2 MiB pageblocks.
>
> I am not against an upper limit for min_free_kbytes, but I think the
> root cause of the problem you see is the size of the page block.
>
> We at Meta switched to 2M page blocks on 64k ARMs recently, targeting 2M
> mTHPs. A 512M pageblock is not practical.

I mean we do keep looping around on these things as 64 KiB page size is
fundamentally a big problem for the pageblock model :)

I don't love the idea of just making page blocks arbitrary smaller for
higher page table size, because hey the intent is to get a PMD-sized thing.

So really I think to do it 'properly' you'd need to rework how that whole
thing functions.

For me the approach here is a practical trade-off - if the intent is to cap
at a sensible value, then just cap at a sensible value.

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

--
Cheers, Lorenzo
