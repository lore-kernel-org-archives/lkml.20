Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8951477D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797990; cv=none; b=p1tMYLS/Z3c1CuvJhkfVhxZimHDLKbSjTShLxrXxtb7KpYMjBstQOBz7edFKszdH78d+VdjipR511tTa1DjHhrZEXd+ShqFU5muJeT+oKJdrtp53wa4SkPks6buQm4EXubRsOabjfzGRkFVG6GFgcV+wtYvwauNxJQcRYl/sqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797990; c=relaxed/simple;
	bh=Egew/FRQCFUC/mDDKk+FJcCo2rmsNUEz9dzCtwRGAaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o81AiYwyV6//pR8pGhB14cZIbFhL2JYq69X0EAx4x6M3BCDcvvaKoIG8UK/ul3wCss1rJb6DrXIi+lqy/H4CavJxt5vBjz5GTSIr4EN9fNpqPQCZCJ/2TomzL75ZCAwHN9R2zLqNwYHowkyNlOtwv/tgWs86WXBwZ5y/L7bdsqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LcWjuxFa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iQlNs/Te; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VK8MzL9a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wei6+CSs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LcWjuxFa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iQlNs/Te";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VK8MzL9a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wei6+CSs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 867C31F7B3;
	Mon,  7 Sep 2026 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788797971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omJY25/XWUjhUvy4Wr9FGwgJZb4rjKPTul22yTeJeNY=;
	b=LcWjuxFagTfgCxZiGMG2drQIg+8W6egTjIS6uSptZRYLxuwbIbeam1AVwPV9VWbMABBb8I
	BqST/rAn9TqkejTpNHhc9iev+h9KQuz6UDMdgJOx2gsDo1fR32e8Vzcr2rPVCtwdVlX/xu
	VT+wvyxeiRcowTN+orMnAFm6e+n7Yig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788797971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omJY25/XWUjhUvy4Wr9FGwgJZb4rjKPTul22yTeJeNY=;
	b=iQlNs/TeiPSDeUixWjWYeH/JE/agATjevDEFmK4T71kQgf/0l8R6ISlaii1LvMSUC00mYD
	svdl85RIQy8RaTCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VK8MzL9a;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wei6+CSs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788797967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omJY25/XWUjhUvy4Wr9FGwgJZb4rjKPTul22yTeJeNY=;
	b=VK8MzL9apzKb9jpYbvPW7iGfWlWRKefhXHnYVZLdEhKMj/XP0Cmx8CMASRlvUVsThm2d6V
	6kl5+QpZJK3NNaxbOOhhgbeLJ+IDJlbA6KP4ByjVsWqy4FnWxYFoMcXgLNj8B68IapJqJ/
	y6uzBWvnZrm4jCw7PjlZTUljzNiXsXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788797967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omJY25/XWUjhUvy4Wr9FGwgJZb4rjKPTul22yTeJeNY=;
	b=wei6+CSsK4PmGx/vpSZzXgBIjvTAvqgm5u/D6DLyOMbwTgn77kJkBn9W39mEoJtPUvbvdr
	V8d1BvQOCQ/pe8CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 892A41339B;
	Mon,  7 Sep 2026 16:19:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n7jOHA7knmpQFAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 07 Sep 2026 16:19:26 +0000
Date: Mon, 7 Sep 2026 17:19:24 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, harry@kernel.org, akpm@linux-foundation.org, 
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] mm/slub: introduce slab parking to reduce
 list_lock contention
Message-ID: <ap7f_w8hHkvpk9Vg@pedro-suse.tail5790ac.ts.net>
References: <20260824122004.3652-1-hao.li@linux.dev>
 <20260824122513.3829-1-hao.li@linux.dev>
 <20260824122513.3829-2-hao.li@linux.dev>
 <8d73f087-42e2-454c-8e5f-93c1b64cb969@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d73f087-42e2-454c-8e5f-93c1b64cb969@kernel.org>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 867C31F7B3
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Mon, Sep 07, 2026 at 03:38:22PM +0200, Vlastimil Babka (SUSE) wrote:
> On 8/24/26 14:25, Hao Li wrote:
> > Introduce a mechanism called parking to mitigate lock contention in the
> > free slowpath.
> 
> Interesting!
> 
> > In the free slowpath, when __slab_free() transitions a full slab into a
> > partial/empty slab through a free operation, it must acquire the list
> > lock to add these newly freed partial/empty slabs to the partial list.
> > 
> > Why must partial and empty slabs converted from full slabs be added to
> > the partial list? Because only by doing so can the sheaf refill or alloc
> > slowpath see these partial slabs and allocate from them. Therefore, the
> > list insertion must be performed, which requires acquiring the lock and
> > leads to heavy lock contention under high concurrency.
> > 
> > Analysis of profiling data from the will-it-scale mmap1 benchmark shows
> > that full -> partial transitions account for a large proportion, second
> > only to partial -> partial.
> > 
> > With extra instrumentation added to __slab_free(), the following data
> > was collected for the maple_node cache (in counts):
> > 
> >   partial->partial    843017414
> >   full->partial       550719384
> >   partial->empty      17459564
> >   full->empty         2
> 
> That's a lot inded. I'd be careful if it's some specific aspect of the test,
> i.e. lots of parallel allocations followed by lots of frees, that wouldn't
> be that common in realistic workloads. But worth looking into at least.
> If it's this kind of pathologic behavior, then I expect changing sheaf size
> as suggested by Pedro wouldn't help much.

