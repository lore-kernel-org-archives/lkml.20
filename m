Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264E361975
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 23:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789256027; cv=none; b=mGPvbIyfSoApTZ5fEsydUVedBbNrfUxSQONV05HWp03MmNEJfREQqQuhdIz5TNVkAF1USeorhTfcrL7S6Qz/zrJQkrkJTHBUgymW77b0qCUHztLbLzh1JKgtxF2gn01Gw78xEeiNamCef1jIdsDLcVXv7dHZiqqyf9DyRzrXfy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789256027; c=relaxed/simple;
	bh=1gDPSptQeLj0OPrmt+0JnBYsBhx744ZDgc9Dq15UM34=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V/PmmTDNAQAGaIRV/JrJI0uroIF/EFLzWlPYQO483rooMtnOA9L9ZmlcxL8+oR9lYZJ1FzPFKoxJ1xk/7QxIZ22x+1fGk1hfsJn8bTU2r8UxERaLqUG4sG8cL2f54PiMBK9enbvWg7CDWJTa+ds7b29XWCE1TSmBruf8fp/R4M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nyh9oMnz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nyh9oMnz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49e6deb520eso10510045e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789256024; x=1789860824; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfWZA5VorxPvBHCBstYGbBsoifsqUoZdc3SoHINZf28=;
        b=nyh9oMnzKN5gJFcuwcEpkaedunk0sBKBgBUlUwJc5PrqGF1qkDZrLUJjIzy8NdJj9Q
         NtWgzVCpjMMJvGVJ4zh6rH+5gOkhOFb/ZLelzAmdieXV4cbnIYM/hv47hbrYTJ+qgr33
         lNJB7PfQJA9wKZSJB6NLZnY9oCBQE64yiP0vubK0slD8lGLZNq3vcSyyPWQvTbCwaL6o
         U/kNU+Nmi5KcJFg438aAuvSvsQ/yt88jQN2sYBZ3BVz57/jKyERLRGSY6H9hw/g/8r9b
         0dJPu3B+4uhfrdasItNEZbztisXPCyRElJVK6jC2UAgkNJlMnvMWhChd4q6goPg8Cbzz
         flmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789256024; x=1789860824;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfWZA5VorxPvBHCBstYGbBsoifsqUoZdc3SoHINZf28=;
        b=Lgby2OoS0dBz3rOfbsai0fPawQfvSZeKn0zX7WouITiAlOlIY09Gr9Ufr4qH/7Wdy4
         jknKgydQHrpqwQHcKvin8flqnbpGniXuR/jIjYiV/SQ122ZHIliyIos5/CJs2oFSqMM7
         9gA3ecuLOto2mz8IHWAMISxxLJLbJF/8E52CJVgwOMOVPONFW0DQGbSxga84j802bveQ
         nuijSkPovAXxsb5nYjzbIIuJLTbEUioO1IdUiXvtRw4FEDvdEdiTcWfehIngtKt8yyC3
         Aca59k5FkgBQSv4rL/3IWZq8TBSM0mdxZUFvlffiQmhviIQ3ioJcud7Be1FaAfo0gmnq
         /B/w==
X-Forwarded-Encrypted: i=1; AKwUvBwTfLSyEAtDoMc9998lpAy2DRsXOL2Q3ErZGmpSPcCCYEnR2j3PHtOJKuZ29VZNYmtf1HtATXtaAWaVTcY=@vger.kernel.org
X-Gm-Message-State: AFuF++nQysRM1gSk1VeFZ4Gjjmdbl6AoOneeBUX+kpR3DnO1B/KDqQ/u
	f8hIt8wgSmLF+Y914MCYUMdn6kpI8N25CZl0B9/apBioIoaJcGJ64gP8+wplGDk98w==
X-Gm-Gg: AYBFou38DIiHljj3zBmY3W2ac++/NqXXi4M8kPcjEEHjzfp8GU0jArI+s/qisd4wXgr
	oLmNEjXKL53I5dhMu/xBAIo7MsyEIm6n2GjGTNefKGiGdM+FlhEbKEGyr7HOhRXjpDjgX/iUfay
	CZEXcHuNYznlWpRUt7lzz2gDHDD5O1fTtFES+DHwWHZzSIENql+Uak2ugU0jfubBMmV1jsXXCmG
	+MRwCCb7N0X+CVApiOpSPokerEs4susJbpH95tIZSsyVCXmRu8QFcJr6nbKGVOmtPutbTNj/xB8
	A2Be1bB6uV0O7A367F9ytkSKhXE7HTSVGwaZx+uHHZDUNyrWPZ6IR7JcEkAXahjY3s+M7arliHt
	E7Q6mMf9anz2AqT5tNS7CvsUa686SXOrkDfcJEN5ENjxQli54NuipGa89K4jakxUH4ir7oFe8/r
	X/0NPBeT5kTk8FRggZYTJLqupm77nMXPHnUc4yhID4B3CIzXCEuE3qjn+3BF3NqwpHe7WuHjytu
	3bsdFsSy6vjoh3/knah
X-Received: by 2002:a05:600c:8b41:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49e6198865dmr137086655e9.8.1789256023669;
        Sat, 12 Sep 2026 16:33:43 -0700 (PDT)
