Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E97E3C108E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537894; cv=none; b=IwpDOx49v9PQT3HULLWS29BZ5Rj1y49zdkNYW3aTkpIaZsrsVI1FIDp/cf9xYjBmDNjIPgUP3NADN5d0humDLSQzrXkmcjsefZt+xRkeXpqnw55V4m9GeWGjV3BUTseNKavRTircnsUQ59pqx03eo718/JpNAq/RWVh3U1LxSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537894; c=relaxed/simple;
	bh=wrTBKUoWewTCHEY132UmTBgPXYUkfrLpaRpeYH+KDZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWcT7tpdTXAPGSB834CrPPeJalL4Wq9D7NT0DP7NeCBm7zk2N05lLCDodXueBVL5nmPw26ONbUYBIiHbaX7szqACvG/nSpDfZjQ4PVPLhqO0foC4Pn+IuVT4mYHiC4ifbRjMfMZf7hRFmRnw3bxWsIV52+hwrkIlSz0+ZhNPGrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQpvkg59; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQpvkg59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078E11F00A3D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537892;
	bh=Gmmk1t0C2Y1hPKizPmgrlyI9EGo6c5QQyx4vRZ8NgY4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jQpvkg59xrZaJqQj+BYwlw06oZ5X3kZsfc3kDpSgWhZsaJNcUxCx6cX+MkxYh2Dyp
	 l/JSc8jOWtNEMwlBZ8hjQbZasEFSQP2sqx5B79sPYmew10yzO5Ta+sespMRlQAYf+0
	 cSCfUL+Z5PlqK+g95rD2QzihJB1EQIVKcYqio6B+j8LFWfseTpgF86OMJ/1X1FzYIj
	 QqHe1xYF2dMZjefgkMbj1PHtx+GaQ10Tl9eJxSKKFdQRVkEeyI2KjoSWpj/FXS232T
	 CoR321UJ3UMbQFKbJ44imBL++K4YtuwvIpspN+AHVC5Z6UKIo0sKZ8cPMw8Wnui0Us
	 e9GyOjoiLJVBQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c25b661d37dso170400466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:04:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByaAzDGlc3n0fO/i+5UIl/W/2/TM8e/dKEFskK5JyE/do5tSjJSg/xoxmNI3i3KiN9EMKQtgtarPAsPdDI=@vger.kernel.org
X-Gm-Message-State: AFuF++memxIuJ7HeA7aIJDw6FXZt85u1eiVuXvdeo5ltv7WtVqKcF0lL
	F+bN4juxwm/hifggmWaDID9SvCCf+kTiuCSuRlVBe6zME1P180fniPhR35K076Dq06DuPRPTWNb
	U9Zt5xH73BUXohw1r7iS+eQ82kvdfuQI=
X-Received: by 2002:a17:907:94c4:b0:c26:19e3:e984 with SMTP id
 a640c23a62f3a-c2619e3ef27mr162038966b.36.1788537890836; Fri, 04 Sep 2026
 09:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <cover.1788528216.git.wujianyue000@gmail.com>
 <22625ed4915936814f766092e9d7ac6637c5b2f4.1788528216.git.wujianyue000@gmail.com>
