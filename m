Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B159031326A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790561038; cv=none; b=r1V5XYPMZRsOb7qnz9AdREgf67BwY/INLYrYqYWsza3jVfvnXIrxuaXD2r5Cq6Ft+0QXyEWocDXVTtzfkBa8alJiruzAPjk+phIVGl28pbleEqCVurkqBD2cnOBcs8QvqKjT+mwN/MC0QCS/RC5nNnJFSombdwoXUoYd8Hmhh+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790561038; c=relaxed/simple;
	bh=Kr+LuwVAKbgYxDRj4VvCtNGTWY5zGTcR0KNDPX9hn/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pi+funGkKU7kJdhqpZ+BWjlNbEqD1H5mxlCPQ9FbHiqZUJecR13b6fovltKA+WMoHq0zlsfBLtr7a1kRZGraAKFqsQB8Tki3p2yb1CIt/cy37vaXCfNQCgMjrv6qSv7BztJ5N9M5nDgsSkpw5JB9ng3UNsM+dgSbrpxDCw8QiH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Np+w+kvQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Np+w+kvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4133F1F0089C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790561036;
	bh=9/3FKQvP1Ka+SxogVdvJXiE6RcRI70d8XNb4XESCRW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Np+w+kvQGN2KCGKSqfy5BcXDTYE3byvf65OqlVMWqpGMoa1Ti9LTBI3trvZudV+zo
	 CEP80C0P0nMNdmEyv+8L/biBYypAM6Tg8kPwXWCJZuKKfWadldYs2HTp5z0ixX9pAw
	 /Jr+GbMSGJO5ZUTKdKQIg4TTC208BhRCJdNeLd2+a8I311kfWYNsIU8gnlrX+0P7MS
	 kuzH78mUGqNgPQtJ+26mPsnwshjJXz1WK9bJpEXnktrZCkfBfmoFySEnYX98xP7zqb
	 f4RRbXyo83T55v9pii5vyVZ6alJpOJ505pBKVhnUcuHh5Jzkk9t0SduPNWeJ1bNzsc
	 UGS0MxVnjn9hg==
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so3914847a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByST06Ncp2aoS6IXJvoWKcJRUDp7pwdOGxO2fcAPaWiyeHQU0dpjVQtNLYtKOKnbIIOin5Az+CzzGBDYqs=@vger.kernel.org
X-Gm-Message-State: AFuF++lV6quO3Fbb1PgVNODTVV5TFwEwFZp4ifGaUOi3yeJbQ/QdbJgu
	DTy4upOZUNCw/KS5RbRm3I4rYeE3nQNKfHj7S8ICVWmhvqta/G6jL0k5dHt44URDwV2YqtG+X38
	HDI8LMftYrVXEeNd9alqOTJbsgEeXcxrToSSwP1GgIA==
X-Received: by 2002:a17:907:72d0:b0:c24:87e5:6491 with SMTP id
 a640c23a62f3a-c2ac20ace40mr968593466b.2.1790561034884; Sun, 27 Sep 2026
 19:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-8-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-8-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 16:03:42 -1000
X-Gmail-Original-Message-ID: <CACePvbXytdA8GRABgvJ-UL=nJwaqxaFyB1djJOTBsjguCBvbFw@mail.gmail.com>
X-Gm-Features: AclHuK9vGArkOfGChBgr40Jbsx8gdK85QlwmN4GAuGwAaTd2abyEAisyKyTXe7U
Message-ID: <CACePvbXytdA8GRABgvJ-UL=nJwaqxaFyB1djJOTBsjguCBvbFw@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] mm, swap: add xswap_try_shrink and shrink
 trigger on cluster free
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, kasong@tencent.com, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:20=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> =
wrote:
>
> Add xswap_try_shrink() to unmap the free clusters at the tail of the
> mapped range. It only reclaims when the range is at most half in use,
> leaving one chunk of slack for the next allocation.
>
> Call it from __free_cluster() after a cluster is released.

I suggest defer the xswap_try_shrink() to later. Even when xarray
frees an internal node, due to fragmentation, there is no guarantee
the page backing the internal xa node will return to the system as
free page.

I consider this issue of free space less critical. The data structure
we are talking about are cluster_info which shared between 512
entries. This is much less than 1 byte per swap entry. So, optimizing
that is a very low priority. We have other ways to optimize this as
well, at the cost of one extra pointer redirection. We can use
kmem_cache_alloc() etc at least we get similar result when freeing the
cluster_info. The pointer can just stay, or we can remove the page if
it contains only 512 empty pointers. Anyway, I consider those not
worthwhile to do at this stage.

Chris


