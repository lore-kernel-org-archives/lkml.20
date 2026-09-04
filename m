Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB353E6DEC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537704; cv=none; b=TueyDEd+nys1BbfvyATJ2Pscn7DTyNS5hnXM/Pc0LHJzxAu1Y1vH3qWM0jNeQnzQLz+ssqweCqo+JqFQOWSkPL51xQFgHWHElEAYbVjTTioIsfh+ZtBdO1jSys2syRWpVJsY7lxQMvWnRODISGpmzCiOJlo9H/3K/zORK7k3dGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537704; c=relaxed/simple;
	bh=zPud9uRaZUeYLvrNTFZirkjYRt/gCopw3esGeYvILK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoURn4xLFOIoF30TRLHJjofDxhxRR+UIM6ma+SBIyiC/C7QEhffhHGEb581yZ7Q6+OVWxLCLY4qieATLyYdbWBOOZPbeuDx2D5kwVTZHgyCfQqEV/137W6FjSYnr3lStCHAlETH89EM2LljL+ZiPcm4IKOE+Q36BNcaFJWptaZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Chil6rRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Chil6rRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D48F1F00A3D;
	Fri,  4 Sep 2026 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537703;
	bh=8+ocR7sGCB/9B0UdyCqbIbFztIKXJYrXR0zQcU6I5Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Chil6rRr5FT32LVSVmyd3qa03Z6aWYEodRak43Dgt3mp/StVMgtwJgJen31j+J38z
	 HBqo9q1Pvh2oaYpcONL8zfTAcnHYvTPF0SnAc69CT5/OYBlnIEhj5aCjlnpaPQvLjB
	 dcv36lkfAh39srnfz+qlMNJAPlKIom69Ukx5AF4QwkBFtUNtTYq0k9J2nBJESHMNtg
	 RJ+A1XK/QIuaHPP+DMw4cdQd0pDrXmya7Yg23jvT2fBMtLyK484HXXm0pGQ1QXugN3
	 eMVhHRqWzRfaIGE9kfcAtgwYRuvTRbuVD/x0MP+gJFe5o8lGC4ZWwvpgdkHH1rcsDz
	 vdWIzqbTzQheg==
Date: Fri, 4 Sep 2026 17:01:37 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Mike Kaplinskiy <mike@recall.ai>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: Re: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED
Message-ID: <aprjOxDy3JCPb2oa@gremlin>
References: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
 <apriM1q4GzAgP7JQ@pedro-suse.tail5790ac.ts.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apriM1q4GzAgP7JQ@pedro-suse.tail5790ac.ts.net>

On Fri, Sep 04, 2026 at 04:24:59PM +0100, Pedro Falcato wrote:
> On Fri, Sep 04, 2026 at 04:12:53PM +0100, Lorenzo Stoakes (ARM) wrote:
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
> >  mm/madvise.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 73c2901b9adb..d0510dd49dde 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -297,10 +297,12 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
> >  	loff_t offset;
> >
> >  #ifdef CONFIG_SWAP
> > -	if (!file) {
> > +	if (!file || (vma_is_cow_mapping(vma) && vma->anon_vma)) {
>
> Couldn't this all be simplified to
>
> 	if (vma->anon_vma) {
>
> ? swapin needs anon pages to have been faulted-in. Non-cow mappings won't
> have an anon_vma, nor will fully empty anonymous VMAs (and that's fine).
> Right?

Hmm good point :)

Though the

	if (!file)
		return 0;

Would have to be outside of the block to avoid an anon unfaulted (nop) from
being skipped.

And it's a real improvement to have unfaulted anon skip...

But I find that version is documenting what's going on a lot less.

Since both anon and MAP_PRIVATE file-backed are CoW mappings we could just
reference that.

Andrew - could you swap the patch out in-place with below? Thanks!

Cheers, Lorenzo

----8<----
From a706374a1186b6b4409a0e760e8728bcadba0c96 Mon Sep 17 00:00:00 2001
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 3 Sep 2026 20:08:39 +0100
Subject: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED

Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
for the former and a tree walk and swap in to swap cache for the latter.

MAP_PRIVATE-file backed mappings straddle the two and currently get treated
as if they were purely file-backed, meaning any swapped out private pages
remain swapped out.

Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
mappings and performing both walks in this case.

Since the logic checks for vma->anon_vma this means un-CoW'd
MAP_PRIVATE-file backed mappings retain only the single file walk.

Reported-by: Mike Kaplinskiy <mike@recall.ai>
Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/madvise.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 73c2901b9adb..963337f93a7a 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -297,11 +297,12 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
 	loff_t offset;

 #ifdef CONFIG_SWAP
-	if (!file) {
+	if (vma_is_cow_mapping(vma) && vma->anon_vma) {
 		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
 		lru_add_drain(); /* Push any new pages onto the LRU now */
-		return 0;
 	}
+	if (!file)
+		return 0;

 	if (shmem_mapping(file->f_mapping)) {
 		shmem_swapin_range(vma, start, end, file->f_mapping);
--
2.55.0
