Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9901D2DA76C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790560506; cv=none; b=IW+8cyOyK2Mvx01yqSxwSr0QzAZFLuYKNR3bCILixSFOWTUnoxmsniuWy3IFUYOzgMHjGsf1L2BAOa0dME0zTXNj26e7KUpGPQzYZQ8fDXfnCxJ7KHYf5nMAGbWjV1LmfsRa/1Zz/Z1noPBcwstiD7JtFqkTj03bfkKLoY0+gcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790560506; c=relaxed/simple;
	bh=47kpwhfBphDNfAl9tT6LtOpbvuS5Dwof1DtjmCZpB8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ie20dtaxcgpl0ergPEzAjIJMZq49YztvCJ7YrcdlNfp/xtpv6XxUTWiyE7XagUVzZLdf1g2KeTv0bq2p62YkKW+JEOnssjRJHN5iCBXh22GO4SmsbfqnA1Qiha3Sn8hSrQf9RAml6S8KPs4FBgjv0yI5HzEuVGL2juY0WnQJJe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efTM8ZTj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efTM8ZTj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F16B1F008A1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790560505;
	bh=CGDHSAQ5tB8MgTGCNrr1v8mE/afcFeNYKkJFVpSD3HM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=efTM8ZTjjCUwGQZqLYzGrQMvIRNj811R0a5ErKv8kIFW/DB39UcjRTPbpaaPEls7j
	 IYG32tcb3oey8Za6dN3D0lmtMftQiLW02Ptv4TzONIcuu0zxm3mt/lp6+XKKB6Mxli
	 kuPne008yO6fgfXySCfK2usA9taAcsIW5yVuwKEY8Yq+Ejzy5+3bll0fZ5jkxMwz6x
	 m9WevhtUkFTch45w4jlCwC4Wf0+2EXPPy+ftvJZUB3rM28a8BrKC5NYRsM2kC6pJJy
	 /ZonZsx9sCNsKZG/oOGH25BFYvfvEhPBIuX0zf8PrqjquhO23rCQO7X7TGYDw9q1zA
	 QRilRG6ReHc5g==
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afd63c3e0so213326366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:55:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgtJkwa/+R4d9KQZc5xt05mzYt7Tpoy1t/TRB6sO04SUNuug4vpiq5DD4OmdxMvnOY/5DvCRWUWGMbMY4=@vger.kernel.org
X-Gm-Message-State: AFuF++lCgCAvP+zEuIAVgOW51+OKBGlDgkjf1qMqdFWXzwND8bHcob7l
	brKtqm0xcDHuj3zvoM+uzJH+eeb4sy0tQM0E+BWWm292JzHQj1uouaaaobM0S7VHLHcMguMNeL1
	5t8PVukrlz/gq+9q8ASix2fbT4gfZuOdLvvLs1RKUdQ==
X-Received: by 2002:a05:6938:a085:20b0:c2a:fd39:f23b with SMTP id
 a640c23a62f3a-c2afd39f9c8mr309429166b.24.1790560504047; Sun, 27 Sep 2026
 18:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-7-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-7-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 15:54:53 -1000
X-Gmail-Original-Message-ID: <CACePvbVDR8k+X_AB03qF6LZNt_VUZKpZjdiBi=otpEBqTbH9dA@mail.gmail.com>
X-Gm-Features: AclHuK_8_Mi_A98RRVS32FyJnZqZq_ytQTjn47If1ciKgv35gXDCap__SJ9tEr0
Message-ID: <CACePvbVDR8k+X_AB03qF6LZNt_VUZKpZjdiBi=otpEBqTbH9dA@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] mm, swap: add xswap grow trigger on cluster allocation
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
> When cluster_alloc_swap_entry() fails to find a free cluster and
> the xswap device still has room to grow, expand the mapped range
> by XSWAP_GROW_CLUSTERS clusters.
>
> Since xswap is always SWP_SOLIDSTATE, global_cluster_lock is never
> held on this path.
>
> This makes the xswap cluster space grow transparently as swap usage
> increases, without any userspace intervention.
>
> Growing maps pages into the VM_SPARSE area, which can sleep. The caller
> holds local_lock(&percpu_swap_cluster.lock) across the whole slow path,
> so drop it around xswap_map_clusters() and take it again afterwards; it
> only protects the per-cpu cluster cache, which this path does not touch.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> ---
>  mm/swapfile.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index b0edf5421fc5..17e482059d32 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -1273,6 +1273,47 @@ static unsigned long cluster_alloc_swap_entry(stru=
ct swap_info_struct *si,
>                 if (found)
>                         goto done;
>         }
> +
> +#ifdef CONFIG_XSWAP
> +       /* For xswap: grow the cluster_info array, then retry. */
> +       if (!found && (si->flags & SWP_XSWAP) &&

I see oppertunity for more swap_ops

Chris

> +           READ_ONCE(si->nr_clusters_mapped) < READ_ONCE(si->nr_clusters=
_max) &&
> +           list_empty(&si->free_clusters)) {
> +               unsigned long nr_new =3D min(READ_ONCE(si->nr_clusters_ma=
x) -
> +                                         READ_ONCE(si->nr_clusters_mappe=
d),
> +                                         XSWAP_GROW_CLUSTERS);
> +               unsigned long start =3D READ_ONCE(si->nr_clusters_mapped)=
;
> +               unsigned long i;
> +               int ret;
> +
> +               /*
> +                * Mapping pages can sleep.  The lock only guards the per=
-cpu
> +                * cluster cache, which this path does not touch.
> +                */
> +               local_unlock(&percpu_swap_cluster.lock);
> +               ret =3D xswap_map_clusters(si, start, nr_new);
> +               local_lock(&percpu_swap_cluster.lock);
> +
> +               if (!ret) {
> +                       for (i =3D start; i < start + nr_new; i++) {
> +                               struct swap_cluster_info *ci =3D &si->clu=
ster_info[i];
> +
> +                               /*
> +                                * A concurrent grower may have taken the=
se already;
> +                                * only add the off-list ones.
> +                                */
> +                               spin_lock(&ci->lock);
> +                               if (ci->flags =3D=3D CLUSTER_FLAG_NONE)
> +                                       move_cluster(si, ci, &si->free_cl=
usters,
> +                                                    CLUSTER_FLAG_FREE);
> +                               spin_unlock(&ci->lock);
> +                       }
> +
> +                       found =3D alloc_swap_scan_list(si, &si->free_clus=
ters,
> +                                                   folio, false);
> +               }
> +       }
> +#endif
>  done:
>         if (!(si->flags & SWP_SOLIDSTATE))
>                 spin_unlock(&si->global_cluster_lock);
> --
> 2.54.0
>