In-Reply-To: <22625ed4915936814f766092e9d7ac6637c5b2f4.1788528216.git.wujianyue000@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 4 Sep 2026 09:04:39 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMiOvhy3BZ0NjvL6Wn6e_VpVb-sZzk5bpDFuoXBHbzATA@mail.gmail.com>
X-Gm-Features: AcwNN1WjlVqWQnVgvcTJ5MoeC1gjlI_29fN_QCooc4LogG5zdxtCzAEpPETlkYQ
Message-ID: <CAO9r8zMiOvhy3BZ0NjvL6Wn6e_VpVb-sZzk5bpDFuoXBHbzATA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mm/zswap: replace the zswap_pools list with an
 allocating xarray
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 6:25=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com> =
wrote:
>
> Originally zswap keeps its pools on an RCU list whose head also serves
> as the current pool. Convert the pool table to an allocating xarray
> keyed by a small integer id, and track the current pool with a separate
> RCU-protected pointer.
>
> The xarray gives each pool a stable id for a later zswap_entry shrink.
> XA_FLAGS_ALLOC1 starts ids at 1, so id 0 remains reserved. The id range
> is bounded by ZSWAP_MAX_POOL_ID because the later entry field is a u8.
>
> Keep compressor switching close to the previous flow: look up an
> existing pool under xa_lock, resurrect it outside the lock if reused, or
> create a new one. zswap_pool_create() allocates the pool's id and
> publishes it into the xarray as its final step, so the create call is
> itself atomic: it either fully builds the pool and publishes it, or
> unwinds completely on failure. Publishing makes the pool live, so a
> caller that later fails (e.g. param_set_charp()) must still kill the
> pool to erase it from the xarray. Runtime compressor parameter updates
> are serialized by the module parameter lock, so no speculative loser
> path is needed.
>
> A retiring pool is erased from the xarray in __zswap_pool_empty() and
> freed via queue_rcu_work(), preserving the old RCU teardown ordering.
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> ---
>  mm/zswap.c | 87 +++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 54 insertions(+), 33 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index e456e5080531..74876acfa9dc 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -34,6 +34,7 @@
>  #include <linux/writeback.h>
>  #include <linux/pagemap.h>
>  #include <linux/workqueue.h>
> +#include <linux/xarray.h>
>  #include <linux/list_lru.h>
>  #include <linux/zsmalloc.h>
>
> @@ -154,12 +155,24 @@ struct zswap_pool {
>         struct zs_pool *zs_pool;
>         struct crypto_acomp_ctx __percpu *acomp_ctx;
>         struct percpu_ref ref;
> -       struct list_head list;
>         struct rcu_work release_rwork;
>         struct hlist_node node;
> +       u8 idx;
>         char tfm_name[CRYPTO_MAX_ALG_NAME];
>  };
>
> +/*
> + * Live pools keyed by id (1..ZSWAP_MAX_POOL_ID).  XA_FLAGS_ALLOC1 keeps
> + * the reserved id 0 unallocated, so looking it up never aliases a live
> + * pool.  XA_FLAGS_LOCK_BH makes the xa_lock softirq-safe: it is taken
> + * from __zswap_pool_empty(), which runs from a percpu_ref release
> + * callback in softirq context.
> + */
> +#define ZSWAP_FIRST_POOL_ID 1
> +#define ZSWAP_MAX_POOL_ID U8_MAX
> +static DEFINE_XARRAY_FLAGS(zswap_pools, XA_FLAGS_ALLOC1 | XA_FLAGS_LOCK_=
BH);
> +static struct zswap_pool __rcu *zswap_current_pool;
> +
>  /* Global LRU lists shared by all zswap pools. */
>  static struct list_lru zswap_list_lru;
>
> @@ -200,10 +213,6 @@ struct zswap_entry {
>  static struct xarray *zswap_trees[MAX_SWAPFILES];
>  static unsigned int nr_zswap_trees[MAX_SWAPFILES];
>
> -/* RCU-protected iteration */
> -static LIST_HEAD(zswap_pools);
> -/* protects zswap_pools list modification */
> -static DEFINE_SPINLOCK(zswap_pools_lock);
>  /* pool counter to provide unique names to zsmalloc */
>  static atomic_t zswap_pools_count =3D ATOMIC_INIT(0);
>
> @@ -275,6 +284,7 @@ static struct zswap_pool *zswap_pool_create(char *com=
pressor)
>         struct zswap_pool *pool;
>         char name[38]; /* 'zswap' + 32 char (max) num + \0 */
>         int ret, cpu;
> +       u32 id;
>
>         if (!zswap_has_pool && !strcmp(compressor, ZSWAP_PARAM_UNSET))
>                 return NULL;
> @@ -320,12 +330,24 @@ static struct zswap_pool *zswap_pool_create(char *c=
ompressor)
>                               PERCPU_REF_ALLOW_REINIT, GFP_KERNEL);
>         if (ret)
>                 goto ref_fail;
> -       INIT_LIST_HEAD(&pool->list);
> +
> +       ret =3D xa_alloc_bh(&zswap_pools, &id, pool,
> +                         XA_LIMIT(ZSWAP_FIRST_POOL_ID, ZSWAP_MAX_POOL_ID=
),
> +                         GFP_KERNEL);
> +       if (ret) {
> +               if (ret =3D=3D -EBUSY)
> +                       pr_err("cannot allocate pool id (max %d live pool=
s)\n",
> +                              ZSWAP_MAX_POOL_ID - ZSWAP_FIRST_POOL_ID + =
1);
> +               goto xa_fail;
> +       }
> +       pool->idx =3D id;
>
>         zswap_pool_debug("created", pool);
>
>         return pool;
>
> +xa_fail:
> +       percpu_ref_exit(&pool->ref);
>  ref_fail:
>         cpuhp_state_remove_instance(CPUHP_MM_ZSWP_POOL_PREPARE, &pool->no=
de);
>
> @@ -386,7 +408,7 @@ static void __zswap_pool_release(struct work_struct *=
work)
>         WARN_ON(!percpu_ref_is_zero(&pool->ref));
>         percpu_ref_exit(&pool->ref);
>
> -       /* pool is now off zswap_pools list and has no references. */
> +       /* The pool is no longer in zswap_pools and has no references. */
>         zswap_pool_destroy(pool);
>  }
>
> @@ -398,16 +420,16 @@ static void __zswap_pool_empty(struct percpu_ref *r=
ef)
>
>         pool =3D container_of(ref, typeof(*pool), ref);
>
> -       spin_lock_bh(&zswap_pools_lock);
> +       xa_lock_bh(&zswap_pools);
>
>         WARN_ON(pool =3D=3D zswap_pool_current());
>
> -       list_del_rcu(&pool->list);
> +       __xa_erase(&zswap_pools, pool->idx);
>
>         INIT_RCU_WORK(&pool->release_rwork, __zswap_pool_release);
>         queue_rcu_work(system_percpu_wq, &pool->release_rwork);
>
> -       spin_unlock_bh(&zswap_pools_lock);
> +       xa_unlock_bh(&zswap_pools);

