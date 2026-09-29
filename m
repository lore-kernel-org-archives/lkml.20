Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A9522699
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689393; cv=pass; b=YpV7dGKMkf8lUPILWq0wRvCR8wCb+6pr2U1KHjH6i4H/x0E7NdoTnwTDS8lxoaCoZ24UR2BnsNUfWAxJT45lDiYG/21jWbSVvNX+G4mqD6OeK+bbDGGDPncN22fwdjgZ52DiI9SS3XojZefr04/k+lVdi+PMTxDTvyA2jahDVUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689393; c=relaxed/simple;
	bh=El+wNmYVFri0uWxI9Vo40dVJIxLa/Ci803bButn1Llo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z44G/8qxRmTTkVeWJ7pa0aw1BjxlycaDYz20XAQKlOwH+p0ZLZHOva8sYAjJWfyQ+sNgfpfRWGcown3Udq2M3+v9qspWHrcb7cdoCeVaMzKlKWIl89ET2yo+EkBI9NFcpCuUqiwz77G5ivxNTzQ2eQXvzOu/PZJZ8/6dCalE7NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1Rh07j/; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1Rh07j/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso15912155e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790689389; cv=none;
        d=google.com; s=arc-20260327;
        b=XiWLf7TY+wr90EwgBPR9Vagp3fy3CuM+qOXI4adVqI4dnlFm2VGte/HSftOXeLxJqK
         72VziTYQXm2ZFVyFjm9uFBJNtl52olwqmNkchMvB6SeHF+9HhC/dxne5khep2XxhitPA
         dzNxQuuJ2UGypouGcHcFPyT+p+wyy5S+/cTntF2tzbYXYQ75/UWf75KfMYIZavCdcv7/
         MYuIogrKK4MaoZNfeH+ibYV3PgcA+fvd2uO7NnoH4CB0eojcQchtP4nLvw/iKgP3ZYmz
         bzMU59kOk0UJpqBPggiXxn0X2UI2HFlJTT2xDPp4UMzeLH7VDCiykUVz9PfPzPE6//Zs
         iwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G7jnymnyh4wNs1wifMEqk5jjYIJtuGqcqWV2+z65JOE=;
        fh=/PM2Io1thU3sfJPoxSa7pc7+XwIpFHlDx0yjHpivQlg=;
        b=Ka/EDZuphHW7hti0uqBqMtdMXMd5JUa2RcLLj0ggE11c4PjmZVsmaat/iianMnBvsz
         jW9iQYCMnKE4iF/KXXUzOw4uF6QaeJtepL1y0AQdf3C+YRetu1hyW4XJdhrZKnCo/yVG
         B9MppCJ9ltzisJydVWzbth3xJ9bVdPS/VX4SCxbP/KeWUL+twaUPwr12tZ+0NqNdhXcn
         TrMZqYNJF4rb5g0IOilK3nk9Z2clGTr924kNDB65Z3QuA6zItKbnoHD/Faxk6scIQCdQ
         LKOoOheZjdZdOtwziQqeA0wmRy6jIeOxOxml5E8SGLO0aGg089GdlVN/tS/O6ZXmuP7r
         dDqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689389; x=1791294189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7jnymnyh4wNs1wifMEqk5jjYIJtuGqcqWV2+z65JOE=;
        b=S1Rh07j/CZKOauNdIFgMV7QTSJZ916VhVibHRyPopztZJURE42gRprDa9W1BglSPjk
         gs5O5xe3lZkmQnrOpPofPQlJoEtFMsZH9EQnPgoArPGKpGztQK6CFNJ8JTBs8NDD/Owt
         2hiDZ7ovsQNnt8aSgu8jJ7N4UFv2dZgjWYFagYJb5iel8Ew/HKaZLkmQdKS1eT7ZWSpG
         qeFO+uLUM/b3quzG4e5QVmaF9dzH6qBak02dxLJW1ZvNj2vTbrYfS/ImYZ/cd4NcW/9T
         6M1THXX9CYUA3ffcsarxWU0VYRUm9EyqA0+mkskgPhFNjh7iTnBk+/eYjJeSPD3xr7bW
         rzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689389; x=1791294189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7jnymnyh4wNs1wifMEqk5jjYIJtuGqcqWV2+z65JOE=;
        b=FFgQN5e412Y9NgiN4TMNOoP1IsfSP2pCwmUB9s+E+IlTxBYQSF3eZBdKOLWBQzsiVF
         XvgJ8FbbBXToTefZYlL4edduBXs7KnasBCqbL+cDgctXilcBcQ9nJpt7M6WDstD56sbR
         l3cj0Kll9VBH6bvzSyh5wmu1Ubx5r9SXgADLsei4ax3IN5UjI9PtxAUU7y+lrkYtiMCU
         qBfsGcCMJ/hTg6G83DYV6RoZ3iLg9TffDKkiJunm8jGkUAvjXHyNmARRIPxvFcdr9mwu
         WTc8pr+jXRnJyq6gLUecwJksB9V/FX3gj/WAGbwuxvoH9jrsJ3NP1gwA44Cyqg+mV59q
         puBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIXgmR4hq72fOoZBw4cfkQR9SNXHGJ1NqxuHFFu5pNefmfIIDYHh+VzYAAtsKm1q0eNK+w0vNH7WK7SdI=@vger.kernel.org
