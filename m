Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F3C3BB69F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791346977; cv=pass; b=YhA9GegDGkBUIV3uUsznSqSEp7Ql5514GSmVBUer0R3rZCRr0kHAQfq9ngWU1LR01nlk9C4FqnrUNe3kf1yqdTj+y/s/yE0s8JYO5ZLTxdHeX9spOujbkmc3e0O5OX/Gt/IqoTi2PzfwjvhhIuAs9OynAPR9YIbZwgpgahwPS2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791346977; c=relaxed/simple;
	bh=R9B3K6jp9Iu6NMvybiHvjdmwg6YiMRtzyId1NI+G8u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmmNs7a+xPw8ZQKH/gTOaLNuk8AgIiiklJi3IMpeLhZ7nwhkyUIv59Gyym0q5PDwb/zIEN420yLOKGEPko3YHNp7zz9LJ2PGv9o4dlnhPPOoUCIcRdZV8AKJ68ARlJG6SR+ntlUSy/BhOWYIWuxHX5MBepxE1kkwJejz4XtV4Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyZdqwkW; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyZdqwkW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so22807005e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 21:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791346973; cv=none;
        d=google.com; s=arc-20260327;
        b=A/9GWP/nYFoZjbHi5g5vOma5NDXlioOttLVv/wnUFuJsEBH2xFRNq0xMUxM4joeZ4l
         PU4btzBBFz2VQ58Onb1SQ7MN+dtKa64foX3YIKeG3cmRsNKso3QCczLav7TI9yn9PMvW
         +ntcRY/NZ43+VRWLDAdgL7n+C28jmjMi3t5BC0oQvMqISElfZh4dILppOuttlPKp2Ohq
         sdteVkUuBIK797jaroAkFSznv+9bScCg81QGeeRNRJGOUFfVoD7NaKdkuon5yExtSZs8
         pQCiH0qFHl2KbKFTTlsC0qbt81IGt3UfUOli2ex0ioTGjDPJWdE275kJChwTE5ij8b4z
         p+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i2ToCfZYIjxq1dZW0uV6rIKGWPZwk3eVVZM+XUvPZcU=;
        fh=Kf9z02JTqGl3b4LYs+XozeJc3Y7ppRjlFvqWEVW4mY8=;
        b=g13aUr3V6MgUm0ADTMHOgpXy+VM4EHO07vj0FuHSuqviuHvtthJvXKmhcOlK9cam2t
         NP1FQ5Cq4X8XBbWZxUWNEiNXblEYULP28uRRoDQowa8Tzmcoh47J4IBj9PcBbm0R3+TJ
         Eg3EZOOYnbOJ5SPL96PoQjg8hTF5135cEchTOw9DdAWdV//TgwNfAVgvIWLEr8fTJhj9
         Ocysc02YjzZS2z06XtNrwVdZdMDoGIQEcnVZSSnmSMKBr7dsbBUxPrDSvQMSkRX/UUby
         MGck6CGAZcSKPm+ZYuEIy9xaFLEbDpciW2EhzQ64DKsld9yYYigjJCYI94x5LpjlM4T4
         SKpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791346973; x=1791951773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i2ToCfZYIjxq1dZW0uV6rIKGWPZwk3eVVZM+XUvPZcU=;
        b=AyZdqwkW8aBj0XbW8vbDWHRc7M6rxfLWYs8tpmzkFvrOsHZfYHNLvmeoxOVFea2xVD
         5DzUpYyOWb+ZVEor2WBGfRNhtfs6xmT2/poQcdlEZTS7WbeXYEzMRVVyeZ7/A/x8rxcU
         oKzk8zSnMe+5ZC9FauJHaucLzW/j39+5eWcz2yJolup09q6ODgZRqMFkD2WMV9baPIUl
         7NjPziSCardh5DbiNLTlwy/yGY73Xii+ONtdd1rc86FimJz3Tyk8fpMeU+OKrt9K4qhZ
         sks5sX55wt2f5JbjptbtqDLw+/QSSGXKvgVryWl1peDi1/IzdvCPpp9Se/n+LGCNLw8b
         ReMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791346973; x=1791951773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2ToCfZYIjxq1dZW0uV6rIKGWPZwk3eVVZM+XUvPZcU=;
        b=n9TfIDDv21ExUgjv9EwNgV/37iRESUST+dlejaLU7VMMhPvU0X8pE1CQEg6w/3nKGD
         ithAarrMnh5t394bGWxe38AvTVW84r3zyM67xQzH7mCxtiFMTkNGHGt0A1Y7Q56h4Edt
         LR4U0oJHDmnjkJ572cF9Kb2C3QBK5STVLliiAox3H/2OJu7al3SNRaTTbHpDBbP2O4ns
         0HymRdZfArAt8GVti9yPCwSHQR1xgDtKeOJJodgQnfAWhylsm1bAjBLI75mCIPxnRfEu
         wHk1aPo2xmj8X5MvzMtBd9+5VJa/+Oydd9Pu9XAGjSI3twBzUhucCArXk6RT3pLwfx4v
         VpVg==
