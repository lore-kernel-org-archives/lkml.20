Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F035372DC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986362; cv=none; b=WGSMh+NfMzRoMwkpH81pZ1LCU0rbixott3WWIm/X8E/hgSo07cdvUhpS5rwYgbG9kSDbSu+mKxCV+HZmP8BTd9F1iX7k8khF3xsyUzKu8ekgyVUTm65z3UW09z7JtQg0jBR7uupu2gfXfVtRc442xy+K3sUJwrmfi0KwIkObhFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986362; c=relaxed/simple;
	bh=u8nI6RUiJpsiBQHtG/0K/h1A1islmGidSAIrZ5+7LJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBiqKIz8K65wuBy47lh8h7v/I1THbKCw5pCX5shmW17MloS3/zHvGBjb9GcN9YuTYbpfNtW9f1fz86HDLtuOPdzzJ74nephUT2+yKddtnqB0SlkpAsYmGUN8YRlVJZ9zOvOUPzweMcGAbePJ1algQNapNlC0+ccJt6PuA7qp09c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aoydswlI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rHLzpzZL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VbW0CPzv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zfdSq5CA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aoydswlI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rHLzpzZL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VbW0CPzv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zfdSq5CA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD8761F7D0;
	Wed, 14 Oct 2026 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791986353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRD+QKcyqfM9Pv+rOJxIpDN876c6GfSlGejxFlLIlBc=;
	b=aoydswlI2mgw2zSs1IjgfWcq9Dd+m/5OX7smTydDzTU2aDoFSfFCerr7JrNn9T4FiejXWu
	O5VoliZyARAQAFi0Vg3lKCQLFHGFW1twg9+rv5PRAhwWICS0czHV8lY17dKfrP8Y1kIeqf
	fP7aDx0szOM5/ne6fmf0qU3TvG3ErIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791986353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRD+QKcyqfM9Pv+rOJxIpDN876c6GfSlGejxFlLIlBc=;
	b=rHLzpzZLbZrtvR1/Bpo5XaKNrnriGQf5DLq11dEh6iRcMajKQCIv/jYjQPsxf3kTeHt59+
	htVepw7E8NMdrfBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791986352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRD+QKcyqfM9Pv+rOJxIpDN876c6GfSlGejxFlLIlBc=;
	b=VbW0CPzvQHTYdlbr1mSztMbI+ZWSryhJghj95LY7e8ozoxgG/zcRZS8Sd3Ksg8eH67k7NZ
	c/BdeeZaoPg4C8NE65hWEp4E1qD/OJSI8vCxEK5Laf+Q6h8kcx8ETyLkhYuObsb5L5f5gb
	qsj3y+t/iVS63CcJOe1BhPOXTJJPpwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791986352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRD+QKcyqfM9Pv+rOJxIpDN876c6GfSlGejxFlLIlBc=;
	b=zfdSq5CAoWDudq7YnfiTKHfD6EW3+HBJcVKcYyR0Z/XMHFJF3kBrG42IYD24BIZK//bjho
	Bw4aJZ+39p8G8UAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0C4F133F1;
	Wed, 14 Oct 2026 13:59:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GX0ELq+Kz2oBXgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 14 Oct 2026 13:59:11 +0000
Date: Wed, 14 Oct 2026 14:59:10 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Kiryl Shutsemau <kirill@shutemov.name>
Cc: Harry Yoo <harry@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad>
 <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Tue, Oct 13, 2026 at 06:01:15PM -0700, Linus Torvalds wrote:
> On Tue, 13 Oct 2026 at 17:10, Harry Yoo <harry@kernel.org> wrote:
> >
> > There should be a limitation on how much memory can be submitted to RCU
> > by the page cache, otherwise will be a corner case where we have too
> > much unreclaimable memory waiting for the RCU subsystem to free them.
> 
> There is. In fact, I tried it a few different ways... It's not quite
> what you suggest, but try it out.
> 
> > For the same reason, when a process tries to create RCU-delay-freed
> > pages much faster than RCU can free memory, the kernel needs to limit
> > that.
> 
> That was actually my initial approach - making the places that set the
> PG_rcu_delay bit throttle themselves when there were lots of such
> pages in flight.
> 
> Except I worried about slowing down simple things like truncating big
> files: particularly since I believe firmly that slowing that down is
> the *wrong* thing to do from a memory pressure standpoint, because
> you'd be slowing down the very thing that is actively freeing pages -
> it's just that it then takes a (short) while for those pages to get to
> a usable state.
> 
> So what I did instead was to actively then expedite RCU when there
> were a lot of pages in flight.

Right, this makes sense.

