Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F4372EFF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119626; cv=none; b=oHewXAvXOjMgMFePeVJEHYFAI/kCgyXTho33wDvLpjQPdP0f+ENL7WJpd5a5hLuG1qd9nOLdzzBADDMsgQexp60C8OmyYpKGoSUNTna1ZEobqyhtbmVfF9qBahufMy/j5mUgkJ3hJadvQjzLKG18ZiDnPeT/k2UKMQzBcQrLHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119626; c=relaxed/simple;
	bh=Dr+29JqiloCb4O8SP9GbOa//C4ch2HbwiK2FOF7OIJg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JxfCSZkHhULgDVXpOH/P36D+MX1dj4MI/WqS1Q5bCxf1uDa+vcdMOyJKHK+GowlAHXvuR/auPmPkYpfdFpC6Pi2RtTora+X67QIdTUWmuq2cNHn5zNHnPZFfnQiMgFY72X79ofhRoIkfWWQznkJ2jjUq83IfzTy+pDRpal7r/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dUFq5q6m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dUFq5q6m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8741F000C4;
	Fri, 16 Oct 2026 03:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792119624;
	bh=9GkQXqNuCXyuXNoJMzMidl3PLgLW9/DoYWi7RsIGJVc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dUFq5q6mtNryr/WDRuojfUOLSENM4RFeSK9Dof4XhD7rt9BLpHW2NVYyerHAid1qW
	 UqAymulNpZ+2lPmdD2YgL4iOOQYj7Blv8GicM/+0VG5wPj8QsWuOTEy8vIofhHEvND
	 IX7kVUMEOBi/7tH1fUhEBrQ6b42PralDlPbkmKKA=
Date: Thu, 15 Oct 2026 20:00:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, linux-mm@kvack.org, Jiayuan Chen
 <jiayuan.chen@shopee.com>, Chris Li <chrisl@kernel.org>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Youngjun Park
 <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/swap: fix swap_cache_get_folio() returning a folio
 that left the swap cache
Message-Id: <20261015200023.49685b4cba9d514d1f3ac374@linux-foundation.org>
In-Reply-To: <CAMgjq7AGRP3B0UZ9-wJKtz8D-ayivhV0gn2WxsrJ1Q=Qm4TVWQ@mail.gmail.com>
References: <20261015060528.302634-1-jiayuan.chen@linux.dev>
	<20261015184014.715dcdd3a25e18fd4df49e95@linux-foundation.org>
	<b2f925b6-93e6-4b44-bc18-c94a34b381eb@linux.dev>
	<CAMgjq7AGRP3B0UZ9-wJKtz8D-ayivhV0gn2WxsrJ1Q=Qm4TVWQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 10:22:20 +0800 Kairui Song <ryncsn@gmail.com> wrote:

> On Fri, Oct 16, 2026 at 10:16 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> >
> > Hi Andrew,
> >
> > On 10/16/26 9:40 AM, Andrew Morton wrote:
> > > On Thu, 15 Oct 2026 14:05:27 +0800 Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> > >
> > [...]
> 
> Hi all,
> 
> > >
> > > So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead and
> > > takes the folio lock of someone else's page, before
> > > folio_matches_swap_entry() finds out the folio is not ours.
> > >
> > > Recheck the slot after folio_try_get() and retry if it no longer holds
> > > this folio.
> > > Thanks.
> > >
> > > As always, when fixing a bug please fully describe the worst-case
> > > userspace-visible runtime effects of that bug.
> > >
> > > I asked $LLM for this and was told
> > >
> > > : When the race occurs, a swap fault can acquire a reference to a
> > > : physical page that has been freed and reused for an unrelated purpose,
> > > : potentially by another process.  The fault handler may then clear that
> > > : page's PG_readahead/PG_reclaim flag, wait on or acquire its folio lock,
> > > : and potentially attempt to remove it from an unrelated swap cache.
> > > :
> > > : These operations can interfere with unrelated workloads and may cause
> > > : unexpected stalls, impaired reclaim or writeback, and potentially
> > > : system hangs.  The subsequent swap-entry validation normally prevents
> >
> >
> > I don't see a way to a system hang: the folio lock waiter is woken when
> > the real owner unlocks, so the worst case is a stall. I suggest
> > dropping "and potentially system hangs".

