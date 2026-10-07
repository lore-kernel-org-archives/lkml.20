Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E93546FC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355962; cv=pass; b=Mk4mTrgm6cZsXZTeChfko0no6Hd4uQ4XDI3X3OVgtIBNxYkYrwmM0gAqMrz0KkW4RZCIC3nsun1rKyAcQA4sQKlo7sjXYKHw8dMpzWjpSImhKm5ZxPqd5JSDFursXuhpB9vvydfPus3h21aI1cyvTMS6lLXHGn4Xcbm6Nx7Nqa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355962; c=relaxed/simple;
	bh=/ZAnJWIaLWX8u9WFoSgstLO9s+vJfasakaS4Hfr0zYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBaks/ma+/yIegSGAJ0dz54kant0oHgcZieEXd5nSanoxB6XL2nL20YYirAPf31BOC0ws6vXrt9pjW+ZAQFFCsed+JDoxEP+2q9pw2YPrkRO8oWWFritSeAZ4z0OkME0T4VIHKeHTWH5NNVlfl+1CTAJ9dw/ZIBlFBj+UuDrQOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLVbQo4G; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLVbQo4G"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2533d83e3bso213947266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791355959; cv=none;
        d=google.com; s=arc-20260327;
        b=MJx8agBRe9uXC49HZ69X4EV4MUmNbSE7Eta8nftOVnKa2Z1L/x3W+PQ+EMPdPwZH7h
         aji5a6OgpY15h615q45ACM6+0qwc1kWCGHgXRO8PPSuerKSO+YsilJePAldKpZEIWjPR
         xkjXY0duFNPxyl8zZXcrwME1LQ85kA300jad9quAlwErQQA2sF/+UPfYPFz+kOTw+sH5
         mfF3wEXIfu6zDcTsZ8KdxQuDP7apqUnc2+lkJ26MuDcGn6OrEO5YC8IcpIx1FF1S3mIl
         DsI0bs2+GRU1nxyLNRTgoLfk5kASfbO42mNHvXl6Gh7M6kjWn5B9vS5+wixp4dfWqSvv
         GLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uYZ+FBTj4p2YuPmZrlm8klRINrPApDEDqaINJavTZWk=;
        fh=DrwSpx/lusBFvacig1Z2P5G1DDVXimDh4+4q4QQsCdM=;
        b=iu01CAkWfxB/gvS3wSjxsI/zyBZRs7+ao5rtA84bPP4V194RdhTXBQ6RtWaJ3w/oIX
         YNOSH6xkxnZzZYHon+DdSmmSSKBHwcQOImu9i2FjxTp1ftEFjuEG8lpSXLh3vorvfCLT
         bDVpPn1NoFmJAsdnNKjgRISYNgNbevTZDhSmOl+ihIIonj8oLMwbLdBj70RvPauQo8j6
         o0/7I49TzXZt9dXZcymtRBYIaK550XgnrTe+e8NPpvumdvmKUdQCeOplA2PpNj2G3FF/
         U4+3QFmPDBbAzDHHNrnagY759efrlrFDesfk6F0cqlspfmJaarC1baV3sVfKmnRTnQ+p
         GIeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791355959; x=1791960759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uYZ+FBTj4p2YuPmZrlm8klRINrPApDEDqaINJavTZWk=;
        b=eLVbQo4GDgF5dM1bp+I1i+MbmSNY65RIZm4F4YZ+nkDlSA2zGiG3d5rE/CB++UFSdO
         IdmDoUilQTGSYgLnQAjtaaOKLqFJOa2Zd5gqBXlTZI/8nMWirUotHuEWWckLN75t6jtK
         WKWE+w53dzA5FHfYY1mjqne8h3D6Xamb2ie9pbFpqvlFKEBh5MdWHuhnFLJXRsSS3jR0
         QMWp2KKoB0MrOBv1LK+MTQJJtXqidQbmoIyqLGqefPZFuenPAX9v+cLTX/V9r/0Axc71
         v50wfgj8LmJWsSB4AmCVcX3a3WfmrhUPUIsguZJYJC23avyXCZy09jag9aeEqEkaZZAL
         YI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355959; x=1791960759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYZ+FBTj4p2YuPmZrlm8klRINrPApDEDqaINJavTZWk=;
        b=uztCwA748LMUwXAxBAO8t/azIFUcFsD7cJIfMeR7S4UZ/UP9J6HgxpHK7vJ1FvOT+t
         hxaHBgJh32QaHYnrJwVjgH170FDm2fUzxm6IZPLRTqctUsuo71LiJCXO59w4w8VcdOlX
         IJstfcQi1N0P5nNId9uBkD695lrbTIcs7gqDYPkGAf4T3a+CWJ6cw0kbomi4iAL1RvId
         LiwBMJMBOPVCX9emDviF48ZocnLQS1RmPXogr3Zb/unBji/6ZtAVZYfW8a+0ovbGRVip
         SElhnEKcPe9qR9qwtaniL9+hZe8vOR3FB0AqXc2VpWGKptyH/3FKtEdVv9FOPFw3qbji
         1iuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp0nrvMBsJZjM6Grwl3MQGTgqPEySaQcy4+E8RHyjdWsFxdYKxYGX2K973qYmEbc0LnX2S461yND0aZB0=@vger.kernel.org
