Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A4412C16
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800676; cv=none; b=ZzB3/4sbgaQW/8tvfPUUkhbPLaIskIMpRzGe6JzXjjI9l0dFPaq58rz6XgbwnlHhKsWQ0hJs9bKiNMdBascjESxffet+AzGQDz6kMHpL0F1TzPSdusC1sEQVF9EZyjH674k+0aoTbN0M+u8rvj9cODV54Id8Ep1fdm4oUo1/mK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800676; c=relaxed/simple;
	bh=azcr1DBar9SAKM6LlOhRTq0Y4Vp6iWielYyoP1AXyU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgTzdh3A2so79QKOESGPk8E7D+PNTeZtbF20NXFDgyQfQW/drGpYVK2ZZS+rqHyfEh4Z3+v2qROOuRN64BtStWiXJziANhBR21+j1/hycpdS0sLl0F+4Nx7W3lVLFMbWd+LSSAAkniYCU3WS6DuMAy8EN1hNXUOuZgevbvcZUtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZqv1ZEV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZqv1ZEV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379BD1F0089B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791800666;
	bh=4r6VZ3b4FSsOVOlj0ppWkL6kQLQSiLIlN5z+tYgn5io=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RZqv1ZEVb2QX0FREo0iFH8nF2wAAQeOQotH5UxHzcbI+LHZBwLJf+e2d9W7HzbbdB
	 mBPciGE3aIPJYeQbLozQxHqInJl/rds6vFasN8l2i/mNf0DOIt0W6YFEZrcMSnSSyD
	 jzarYnKRAUTrqNmzODMlwNiEsq6Jc2Tv9K/Q8ClzY6LeT1FoShbM8soZGVJgLctMkH
	 zwhrS6SXSxgOK7diB1irlHW9wvwheQvbyIzq6WUsZyOfP6eMWgbhLe4BOD+HuFZfBy
	 ogZpi6YA3j7rwq6hnVqk3ER8++gWaQccNuVR1W5LBqm7jgVQRrXh4mE8m4Tl4v0Ucm
	 rPsEdeszZkQvw==
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91054f537ccso21847266d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:24:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhfXL8+a7YmCVznt0nOtTe4f2XoonbTCScPKgMcn519qi4ROzIGKgk7C5vTAFKi4c5ysSPf+OYWGMNs+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/pgSCJs6pmeszxOnewFc4bRkBqmDSG9P7Qm+Ib0oQTKUuEkXN
	p/a5AAg1WsarJOdP+aKeeQ7fd+NIY/RQtyJRq+sLcKz6z1dytdCxe3HNaqBp6NpbgfY+aSP2d64
	Laz7xAclT//crICyu7vJwEdjlMHz8G3c=
X-Received: by 2002:a05:620a:372b:b0:93a:13aa:1b9 with SMTP id
 af79cd13be357-93ebd21e6damr1470423485a.30.1791800665600; Mon, 12 Oct 2026
 03:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010141057.599595-1-liuxiang.277@bytedance.com>
 <CAGsJ_4xxawPzb7MpmdNm9u-fgge3w49n-Cu026BpKYAUZZf=pA@mail.gmail.com> <20261012082545.2926113-1-liuxiang.277@bytedance.com>
In-Reply-To: <20261012082545.2926113-1-liuxiang.277@bytedance.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 12 Oct 2026 18:24:14 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zesVPzt7YeHLhVDfQ5THwcyTVZJaHNybw6APQ1BS86pQ@mail.gmail.com>
X-Gm-Features: AclHuK_ns7gZJU9FbF8TPhoIZ1hQJVBLC0lvK8ekIaJ5Q1cCPiKWDvK2CYGo1Jw
Message-ID: <CAGsJ_4zesVPzt7YeHLhVDfQ5THwcyTVZJaHNybw6APQ1BS86pQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low
 swapcache in MGLRU
To: Xiang Liu <liuxiang.277@bytedance.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kasong@tencent.com, mhocko@kernel.org, 
	hannes@cmpxchg.org, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:26=E2=80=AFPM Xiang Liu <liuxiang.277@bytedance.c=
om> wrote:
>
> Hi Barry,
>
> Thanks for reviewing.
>
> > I'm not a fan of this fix, as setting
> > scan_swappiness =3D MIN_SWAPPINESS will force a cold/hot
> > inversion for anonymous folios.
>
> The patch description outlines the tradeoff:
>
> > The tradeoff is synchronous aging. With four anon generations and two
> > file generations, advancing max_seq can require moving the oldest anon
> > folios to the next generation. This patch accepts that cost to avoid
> > low-yield anonymous scanning. It keeps the original swappiness in
> > try_to_inc_max_seq(), avoiding additional use of the inc_min_seq()
> > single-type shortcut that advances min_seq without processing the
> > oldest folios and can cause cold/hot inversions.
>
> To evaluate this tradeoff, we varied the oldest anon population and
> compared synchronous aging with baseline evict_folios() time under
> GFP_NOIO with very little swapcache. In the cases reported in the patch,
> aging was substantially cheaper than low-yield anon eviction, and
> allocation and reclaim times decreased. This motivated retaining the
> synchronous cost while avoiding additional use of the existing
> cold/hot-inversion shortcut.
>
> The diff uses scan_swappiness to decide whether aging is needed, and
> passes the original swappiness to try_to_inc_max_seq():
>
>     if (should_run_aging(lruvec, max_seq, sc, scan_swappiness)) {
>         if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
>             need_rotate =3D true;
>         should_age =3D true;
>     }
>
> inc_min_seq() receives the original swappiness through inc_max_seq().
> With a nonzero original value, the anon shortcut is bypassed. When anon
> has four generations, its oldest folios are processed before max_seq
> advances, retaining the synchronous cost described above.
>
> Am I missing another path where this change would trigger the shortcut?

Interesting. I missed that eviction uses the modified swappiness
while aging still uses the original swappiness. IMHO, this seems
to work, but we need a big comment here to explain the rationale.

Also, it feels really strange that we have to hack two places:
one in `lruvec_is_sizable()` and the other in
`try_to_shrink_lruvec()`.

so we could make it a helper? BTW, we have already handled
return 0 in

static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
                           struct mem_cgroup *memcg, int swappiness)
{
        unsigned long nr_to_scan, evictable;
        struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);

        /*
         * Proactive reclaim initiated by userspace for anonymous memory on=
ly.
         * SWAPPINESS_ANON_ONLY is set only on the proactive reclaim path, =
so
         * warn if it shows up elsewhere. When anon cannot be reclaimed (e.=
g.
         * no swap), return 0 to skip the scan entirely, avoiding useless s=
can
         * work when there is nothing eligible to reclaim.
         */
        if (swappiness =3D=3D SWAPPINESS_ANON_ONLY) {
                WARN_ON_ONCE(!sc->proactive);
                if (!can_reclaim_anon_pages(memcg, pgdat->node_id, sc))
                        return 0;
        }
        ...
}

do we really need to handle it again in lruvec_is_sizable()?

Kairui has a patch which hasn't been sent out yet:

mm/mglru: reclaim from the oldest populated gen

https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git/commit/?id=
=3Db15a053bc

which would allow shrinking MIN_NR_GENS generations and better support
the GFP_NOIO case.

For now, let's clean up the code, add comments, and introduce a helper
for your approach so that we can see if it can be made easier to follow
by a RFC v2.

Best Regards
Barry
