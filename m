Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4552C2931DB
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788060867; cv=none; b=CA32v+6xPPyRyL9mjDVrHfgWAu5NxeghBc9Jex/vT4vQXLsBQc9FHvmtcjgmCmmKaIZE8TL6ns+R9Ils9arTrw8EomwzH2mx2esGHx2ZFSOfRVNjW62k+hOdX+yHYhMxBpkWv+HOLlSohmug60g2hNtPnMJ9ASew/q4GPRPqQVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788060867; c=relaxed/simple;
	bh=zB7bAdpo8KUyP/iJPsj5ADp4RSQ7D7o3opnexPKqFKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcf1uSTMg7AmDJ2SKDcbDkTrTkZ/a+1l/e7r+TZxQMISNlkhsoTj8dcnSJx/TtZ5YXanmwC9oNRo5tifQQ7Dy/jAyGuxPbLgekgkQVwaB5ZH3zA+Y+Q772nRi6hIqxSrqgnwRJNW2nEKzy24Jx+lkGpJipx71PrJ4hxMLLQc8QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qtDavoRW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qtDavoRW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/6O7LuUtWYo+JIUJhcrpLcvGcaxdDNTc+S9TwjcblS8=; b=qtDavoRWQNl4/xLDeRUYevI+d5
	tZlZ6wQFdbe8+K+SChbV+LXRGlocEzl2mFjWCjLa++uxI5ApEf3Oaz/DAWWzjjnf4pQNbj7IfbAqL
	dbnJZ7gmvNrBfc1eB1sHMNvIaCJnDu90ESvVPVw/fqOR+Xu9mirNF76RFuujJL1avWZKl8ZdrYp3z
	TBlFAifGPFgdrmbHPVgn4ncGkKnXbn4pDQzPLDVvg5UY48GbhVytwKfbzh4wSbKERASNlI5wvN627
	GsXZbQlLPCsm9JBQe1wZOLW56bgsup0B3aXxbedptXhJZwZ2qg/YHhsFkk1HY8/JBNwmKML2EXDRK
	EoVsrPjQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0WJ7-0000000HYEy-36qH;
	Sun, 30 Aug 2026 03:34:09 +0000
Date: Sun, 30 Aug 2026 04:34:09 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, harry@kernel.org,
	jannh@google.com, lance.yang@linux.dev, liam@infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
	mhocko@suse.com, riel@surriel.com, rppt@kernel.org,
	surenb@google.com,
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: fix the race on huge alloc failed
Message-ID: <apOkscUtVMpFqFjM@casper.infradead.org>
References: <apL8kdB0j561wl5G@casper.infradead.org>
 <20260829180234.435064-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829180234.435064-1-trintaeoitogc@gmail.com>

First, I hope you're a human being and not just doing what an LLM tells
you, because I'm putting effort into this.  Second, for the same reason,
I hope you stick around and make further contributions.

On Sat, Aug 29, 2026 at 03:02:34PM -0300, Guilherme Giacomo Simoes wrote:
> Matthew Wilcox <willy@infradead.org> wrotes:
> >> Fixes: 164b06f238b9 ("mm: call wp_page_copy() under the VMA lock")
> >
> > what makes you think this is the right commit for fixes?
> Maybe I would should analyzed this better. I only seed the commit that introduce
> this function (and consequently this reader)

That was what I thought, but it's not enough to determine if that's the
start of the problem.  Look, that commit does:

-       if (unlikely(anon_vma_prepare(vma)))
-               goto oom;
+       ret = vmf_anon_prepare(vmf);
+       if (unlikely(ret))
+               goto out;

... and anon_vma_prepare() does:

        if (likely(vma->anon_vma))
                return 0;

so either this race was already present in 164b06f238b9 (and you need to
go back further) or it was actually introduced later (maybe the write
side was introduced later?)

> >> The race occurs because the reader (__vmf_anon_prepare()) checks
> >> `vma->anon->vma` without holding the mmap_lock and withou the
> >> READ_ONCE() macro. Since the writer (__anon_vma_prepare()) is holding the
> >> mmap_lock and updating the pointer, it creates a data race as the two
> >> access are not properly synchronized.
> >
> > also this explanation is bogus.  i don't have time to fix it right now.
> Hmm... I would like to say that the reader (__vmf_anon_prepare) access the same
> data that the writer (__anon_vma_prepare()), lead to a race condition problem.
> 
> When the huge page alloc failed, the asm_exc_page_fault interrupt is fired but
> on the same time the procces that was trying to alloc the huge page, try handle
> to this failed too..
> 
> How READ_ONCE() and WRITE_ONCE() is atomic, the race problem can be resolved.

The important thing to know is that the mmap_lock is a read-write lock.
That means that two readers can be present at the same time.  So this race
can happen when both threads hold the mmap_lock.  I don't know whether
they do in the syzbot reproducer; probably not, but it doesn't matter.

The other important thing is that _we don't care_ what the value of
vma->anon_vma is.  We only care whether it's NULL or not (this is a
sufficiently common case that I wonder whether KCSAN shouldn't special-case
it and decline to monitor it ...)  VMAs are created with a NULL anon_vma,
and then if needed, anon_vma is set.  Once set, it is never changed (uhh
... at least I don't think it is.  Lorenzo, could you check me on this?
I think all the places where we set vma->anon_vma to NULL are in
situations where the VMA is not yet exposed to the page fault handler,
like in the child side of fork()).

So it's inappropriate to use READ_ONCE() / WRITE_ONCE() to "solve"
this problem, because we don't need those semantics.  It's sufficient
to wrap the read side in data_race() to indicate to KCSAN that we know
what we're doing.

Also, as Lance said, I don't see how this is related to huge_page_alloc
failing.  All I see is two threads calling  __vmf_anon_prepare() at the
same time, which I presume is an attempt to COW a hugetlb page.

I don't think it's enough to just add a data_race() to this one read of
vma->anon_vma.  I think it's quite prevalent.  There's probably other
syzbot reports that mention it.
