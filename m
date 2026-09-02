Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121101B3925
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788310246; cv=pass; b=Wg4dgKM9XFfDvDE86xMlm3R65MdsfI9s68y2+YSIwljPmHMCy+QVL0ZEMOtJSBZFLnnasT/Epo19qYDaWdLf52fIY6Q5Xsq5LOFWRKPp+7j6Ln3Gs44Off1uCH4r6VGkFH/ShbN0+JWLRItjqNXxpy0cUzCvDGbM9B1Lse1TA4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788310246; c=relaxed/simple;
	bh=uxpV2bd0jSH3WddqbNMhei0FG6nv5pKV/10I/frE6e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbngfPI0XctYyQUMwMgP85vTg405r3SbVTtEVw9bX/SctprFR0y23dIXbahUQ3RkAtt/OIPsjg6CxuOYanbRO7jx0+FhqEUHJJI4eiqDgFwswr49PfPy/uftMwPiTKzmO2CPaBDkHKDd6z8O0Uf48+ttffsd6+Zvl+zUbBmBNZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bep4xpb6; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bep4xpb6"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b6036e9c70so369611e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788310243; cv=none;
        d=google.com; s=arc-20260327;
        b=cVVIr8oZcQJfP8sCx6JFcL+lYczX9KldA8vMvZy8Xoe/k3WxaxptJoY3N29qA+TuJb
         6PAkKCkzhXFb66kR9/3BW2EvTdlvA6HRqy7FTIJY6X36YJnT6HkXwsdnkI13TI9MAIuf
         Ww0IblNtqhVk1Vqz70cFFXWm118826lqZcWPTeCwCU3F+PK6LTXY5nZo8Q56TlXxZT3w
         kTtTPE0gABC2EurSCdAlXymG9wNDMkd3+KN2XP0aodUEtL1F5XJz2kzlmsll06e+jfft
         r1oMxIsWzfi3shpHynanDwsyXNv1ykg9be2UT68PqSzEULKz5v7PkILsxQLYEIVJj2Sx
         WCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqPY/O+R8Ye4De8eSkETHoBdfpmFjPEzhn9lUdJii2w=;
        fh=WrkCc7cY6OIHcet2CT+nP26ZaqoVkWKEALxzm/V/vFQ=;
        b=EdYwaxv0pXsN/0KJwDTAAAHQ50XNd4LcRIPmLalJXajyjIG0e1TQ8/Sdtrb8yaSeyx
         XLFvgB3DRlYwsvvHgfxVgy8cuXSFT8cRJcZcvVvl2EGRa6/LvVfbjOJc7Jk27No0JkAq
         Py2mvOrZSw+f03xZJdcPKOJ15RoszrBeSR7dblSKnNdO+NExUFyXkXHjT0woOfimx9fj
         EI94aVNOD+xPhwtbJ10Odc5he48z+PR95SIW3OUUT7t5QXumLOCI04SdRRXSMwaGZglS
         uhCJqaKLNcmeUlMuP37gNPhv/lBz00cdbJxYzU3gSq/Ry2w7EHxF6ivSbjtDmYGOu11A
         RC9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788310243; x=1788915043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqPY/O+R8Ye4De8eSkETHoBdfpmFjPEzhn9lUdJii2w=;
        b=bep4xpb60Irbu6cImEm7+W5HbKsb4ty5rf0IPxGxpKyx9fIJxmWwA75VC6xPBUM8kr
         BY/EpwX7Su6VMCpygG+kIaGYQ5DMKZ4/3pdrWv9QAxgBGYp/S4NRix6hUhPewUvvZq5r
         T1VDymNkgHA/s76QTBKn3T9HyZ5VhA6Gh6mho7V4KVYWCOUBs8JRVv5E6eFIlnia2EnK
         4o40gt6fKEHAAlyA491IjUaENoVOwWXUy/0Zj46Q31BT+ZNOgiZyTqxldmtPo9dKZOMV
         YfVbskWBm2+/NcwgMg5vSSOE8UxHWtR5XY6F1vRARADBx1e6BF81tR5+YGc8IU1RXZO3
         MqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788310243; x=1788915043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqPY/O+R8Ye4De8eSkETHoBdfpmFjPEzhn9lUdJii2w=;
        b=cyYDeg90cCyyVt/noE/6eWef95rzsgK4XkUinP5DgZJuORaTG1DoO0KXgS6k+q/nRa
         zn7yYikv2EtEegLkEfz7mT9EOQZlWO9d/BApjnz6L1d+g//z/6brWpI3EoZqiA1HOYPB
         j/pyTr7StfAJDk5A69rTXMLaiMncgjmMwabXbOg0MxuEU1fMJf7R/l0kLV9W6XDOSL3c
         6KpqF4pERZADdlsz2//89SkK+xUfbyzkmsMySR6HxRXLJWSC9bogZao61wFvHDfXZ8hP
         xaZIWerVb78LmuMXBZnSGTHyDeNltSXxYDOrHGNWBA5mre2Xoe0Naax2tIDjw+2Zyfvm
         i80g==
