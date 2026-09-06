Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4D931E852
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 02:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788662765; cv=none; b=PtMwjgsrKREBP8iLgfqJP6Sf7Im3oB0btaNIJeoKP3nPTWQkhqQELqZyTpn4VvHt86dv216iLtSGdmaUgMoLOL4Quyv+R5dX8+S6VVoZbiCX9tYEiwHpWD1Q09WlDSFeU2KFDlg4c2HP5VPR1vN3opv1mi4n+doc+/LGPsKA82w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788662765; c=relaxed/simple;
	bh=OQOswUo/uZfxBO3DS8S0KcbZYNIRAkIWZe9KIuGTynU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aZDZ/7StJyyXLAG0K+djgv4uPZ3qP90FXfJ5Cdg7MpGtA/Sv55+ll+CYIJ/no594R/sMcaDFhdW6tMlcRpr4WwQ3fVQYPgMaTQm0mUAmdrs3rh6SVrYHP5R1SkRz0MaoCuFhj0qbrQyr/e9Odk8iz427G6FIAcZm+uUDr+2HaiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rvUVpcRn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rvUVpcRn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806DA1F00A3A;
	Sun,  6 Sep 2026 02:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788662762;
	bh=hDfNzBmxZzshjfLtQ92GgYPQBtbWM97n8wzTZoEhKU0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=rvUVpcRn29obM+0a72bypDmDA+R7gP9dNd38ca1FRe0Swd6tP2RM8NlusqCnjSxGA
	 gwi97AuATg7Ge7O1xq6jjEAbgoTY0d9r+mRt9Z14zJthiL8u/m+fl5FV/nEKFDAU3b
	 N3YpPS7zNIL7TNLO5HM5VRsjWKLd3Q81dWqqH4qM=
Date: Sat, 5 Sep 2026 19:46:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: hannes@cmpxchg.org, baohua@kernel.org, kasong@tencent.com,
 qi.zheng@linux.dev, shakeel.butt@linux.dev, david@kernel.org,
 mhocko@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache
Message-Id: <20260905194602.b88f549b9462033e40336db6@linux-foundation.org>
In-Reply-To: <20260906011820.382381-1-zhangbo56@xiaomi.com>
References: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
	<20260906011820.382381-1-zhangbo56@xiaomi.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 09:18:20 +0800 Bo Zhang <zhangbo0325@gmail.com> wrote:

> We have observed some cases where memory is allocated with GFP_NOIO, so
> we cannot reclaim any anon folios unless they are in swapcache. We can
> end up spending more than 150 ms looping in `shrink_folio_list()` scanning
> non-swapcache folios without reclaiming a single folio. This is pure
> overhead.
> 
> This is particularly true on systems using zRAM, where swapcache is
> relatively rare. So let's check whether anon reclaim is allowed by
> GFP_IO and whether there is enough swapcache to make it worthwhile. If
> the swapcache is extremely low, we're essentially searching for a
> needle in a haystack, so let's avoid scanning anon in the first place.
> 
> On Android this is triggered by dm-verity hash-block reads through
> dm-bufio, which use GFP_NOIO:
> 
>   verity_verify_io -> verity_hash_for_block -> verity_verify_level
>     -> dm_bufio_read_with_ioprio -> new_read -> __bufio_new
>       -> alloc_buffer
>          gfp: GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN
> 
> Such a reclaimer can land on a memcg with a large, unswapped anon LRU and
> a tiny file LRU (e.g. inactive_anon ~335 MB vs inactive_file ~4 MB, with
> negligible swapcache). shrink_lruvec() then keeps feeding that huge anon
> list into shrink_folio_list() - ~2400 shrink_folio_list() calls, ~93,000
> anon folios scanned - where every folio is kept because it needs IO. The
> 150+ ms above is one such single shrink_lruvec() pass (not accumulated
> across a reclaim cycle), and it reclaims nothing; the actual progress
> comes entirely from the file side.
> 
> Aging anon alongside file does have some value for a later __GFP_IO
> reclaimer, so it is not strictly pure overhead. But that aging is only
> deferred, not lost: kswapd and other __GFP_IO reclaimers still walk and
> age anon. Spending ~168 ms aging memory that this context cannot reclaim
> is not a worthwhile trade-off in a latency-sensitive path.

Thanks. That sounds like something we want to fix.

> To stay conservative, this only skips anon when the swapcache is really
> tiny - below 1/64 of the anon LRU - i.e. when essentially no anon on the
> list can be reclaimed without IO. Whenever there is a meaningful amount of
> swapcached anon, the normal path is used and anon is scanned and aged as
> before.

Argh.  The thing about magic numbers is that they're always suboptimal
for everyone.  But I understand that a full-on dynamic tuning setup is
a big project and hopefully not worthwhile.  And yet another /proc knob
would require quite some justification.

> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -362,6 +362,23 @@ static bool can_demote(int nid, struct scan_control *sc,
>  	return !nodes_empty(allowed_mask);
>  }
>  
> +static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
> +		int nid, struct scan_control *sc)
> +{
> +	struct lruvec *lruvec;
> +	unsigned long anon_pages, swapcache;
> +
> +	if (!sc || (sc->gfp_mask & __GFP_IO))
> +		return false;
> +
> +	lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
> +	anon_pages = lruvec_page_state(lruvec, NR_INACTIVE_ANON) +
> +		     lruvec_page_state(lruvec, NR_ACTIVE_ANON);
> +	swapcache = lruvec_page_state(lruvec, NR_SWAPCACHE);
> +
> +	return swapcache < (anon_pages >> 6);
> +}

I think this function deserves a comment.  One which explains why isn't
doing what it does rather than what it does.  That comment would
highlight the heuristic and explain the thinking behind it.

Also, AI review asks "does reclaimable_anon_is_low() incorrectly use
root memcg statistics instead of node-wide statistics during global
memory reclaim?".

	https://sashiko.dev/#/patchset/20260906011820.382381-1-zhangbo56@xiaomi.com