Yes, I think it's assuming the other-owned folio never gets unlocked.

> >
> > Writeback itself is not affected, only the PG_reclaim hint on where to
> > put the folio after writeback. So "impaired reclaim or writeback" ->
> > "impaired reclaim".
> >
> > So I'd suggest:
> >
> >    : When the race occurs, a swap fault can acquire a reference to a
> >    : physical page that has been freed and reused for an unrelated purpose,
> >    : potentially by another process.  The fault handler may then clear that
> >    : page's PG_readahead/PG_reclaim flag, wait on or acquire its folio lock,
> >    : and potentially attempt to remove it from an unrelated swap cache.
> >    :
> >    : These operations can interfere with unrelated workloads and may cause
> >    : unexpected stalls and impaired reclaim.  The subsequent swap-entry
> >    : validation normally prevents the wrong folio from being mapped into
> 
> It's documented that caller always double checks the folio so this
> part is harmless from the aspect of data corruption or crash.

OK, thanks, adjustment made.

> > >> Fixes: 8578e0c00dcf ("mm, swap: use the swap table for the swap cache and switch API")
> > > Given the above, I suggest adding cc:stable.
> > >
> > > Do you and maintainers agree?
> >
> > Agreed for me.
> >
> 
> This is more like a optimization than a bug fix, but it's clean and
> easy to follow, Cc'ing stable is fine to me.

Was that an ack ;)


Here's what I now have:

: swap_cache_get_folio() reads the folio from the swap table and takes a
: reference with folio_try_get(), without any lock.  If the folio is removed
: from the swap cache and freed in between, and its memory gets reused,
: folio_try_get() still succeeds and we return a page that has nothing to do
: with the swap entry:
: 
:   CPU 0                                  CPU 1
:   do_swap_page()
:     swap_cache_get_folio()
:       swp_tb = swap_table_get()
:       folio = swp_tb_to_folio(swp_tb)
:                                          madvise(MADV_DONTNEED)
:                                            zap_nonpresent_ptes()
:                                              swap_put_entries_direct()
:                                                swap_put_entries_cluster()
:                                                  __try_to_reclaim_swap()
:                                                    swap_cache_del_folio()
:                                                    folio_put()   <- freed
:                                          page reused, e.g. as an anon
:                                          folio of another task
:       folio_try_get(folio)               <- succeeds
:       return folio
:     swap_update_readahead()              <- may clear PG_readahead on it
:     folio_lock_or_retry()                <- locks it
:     folio_matches_swap_entry() fails, unlock and put
: 
: filemap_get_entry() does the same lockless lookup for the page cache, and
: after folio_try_get() it rechecks the xarray, because the folio may have
: been freed and reused in between.  swap_cache_get_folio() lost that
: recheck when the swap cache moved to the swap table.
: 
: So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead and
: takes the folio lock of someone else's page, before
: folio_matches_swap_entry() finds out the folio is not ours.
: 
: When the race occurs, a swap fault can acquire a reference to a
: physical page that has been freed and reused for an unrelated purpose,
: potentially by another process.  The fault handler may then clear that
: page's PG_readahead/PG_reclaim flag, wait on or acquire its folio lock,
: and potentially attempt to remove it from an unrelated swap cache.
: 
: These operations can interfere with unrelated workloads and may cause
: unexpected stalls and impaired reclaim.  The subsequent swap-entry
: validation normally prevents the wrong folio from being mapped into the
: faulting process.
: 
: It's documented that caller always double checks the folio so this part
: is harmless from the aspect of data corruption or crash.
: 
: Recheck the slot after folio_try_get() and retry if it no longer holds
: this folio.