X-Forwarded-Encrypted: i=1; AKwUvBzt+8+RR/b/gJsezoq6dQRbwadMx2hPkpnUQfL8GlypdoJD9SOQrt40DG5fC9VMWyo9RXgwYCVMgfTCW2E=@vger.kernel.org
X-Gm-Message-State: AFuF++kulxHKlP4paRdkvmesaFkTowbRV84v4gxYwrf5Kjb1bQBlib3G
	vHDEVaD6h81Bt/axqzGhJ6SI13xgO6bGnXyxECNTtho8q98GYBxYxFkZX5/ZFnI7CddiyMYD1H4
	m07U61a9rn4K7beVrd5owqbVp+mSbij4=
X-Gm-Gg: AYBFou15LzTcFUAikrsRHWC53LTyStdyhKlD00inhLjgHfmPfgcJiWjOkqUQKbGi5Jd
	85OmsgNDmHbwfS8rt3XaIyIPNj6wxQlHg9HbM9tqfjBZH6tmGMITdiQc0CIdGVy6EarEgyvtFLv
	QVgyaOmJSYEdUWUtcDzVjkDikPgTbacID9p0oN0R7C2dvEQN/LB/59edbS+ByzLKVc3mSmojGCE
	YSfhEs7vtB3wvcbMoHronLsiRd1f9Y/qgJFlfYdDOiS3ENUXvMX4rZLlo5/zlFXR5lksSAMiUOF
	GX47W98qagHuXNWtWkXRMYx90evrPOJF1kddBS0G+8fvOCu8InKu9U6K8EGcZeXyPJ2jfohS/A=
	=
X-Received: by 2002:a05:6512:15a9:b0:5b6:4ae:5b7f with SMTP id
 2adb3069b0e04-5b6087d6133mr353785e87.29.1788310242499; Tue, 01 Sep 2026
 17:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <20260830114731.8322-3-wujianyue000@gmail.com>
 <20260901161329.GI3004@cmpxchg.org>
In-Reply-To: <20260901161329.GI3004@cmpxchg.org>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 2 Sep 2026 08:50:30 +0800
X-Gm-Features: AcwNN1VZP9I5AiwbB0AJlzk0UO5pYmHN9ADWJl1TgGW01163D6x1NbqVrjb50eI
Message-ID: <CAJxJ_jhkM4HHgCi-OsQcoDeDC5_fsejf+u+b5E1n3gNUd=EJmQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/3] mm/zswap: replace the zswap_pools list with a
 fixed pools array
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 12:13=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Sun, Aug 30, 2026 at 07:47:30PM +0800, Jianyue Wu wrote:
> > Originally zswap holds its pools on an RCU list whose head also serves
> > as the "current pool". Only a handful of pools are ever live at once,
> > since a new pool is only created when the compressor is (re)set and
> > pools are reused across compressor switches.
> >
> > Hold the pools in a fixed ZSWAP_MAX_POOLS-element array so each pool
> > has a stable slot number, and track the current pool with a separate
> > rcu-protected pointer.
> >
> > Slot 0 is intentionally left unused (always NULL): a zeroed or
> > incorrectly initialized pool index then resolves to NULL and trips a
> > WARN rather than silently aliasing a live pool in another slot.
> >
> > The array keeps the same RCU publish/retire discipline the list had,
> > so lookup and teardown stay equivalent. A fully-constructed pool is
> > stored into its slot as the last step of zswap_pool_create(), so array
> > walkers only ever observe a NULL slot or a ready pool. Pool creation
> > is serialized by the module-wide kernel param mutex (all built-in
> > params share one lock) and otherwise only happens during
> > single-threaded init, so no two creators race for a slot.
> > zswap_pools_lock still serializes the store against a retiring pool
> > clearing its slot in __zswap_pool_empty().
> >
> > Behavior change: the fixed array bounds the number of simultaneously
> > live pools at ZSWAP_MAX_POOLS - 1 (15, since slot 0 is reserved),
> > whereas the old list was unbounded. A pool is only live while it is
> > the current pool or still has stored pages referencing it, and pools
> > are reused across compressor switches, so 15 is far more than any real
> > configuration needs. Once all slots are occupied, creating a pool for
> > a 16th distinct compressor fails: zswap_pool_create() errors and
> > returns NULL, and the compressor switch is rejected with -EINVAL
> > rather than silently succeeding. The cap can be raised by increasing
> > ZSWAP_MAX_POOLS (bounded by the u8 slot index, so up to 256).
> >
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Suggested-by: Yosry Ahmed <yosry@kernel.org>
> > Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> > ---
> >  mm/zswap.c | 97 ++++++++++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 72 insertions(+), 25 deletions(-)
> >
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 0bb30e58950a..b3b5e2887c00 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -13,6 +13,7 @@
> >
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/module.h>
> >  #include <linux/cpu.h>
> >  #include <linux/highmem.h>
> > @@ -154,12 +155,27 @@ struct zswap_pool {
> >       struct zs_pool *zs_pool;
> >       struct crypto_acomp_ctx __percpu *acomp_ctx;
> >       struct percpu_ref ref;
> > -     struct list_head list;
> >       struct rcu_work release_work;
> >       struct hlist_node node;
> > +     u8 idx;
> >       char tfm_name[CRYPTO_MAX_ALG_NAME];
> >  };
> >
> > +#define ZSWAP_MAX_POOLS 16
>
> It's unlikely to happen, but this is a super annoying failure
> mode. User would have to kill something, delete shmem/tmpfs, or
> swapoff. And it's not obvious which entries are in which pool.
>
> Wouldn't an idr make more sense?
>
> > @@ -270,6 +283,31 @@ static void acomp_ctx_free(struct crypto_acomp_ctx=
 *acomp_ctx)
