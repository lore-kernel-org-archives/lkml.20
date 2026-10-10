Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09A3B635F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791645712; cv=none; b=rtuKSn+soHZ0xfh+q3l9pCynhE8Fmg/GHwK/npZhaDTRcNO/HDXkstwvAblY8yoTzubYMPOlbO/LT35NvP0h82MKFeA1aj3CoSH+2U82x0EmMl8WRXVgAcRzb5wKKGA1tBPidlMjdvwBc5MENGNYxhD6LO4At4ueMFctOdV9E/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791645712; c=relaxed/simple;
	bh=iLMwZn0h2TMIgYGwNP95+T0TM9Z1jp+Y6x6tAq3ga90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbSPvpixPdErMVYBX/MY6KJjs7321/2Fue2WEpahMwpT+dwAD5hAOQUesIAl7x80fIN2+tfyyLHcbHGgqZ7Ou6iIHDTDlqNNCHt8MlBu+FhV8iFjSq1W+QeB/egE3XHFspKoJQt9QkkZP4JK6RXNuLTTubMMGewyzlWcnfw6lC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlB0RSQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlB0RSQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247871F0089A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791645709;
	bh=yVCmy9f7/nhqwyBbb2KH2ql3dyJAUCcc/ty4MtIkyWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YlB0RSQ3x+gZj5g/WlN0RgpHfeKcGT3gLqu7dDCpw9gSTwInhzU1f2IvXyoXMKLCo
	 PKtu3fyWVh27ULs5aSie21QlUtI2JOAv6y8ayKRwEfU/x71Vbx/mAb3mEeyVg324uk
	 ovMu/HY+FZfJ3dTpZCSD17qm/DeejYEL92l+CvQNBiSNYZdRDD8aRtxA2ljC162HWk
	 BhFn3IzdFM/xgzce21WiopqFiRgaNL8Iveuh9LFLbUneMOvaLGC5h9wdtSRVGN4TfC
	 C9Jf3tYKwSYQPvqgZubjghS2CSwK3e2EChm88lGZzIujOnEacw26DiHwuSJu4hyS0m
	 +YgHRgWAWz0lg==
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91957ec418cso9326706d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:21:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycRVveEYsIO4gnEnKDUhFCk2fgd/HyLh/TKT7a3U0o/JNMb1/3AUWrmEVnhw74kJ1pLVymr2yhciZve7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaXicCBHgACDNYIIOaVo65hp5Wc6cGAE6pGyXfwI4srH5WLWCf
	gswxCXeA1bAVlXlUNW9XfW5JaU51asMo7kN8wVmSFMTgVqFy05g62Iz5IfM1FZ+iXGbGyfRmkvt
	CpBtXkuJH+Ri3AAitaD2lioGtTKhoZqQ=
X-Received: by 2002:a05:620a:3728:b0:93e:c12c:f119 with SMTP id
 af79cd13be357-93ec12d0576mr764364185a.69.1791645708337; Sat, 10 Oct 2026
 08:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010141057.599595-1-liuxiang.277@bytedance.com>
In-Reply-To: <20261010141057.599595-1-liuxiang.277@bytedance.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 10 Oct 2026 23:21:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xxawPzb7MpmdNm9u-fgge3w49n-Cu026BpKYAUZZf=pA@mail.gmail.com>
X-Gm-Features: AclHuK_An0Bs4sFN1u3GsKjmLeNq_6Cs8GACRNMMJL2VZeVjvrz0jj-Knms2-Cs
Message-ID: <CAGsJ_4xxawPzb7MpmdNm9u-fgge3w49n-Cu026BpKYAUZZf=pA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low
 swapcache in MGLRU
To: Xiang Liu <liuxiang.277@bytedance.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kasong@tencent.com, mhocko@kernel.org, 
	hannes@cmpxchg.org, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 10:11=E2=80=AFPM Xiang Liu <liuxiang.277@bytedance.=
