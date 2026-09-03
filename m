Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09C64A49B1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440385; cv=pass; b=pEui4OTMSViYs3mkroVhdICbNY9q4bMdt+2sK7A3SFK9dzUjEYt9/fFrq/K/RiTvQxBWmbP4QYSs/9NlV+KIE4Vxsz5ywYZhvDcETdbpJxPNrapTRXk2Mv3u70cQyoHqJAIsHg+ua0wC+DeGGWUQ1IQfjWaNtiG45O1lMO+h4nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440385; c=relaxed/simple;
	bh=5TaETDwHyv/KzsQgA0oHSepJaIKkOONvRtU7EAtGX+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BiuIDww8JirzrqjeDDvEm7IY1Glq65O3XC/oOenrzophQa+/ayKiJLV3wENL71wvpOqqOU3ikbADk5xrg5s26g8r7/W0WCZOK70BSw+tNpkxiTl0WxAO3omkRDNCEBmeg3xxEXbA+jLbGW/PCkxdPD630aC7DUT4o8Ppr9SkhkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMdoDAIq; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMdoDAIq"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1408100e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788440377; cv=none;
        d=google.com; s=arc-20260327;
        b=WOcTfVRpQax2CKYlkdVGOGfh0jXbr26GdxBRtEiAu4hFAmycz47+6u/wQWB2SqAEGw
         v2ZVMGKxyV/et5gmOqrOhQX4GsbY7c4zZrBjzyg7fLRZ4K2ku8wkMB6PkA/IaG7ZpPlp
         zHYIAyV7ftaP9j++M34L2VOQ/kikIS5gF+3K+v1Dty+x4z68YRymdon8Re7vamgURlZ/
         FDty+LSQJ77pjwBTihB+ka4ypEbk07XfeGfjMJ6frhxK/ccs9o52NoeRVVf0STI+LHeK
         EVFm0sz/8oXD883aoO2nExO4p6v3ItzwxLI05/Zk+B5z/sCYwiOkvIGwqAN+Wjr1/jqh
         1guQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmAdg8/mefR05LTJz5ypL2PwZdELomAbn6h2iC+gq4s=;
        fh=l1BnBjMmZiHZwPF8tQW+UzPCKZ+3r0W8/yYDzEnKHCM=;
        b=TsakiUy2kapaSezmwHS7bJ/9gsucM8Fdc1UWL63g71biY48GeW34tRVbZ8kbZ/GZLE
         boCePtsyeGduUVoIpQGnBb/u0U9GcCSsCU3GV2LejpGVydz7n4uIfgUuGK1sYngTFYpA
         d0yNnMT57Iw6xoo/MEUa+U0qQd2YxHvzwwzarNd2DMfNFwTrKejpFQhjsp7VuuX1OF+x
         +lLetKq/i9d/oECC3++rXRIhMWQ7L59TQGc0aVfV5wGgUu7ulG1hE/NUtfewPk5JiR/X
         vimzdG4fxbbKoxWraiUfPScfgLahNBN8D2JfXF+AO/vFAu5IYrhGw22U12dsIbvXaxY8
         Jm0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788440377; x=1789045177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmAdg8/mefR05LTJz5ypL2PwZdELomAbn6h2iC+gq4s=;
        b=UMdoDAIqD90uzJjNnbs8pwnidIeg31ZcI0U5aaIvY6Czh1TavIxkEXEKey7LC27TAz
         EiZPGdXuEHwPPkt+9sqnVBTlIJt8tiRWwM/wPQiKQD2i/iIhHRsb4loKambLhpuTJ4Hx
         vwhXFqygMAwHr9Kto/JmShUfkma+f1eSBBrkZM3q1YVX7QgYjeXd/9JEQ45Ts5fLsxyw
         I0uuijMvn+0BefZ7dk5fAh6s3djuimMgZIZHbULb1RrMl8UNfIbUdrTAlJRk7ZZNCExx
         hkRZoKo0xZhxxRVVqTt67MKSq9IKfuovZb5atYt3RQR0HWm8/S+cB8opUs5epxn47ZJT
         Lxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440377; x=1789045177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmAdg8/mefR05LTJz5ypL2PwZdELomAbn6h2iC+gq4s=;
        b=h4qMdv+e6OpelbaW60aueeWsycoShsc60oUl97ZRVIiELnmwosp37Hgoe9P1kgRskx
         4dMYnd3J3x2fT6M/L3HwLTK9v4LCitNdh/KS+dgcRbEqs+ojjYLgkPpiVp7SmA4PHErD
         7Z2FOgwVTBGfiPtPlHDBz/hgw2Kgyu1iRfScpoXJNiDFyHhMFgY1b2wujay9GvnZcme5
         XdZs3+Mrkji9GYzJxIofSkE7/metA7Sv94wcraPK9nEWhIgaZTWAbGb7yrsIg+CrYHrj
         CE0ieaSxyrkp9vlE9XZAhkBwd8Qkw3TH12KjNjRrIb+hH2mBQYnVsVVJtdztffv07LGX
         jh8w==