> >       acomp_ctx->buffer =3D NULL;
> >  }
> >
> > +/*
> > + * Publish a fully-constructed pool into a free array slot.  Pool crea=
tion is
> > + * serialized by the module-wide kernel param mutex (all built-in para=
ms share
> > + * one lock) and only otherwise happens during single-threaded init, s=
o no two
> > + * creators race for a slot.  The pool is complete before it is stored=
, and
> > + * zswap_pools_lock still serializes this store against a concurrent r=
etiring
> > + * pool clearing its slot in __zswap_pool_empty(), so array walkers on=
ly ever
> > + * observe a NULL slot or a ready pool.
> > + */
> > +static int zswap_pool_assign_slot(struct zswap_pool *pool)
> > +{
> > +     int i;
> > +
> > +     guard(spinlock_bh)(&zswap_pools_lock);
> > +     for (i =3D ZSWAP_FIRST_POOL_SLOT; i < ZSWAP_MAX_POOLS; i++) {
> > +             if (!rcu_access_pointer(zswap_pools[i])) {
> > +                     pool->idx =3D i;
> > +                     rcu_assign_pointer(zswap_pools[i], pool);
> > +                     return i;
> > +             }
> > +     }
> > +
> > +     return -ENOSPC;
> > +}
>
> It was kind of overdue, but with this now requiring a pool walk as
> well, it would be better to factor out a find_or_create function?
>
> Something like:
>
> static struct zswap_pool *zswap_pool_find_or_create(char *compressor)
> {
>         struct zswap_pool *pool, *new_pool =3D NULL;
>         u8 id, new_id =3D 0;
>
> insert_new:
>         spin_lock_bh(&zswap_pools_lock);
>         idr_for_each_entry(&zswap_pools, pool, id) {
>                 if (pool && !strcmp(pool->tfm_name, compressor) && zswap_=
pool_tryget(pool)) {
>                         if (new_pool) {
>                                 pool_put(new_pool);
>                                 idr_free(&zswap_pools, new_id);
>                         }
>                         spin_unlock_bh(&zswap_pools_lock);
>                         return pool;
>                 }
>         }
>         if (new_pool) {
>                 idr_replace(&zswap_pools, new_pool, new_id);
>                 spin_unlock_bh(&zswap_pools_lock);
>                 return new_pool;
>         }
>         spin_unlock_bh(&zswap_pools_lock);
>
>         new_pool =3D pool_alloc();
>         if (!new_pool)
>                 ...
>         new_id =3D idr_alloc(&zswap_pools, NULL, 1, 256, GFP_KERNEL);
>         if (new_id < 0)
>                 ...
>         goto insert_new;
> }
Agreed. Hitting the 15-pool cap would be an annoying failure mode, even
if it should be rare.
I will switch this to an IDR with IDs in the 1..255 range, keeping 0 as
the invalid entry value, and factor the lookup/allocation path into a
zswap_pool_find_or_create() helper.

Best regards,
Jianyue
