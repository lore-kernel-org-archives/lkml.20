Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640143B42F6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431745; cv=none; b=OPPlTLWYP/60Tgtu+TaAX3tcjucNO9FMD3jV5J2T5sqdnPL5joXVVZ+Zg+MtjhCJsskBsR2O6aU6r+nXk/1iat2VwBpi0jAr3+2I8+Yz+X3PFJiXfX/bd4Z9Bi8bbYokij4AKCKznaBfDUOH9N6TJ8L+kBnqJz+ot+ECpcdLCZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431745; c=relaxed/simple;
	bh=ZePdFWReb/TXc0/dLbi31llGXB2xvKwF/KGOjRhd1vE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjrxF5F1Wsrob+xhtFSmHoP6uI4JRCuLLcNiZ83Y1vhE6AnLmMGwPUDY8XLjCvsEqj/EYz7AgBNuqNtOE2ENqFPX+YYV9doBV+4o2NAoavGe8ozKXxkN/oT2IG2tUhuw7PTJ5bvFB2PvuMNpTr+RHYCTdAOl9LLocDwsZMpjAig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcIHOY71; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcIHOY71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DDE1F00A3A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788431736;
	bh=2DmMIO1ElFEdHdnzG6JsJd7rREUzvxjOyIHl3mgXY84=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KcIHOY71Lxm7IiSLojJ3tzy5vSnMyc/vEN7u45R8OQ6GgGW6KGz8tY0EbyuTf0vep
	 U4mNC5XFHcNyIoAX7RJpC/SBujvNO7tSlvt1wiGJYr0sG7303SuSXRQrUE4WpZbTcx
	 fbrKrtgw4+QcI669G1dmAT06QY/kV/VDUaZV205d/TAAqy+lGoZiH5HgGaZ9YPfxR4
	 En5GD8AVnHxo5g6Ofzp1fNTdzcNIKSmteAlelZ/Qff5JdaxridZq9wD90el8z2+FTo
	 jJTmCFYklnC7TIissR0+niRjAaasRqMxnKZD7CcVHTpmrVsag3QHvGUkYVNyWB0B6H
	 WkGrutyiCKFTw==
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90cd43bd740so22602356d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:35:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwc1ABZCAdGPcOnIGnYBB33DDM0HtIOnUJZ24RyyK5DNOBkrCerVfHI4tn5Bxhf1/308DT9I7fyxmqVJzo=@vger.kernel.org
X-Gm-Message-State: AFuF++lc5PiOITXjMzMj69ZiIEXHqLymvokArRzjIm68Bm7rmHzNm7xj
	cJWwZd8urfLcfm6xxcV7JsEaRhHapgEbfpVkDOdbGkxgDfpv63Sjzde6MyZ5qBx0/mo8WQA20gy
	WQHIa732WUvR9QRhTgPv9qHluZPTEJ10=
X-Received: by 2002:a05:622a:1452:b0:51c:1132:c80d with SMTP id
 d75a77b69052e-53036d20556mr117183501cf.28.1788431735642; Thu, 03 Sep 2026
 03:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
In-Reply-To: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 3 Sep 2026 18:35:24 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z+SgetmjVD8bcOFisKNd9CFqe6kNcYcFtVd-PijYJ04Q@mail.gmail.com>
X-Gm-Features: AcwNN1Ux8M4d6A_TmjKucxqe-u61smpIYGpG5JYtI1eeT8wYBXmf61kss7VaqpQ
Message-ID: <CAGsJ_4z+SgetmjVD8bcOFisKNd9CFqe6kNcYcFtVd-PijYJ04Q@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, david@kernel.org, 
	mhocko@kernel.org, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:02=E2=80=AFPM Bo Zhang <zhangbo0325@gmail.com> wr=
ote:
>
> We have observed some cases where memory is allocated with GFP_NOIO, so
> we cannot reclaim any anon folios unless they are in swapcache. We can
> end up spending more than 150 ms looping in `shrink_folio_list()` scannin=
g
> non-swapcache folios without reclaiming a single folio. This is pure
> overhead.
>

Yes. The coexistence of `GFP_NOIO` and anon rmap scanning seems
nasty. We might also want to do something like the following, but
the side effect is that it might keep a folio while preserving its
PTE young state, indirectly making the folio semantically hotter.
So this may not be a good option. Skipping anon scanning in the first
place seems more sensible.

