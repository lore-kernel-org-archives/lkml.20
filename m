Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40EA2877DE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558072; cv=none; b=P/bu5ncmGNJLRp36xrbjdB6THrsE/ffyMp1xs1411U+m4ay5fN4itBuSrCMwBcXy/Wo1e1VKD4ZGgtdf7onilZLpf05J7Ccr4FQ+rNNsrM0n1K9Bf45Obnbe8/g4+zCE1D+wsbGMa+caZZrgNclcUEOclkIZHzL/OVFw3Sy+0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558072; c=relaxed/simple;
	bh=a6NSIjs6hF/leTO0jwwQw+H46Ks+qwQ2YrWK/sPHAPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+xjPlWUAkekA2hvWT9cFxRAxKUUdghHK/Bf3xtDzWTVbRD0teU/5e/HMG63ritLMtSTc3vSyC1nY1ktcSsHQTW8pVh/2PMzATc+nVXCcnLAlpNX7U05HXvH3YK3RUAbzB7nZ+5EdSkWYpw7S3kaDH2cYlL5DkZohk9CRR12kiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLCw3fgG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLCw3fgG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0741F00893
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790558070;
	bh=EyC72KWxqDJlbXy+hKU7j6uBzgNXP3yzZ3b3YBNMi7A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QLCw3fgG6q/kDHGYx4lHt+MrSUfstHkF0ztBYLEPnlZPSGbxTDekAXN+eXBnndUJL
	 oW6HhlSsSNs5WiJPbnRCTizdTReW+4jgqebmckTMndCBIRpJu5laZ0bcH5q7h2FBIF
	 Ae5gIHNxsZwYPAss4VjubqamHU4r+63w7W3OcvVi/fqEfLmtBkHVjVBJQSEJ7oqnj5
	 BWLKlnf+jX6VhDxGWeTNO9A6mjGue66KL9IRwruaTm9itXuVoqwGddt6PjQFoEfroA
	 A27kxghPj9WL1YYgjtZzrWYfYDVc5LL7MN+rk1uYi3DBf0fHCXuvH/qZsGS3ZyvLU9
	 zG3qbj4jsWTLA==
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaea1cb2e4so2863463a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:14:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByEoPRI3SRazmY/siucGxRq2oFAydXOFpxcA4QxvK/x8GsMn/6rW9IETeR2e/73WWnmR6IVR0QkeiTLlnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMjRUj2X0fY86FxtmHjkcSl18H9FwnP7lD189UtXISMwl0r629
	1YJ92PAcqv/dBdY/zPoxtDvSA0AKgvbCe98jHp9NE8nO6Q0jUvfEtlUqX8nvMBQDh6vu7cyywrt
	wSsZlVLcHRHu9yAtKqKVY0H1gXnNQCVhQ1OwHhroj/w==
X-Received: by 2002:a05:6402:a0ca:b0:6aa:9f93:e991 with SMTP id
 4fb4d7f45d1cf-6aac8f40750mr7984598a12.3.1790558069240; Sun, 27 Sep 2026
 18:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-2-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-2-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 15:14:18 -1000
X-Gmail-Original-Message-ID: <CACePvbVrd+e6FAK6m8PuoD_Lcen13SeYus=gbQxXCm10AZm1ZA@mail.gmail.com>
X-Gm-Features: AclHuK-AO377KDisb_ZyQ54ljtndVAy04GqfAKOJ8KfE0jbtV5rzs_avyITVamQ
Message-ID: <CACePvbVrd+e6FAK6m8PuoD_Lcen13SeYus=gbQxXCm10AZm1ZA@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] mm: xswap support for zswap
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, kasong@tencent.com, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:19=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> =
wrote:
>
> From: Chris Li <chrisl@kernel.org>
>
> Introduce extendable swap device support - xswap.
>
> An xswap device has no backing storage and no swap data section, so
> it wastes no disk space. Creation is via a sysfs interface added in a
> later patch.
>
> Zswap writeback is gated on whether a real (non-xswap) swap device is
> active. nr_real_swapfiles counts such devices and is maintained at
> swapon/swapoff only, so the gate reflects "a device exists to write
> back to" rather than "a device currently has free slots". This keeps
> writeback working even when the real swap device is full, and avoids
> a double decrement when a full device is swapped off.
>
> Co-developed-by: Baoquan He <hebaoquan@kylinos.cn>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> Signed-off-by: Chris Li <chrisl@kernel.org>

