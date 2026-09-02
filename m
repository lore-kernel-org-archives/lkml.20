Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9F337702E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368201; cv=none; b=SeOKRJz0m5sIw0f3BW+1VoHVnpZdRhlRJ5dn07c3Qj7brcsFKA8ugtUn7LSEGWQ76UYd/MDFkcmL47AVn8zfSh7kqN1dE+1rdSNym6jTo20RXU2x43uXrKmKdu99zfOZOpoys78fFByz1UFnFAAPlLcvqUs8HmMGYGUl4GhPymI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368201; c=relaxed/simple;
	bh=ydkcFrA5GHhUxE0ecBOEYb24UimxjfitJPoCXl/0f+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sotdZHCIJrQHhKusqEnhDjRwvmM1nBNEuOg5Ql8ME5OlogJwNjhWhntXqF3dZT0ZOejuSQeiqnQFh7ja6ii5x1DzXpzob5K3mQ6nHC2QeTNU1JCs5/lAeSZ3NKHPReDkACa95aBj6hmOWeau2N50YW+Atb4+h6UmmKLfSCYoXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKqNVbLg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKqNVbLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EEF1F000E9;
	Wed,  2 Sep 2026 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788368200;
	bh=x6sBaIYAa3U9oX3VIO6revwOec3nxbZ/xfycN1MdD2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MKqNVbLgm9d6fWuLrTOmlaf5WEIUdJuPnmJ/pFNmfrLeKi6NKR4NYFRjDhSiP1rXs
	 trnVnnbfCdO22x5YCoY3TX/jEDuC2O6EMFNqduMg5Tag0DaC0Y5KfKG3h3HBQbp3NO
	 KVnHLHi0P2v50WgNwQAArBmcZtOi1IQ+sR0N0j0HEvMf+dF/IMZFMNPntNgz0w5B27
	 heUuYyt7IMaxt4ca2unBoKsxOVa9BqDPr7WF8HdzlY97/nWaC+e3mejlPjDcppipi3
	 cqZBK9cwWdDlgvLxDWEWmGRiYNzytisrOzi1YQClAkBLuuaMp5MTaSDh81EOimJim7
	 fFhB025RNCwVA==
Date: Wed, 2 Sep 2026 16:56:38 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, 
	Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, mgorman@techsingularity.net, 
	david@redhat.com, vbabka@suse.cz, hannes@cmpxchg.org, quic_pkondeti@quicinc.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Zach O'Keefe <zokeefe@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, David Rientjes <rientjes@google.com>
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
Message-ID: <aphU_tBPl0TegeHd@google.com>
References: <cover.1699104759.git.quic_charante@quicinc.com>
 <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aphSYFTd12oia8K2@google.com>

On Wed, Sep 02, 2026 at 04:49:48PM +0000, Yosry Ahmed wrote:
> On Sun, Nov 05, 2023 at 06:20:50PM +0530, Charan Teja Kalla wrote:
> > pcp lists are drained from __alloc_pages_direct_reclaim(), only if some
> > progress is made in the attempt.
> > 
> > struct page *__alloc_pages_direct_reclaim() {
> >     .....
> >    *did_some_progress = __perform_reclaim(gfp_mask, order, ac);
> >    if (unlikely(!(*did_some_progress)))
> >       goto out;
> > retry:
> >     page = get_page_from_freelist();
> >     if (!page && !drained) {
> >         drain_all_pages(NULL);
> >         drained = true;
> >         goto retry;
> >     }
> > out:
> > }
> > 
> > After the above, allocation attempt can fallback to
> > should_reclaim_retry() to decide reclaim retries. If it too return
> > false, allocation request will simply fallback to oom kill path without
> > even attempting the draining of the pcp pages that might help the
> > allocation attempt to succeed.
> > 
> > VM system running with ~50MB of memory shown the below stats during OOM
> > kill:
> > Normal free:760kB boost:0kB min:768kB low:960kB high:1152kB
> > reserved_highatomic:0KB managed:49152kB free_pcp:460kB
> > 
> > Though in such system state OOM kill is imminent, but the current kill
> > could have been delayed if the pcp is drained as pcp + free is even
> > above the high watermark.
> > 
> > Fix this missing drain of pcp list in should_reclaim_retry() along with
> > unreserving the high atomic page blocks, like it is done in
> > __alloc_pages_direct_reclaim().
> > 
> > Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
> 
> [Sorry for thread necromancy]
> 
> Hi Charan,

Charan's email bounced, trying another one I found on lore, and adding a
few folks from other replies.

> 
> Are you planning to respin this patch?
> 
> I know that Michal was questioning the need for it. While doing some
> stress testing I came across a couple of OOM kills that had significant
> amount of memory in pcplists. Something that would have been prevented
> by this patch.
> 
> It's not something I can reproduce reliably and it is an artificial
> workload, so not very concerning, but the patch seems like generally a
> good idea and hopefully pretty harmless. It's also consistent with the
> code in __alloc_pages_direct_reclaim().
> 
> For the record, we have been carrying it internally for a while and
> there haven't been any issues AFAICT.
> 
> Michal, WDYT?
> 
> > ---
> >  mm/page_alloc.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index b91c99e..8eee292 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -3857,8 +3857,10 @@ should_reclaim_retry(gfp_t gfp_mask, unsigned order,
> >  		cond_resched();
> >  out:
> >  	/* Before OOM, exhaust highatomic_reserve */
> > -	if (!ret)
> > -		return unreserve_highatomic_pageblock(ac, true);
> > +	if (!ret) {
> > +		ret =  unreserve_highatomic_pageblock(ac, true);
> > +		drain_all_pages(NULL);
> > +	}
> >  
> >  	return ret;
> >  }
> > -- 
> > 2.7.4
> > 
> > 
> 
