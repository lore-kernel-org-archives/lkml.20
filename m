Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336F627A92D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325030; cv=none; b=nzS0myU/6XsbYXeQBNzuMURBHNQDdZyCKJs8J9DzBYxCzLthIoctq9nTggmEqzKiDPWY3FM1wddqvIqapGELZUpsZ+x014bXXB+lMBex/cfhIoeISzkRILjb4P9W09APRA0xetsFbqdtVEhTWq19zJQYKEJdpLkaUkUct30QaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325030; c=relaxed/simple;
	bh=3gkXEZftB/iOTZIMePqR40LoCZS3SJ/oiKGgfLjksTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HS+wlRiOfxaImi6Ox6a5b8jjrskeCO/B8yujU35sdy4lJ3WBsLB79UMxs3qZreu2HJtVijNRepfQBAw3o3vtWbUWQkPRNmMh8/m9qloZDES8Vr84PN9EsBdcnnj8EYdG7585Ecuc9qQf2u30KAwQTNE0g2Q8glVlV+DgN8byYDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNx/h/qR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNx/h/qR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8B51F000FF;
	Sun, 13 Sep 2026 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789325028;
	bh=0jcy4Xks1KmzO/76JdqZYak5DRErDriwNl/lBhMKXFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eNx/h/qRjBH8CFc2lfKqkmZ1HZbCTa5aBsMZqDhZysDc4vBfloO4DwENDgXqUo026
	 uO1mcwsr3a1AnUAKeDEeKJIW0W0hJS6GKk5YGJ+u7SuaS1dSbE7oEZHOG03+gGSzk0
	 4KCe0+0p4Yslz9fOENom+FbB4eZAKkMn3SdkWxp/IIQe/lKFprJCwza8ZiZJ+yu3xH
	 Yoc+NT0DZFd1w0Hbn2ElMFjeDv66Ra+19KAvyNFAmh7SuFFCr633zkM2RIrL2s/0fi
	 i1dDI5pTK2kKsc+pIVt+tnz+COmSEDLRmrdNWFTjFCrIur76NETlwNwwhf/rK8MtcJ
	 i0U6xEh5wEx2g==
Date: Sun, 13 Sep 2026 19:43:42 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Pedro Falcato <pfalcato@suse.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] khugepaged: hold invalidate_lock across collapse_file()
 readahead
Message-ID: <aqbtfms0_2ULBIT7@gremlin>
References: <20260913101142.28802-1-ngocthang2710.1999@gmail.com>
 <DLEBZ0GIGNQ8.17U563YYJ37AA@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLEBZ0GIGNQ8.17U563YYJ37AA@nvidia.com>

On Sun, Sep 13, 2026 at 12:31:32PM -0400, Zi Yan wrote:
> +willy and heat
>
> On Sun Sep 13, 2026 at 6:11 AM EDT, Nguyen Ngoc Thang wrote:
> > collapse_file() calls page_cache_sync_readahead() to fault in missing
> > pages before collapsing them into a THP. That helper takes
> > mapping->invalidate_lock itself for the duration of the call, then
> > drops it -- but truncate (e.g. ext4_setattr() -> truncate_pagecache())

Em-dash.

> > takes invalidate_lock and then waits on each page's folio lock while
> > holding it. If collapse_file() has already locked one of those folios
> > by the time truncate reaches it, and then tries to acquire
> > invalidate_lock again (e.g. on the next iteration, or via a nested
> > readahead call), the two paths can deadlock/hang on each other's lock:
> > truncate blocked on the folio lock collapse holds, and collapse
> > blocked waiting for invalidate_lock that truncate holds.

Please don't send walls of text.

> >
> > Reproducing this over ~150,000 collapse iterations with truncate
> > racing concurrently reliably hits hung_task: blocked tasks within
> > about 20 seconds on an unpatched kernel.
> >
> > Fix it by taking invalidate_lock_shared once for the whole scan, before
> > locking any folio, and using page_cache_ra_unbounded() directly in the
> > readahead call site instead of page_cache_sync_readahead(), since the
> > latter would try to retake the lock we already hold.
> > page_cache_ra_unbounded() does not clamp to EOF like the helper it
> > replaces, so clamp the requested range explicitly.
> >
> > Reported-by: syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=16bf7cd0ebeb1de93aa5
> > Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

No Fixes tag?...

Given, AFAICT, that you have no contribution history until last wednesday, and
have emerged from nowhere to sending patches across I think 8 maybe 9 subsystems
all at once, it seems a near-certainty you're using an LLM to generate patches.

Please follow kernel procedure and add an Assisted-by tag disclosing this both
on this patch and all the others, please.

https://docs.kernel.org/process/coding-assistants.html

Also note that you are also required to have an understanding of what the
patches are doing:

https://docs.kernel.org/process/generated-content.html

	"As with the output of any tooling, the result may be incorrect or
	inappropriate. You are expected to understand and to be able to defend
	everything you submit. If you are unable to do so, then do not submit
	the resulting changes."

On that basis I wonder whether it would be best if somebody else could take over
this patch?

> > ---
> >  mm/khugepaged.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 11ff98d55c76..690ccbcdf593 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -2267,6 +2267,13 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
> >  	VM_WARN_ON_ONCE(!is_shmem && !mapping_pmd_folio_support(mapping));
> >  	VM_WARN_ON_ONCE(start & (HPAGE_PMD_NR - 1));
> >
> > +	/*
> > +	 * Take invalidate_lock before any folio lock: the readahead below
> > +	 * needs it, and truncate holds it while waiting on folio locks.
> > +	 */
> > +	if (!is_shmem)
> > +		filemap_invalidate_lock_shared(mapping);
> > +
> >  	result = alloc_charge_folio(&new_folio, mm, cc, HPAGE_PMD_ORDER);
> >  	if (result != SCAN_SUCCEED)
> >  		goto out;
> > @@ -2337,10 +2344,20 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
> >  			}
> >  		} else {	/* !is_shmem */
> >  			if (!folio || xa_is_value(folio)) {
> > +				DEFINE_READAHEAD(ractl, file, &file->f_ra,
> > +						  mapping, index);
> > +				pgoff_t eof = DIV_ROUND_UP(i_size_read(mapping->host),
> > +							    PAGE_SIZE);
> > +
> >  				xas_unlock_irq(&xas);
> > -				page_cache_sync_readahead(mapping, &file->f_ra,
> > -							  file, index,
> > -							  end - index);
> > +				/*
> > +				 * invalidate_lock held above; don't retake it.
> > +				 * page_cache_ra_unbounded(), unlike the readahead
> > +				 * helper this replaces, does not clamp to EOF.
> > +				 */
> > +				if (index < eof)
> > +					page_cache_ra_unbounded(&ractl,
> > +						min(end, eof) - index, 0);
> >  				/* drain lru cache to help folio_isolate_lru() */
> >  				lru_add_drain();
> >  				folio = filemap_lock_folio(mapping, index);
> > @@ -2672,6 +2689,8 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
> >  	folio_unlock(new_folio);
> >  	folio_put(new_folio);
> >  out:
> > +	if (!is_shmem)
> > +		filemap_invalidate_unlock_shared(mapping);
> >  	VM_BUG_ON(!list_empty(&pagelist));
> >  	trace_mm_khugepaged_collapse_file(mm, new_folio, index, addr, is_shmem, file, HPAGE_PMD_NR, result);
> >  	return result;
>
>
>
>
> --
> Best Regards,
> Yan, Zi
>

--
Cheers, Lorenzo
