Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273003D9DDF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368097; cv=none; b=sfvrn3TTDqQudwfCvIzdPGxkZQiqoh2Yn+uklIIvdh/TdP8wc3Qn6hDHXUrK9/ehhWCVAW7fDvTG2DxHFqg/zjjvMHU+w9ZVnHytXHcYef+AECzbOZRQ+rOs50N3wvVhA6qQ7xZuR6jL2c9jkVqeiLJwZ2Ct2fHj6+U2C5jdj2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368097; c=relaxed/simple;
	bh=SnX0fzA1DduhIUbjL1LdCOa+vmdyh8x1TGLBa8G0ktA=;
	h=Date:From:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ODXhmefxKzinK2Sd1/wyfOXm0RDqQ4KosHDxfBEuyZ169V+Mvi6M9wGHlVOiksHkzAH3LRGaDw0WVLBnKR/o+IC8uYZBVp5GrOuMPRPIuyhqFWdaF14HDNf9X5nXXPx+HoJRXMZTVd2kj/OjihYniAx+ACs8o8FLc/rVRCg7LFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReILfIpc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReILfIpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FAC1F000E9;
	Wed,  2 Sep 2026 16:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788368096;
	bh=y2lXFjttr759fogNwtcmJ05qV+QLeR1FmpBEpxYt6hg=; h=Date:From:To:Cc;
	b=ReILfIpcQZoEiNAZyDqgQ6hHtBfYzGmehhpdxdANpT4eJgM8ieOHpi9CG9WfIYRre
	 crsMRUk9Iduv1SG8B2bmh/9WxxFDV8j0DDqv1e3E8ibjraB0YREbmpP7qKFJR1BQ3+
	 9AEU+J+Vb/ISz5zLZ7g88ykVQBA2HDcJybCqbrrTPC7eAo1Ae7RraQX/apAEeEeBd4
	 r+CRHsuGVbBtrlHFKB6l/o5HBpI9Xhpk7zx/weK3UALBe/qP+y7QOz7WuR8dcSpIWD
	 8dVLsLd2+3KbJFvYMEbqkwiTfQHVaUSgk8jDKV43h6wLzzys32VoeJzkY1wSaK7itU
	 ananJUb0HwUqw==
Date: Wed, 2 Sep 2026 16:54:54 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, 
	Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, mgorman@techsingularity.net, 
	david@redhat.com, vbabka@suse.cz, hannes@cmpxchg.org, quic_pkondeti@quicinc.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Zach O'Keefe <zokeefe@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, David Rientjes <rientjes@google.com>
Message-ID: <aphU3h1FmrLnbFiW@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Bcc:
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
Message-ID: <aphUaA2FlniZ_h9v@google.com>
Reply-To:
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
