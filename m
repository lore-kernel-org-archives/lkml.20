Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420417;
	b=EjuHh1AJKw8kyMeomgKfTIcUKjs0OYW9n+7BVKHeuJDpFinl84Mk0X841HL8GiM6J9K0
	 ennt2HG92w7nJ7lOR+B1ZMlMNHAQCHsoAYlCJASkgayyvBR6vMlioOHJ2pCBP1EYQlzxo
	 3ilGJ/Zayu7U3J08TFXyp6v2qDorEYx7+3byGLfKkRkQrNC8IPMhaxHq6NaVtotipJ1Cr
	 UIStUTWVUvjozZtBH9TvVa/oJLJX0rmW/+01posI6wa7otIVUnuuWDPPeJaA8HuOA/CLG
	 L2NF1mcawO5FEcRFW7tNjWsa0491xCFOgBA+wZ+fYSFV797jhRsSSDdIKYoelRzq2zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420417;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PEoVa1/ve/PN9rU0jpGakgmZs+XQWXgtWWpspfzoeOQ=;
	b=bSCkWEFxMWsMeCWm4roamu9a22Ffn1qXrqlS6PF0ROC+ApT/lD7d2n5W1DTZhVxqqnm8
	 TXyfM+4Dpwxlmxlj+AIJ+coGmAa5zaRgkZtX/bLt6J5cARUEvs1xYk6EnpVyczq4bB8ye
	 xIiM4xRdd6yFn/5mq9sV3COhYQK5vPayffKUIWXp+EP+Fg5HJI0p7+LakIz9ylUdG8R7l
	 Q3vUPJI0uFsJO+xOW58DQ63nfkrrb3jBt/akzldxVhjh7dg+8X5IKM5Pzby5Zex78Wkei
	 /wOkKgQ3xUiq+iS+5WVu5D1Mfq8xDjky14BWT7rX4IrGN/UsgxTxBwiW/DNMSAclOIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+KQOliv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D16606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+KQOliv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961541F00A07;
	Wed, 11 Nov 2026 18:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794420417;
	bh=PEoVa1/ve/PN9rU0jpGakgmZs+XQWXgtWWpspfzoeOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D+KQOlivPnfcY4oAqAmeUerEJakAkwpFIRC7TYfzk6ycZMTAnpykd2x4yqpZ7iBLH
	 Tkc5Ka7IKnISOJzlOmDsx2loMwpPbvaTqH14lolp/G8eTRTi3cEd4KYeszyF0NeuEG
	 ArVX1jTjw2KRGtKZ0PLTcGAu8j5FfoXHzad3rY86vcjy3oCWe7Mutajzw4KCS7T98Z
	 6uC9MgFDqzsbneg1etPdU6PSds8nLTikaeIf+HIzGvmBF3Hu6Vy+FeeyrbHIr7sFL9
	 ZnDV5j+9JG17EI+D8VrsOgTsAuaAJZAq2PeUqu9qB7UZRRoJocR/9lfnAt5m5HrCib
	 qN5fK8PhUT2vA==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.ams.internal (Postfix) with ESMTP id 92DD8198003A;
	Wed, 11 Nov 2026 13:06:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 11 Nov 2026 13:06:55 -0500
X-ME-Sender: <xms:u670aiPLTfCAfgZIYntvEFbTMpwZxAF4T1hLI1RIByc7ytjGjAXc9g>
    <xme:u670aqLFoQXp6tw3P4MZF4tje30lkbKjNJNOhXPkL13isE14DyxPlVQC7wA_b6gL1
    Ytc16JiYQycQnRc1Hzsc88_ycWQxN4e-pG6-SmjIUGooJF1nkXSWzE7>
X-ME-Received: <xmr:u670atjktQdNqe3B6L7K26wMbQYdMJB9IgGenRjkHGwfHXRrxjQzXuraL-0>
X-ME-Proxy-Cause: dmFkZTFqGEOXfSfkLafJsQr9Y62vpFZ8gczs/OMO8l2OK4dbyp0m817ffGPPnJL/BoBYUc
    3axE/I+kzJ7xDpg6TNdrBkPI2fuEsYhMyEySmdM6mMIpTh2eTQUUYQS7Q2aMjaUi2l0e/s
    YpAka7C32er73aX6XqPDLKcxBd6ntQ3lGOVRwDlH5wQ446IgLTTwlqgZjA34De0W42iKCm
    miusSXuGyPd1MqjWhBbPQj8SWNLRzJNiJnf+YUwDmgUZIyHYJBPibdJ4snoguGJLtJy8X+
    FiSLqI+l1jSSG+oEjrIchXRim94s/+wFrZPzvl3wTGdof/NlcafJ/j8EgfQqQsCOHbIBU+
    mJ3vjECPrabMFb6vt5aw15o0AEpABNB/+GEKG8XrQKLknTAeia68QT5qPyvAFh5pmFuiJJ
    GI4eTllCmkCZ2ZU1w+DfOspIhtEEUpUw3dcHLl6k/DVgCwbatWG/Buy+K1yjIlH5Ne3Km6
    +ANYAdJ/W9tF6qhxuy3dCwYspoGYH2YjR1SrbD0OmB3ahNDVZbH22y2u9gBmXILAQns+26
    A7jOZuEBf3vKw7bZpMrGdDmKUeH2wY4FMg3R94ortdxxwDxBJaCXnl9YGpxdGYrElovmZd
    uIPdXYPX1uETlFAamiSd9TDf+46RhYC/9mFwjbScoUsggPz99oWUtoBM5mnA
