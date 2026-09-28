Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F1D346A04
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575969; cv=none; b=n4QJcX3CEUY6bHlVSWGCQJWgwjOtFB7tAB5/D8RSPkd1Eq+2QvlQ1HkAf627K15bvFYqxl58ZqMK3Ot1mwUJB8Y9s2BsctqkNoDYsjAo30hhiw1plMDxFx1Dt99nYftLN4VigosoFEZsZqtrFLpeT1bn7jcvsYDUo3uto5erqAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575969; c=relaxed/simple;
	bh=DWnaqzdxcuEx0i+6hxpaZBIX6h4aQZBP1NAq2B5LJQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdZgtwW7v2Ie7qDhxG+iTL2cxZ9fLwLw372q1vjRkjhL1wAdCUMTpiR92/eSyTtic9SWZv3lBd5ymbdcn+DFAp+rOj7f1iRSux59fy0ntSvve0BlXXbu8RXnO9qWs3sWi5SupNFJbvVm4LKzT6R5+5euvvHljVW88bgaxbqZRwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCiOCjQO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCiOCjQO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1871F0089C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790575968;
	bh=FOvxk9bf4WjHbND3kJz0snmFw7+Hy5AGGjAgEuRz+L0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bCiOCjQOnlRWZjoukb6HnM8P+vJIvgZxfZMSi7TsST9FZrPhX1RpEaw3kjiChJ8sj
	 lid6zKin+wXMSxvSyQVZBwGM5Cnw+ehLAXcUcDsI+Si40zjeqIVGZKp2gNY/QOslr9
	 7pHoa6dqcNtYyzgFpQQKAmpB5eZDmBTh3nBWJC4xXfdXvAg/CediffMjz8pgnxWrn5
	 fJ4saOFH4KNnb1zjJsfl+rKbzVfvv1U1ucshYF4BcssnlZqKfcYO+NMqCoWqSQqhxv
	 E5B1t1jSD/lpzlWdtgut9PfnjAViFp5PlrRcHu3Fcyw/IcKOcvqGGSgC0bgMJPe401
	 ZunAuGK08PFkA==
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dc50c6eccso116132066b.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:12:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBymuAwUO+gj+G0P7yilbD5ykrDeT1ZpvamhnxC8O0Rsq/Y1gR+4m/2Sc+aPyD88m4GmDSK8q2M2lt4EW8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lQSeIJofzYPMkhFAIYMHY6JymcN2ABzgxfcNJ5AOAkKkf/dIW1
	ZvEKyzGbIBZA95ch8sdv9MSk1HlKzFfjWCE5otXYz90OpKnQC8/fFgaz8J/iSUN8UPKAl35ZGQT
	VeAmVKdjFck4lqy48bpog2wDr9U3Lvc3t3mCqbBig0A==
X-Received: by 2002:a17:907:c71b:b0:c29:53eb:9913 with SMTP id
 a640c23a62f3a-c2ac2531dafmr977835366b.38.1790575966734; Sun, 27 Sep 2026
 23:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-13-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-13-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 20:12:35 -1000
X-Gmail-Original-Message-ID: <CACePvbWKRstUOsAQwoZ7Zt_Xf+t7nMPvP2igD3h0Qe=9Rzx4gQ@mail.gmail.com>
X-Gm-Features: AclHuK-vYUha6O9a-v78F4uwNbjs_qMydb4jalHWGfKLwWnn1cUHLlCDprAuc4s
Message-ID: <CACePvbWKRstUOsAQwoZ7Zt_Xf+t7nMPvP2igD3h0Qe=9Rzx4gQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] mm, swap: cap xswap growth at nr_clusters
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
> Add si->nr_clusters as the ceiling for the cluster_info array's growth.
> It starts at the whole address space, so nothing changes yet.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> ---
>  include/linux/swap.h |  1 +
>  mm/swapfile.c        | 19 +++++++++++--------
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 30642bb481df..9fe82d0f1740 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -245,6 +245,7 @@ struct swap_info_struct {
>  #ifdef CONFIG_XSWAP
>         struct vm_struct        *cluster_vm;    /* VM_SPARSE area for clu=
ster_info */
>         unsigned long           nr_clusters_max;/* total clusters in the =
xswap address space */
> +       unsigned long           nr_clusters;    /* how far the array may =
grow */

Do you mean the current usable size of the cluster array?

>         unsigned long           nr_clusters_mapped; /* currently mapped c=
luster count */
>         struct work_struct      xswap_shrink_work; /* deferred shrink tri=
gger */
>         struct mutex            xswap_lock;     /* serialize map/unmap op=
erations */
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index cac084bc72d6..2cf6ba0bd0c0 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -1319,16 +1319,18 @@ static unsigned long cluster_alloc_swap_entry(str=
uct swap_info_struct *si,
>
>  #ifdef CONFIG_XSWAP
>         /* For xswap: grow the cluster_info array, then retry. */
> -       if (!found && (si->flags & SWP_XSWAP) &&
> -           READ_ONCE(si->nr_clusters_mapped) < READ_ONCE(si->nr_clusters=
_max) &&
> -           list_empty(&si->free_clusters)) {
> -               unsigned long nr_new =3D min(READ_ONCE(si->nr_clusters_ma=
x) -
> -                                         READ_ONCE(si->nr_clusters_mappe=
d),
> -                                         XSWAP_GROW_CLUSTERS);
> -               unsigned long start =3D READ_ONCE(si->nr_clusters_mapped)=
;
> -               unsigned long i;
> +       if (!found && (si->flags & SWP_XSWAP) && list_empty(&si->free_clu=
sters)) {
> +               unsigned long ceiling =3D READ_ONCE(si->nr_clusters);
> +               unsigned long mapped =3D READ_ONCE(si->nr_clusters_mapped=
);

Can you help me understand what this change is doing here?
The patch description does not help me. What is the difference between
"ceiling" and "max"?

Chris


> +               unsigned long nr_new, start, i;
>                 int ret;
>
> +               if (mapped >=3D ceiling)
> +                       goto done;
> +
> +               nr_new =3D min(ceiling - mapped, XSWAP_GROW_CLUSTERS);
> +               start =3D mapped;
> +
>                 /*
>                  * Mapping pages can sleep.  The lock only guards the per=
-cpu
>                  * cluster cache, which this path does not touch.
> @@ -4294,6 +4296,7 @@ static int setup_swap_clusters_info(struct swap_inf=
o_struct *si,
>                 cluster_info =3D vm->addr;
>                 si->cluster_vm =3D vm;
>                 si->nr_clusters_max =3D nr_clusters;
> +               si->nr_clusters =3D nr_clusters;
>                 si->cluster_info =3D cluster_info;
>
>                 /* Must be initialized before xswap_map_clusters() locks =
it. */
> --
> 2.54.0
>
