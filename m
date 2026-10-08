Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D044749E9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450652; cv=pass; b=nrB35Epc95AGltCby/WCoS6V2pDU0TwFxb4M7OS6l5E4Hqw+FqXMyVWqJxnOQ2rudDP0zrasutiIoRdl1pBuCqE2nax52QDyI6m8nMTlUviooTqsqjfOHzeglsD/9q7sJh8xXHfYuaaTd3s5AeVPDAR9Jj3K4EgkkPMdR0GpI1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450652; c=relaxed/simple;
	bh=jit4CxS58l8kQilp5b3EQlArayXKB2WNR27kunanXgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcgophce7QX954epm1lAHxVGIi3YZfQ+EjDnKJohHsU1L4pS+N3AqvuThw9yFQ//reQX+yCkeBJ9wH3oCCHEUp+v6Epzwf0NHVLe/qp3ROsbvxw0+kCO5T9cNg0y8De59DWghV8vAnbbvENcB7CxbuLmI3dUyhxyH32ZPpJM3o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjKZW8Qk; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjKZW8Qk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso46050125e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791450645; cv=none;
        d=google.com; s=arc-20260327;
        b=JObvUyB/oS/Y5LqpJo+JvFnnbyUfRA5dVeC/YF+PKn7d9QaO0WsPnvZtg6MATb9vP3
         ak2eUp3jMFrjj613DfKxPTppQQHJqIun2Ev+4u7hZhV1QKz/uUsJbP+5pH8fIDcbt5dd
         nsDczjkx0ICcvklNfFnXDe6jXJMIs2Ka3GueZ7tPgqTvWEnJJpet8I3eEdWSy3f2H0DA
         04UEbSHZWm0/JEJCVLmkac04xU98vVWm92flsJlwlJTWbOwdEC52hr3+DFOu9WtsD1Br
         LnZpzmWoFE1H6Hl391la7kBvUBZjBFzgFeOhnyS2d4i9ozXq+Sn0U2iabCkw0EWyY/iq
         4s8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVekyCoytYvsWEA/xawPaTKhkTfUsMDuQvQjTfILfOc=;
        fh=HFJDLMpU8BXl2VSQjN6bfjeWDKnJ+kfjkJBkooYPjns=;
        b=g8ypmDbDhYqdqmFDBExicz9kH/DIY982iK7uQxXBB5mP8dFkZ+mP8L5IhCAiBFql5b
         SVrdpshrBzV1FD2FveDkWxAIeCAxlGxOzcr99eP4vEf/xK1UFlyKiEJWkXzHpIWNtd7U
         orTH0q1Qcq5G1oiZ55KbB5cEWs8gOthc17Ox8ppsK1zYoFZk/m1clflBckJr+pcmfrMv
         anFqE2QDg3sprDVENVKcnYqOJMsgPcm6g4jrOMJrX4JG2tTKb4twGHCmZU8HcXhkDzuI
         OODATr5oRmkJOPuWlNU8/5Yll2eecjF5IdK0xeT1PZ/kPfkAiFkBc1Pml5rL8g0Oxykx
         Q6Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791450645; x=1792055445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVekyCoytYvsWEA/xawPaTKhkTfUsMDuQvQjTfILfOc=;
        b=TjKZW8Qkc0JWiqBVoXgQHSumXFcJJjgoMal1OT0UTLW0m0J5PiuDzpxSoGZYzrmSIg
         M5MtsfxfWCX7Uymmf+jnzhQn2wD6mU1cx5BKKLSdA4NcPqCZsVvAozw6doHozok5LhGn
         leYmUOk/IGabLwhoCMk/NHQuzNyj64H2yz4TLwJ8YAwkQAUbcYC1czv57MC9LDsjVzh7
         PPC1EAtSfTbeBN6mOPmUVL1gt5aFNthViXWJJ1oFeA8DV7ZaSNdfX3qgQxWyE6nWgfmH
         OU7R49xlnvVDbZOfKMeZKGpGJPqFemnWzb+bNrOIjWHYGV+V7132gP/pNRy9sYnqhx6Y
         lGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450645; x=1792055445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVekyCoytYvsWEA/xawPaTKhkTfUsMDuQvQjTfILfOc=;
        b=nwdwH8kDks0nfll31+Qbvm9X39i829yfsbYqWVUgGoo7+oi8+gcd2VFSjzuFrsoGRL
         G/cNZH6YkfYY+tw7guAX6VnebP817988lAXjVFPEhqWivQJlQQC8fTe57D48nlQmdgXu
         886qu+EuFEX2iR2AtaFux5fbfRkVYtGcbbdYfX9QA0lRIXA5jGFFahY2r5f/QXoH+4Y1
         b8wH+uuU5uil5hxSIIeExNEyeM4HyicRIPrwwsQtIsdqrzyRCwK2NBXpE1Y5KJ9T1Tpv
         2Xk69hTM6dL9JOT6kHVcwSQ9zKT5vxWcze3ojeYAY5nXizsvRRlrnOx5nRrrZLR1305S
         hXfw==
