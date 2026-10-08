Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47243F0A81
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445546; cv=none; b=OLOuGiezTNAkVwA+tnk5lz+Su2OM13SD+y8S5dZJs7fahKTcCBYcsQrzTXKKEMctehwgADWaYuAuxWslvwe85Znjpzz1vCBVdHSkhUgZ64xs8pDs2gxAsf5LfJD/futP460ukYrtz1MoLE09jHKshFDWYZ4dEai6FNENIp+4hSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445546; c=relaxed/simple;
	bh=X4b1asA38Pu+GIKjArxkkSIUclUvQzzIH54CvGfiGgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+ihMU99GIyNfjGD1Av1qSGCbQJEZO53DTpVgqxhp7RaBky//tYypZkELjdwBq4S03ns0wT0Ktqrw6BC3o47cNrMMLiUf8roL8pKcWnnkEUhtkAAJqx0sLLacj/nYrgQawuC0vSblJkYFvzkG7wbcrpmzgm12bNRuszRgu6RBk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efbSkEJ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efbSkEJ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CE81F00893;
	Thu,  8 Oct 2026 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791445544;
	bh=Y82KYwy06rNpAA7M8MsmLg3p1srKgmRdrrUbRlrqajQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=efbSkEJ2rpc8pzH1kPR2J923tKrUfBE7MQ7w+c75c9zz7kP1udsRu2q9egp9bcVVb
	 yex1rX8rZYHKwIlwUyH2D2Nfd7iXsk6ngLByQ5EeiA/VKWQkHNdXr8/pXHIKH0dF7e
	 emoGLzk9iEzmtV9p95S1RT0gfKJWTc7J3Dgx36p8pUvMlNWbOldrTtDeHL3Yv4cV6X
	 AAFv3A5HqO2wgDoihb0FNE4EngPcehF9Tar+Xv/l2XFB9bLf8yaK76ERBqLZmgDALH
	 jop9A4VdvQ42FDAVIQQXT2hSlZQaTyJEtnunTHbyiGbEObu/a3PDj2b/kuWjWl/j+Z
	 c1Oo6pn9hqBsw==
Date: Thu, 8 Oct 2026 09:45:35 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 6/6] mm/mm_init: add zone mismatch warning during page
 init
Message-ID: <asdKHy_xHHa0wJ65@kernel.org>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
 <20260929053231.66085-7-songmuchun@bytedance.com>
 <ar5xbQsUpSQZg0wO@kernel.org>
 <78D5D6AA-BE36-432C-B0F7-453F93DF18C0@linux.dev>
 <ar9p39Y9SmlxvbA_@kernel.org>
 <85941AA4-7E50-4AAE-BC05-0F443B21BE8B@linux.dev>
 <ar_0GLYM6KsIH6tQ@kernel.org>
 <D91CEA1E-6B79-434D-AF49-16C62C0FD095@linux.dev>
 <asTS6OtxPMVshuIO@kernel.org>
 <CF8ED1DC-9745-42D3-92F0-424A02385EC1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CF8ED1DC-9745-42D3-92F0-424A02385EC1@linux.dev>

On Tue, Oct 06, 2026 at 03:32:43PM +0200, Muchun Song wrote:
> > On Oct 6, 2026, at 12:52, Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > On Mon, Oct 05, 2026 at 06:27:52PM +0200, Muchun Song wrote:
> >>> On Oct 2, 2026, at 20:12, Mike Rapoport <rppt@kernel.org> wrote:
> >>> 
> >>> On Fri, Oct 02, 2026 at 05:56:40PM +0800, Muchun Song wrote:
> >>>>> On Oct 2, 2026, at 16:22, Mike Rapoport <rppt@kernel.org> wrote:
> >>>> 
> >>>>>>>> diff --git a/mm/mm_init.c b/mm/mm_init.c
> >>>>>>>> index 1650d6bc1211..bd02e8d06965 100644
> >>>>>>>> --- a/mm/mm_init.c
> >>>>>>>> +++ b/mm/mm_init.c
> >>>>>>>> @@ -609,6 +609,9 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
> >>>>>>>> if (!is_highmem_idx(zone))
> >>>>>>>> set_page_address(page, __va(pfn << PAGE_SHIFT));
> >>>>>>>> #endif
> >>>>>>>> + VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)) &&
> >>>>>>>> + page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
> >>>>>>>> + page_zone_id(page));
> >>>>>>> 
> >>>>>>> Hmm, page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES is initialized a tad later
> >>>>>>> than page so it'll have stale data in the page->flags, won't it?
> >>>>>> 
> >>>>>> Lance is right. The shared tail struct pages are already initialized by
> >>>>>> vmemmap_shared_tail_page() during vmemmap population, so they're not stale.
> >>>>>> The head 64 struct pages are initialized later — right here, after vmemmap
> >>>>>> population.
> >>>>> 
> >>>>> Still it looks out of place here, can this check be done in sparse-vmemmap
> >>>>> somehow?
> >>>> 
> >>>> The struct page entries of a vmemmap-optimizable compound page
> >>>> are currently initialized in two stages. During vmemmap
> >>>> population, the shared tail entries are initialized first. The
> >>>> retained head area—normally 64—is initialized later through
> >>>> __init_single_page().
> >>>> 
> >>>> This warning connects the two stages: while initializing the
> >>>> retained entries in the second stage, it verifies that their zone
> >>>> information is consistent with the shared entries initialized in
> >>>> the first stage. Therefore, the same check cannot be performed
> >>>> during vmemmap population.
> >>>> 
> >>>> I am planning to first unify the HugeTLB and Device DAX
> >>>> compound-page initialization through a common helper [1]. Once that
> >>>> work is complete, maybe it will be easy to move the initialization
> >>>> of the retained head area into vmemmap population. With both the
> >>>> retained and shared entries initialized in the same stage, there
> >>>> will be no cross-stage inconsistency to check, and this warning
> >>>> can be removed.
> >>>> 
> >>>> Would keeping the check here for now and removing it as part of
> >>>> that follow-up sound reasonable to you?
> >>> 
> >>> While it feels really out of place in __init_single_page(), but having it
> >>> memmap_init_range() close to the if that skips shared tail pages makes
> >>> sense.
> >>> 
> >>> What do you say?
> >> 
> >> Sorry for the late reply because of traveling to LPC.
> >> 
> >> Putting the check in memmap_init_range() would validate the
> >> invariant for the shared-tail range skipped there. It would
> >> not, however, cover all vmemmap-optimized initialization
> >> paths: optimized Device DAX bypasses memmap_init_range()
> >> when there is no altmap, and deferred boot-time HugeTLB
> >> initialization may also initialize retained entries
> >> elsewhere.
> >> 
> >> If the intention is to validate only the skip in
> >> memmap_init_range(), moving it there makes sense. If we want
> >> the warning to cover both HugeTLB and Device DAX generally,
> >> it still needs to remain in __init_single_page() or be
> >> called from the individual initialization paths.
> > 
> > Yeah, putting this into all the callers sucks too :(
> > 
> > With all the callers,__init_single_page() is the right place for this
> > check, but I think we can add a static inline in sparse.h, like e.g.
> > 
> > vmemmap_optimization_verify_zone(page, pfn)
> > 
> > to make it a bit nicer.
> 
> Yeah, factoring this into a helper makes sense.
> 
> Since it currently has only one caller, how about keeping it as a local
> static inline in mm_init.c instead of putting it in sparse.h?

Presuming we don't expect new callers any time soon let's put it just above
__init_single_page().

-- 
Sincerely yours,
Mike.
