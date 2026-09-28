Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52566330317
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573224; cv=none; b=Gux6aNaM3AAUJKJZuHXEZ1eR+4wqpDApqDCL7IWO5Eib3MwLfOs+b++7GGGyR4vroi+FqpKRgDvP9JGYHfUxwuRCAk3bnF39PQ+jYNJm/H6FglguUHDTRveRBZY1M1+9DG/Uio8JWQofTW7LVTUn5GqyEK95KbD1dt6IcUDx99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573224; c=relaxed/simple;
	bh=Ah2AEUfrYndLMVRhOzPcb9yOaSwuLaxse1o6b8bV0G4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8kd9GSowA6JCWkI+S5RZnYuzx6+vLQC/FqCx4PpuTPTO/rk9JxX3AU8Ledzq4scckYh1HY0RmXgE3rjbSUCxwsco5pSvEdzgrmYT9B2LGMEtf1W6BgoBjB99Lqgn2c6NxYawP8uqQXmV1RHwD/A/jmjh6cJVBOCk/FXlXiHvEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWJGO6r5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWJGO6r5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CF61F0089C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790573222;
	bh=nbR4qOlYxUWlOFxZQwzq4H4GzfUZpkBGmCpDrZmQISY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JWJGO6r57luVC5SxyIky0wYBVV5pFUAcywvoOlCA7HCfVlFKL85EM3O05yACtrogm
	 XJydYynPfBnUbkZs73yhwh2R6yFB2HjXxltXSICbTDK2zHFunAiKUoMrJRYg+A6Cmm
	 yf4tldxuFfjnJ80fdnKhgcuSfJTPjGNFQ7/n4DOLXxqEbsn7Bp/tL8GYVec0AegFMd
	 lpJi6l1FdcUVWHhwfngIQQnWAyyvaLw1Ivp95ZUpdvNkrOKkHi/cRCx0X4bLvI4QKD
	 94M0wDypzcNleeiSrs1S80MSOXDZXS7Chb+LiE0SlEd+LJWeB/1rYf31xOueNJH6h6
	 hE742EtfsHK3w==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso3599901a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:27:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6BJ37q95UwW8twc/jUw8X3Ee/Ds9DHoNLZtH+ve3KFJzWIdvU799xAp/QuyA4tVwiyfBvV5CxYIBRNLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPGhl3vP1JLiiBCN4XJrMmLzFRyfmPzmKUgK4CGxBqeKgTEjwx
	LfpjlkhD579FTdYKrhyKuJr1tqU/iNkIQf3vgQbehw5y3Trql0co9CC/awhCj6PfT5DHR7B3vSQ
	AxMNPY8dCYYX9SN7gnG9ofqlHH1oJTfuP3rD0pPnkrQ==
X-Received: by 2002:a05:6402:2755:b0:6ab:7700:9360 with SMTP id
 4fb4d7f45d1cf-6ab77009470mr3252778a12.21.1790573221307; Sun, 27 Sep 2026
 22:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-9-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-9-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 19:26:49 -1000
X-Gmail-Original-Message-ID: <CACePvbX1ZMu=DJ5AU2fjkOT8Y1o=peetizr1uFag17D8_9_byg@mail.gmail.com>
X-Gm-Features: AclHuK_8kcLS_r3xP2ZiQ5ZwO06a56MHUoBUWTKoqa7lnUBMRC86eB9HZgOK25E
Message-ID: <CACePvbX1ZMu=DJ5AU2fjkOT8Y1o=peetizr1uFag17D8_9_byg@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] mm, swap: free backing pages in xswap_unmap_clusters
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
> vm_area_unmap_pages() does not free the backing pages that
> xswap_map_clusters() allocated, so they leaked on every unmap.
>
> Collect the backing pages from the PTEs before unmapping and free them
> after the PTEs are cleared. The collection array is allocated under
> memalloc_noreclaim_save(); on failure, return -ENOMEM without unmapping.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>

Will this patch still be needed if you don't do the shrinking?

Chris

