Received: from mta0.migadu.com (out-212.mta0.migadu.com [91.218.175.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D42D3B47C6
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101972; cv=none; b=ZTRpbamQdEMTPMracVKPoIxyeN6JI60+iI2ZK8sgJbV/eVTc76FnSJWD/WgAFkvvD+LaTkIWKDFRri1FOuDXRUiZc38mQeG8IizJYd+PQmLuwOD7oxAnQiVQt77j4+HIg23AfobR+/D0FinKd7zbze4HTzWh2SwTkrMWq9K4r2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101972; c=relaxed/simple;
	bh=rLY5GKWhKys/u3ldPHSR1SF53EIXXyEYyCrHcX2TQiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T77WvLMTDrRilLduoT6zQEXTzrwDy1a4jE5PD1BJOnDyyhKTNb8hxGUW9Cl8fcO+w0c/KNhH4nn7aIY4GnHlTee542VeyMqxw+ZcDl69rfjn/vBKt66/WvLMiZI5oUwTV9QecMhd7Bvv/OqmqJXw6xq9ZoeU25hOzSeKO+Luj0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sUmia9Iu; arc=none smtp.client-ip=91.218.175.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sUmia9Iu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rLY5GKWhKys/u3ldPHSR1SF53EIXXyEYyCrHcX2TQiA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788101967; v=1; x=1788706767;
 b=sUmia9Iu4pFWxfswH31SEz/JfpAcztqfKcgtOVAIlp+z9/icgXskxfBQwoqM6LvcEK9wZwbQ
 ift1RZWg8PY/VXOY2I0rVuGl+TxD7UIE3UC7yiyixw68ec/kELsJUHKjLvdYXf3zahIho3TfNv/
 7SyVhaJzzEfSigkAvoVbmexs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c08b8e8a6516a298;
	Sun, 30 Aug 2026 14:59:17 +0000
X-Mizu-Trace-ID: c08b8e8a6516a298
X-Migadu-Flow: FLOW_OUT
Date: Sun, 30 Aug 2026 22:59:10 +0800
From: Hao Li <hao.li@linux.dev>
To: Pedro Falcato <pfalcato@suse.de>
Cc: vbabka@kernel.org, harry@kernel.org, akpm@linux-foundation.org, 
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm/slub: reduce list_lock contention with slab
 parking
Message-ID: <apRBmrMB6bJ6tTqY@fedora>
References: <20260824122004.3652-1-hao.li@linux.dev>
 <apBioBxd4VkmaGhA@pedro-suse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apBioBxd4VkmaGhA@pedro-suse>

On Thu, Aug 27, 2026 at 05:24:32PM +0100, Pedro Falcato wrote:
> On Mon, Aug 24, 2026 at 08:19:50PM +0800, Hao Li wrote:
> > This patch series might sound a bit wild, but the initial numbers don't
> > look too bad so far. I would really appreciate any feedback and
> > discussion :)
> 
> The numbers look great, I have to say ;)

Thanks and sorry for the delayed reply!

> 
> > 
> > On a will-it-scale mmap1 run with 192 processes, list_lock is the top
> > contention point: __slab_free() and __refill_objects_node() together
> > spend 44% of cycles in native_queued_spin_lock_slowpath. The free
> > slowpath takes the lock mainly to add slabs that became non-full to the
> > partial list.
> 
> Doesn't this mean you're hitting the slow path way too many times? I think
> that's the actual issue, no?

Partly, let me separate the two sides.

> 
> > 
> > By adding extra instrumentation to __slab_free(), I collect the following
> > data for the maple_node cache (in counts):
> > 
> >   partial->partial    843017414
> >   full->partial       550719384
> >   partial->empty      17459564
> >   full->empty         2
> > 
> > We can see that full -> partial transitions account for a significant
> > proportion, and optimizing them can help reduce lock contention to some
> > extent.
> > 
> > This series introduces the parking mechanism to address this issue.
> > When the trylock fails during a full -> partial/empty transition,
> > __slab_free() parks the slab on a per-node llist instead of waiting. The
> > paths that consume the partial list (sheaf refill, alloc slowpath,
> > shrink, cache destruction) unpark the slabs after taking the lock, and a
> > delayed work covers the case where none of them runs.
> > 
> > Patch 1 cleans up the case handling in __slab_free(), no functional
> > change. Patch 2 introduces the parking mechanism.
> 
> This looks like fundamentally the wrong fix, when we want to find out why
> 1) you're hitting the alloc slowpath so hard

Regarding the alloc side, it mostly goes through sheaf refilling, which isn't
quite the actual slowpath in the usual sense. The full slowpath would be
allocating a single object directly from the partial list, and from what we've
observed in testing, that path is rarely ever hit.

> 2) you're hitting the free slowpath so hard

Yes, the free side does indeed take the slowpath, which is precisely the
problem this series aims to address.

> 
> and ideally find some way to tune it properly. Maybe if sheaf size is scaled
> up/down in some way (by default at least), according to amount of RAM or amount of
> CPUs.

I think the idea makes sense, though it might only offer partial relief. Since
much of the overhead seems to come from free-side lock contention, a lockless
approach could be a more fundamental fix.

Thanks for the discussion!

-- 
Thanks,
Hao