X-Forwarded-Encrypted: i=1; AKwUvBzTaWnaC8hbYP4+yuQOhvXrbu4P1I4JfqS/TjhSm80s7EFOY8FqggYQKjsCFQ/F8cCT1lk4q0DFJZDHM8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l3819z3kPNt5CXFH21Qd3k8s+2hmljyS2XOR3Gwjbh2jicyG9V
	B70+kTmwzu18RbgKmQFGSBqjTG2lcFRrNB8aaZtv33GDEe8ZRQNYP0RNXYgDAs8a8DJ3vV+fluW
	wU13rJDadmcxe+3rji7EQfLy9Y/4ZnGs=
X-Gm-Gg: AYBFou19zm0xdr+uccVPYwN4jMyxMl2s9Z8mpHwsJIR+YBl6EdTaAQK7cw8OD/LhC2k
	FI4Q1ZFjf6AxPtT/hUiqzFKeotVsZAs4at3awid5N/xjX8e++sTQEJgxRBruPfgyKKv7qFSnz+b
	YZlwaA0NGjcmCMUS0aVIcOp2G/eadso/IUYqvCKeVgVkQ835P3iRaxnURSrY4uP/G3tB6wg9CY9
	+KkMia8ToTg8mAXNT7EIVma/uTALLcmlHcBK/pzGznFuVJdPrlxxLfXePiqM2Fq5v3NV77JuCyf
	w85HEQHPWnoV7Nv83Kagqu6uhYWBbyP9W/Ie5TD8NQeCraUZIS/NLuCQp6qLRxGe0yM=
X-Received: by 2002:a05:600c:810c:b0:49c:cee0:f383 with SMTP id
 5b1f17b1804b1-4a18041f7b8mr10922205e9.16.1791346972978; Tue, 06 Oct 2026
 21:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003003136.750633-1-hebaoquan@kylinos.cn> <20261003003136.750633-2-hebaoquan@kylinos.cn>