X-Forwarded-Encrypted: i=1; AKwUvBxhLXFt165E7Of+Gk/jOAJyYbr0WISfinYx2hDbkM0JJFzHUET0SfJ9vyPAMf7vHkNF8irPUVUEZgu+ZUU=@vger.kernel.org
X-Gm-Message-State: AFuF++kiH9Rh2OF30GRh7thzjtjQ8bADM2pAFrItjSqO6J4I/5mz3U/3
	M8buRrWSpfBfByxmALC8ZClJ1rEY6ZYW2NTSOwbZSAFZA7OXvsgYa+Cp7C5otoKe1aEtT5AJ+3o
	lKvM0eE2acoJRrVtHOYaRQ2X/XAgKTZQ=
X-Gm-Gg: AYBFou1YAIQqUenZNLy5pzcuK5tSldlgNSkOae9HYDeqg81Oeaus8WjLViwuHoP9m3l
	wQT8ZiWpTsV4WkU369ruq7ivWCmpY8Q97vnzAgjz6ePj4jN4QjsvFul3WNU+WOWcjdPy/ftqGcq
	A4bSSbuCMsZUo9VK6EBqFQ/CLmdxa5eh/Bvn2c8VNF3oC0wqJ3tfhrwgJ5iYqYumKmRZ3QkcRii
	A0CxYobG6HVPewc9cpSJH4EGfLK/CaeCpETM+IOVj/+T7/YkDQ6nFKb9hunf4383lYfDJn/zWVm
	n/ard7Yb/FAVyTw69FwC4PX95VaRh58XUYQwl42lVFu4dsf7QIjgjS9AzETzD7GL2QVHDcUQYB4
	=
X-Received: by 2002:a05:6512:450a:b0:5b6:10bc:dc44 with SMTP id
 2adb3069b0e04-5b610bcdd1fmr687589e87.27.1788440377072; Thu, 03 Sep 2026
 05:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <20260830114731.8322-3-wujianyue000@gmail.com>
 <20260901161329.GI3004@cmpxchg.org> <CAJxJ_jhkM4HHgCi-OsQcoDeDC5_fsejf+u+b5E1n3gNUd=EJmQ@mail.gmail.com>