> ---
>  mm/swapfile.c | 76 +++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 65 insertions(+), 11 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 2a03b13c0ed2..5b31aacb3ec5 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -67,8 +67,8 @@
>
>  static int xswap_map_clusters(struct swap_info_struct *si,
>                               unsigned long start_idx, unsigned long nr);
> -static void xswap_unmap_clusters(struct swap_info_struct *si,
> -                                unsigned long start_idx, unsigned long n=
r);
> +static int xswap_unmap_clusters(struct swap_info_struct *si,
> +                               unsigned long start_idx, unsigned long nr=
);
>  static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
>  static void xswap_try_shrink(struct swap_info_struct *si);
>
> @@ -3343,9 +3343,14 @@ static void free_swap_cluster_info(struct swap_inf=
o_struct *si)
>                         }
>                         spin_unlock(&ci->lock);
>                 }
> -               /* Unmap all mapped clusters and free the VM_SPARSE area =
*/
> -               if (si->nr_clusters_mapped > 0)
> -                       xswap_unmap_clusters(si, 0, si->nr_clusters_mappe=
d);
> +               /*
> +                * free_vm_area() drops the mapping without freeing the p=
ages,
> +                * so the unmap has to succeed first.  Retry; its only fa=
ilure
> +                * is a transient -ENOMEM while collecting the backing pa=
ges.
> +                */
> +               while (si->nr_clusters_mapped > 0 &&
> +                      xswap_unmap_clusters(si, 0, si->nr_clusters_mapped=
))
> +                       cond_resched();
>                 free_vm_area(si->cluster_vm);
>                 si->cluster_vm =3D NULL;
>                 si->cluster_info =3D NULL;
> @@ -3988,21 +3993,44 @@ static int xswap_map_clusters(struct swap_info_st=
ruct *si,
>         return -ENOMEM;
>  }
>
> -static void xswap_unmap_clusters(struct swap_info_struct *si,
> -                                unsigned long start_idx, unsigned long n=
r)
> +struct xswap_page_data {
> +       struct page **pages;
> +       int nr;
> +       int max;
> +};
> +
> +static int xswap_collect_page(pte_t *pte, unsigned long addr, void *data=
)
> +{
> +       struct xswap_page_data *xpd =3D data;
> +       pte_t pteval =3D ptep_get(pte);
> +
> +       if (!pte_present(pteval))
> +               return 0;
> +       if (xpd->nr < xpd->max)
> +               xpd->pages[xpd->nr++] =3D pte_page(pteval);
> +       return 0;
> +}
> +
> +static int xswap_unmap_clusters(struct swap_info_struct *si,
> +                               unsigned long start_idx, unsigned long nr=
)
>  {
>         unsigned long start_addr =3D (unsigned long)si->cluster_info +
>                                    (size_t)start_idx * sizeof(struct swap=
_cluster_info);
>         unsigned long end_addr =3D start_addr + (size_t)nr * sizeof(struc=
t swap_cluster_info);
>         unsigned long vm_start =3D PAGE_ALIGN(start_addr);
>         unsigned long vm_end =3D PAGE_ALIGN(end_addr);
> +       unsigned long size;
> +       unsigned long npages;
> +       struct xswap_page_data xpd;
> +       unsigned int noreclaim_flags;
> +       int i;
>
>         mutex_lock(&si->xswap_lock);
>
>         if (vm_start >=3D vm_end) {
>                 WRITE_ONCE(si->nr_clusters_mapped, start_idx);
>                 mutex_unlock(&si->xswap_lock);
> -               return;
> +               return 0;
>         }
>
>         /*
> @@ -4014,12 +4042,32 @@ static void xswap_unmap_clusters(struct swap_info=
_struct *si,
>         flush_percpu_swap_cluster(si);
>         synchronize_rcu();
>
> +       size =3D vm_end - vm_start;
> +       npages =3D size >> PAGE_SHIFT;
> +
> +       noreclaim_flags =3D memalloc_noreclaim_save();
> +       xpd.pages =3D kmalloc_array(npages, sizeof(*xpd.pages),
> +                                 __GFP_HIGH | __GFP_NOMEMALLOC | GFP_KER=
NEL);
> +       memalloc_noreclaim_restore(noreclaim_flags);
> +       if (!xpd.pages) {
> +               mutex_unlock(&si->xswap_lock);
> +               return -ENOMEM;
> +       }
> +
> +       xpd.nr =3D 0;
> +       xpd.max =3D npages;
> +       apply_to_existing_page_range(&init_mm, vm_start, size,
> +                                    xswap_collect_page, &xpd);
> +
>         vm_area_unmap_pages(si->cluster_vm, vm_start, vm_end);
> -       /* vm_area_unmap_pages() clears PTEs but does not free pages. */
> -       /* TODO: free backing pages via page table walk or tracking bitma=
p */
> +
> +       for (i =3D 0; i < xpd.nr; i++)
> +               __free_page(xpd.pages[i]);
> +       kfree(xpd.pages);
>
>         WRITE_ONCE(si->nr_clusters_mapped, start_idx);
>         mutex_unlock(&si->xswap_lock);
> +       return 0;
>  }
>
>  /* Track the end of the run of pages that is already mapped. */
> @@ -4152,7 +4200,13 @@ static int setup_swap_clusters_info(struct swap_in=
fo_struct *si,
>                 return 0;
>
>  err_unmap:
> -               xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
> +               /*
> +                * Retry until the unmap succeeds.  Its only failure is a=
 transient
> +                * -ENOMEM while collecting the backing pages.
> +                */
> +               while (si->nr_clusters_mapped > 0 &&
> +                      xswap_unmap_clusters(si, 0, si->nr_clusters_mapped=
))
> +                       cond_resched();
>  err_free_vm:
>                 free_vm_area(si->cluster_vm);
>                 si->cluster_vm =3D NULL;
> --
> 2.54.0
>
