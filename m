Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BAE4EE868
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536342; cv=none; b=XOJ3Hy5K0PT9pg0RxSBaZ8IozBl3DCrO6m31GsSLSg1si9N62AMtZx9aQpgR0N3OjT/3kyy4O04X+gFekhFujOSbGTv+QBo0ema5RGBnggE2jxCUYkBzcZ4U3Ca4/nlx9PcwdAcRdGN9JFSKN4LBo7rSQrjOI0OO9vJeZ/dMaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536342; c=relaxed/simple;
	bh=qN5mWQmTyowDBe8IZ1u6Cq93NQa4+yxP5doutyvb4f0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+XHP6HTAxqdhbBUtpkWs1KaarlRvD406F6jN/9ejff1pGz43QDhCB1jkw3BUtyzo5Sj9YYF0rYjrztwpDlwxnYQ5rfppzj7AHD6l0/52K4PwQMDZ9qLZZDonbtlvwMwYF9UiSlRMMSjzRA1cL053FEqFHRESIlUMbDiXb4jaP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0q5y71N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0q5y71N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5819C1F00A3E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788536340;
	bh=6+ywn+iFJBI4u5VtxY8RaiWWlMhCJYYHLJoR+W3cfUA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n0q5y71NQGzXSm2fpbpJ41Lw2BVQwWlwa5mH8IKpNVYlx2SSqjfGv+HcMqdNMpDel
	 nRZpe0DW5ytBd73FLrpDK1Mp+i81qgwy3UIF9a0rRgLtWFjQTpjcdkM/uc8wW/R+x1
	 hLsyMfYsSf807l5ozq+J/eJBC+FXmA7EBKEoYhKz3QzaFI20zOEOxwm9ESwkaaddmm
	 jpaZwCLudCzvmYHDh3e7VfJuHXWWmatvbzGdoUBhCgU9YAJDOFono+0nw88UI/0Tw2
	 kewORE4Zx7mRa0Z4yRcTO99gVpXfZ7AsHRjJ1Ag2hOXkzFoF1CGhmwJlPHoOx8QJ2H
	 Q18gWMonkSmxg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso187539666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy+aQ+61XdHQdP90PqKOUuMEzVAxERl9pMw6R6j2zfdjBc2dSNhPhOHjCnKlU92f8Pk8VGk/i+kcVoc4Uc=@vger.kernel.org
X-Gm-Message-State: AFuF++n5Pe5ZpNS34/aE93IIhdSFX9pWBhkMjG1SFPpm5OnfaZKiPHPv
	w8DKDtaXmdN8esylpQ+WhEZUiPtZvUu+lS04HcS9IUlPDrgXe2ImZ9B/PtXtWCL7f5e13YC71/V
	ydohyR+8FrEUXu9FiYQz8MsO+gwHB0l4=
X-Received: by 2002:a17:906:730e:b0:c26:1648:a060 with SMTP id
 a640c23a62f3a-c261648b673mr184938466b.27.1788536336575; Fri, 04 Sep 2026
 08:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830114731.8322-1-wujianyue000@gmail.com> <cover.1788528216.git.wujianyue000@gmail.com>
 <5c4f72f1ffbd5f15d0b57fb1a87f73b4249ab424.1788528216.git.wujianyue000@gmail.com>
