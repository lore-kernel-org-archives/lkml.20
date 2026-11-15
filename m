Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770143;
	b=jQ6Ry3shZ3OnaK6WkIhLYvILXC/mDDat6YT7rEokpWniwPNcVHAHEdOSkUCajQtFtESy
	 M9qV/UcSKyM8SZTOn+hmlh8YvN2NSl+Ic7Sxgoqa7ldQI2UfGEwqLJTy6fnroqY36/Ug3
	 ovCdyW7UEuHu1YAe44p7mypdHtDA/hbA+HFiWmO9m9rRKo9IUZ3LZPhetWSnqsbx7Gy7l
	 qdrbrtBzSFk9ZL5VRvq1GXp1WREjt4CTSanz4OxP9TAkOqdXARzNEQFOEpWWwMW/9VT9p
	 6EFe6p5YjmiIBLSPtr4zRsbbqicjvHaxHQ30F/K2UW62zL+54PTKjvkMbNlkloBQvMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770143;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=imsZLV1/j0+7+KQo/YR+v0zfeVAOnZjjS01+bde7pqM=;
	b=eWzqPJDonizvOLjcro2QbWU7DMKG+BWg3EZf0CL6XseDSrIK1H6iiEmV6wsfd4fJmQdP
	 wvIXGqUGNFWFBacZAVq/UTxk6TcpFLhReKbevrZcoaC/GFcqSR65pOGwul4VD03/XMRhG
	 Ss6G2tjVo4mJxYbRmtbz4R1ciLqGxws/xSsJrOQKvk8Y0c/0NhQ1hsl9FAF9sJQ9iSLh1
	 0VOGyBjxtVs4oOnWPLODZsCg25C8NRDP2nh/cJGEuAgEBL+5wk8xx5tb5UHvojOLHApLS
	 PEoV7yAfJjqnV+cfGgItaN+aGMlgDOWSu2vjwOUtF+j6aHnR+5sjoA6n8bQ/XBmGEMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TW8KkMVV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832BC606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TW8KkMVV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAF31F000C4;
	Sun, 15 Nov 2026 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770143;
	bh=imsZLV1/j0+7+KQo/YR+v0zfeVAOnZjjS01+bde7pqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TW8KkMVVMt9rUebi+zjgSZeFR8dzjW+WW8lkEDR9+0OyBBjcLrxgfV1QiP6Ga9xN1
	 Mv2ZIus5IzsKI5EV6bDzJsyYouyrB9kWEnWor2Qa/iOR6bzYSEgfmpA76UCjizmSXM
	 yk5kkX9u+biqZxjvSVR/Q1Csbdcf4Wpi2KB90Np48Yuk1nTBCzqem+AMYq7eT8FpTN
	 1OlUKB3wbkBSzQKcJg+9YTd6mfDVyZOKyCgAVxefrcHegL8yZMhrCAUrrCjXGia4+O
	 kC/q0TdFfjlcZBrpcXPGorhvztkXW6AARCi/vZgAisoAfDUP5lFYWL0CJGOhMVsw3f
	 jxT9+WKeaN9Ng==
Date: Sun, 15 Nov 2026 19:15:39 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: shao.mingyin@zte.com.cn, akpm@linux-foundation.org, linux-mm@kvack.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/util: fix off-by-one when checking folio index in
 snapshot_page()
Message-ID: <avn08-MVyt7wDfF1@lucifer>
References: <20261115004657890Pz8ERDf5nCtE-B6M7KFzu@zte.com.cn>
 <avibe0HG4ssUUuBX@gremlin>
 <72dc7b45-ad20-450b-8ec7-3e86be8a41f8@kernel.org>
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
In-Reply-To: <72dc7b45-ad20-450b-8ec7-3e86be8a41f8@kernel.org>