Do we need to call queue_rcu_work() under the lock? I assume not. Can
we just call xa_erase_bh()?

>  }
>
>  static int __must_check zswap_pool_tryget(struct zswap_pool *pool)
> @@ -433,7 +455,8 @@ static struct zswap_pool *__zswap_pool_current(void)
>  {
>         struct zswap_pool *pool;
>
> -       pool =3D list_first_or_null_rcu(&zswap_pools, typeof(*pool), list=
);
> +       pool =3D rcu_dereference_check(zswap_current_pool,
> +                                    lockdep_is_held(&zswap_pools.xa_lock=
));
>         WARN_ONCE(!pool && zswap_has_pool,
>                   "%s: no page storage pool!\n", __func__);
>
> @@ -442,7 +465,7 @@ static struct zswap_pool *__zswap_pool_current(void)
>
>  static struct zswap_pool *zswap_pool_current(void)
>  {
> -       assert_spin_locked(&zswap_pools_lock);
> +       lockdep_assert_held(&zswap_pools.xa_lock);
>
>         return __zswap_pool_current();
>  }
> @@ -462,14 +485,15 @@ static struct zswap_pool *zswap_pool_current_get(vo=
id)
>         return pool;
>  }
>
> -/* type and compressor must be null-terminated */
> +/* compressor must be null-terminated */
>  static struct zswap_pool *zswap_pool_find_get(char *compressor)
>  {
>         struct zswap_pool *pool;
> +       unsigned long id;
>
> -       assert_spin_locked(&zswap_pools_lock);
> +       lockdep_assert_held(&zswap_pools.xa_lock);
>
> -       list_for_each_entry_rcu(pool, &zswap_pools, list) {
> +       xa_for_each(&zswap_pools, id, pool) {
>                 if (strcmp(pool->tfm_name, compressor))
>                         continue;
>                 /* if we can't get it, it's about to be destroyed */
> @@ -495,9 +519,15 @@ unsigned long zswap_total_pages(void)
>  {
>         struct zswap_pool *pool;
>         unsigned long total =3D 0;
> +       unsigned long id;
>
> +       /*
> +        * rcu_read_lock() is required here, not just for xa_for_each(): =
it also
> +        * keeps each pool alive while it is dereferenced, since a concur=
rently
> +        * retired pool is freed via queue_rcu_work() after a grace perio=
d.
> +        */

Doesn't xa_for_each() already handle RCU locking?

>         rcu_read_lock();
> -       list_for_each_entry_rcu(pool, &zswap_pools, list)
> +       xa_for_each(&zswap_pools, id, pool)
>                 total +=3D zs_get_total_pages(pool->zs_pool);
>         rcu_read_unlock();
>
> @@ -554,20 +584,17 @@ static int zswap_compressor_param_set(const char *v=
al, const struct kernel_param
>                 return -ENOENT;
>         }
>
> -       spin_lock_bh(&zswap_pools_lock);
> -
> +       xa_lock_bh(&zswap_pools);
>         pool =3D zswap_pool_find_get(s);

This is the only caller of zswap_pool_find_get(), and since we remove
list_del_rcu() below we have no reason for holding the lock here other
than zswap_pool_find_get(). So let's move the locking inside? I am
also not really sure if we actually need to hold the lock here anymore
to begin with.

>         if (pool) {
>                 zswap_pool_debug("using existing", pool);
>                 WARN_ON(pool =3D=3D zswap_pool_current());
> -               list_del_rcu(&pool->list);
>         }
> +       xa_unlock_bh(&zswap_pools);
>
> -       spin_unlock_bh(&zswap_pools_lock);
> -
> -       if (!pool)
> +       if (!pool) {
>                 pool =3D zswap_pool_create(s);
> -       else {
> +       } else {
>                 /*
>                  * Restore the initial ref dropped by percpu_ref_kill()
>                  * when the pool was decommissioned and switch it again
> @@ -584,23 +611,17 @@ static int zswap_compressor_param_set(const char *v=
al, const struct kernel_param
>         else
>                 ret =3D -EINVAL;
>
> -       spin_lock_bh(&zswap_pools_lock);
> +       xa_lock_bh(&zswap_pools);

Do we still need to hold the lock here?

>
>         if (!ret) {
>                 put_pool =3D zswap_pool_current();
> -               list_add_rcu(&pool->list, &zswap_pools);
> +               rcu_assign_pointer(zswap_current_pool, pool);
>                 zswap_has_pool =3D true;
>         } else if (pool) {
> -               /*
> -                * Add the possibly pre-existing pool to the end of the p=
ools
> -                * list; if it's new (and empty) then it'll be removed an=
d
> -                * destroyed by the put after we drop the lock
> -                */
> -               list_add_tail_rcu(&pool->list, &zswap_pools);
>                 put_pool =3D pool;
>         }
>
> -       spin_unlock_bh(&zswap_pools_lock);
> +       xa_unlock_bh(&zswap_pools);
>
>         /*
>          * Drop the ref from either the old current pool,
> @@ -1788,7 +1809,7 @@ static int zswap_setup(void)
>         pool =3D __zswap_pool_create_fallback();
>         if (pool) {
>                 pr_info("loaded using pool %s\n", pool->tfm_name);
> -               list_add(&pool->list, &zswap_pools);
> +               rcu_assign_pointer(zswap_current_pool, pool);
>                 zswap_has_pool =3D true;
>                 static_branch_enable(&zswap_ever_enabled);
>         } else {
> --
> 2.43.0
>
