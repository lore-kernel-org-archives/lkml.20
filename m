Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E015917B425
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 04:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670407; cv=none; b=bG2RAfgRBQqJMr8G2oBLsDmnlITWMwS0JZbYs3bio4N7xXja3EFIWByEMR0YZdfOst1yhIBSBXNNz1607TvWZjyXod6aWR1C/5uKGneEI1soygG+j1AUW2yVaEcZgPYYcPfGPjojK4N/CZZMroriS8xlUXWjumtir9GWjF3jnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670407; c=relaxed/simple;
	bh=l7x+N6N/ZvwqhN/OQNu3u8BGjp7WuCksGLi7TjqMWGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OtTWRcBYL5rguDooLBKSS7Rqa2KIx8XJ/JcPrHG9xesJGrB4dUxII0vJMaUH7bDKkm19DFhcWLeXmthGzilW6s8ZTX6OEsAmZPgwpUdvcGDTmq5A5b0nmj0AFDH+YdiU/lgldzImO9yr3mTaxkcb3760GioVwOPhU/hx2Ht9Q+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfmVe5Dm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfmVe5Dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EF91F00A3F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 04:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788670405;
	bh=FBpLxV9K4fd0pw4R7ASGCgVLbVUR2ydI6gQ0iBxrJdY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AfmVe5DmUttmx7hbq0HSprK9Iew7fyroN3lU1jpnb/mqE8LLBddtmyvXFIqAFAjr6
	 /CY3x5OFfGovkWlPMrubDwuCHJrNd14pEqy/XW0gbc7Uqf5Tg838G+umJ/8/P+45nu
	 ulRVP7FoWCZzkeXqI+AuuDc8tSEn34wGZaqARyM6XPYGSogbiZ81xcOB5Qm2RVTatq
	 QTBAz83FqwEUe5Gatc17Dy/ZN/bizd4yt7arHLyk4uJS3/TuA4Do8BFZ7TdpOT5rID
	 wpBOJhi2nLcEaDYCF78KO3iH9Tjd6l4cTodTADPFFxBp3rsyKbl51TCZ3AoDGZC7sJ
	 lIJt72UVa/xqQ==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e50a650a0so244046685a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 21:53:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBySeqIDpgmSoL+qrKdKfPBJShF8oy3YAKYx6wV7ZtIZG8J3p6to4QRtuNcVcyVn8gjBpg+5Fo+rXTZvjC8=@vger.kernel.org
X-Gm-Message-State: AFuF++mVWZH773tgPoXrEfGO+IXrN5izPHIo/YzIO5kbknJp5BS8o78d
	m5TKjBKW3pp68n/JP2ViRte1W3xGNcpLz/MK7Aooi+4sxK3syBf1mwQhKzquKOK6n4ru5gJf0wh
	2wllJzt8LhBejYROn3chblwItKnqgrBs=
X-Received: by 2002:a05:620a:3709:b0:939:6de6:951a with SMTP id
 af79cd13be357-939804afa10mr1607211385a.49.1788670404878; Sat, 05 Sep 2026
 21:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903040131.4016290-1-zhangbo56@xiaomi.com> <20260906011820.382381-1-zhangbo56@xiaomi.com>