diff --git a/mm/vmscan.c b/mm/vmscan.c
index ba7adf36e69f..f15aa3573030 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1248,6 +1248,19 @@ static unsigned int shrink_folio_list(struct
list_head *folio_list,
                        }
                }

+               /*
+                * Don't waste time doing rmap and scanning PTE access for
+                * non-reclaimable folios.
+                */
+               if (!do_demote_pass && folio_test_anon(folio) &&
+                   folio_test_swapbacked(folio) &&
+                   !folio_test_swapcache(folio)) {
+                       if (!(sc->gfp_mask & __GFP_IO))
+                               goto keep_locked;
+                       if (folio_maybe_dma_pinned(folio))
+                               goto keep_locked;
+               }
+
                if (!ignore_references)
                        references =3D folio_check_references(folio, sc);

@@ -1281,10 +1294,6 @@ static unsigned int shrink_folio_list(struct
list_head *folio_list,
                                !folio_test_swapcache(folio)) {
                        int ret;

-                       if (!(sc->gfp_mask & __GFP_IO))
-                               goto keep_locked;
-                       if (folio_maybe_dma_pinned(folio))
-                               goto keep_locked;
                        if (folio_test_large(folio)) {
                                /* cannot split folio, skip it */
                                if (folio_expected_ref_count(folio) !=3D

> This is particularly true on systems using zRAM, where swapcache is
> relatively rare. So let's check whether anon reclaim is allowed by
> GFP_IO and whether there is enough swapcache to make it worthwhile. If
> the swapcache is extremely low, we're essentially searching for a
> needle in a haystack, so let's avoid scanning anon in the first place.
>
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> ---
>  mm/vmscan.c | 62 ++++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 40 insertions(+), 22 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 56708d1d2dfd..192bd0980121 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -339,6 +339,42 @@ static bool can_demote(int nid, struct scan_control =
*sc,
>         return !nodes_empty(allowed_mask);
>  }
>
> +static struct lruvec *get_lruvec(struct mem_cgroup *memcg, int nid)
> +{
> +       struct pglist_data *pgdat =3D NODE_DATA(nid);
> +
> +#ifdef CONFIG_MEMCG
> +       if (memcg) {
> +               struct lruvec *lruvec =3D &memcg->nodeinfo[nid]->lruvec;
> +
> +               /* see the comment in mem_cgroup_lruvec() */
> +               if (!lruvec->pgdat)
> +                       lruvec->pgdat =3D pgdat;
> +
> +               return lruvec;
> +       }
> +#endif
> +       VM_WARN_ON_ONCE(!mem_cgroup_disabled());
> +
> +       return &pgdat->__lruvec;
> +}
> +
> +static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
> +               int nid, struct scan_control *sc)
> +{
> +       struct lruvec *lruvec =3D get_lruvec(memcg, nid);

https://sashiko.dev/#/patchset/20260903040131.4016290-1-zhangbo56%40xiaomi.=
com
sashiko says:

"Will this cause a kernel panic during global reclaim when memory cgroups a=
re
enabled?
When can_reclaim_anon_pages() is called for global reclaim, memcg is NULL.
Since get_lruvec() is called unconditionally with this NULL memcg, it will
trigger the VM_WARN_ON_ONCE(!mem_cgroup_disabled()) and return the raw
node lruvec (&pgdat->__lruvec).
When lruvec_page_state() is then called with this non-memcg lruvec:
mm/memcontrol.c:lruvec_page_state() {
    ...
    pn =3D container_of(lruvec, struct mem_cgroup_per_node, lruvec);
    x =3D READ_ONCE(pn->lruvec_stats->state[i]);
    ...
}
Because the lruvec is actually embedded in pglist_data rather than
mem_cgroup_per_node, won't container_of() produce a wild pointer, leading
to a fatal out-of-bounds memory access when trying to read the stats?"

it seems we could just use mem_cgroup_lruvec() instead:

 static inline bool reclaimable_anon_is_low(struct mem_cgroup *memcg,
                int nid, struct scan_control *sc)
 {
-       struct lruvec *lruvec =3D get_lruvec(memcg, nid);
+       struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, NODE_DATA(nid));
        unsigned long anon_pages, swapcache;

        if (!sc || (sc->gfp_mask & __GFP_IO))

I applied your patch on my PC with the above change. I didn't see any
panic or run into any problems.

Best Regards
Barry