> 
> That worked quite well, but it hit a problem when you had lots of CPUs
> doing it: since an RCU quiet period needs to happen on *each* CPU, you
> still end up wanting to at some point wait for things: you need to
> synchronize not _one_ thread freeing things, but synchronize across
> all the CPU's.
> 
> But again: the good part really is that this "lots and lots of pages
> in flight" only happens when there are literally lots and lots of
> pages that are very much about to be free'd. So you are in a fairly
> good position when it happens, you just need to *understand* the
> position you are in.
> 
> So the other part is to come at the issue from the other end: when you
> have trouble allocating pages, but see that there are a ton of pages
> in flight due to PG_rcu_free, you basically do the same thing from the
> other end, and do synchronize_rcu_expedited().
> 
> And in testing, that worked really well under even insane loads where
> concurrent hole punching or truncate calls would generate gigabytes of
> PG_rcu_free activity each second.
> 
> Now, it turns out that Kiryl also suggested another approach to the
> pages becoming PG_rcu_free in the first place: instead of being able
> to easily trigger gigabytes of such free pages by just truncating a
> large file - which marked all those pages PG_rcu_free whether that was
> useful or not - the current version actually comes at *that* the other
> way too: mark only pages that are hot and are *worth* the PG_rcu_free
> treatment (because they get read over and over again) with PG_rcu_free
> in the first place, so that you don't generate that flood of
> RCU-free'd pages in the first place, and now the PG_rcu_free flood is
> in a way throttled by the *use* of said pages.
> 
> So there's effectively three different things working together:
> 
>  - mark a folio PG_rcu_free only when it's hot and keeps being accessed
> 
>    (See commits dabc522cee5b: "mm: have folio_mark_accessed() return
> whether the folio is hot" and  bb5908b733a1: "mm/filemap: set
> PG_rcu_free on the folios that reads keep coming back to" for details
> - both are pretty tiny and not really all that complicated)

I'm not sure this is a good criteria for checking whether a folio should
be RCU-ified. Namely:
- you don't need that many accesses to get an active, referenced folio. LRU
batching makes it a little harder, but not by much.
- rewinding along a folio doesn't tell you much other than the reader
went back, for some reason. It's also natively racy so funny things like
multiple pread()'s to the same fd can easily confuse this mechanism into
marking this as hot.

How many pages (as a %) are you seeing as marked PG_rcu_free across a boot/
realistic workload?

> 
>  - proactively expedite RCU grace periods when there are a lot of of
> pages pending
> 
>    (See commit 2ce8df4627fe: "mm: expedite the grace period when a CPU
> has many deferred frees")
> 
>  - teach the page allocator about the outstanding pages ratehr that failing
> 
>    (See commit 82fc13ff3a1e mm: "count the pages waiting for a grace
> period and free them before OOM")
> 
> and it really does seem to work quite smoothly. But it's not like I
> can guarantee it's perfect.
> 
> All those commits are fairly trivial. Of the ones listed above, that
> "count the pages waiting for a grace period and free them before OOM"
> is the biggest by far, but it's not really particularly complex or
> subtle.
> 
> The actual biggest patches in the series are:
> 
>  - 65401f4102b9 ("mm/filemap: read from the page cache without folio
> references")
> 
>    This really is not very big or complicated, although it *does* have
> subtle ordering issues with i_size as pointed out by Kiryl. It's
> mostly really just a simplified version of my patch from two and a
> half years ago. And it's simplified because now the RCU freeing makes
> everything more natural.
> 
>  - df0b133495c9 ("mm: free PG_rcu_free folios only after an RCU grace period")
> 
>    This is the one that actually runs on the page freeing side and
> adds a page that is marked PG_rcu_free to a list and sets up the whole
> RCU machinery (ok, there are actually two per-cpu lists: the 'pending'
> list and the 'batch' list, and a RCU grace period will free the
> current batch and move the pending list to be the next batch - not
> rocket science).
> 
> and even those "big" patches aren't really all that big. Both are less
> than 200 lines of code, and while I wouldn't call either of them
> _trivial_, both are very much doing one clear thing and there's
> nothing really *strange* about them either.
> 
> So it's ten patches, none of them particularly hairy. I really would
> encourage you to just take a look and take it for a try.
> 
> Now, I *will* say that obviously RCU-freeing pages is an absolutely
> conceptually *enormous* change to the VM. But it's in no way at all a
> new thing: we've been doing the same thing for kmalloc() for decades.

Well, yes, but generally you have a lot more memory pinned as page cache
than kmalloc. In my current laptop (fairly standard desktop system) that
ratio is about 20x (more page cache than slab).

In any case, I was fairly interested in the problem back then, but I don't
think a solution that may fundamentally alter the VM system is worth it. At
least until we can find an actual real-world use case where performance
substancially changes (i.e not a microbenchmark). Until then, these patches
look to be more trouble than they're worth.

Regarding the RCU'ing, I'm wondering if we could find a similar system where
some type of RCU stability exists, but without delaying the actual frees to
RCU. Like TYPESAFE_BY_RCU, but for folios (where they keep their order and
some other interesting properties like direct map status, (un)acceptability)
such that the old solution would be more palatable. In any case, talk is cheap,
and I definitely have no code :)

(or, and this is another random idea that is currently not feasible due to
$raisins, but the folio refcount could be sharded per-cpu or so; this should
avoid most contention at the expense of the (relatively) rare truncate/reclaim
path)

-- 
Pedro
