Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A4164AA4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573274; cv=none; b=Ax5VFBuQuu5zG+Rv6nKuL6/WYOhWd+b5KzCEGGBufUhFHUhqvI8Xgcy/dSYGKm/hKLEZR+q3eT2LBaadu7vhS+9KSEJvyOnpJqXD0LReNDoqMQUhKCOV3FfodtPwRUQGCtAFKBlliG0DRv3ZI9OMnibwvDnp1g3i8IUS3dPd5rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573274; c=relaxed/simple;
	bh=/OWcoVOmfIwDzoP5klj1TqOqxbzhmsIOzRh6rT85dmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPqn8/j9mjFFF/AwLGn52GXD9CYnFw6FvPUqD09okZhqOzUPzy2hytu1cAEtXkxo50YZQD9NTycRKiOj8UUcwTNfNbw3Hz/10CUXRnji0SmrZ1UWk9N507FL7y78t/ZRaO0UEjk/BJRuJbBnI78Z5V/8vXByWwFGnIK5foHjpdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mL5yvZ5i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mL5yvZ5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD841F0089D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790573272;
	bh=LtDQsUaoE80LpGWygXylMoxi45gP7jEU9bpilPAR5EQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mL5yvZ5iMgi0ScuF9PQW7dTbRPCRDiCgGCmuPAUsbO/bmzz04FJ3F0GxJLP4Yo1Kg
	 ddA+nboQO13qF65jrFBN+y0OeXLX1bWSOcPcMOK1LAMykj2CHObqNh/vUr0XC1O2bp
	 zGnCX7v/GI0ptnJ7hLAV9Ifsu7JcDeBO99m8IAOnDy/Fxki6vgqAj//pKHqGXXwAxq
	 bf2VtzZwwbPsvwAwjrUENox2vKISFDTC0Ej0wA85olC2zVY3G0TE3u1kSOLwYTnynt
	 4MksyOBGE3M2P9q7zhyCOapk3l8Lw2QZV+SxVr/rDqaJC1NtZbbeYk4mvVN0nRWPnj
	 zCqrEZQIPjIvw==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af876539fso247710666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:27:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTmkfTtFMu359Q/TkkwticyYsSXCzlNvRRbG5dWtA0yjOlPdCG5WOA3Uqi0RsOGHxOZ+0OfdDn40yFbyM=@vger.kernel.org
X-Gm-Message-State: AFuF++mwK5f+/gPMEtiB7indyNQ5+lfygYVemYHc57TT+S79Kes4CUDu
	JvGc7iAvNlvgyQtT1pJMw4IDTua1MG4AijT//+I02q6kIJ8Q9pIHXcmTD/STX4x3cCrmpUgKn6b
	WZT5gfIsjZMOYiZRSJBUbZIKSSBC1fUwh1TKoSuZKlg==
X-Received: by 2002:a17:907:e0c7:10b0:c2a:f439:f028 with SMTP id
 a640c23a62f3a-c2af439f86amr378049266b.24.1790573271283; Sun, 27 Sep 2026
 22:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-10-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-10-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 19:27:39 -1000
X-Gmail-Original-Message-ID: <CACePvbWa5RwGsgeg5qpQBqCdS34dfWs6kbpqjtEBpUo7R-20ZA@mail.gmail.com>
X-Gm-Features: AclHuK8pRQ2CTtQwqyX1ttiYtcOzoPDoMittu3JII_QT55qE4hqN0Lg9tjKul68
Message-ID: <CACePvbWa5RwGsgeg5qpQBqCdS34dfWs6kbpqjtEBpUo7R-20ZA@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] mm, swap: defer xswap shrink to workqueue to
 avoid lock recursion
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, kasong@tencent.com, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:21=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> =
wrote:
>
> __free_cluster() called xswap_try_shrink() while holding ci->lock, but
> shrinking unmaps the backing pages and the subsequent unlock faults on
> the unmapped address. Run the shrink via schedule_work() instead, so no
> cluster lock is held. The work is only scheduled for xswap devices and
> is cancelled on swapoff.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>

I will skip the review for shrinking related patches for now.

Chris


