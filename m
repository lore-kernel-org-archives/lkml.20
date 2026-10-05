Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111FC4CC62E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231518; cv=none; b=onRqc6Cg0vTXUB/THZ4PeDpYbj6TgJzWH404a9pmckjScso5Yc9enA/+/HcDrApjaqCU8uvj3mPE2fMGj6InUTMYfdZGULbEoUbUuc2OQEpKXedbi+xc67WVppHdYhsPAR9qMv8kfacc+dW+ImxC1X8ueV6xYfpw2m2aYD3V8rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231518; c=relaxed/simple;
	bh=zLaVXxu1hPRvVTtGn52v4GtmGQd+187pU7Ln8Rsorjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jG2D1OQTvhzSHEjzQiLqoNSdqFNcc+b3I6uvJ93/ffkIOduEdtpAclF7/TLNGGTMZ9DNpclcYcqpRgQLH/wrbnnXD9WPc6Ks6iWat8793K++Qshw4kUbafcYAQbxnxEFJdlnhTiDWxOxcS7FpdYxeo4jCGit09598pE9ZMtEB3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vib4knmL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vib4knmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8891F00898
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791231516;
	bh=aY2j7X8wBXJnkUSvdFrO7hrVLgYV9VQvfdE75ziBQEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Vib4knmLGfUAovO3FFzzs1eZAaIJw1IddjkmwyiDgQB/MHE4iE7ZzjBsfBVIiC/K5
	 uMvB4Ih45YfMJ0uT7vzUqJJerb6guypqGS3ddEJXhJzj2DWye+4QxlyrAz+ooirKq0
	 9ClIlMWFiSwppQl48oAN8OghNE8n7MuDoy/U86vgMUo6V3NuvCg7JNBkrRZwrGHZMO
	 NxvI0nIcgXJttMsZAWJdscctsveqoI3CTudqUJHb0xexiuEYAeCUVdvGz49FT2OG3A
	 Jul3VE6F24zADMyXM2cmZCyEb3FkKrozHKNrGr2/Eqi26XLOGtaavDdcB7vpIsSNLW
	 TAoFKgVHPPOUw==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e1b09e0c7so326287466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:18:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGJMV6///ujxi0A+uD8m2qXGD7JI/VifkZZSJOtzQpHt04zVXLyyJMw0jivWOtDsnG8kZ34j2FDun9U80=@vger.kernel.org
X-Gm-Message-State: AFuF++krBdhrSXXwyKMzH+DAQrVlmypo2gHwEiaOEl9/IsBN8n28yAtV
	6cr1PFA614cPtR4dMLWjRxaBdIwAkrLrIxP3B0qOt8Vic6aYJFuv1wxGLnme/GszqlePFRfH4/k
	AbLNg/F8yBOulhTLg/gv+IQoFXA9cy0U=
X-Received: by 2002:a17:907:3f95:b0:c25:32b0:e56c with SMTP id
 a640c23a62f3a-c2e4a95e407mr977900466b.4.1791231515414; Mon, 05 Oct 2026
 13:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002095503.3585565-1-usama.arif@linux.dev> <20261002095503.3585565-15-usama.arif@linux.dev>
In-Reply-To: <20261002095503.3585565-15-usama.arif@linux.dev>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 5 Oct 2026 13:18:24 -0700
X-Gmail-Original-Message-ID: <CAO9r8zN+9F0yh0bTDsysumziGc=zgs7vZMLvt-nWPhxq36wT0Q@mail.gmail.com>
X-Gm-Features: AclHuK-vsi3EfpgIHJBHYD0tDXS4EbYOA2yKu19KkRG6I9OLgQqCV9dXUAiOl5Y
Message-ID: <CAO9r8zN+9F0yh0bTDsysumziGc=zgs7vZMLvt-nWPhxq36wT0Q@mail.gmail.com>
Subject: Re: [PATCH v8 14/30] mm: zswap: reject high-order swap cache
 allocations backed by zswap
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, chrisl@kernel.org, 
	kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org, 
	ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>, willy@infradead.org, 
	youngjun.park@lge.com, hannes@cmpxchg.org, riel@surriel.com, 
	shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org, baohua@kernel.org, 
	dev.jain@arm.com, baolin.wang@linux.alibaba.com, 
	Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, 
	Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, linux-kernel@vger.kernel.org, 
	nphamcs@gmail.com, shikemeng@huaweicloud.com, qi.zheng@linux.dev, 
	luizcap@redhat.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 2:56=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> zswap stores swapped-out pages one at a time, so a range of swap slots ca=
