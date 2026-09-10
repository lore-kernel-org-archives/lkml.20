Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40BE3E0C4F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032054; cv=none; b=TreLfY94ZnON0xI0LHtYiTPkrFt1b7juFoKGCadr2I3ODPAC/eiDXaIt9QbWkUQtWtASbUD1U4EpKJA7eA0pDIQN+fik3KewElIpsHew2mHak+FKedt0jthCp3UndmLFkmB7GHeIQ2SrvdNWt+kBrqWTVbnT+krjQc+JT1kerho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032054; c=relaxed/simple;
	bh=QoplZLxQztWjZDKRx6mClEDY7U+zYbqTfYmzwwlOuuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYa/2m9AaiGZuxKPxZmVpE4GNgbj9ICoNS184C2KCL7HioDUm/U9MG9t2NFK7enTpQaAMBEEHGy0Gsnd8XckF2JI0GB4elkmSjk+F771y4TUQQh7+LbacIj4oNp25lALonKCJbOqFS3EjNRUUa+7d6F6PPJqNOdlEmYT6Nx+qzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8N2gmLV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8N2gmLV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093E71F0089C;
	Thu, 10 Sep 2026 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032052;
	bh=IqTjSSKuqTCF1mU8hfCM689lnN+IiDNFzRzwjltxKp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8N2gmLVcVLG7tk5zvPtWOdiSMoN32tL5GsqkLrRd18I3N040Vz+EpntjxKI8GGC/
	 3GG2/Y6jNKHeIQGAzgzZboy55guFHdxAap2VEXM7+Hn0PUM5fa6hz/W9p8CuWdiLFG
	 GO6AWH15nOsBuy8Wi/XvrwB9ss9ZBjzkK4Jb0HSSkZwxONsSGmApur62G/NYhepnJc
	 4EJy47RXybU5ElqT1iPuKX3Nj4qLQrXTcEd207cZ0O+sbqKvCE5XjLqGK1zBTkzB4m
	 Cj2RFcnsW5kswVAV4Bylz3zuTJH4CVikBQKKCaHAITtv8cvIoYHkO2KjGQo3NCJz3B
	 MPbI3ZovEV9Vg==
Date: Thu, 10 Sep 2026 10:20:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@suse.com, pfalcato@suse.de, rppt@kernel.org, surenb@google.com, 
	vbabka@kernel.org, willy@infradead.org
Subject: Re: [PATCH] mm: bypass datarace check
Message-ID: <aqJnU1OtGhPBg2kF@gremlin>
References: <aqFWqqvUEiie8cYq@gremlin>
 <20260909212943.539665-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909212943.539665-1-trintaeoitogc@gmail.com>

On Wed, Sep 09, 2026 at 06:29:43PM -0300, Guilherme Giacomo Simoes wrote:
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> > I started review below but honestly this patch is confused in multiple ways
> > and it's not entirely clear you really understand what's going on here.
> I can be wrong, but was understand that due the order that the code was write
> probably the data race problem will not happen.
>
> The reader (__vmf_anon_prepare()):
> ```
> if (likely(vma->anon_vma)) // lockless check
> 	return 0;              // OK
>
> // if the check above fail
>
> if (!__anon_vma_prepare(vma)) // called the __anon_vma_prepare
>     return 0;
>
> ```
>
> inside __anon_vma_prepare()
> ```
> spin_lock(&mm->page_table_lock); //ACQUIRE semantics
>
> if (likely(!vma->anon_vma)) // re-check under lock
>     // ... alloc all
>
> spin_unlock(&mm->page_table_lock);
> ```
>
> This is safe because, if `if (likely(vma->anon_vma))` return NULL, we will got
> the mmap_lock and then page_table_lock.

I mean yes but it's complicated (the anon rmap is like this all over, it's
complicated for _everybody_ which is part of why I am working to change it).

There are 2 cases basically for _attached_ VMAS - mmap/vma write lock held
(you are the only thread that has access to the vma by definition) or mmap read
lock held in which case it's an optimistic check that must be re-checked with
mm->page_table_lock held to get exclusivity.

And it turns out that _all of mm_ screwed up some aspect of this also see:

https://lore.kernel.org/all/20260908122924.554373-1-tujinjiang@huawei.com/

>
> The critical re-check inside __anon_vma_prepare() happens under spin_lock(...)
> with has ACQUIRE semantics.
> With ACQUIRE semantics , the cpu (or compiler, I don't know) cannot reorder the
> memory access acress the lock boundary.
>
> I'm right?

Well the issue with acquire/release semantics is that instructions that are
outside of a critical section can be re-ordered within the critical section.

See my analysis here:

https://lore.kernel.org/all/ap6ybQeSg_rrmC95@gremlin/

(Again we were all confused about it! Memory barriers are very counterintuitive)

>
> >
> > It's also basically implementing what we suggested.
> >
> > So at this point I think it's easier if I send the patch with a:
> >
> > Reported-by:
> > Closes:
> >
> > tag -> you, this patch.
> >
> > Thanks!
> ok, no problem

Thanks, sorry about that but I feel in general, it's super sensitive and
confusing this and it's the best way in this case.

>
> > On Wed, Sep 09, 2026 at 08:57:23AM -0300, Guilherme Giacomo Simoes wrote:
> > > Despiste kcsan point to a possible race condition problem, this is a
> >
> > Typos  -> Despite, point -> points
> Hmm, is not the first time that any person points my english mistakes... I will
> improve this point, thank you for yout jints

No worries, I make typos all the time and have no excuses for it :)

>
> > > safe race condition due the access memory ordering, since
> > > spin_lock(&mm->page_table_lock) have ACQUIRE semantics and ensure the
> > > ordering mapping.
> >
> > This sentence is a bit confused. Acquire semantics mean absolutely nothing
> > unless paired with another operation and etc. etc.
> missing full stop, my bad.
>
> > Needs a:
> >
> > Suggested-by: Pedro Falcato <pfalcato@suse.de>
> Yeah, I forget
>
> >
> > Also:
> >
> > Assisted-by: LLM?
> > The list below reads very LLM-ish so I have to ask did you use one etc. etc.
> >
> > https://docs.kernel.org/process/coding-assistants.html
> >
> > Perhaps given I am suggesting a lot here a:
> I don't have installed any llm (not even cursor), I just use a deepseek,
> chatgpt, etc.. to clear up a few questions. (maybe I should start use this to
> help me with english too)

Ah sorry, there's such a wave of it and the list seemed that way, I guess
because you had it help on the language it flagged it up :)

>
> > There are other places where this check is done and etc.
> I would should checked this, sorry. Anxiety.

Understandable, this is delicate stuff!

>
> Thanks Lorenzo for your review, help and patience

No worries! :)


--
Cheers, Lorenzo