Received: from darker.lan (104.157.125.91.dyn.plus.net. [91.125.157.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm266378545e9.2.2026.09.12.16.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:33:41 -0700 (PDT)
Date: Sat, 12 Sep 2026 16:33:39 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Kiryl Shutsemau <kas@kernel.org>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Lance Yang <lance.yang@linux.dev>, Leonardo Bras <leobras.c@gmail.com>, 
    Lorenzo Stoakes <ljs@kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 07/26] mm/fbatch: LRU_NEXT_ACTIVATE bit to optimize
 folio_activate()
In-Reply-To: <aqLaa4QvXMbQaIWG@thinkstation>
Message-ID: <84fecd13-f1e4-7d40-94c9-963f5c2f7aee@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com> <c44a34f8-ea3c-48cd-27d5-02df129be685@google.com> <aqLaa4QvXMbQaIWG@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Sep 2026, Kiryl Shutsemau wrote:
> On Wed, Sep 09, 2026 at 02:55:41AM -0700, Hugh Dickins wrote:
> > Implement an equivalent to the old __lru_cache_activate_folio()
> > optimization, to activate a folio recently put in the lru_add fbatch,
> > without having to put it through the lru_activate fbatch too. Neither
> > lruvec lock nor lru bit can guard this safely and efficiently, so resort
> > to try_cmpxchg() on a further, LRU_NEXT_ACTIVATE bit in folio->lru_next.
> > 
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >  include/linux/mm_inline.h |  4 ++++
> >  mm/folio.c                | 23 ++++++++++++++++++++---
> >  2 files changed, 24 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > index 8420b1276535..8f5efadf9c7c 100644
> > --- a/include/linux/mm_inline.h
> > +++ b/include/linux/mm_inline.h
> > @@ -346,6 +346,7 @@ static inline void folio_migrate_refs(struct folio *new, const struct folio *old
> >  enum {
> >  	LRU_NEXT_NEVER_TAIL = 0,	/* Used by a tail's compound_head */
> >  	LRU_NEXT_BATCHED = 1,		/* Not used by any aligned pointer */
> > +	LRU_NEXT_ACTIVATE,
> >  	NR_LRU_NEXT_FLAGS
> >  };
> >  
> > @@ -358,6 +359,9 @@ bool lru_add_del_folio(struct folio *folio)
> >  	if (!(lru_next & BIT(LRU_NEXT_BATCHED)))
> >  		return false;
> >  
> > +	if (lru_next & BIT(LRU_NEXT_ACTIVATE))
> > +		folio_set_active(folio);
> > +
> >  	WRITE_ONCE(folio->lru.next, LIST_POISON1);
> >  	/* BUG_ON(folio->lru_next & BIT(LRU_NEXT_BATCHED)); */
> >  
> > diff --git a/mm/folio.c b/mm/folio.c
> > index a18d8ef6afd5..0b75c3b69d5a 100644
> > --- a/mm/folio.c
> > +++ b/mm/folio.c
> > @@ -256,15 +256,32 @@ static void lru_activate(struct lruvec *lruvec, struct folio *folio)
> >  
> >  void folio_activate(struct folio *folio)
> >  {
> > +	unsigned long lru_next;
> > +
> >  	if (folio_test_active(folio) || folio_test_unevictable(folio) ||
> >  	    !folio_test_lru(folio))
> >  		return;
> >  
> >  	/*
> > -	 * XXX: It is curiously difficult to recreate safely the old
> > -	 * __lru_cache_activate_folio() optimization (folio_set_active()
> > -	 * directly if it's on the local lru_add fbatch): revisit later.
> > +	 * This optimization is intended for the common case of folio
> > +	 * having been recently added to this CPU's lru_add fbatch.
> > +	 * But since other CPUs can now take it at any instant (after
> > +	 * a folio_test_clear_lru()), and we may be migrated to another
> > +	 * CPU, it is simplest just to extend the optimization to all CPUs.
> > +	 *
> > +	 * folio_set_active() would be unsafe without the lruvec lock, and
> > +	 * a folio_test_clear_lru() here might cause a racing drain of the
> > +	 * lru_add fbatch to skip its lru_add(): so use try_cmpxchg().
> >  	 */
> > +	lru_next = READ_ONCE(folio->lru_next);
> > +	while (lru_next & BIT(LRU_NEXT_BATCHED)) {
> > +		if (lru_next & BIT(LRU_NEXT_ACTIVATE))
> > +			return;
> > +		if (try_cmpxchg(&folio->lru_next, &lru_next,
> > +				lru_next | BIT(LRU_NEXT_ACTIVATE)))
> > +			return;
> 
> Hm. What prevents the folio from becoming unevictable under us here?
> I don't see anything.
> 
> __folio_add_lru() wouldn't like it:
> 
> 	VM_BUG_ON_FOLIO(folio_test_active(folio) &&
> 			folio_test_unevictable(folio), folio);
> 
> folio_lru_list() has the VM_BUG() too.

You're right, thank you. I thought I had deleted all such VM_BUG_ONs:
and indeed I had, but only in a patch I later decided was too much for
this series (removing PG_unevictable, using !folio_evictable() in some
places, or folio_test_unevictable() testing another POISON in lru_next).

That excuse is not enough for this series! Yes, I must send a fixup,
but not today.

> 
> I am not sure what the right fix is.
> 
> Maybe lru_add_del_folio() should only call folio_set_active() on
> !folio_test_unevictable() folios?
> 
> Or should we allow occasional active+unevictable

Yes, that's what I did, just removed the VM_BUG_ONs: but I'll need
to check again whether that other patch also had to fix any ordering
of checks. Offhand, probably not: once the "Unevictable LRU" became
an oopsing fiction, it was important to check unevictable first:
unevictable must take precedence, and then it really doesn't matter
whether active is set or not.

> so if they are
> munlocked, they will go directly to active list?

I didn't think of that, but I don't think that "active", set racily
back when the folio was assigned "unevictable", bears much relation
to whether it ought to be put on active or inactive list when later
made evictable again. We should probably be consistent, and
consistent with existing behaviour, that they go to inactive when
made evictable. (I'm not looking at that other patch at present,
I don't recall where active got cleared in it.)

Hugh
