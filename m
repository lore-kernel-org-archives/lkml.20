Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462265;
	b=kMVhtWV6LTziCL6PHb1z5S/1J9I3CxMA/afJ31moz6P82lLLmtJG/MJd2spTPiPS3CDc
	 znTa0HE8Alp7D1g3ENcmWGcmnODYw72wJjNn32Z0iEQM5/kyYXXZg6U0phXqa9YSbctNw
	 awc5rLQXblVu4mA7Ng0+5q9V44jE6Pp3wKS8iXcDs5S1JJGbJeqmioo6QydOG/A1OmceZ
	 7SmzOVw+3oIXK7PqnVP62lvYqc+OOMIJm3j4w4wU4Hghcd2Juv07OJm1HivbQSPV/9f5U
	 P6ljU2CfBNDyopZp7MMMcvTuXfMjZC0EFIw7h3Gfqb6Guvh6LujZ9bZolJzVxAPtGkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462265;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Fv8woWOOJ+ttnnLaTVcNI3Ww0pceRpqGqBuqXsTN2+4=;
	b=GkqEqIwsBcKiOJgq7wyysUW7nprhu3g+HDAEyCA97OCIXs+Dvb2lLzm6jQazz4lmr/RW
	 xD4kDgIzjM3BzRw97yoOjwtcL0jXzgr1grK6AYXZIjDSgwJxWkmXX1LGQBUyoZ2JksJKu
	 uGAAbylBURbaqepD5kEQSdyiNEBANusNuYi8kFZyu7ZsIQpD1mhHG5ytukVbqKfaBpwCH
	 O38C/Z5pUH3/z48QvdWQBQfrVbBEpfGehAIT0nyYYrKHo941fLeVcCvx/CP1usz1C/7+7
	 nAL9Cl4YKFRRL5BmRueodwLnEFzxhuUsGhtVAQty/owo7+XkF3HQeNsfxZ7MC8Ii0Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X1pugFsU;
	arc=none smtp.remote-ip=95.215.58.109
Received: from mta1.migadu.com (out-109.mta1.migadu.com [95.215.58.109])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X1pugFsU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qFLy/cCZWRuVvp8u/NE6bm9Bg5FRKCoK1ob4wHvg3yw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794462262; v=1; x=1795067062;
 b=X1pugFsU9AEh27z/8MMTSSfTKrXyALFymEeUWIdIFDiRTe7ul65g3ASthHcUlI3FE8NN7Btw
 9odfg8TOH97Wx1GDJD5Of+KQyA1S8jiyFnKTWmE07Dt9FczvVDHMJ/sI7AqLZCtmwCxOe9w4Xp5
 b5JAXTL6ylZDAqpUcgrC/MCY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5c3232aa448fa3e9;
	Thu, 12 Nov 2026 05:44:22 +0000
X-Mizu-Trace-ID: 5c3232aa448fa3e9
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 21:44:16 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Chris Mason <mason@kernel.org>
Subject: Re: [PATCH] mm: list_lru: fix NULL deref when a folio moves to the
 root memcg
Message-ID: <avVSEx2bbM4abwln@linux.dev>
References: <20261112024140.648088-1-shakeel.butt@linux.dev>
 <26CC0CD2-97FE-4842-AE51-605EC77AC91D@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26CC0CD2-97FE-4842-AE51-605EC77AC91D@linux.dev>

On Thu, Nov 12, 2026 at 10:49:44AM +0800, Muchun Song wrote:
> 
> 
> > On Nov 12, 2026, at 10:41, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> > 
> > folio_memcg_list_lru_alloc() makes sure that a folio's memcg has its
> > own lists in a list_lru, such as the THP deferred split queue. It looks
> > up the folio's memcg twice: a fast path under RCU checks if the lists
> > exist, and a slow path takes a reference and allocates them. The fast
> > path returns early for the root memcg, which uses the global lists.
> > The slow path does not check for the root.
> > 
> > The memcg can change between the two lookups: when a cgroup is
> > removed, its folios are moved to the parent memcg. If the folio is
> > moved up to the root in between, the slow path gets the root, and
> > __memcg_list_lru_alloc() dereferences the root's parent, which is NULL.
> > 
> > Users see a NULL pointer dereference oops while a THP is allocated,
> > such as in a page fault, in khugepaged or at swap-in. tmpfs huge pages
> > are affected too, and for them the oops can also happen in reclaim,
> > for example in kswapd. The task that hits the oops is killed, or the
> > machine panics if panic_on_oops is set.
> > 
> > The race is narrow: the folio has to be moved up to the root right
> > between the two lookups. For example, its cgroup is directly below the
> > root and is removed, or has its memory controller disabled, at that
> > moment.
> > 
> > Fix it by skipping the root memcg in the slow path too. The root needs
> > no lists of its own.
> > 
> > Fixes: ae64f07a6a40 ("mm: list_lru: introduce folio_memcg_list_lru_alloc()")
> > Reported-by: Chris Mason <mason@kernel.org>
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > 
> > ---
> > mm/list_lru.c | 10 ++++++++--
> > 1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/list_lru.c b/mm/list_lru.c
> > index d1d256822ccc..566691ca3dd8 100644
> > --- a/mm/list_lru.c
> > +++ b/mm/list_lru.c
> > @@ -645,9 +645,15 @@ int folio_memcg_list_lru_alloc(struct folio *folio, struct list_lru *lru,
> > 	if (likely(res))
> > 		return 0;
> > 
> > -	/* Allocation may block, pin the memcg */
> > +	/*
> > +	 * Allocation may block, so pin the memcg. If the folio's cgroup
> > +	 * was removed after the check above, the folio has moved up to a
> > +	 * parent memcg, which can be the root. The root uses the global
> > +	 * lists and has no parent, so skip it.
> > +	 */
> > 	memcg = get_mem_cgroup_from_folio(folio);
> > -	res = __memcg_list_lru_alloc(memcg, lru, gfp);
> > +	if (!mem_cgroup_is_root(memcg))
> 
> How about using memcg_list_lru_allocated() to check this, it's consistent with
> the above check?

Yes, that makes sense. Will send out v2.