X-Forwarded-Encrypted: i=1; AKwUvBx6xjnXPDmdlg5tn6S3U0VnoXFHj1rQC3NfbVzxAtiwLMdrlEKh/VU8+dttvwbM0NlhSexTGlOGyhyMcy4=@vger.kernel.org
X-Gm-Message-State: AFuF++lTM9uvt2gjtY/v/K9UV7EMiE8zfDB2qeo6QskEoDIQNxF1PqwV
	W6gvgFoipEq0Bc6b+DZNupeVqUWKagapgu8Qhm5j36VJdBdh3RBFw2ol27v6bobvep6WPSNAgJi
	RNVIimSnY8KpAECzpCk1rljNtDhJo++E=
X-Gm-Gg: AYBFou3yM2OezYx9BYFSRG+C+FaP2djELmAET/sMDuXodQw/eyIHtwHXKdRjL7CnCnw
	bYDBtoOwZ/T09Y5SBqOOikW0i93/7JB1GBLWZP2Nd76iZgypapj7ZygudZBLh71HSx8fGWPB2wb
	C4rhr8FFttUs+I0ivDIVP6DZ+aN+AEhq3Xc+Opgbo9j1NtHIvlmiimfKwFh9zAlAauReZNZ+HnU
	QD3Zu3qGWAuGJJRyj2p+graTgnHOIfVubUBh2nb/ht6F4ofAM0Kgy3FbbKc2PGCttwLecWh1riF
	hkBuecZbyYm9qXmX8KuA5t5hpYO9FwHLtd6BwtjzlB2N1fKqFIWhYk5e
X-Received: by 2002:a05:600c:8211:b0:4a1:6f78:842f with SMTP id
 5b1f17b1804b1-4a18041acfbmr82208975e9.11.1791450643778; Thu, 08 Oct 2026
 02:10:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003003136.750633-1-hebaoquan@kylinos.cn> <20261003003136.750633-9-hebaoquan@kylinos.cn>