In-Reply-To: <20261003003136.750633-2-hebaoquan@kylinos.cn>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 7 Oct 2026 12:22:41 +0800
X-Gm-Features: AclHuK-QJ8P9oH6bW9Xc3cLmVBhwZcs9Cuj0L2U9iMoPqhfPswet6J9VLfAmFyU
Message-ID: <CAN_Opa_EqxLATXVqYoOqpCasU9MjiTEW-qw8aGbO_eY6EpKyKw@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] mm: xswap support for zswap
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, hannes@cmpxchg.org, nphamcs@gmail.com, baohua@kernel.org, 
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, klarasmodin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 8:31=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> wr=
ote:
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
> An xswap entry is not added to the zswap writeback LRU: with no backing
> store there is nothing to write it back to. zswap_lru_del() tolerates
> that, since an entry that was never added is on no list.
>
> Co-developed-by: Baoquan He <hebaoquan@kylinos.cn>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> Signed-off-by: Chris Li <chrisl@kernel.org>
> ---
>  include/linux/swap.h |  2 ++
>  mm/page_io.c         | 19 +++++++++++++++++++
>  mm/swap_state.c      |  9 +++++++++
>  mm/swapfile.c        | 28 ++++++++++++++++++++++++----
>  mm/zswap.c           | 11 +++++++++--
>  5 files changed, 63 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 4f686709d71f..9073d29377d8 100644
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
> @@ -378,6 +379,7 @@ void free_folio_and_swap_cache(struct folio *folio);
>  void free_pages_and_swap_cache(struct encoded_page **, int);
>  /* linux/mm/swapfile.c */
>  extern atomic_long_t nr_swap_pages;
> +extern atomic_t nr_real_swapfiles;
>  extern long total_swap_pages;
>  extern atomic_t nr_rotate_swap;
>
> diff --git a/mm/page_io.c b/mm/page_io.c
> index c6824fcd483e..25fa9b82ed46 100644
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
> @@ -486,6 +495,16 @@ void swap_read_folio(struct swap_io_ctx *ctx, struct=
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
> index ebef568cd62e..3a4e9e447b0b 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -884,6 +884,10 @@ struct folio *swap_cluster_readahead(swp_entry_t ent=
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
> @@ -969,6 +973,7 @@ static int swap_vma_ra_win(struct vm_fault *vmf, unsi=
gned long *start,
>  static struct folio *swap_vma_readahead(swp_entry_t targ_entry, gfp_t gf=
p_mask,
>                 struct mempolicy *mpol, pgoff_t targ_ilx, struct vm_fault=
 *vmf)
>  {
> +       struct swap_info_struct *si =3D __swap_entry_to_info(targ_entry);
>         struct swap_io_ctx ctx =3D {};
>         struct blk_plug plug;
>         struct folio *folio;
> @@ -977,6 +982,10 @@ static struct folio *swap_vma_readahead(swp_entry_t =
targ_entry, gfp_t gfp_mask,
>         unsigned long start, end, addr;
>         pgoff_t ilx =3D targ_ilx;
>
> +       /* xswap entries live only in zswap; readahead does not help. */
> +       if (si->flags & SWP_XSWAP)
> +               goto skip;
> +
>         win =3D swap_vma_ra_win(vmf, &start, &end);
>         if (win =3D=3D 1)
>                 goto skip;
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index c3288910b3e3..32c3133e1211 100644
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
> @@ -3268,7 +3275,8 @@ SYSCALL_DEFINE1(swapoff, const char __user *, speci=
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
> @@ -3378,6 +3386,19 @@ static void swap_stop(struct seq_file *swap, void =
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
> @@ -3397,8 +3418,7 @@ static int swap_show(struct seq_file *swap, void *v=
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
> index ae19e301fced..7fe25f0b157c 100644
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
>         folio =3D __swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), =
NULL, mpol,
>                                          NO_INTERLEAVE_INDEX);
> @@ -1511,7 +1516,9 @@ static bool zswap_store_page(struct folio *folio, l=
ong index,
>         entry->referenced =3D true;
>         if (entry->length) {
>                 INIT_LIST_HEAD(&entry->lru);
> -               zswap_lru_add(entry);
> +               /* No backing store: nothing to write these back to. */
> +               if (!(__swap_entry_to_info(page_swpentry)->flags & SWP_XS=
WAP))
> +                       zswap_lru_add(entry);
>         }
>
>         return true;
> @@ -1581,7 +1588,7 @@ bool zswap_store(struct folio *folio)
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

Hi Baoquan,

I checked the xswap handling across the swap I/O, readahead, and
zswap writeback paths.

The SWP_XSWAP handling is consistent with the no-backing-store
invariant: swap_writeout() keeps the folio dirty instead of issuing
swap I/O, swap_read_folio() treats a zswap miss as an invariant
violation rather than falling back to backing-store I/O, and both
readahead paths are bypassed because there is no backing device to
read from.

The nr_real_swapfiles accounting also correctly tracks real swap
devices independently of xswap, so zswap writeback remains enabled
as long as there is a real swap device available. Excluding xswap
entries from the zswap writeback LRU is consistent with the same
invariant.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu
