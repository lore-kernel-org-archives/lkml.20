Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC6E274650
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784437; cv=none; b=TvdmmdtLKNAgIsNToO91VXBgN5g+wbVpXHrzuV4CpqDMtE0xu5XgcIKEKck3PwFhLurcWSa6884GYMtfeeltmD1aeFfp3hDb8mierFI9gY1v/hwArGtqk7HsbpZtCfng6d7+IPTyiSvBePOKiIJzoFDwX9bi2qPlBu0oWoimsP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784437; c=relaxed/simple;
	bh=efnX50ZvDI0WHlwqDqTaNDbZxbSNS08+8lKKEAqxdc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVKb+w/uyUBENsMTy4beP6GHAHuqEU9U9A0zvM64QiW1qATnxie2FvBcsT0sTto1TYINxNlR6B9pHLi6TS8PwO8fHfDIODAXtnwBhHw2VsttT7Qmh/+tNuaT8G9DSi1vPMGsCjXCE+kWzuhXAMplPHiZ1vWYoGlXVVtn5hv8J1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHJmmyOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHJmmyOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDA01F00A3E;
	Mon,  7 Sep 2026 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784436;
	bh=h7cKBm7+BzUzCvCkEH7tyBUTdRm4vS9wwDEbS3sNZuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHJmmyOpiwExIz4vREZk9fQD+t6Q8jCuI00q/MyLSuDZHHaQBS4ygHbC7AtSWZQ8T
	 J2FVEopbouH1yFG1kPLeu0k0diRmQDZIC537aX83zKcO1lQ4juKPm00ZLTrFX1Cjy2
	 BNPfO+W+r/r1dBaIdJEkakAPZebE7tbiNCxeXG6GFUL3KlPDkLcKZYSFCBW5dWfDtt
	 sOkDMNIFcoEzc+bj0u2OQ+9hmXrMAak1hJc1br0aFcvLkChengGjrWQh/peJX1SKTE
	 aMWSeREzzHNLg+WYLTLtDgI42cJmb4uEgWccSuQnAepxBPJY5lQZ4lsWoeR/CMPVR4
	 GydJS25pRlFqA==
Date: Mon, 7 Sep 2026 13:33:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Mike Kaplinskiy <mike@recall.ai>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: Re: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED
Message-ID: <ap6vCPHUIt3Es7ko@gremlin>
References: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
 <apriM1q4GzAgP7JQ@pedro-suse.tail5790ac.ts.net>
 <aprjOxDy3JCPb2oa@gremlin>
 <5930324d-8252-42e1-ad50-aab796e41550@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5930324d-8252-42e1-ad50-aab796e41550@kernel.org>

On Mon, Sep 07, 2026 at 01:51:20PM +0200, David Hildenbrand (Arm) wrote:
> > And it's a real improvement to have unfaulted anon skip...
> >
> > But I find that version is documenting what's going on a lot less.
> >
> > Since both anon and MAP_PRIVATE file-backed are CoW mappings we could just
> > reference that.
> >
> > Andrew - could you swap the patch out in-place with below? Thanks!
>
> A proper v2 would have been nice ;)
>
> (and would trigger sashiko and friends properly)

Ack, though it's kinda obviously functionally equivalent (or so I felt :P).

I had a local LLM check it FWIW.

>
> >
> > Cheers, Lorenzo
> >
> > ----8<----
> > From a706374a1186b6b4409a0e760e8728bcadba0c96 Mon Sep 17 00:00:00 2001
> > From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
> > Date: Thu, 3 Sep 2026 20:08:39 +0100
> > Subject: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
> >  MADV_WILLNEED
> >
> > Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
> > entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
> > for the former and a tree walk and swap in to swap cache for the latter.
> >
> > MAP_PRIVATE-file backed mappings straddle the two and currently get treated
> > as if they were purely file-backed, meaning any swapped out private pages
> > remain swapped out.
> >
> > Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
> > mappings and performing both walks in this case.
> >
> > Since the logic checks for vma->anon_vma this means un-CoW'd
> > MAP_PRIVATE-file backed mappings retain only the single file walk.
> >
> > Reported-by: Mike Kaplinskiy <mike@recall.ai>
> > Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  mm/madvise.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 73c2901b9adb..963337f93a7a 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -297,11 +297,12 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
> >  	loff_t offset;
> >
> >  #ifdef CONFIG_SWAP
> > -	if (!file) {
> > +	if (vma_is_cow_mapping(vma) && vma->anon_vma) {
> >  		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
> >  		lru_add_drain(); /* Push any new pages onto the LRU now */
> > -		return 0;
> >  	}
> > +	if (!file)
> > +		return 0;
> >
> LGTM
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