X-Gm-Message-State: AFuF++lSq9qlq1Utz2+z3F5bvrR/97vhZ8WDRFXoew9yrIxBNuHUktak
	eca8948L7U3FrHQoHVg6t9ICR6Ev7+PgZtHpSzYf347YvkcrAQI4Sbr82XgrITkN4uXphcKBEcE
	PLpXv9YGGdYpj6RZeW1VAOTGZdtthY1Y=
X-Gm-Gg: AYBFou2lN7512LisU4gjmqy9XnE2GHkDnpu269TZSkYNW4BNyuejEGfEEOU41ixnZl6
	PVIcNCMHcozHw1HPBE4jFFifGEWHY7JkcIK/HYcd8xU0wve6x8GEUq72/iOByx5j706mEHIGunw
	Cnd6Z7kGRk2jP4mPW+sjs+SNaj/PyfSI+iMAzUBfAtijlTnnkoRPFjbQdVbGD1/3jP4W+hH85MB
	sTxEg/+FvR3QZmLNFwdXSQ67OCVZ311RU9/Wgp80ytWrok2hCplvsmnI9/adt0kisNMA4xK3a4L
	+OJVS4+88hhOShYFuRNYVE24sT/R3YeS8GC45faxIt48CZIQnZ7nW/snUaCgtcrfxvJ3MOVX5C0
	6n1VhLYq56MKtQXhawskwnb8SztQ=
X-Received: by 2002:a05:600c:4f12:b0:49f:ce78:356b with SMTP id
 5b1f17b1804b1-49fe6700d0cmr318694515e9.28.1790689389342; Tue, 29 Sep 2026
 06:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928081900.4187482-1-alex@ghiti.fr> <20260928081900.4187482-5-alex@ghiti.fr>
In-Reply-To: <20260928081900.4187482-5-alex@ghiti.fr>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 29 Sep 2026 14:42:56 +0100
X-Gm-Features: AclHuK-OCCz_Kk4JrZVxkgoxQbXuwZbmMTzsZTD2RNK7ANS1v8asaSklELSJmjw
Message-ID: <CAKEwX=PJjGe3kjYCHwxijaZ+W8HvOiNQTTS-Da1R02hPW=kCDA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] mm/zswap: move reclaim-driven writeback to a kworker
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, cgroups@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:23=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:

I understand the problem this patch is trying to solve, but this
solution seems more involved than the changelog suggests :)