In-Reply-To: <CAJxJ_jhkM4HHgCi-OsQcoDeDC5_fsejf+u+b5E1n3gNUd=EJmQ@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Thu, 3 Sep 2026 20:59:23 +0800
X-Gm-Features: AcwNN1UKIFYH_nhtxWH9JjOWZK6QjiNNdqvySPxc8FL2qtcVQQ5XgTwj5a_O5fo
Message-ID: <CAJxJ_jgLNTbyXJmerardEfBzbZeR1O0J=5DwDZr1kyp0kN7qHg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/3] mm/zswap: replace the zswap_pools list with a
 fixed pools array
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:50=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com> =
wrote:
>
> On Wed, Sep 2, 2026 at 12:13=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.o=
rg> wrote:
> >
> > On Sun, Aug 30, 2026 at 07:47:30PM +0800, Jianyue Wu wrote:
> > > Originally zswap holds its pools on an RCU list whose head also serve=
s
> > > as the "current pool". Only a handful of pools are ever live at once,
> > > since a new pool is only created when the compressor is (re)set and
> > > pools are reused across compressor switches.
> > >
> > > Hold the pools in a fixed ZSWAP_MAX_POOLS-element array so each pool
> > > has a stable slot number, and track the current pool with a separate
> > > rcu-protected pointer.
> > >
> > > Slot 0 is intentionally left unused (always NULL): a zeroed or
> > > incorrectly initialized pool index then resolves to NULL and trips a
> > > WARN rather than silently aliasing a live pool in another slot.
> > >
> > > The array keeps the same RCU publish/retire discipline the list had,
> > > so lookup and teardown stay equivalent. A fully-constructed pool is
> > > stored into its slot as the last step of zswap_pool_create(), so arra=
y
> > > walkers only ever observe a NULL slot or a ready pool. Pool creation
> > > is serialized by the module-wide kernel param mutex (all built-in
> > > params share one lock) and otherwise only happens during
> > > single-threaded init, so no two creators race for a slot.
> > > zswap_pools_lock still serializes the store against a retiring pool
> > > clearing its slot in __zswap_pool_empty().
> > >
> > > Behavior change: the fixed array bounds the number of simultaneously
> > > live pools at ZSWAP_MAX_POOLS - 1 (15, since slot 0 is reserved),
> > > whereas the old list was unbounded. A pool is only live while it is
> > > the current pool or still has stored pages referencing it, and pools
> > > are reused across compressor switches, so 15 is far more than any rea=
l
> > > configuration needs. Once all slots are occupied, creating a pool for
> > > a 16th distinct compressor fails: zswap_pool_create() errors and
> > > returns NULL, and the compressor switch is rejected with -EINVAL
> > > rather than silently succeeding. The cap can be raised by increasing
> > > ZSWAP_MAX_POOLS (bounded by the u8 slot index, so up to 256).
> > >
> > > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > > Suggested-by: Yosry Ahmed <yosry@kernel.org>
> > > Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> > > ---
> > >  mm/zswap.c | 97 ++++++++++++++++++++++++++++++++++++++++------------=
--
> > >  1 file changed, 72 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/mm/zswap.c b/mm/zswap.c
> > > index 0bb30e58950a..b3b5e2887c00 100644
> > > --- a/mm/zswap.c
> > > +++ b/mm/zswap.c
> > > @@ -13,6 +13,7 @@
> > >
> > >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >
> > > +#include <linux/cleanup.h>
> > >  #include <linux/module.h>
> > >  #include <linux/cpu.h>
> > >  #include <linux/highmem.h>
> > > @@ -154,12 +155,27 @@ struct zswap_pool {
> > >       struct zs_pool *zs_pool;
> > >       struct crypto_acomp_ctx __percpu *acomp_ctx;
> > >       struct percpu_ref ref;
> > > -     struct list_head list;
> > >       struct rcu_work release_work;
> > >       struct hlist_node node;
> > > +     u8 idx;
> > >       char tfm_name[CRYPTO_MAX_ALG_NAME];
> > >  };
> > >
> > > +#define ZSWAP_MAX_POOLS 16
> >
> > It's unlikely to happen, but this is a super annoying failure
> > mode. User would have to kill something, delete shmem/tmpfs, or
> > swapoff. And it's not obvious which entries are in which pool.
> >
> > Wouldn't an idr make more sense?
> >
> > > @@ -270,6 +283,31 @@ static void acomp_ctx_free(struct crypto_acomp_c=
tx *acomp_ctx)
> > >       acomp_ctx->buffer =3D NULL;
> > >  }
> > >
> > > +/*
> > > + * Publish a fully-constructed pool into a free array slot.  Pool cr=
eation is
> > > + * serialized by the module-wide kernel param mutex (all built-in pa=
rams share
> > > + * one lock) and only otherwise happens during single-threaded init,=
 so no two
> > > + * creators race for a slot.  The pool is complete before it is stor=
ed, and
> > > + * zswap_pools_lock still serializes this store against a concurrent=
 retiring
> > > + * pool clearing its slot in __zswap_pool_empty(), so array walkers =
only ever
> > > + * observe a NULL slot or a ready pool.
> > > + */
> > > +static int zswap_pool_assign_slot(struct zswap_pool *pool)
> > > +{
> > > +     int i;
> > > +
> > > +     guard(spinlock_bh)(&zswap_pools_lock);
> > > +     for (i =3D ZSWAP_FIRST_POOL_SLOT; i < ZSWAP_MAX_POOLS; i++) {
> > > +             if (!rcu_access_pointer(zswap_pools[i])) {
> > > +                     pool->idx =3D i;
> > > +                     rcu_assign_pointer(zswap_pools[i], pool);
> > > +                     return i;
> > > +             }
> > > +     }
> > > +
> > > +     return -ENOSPC;
> > > +}
> >
> > It was kind of overdue, but with this now requiring a pool walk as
> > well, it would be better to factor out a find_or_create function?
> >
> > Something like:
> >
> > static struct zswap_pool *zswap_pool_find_or_create(char *compressor)
> > {
> >         struct zswap_pool *pool, *new_pool =3D NULL;
> >         u8 id, new_id =3D 0;
> >
> > insert_new:
> >         spin_lock_bh(&zswap_pools_lock);
> >         idr_for_each_entry(&zswap_pools, pool, id) {
> >                 if (pool && !strcmp(pool->tfm_name, compressor) && zswa=
p_pool_tryget(pool)) {
> >                         if (new_pool) {
> >                                 pool_put(new_pool);
> >                                 idr_free(&zswap_pools, new_id);
> >                         }
> >                         spin_unlock_bh(&zswap_pools_lock);
> >                         return pool;
> >                 }
> >         }
> >         if (new_pool) {
> >                 idr_replace(&zswap_pools, new_pool, new_id);
> >                 spin_unlock_bh(&zswap_pools_lock);
> >                 return new_pool;
> >         }
> >         spin_unlock_bh(&zswap_pools_lock);
> >
> >         new_pool =3D pool_alloc();
> >         if (!new_pool)
> >                 ...
> >         new_id =3D idr_alloc(&zswap_pools, NULL, 1, 256, GFP_KERNEL);
> >         if (new_id < 0)
> >                 ...
> >         goto insert_new;
> > }
> Agreed. Hitting the 15-pool cap would be an annoying failure mode, even
> if it should be rare.
> I will switch this to an IDR with IDs in the 1..255 range, keeping 0 as
> the invalid entry value, and factor the lookup/allocation path into a
> zswap_pool_find_or_create() helper.
>
> Best regards,
> Jianyue

Hello Johannes,

I have this working locally, but I am still testing and some parts still
need clarification.

1. Could I use xarray here? Similar to idr, can naturally start from 1,
and zswap already uses xarray for the entry trees.
i.e. the pool table is an allocating xarray (XA_FLAGS_ALLOC1, ids
1..255, 0 reserved).

2. Compressor updates are already serialized by the param lock,
and the only other create path is zswap_setup() during init (or when
enabling zswap). That does not run alongside another creator, so I
think we can keep the simpler lookup-then-create flow. It is almost
the same as the original list code, just using the xarray API.

Best regards,
Jianyue