In-Reply-To: <5c4f72f1ffbd5f15d0b57fb1a87f73b4249ab424.1788528216.git.wujianyue000@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 4 Sep 2026 08:38:43 -0700
X-Gmail-Original-Message-ID: <CAO9r8zP7LCRaq4e0O_gPz61d+ee6Pt=tBZXQRy4X27idB228rw@mail.gmail.com>
X-Gm-Features: AcwNN1Uq-xb74ABY9zw0rMtVudm20ky-JyPbJrRRmi6zN4PCGk90egkvsX4nMXI
Message-ID: <CAO9r8zP7LCRaq4e0O_gPz61d+ee6Pt=tBZXQRy4X27idB228rw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] mm/zswap: reference the pool by id to shrink
 struct zswap_entry
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 6:25=E2=80=AFAM Jianyue Wu <wujianyue000@gmail.com> =
wrote:
>
> struct zswap_entry is one allocation per stored page, so its size is
> pure overhead. It currently embeds an 8-byte pool pointer, even though
> the live pools now sit in an allocating xarray keyed by a small integer
> id that fits in a u8.
>
> Replace the per-entry pool pointer with that u8 id and resolve it
> through the xarray with xa_load(). A live entry holds a reference to its
> pool, so the id cannot be reused under it; xa_load() is lockless and
> only needs an rcu_read_lock() section, no zswap_pools_lock. A live entry
> never uses the reserved id 0, so looking up that id resolves to NULL
> and trips a WARN rather than aliasing a live pool.
>
> The u8 fits in the padding after the bool referenced field, shrinking
> the entry from 56 to 48 bytes on 64-bit. This raises objs_per_slab from
> 73 to 85 and saves about 2MiB of metadata per 1GiB of data held in
> zswap.
>
> Suggested-by: Chris Li <chrisl@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> ---
>  mm/zswap.c | 45 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 74876acfa9dc..31cf0ef43d23 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -195,7 +195,7 @@ static struct shrinker *zswap_shrinker;
>   *              writeback logic. The entry is only reclaimed by the writ=
eback
>   *              logic if referenced is unset. See comments in the shrink=
er
>   *              section for context.
> - * pool - the zswap_pool the entry's data is in
> + * pool_idx - id of the zswap_pool that the entry's data is in.
>   * handle - zsmalloc allocation handle that stores the compressed page d=
ata
>   * objcg - the obj_cgroup that the compressed memory is charged to
>   * lru - handle to the pool's lru used to evict pages.
> @@ -204,12 +204,27 @@ struct zswap_entry {
>         swp_entry_t swpentry;
>         unsigned int length;
>         bool referenced;
> -       struct zswap_pool *pool;
> +       u8 pool_idx;
>         unsigned long handle;
>         struct obj_cgroup *objcg;
>         struct list_head lru;
>  };
>
> +/*
> + * The pool stays alive after this returns because a stored entry holds =
a
> + * reference to its pool (taken in zswap_store_page()).
> + */
> +static struct zswap_pool *zswap_entry_pool(struct zswap_entry *entry)
> +{
> +       struct zswap_pool *pool;
> +
> +       rcu_read_lock();
> +       pool =3D xa_load(&zswap_pools, entry->pool_idx);
> +       rcu_read_unlock();

Doesn't xa_load() already call rcu_read_[un]lock()?

> +
> +       return pool;
> +}
> +
>  static struct xarray *zswap_trees[MAX_SWAPFILES];
>  static unsigned int nr_zswap_trees[MAX_SWAPFILES];
>
> @@ -770,9 +785,13 @@ static void zswap_entry_cache_free(struct zswap_entr=
y *entry)
>   */
>  static void zswap_entry_free(struct zswap_entry *entry)
>  {
> +       struct zswap_pool *pool =3D zswap_entry_pool(entry);
> +
>         zswap_lru_del(entry);
> -       zs_free(entry->pool->zs_pool, entry->handle);
> -       zswap_pool_put(entry->pool);
> +       if (!WARN_ON_ONCE(!pool)) {
> +               zs_free(pool->zs_pool, entry->handle);
> +               zswap_pool_put(pool);
> +       }
>         if (entry->objcg) {
>                 obj_cgroup_uncharge_zswap(entry->objcg, entry->length);
>                 obj_cgroup_put(entry->objcg);
> @@ -929,12 +948,15 @@ static bool zswap_compress(struct page *page, struc=
t zswap_entry *entry,
>
>  static bool zswap_decompress(struct zswap_entry *entry, struct folio *fo=
lio)
>  {
> -       struct zswap_pool *pool =3D entry->pool;
> +       struct zswap_pool *pool =3D zswap_entry_pool(entry);
>         struct scatterlist input[2]; /* zsmalloc returns an SG list 1-2 e=
ntries */
>         struct scatterlist output;
>         struct crypto_acomp_ctx *acomp_ctx;
>         int ret =3D 0, dlen;
>
> +       if (WARN_ON_ONCE(!pool))
> +               return false;
> +
>         acomp_ctx =3D raw_cpu_ptr(pool->acomp_ctx);
>         mutex_lock(&acomp_ctx->mutex);
>         zs_obj_read_sg_begin(pool->zs_pool, entry->handle, input, entry->=
length);
> @@ -970,7 +992,7 @@ static bool zswap_decompress(struct zswap_entry *entr=
y, struct folio *folio)
>         pr_alert_ratelimited("Decompression error from zswap (%d:%lu %s %=
u->%d)\n",
>                                                 swp_type(entry->swpentry)=
,
>                                                 swp_offset(entry->swpentr=
y),
> -                                               entry->pool->tfm_name,
> +                                               pool->tfm_name,
>                                                 entry->length, dlen);
>         return false;
>  }
> @@ -1428,6 +1450,16 @@ static bool zswap_store_page(struct page *page,
>         if (!zswap_compress(page, entry, pool))
>                 goto compress_failed;
>
> +       /*
> +        * Set pool_idx before publishing the entry: compression has
> +        * succeeded and the pool is already pinned by this store, so the=
 id is
> +        * final.  Doing it here (rather than after xa_store()) means the=
 entry
> +        * is never briefly visible with a stale pool_idx left over from =
slab
> +        * reuse, which zswap_entry_pool() would otherwise resolve to an
> +        * unrelated live pool.
> +        */
> +       entry->pool_idx =3D pool->idx;
> +
>         old =3D xa_store(swap_zswap_tree(page_swpentry),
>                        swp_offset(page_swpentry),
>                        entry, GFP_KERNEL);
> @@ -1473,7 +1505,6 @@ static bool zswap_store_page(struct page *page,
>          *    The publishing order matters to prevent writeback from seei=
ng
>          *    an incoherent entry.
>          */
> -       entry->pool =3D pool;
>         entry->swpentry =3D page_swpentry;
>         entry->objcg =3D objcg;
>         entry->referenced =3D true;
> --
> 2.43.0
>