Reviewed-by: Chris Li <chrisl@chrisli.org>

Chris

> ---
>  include/linux/swap.h |  2 ++
>  mm/page_io.c         | 19 +++++++++++++++++++
>  mm/swap_state.c      |  4 ++++
>  mm/swapfile.c        | 28 ++++++++++++++++++++++++----
>  mm/zswap.c           |  7 ++++++-
>  5 files changed, 55 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 43155e122b5c..b4331ca4759a 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -201,6 +201,7 @@ enum {
>         SWP_STABLE_WRITES =3D (1 << 11),  /* no overwrite PG_writeback pa=
ges */
>         SWP_SYNCHRONOUS_IO =3D (1 << 12), /* synchronous IO is efficient =
*/
>         SWP_HIBERNATION =3D (1 << 13),    /* pinned for hibernation */
> +       SWP_XSWAP       =3D (1 << 14),    /* extendable swap device */
>                                         /* add others here before... */
>  };
>
> @@ -375,6 +376,7 @@ void free_folio_and_swap_cache(struct folio *folio);
>  void free_pages_and_swap_cache(struct encoded_page **, int);
>  /* linux/mm/swapfile.c */
>  extern atomic_long_t nr_swap_pages;
> +extern atomic_t nr_real_swapfiles;
>  extern long total_swap_pages;
>  extern atomic_t nr_rotate_swap;
>
> diff --git a/mm/page_io.c b/mm/page_io.c
> index 1da4ff484f09..d685c2e2429a 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -248,6 +248,15 @@ int swap_writeout(struct swap_io_ctx *ctx, struct fo=
lio *folio)
>         }
>         rcu_read_unlock();
>
> +       /*
> +        * xswap has no backing store: keep the folio.  ctx->sis is not s=
et
> +        * yet, so look the device up from the entry.
> +        */
> +       if (unlikely(__swap_entry_to_info(folio->swap)->flags & SWP_XSWAP=
)) {
> +               folio_mark_dirty(folio);
> +               return AOP_WRITEPAGE_ACTIVATE;
> +       }
> +
>         __swap_writeout(ctx, folio);
>         return 0;
>  out_unlock:
> @@ -482,6 +491,16 @@ void swap_read_folio(struct swap_io_ctx *ctx, struct=
 folio *folio)