mmap1[1] is a very simple test. It just mmaps and munmaps. I assume what we're
observing here is the churn in maple tree nodes as we allocate/free/split/etc.

I suspect it's also possible that bulk RCU freeing is causing this. It might
1) be substantially delayed and 2) dumping a lot of freed maple tree node
objects that overflow the pcs.

[1] https://github.com/heatd/will-it-scale/blob/master/tests/mmap1.c

> 
> > Since the fundamental purpose of __slab_free() is to make newly freed
> > partial/empty slabs visible to the sheaf refill or alloc slowpath, these
> > slabs can be temporarily stored in a staging area in a lockless manner
> > instead of making the free slowpath contend for the lock. The sheaf
> 
> However the lockless manipulation is still going to contend on the
> llist_head. But perhaps it's limited enough in both users and lenght of
> operations to make a difference.
> 
> > refill or alloc slowpath then checks this staging area first when
> > allocating objects. This achieves the goal of making these slabs visible
> > to the sheaf refill or alloc slowpath while allowing the free slowpath
> > to operate locklessly. This process is called "parking".
> 
> I'm gonna pull a David Hildenbrand trick here and question the name :)
> It seems to me it's an (extension of the) partial list, but lockless.
> Parking would suggest to me that it's put somewhere aside not to be used, or
> something.
> 
> > Parking occurs in only one case: when __slab_free() encounters a full ->
> > partial/empty transition and the trylock fails. In this case,
> > __slab_free() attaches the slab to an llist locklessly, instead of
> > waiting for the lock unnecessarily.
> 
> It could be interesting to also see if skipping the trylock completely
> (another cache contending operation) helps even more. Also whether moving
> the llist_node to a different cache line than list_lock (and fields
> protected by it) helps even more, or not.
> 
> > Conversely, the process of moving these parked slabs from the llist back
> > to the partial list is called "unpark". Unpark occurs in four cases:
> > 
> > 1. Sheaf refill or alloc slowpath: This is the core case. The sheaf
> >    refill or alloc slowpath must see the parked slabs, so the first
> >    thing done after acquiring the lock in the sheaf refill or alloc
> >    slowpath is unpark.
> > 2. Cache shrinking: shrinking also needs to see slabs in the parked
> >    state.
> > 3. Cache destruction: kmem_cache_destroy() must also see parked slabs,
> >    which is obvious, otherwise memory would leak.
> > 4. delayed_work (see corner case b below)
> > 
> > Why is this scheme correct? Because paths entering the sheaf refill or
> > alloc slowpath can see both slabs on the partial list and slabs on the
> > parked llist, while allocation paths that do not enter the sheaf refill
> > or alloc slowpath would not check the partial list in the first place
> > and naturally do not need to care about parked slabs. Therefore, whether
> > an allocation takes the sheaf refill or the alloc slowpath or not, slabs
> > on the parked llist and slabs on the partial list make no difference to
> > the allocator. This visibility equivalence is the core of the scheme.
> > This analysis also shows that the scheme does not affect the utilization
> > of partial slabs or lead to increased fragmentation.
> > 
> > Corner cases to handle:
> > a. Parked slabs may become completely empty. Therefore, unpark must also
> >    check min_partial and free excess empty slabs instead of adding them
> >    back to the partial list.
> > 
> > b. In rare cases, the system may go idle immediately after slabs are
> >    parked, and the sheaf refill or alloc slowpath may never run
> >    again. These parked slabs would then remain in the llist until the
> >    next sheaf refill or alloc slowpath performs an unpark. To
> >    solve this problem, add a delayed_work named unpark_work to add
> >    parked slabs back to the partial list when no other path unparks
> >    them.
> 
> OK, but is this a problem that needs the delayed work? If the slabs are
> still partial, they would just sit on the partial list rather than on the
> llist, but it would cause no extra bloat?
> It could be a problem only if free slab(s) got stuck on the llist.
> 
> So I'd try to avoid the delayed work as it's quite a red flag. Periodic
> flushing of alien arrays used to be a very unpopular part of SLAB
> implementation. I think there might be two ways:
> 
> 1) submit the delayed work only when transitioning partial->empty slab on
> the llist. Would likely require flagging slabs that are on the llist.
> Hopefully this will limit the submissions to negligible amounts.
> 
> 2) remove the delayed work completely, instead __slab_free() would perform
> the "unpark" immediately when detecting partial->empty slab transition on
> the llist. Would need flagging the slabs as well.

3) Don't do any of this and keep a small(ish?) barn locally, for each CPU (welcome
back per-CPU partial slabs!). I'll play around with this idea and see if I can
get interesting results...

I also have other vague, handwavy ideas... Hmm...

But I really, really suspect that deferring work and playing around with
trylocks is really just working around allocator deficiencies.

-- 
Pedro