In-Reply-To: <20260906011820.382381-1-zhangbo56@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Sun, 6 Sep 2026 12:53:13 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wC78QDTrETC0WpnouN=8aF8ae6Yxgb+oKiOP3A76ATLg@mail.gmail.com>
X-Gm-Features: AcwNN1U31LSzO7YBa1SFKsy6rtphWk4ZWlZsnKoVZhU0-ugmakYQy57PdKBT6oQ
Message-ID: <CAGsJ_4wC78QDTrETC0WpnouN=8aF8ae6Yxgb+oKiOP3A76ATLg@mail.gmail.com>
Subject: Re: [PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, david@kernel.org, 
	mhocko@kernel.org, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 9:18=E2=80=AFAM Bo Zhang <zhangbo0325@gmail.com> wro=
te:
>
> We have observed some cases where memory is allocated with GFP_NOIO, so
> we cannot reclaim any anon folios unless they are in swapcache. We can
> end up spending more than 150 ms looping in `shrink_folio_list()` scannin=
g
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
>
> To stay conservative, this only skips anon when the swapcache is really
> tiny - below 1/64 of the anon LRU - i.e. when essentially no anon on the
> list can be reclaimed without IO. Whenever there is a meaningful amount o=
f
> swapcached anon, the normal path is used and anon is scanned and aged as
> before.

I notice this only fixes the active/inactive LRU case. To address the
MGLRU case, it seems we may need a more fundamental change.

I'm fine with starting by fixing the active/inactive LRU case first.
However, could we mention in the changelog that this patch only
addresses the active/inactive LRU case, and that fixing the MGLRU case
is on the TODO list?

>
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> ---
> v1 -> v2:
>  - Use mem_cgroup_lruvec() instead of get_lruvec(), which returns the raw
>    node lruvec for a NULL memcg and would be misinterpreted by
>    lruvec_page_state()'s container_of() during global reclaim. This also
>    drops the get_lruvec() move. (reported by the sashiko bot, suggested
>    by Barry Song)
>  - Drop the SWAP_CLUSTER_MAX cap on the threshold; the check is purely
>    proportional now (swapcache below 1/64 of the anon LRU).
>  - Expand the changelog with the workload, the dm-verity/dm-bufio NOIO
>    stack, the ~168 ms single shrink_lruvec() breakdown, and the aging
>    trade-off discussed with Johannes Weiner.
>
>  mm/vmscan.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 245f68c75b28..e20ac2cb4dd5 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -362,6 +362,23 @@ static bool can_demote(int nid, struct scan_control =
*sc,
>         return !nodes_empty(allowed_mask);
>  }
>
> +static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
> +               int nid, struct scan_control *sc)
> +{
> +       struct lruvec *lruvec;
> +       unsigned long anon_pages, swapcache;
> +
> +       if (!sc || (sc->gfp_mask & __GFP_IO))
> +               return false;
> +
> +       lruvec =3D mem_cgroup_lruvec(memcg, NODE_DATA(nid));
> +       anon_pages =3D lruvec_page_state(lruvec, NR_INACTIVE_ANON) +
> +                    lruvec_page_state(lruvec, NR_ACTIVE_ANON);
> +       swapcache =3D lruvec_page_state(lruvec, NR_SWAPCACHE);
> +
> +       return swapcache < (anon_pages >> 6);
> +}
> +
>  static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
>                                           int nid,
>                                           struct scan_control *sc)
> @@ -371,11 +388,13 @@ static inline bool can_reclaim_anon_pages(struct me=
m_cgroup *memcg,
>                  * For non-memcg reclaim, is there
>                  * space in any swap device?
>                  */
> -               if (get_nr_swap_pages() > 0)
> +               if (get_nr_swap_pages() > 0 &&
> +                   !reclaimable_anon_is_low(memcg, nid, sc))

Can we also update the comment above accordingly?

/*
 * For non-memcg reclaim, do we have space on any swap device?
 * For GFP_NOIO, do we also have sufficient swapcache anon folios
 * to reclaim?
 */

>                         return true;
>         } else {
>                 /* Is the memcg below its swap limit? */
> -               if (mem_cgroup_get_nr_swap_pages(memcg) > 0)
> +               if (mem_cgroup_get_nr_swap_pages(memcg) > 0 &&
> +                   !reclaimable_anon_is_low(memcg, nid, sc))

Do we also need to update the comment?

/*
 * Is the memcg above its swap limit, and does it have enough
 * swapcache anon folios to reclaim for GFP_NOIO?
 */

Best Regards
Barry