>
> zswap_shrinker_scan() writes back in whatever context reclaim called it
> from: an application thread inside a page fault, or kswapd reclaiming
> for the whole node. Now that the cgroup IO controllers throttle zswap
> writeback, that context sleeps uninterruptibly until the owning cgroup's
> IO budget allows the write. Such stalls were observed on a large
> production workload.
>
> So defer the writeback to a kworker: each lruvec has its own work item
> on shrink_wq, which writes back what reclaim asked for, SWAP_CLUSTER_MAX

Ahhh, so it's one work-item (added to the shared shrink_wq)
per-lruvec, not one kworker or thread per-lruvec.

Hmm, supposed multiple tasks in a cgroup enter direct reclaim. In the
past, the amount of writeback submission will scale with the number of
tasks entering reclaim. But now, it's just a single work item
per-lruvec - IIUC, the submission of his work item is idempotent, so
it wouldn't scale like that anymore, right? I haven't wrapped quite
wrapped my head around this, but this sounds like a non-trivial
effect...

Also, do we need to defer writeback submission for proactive
reclaimer? Or kswapd? Only direct reclaimers have concerns with the
latency blowup from the throttling right?

There are a couple more behavioural changes, without proper
justifcation or mentioning in the changelog. More details inlined
below:

> entries at a time, while holding a reference on the memcg. The shrinker
> does not queue more work while the worker has yet to claim the previous

Why not?

> one, and reports nothing freed, as nothing is until the worker runs.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

[...]

> +
> +static bool zswap_defer_writeback(struct shrink_control *sc)
> +{
> +       struct lruvec *lruvec =3D mem_cgroup_lruvec(sc->memcg, NODE_DATA(=
sc->nid));
> +       struct zswap_lruvec_state *zls =3D &lruvec->zswap_lruvec_state;
> +       long old =3D 0;
> +
> +       /* Do not accumulate work: back off if the worker is lagging behi=
nd. */

Why not? This also has a non-trivial effect on the writeback amount...

> +       if (!atomic_long_try_cmpxchg(&zls->nr_deferred_writeback, &old,
> +                                    sc->nr_to_scan))
> +               return false;
> +
> +       if (!mem_cgroup_tryget_online(sc->memcg))
> +               return false;
>
> -       shrink_ret =3D list_lru_shrink_walk(&zswap_list_lru, sc, &shrink_=
memcg_cb,
> -               &flags);
> +       if (!queue_work(shrink_wq, &zls->deferred_writeback_work))
> +               mem_cgroup_put(sc->memcg);
> +
> +       return true;
> +}
>
> -       if (flags & ZSWAP_SHRINK_SWAPCACHE)
> +static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
> +                                        struct shrink_control *sc)
> +{
> +       if (!zswap_shrinker_enabled ||
> +           !mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
> +               sc->nr_scanned =3D 0;
>                 return SHRINK_STOP;
> +       }
>
> -       return shrink_ret ? shrink_ret : SHRINK_STOP;
> +       /* Nothing is freed until the worker runs, so report nothing. */
> +       return zswap_defer_writeback(sc) ? 0 : SHRINK_STOP;

This will have effect on the shrinker control loop too, right?
Shrinker API accumulates the number of writebacks overtime based on
shrinker_count()'s output, and we serve that number of writebacks
throgh shrinker_scan(). With this basically that accumulation just
grows over time, correct? Check do_shrink_slab() in mm/shrinker.c...

Feels like this completely breaks that control loop.

>  }
>
>  static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
> @@ -1807,7 +1897,7 @@ static int zswap_setup(void)
>                 goto hp_fail;
>
>         shrink_wq =3D alloc_workqueue("zswap-shrink",
> -                       WQ_UNBOUND|WQ_MEM_RECLAIM, 1);
> +                       WQ_UNBOUND | WQ_MEM_RECLAIM, 0);

This turns a single-threaded workqueue into multi-threaded workqueue, IIUC.

Worth at least an callout in the changelog?

>         if (!shrink_wq)
>                 goto shrink_wq_fail;
>
> --
> 2.53.0-Meta
>