n
> be split between zswap entries and the backing device. A high-order
> swap-cache folio over such a range cannot be read back in one go: the dis=
k
> read would return stale or zero data for every slot zswap owns.
>
> Reject that in __swap_cache_alloc(). Do the check after the folio is in t=
he
> swap cache: from that point zswap can neither start storing nor start
> writing back any slot in the range, so the answer is stable. Callers
> already fall back to order-0, which zswap_load() handles per page.
>
> Export zswap_is_present() for the PMD-order swap-in users added later.
>
> Co-developed-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Overall looks good, but I think it can be split into 3 patches (one of
which doesn't have to be part of this series), see below.



> ---
>  include/linux/zswap.h |  6 ++++++
>  mm/swap_state.c       | 39 +++++++++++++++++++++++++--------------
>  mm/zswap.c            | 12 +++++++++---
>  3 files changed, 40 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/zswap.h b/include/linux/zswap.h
> index df6cafbe95dc0..94746fb71bb65 100644
> --- a/include/linux/zswap.h
> +++ b/include/linux/zswap.h
> @@ -35,6 +35,7 @@ void zswap_lruvec_state_init(struct lruvec *lruvec);
>  void zswap_folio_swapin(struct folio *folio);
>  bool zswap_is_enabled(void);
>  bool zswap_never_enabled(void);
> +bool zswap_is_present(swp_entry_t entry, unsigned int nr);
>  #else
>
>  struct zswap_lruvec_state {};
> @@ -73,6 +74,11 @@ static inline bool zswap_never_enabled(void)
>         return true;
>  }
>
> +static inline bool zswap_is_present(swp_entry_t entry, unsigned int nr)
> +{
> +       return false;
> +}
> +
>  #endif
>
>  #endif /* _LINUX_ZSWAP_H */
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index 625c185a1ca4d..251b48b2c60e1 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel_stat.h>
>  #include <linux/mempolicy.h>
>  #include <linux/swap.h>
> +#include <linux/zswap.h>
>  #include <linux/leafops.h>
>  #include <linux/init.h>
>  #include <linux/pagemap.h>
> @@ -466,26 +467,27 @@ static struct folio *__swap_cache_alloc(struct swap=
_cluster_info *ci,
>         __swap_cache_do_add_folio(ci, folio, entry);
>         spin_unlock(&ci->lock);
>
> +       /*
> +        * Now that the folio is in the swap cache, zswap can no longer s=
tart
> +        * storing or writing back any slot in the range, so this is a st=
able
> +        * answer. Reject a high-order allocation over a range that alrea=
dy
> +        * has per-page zswap entries.
> +        */
> +       if (order && zswap_is_present(entry, nr_pages)) {
> +               err =3D -EBUSY;
> +               goto delete_folio;
> +       }
> +
>         if (mem_cgroup_swapin_charge_folio(folio, memcg_id,
>                                            vmf ? vmf->vma->vm_mm : NULL, =
gfp)) {
> -               spin_lock(&ci->lock);
> -               __swap_cache_do_del_folio(ci, folio, entry, shadow);
> -               spin_unlock(&ci->lock);
> -               folio_unlock(folio);
> -               /* nr_pages refs from swap cache, 1 from allocation */
> -               folio_put_refs(folio, nr_pages + 1);
> +               err =3D -ENOMEM;
>                 count_mthp_stat(order, MTHP_STAT_SWPIN_FALLBACK_CHARGE);
> -               return ERR_PTR(-ENOMEM);
> +               goto delete_folio;
>         }
>
>         if (order > 1 && folio_memcg_alloc_deferred(folio)) {
> -               spin_lock(&ci->lock);
> -               __swap_cache_do_del_folio(ci, folio, entry, shadow);
> -               spin_unlock(&ci->lock);
> -               folio_unlock(folio);
> -               /* nr_pages refs from swap cache, 1 from allocation */
> -               folio_put_refs(folio, nr_pages + 1);
> -               return ERR_PTR(-ENOMEM);
> +               err =3D -ENOMEM;
> +               goto delete_folio;
>         }
>
>         /* memsw uncharges swap when folio is added to swap cache */
> @@ -499,6 +501,15 @@ static struct folio *__swap_cache_alloc(struct swap_=
cluster_info *ci,
>         /* Caller will initiate read into locked new_folio */
>         folio_add_lru(folio);
>         return folio;
> +
> +delete_folio:
> +       spin_lock(&ci->lock);
> +       __swap_cache_do_del_folio(ci, folio, entry, shadow);
> +       spin_unlock(&ci->lock);
> +       folio_unlock(folio);
> +       /* nr_pages refs from swap cache, 1 from allocation */
> +       folio_put_refs(folio, nr_pages + 1);
> +       return ERR_PTR(err);

Nit: You can pull the refactoring into a separate patch (as well as
most zswap changes, see below), so that this patch only has the
logical change to bail for higher orders if any entry is in zswap.

>  }
>
>  /**
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 507f2d19fd2a4..f5b5827d30084 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1587,11 +1587,14 @@ bool zswap_store(struct folio *folio)
>   * @entry: base swap entry of the range
>   * @nr: number of contiguous slots to check
>   *
> - * Context: The caller must keep the range pinned, otherwise the answer =
can
> - * change under it.
> + * Context: Unless the caller keeps the range pinned, the answer is only=
 a
> + * hint: zswap can store or write back a slot right after this returns. =
A
> + * caller that needs a stable answer must pin the range first, as
> + * __swap_cache_alloc() does by inserting the folio into the swap cache =
before
> + * asking.

I would rather avoid naming specific functions as it will go stale
quickly, and instead list the ways of "pinning" a range.

Also, generally, the changes to mm/zswap.c seem orthogonal to this
patch and can be a separate patch (which would be clearer if
__swap_cache_alloc() isn't named here).

>   * Return: true if at least one slot in the range is in zswap.
>   */
> -static bool zswap_is_present(swp_entry_t entry, unsigned int nr)
> +bool zswap_is_present(swp_entry_t entry, unsigned int nr)
>  {
>         pgoff_t offset =3D swp_offset(entry);
>         struct xarray *tree =3D swap_zswap_tree(entry);
> @@ -1605,6 +1608,9 @@ static bool zswap_is_present(swp_entry_t entry, uns=
igned int nr)
>          */
>         BUILD_BUG_ON(SWAPFILE_CLUSTER > ZSWAP_ADDRESS_SPACE_PAGES);
>
> +       if (zswap_never_enabled())
> +               return false;
> +
>         return xa_find(tree, &index, offset + nr - 1, XA_PRESENT);
>  }
>
> --
> 2.53.0-Meta
>