> ---
>  include/linux/swap.h |   1 +
>  mm/swapfile.c        | 123 +++++++++++++++++++++++++++++++++----------
>  2 files changed, 97 insertions(+), 27 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 8c62a53667bb..30642bb481df 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -246,6 +246,7 @@ struct swap_info_struct {
>         struct vm_struct        *cluster_vm;    /* VM_SPARSE area for clu=
ster_info */
>         unsigned long           nr_clusters_max;/* total clusters in the =
xswap address space */
>         unsigned long           nr_clusters_mapped; /* currently mapped c=
luster count */
> +       struct work_struct      xswap_shrink_work; /* deferred shrink tri=
gger */
>         struct mutex            xswap_lock;     /* serialize map/unmap op=
erations */
>  #endif
>         struct list_head free_clusters; /* free clusters list */
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 5b31aacb3ec5..351c68bcd70b 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -699,7 +699,9 @@ static void __free_cluster(struct swap_info_struct *s=
i, struct swap_cluster_info
>         move_cluster(si, ci, &si->free_clusters, CLUSTER_FLAG_FREE);
>         ci->order =3D 0;
>  #ifdef CONFIG_XSWAP
> -       xswap_try_shrink(si);
> +       /* Only xswap devices, and not while the device is being torn dow=
n. */
> +       if ((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK))
> +               schedule_work(&si->xswap_shrink_work);
>  #endif
>  }
>
> @@ -3328,6 +3330,7 @@ static void free_swap_cluster_info(struct swap_info=
_struct *si)
>         if (si->flags & SWP_XSWAP) {
>                 unsigned long nr_mapped;
>
> +               cancel_work_sync(&si->xswap_shrink_work);
>                 /*
>                  * Cluster 0 keeps the bad header slot, so it never empti=
es
>                  * and __free_cluster() never frees its table.
> @@ -3452,6 +3455,11 @@ SYSCALL_DEFINE1(swapoff, const char __user *, spec=
ialfile)
>         spin_unlock(&p->lock);
>         spin_unlock(&swap_lock);
>
> +#ifdef CONFIG_XSWAP
> +       if (p->flags & SWP_XSWAP)
> +               cancel_work_sync(&p->xswap_shrink_work);
> +#endif
> +
>         wait_for_allocation(p);
>
>         set_current_oom_origin();
> @@ -4011,8 +4019,9 @@ static int xswap_collect_page(pte_t *pte, unsigned =
long addr, void *data)
>         return 0;
>  }
>
> -static int xswap_unmap_clusters(struct swap_info_struct *si,
> -                               unsigned long start_idx, unsigned long nr=
)
> +/* Caller must hold si->xswap_lock; -ENOMEM leaves the mapping intact. *=
/
> +static int xswap_unmap_clusters_locked(struct swap_info_struct *si,
> +                                      unsigned long start_idx, unsigned =
long nr)
>  {
>         unsigned long start_addr =3D (unsigned long)si->cluster_info +
>                                    (size_t)start_idx * sizeof(struct swap=
_cluster_info);
> @@ -4025,11 +4034,8 @@ static int xswap_unmap_clusters(struct swap_info_s=
truct *si,
>         unsigned int noreclaim_flags;
>         int i;
>
> -       mutex_lock(&si->xswap_lock);
> -
>         if (vm_start >=3D vm_end) {
>                 WRITE_ONCE(si->nr_clusters_mapped, start_idx);
> -               mutex_unlock(&si->xswap_lock);
>                 return 0;
>         }
>
> @@ -4049,10 +4055,8 @@ static int xswap_unmap_clusters(struct swap_info_s=
truct *si,
>         xpd.pages =3D kmalloc_array(npages, sizeof(*xpd.pages),
>                                   __GFP_HIGH | __GFP_NOMEMALLOC | GFP_KER=
NEL);
>         memalloc_noreclaim_restore(noreclaim_flags);
> -       if (!xpd.pages) {
> -               mutex_unlock(&si->xswap_lock);
> +       if (!xpd.pages)
>                 return -ENOMEM;
> -       }
>
>         xpd.nr =3D 0;
>         xpd.max =3D npages;
> @@ -4066,10 +4070,20 @@ static int xswap_unmap_clusters(struct swap_info_=
struct *si,
>         kfree(xpd.pages);
>
>         WRITE_ONCE(si->nr_clusters_mapped, start_idx);
> -       mutex_unlock(&si->xswap_lock);
>         return 0;
>  }
>
> +static int xswap_unmap_clusters(struct swap_info_struct *si,
> +                               unsigned long start_idx, unsigned long nr=
)
> +{
> +       int ret;
> +
> +       mutex_lock(&si->xswap_lock);
> +       ret =3D xswap_unmap_clusters_locked(si, start_idx, nr);
> +       mutex_unlock(&si->xswap_lock);
> +       return ret;
> +}
> +
>  /* Track the end of the run of pages that is already mapped. */
>  static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data)
>  {
> @@ -4090,6 +4104,16 @@ static int xswap_mapped_end(pte_t *pte, unsigned l=
ong addr, void *data)
>  #define XSWAP_SHRINK_SLACK     XSWAP_GROW_CLUSTERS
>  #define XSWAP_SHRINK_MIN       (XSWAP_GROW_CLUSTERS * 4)
>
> +static void xswap_shrink_work_fn(struct work_struct *work)
> +{
> +       struct swap_info_struct *si =3D container_of(work,
> +                       struct swap_info_struct, xswap_shrink_work);
> +
> +       if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
> +               return;
> +       xswap_try_shrink(si);
> +}
> +
>  /*
>   * Try to shrink the cluster_info tail: unmap contiguous free clusters
>   * at the end of the mapped range.
> @@ -4097,14 +4121,16 @@ static int xswap_mapped_end(pte_t *pte, unsigned =
long addr, void *data)
>  static void xswap_try_shrink(struct swap_info_struct *si)
>  {
>         struct swap_cluster_info *ci;
> -       unsigned long nr_mapped, last, idx;
> +       unsigned long nr_mapped, nr_tail, nr_unmap, start_idx, i;
>
>         if (!(si->flags & SWP_XSWAP))
>                 return;
>
> +       mutex_lock(&si->xswap_lock);
> +
>         nr_mapped =3D READ_ONCE(si->nr_clusters_mapped);
> -       if (nr_mapped <=3D 1) /* keep cluster 0 */
> -               return;
> +       if (nr_mapped <=3D 1)     /* keep cluster 0 */
> +               goto out_unlock;
>
>         /*
>          * Reclaim on our own, but only once the mapped range is at most
> @@ -4113,27 +4139,69 @@ static void xswap_try_shrink(struct swap_info_str=
uct *si)
>          * an RCU grace period.
>          */
>         if (swap_usage_in_pages(si) * 2 > nr_mapped * SWAPFILE_CLUSTER)
> -               return;
> +               goto out_unlock;
>
> -       /* Find the last non-free cluster from the tail */
> -       last =3D nr_mapped;
> -       while (last > 1) {
> -               idx =3D last - 1;
> -               ci =3D &si->cluster_info[idx];
> -               if (ci->count || ci->flags !=3D CLUSTER_FLAG_FREE)
> +       /*
> +        * Count the free clusters at the tail of the mapped range.  Scan=
ned,
> +        * not tracked: the count must be exact to size the unmap, and an
> +        * incremental count falls behind on out-of-order frees.
> +        */
> +       nr_tail =3D 0;
> +       while (nr_mapped - nr_tail > 1) {
> +               ci =3D &si->cluster_info[nr_mapped - nr_tail - 1];
> +               if (READ_ONCE(ci->count) ||
> +                   READ_ONCE(ci->flags) !=3D CLUSTER_FLAG_FREE)
>                         break;
> -               last =3D idx;
> +               nr_tail++;
>         }
> +       if (nr_tail < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> +               goto out_unlock;
>
> -       if (last =3D=3D nr_mapped)
> -               return; /* nothing to shrink */
> +       nr_unmap =3D rounddown(nr_tail - XSWAP_SHRINK_SLACK, XSWAP_GROW_C=
LUSTERS);
> +       if (!nr_unmap)
> +               goto out_unlock;
> +       start_idx =3D nr_mapped - nr_unmap;
>
> -       if (nr_mapped - last < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> -               return;
> +       /*
> +        * Only shrink a run that reaches the mapped end; otherwise
> +        * truncating nr_clusters_mapped would orphan the active tail.
> +        */
> +       spin_lock(&si->lock);
> +       for (i =3D start_idx; i < nr_mapped; i++) {
> +               ci =3D &si->cluster_info[i];
> +               if (READ_ONCE(ci->flags) !=3D CLUSTER_FLAG_FREE)
> +                       break;
> +               if (!spin_trylock(&ci->lock)) {
> +                       spin_unlock(&si->lock);
> +                       goto out_unlock;
> +               }
> +               spin_unlock(&ci->lock);
> +       }
> +       if (i !=3D nr_mapped) {
> +               spin_unlock(&si->lock);
> +               goto out_unlock;
> +       }
>
> -       last +=3D XSWAP_SHRINK_SLACK;
> +       for (i =3D start_idx; i < nr_mapped; i++) {
> +               ci =3D &si->cluster_info[i];
> +               list_del_init(&ci->list);
> +               WRITE_ONCE(ci->flags, CLUSTER_FLAG_NONE);
> +       }
> +       spin_unlock(&si->lock);
>
> -       xswap_unmap_clusters(si, last, nr_mapped - last);
> +       if (xswap_unmap_clusters_locked(si, start_idx, nr_unmap)) {
> +               spin_lock(&si->lock);
> +               for (i =3D start_idx; i < nr_mapped; i++) {
> +                       ci =3D &si->cluster_info[i];
> +                       WRITE_ONCE(ci->flags, CLUSTER_FLAG_FREE);
> +                       list_add_tail(&ci->list, &si->free_clusters);
> +               }
> +               spin_unlock(&si->lock);
> +               goto out_unlock;
> +       }
> +
> +out_unlock:
> +       mutex_unlock(&si->xswap_lock);
>  }
>  #endif /* CONFIG_XSWAP */
>
> @@ -4197,6 +4265,7 @@ static int setup_swap_clusters_info(struct swap_inf=
o_struct *si,
>                         }
>                 }
>
> +               INIT_WORK(&si->xswap_shrink_work, xswap_shrink_work_fn);
>                 return 0;
>
>  err_unmap:
> --
> 2.54.0
>