>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> ---
>  mm/swapfile.c | 100 +++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 94 insertions(+), 6 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 17e482059d32..2a03b13c0ed2 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -54,12 +54,13 @@
>
>  #ifdef CONFIG_XSWAP
>  /*
> - * xswap: dynamically grow the cluster_info array via a VM_SPARSE area.
> + * xswap: dynamically grow and shrink the cluster_info array via a
> + * VM_SPARSE area.
>   *
> - * XSWAP_GROW_CLUSTERS is the number of clusters to map in one grow
> - * operation.  It is set to the number of cluster_info structs that
> - * fit in a single page (at least 16), so that the vmalloc page table
> - * overhead is proportional to the number of clusters mapped.
> + * XSWAP_GROW_CLUSTERS is the number of clusters to map/unmap in one
> + * grow/shrink operation: the number of cluster_info structs that fit in
> + * a single page (at least 16), so that the vmalloc page table overhead
> + * is proportional to the number of clusters mapped.
>   */
>  #define XSWAP_GROW_CLUSTERS \
>         max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info)=
, 16)
> @@ -69,6 +70,7 @@ static int xswap_map_clusters(struct swap_info_struct *=
si,
>  static void xswap_unmap_clusters(struct swap_info_struct *si,
>                                  unsigned long start_idx, unsigned long n=
r);
>  static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
> +static void xswap_try_shrink(struct swap_info_struct *si);
>
>  static int xswap_create(int prio);
>
> @@ -696,6 +698,9 @@ static void __free_cluster(struct swap_info_struct *s=
i, struct swap_cluster_info
>         swap_cluster_free_table(ci);
>         move_cluster(si, ci, &si->free_clusters, CLUSTER_FLAG_FREE);
>         ci->order =3D 0;
> +#ifdef CONFIG_XSWAP
> +       xswap_try_shrink(si);
> +#endif
>  }
>
>  /*
> @@ -1063,6 +1068,9 @@ static unsigned int alloc_swap_scan_cluster(struct =
swap_info_struct *si,
>         lockdep_assert_held(&ci->lock);
>         VM_WARN_ON(!cluster_is_usable(ci, order));
>
> +       /* ci is used without ci->lock; an xswap unmap waits for this. */
> +       rcu_read_lock();
> +
>         if (end < nr_pages || ci->count + nr_pages > SWAPFILE_CLUSTER)
>                 goto out;
>
> @@ -1091,6 +1099,7 @@ static unsigned int alloc_swap_scan_cluster(struct =
swap_info_struct *si,
>  out:
>         relocate_cluster(si, ci);
>         swap_cluster_unlock(ci);
> +       rcu_read_unlock();
>         if (si->flags & SWP_SOLIDSTATE) {
>                 this_cpu_write(percpu_swap_cluster.offset[order], next);
>                 this_cpu_write(percpu_swap_cluster.si[order], si);
> @@ -1134,6 +1143,9 @@ static void swap_reclaim_full_clusters(struct swap_=
info_struct *si, bool force)
>                 to_scan =3D swap_usage_in_pages(si) / SWAPFILE_CLUSTER;
>
>         while ((ci =3D isolate_lock_cluster(si, &si->full_clusters))) {
> +               /* As in alloc_swap_scan_cluster(). */
> +               rcu_read_lock();
> +
>                 offset =3D cluster_offset(si, ci);
>                 end =3D min(si->max, offset + SWAPFILE_CLUSTER);
>                 to_scan--;
> @@ -1158,6 +1170,7 @@ static void swap_reclaim_full_clusters(struct swap_=
info_struct *si, bool force)
>                         relocate_cluster(si, ci);
>
>                 swap_cluster_unlock(ci);
> +               rcu_read_unlock();
>                 if (to_scan <=3D 0)
>                         break;
>
> @@ -1506,11 +1519,17 @@ static bool swap_alloc_fast(struct folio *folio)
>         /*
>          * Once allocated, swap_info_struct will never be completely free=
d,
>          * so checking it's liveness by get_swap_device_info is enough.
> +        *
> +        * The cached offset indexes si->cluster_info, which xswap can
> +        * unmap; cover both the read and the use with RCU.
>          */
> +       rcu_read_lock();
>         si =3D this_cpu_read(percpu_swap_cluster.si[order]);
>         offset =3D this_cpu_read(percpu_swap_cluster.offset[order]);
> -       if (!si || !offset || !get_swap_device_info(si))
> +       if (!si || !offset || !get_swap_device_info(si)) {
> +               rcu_read_unlock();
>                 return false;
> +       }
>
>         ci =3D swap_cluster_lock(si, offset);
>         if (cluster_is_usable(ci, order)) {
> @@ -1522,6 +1541,7 @@ static bool swap_alloc_fast(struct folio *folio)
>         }
>
>         put_swap_device(si);
> +       rcu_read_unlock();
>         return folio_test_swapcache(folio);
>  }
>
> @@ -2312,8 +2332,11 @@ swp_entry_t swap_alloc_hibernation_slot(int type)
>         /*
>          * Try the local cluster first if it matches the device. If
>          * not, try grab a new cluster and override local cluster.
> +        *
> +        * Same RCU requirement as swap_alloc_fast().
>          */
>         local_lock(&percpu_swap_cluster.lock);
> +       rcu_read_lock();
>         pcp_si =3D this_cpu_read(percpu_swap_cluster.si[0]);
>         pcp_offset =3D this_cpu_read(percpu_swap_cluster.offset[0]);
>         if (pcp_si =3D=3D si && pcp_offset) {
> @@ -2323,6 +2346,7 @@ swp_entry_t swap_alloc_hibernation_slot(int type)
>                 else
>                         swap_cluster_unlock(ci);
>         }
> +       rcu_read_unlock();
>         if (!offset)
>                 offset =3D cluster_alloc_swap_entry(si, NULL);
>         local_unlock(&percpu_swap_cluster.lock);
> @@ -3981,6 +4005,15 @@ static void xswap_unmap_clusters(struct swap_info_=
struct *si,
>                 return;
>         }
>
> +       /*
> +        * A per-cpu cluster cache can still hold an offset in this range=
.
> +        * Invalidate those references, then wait out the readers that ha=
ve
> +        * already loaded one, so that nobody can dereference cluster_inf=
o
> +        * past this point.  swapoff() needs the same before it releases.
> +        */
> +       flush_percpu_swap_cluster(si);
> +       synchronize_rcu();
> +
>         vm_area_unmap_pages(si->cluster_vm, vm_start, vm_end);
>         /* vm_area_unmap_pages() clears PTEs but does not free pages. */
>         /* TODO: free backing pages via page table walk or tracking bitma=
p */
> @@ -3999,6 +4032,61 @@ static int xswap_mapped_end(pte_t *pte, unsigned l=
ong addr, void *data)
>         *mapped_end =3D addr + PAGE_SIZE;
>         return 0;
>  }
> +
> +/*
> + * Automatic reclaim: leave one chunk of the free tail mapped as slack, =
so
> + * that the next allocation does not grow the range straight back, and o=
nly
> + * unmap once several chunks can go, so the unmap is worth the RCU grace
> + * period it costs.
> + */
> +#define XSWAP_SHRINK_SLACK     XSWAP_GROW_CLUSTERS
> +#define XSWAP_SHRINK_MIN       (XSWAP_GROW_CLUSTERS * 4)
> +
> +/*
> + * Try to shrink the cluster_info tail: unmap contiguous free clusters
> + * at the end of the mapped range.
> + */
> +static void xswap_try_shrink(struct swap_info_struct *si)
> +{
> +       struct swap_cluster_info *ci;
> +       unsigned long nr_mapped, last, idx;
> +
> +       if (!(si->flags & SWP_XSWAP))
> +               return;
> +
> +       nr_mapped =3D READ_ONCE(si->nr_clusters_mapped);
> +       if (nr_mapped <=3D 1) /* keep cluster 0 */
> +               return;
> +
> +       /*
> +        * Reclaim on our own, but only once the mapped range is at most
> +        * half in use: growth is demand driven, so reclaiming on a small=
er
> +        * dip would only map the same clusters again, and every unmap co=
sts
> +        * an RCU grace period.
> +        */
> +       if (swap_usage_in_pages(si) * 2 > nr_mapped * SWAPFILE_CLUSTER)
> +               return;
> +
> +       /* Find the last non-free cluster from the tail */
> +       last =3D nr_mapped;
> +       while (last > 1) {
> +               idx =3D last - 1;
> +               ci =3D &si->cluster_info[idx];
> +               if (ci->count || ci->flags !=3D CLUSTER_FLAG_FREE)
> +                       break;
> +               last =3D idx;
> +       }
> +
> +       if (last =3D=3D nr_mapped)
> +               return; /* nothing to shrink */
> +
> +       if (nr_mapped - last < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> +               return;
> +
> +       last +=3D XSWAP_SHRINK_SLACK;
> +
> +       xswap_unmap_clusters(si, last, nr_mapped - last);
> +}
>  #endif /* CONFIG_XSWAP */
>
>  static int setup_swap_clusters_info(struct swap_info_struct *si,
> --
> 2.54.0
>