com> wrote:
>
> Bo Zhang's GFP_NOIO patch [1] addressed anonymous scanning with low
> swapcache in the traditional LRU and left MGLRU as a TODO. This patch
> addresses that remaining case.
>
> Under GFP_NOIO, anonymous folios requiring swap IO cannot be reclaimed.
> When very few anonymous folios are already in swapcache, scanning anon
> can spend substantial time isolating and processing folios with little
> reclaim progress.
>
> Apply the existing can_reclaim_anon_pages() check to MGLRU.
> lruvec_is_sizable() excludes unavailable anon from its size estimate.
> In try_to_shrink_lruvec(), file-only scan_swappiness is passed to
> get_nr_to_scan(), should_run_aging() and evict_folios().
>
> The tradeoff is synchronous aging. With four anon generations and two
> file generations, advancing max_seq can require moving the oldest anon
> folios to the next generation. This patch accepts that cost to avoid
> low-yield anonymous scanning. It keeps the original swappiness in
> try_to_inc_max_seq(), avoiding additional use of the inc_min_seq()
> single-type shortcut that advances min_seq without processing the
> oldest folios and can cause cold/hot inversions.
>
> Tested against the mm-unstable base-commit below using dm-verity
> hash-block reads through dm-bufio, with unchanged NOIO allocation flags.
>
> Allocation time spans alloc_buffer() entry to return with valid buffer
> and data. Reclaim time is the time spent in try_to_free_pages() within
> that allocation. Eviction and aging are the time spent in evict_folios()
> and try_to_inc_max_seq() within that reclaim.
>
> 1. NOIO allocations under memory pressure
>
> The workload triggered NOIO reclaim during dm-verity reads, with
> generations allowed to evolve naturally. The table reports median
> times for successful allocations that entered direct reclaim.
>
> Time (ms, median)            Baseline  Patched
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D
> Successful alloc_buffer()     181.196    0.465
> Direct reclaim                181.185    0.131
> Eviction within reclaim       179.147    0.091
>
> 2. Synchronous-aging cost
>
> Prepared four anon generations and two file generations, with zero
> swapcache and pages in the oldest file generation. The tests varied
> the oldest anon population to compare baseline eviction with patched
> synchronous aging.
>
> Each row reports a successful alloc_buffer() call and its reclaim
> costs. Oldest anon is the measured population of the oldest generation.
>
> Kernel    Oldest anon  Allocation   Reclaim  Eviction    Aging
>                 (MiB)        (ms)      (ms)      (ms)     (ms)
> =3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D  =3D=
=3D=3D=3D=3D=3D=3D
> Baseline     1755.266     131.704   131.699   127.985    1.672
> Patched      1840.422      38.316    38.311     0.307   37.785
> Baseline     4835.418     681.796   681.766   675.477    4.382
> Patched      4813.180      91.161    91.140     0.450   90.407
> Baseline     8941.582    1474.245  1474.202  1469.084    0.488
> Patched      9012.660     143.748   143.709     1.026  142.341
> Baseline    13104.676    1098.372  1098.354  1087.976    2.307
> Patched     13046.621     139.450   139.390     1.083  137.954
> Baseline    17187.043    2694.909  2694.902  2686.470    0.784
> Patched     17124.902     209.240   209.233     0.638  208.270
>
> Across these tested sizes, synchronous aging was substantially cheaper
> than baseline eviction, and successful allocation time decreased.
>
> [1]
> https://patchew.org/linux/20260908062649.1045883-1-zhangbo56@xiaomi.com/
>
> Signed-off-by: Xiang Liu <liuxiang.277@bytedance.com>
> ---
>  mm/vmscan.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 29b31446fc11..550c16cad9f9 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -379,13 +379,6 @@ static inline bool reclaimable_anon_is_low(struct me=
m_cgroup *memcg,
>         if (!sc || (sc->gfp_mask & __GFP_IO))
>                 return false;
>
> -       /*
> -        * FIXME: MGLRU doesn't fully respect can_reclaim_anon_pages() fo=
r the
> -        * scanning type, so only apply this to the traditional LRU for n=
ow.
> -        */
> -       if (lru_gen_enabled())
> -               return false;
> -
>         if (memcg) {
>                 struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat)=
;
>
> @@ -4357,6 +4350,13 @@ static bool lruvec_is_sizable(struct lruvec *lruve=
c, struct scan_control *sc)
>         unsigned long total;
>         int swappiness =3D get_swappiness(lruvec, sc);
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> +       int nid =3D lruvec_pgdat(lruvec)->node_id;
> +
> +       if (swappiness && !can_reclaim_anon_pages(memcg, nid, sc)) {
> +               if (swappiness =3D=3D SWAPPINESS_ANON_ONLY)
> +                       return false;
> +               swappiness =3D MIN_SWAPPINESS;
> +       }

Hi Xiang,

Thanks for your patch.

I'm not a fan of this fix, as setting
scan_swappiness =3D MIN_SWAPPINESS will force a cold/hot
inversion for anonymous folios.

static bool inc_min_seq(struct lruvec *lruvec, int type, int
swappiness)
{
        ...

        /* For file type, skip the check if swappiness is anon only */
        if (type && (swappiness =3D=3D SWAPPINESS_ANON_ONLY))
                goto done;

        /* For anon type, skip the check if swappiness is zero (file
only) */
        if (!type && !swappiness)
                goto done;
        ...
}

We should try to avoid this.

Best Regards
Barry
