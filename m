Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A5E282F01
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816342; cv=none; b=Hyiy2qGEE6WUTNRZ/lCFfQ+B6f5fp/GRvmdv7nqfgtGhSS3zGvMI3vRyRjAV5THpp6LmN0LSd+poNwmbZQ8Fvj0iVTMl2TNxP+FEkpl9RYBRRWnpvYGsq9qKFch1CWJBrqovWBB3oGc/5W/1acd+7cwEtp5tNTZ+P6qQXQzXnbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816342; c=relaxed/simple;
	bh=eoIX6dfp9PvxMLCBAwmoCGgeulLVrGEEBH6Z/48OpS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljkqqlwTXHDp+wtrK9N5FTmF3eND5olXSq/NY7EmsrkSxA4ubHYTYl9W/HrFiri4fous5ujNR2yDMfzipzLQUGctH/NZFhw3yn/NMPPBUl4Gxl9griiiBxAqbY/4mR3IPKTb1gaJNY7mZn+1WIXihqMfeke0fjipAhMOYmJ5ziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iwm9d6OO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iwm9d6OO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699291F00A3A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788816340;
	bh=o8uWLgf2KcII+oUuy388tsezKw2Fquxd0BJBB5QiqWA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Iwm9d6OOiJyAE8AqAqjJUODvHCom7TDHELUEXfNkQjhyTDhuJecUTpIgBoN/5znrU
	 MjkmpiwzUNonuxc21m7dBV/viztyr+0LqZMZJGoXozpQigHBg7BBemok/9IzFryAHF
	 Jm7zs1//IzVfr+AKCEEwRQ3DKZgR82JKOlj3x6CbtFn5LfGYmNzQp7m6rFPl8NXien
	 5hw7m+n9J1Q2h/VFt20Beq4W2hexgzi0xD4Ij/9zT7Lr/gBHSCnYk1W477jW3htjs2
	 37+FJpdlU2dAYUREhyrYeT4kxelyhk8JAQvYQ1D6AB4QuTN7P+Hy1wPq2U6tvI+tnK
	 d1BnFqrfJRvqg==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9399daa3d43so149819085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:25:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxi9CmDunPHO3CRCbDfFauccvzdbUPGHh/sUtiAAXC7ym9Wd1pI1dQfFNgr9sUTcCQEiylyPAfKpk0/DMM=@vger.kernel.org
X-Gm-Message-State: AFuF++lPynClQ31jXVJJuDMGKC6FpBqcViY3RIVHpsEYf6Hv7vomks19
	EvOLHeluWhmkcdAw3ReUPok6r4FOsz+CQA7EtP1S+s30AQUl8ct5Vjqs0eCx5H9XJEZpa76VYBN
	vCCqmNPLDhYdDjLT1FMilzvYtX38JRWg=
X-Received: by 2002:a05:620a:bce:b0:939:993e:bffb with SMTP id
 af79cd13be357-939993ec19amr1728644585a.22.1788816339633; Mon, 07 Sep 2026
 14:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907122757.748111-1-zhangbo56@xiaomi.com>
