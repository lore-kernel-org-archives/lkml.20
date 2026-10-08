Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC77848CD41
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460636; cv=pass; b=FYTCc/zMYFrvaA8drtVzIKiB43y7pTQD1cNmNDw0D2Yh4vgGZ+u646snjG+25hnKAyirVWJczSIFTh71iQRKFGjlz1IvjUnFtTNspsLXoCzKBnogDJz0LIUkPI1tMUw2RZVvb45qBt49GE452Nl4u/NJjhx2te3JvvVJlylhThc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460636; c=relaxed/simple;
	bh=DSNHKdAFSEgJ38k0txXrjiOfuOX+zqL8641WnyY8DNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNqu6K20Clud2LZ9Zh2wCJnYkDP3QkTZ3R7EnIY6kiEILmyT9vmFsUJ9CJBBqD+9yIuaCU6ColdK1VjBc8aF70z+CuVfyR0lJ3Ik+FI59O42WrtLhLAYXKllJac2oo2MM9riRCEB88eOgFtD/KJOvN/ygcXi3f4Bhh+V0SSIaUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj1QElGR; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj1QElGR"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso700961766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791460633; cv=none;
        d=google.com; s=arc-20260327;
        b=PsR8rdq4aRI9UBGrZopiUQLaccudiGm87DQl/G0Q666IuOqfsdYLHqh/bHiousEze0
         AFUOCW/s+FxlXZR96TV45T/1J/HPY2EP4xZAs5LLgmnqGao8UFgtwXuHDTNxuJOY8Psc
         avX8FXz4f96KlKYIPqftAjZNwCku1wUdlFUyNrQM89lIUb8sxUkNeejCIwLA3z8fAaQW
         HDUvuT+h5EQ8Z0jLVn2oc1/kDQ4SwMLUMd8UZZX1qUd9yCeyGYc+Zw7NhpHoZBmDnIy3
         p7G2eH0FgCNE9qHOrbEbBcRXdb1oIlC6K5p2YSwEqF9f/SHtMOHD4sDiCJzYOtKosxg9
         jciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+0i0Jq921Jsm4vHHGLuxvRSz4j2TVU7+5Bry6BxrlzE=;
        fh=kuBOQRuKIbX5FLw0r3EAvK+1MvQAnhfkccLDBXCoygs=;
        b=gVMQsiGKAqcqGV77t868y0jKhOMvhFrWRt2dJCNALUThBMZV61wr0vKGQBRU3vR6Jq
         VR2zDqle4v/lccW8kNcVL7Q6aXZYQTSKLPx/yW7l9nrsL4AlgP0RylOguhsPvb78Hi5Z
         xLX87w/EL53xKDsq/66tVxbOtLfPDxYi1QQ/j3eN/43LVzWNLT89CLj6WLKr7wAHSdqF
         bpNvA2wdB5Msx+GCW7STDbZ0MS6IWu1FO6cboGeOp5GOkj8d06LkIS6Z8HXn8MjAMyoe
         nmCrp8GClDnpcwgZRG1v8hwQN7oytgxpOPoScbkg9HwwW5mPY7/jhW/IrHGtku3TZdPf
         Mnfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791460633; x=1792065433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+0i0Jq921Jsm4vHHGLuxvRSz4j2TVU7+5Bry6BxrlzE=;
        b=Dj1QElGRU5CBgAzm1lSWG2C0Yv4w42vzPTWmXAcrvhB8hD0aII1fwnDGu+av71d4M2
         a1P0aaP8YN86qwlIvps32ox6egtbnBvnCQoHAFtKQnFr7fE3JKSxAGsieaYihU4OsAdV
         TUA0ypuHK83rNUR5TluxBF8jSQg1GiXiprPQkcVTjDnBZYkygC02159BXl9V8ns8ul2e
         aQulQ3YFYTwKpr8p25DerAAo2yrscW23+VfNyRY6e7OqQHYSLY+qdUy/QnyaJ1GBI29c
         nfTBj2iZT2Cu/YrYr+pTz1heeMgnFwo5JPDCOIS9KYSM7NUXnH5lfryCITC6UguSbJfM
         3wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460633; x=1792065433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0i0Jq921Jsm4vHHGLuxvRSz4j2TVU7+5Bry6BxrlzE=;
        b=DAPy+FJVikubAr2ZRUQ10BvNtnKi3hYWgNiQcNj7rAzMAgsee9hMnVhWawk/i7l/6Z
         WBuZy4TH6w/crVVsw1Suqaai0iUz4Qw5I9VI5lv2i0pkg+6cs6daQTmhnQNNLNXz9FAx
         U6Dv7EVUwWIw0mU8aCz/iqrKoiFnJhM4hOzjWEnfQPb5mUYz2IdhZMlgsvbXbI0DnIks
         aJh+3MRP3tcag9B1Bl15IbfxDjGAWKO6eATIArkQZ0CNr8ctl3x9zWl+LRseo6lrsGJ6
         aHFXEJcGeQmmoLZkJOrNn6fboXWsmuoz9LZxWNOK07DBpA/AVUaxwlNH849WINsXV+DS
         UTXw==
X-Forwarded-Encrypted: i=1; AKwUvBxU1ooZ6OzqToxHqpABnX5tX58J08dvrcAuKw91rv9LL6v1Y1bPiVzhDhISvWkG96yR176rBWieHpszOus=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0xwD7xOv5xvrnSEqSRYHRgQTh14RGEuYlNCYhvhg5OvH8afs0
	UeLsP8jYCdpK7RM5EEkoO7KSLqk3XK+Cf8jUnvjo2YMfHMFStNZgswf9+qWLkcwokQAuRGIFY4S
	TehMgcwXIOUaIYN7hAJ+lh+83P4fr5d4=
X-Gm-Gg: AYBFou13UX1JYUE6U3TwLopjQmh1AEIF2jZVcZRagWfwLJFdgSx9aX1BPScnyXQjj8/
	jl/Ax77XyV+SJUxtmmsW5w9lRbUG14OpcRPX0m53mgjVjCAWexk83hrE1PnzeWLIEETc69WfSTX
	YnaWycTRhvYUZcZt5RkeU5WSQqMdi9itXGDnISDeSZ2oy1uyBNRRDtgb9q4f2I57VmhNv662Vtz
	O0f7wEKCoJc2D3CSn4CQ5fRt1dNmsWPxFzJ4s1jkB0hqikUQniEJ66ZXmXdEAM/DIImbGfvlIJ1
	nWiU8WyoefMfUWOYQ/wH4Zz0vakUHNqlHWAa/iH70Al5jEmAfqPNIugYERMno54fdXLxF6FGnmC
	7OSo7Dt+qUL0=
X-Received: by 2002:a17:906:dc8d:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c317bf5998emr545727966b.27.1791460632767; Thu, 08 Oct 2026
 04:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789096175.git.zhuhui@kylinos.cn> <2ed42f96aca124856ea30f774afb55cbe6d8ba58.1789096175.git.zhuhui@kylinos.cn>
In-Reply-To: <2ed42f96aca124856ea30f774afb55cbe6d8ba58.1789096175.git.zhuhui@kylinos.cn>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 8 Oct 2026 13:56:35 +0200
X-Gm-Features: AclHuK-BxqNrNonn8CRYTTdm5cPRpBrRGaffHfg8y4IMBYCVm_4XzkFHjExbKwY
Message-ID: <CAMgjq7A0FKTJuEKSmTvJGHMOiMz_uAwE=TD89JVvLPysinUVaA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] mm: workingset: use lruvec_page_state_local() to
 count lru pages
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 10:26=E2=80=AFAM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> Commit 7404bd37cfbe ("mm: workingset: use lruvec_lru_size() to get the
> number of lru pages") switched count_shadow_nodes() to lruvec_lru_size().
> With CONFIG_MEMCG enabled, lruvec_lru_size() reads mz->lru_zone_size,
> which only the classic LRU paths maintain.  MGLRU accounts its pages
> through __update_lru_size(), which skips that array, so with MGLRU on the
> four evictable LRU lists are always seen as empty.  The shadow node budge=
t
> (pages >> 3) then collapses to slab plus unevictable pages, and the
> workingset shadow shrinker reclaims eviction tokens almost as fast as the=
y
> are created, losing thrashing protection.
>
> lruvec_page_state_local() reads lruvec_stats->state_local instead, which
> both classic LRU and MGLRU maintain.  Switch back to it.  The reparenting
> race this re-exposes on cgroup v2 is closed by the preceding patch that
> redirects dying-memcg stat updates for all hierarchies.

Looks nice! thanks.
>
> Fixes: 7404bd37cfbe ("mm: workingset: use lruvec_lru_size() to get the nu=
mber of lru pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---
>  mm/workingset.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/mm/workingset.c b/mm/workingset.c
> index 7ac2b88c80ae5..8412f4840ae35 100644
> --- a/mm/workingset.c
> +++ b/mm/workingset.c
> @@ -688,10 +688,9 @@ static unsigned long count_shadow_nodes(struct shrin=
ker *shrinker,
>
>                 mem_cgroup_flush_stats_ratelimited(sc->memcg);
>                 lruvec =3D mem_cgroup_lruvec(sc->memcg, NODE_DATA(sc->nid=
));
> -

Blank line change is not necessary and I think it make the code a bit
more ugly...

>                 for (pages =3D 0, i =3D 0; i < NR_LRU_LISTS; i++)
> -                       pages +=3D lruvec_lru_size(lruvec, i, MAX_NR_ZONE=
S - 1);
> -
> +                       pages +=3D lruvec_page_state_local(lruvec,
> +                                                        NR_LRU_BASE + i)=
;
>                 pages +=3D lruvec_page_state_local(
>                         lruvec, NR_SLAB_RECLAIMABLE_B) >> PAGE_SHIFT;
>                 pages +=3D lruvec_page_state_local(

Just a nit pick.

Reviewed-by: Kairui Song <kasong@tencent.com>