X-ME-Proxy: <xmx:u670aoeClApmTzczlHgeUVl7j4D2d0wbJjYc489Frr68-4joJvMPwQ>
    <xmx:u670al4UJCN0KVoFyijJWCN1KDKthtCXHROrwhbeCL7JaqcYmAGS3Q>
    <xmx:u670ahgUARxxeT_wKjb7j8oW59Bo2rKnuo24DqFu25C7HrCOaIlY9g>
    <xmx:u670asGtXX-EhtPLMO-6ChxBXh9ZzJJ0qpz9P60pIDT9SNusYi6HxA>
    <xmx:u670akXCc3HiQJGZHOORGx0sjgtXll6D_SuQ8-15tgxSr6s-CMfdz_Nb>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Nov 2026 13:06:50 -0500 (EST)
Date: Wed, 11 Nov 2026 18:06:49 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Ye Liu <ye.liu@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] mm/huge_memory: prevent losing PG_waiters in
 __split_folio_to_order()
Message-ID: <avSupujJqz18VDva@thinkstation>
References: <20261110-fix-split_folio_to_order-race-v4-1-cc5042f33408@nvidia.com>
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
In-Reply-To: <20261110-fix-split_folio_to_order-race-v4-1-cc5042f33408@nvidia.com>

On Tue, Nov 10, 2026 at 10:19:25PM -0500, Zi Yan wrote:
> __split_folio_to_order() calls prep_compound_page() on each new head page
> to create a compound page after clear_compound_head(). prep_compound_page()
> uses non atomic __SetPageHead(). It is mostly OK, since the folio is locked
> and frozen and no one else is supposed to modify the folio's flags.
> 
> However, code calling migration_entry_wait() can reach the folio by PFN,
> then access its flags. It is because softleaf_entry_wait_on_locked() used
> by migration_entry_wait() sets PG_waiters concurrently without taking a
> reference and the frozen refcount during split cannot block it. Meanwhile,
> __SetPageHead() does a plain read and write, so PG_waiters atomically set
> by softleaf_entry_wait_on_locked() will be lost if the set happens after
> __SetPageHead()'s read and before its write.
> 
> One example code interleaving:
> 
> CPU0: __split_folio_to_order(new_order>0)  CPU1: do_swap_page()
> 
> 1. clear_compound_head(new_head)
>    new_head->compound_info = 0
>    (page_folio(new_head) == new_head now)
> 
>                                            2. migration_entry_wait()
>                                              softleaf_to_folio(entry)
>                                              page_folio() -> new_head
>                                              (not the old head any more)
> 
> 3. prep_compound_page(new_head, new_order)
>      __SetPageHead(new_head)
>        tmp = new_head->flags.f  <-- load; PG_waiters == 0 in tmp
> 
>                                            4. folio_set_waiters(new_head)
>                                              set_bit(PG_waiters, &flags.f)
>                                              enqueue on waitqueue, sleep
> 
> 5.     new_head->flags.f = tmp | (1UL << PG_head)
>        <-- store; overwrites step 4, PG_waiters == 0 again
> 
> Later, folio_unlock(new_folio) sees no PG_waiters, skips folio_wake_bit(),
> and CPU1 can remain blocked indefinitely.
> 
> Fix it by setting PG_head along with other flags in new_folio->flags before
> smp_wmb() and clear_compound_head(). The remaining compound page metadata
> is set after clear_compound_head(). In that way, after
> clear_compound_head() makes new_folio visible, nothing overwrites the
> PG_waiters from softleaf_entry_wait_on_locked() by modifying
> new_folio->flags non-atomically.
> 
> While at it, use data_race() to suppress the KCSAN issue reported by Ye
> Liu's patch (the second Closes) on reading folio->flags in
> __split_folio_to_order().
> 
> Suggested-by: Kiryl Shutsemau <kas@kernel.org>
> Reported-by: David Hildenbrand <david@kernel.org>
> Closes: https://lore.kernel.org/all/DMHE8BEEER1H.2BIY52NXATPIA@nvidia.com/
> Reported-by: Ye Liu <ye.liu@linux.dev>
> Closes: https://lore.kernel.org/all/20261029-data_race_huge_mem-v1-1-112e331291c1@linux.dev/
> Fixes: c010d47f107f6 ("mm: thp: split huge page to any lower order pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
