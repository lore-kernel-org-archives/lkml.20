Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535810;
	b=yzVZLGaAuluhIB4HVs0cJYDsMQdlAL5AKvONvqF6jQhQ6xyNJkka1k/NI6H1kma1n8/d
	 aUoSVen7b+Qwfrl/7F94cUs1Fv0gOLBmC01J3rMqtmg8SUi8IIX5MkPaX01AyQVPsIfoG
	 rR07iwe/KrD8+5q4Xaaa5L42o5JlRC5KDqNataeV3ZIM6ew64L2aQEeMqKTziVYGO5AO/
	 5iF8v0YWys3uNIjSJAZWBt/ACL6gqGYo54rwlBXjoWiC3oPg01ZsAg+25F9BY2nkFwlvx
	 g4OurntnwsM3cQxi8OjgKhrtqF6AYSlykSvq2uWn2FYbJXtiBXV4rp7h8qDDkPa9CJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535810;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Rv30j355ZOn02JMfZ3RVK29kwKID6foC3R1nQuJB9KE=;
	b=n0gBBGYJtI/GxRe1Cj/Ehn0JRb4As8yVz7oA4TwjA6rqUuse2xyXr9909IJ1jgCwsYh3
	 4p3zT5EFiKGdTo0LOi9NC/AWYA2BwkvIiQ9LKiaZKhPOIaLrzgQAu4cw1UMI3BI3veI6P
	 nQfoNVKk5lc7P/TjThrDC3rn/m8Z6fXlt1YEomqJg5u66d1OWLviOA9zQ7TnFUwqJyrp1
	 tpgbCCZfsuxkFyBea2VsCwKCluY5E0UxEck9JScO/Y8+TRz65LWqS+0ta0YVCWQ7cC9a0
	 Gg73mknNNGFKQl3AyvFx0CPWiVuNB/LZmYorDhszwDVk1vV2eRoVcZ/Bt5olwULNeww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CvpUkYzR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFBA606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CvpUkYzR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7111F000C9;
	Tue, 20 Oct 2026 22:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792535809;
	bh=Rv30j355ZOn02JMfZ3RVK29kwKID6foC3R1nQuJB9KE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CvpUkYzRfhBVW8RqAWpQuWI7gU2PABbkK5qRUeeF0mF10sMgigl60Fj23MU4UcKj0
	 8qBnMeIY1RNIFU46IX3s9ngCawWnwx3DtDIuthqPYi302K8XWN09HfpQ7uYjOGMrqP
	 zT6EztMOTuOzA5E5gwpaOqsJcawgbYRKjaSxOGpo=
Date: Tue, 20 Oct 2026 15:36:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, David Hildenbrand
 <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng
 <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin
 <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>, Usama Arif
 <usama.arif@linux.dev>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins
 <hughd@google.com>
Subject: Re: [PATCH v3] mm: unqueue deferred split folios outside the lruvec
 lock
Message-Id: <20261020153648.52636815691868735e9699be@linux-foundation.org>
In-Reply-To: <20261019230646.3510790-1-joannelkoong@gmail.com>
References: <20261019230646.3510790-1-joannelkoong@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 16:06:46 -0700 Joanne Koong <joannelkoong@gmail.com> wrote:

> move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
> folio_unqueue_deferred_split() on folios where the refcount has dropped
> to zero. In these paths, folio_unqueue_deferred_split() is called with
> the lruvec lock often held (move_folios_to_lru() always holds it and
> folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
> in the batch except the first). However, it's not needed to hold the
> lruvec lock.
> 
> The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> the deferred split queue lives on folio->_deferred_list in
> deferred_split_lru. The deferred_split_lru is a list_lru with its own
> per-memcg per-node lock.
> 
> There are already other existing callers that call
> folio_unqueue_deferred_split() without holding the lruvec lock (eg
> __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
> 
> Add folio_batch_unqueue_deferred_split() and use it in
> move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
> unqueue each batch of zero-refcount folios from the deferred split list
> after the lruvec lock is released and before
> mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> critical sections, which run with IRQs disabled and are highly
> contended.

Thanks.

This is a speedup and not a correctness thing, yes?  Let's make it a
7.4-rcX thing, for the 7.5 merge window.

I'll park it in the mm-new branch for now.

If people think the speedup is sufficiently worthwhile then I can add a
cc:stable to it, if clear justification is included in the changelog.