X-Gm-Message-State: AFuF++mNVjhNmlJ9i/V/0ig3a92XeeqKFyRrl/YQTkhJ2p/qhNZoz4XO
	MlXiOsgUHJDPSuZFyyVPLs3gWnrBkN9ikZGLCdHRBITPYPivghFsySJ5L0muskfaJrKSjl3QDM0
	6oPjZQPwO8Qi23WWwOUqLAbjSuCJS0qs=
X-Gm-Gg: AYBFou1YjVgFDAWNFiS2uedS2O5qFum3HjYLu0947lDcgpJac5gaOKbAEK3Fsb6N/Vh
	xQ1I1bCJeitHAS9ZBIcalLLqCE0IiLryAVuldhRzJD8Hy6uhDPSxjPC+tWcx7+g9KFm+zOKsJK2
	N7teTUgbVGmAQooBqfwAEfHo9V5slKYb9dEOFU+WxdpRxisY7SzbweUdJNlUDoy1Uo+Axeydvl2
	UGdn14QQl5xNQBBXjxLwq1WomCScg0iX4Ynim94p4eegNRuGyZT5m8esjebLc0CSmAjKDIg7bhO
	eSugDDIsAziBeGHeuXISDlbZNjja8kGwwyU35z0zFITYuJShMwR3j8bd
X-Received: by 2002:a17:907:7287:b0:c2e:2252:6ddb with SMTP id
 a640c23a62f3a-c317bdd9435mr113132166b.10.1791355958731; Tue, 06 Oct 2026
 23:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003003136.750633-1-hebaoquan@kylinos.cn> <20261003003136.750633-6-hebaoquan@kylinos.cn>