On Sun, Nov 15, 2026 at 06:32:12PM +0100, David Hildenbrand (Arm) wrote:
> On 11/14/26 18:33, Lorenzo Stoakes (ARM) wrote:
> > On Sun, Nov 15, 2026 at 12:46:57AM +0800, shao.mingyin@zte.com.cn wrote:
> >> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> >>
> >> mm/util: fix off-by-one when checking folio index in snapshot_page()
> >>
> >> snapshot_page() computes the page index before copying the folio state.
> >> If the folio changes between those reads, the index can equal the copied
> >> folio's page count. Valid indices are strictly less than that count,
> >> but the current check accepts equality and marks the snapshot faithful.
> >>
> >> Use >= so that this inconsistent snapshot is retried, or falls back to
> >> the unfaithful single-page representation. This also avoids reporting an
> >> out-of-range folio index without the corresponding dump_page() warning.
> >>
> >> Fixes: d863a12108f2 ("mm/util: introduce snapshot_page()")
> >> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> >
> > NAK.
>
> Let's do the following:. Thoughts?
>
> From c7d1a79926e3b3448bb5e84f901c185234f43b52 Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> Date: Sun, 15 Nov 2026 18:11:08 +0100
> Subject: [PATCH] mm/util: fix retry detection and handling in snapshot_page()
>
> snapshot_page() detects races with concurrent folio split+construction by
> checking whether the given page still falls into the folio. Unfortunately,
> we have an off-by-one error in there, and we should be checking for
> "ps->idx >= nr_pages", because idx 0 is valid.
>
> For example, we might currently report a tail page at idx 1 as faithful,
> although the snapshotted folio is now a small folio.
>
> However, there is one complication: As we don't hold a folio reference,
> folio_nr_pages() can return 0 on races (or when called from page freeing
> code). Handle that by just setting it to 1 in that case, so we don't
> wrongly report a head page as "page does not match folio".
>
> In addition, we should reset ps->flags when retrying, by just resetting
> it to PAGE_SNAPSHOT_FAITHFUL. Otherwise, PAGE_SNAPSHOT_PG_BUDDY and
> PAGE_SNAPSHOT_PG_IDLE from a failed attempt could stick around.
>
> These races are fairly rare, so this is not really critical, we simply
> report something slightly wrong. No need to CC stable.
>
> Fixes: d863a12108f2 ("mm/util: introduce snapshot_page()")
> Reported-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Yeah this is reminisecent of other patches from the same batch I saw in
that the original didn't quite fix the problem correctly :)

Thanks for this! One small nit below but otherwise:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/util.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/mm/util.c b/mm/util.c
> index 80f6c714844f2..3b10d4c2a4fd9 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1406,9 +1406,9 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
>  	int loops = 5;
>
>  	ps->pfn = page_to_pfn(page);
> -	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
>
>  again:
> +	ps->flags = PAGE_SNAPSHOT_FAITHFUL;

set_ps_flgs() or's stuff in so it does need this it seems.

>  	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
>  	memcpy(&ps->page_snapshot, page, sizeof(*page));
>  	info = ps->page_snapshot.compound_info;
> @@ -1438,13 +1438,16 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
>  	if (ps->idx < MAX_FOLIO_NR_PAGES) {
>  		memcpy(&ps->folio_snapshot, foliop, 2 * sizeof(struct page));
>  		nr_pages = folio_nr_pages(&ps->folio_snapshot);
> +		/* On races, or when freeing pages, we can read 0. */
> +		if (nr_pages == 0)
> +			nr_pages = 1;

Nit but could be:

		/* On races, or when freeing pages, we can read 0. */
  		nr_pages = folio_nr_pages(&ps->folio_snapshot) ?: 1;

>  		if (nr_pages > 2)
>  			memcpy(&ps->folio_snapshot.__page_2, &foliop->__page_2,
>  			       sizeof(struct page));
>  		set_ps_flags(ps, foliop, page);
>  	}
>
> -	if (ps->idx > nr_pages) {
> +	if (ps->idx >= nr_pages) {
>  		if (loops-- > 0)
>  			goto again;
>  		clear_compound_head(&ps->page_snapshot);
> --
> 2.56.1
>
>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