>         if (zswap_load(folio) !=3D -ENOENT)
>                 goto finish;
>
> +       if (unlikely(sis->flags & SWP_XSWAP)) {
> +               /*
> +                * An xswap entry only ever lives in zswap, so zswap_load=
()
> +                * must have found it.  Unlock and let the caller retry.
> +                */
> +               WARN_ON_ONCE(1);
> +               folio_unlock(folio);
> +               goto finish;
> +       }
> +
>         /* We have to read from slower devices. Increase zswap protection=
. */
>         zswap_folio_swapin(folio);
>         swap_add_folio(ctx, folio, READ);
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index 625c185a1ca4..8bba3e533b28 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -837,6 +837,10 @@ struct folio *swap_cluster_readahead(swp_entry_t ent=
ry, gfp_t gfp_mask,
>         struct blk_plug plug;
>         swp_entry_t ra_entry;
>
> +       /* xswap entries live only in zswap; readahead does not help. */
> +       if (si->flags & SWP_XSWAP)
> +               goto skip;
> +
>         mask =3D swapin_nr_pages(offset) - 1;
>         if (!mask)
>                 goto skip;
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 280dd906eb18..13ae681acf07 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -66,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
>  static DEFINE_SPINLOCK(swap_lock);
>  static unsigned int nr_swapfiles;
>  atomic_long_t nr_swap_pages;
> +atomic_t nr_real_swapfiles;
>  /*
>   * Some modules use swappable objects and may try to swap them out under
>   * memory pressure (via the shrinker). Before doing so, they may wish to
> @@ -733,7 +734,8 @@ static void free_cluster(struct swap_info_struct *si,=
 struct swap_cluster_info *
>         /*
>          * If the swap is discardable, prepare discard the cluster
>          * instead of free it immediately. The cluster will be freed
> -        * after discard.
> +        * after discard.  xswap has no bdev and never sets
> +        * SWP_PAGE_DISCARD, so it always takes the free path below.
>          */
>         if ((si->flags & (SWP_WRITEOK | SWP_PAGE_DISCARD)) =3D=3D
>             (SWP_WRITEOK | SWP_PAGE_DISCARD)) {
> @@ -1216,6 +1218,9 @@ static void del_from_avail_list(struct swap_info_st=
ruct *si, bool swapoff)
>                  */
>                 lockdep_assert_held(&si->lock);
>                 si->flags &=3D ~SWP_WRITEOK;
> +               /* Count active devices, not merely those on the avail li=
st. */
> +               if (!(si->flags & SWP_XSWAP))
> +                       atomic_sub(1, &nr_real_swapfiles);
>                 atomic_long_or(SWAP_USAGE_OFFLIST_BIT, &si->inuse_pages);
>         } else {
>                 /*
> @@ -1273,6 +1278,8 @@ static void add_to_avail_list(struct swap_info_stru=
ct *si, bool swapon)
>         }
>
>         plist_add(&si->avail_list, &swap_avail_head);
> +       if (swapon && !(si->flags & SWP_XSWAP))
> +               atomic_add(1, &nr_real_swapfiles);
>
>  skip:
>         spin_unlock(&swap_avail_lock);
> @@ -3266,7 +3273,8 @@ SYSCALL_DEFINE1(swapoff, const char __user *, speci=
alfile)
>
>         destroy_swap_extents(p, p->swap_file);
>
> -       if (!(p->flags & SWP_SOLIDSTATE))
> +       if (!(p->flags & SWP_XSWAP) &&
> +           !(p->flags & SWP_SOLIDSTATE))
>                 atomic_dec(&nr_rotate_swap);
>
>         mutex_lock(&swapon_mutex);
> @@ -3376,6 +3384,19 @@ static void swap_stop(struct seq_file *swap, void =
*v)
>         mutex_unlock(&swapon_mutex);
>  }
>
> +static const char *swap_type_str(struct swap_info_struct *si)
> +{
> +       struct file *file =3D si->swap_file;
> +
> +       if (si->flags & SWP_XSWAP)
> +               return "xswap\t";
> +
> +       if (S_ISBLK(file_inode(file)->i_mode))
> +               return "partition";
> +
> +       return "file\t";
> +}
> +
>  static int swap_show(struct seq_file *swap, void *v)
>  {
>         struct swap_info_struct *si =3D v;
> @@ -3395,8 +3416,7 @@ static int swap_show(struct seq_file *swap, void *v=
)
>         len =3D seq_file_path(swap, file, " \t\n\\");
>         seq_printf(swap, "%*s%s\t%lu\t%s%lu\t%s%d\n",
>                         len < 40 ? 40 - len : 1, " ",
> -                       S_ISBLK(file_inode(file)->i_mode) ?
> -                               "partition" : "file\t",
> +                       swap_type_str(si),
>                         bytes, bytes < 10000000 ? "\t" : "",
>                         inuse, inuse < 10000000 ? "\t" : "",
>                         si->prio);
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 507f2d19fd2a..96fb993d18cb 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1018,6 +1018,11 @@ static int zswap_writeback_entry(struct zswap_entr=
y *entry,
>         if (IS_ERR_OR_NULL(si))
>                 return -ENOENT;
>
> +       if (si->flags & SWP_XSWAP) {
> +               put_swap_device(si);
> +               return -EINVAL;
> +       }
> +
>         mpol =3D get_task_policy(current);
>         folio =3D swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NU=
LL, mpol,
>                                        NO_INTERLEAVE_INDEX);
> @@ -1567,7 +1572,7 @@ bool zswap_store(struct folio *folio)
>         zswap_pool_put(pool);
>  put_objcg:
>         obj_cgroup_put(objcg);
> -       if (!ret && zswap_pool_reached_full)
> +       if (!ret && zswap_pool_reached_full && atomic_read(&nr_real_swapf=
iles))
>                 queue_work(shrink_wq, &zswap_shrink_work);
>  check_old:
>         /*
> --
> 2.54.0
>
>