In-Reply-To: <20261003003136.750633-6-hebaoquan@kylinos.cn>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 7 Oct 2026 14:52:26 +0800
X-Gm-Features: AclHuK-taMBfGgP6ilA4RKTlY22fCTFMUrc-YlRCy_S-xkzHcMNC6_ARSFLYr5o
Message-ID: <CAN_Opa-1qu9q1wzKy65sBpHBfYHqF6GzxbS-hZx9R=a6-qW9dQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] mm, swap: add xswap grow trigger on cluster allocation
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
> Grow the mapped range before it runs out rather than after, from
> cluster_alloc_swap_entry().
>
> Growing maps pages into the VM_SPARSE area and can sleep. Doing it from
> the allocation that would otherwise have failed puts that sleep on the
> swap-out path with nothing left to fall back on. Growing at 85% in use
> instead leaves the allocation that pays for it a reserve to land in, and
> leaves one grow's worth of room in front of the next.
>
> The target is 65%: past the point where the shrink starts looking (50%)
> and short of the point that triggers the next grow (85%), so a grow
> cannot leave the range in a state the shrink would undo.
>
> Since xswap is always SWP_SOLIDSTATE, global_cluster_lock is never
> held on this path.
>
> This makes the xswap cluster space grow transparently as swap usage
> increases, without any userspace intervention.
>
> The caller holds local_lock(&percpu_swap_cluster.lock) across the whole
> slow path, so drop it around xswap_map_clusters() and take it again
> afterwards; it only protects the per-cpu cluster cache, which this path
> does not touch.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> ---
>  mm/swapfile.c | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 9c204e455ef9..45050f8a2ed8 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -70,6 +70,19 @@
>  #define XSWAP_GROW_CLUSTERS \
>         max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info)=
, 16)
>
> +/*
> + * Grow and shrink thresholds, as a percentage of the mapped range in us=
e.
> + * Each one lands inside (SHRINK_WHEN, GROW_WHEN), so neither can leave =
the
> + * range in a state that wakes the other up.
> + */
> +#define XSWAP_SHRINK_WHEN      50
> +#define XSWAP_SHRINK_UNTIL     70
> +#define XSWAP_GROW_UNTIL       65
> +#define XSWAP_GROW_WHEN                85
> +#define XSWAP_GROW_CHUNKS      4
> +
> +static bool xswap_should_grow(struct swap_info_struct *si);
> +static unsigned long xswap_grow(struct swap_info_struct *si);
>  static int xswap_map_clusters(struct swap_info_struct *si,
>                               unsigned long start_idx, unsigned long nr);
>  static void xswap_unmap_clusters(struct swap_info_struct *si,
> @@ -1204,6 +1217,17 @@ static unsigned long cluster_alloc_swap_entry(stru=
ct swap_info_struct *si,
>         if (order && !(si->flags & SWP_BLKDEV))
>                 return 0;
>
> +#ifdef CONFIG_XSWAP
> +       /*
> +        * Top the range up early.  Every path below leaves through `done=
`,
> +        * so this has to come first; mapping pages can sleep, and doing =
it
> +        * from the allocation that would otherwise fail leaves nothing t=
o
> +        * fall back on.
> +        */
> +       if ((si->flags & SWP_XSWAP) && xswap_should_grow(si))
> +               xswap_grow(si);
> +#endif
> +
>         if (!(si->flags & SWP_SOLIDSTATE)) {
>                 /* Serialize HDD SWAP allocation for each device. */
>                 spin_lock(&si->global_cluster_lock);
> @@ -1280,6 +1304,12 @@ static unsigned long cluster_alloc_swap_entry(stru=
ct swap_info_struct *si,
>                 if (found)
>                         goto done;
>         }
> +
> +#ifdef CONFIG_XSWAP
> +       /* A concurrent free or grow may have added clusters; retry once.=
 */
> +       if (!found && (si->flags & SWP_XSWAP))
> +               found =3D alloc_swap_scan_list(si, &si->free_clusters, fo=
lio, false);
> +#endif
>  done:
>         if (!(si->flags & SWP_SOLIDSTATE))
>                 spin_unlock(&si->global_cluster_lock);
> @@ -3909,6 +3939,69 @@ static int xswap_map_clusters(struct swap_info_str=
uct *si,
>         return -ENOMEM;
>  }
>
> +static bool xswap_should_grow(struct swap_info_struct *si)
> +{
> +       unsigned long mapped =3D READ_ONCE(si->nr_clusters_mapped);
> +
> +       if (mapped >=3D READ_ONCE(si->nr_clusters_max))
> +               return false;
> +
> +       return swap_usage_in_pages(si) * 100 >=3D
> +              mapped * SWAPFILE_CLUSTER * XSWAP_GROW_WHEN;
> +}
> +
> +/*
> + * Map more of the cluster_info array, up to GROW_UNTIL in use.  The cal=
ler
> + * holds percpu_swap_cluster.lock, which this drops while it sleeps.
> + */
> +static unsigned long xswap_grow(struct swap_info_struct *si)
> +{
> +       unsigned long mapped =3D READ_ONCE(si->nr_clusters_mapped);
> +       unsigned long nr_new, want, i;
> +       int ret;
> +
> +       /* The unmap below is paired with the caller's lock. */
> +       lockdep_assert_held(&percpu_swap_cluster.lock);
> +
> +       want =3D DIV_ROUND_UP(swap_usage_in_pages(si) * 100,
> +                           XSWAP_GROW_UNTIL * SWAPFILE_CLUSTER);
> +       if (want <=3D mapped)
> +               return 0;
> +
> +       nr_new =3D rounddown(want - mapped, XSWAP_GROW_CLUSTERS);
> +       if (!nr_new)
> +               nr_new =3D XSWAP_GROW_CLUSTERS;
> +       if (nr_new > XSWAP_GROW_CHUNKS * XSWAP_GROW_CLUSTERS)
> +               nr_new =3D XSWAP_GROW_CHUNKS * XSWAP_GROW_CLUSTERS;
> +       nr_new =3D min(nr_new, READ_ONCE(si->nr_clusters_max) - mapped);
> +
> +       /*
> +        * Mapping pages can sleep.  The lock only guards the per-cpu
> +        * cluster cache, which this path does not touch.
> +        */
> +       local_unlock(&percpu_swap_cluster.lock);
> +       ret =3D xswap_map_clusters(si, mapped, nr_new);
> +       local_lock(&percpu_swap_cluster.lock);
> +       if (ret)
> +               return 0;
> +
> +       for (i =3D mapped; i < mapped + nr_new; i++) {
> +               struct swap_cluster_info *ci =3D &si->cluster_info[i];
> +
> +               /*
> +                * A concurrent grower may have taken these already;
> +                * only add the off-list ones.
> +                */
> +               spin_lock(&ci->lock);
> +               if (ci->flags =3D=3D CLUSTER_FLAG_NONE)
> +                       move_cluster(si, ci, &si->free_clusters,
> +                                    CLUSTER_FLAG_FREE);
> +               spin_unlock(&ci->lock);
> +       }
> +
> +       return nr_new;
> +}
> +
>  static void xswap_unmap_clusters(struct swap_info_struct *si,
>                                  unsigned long start_idx, unsigned long n=
r)
>  {
> --
> 2.54.0
>

Hi Baoquan,

The 85% grow threshold gives the allocation path headroom before
the currently mapped range is exhausted.

I also checked the lock scope in `xswap_grow()`. Dropping the
per-CPU `local_lock` around `xswap_map_clusters()` is appropriate
because the mapping operation may sleep, while this path does not
access the per-CPU cluster cache.

`xswap_should_grow()` uses `READ_ONCE()` for
`nr_clusters_mapped`, so a concurrent grow can make an allocation
miss the grow check for one round. This is benign because a
subsequent allocation will observe the updated mapped range.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu
