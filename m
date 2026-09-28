Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E70E315D32
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576359; cv=none; b=qqAbFimpTUP9j4kBST82tZlFIZjXetutqirur4bjwDrj1h+wK8rloGQa02Eb73RvFEUAmgadkBmCXrxKRWnvj3pQFMfhRAxwKqqWhw10sQKrp/1yYvhEWpFlJ09fKPfygzhatnn0ZX1QMu7vb5KVM40wzfNaM0mLhKbTgYZpiXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576359; c=relaxed/simple;
	bh=XWmi0TMvzgLGuBdC+lH2Ux/lKUBYrXJnZQkH/ilCwHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiQPazzlPhPwkN5w0GntILICN29Rz93iqDei7PtJp9oQHrkaOoPVomnW+f1ZtTUHgxF7kCzPfBK0H2moo9++l13TrWu1J4oBB7UhAM1yDwyfcEC9JHCgOt0ZlLgt6TxDTR6mAZhJqkO6QRP5kUArqLlVT/cPLnC0O3j3GHrxJy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFN1+q95; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFN1+q95"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3A41F008A0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790576358;
	bh=P+Ketq9+++QF/K7tY+yWeVcoA9YiGM/e1Warfti0y6c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hFN1+q95+zKRDJujGn/4KF5W47EcA0+P2dzDTFpxB1AfBMrGkrnx+Sj5aDj5uTjk6
	 PX/tk31iWZMy6IYADNID/W7fT7mfTT4lrySE/5j03o69EWTn8tDzUJJmg5oVA5ihuA
	 8FaZnMV0Ix/4IILIS87IbDE8Y2z5FSqGav1kaJvXnhSC4+fMEvlujdFq88JHkL4Ntp
	 6vBlI6YzhWvjxhtp3IA+LD3KgFB/WYSsKQxFIXtdRmZVXEVO6fwk8bNvmEinqi4Gsq
	 vXOjBG74leR2IqU5V5YlHOOBHclqt8Es2ByC2EhbVWw/Oow8GMrvAO7RxhAMD57rbj
	 UUGIHqOZJ+z3g==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so363866466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:19:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxCAvs+vyecFTN44nOtidm3rETBCmriare51Je0zdGdV3hbfXhTYleisciBE4Ij9XvfptA2lWaKB66NP1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kTB00XBF93klAhVaC08DaDI7YVMIyHwiktA8nQBYpB1VjuBwrQ
	sLQDT3W1u1tvzM28teTRgUnaDu1q7jYO886/hPrYO2EeRTx8a+8xnsz2h04kgeGBXizxw7wJs7+
	9vMKHdKZOPiSLUIxDEM7uP2SKDEd1D8yvhNjn9xG0Yg==
X-Received: by 2002:a17:907:3e98:b0:c29:f5d5:5a98 with SMTP id
 a640c23a62f3a-c2ac241bd31mr1017028266b.34.1790576357244; Sun, 27 Sep 2026
 23:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-15-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-15-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 20:19:05 -1000
X-Gmail-Original-Message-ID: <CACePvbUdDWaWA_YZW4yZ_k0zyp3iF3RzusPKO2ZOyJONh0dCrg@mail.gmail.com>
X-Gm-Features: AclHuK_T6ZaUqFOjQXs6aCMZvy5UZhShRk7BXR6yvGcUDbFTt35WUL9ktZOL7vs
Message-ID: <CACePvbUdDWaWA_YZW4yZ_k0zyp3iF3RzusPKO2ZOyJONh0dCrg@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] mm, swap: shrink xswap to the ceiling when it drops
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
> Make xswap_try_shrink() shrink down to the ceiling when the ceiling is
> lowered below the mapped range, and trigger the shrink directly from a
> limit write instead of waiting for the next free cluster.

Again, I suspect we can move the shrink into the later phase if needed
so I have less code to review.

Chris

>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> ---
>  mm/swapfile.c | 59 ++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 22 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 0fcbaf1cf0e2..ab64bfc4e0f7 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -4190,8 +4190,9 @@ static void xswap_shrink_work_fn(struct work_struct=
 *work)
>   */
>  static void xswap_try_shrink(struct swap_info_struct *si)
>  {
> +       unsigned long nr_mapped, nr_ceiling, nr_tail, nr_unmap;
> +       unsigned long start_idx, i;
>         struct swap_cluster_info *ci;
> -       unsigned long nr_mapped, nr_tail, nr_unmap, start_idx, i;
>
>         if (!(si->flags & SWP_XSWAP))
>                 return;
> @@ -4203,35 +4204,45 @@ static void xswap_try_shrink(struct swap_info_str=
uct *si)
>                 goto out_unlock;
>
>         nr_mapped =3D READ_ONCE(si->nr_clusters_mapped);
> +       nr_ceiling =3D READ_ONCE(si->nr_clusters);
> +
>         if (nr_mapped <=3D 1)     /* keep cluster 0 */
>                 goto out_unlock;
>
>         /*
> -        * Reclaim on our own, but only once the mapped range is at most
> -        * half in use: growth is demand driven, so reclaiming on a small=
er
> -        * dip would only map the same clusters again, and every unmap co=
sts
> -        * an RCU grace period.
> +        * A cap below the mapped range shrinks on its own.  Otherwise wa=
it
> +        * until the range is at most half in use: growth follows demand,=
 so
> +        * shrinking above that would only map the same clusters again.
>          */
> -       if (swap_usage_in_pages(si) * 2 > nr_mapped * SWAPFILE_CLUSTER)
> +       if (nr_ceiling >=3D nr_mapped &&
> +           swap_usage_in_pages(si) * 2 > nr_mapped * SWAPFILE_CLUSTER)
>                 goto out_unlock;
>
> -       /*
> -        * Count the free clusters at the tail of the mapped range.  Scan=
ned,
> -        * not tracked: the count must be exact to size the unmap, and an
> -        * incremental count falls behind on out-of-order frees.
> -        */
> -       nr_tail =3D 0;
> -       while (nr_mapped - nr_tail > 1) {
> -               ci =3D &si->cluster_info[nr_mapped - nr_tail - 1];
> -               if (READ_ONCE(ci->count) ||
> -                   READ_ONCE(ci->flags) !=3D CLUSTER_FLAG_FREE)
> -                       break;
> -               nr_tail++;
> -       }
> -       if (nr_tail < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> -               goto out_unlock;
> +       if (nr_ceiling < nr_mapped) {
> +               /* Take the excess exactly; rounding could zero a small c=
ap. */
> +               nr_unmap =3D nr_mapped - nr_ceiling;
> +               /*
> +                * Keep cluster 0: it always holds the header slot, so it=
 is
> +                * never free and must not be unmapped.
> +                */
> +               nr_unmap =3D min(nr_unmap, nr_mapped - 1);
> +       } else {
> +               /* Count the free tail; scanned, not tracked. */
> +               nr_tail =3D 0;
> +               while (nr_mapped - nr_tail > 1) {
> +                       ci =3D &si->cluster_info[nr_mapped - nr_tail - 1]=
;
> +                       if (READ_ONCE(ci->count) ||
> +                           READ_ONCE(ci->flags) !=3D CLUSTER_FLAG_FREE)
> +                               break;
> +                       nr_tail++;
> +               }
>
> -       nr_unmap =3D rounddown(nr_tail - XSWAP_SHRINK_SLACK, XSWAP_GROW_C=
LUSTERS);
> +               if (nr_tail < XSWAP_SHRINK_SLACK + XSWAP_SHRINK_MIN)
> +                       goto out_unlock;
> +
> +               nr_unmap =3D rounddown(nr_tail - XSWAP_SHRINK_SLACK,
> +                                    XSWAP_GROW_CLUSTERS);
> +       }
>         if (!nr_unmap)
>                 goto out_unlock;
>         start_idx =3D nr_mapped - nr_unmap;
> @@ -4507,6 +4518,10 @@ static ssize_t xswap_limit_store(struct kobject *k=
obj,
>
>         spin_unlock(&swap_lock);
>
> +       /* Enforce a lowered ceiling at once; raising needs no shrink. */
> +       if (clusters < READ_ONCE(si->nr_clusters_mapped))
> +               xswap_try_shrink(si);
> +
>         return count;
>  }
>
> --
> 2.54.0
>