In-Reply-To: <20260907122757.748111-1-zhangbo56@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 8 Sep 2026 05:25:27 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zRK8m_cfyNfO502=1guMN52dZipN+26HfpDya0gWE7GA@mail.gmail.com>
X-Gm-Features: AcwNN1W6YuLyePWvCuNneS0jRtJGGoa4mYoVops6zpx8tN8nObhQVDsZlT2VVA8
Message-ID: <CAGsJ_4zRK8m_cfyNfO502=1guMN52dZipN+26HfpDya0gWE7GA@mail.gmail.com>
Subject: Re: [PATCH v3] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, david@kernel.org, 
	mhocko@kernel.org, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 8:28=E2=80=AFPM Bo Zhang <zhangbo0325@gmail.com> wro=
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
> dm-bufio, which legitimately use GFP_NOIO because they run underneath the
> IO path:
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
>
> Note this only addresses the traditional active/inactive LRU. MGLRU
> selects anon vs file scanning in its own path and is not covered here;
> fixing the MGLRU case is left as a TODO.
>
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> ---
> v2 -> v3:
>  - Fix stats source in reclaimable_anon_is_low(): for global reclaim
>    (memcg =3D=3D NULL, e.g. from set_initial_priority()) use node_page_st=
ate()
>    instead of mem_cgroup_lruvec(NULL), which resolves to the root memcg a=
nd
>    excludes the child cgroups where anon actually lives. (reported by the
>    sashiko bot / AI review, raised by Andrew Morton)
>  - Add a comment explaining the heuristic and its rationale. (Andrew Mort=
on)
>  - Update the comments above the can_reclaim_anon_pages() checks. (Barry =
Song)
>  - Note in the changelog that only the traditional LRU is addressed; MGLR=
U
>    is left as a TODO. (Barry Song)
>
> v1 -> v2:
>  - Use mem_cgroup_lruvec() instead of get_lruvec(), which returns the raw
>    node lruvec for a NULL memcg and would be misinterpreted by
>    lruvec_page_state()'s container_of() during global reclaim. This also
>    drops the get_lruvec() move. (sashiko bot, Barry Song)
>  - Drop the SWAP_CLUSTER_MAX cap on the threshold; the check is purely
>    proportional now (swapcache below 1/64 of the anon LRU). (Barry Song)
>  - Expand the changelog with the workload, the dm-verity/dm-bufio NOIO
>    stack, the single shrink_lruvec() breakdown, and the aging trade-off.
>    (Johannes Weiner)
>
>  mm/vmscan.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 5 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 245f68c75b28..e5c07490f5b3 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -362,20 +362,62 @@ static bool can_demote(int nid, struct scan_control=
 *sc,
>         return !nodes_empty(allowed_mask);
>  }
>
> +static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
> +               int nid, struct scan_control *sc)
> +{
> +       pg_data_t *pgdat =3D NODE_DATA(nid);
> +       unsigned long anon_pages, swapcache;
> +
> +       /*
> +        * A !__GFP_IO reclaimer can only reclaim anon that is already in=
 the

I'd rather call it a GFP_NOIO reclaimer than a !__GFP_IO reclaimer.
But they're really the same thing. :-)

> +        * swapcache (adding anon to the swapcache needs IO). When swapca=
che is
> +        * far below the anon LRU, scanning anon reclaims nothing and onl=
y burns
> +        * CPU; the aging it would do is merely deferred to later __GFP_I=
O
> +        * reclaimers. The 1/64 threshold keeps this to the case where an=
on is
> +        * effectively unreclaimable.

Let's keep it a little shorter. Maybe we can drop
"the aging it would do is merely deferred to later
__GFP_IO reclaimers."

> +        *
> +        * Use the memcg's lruvec for memcg reclaim; for global reclaim
> +        * (memcg =3D=3D NULL) use node-wide stats. mem_cgroup_lruvec(NUL=
L) would
> +        * only see the root memcg, not the child cgroups where anon live=
s.

This is already self-documented, so do we need this?

> +        */
> +       if (!sc || (sc->gfp_mask & __GFP_IO))
> +               return false;
> +

Sashiko is concerned that this might negatively affect MGLRU,
so maybe:
/*
 * FIXME: MGLRU doesn't fully respect can_reclaim_anon_pages()
 * for the scanning type
 */
if (!lru_gen_enabled())
    return false;

We=E2=80=99ll need to address MGLRU with a much larger patchset as commente=
d
by Kairui[1].

> +       if (memcg) {
> +               struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat)=
;
> +
> +               anon_pages =3D lruvec_page_state(lruvec, NR_INACTIVE_ANON=
) +
> +                            lruvec_page_state(lruvec, NR_ACTIVE_ANON);
> +               swapcache =3D lruvec_page_state(lruvec, NR_SWAPCACHE);
> +       } else {
> +               anon_pages =3D node_page_state(pgdat, NR_INACTIVE_ANON) +
> +                            node_page_state(pgdat, NR_ACTIVE_ANON);
> +               swapcache =3D node_page_state(pgdat, NR_SWAPCACHE);
> +       }

Sashiko is concerned that `NR_SWAPCACHE` might be undefined for
!CONFIG_SWAP. That seems reasonable to me. I think we can do:

#ifdef CONFIG_SWAP
static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
               int nid, struct scan_control *sc)
{
    ...
}
#else
static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
               int nid, struct scan_control *sc)
{
    return true;
}
#endif

Actually, returning either true or false makes no difference for
`!CONFIG_SWAP`, as `get_nr_swap_pages()` will definitely return zero.
However, returning true seems semantically more correct.

[1] https://lore.kernel.org/linux-mm/CAMgjq7B=3D=3DMqHXa6H=3DarrQ9a0bUXWpXG=
_a5EBxZGjLjYUuEf1gQ@mail.gmail.com/

Best Regards
Barry
