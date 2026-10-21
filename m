Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619723;
	b=h9PJ1f6UG5aQJAQg1aeJdqBxb6ybzCOO/g4VM7BM7cGpla6sKrTd1S71PbLyEAtZY+hc
	 LZckbeI6QBFKpqi74u7rzVfaF5Ltkl/ycQvkVoWfnAizlG9icqBkQx0K1p2gXKYH9Zx17
	 d05n61SUsIn2s/+J7Um/M1iTUdIrwnEVx/s+96shvjvqt2wTL6S74Y7M2crfXwC1oSUKr
	 SAkYssHVOO1VJQyyEA31kIxscF0a0PXO5A6qlY+R4PAQ1dUW52fpnaCo5tF13SwbNWFaV
	 BpkGDVArepjeAtG6I+EL9OY/nmKqBgTIkRQ+t+QPh1L+7PmZtsGr9E1pYsKVzoxl1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619723;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XbblKzcGrmO5Ko5Ulj3O9NpL7GMqStGr4Qlbbk//Src=;
	b=GOr0/n7XkrG3mkepvPGT8QNIQtnBcyt9HYKw7jpxuWFa6UY9d94oZR1mnGSRmT9202BR
	 vToxKjkNgGO/+ZldJFPmsMwtBd0AaQz+IpWiHzA+0SRZhKQhVhM3iPHy8qLAcz6FH9mDy
	 bpjAJX16ameWvW0ZgD05LU196JruUM1oAH1L7DmPGAF9KmR4WKHv6ooYrUnQkiPBGzyBd
	 JTvMDfGDiIs0wsbANxeaBHRX6/24FAn5gWR256M32bIBy/vBGS8C9Al3TOkYq8tkhwsjb
	 xCczDHpSr+c1aThMzp0q0NaDM3w/vgQ8BW+u+NhcncdSXmlVtS07RBbPlfZJM7HsDAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IISonUq6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB344606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IISonUq6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FE71F000C2
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619722;
	bh=XbblKzcGrmO5Ko5Ulj3O9NpL7GMqStGr4Qlbbk//Src=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IISonUq6PPuILhouWjN3XrAW4TyXV7DF3zaY8rj73hwsu87lHUbm7/wCuPYWIUUGN
	 8ZftC/Ff2TTDpONhLu53ut7cLLqdIqZXBwzAdvxWQbq47jwrPovWDAE/Tt76Zq3T5R
	 kPm51HL6vRRV7QXn5fQxZSOcFr6oAhKA4BvHrs/R0/8n/liPhhLQ9FR4A3qg67Xchq
	 TZtOu2d0rvMJQZbiV/Zy+ZGvKvlQ2V4IWyIN4Yv+EJeVZ4vZuu+bCZeoooHC41Tdzt
	 WFWQNjX0tLWsmxdqi/N4N/E3qYkmaoctEzucIXURHvImXewhcFnRyuQABNJytfwpLt
	 uefPyP0cEaZZQ==
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f36c18b75so84748785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:55:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJSkXvSmKC+CzmzPbBL7LfAR3XUNhhfIx4ek2CpQKtZSc7E+oEuvkFEh1mhNd7hHi87OyNrzzhZgIkOPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFQcI3GmflL4pNugmbCNhOYyVTrzzuYPf18XJvZHoiWcK5+alF
	eubu1B6gtgl84n2KDBrDTV/xNSHqKkoW83nBj97BV4KYYmTdUpsHJCZlTGit+2y7o3hF+I61/KQ
	cA9HD9j2jkVmCRTVIaE/GjQpZObVP+To=
X-Received: by 2002:a05:620a:4113:b0:93e:48fc:aa88 with SMTP id
 af79cd13be357-93f57f81db1mr689549385a.44.1792619721658; Wed, 21 Oct 2026
 14:55:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179248830836.1744016.8424217811286616919.noio-mglru-rfc-v2@bytedance.com>
 <7f4daafd-a3c5-4ccc-80bd-05a7ac09e4ab@linux.alibaba.com>
In-Reply-To: <7f4daafd-a3c5-4ccc-80bd-05a7ac09e4ab@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 22 Oct 2026 05:55:08 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wV8A5snz-XE+5ht931=07SvCs_k4xvUCE1yphKyQd8tw@mail.gmail.com>
X-Gm-Features: AclHuK-Lm3ETeKvlfdxyvGOhePGX8_fdCxCFPiSQfmBetlKnWoeOhvEVMJZjPbw
Message-ID: <CAGsJ_4wV8A5snz-XE+5ht931=07SvCs_k4xvUCE1yphKyQd8tw@mail.gmail.com>
Subject: Re: [RFC PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache in MGLRU
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Xiang Liu <liuxiang.277@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 3:28=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
[...]

> >   static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_cont=
rol *sc)
> >   {
> >       unsigned long total;
> >       int swappiness =3D get_swappiness(lruvec, sc);
> >       struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> >
> > +     swappiness =3D get_scan_swappiness(lruvec, sc, swappiness);
> > +
> >       total =3D lruvec_evictable_size(lruvec, swappiness);
> >
> >       /* whether the size is big enough to be helpful */
> > @@ -5249,9 +5265,10 @@ static bool try_to_shrink_lruvec(struct lruvec *=
lruvec, struct scan_control *sc)
> >       bool need_rotate =3D false, should_age =3D false;
> >       long nr_batch, nr_to_scan;
> >       int swappiness =3D get_swappiness(lruvec, sc);
> > +     int scan_swappiness =3D get_scan_swappiness(lruvec, sc, swappines=
s);
>
> IMO, 'swappiness' and 'scan_swappiness' are really confusing. Why move
> this logic into get_swappiness()? In get_swappiness(), we already have
> some similar logic to adjust swappiness when there is no available swap
> space.
>

Yes. It is very confusing. we can't do that in get_swappiness() as otherwis=
e,
we will get cold/hot inversion due to GFP_NOIO. for a real swappiness=3D0,
we allow cold/hot inversion for anon, but for GFP_NOIO, this is not the
case.

static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
{
        ...
        /* For file type, skip the check if swappiness is anon only */
        if (type && (swappiness =3D=3D SWAPPINESS_ANON_ONLY))
                goto done;

        /* For anon type, skip the check if swappiness is zero (file only) =
*/
        if (!type && !swappiness)
                goto done;
        ...
}

So the trick here is that Xiang is doing scans by tuned swappiness but does=
 age
by the original swappiness.

IMHO, this is confusing but this is a possible way to fix it before we
land something
like:
mm/mglru: Avoid scan anon while swapcache is low for GFP_NOIO allocation

https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git/commit/?h=
=3Dkairui_scanbalance_0.4

Best Regards
Barry