In-Reply-To: <20261003003136.750633-9-hebaoquan@kylinos.cn>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 8 Oct 2026 17:10:32 +0800
X-Gm-Features: AclHuK8IQys48doaeIzJ4ioSb5lXI_GS92fTzf02uQErFmsCZ6PV2LE-OBf22GI
Message-ID: <CAN_Opa_JCCd-+o5y9JXbzypPtYjTGvyvnOy7KmSUKHYtVab85w@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] mm, swap: defer xswap shrink to workqueue to
 avoid lock recursion
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, hannes@cmpxchg.org, nphamcs@gmail.com, baohua@kernel.org, 
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, klarasmodin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 8:32=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> wr=
ote:
>
> __free_cluster() called xswap_try_shrink() while holding ci->lock, but
> shrinking unmaps the backing pages and the subsequent unlock faults on
> the unmapped address. Run the shrink via schedule_work() instead, so no
> cluster lock is held. The work is only scheduled for xswap devices and
> is cancelled on swapoff.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> ---
>  include/linux/swap.h |   1 +
>  mm/swapfile.c        | 129 ++++++++++++++++++++++++++++++++-----------
>  2 files changed, 97 insertions(+), 33 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 382a578140b5..12cdc00f78f9 100644
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
> index 7c062e772f5b..49703731ffd5 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -727,7 +727,9 @@ static void __free_cluster(struct swap_info_struct *s=
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
> @@ -3334,6 +3336,7 @@ static void free_swap_cluster_info(struct swap_info=
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
> @@ -4074,8 +4082,9 @@ static void xswap_unmap_range(struct swap_info_stru=
ct *si,
>                 __free_page(pages[i]);
>  }
>
> -static void xswap_unmap_clusters(struct swap_info_struct *si,
> -                                unsigned long start_idx, unsigned long n=
r)
> +/* Caller must hold si->xswap_lock.  Cannot fail. */
> +static void xswap_unmap_clusters_locked(struct swap_info_struct *si,
> +                                       unsigned long start_idx, unsigned=
 long nr)
>  {
>         unsigned long start_addr =3D (unsigned long)si->cluster_info +
>                                    (size_t)start_idx * sizeof(struct swap=
_cluster_info);
> @@ -4087,11 +4096,9 @@ static void xswap_unmap_clusters(struct swap_info_=
struct *si,
>         unsigned int noreclaim_flags;
>         unsigned long npages, idx;
>
> -       mutex_lock(&si->xswap_lock);
> -
>         if (vm_start >=3D vm_end) {
>                 WRITE_ONCE(si->nr_clusters_mapped, start_idx);
> -               goto out_unlock;
> +               return;
>         }
>
>         /*
> @@ -4113,7 +4120,7 @@ static void xswap_unmap_clusters(struct swap_info_s=
truct *si,
>                 xswap_unmap_range(si, vm_start, vm_end, pages, npages);
>                 kvfree(pages);
>                 WRITE_ONCE(si->nr_clusters_mapped, start_idx);
> -               goto out_unlock;
> +               return;
>         }
>
>         /* No memory for the array: unmap in bounded batches instead. */
> @@ -4133,7 +4140,13 @@ static void xswap_unmap_clusters(struct swap_info_=
struct *si,
>         }
>
>         WRITE_ONCE(si->nr_clusters_mapped, start_idx);
> -out_unlock:
> +}
> +
> +static void xswap_unmap_clusters(struct swap_info_struct *si,
> +                                unsigned long start_idx, unsigned long n=
r)
> +{
> +       mutex_lock(&si->xswap_lock);
> +       xswap_unmap_clusters_locked(si, start_idx, nr);
>         mutex_unlock(&si->xswap_lock);
>  }
>
> @@ -4157,6 +4170,16 @@ static int xswap_mapped_end(pte_t *pte, unsigned l=
ong addr, void *data)
>  #define XSWAP_SHRINK_SLACK     XSWAP_GROW_CLUSTERS
>  #define XSWAP_SHRINK_MIN       (XSWAP_GROW_CLUSTERS * 8)
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
> @@ -4164,14 +4187,20 @@ static int xswap_mapped_end(pte_t *pte, unsigned =
long addr, void *data)
>  static void xswap_try_shrink(struct swap_info_struct *si)
>  {
>         struct swap_cluster_info *ci;
> -       unsigned long nr_mapped, last, keep, idx;
> +       unsigned long nr_mapped, nr_tail, keep, nr_unmap, start_idx, i;
>
>         if (!(si->flags & SWP_XSWAP))
>                 return;
>
> +       mutex_lock(&si->xswap_lock);
> +
> +       /* A swapoff raced us and is about to walk this mapping. */
> +       if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
> +               goto out_unlock;
> +
>         nr_mapped =3D READ_ONCE(si->nr_clusters_mapped);
> -       if (nr_mapped <=3D 1) /* keep cluster 0 */
> -               return;
> +       if (nr_mapped <=3D 1)     /* keep cluster 0 */
> +               goto out_unlock;
>
>         /*
>          * Reclaim on our own, but only once the mapped range is at most
> @@ -4181,40 +4210,73 @@ static void xswap_try_shrink(struct swap_info_str=
uct *si)
>          */
>         if (swap_usage_in_pages(si) * 100 >
>             nr_mapped * SWAPFILE_CLUSTER * XSWAP_SHRINK_WHEN)
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
> -
> -       if (last =3D=3D nr_mapped)
> -               return; /* nothing to shrink */
> -
> -       /* Below `last` has to stay mapped: the free ones in between are
> -        * not part of the tail, and unmapping them orphans what is above=
.
> -        */
> -       if (nr_mapped - last < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> -               return;
> +       if (nr_tail < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> +               goto out_unlock;
>
>         /*
>          * Stop at SHRINK_UNTIL rather than at the end of the tail, or th=
e
> -        * range comes out full enough for the grow to be woken.
> +        * range comes out full enough for the grow to be woken.  Below t=
he
> +        * tail everything stays mapped, and one chunk of tail with it.
>          */
>         keep =3D DIV_ROUND_UP(swap_usage_in_pages(si) * 100,
>                             XSWAP_SHRINK_UNTIL * SWAPFILE_CLUSTER);
> -       if (keep < last + XSWAP_SHRINK_SLACK)
> -               keep =3D last + XSWAP_SHRINK_SLACK;
> +       if (keep < nr_mapped - nr_tail + XSWAP_SHRINK_SLACK)
> +               keep =3D nr_mapped - nr_tail + XSWAP_SHRINK_SLACK;
>
>         if (nr_mapped < keep + XSWAP_SHRINK_MIN)
> -               return;
> +               goto out_unlock;
> +
> +       nr_unmap =3D rounddown(nr_mapped - keep, XSWAP_GROW_CLUSTERS);
> +       if (!nr_unmap)
> +               goto out_unlock;
> +       start_idx =3D nr_mapped - nr_unmap;
> +
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
> +
> +       for (i =3D start_idx; i < nr_mapped; i++) {
> +               ci =3D &si->cluster_info[i];
> +               list_del_init(&ci->list);
> +               WRITE_ONCE(ci->flags, CLUSTER_FLAG_NONE);
> +       }
> +       spin_unlock(&si->lock);
>
> -       xswap_unmap_clusters(si, keep, nr_mapped - keep);
> +       xswap_unmap_clusters_locked(si, start_idx, nr_unmap);
> +
> +out_unlock:
> +       mutex_unlock(&si->xswap_lock);
>  }
>  #endif /* CONFIG_XSWAP */
>
> @@ -4278,6 +4340,7 @@ static int setup_swap_clusters_info(struct swap_inf=
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

Hi Baoquan,

While following the shrink path across these patches, I wanted to
clarify the lifetime guarantee for the `cluster_info` backing pages.

P07 flushes the per-CPU swap cluster cache and calls
`synchronize_rcu()` before unmapping the tail. P09 clears
`SWP_WRITEOK` and cancels the shrink work before proceeding with
`wait_for_allocation()` and `try_to_unuse()`.

Could you clarify how the shrink path ensures that, before the tail
is unmapped, no allocation-side reader can still access the tail or
republish a stale per-CPU cache entry that points into it, and no
swapoff-side walker can still access the unmapped range?

Thanks,
Kunwu
