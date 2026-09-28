Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A668156661
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558420; cv=none; b=P4TT/Q47GbcK/oIBqxmcO7ir2ohYo8D61Ua7BQzwN+XVRGN3OYqKKb6W6j38a7Tv/OD1oPEArzp0SVFcMtkb63LIlp/SRQwoah3m9+bp80YufjafxcMJNIaNSfhMls2FnKraaG810Wg4q3LcsrSQjHWgazlVhnA7nORgi9ktAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558420; c=relaxed/simple;
	bh=x/KUsujKwC6LX3+Ibyj15Blyvkfyx5e7DC7fbxgfppE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEVXSp1D142vDMHwj5G4IZPEPTLfxvvhKW5/GkrbVMUiz28q1cK198FQvWuFwc2dvL+oVggyeIJ3sOPiSSp91ACAXDyoJ7Mf6zsCQCDvfV4R1Ww+CnKHfX8smRx24YZ3v6HHOlME36KSkcAi9MK/fKWWuw7cSPolxoBs2HFWS6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmFDZFot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmFDZFot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0E81F00898
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790558419;
	bh=ctA6EqR2gd6Q+NGyLup7FYkhpIGXwrlcUuBTb1lAxTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YmFDZFotF7XNmpS62mj17I6samqbBwexkZSK8bEGggAAVrQrWv9y22sn89aGdm/4R
	 tVkgsoim4BVtsydBEwrjb+QR+axOww1ZjkMjyhP48TFEhjYNWw779BEPgzL9trcYsm
	 sxZtLcjdJLXjjibSx4hSIAEXA7LE1bGJjoa+JhpobAo90OA1mfH37FFitnW1lKFwqm
	 eoNhEduAmOehM1L8u7eIJi7HkLRQJW7nZsSrELJGuRuFvUAX+PjMTnqdJJORmbQemO
	 JFNKytutmDjGetWmrSc9/Uqt9MxIqhkfTr5m8e6B3jnaS1T4M3RC0sbKxMYo1t/VfS
	 7Qc+Vs1+bw2lQ==
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so204418666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:20:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxagDhcsVKmzVwOWMJl1+7F3Y91qiugebnmciBf5vTEcz4L57DAjsNGIiWS5o6U5kt74AeXVsCkdfwZxVg=@vger.kernel.org
X-Gm-Message-State: AFuF++m4F2hOh3VFxNh7sf0qgohP/t3Qp/CpuU+yo96fzPSSoooF2nxa
	HwFt6QmF2g/QYiziilavqxh58RNlwFLt1MC1O1nBPf3qUc6vssQlhcfYEgGaJDQrf1ii7/E8Zm6
	C7FaQkTOcgBcIPkFc1QFTtHanb0RFGrGacCMKkpJy4A==
X-Received: by 2002:a17:906:9c82:b0:c29:49fd:c98 with SMTP id
 a640c23a62f3a-c2ac24c4c6dmr956185366b.32.1790558417910; Sun, 27 Sep 2026
 18:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <20260916101929.149106-4-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-4-hebaoquan@kylinos.cn>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 27 Sep 2026 15:20:07 -1000
X-Gmail-Original-Message-ID: <CACePvbWFEkqMeoqhL2jufTa=iYF0wUVERy--DN=yR6iO631kng@mail.gmail.com>
X-Gm-Features: AclHuK8-xxY_6dZBLCjo-ZzmBnX6Zaephg9kFzmW7lSsXHrSGpbDTVKHB7yj5RY
Message-ID: <CACePvbWFEkqMeoqhL2jufTa=iYF0wUVERy--DN=yR6iO631kng@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] mm, swap: refactor free_swap_cluster_info to
 take swap_info_struct
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
> Change free_swap_cluster_info() to take struct swap_info_struct* instead
> of (cluster_info, maxpages). It now extracts the fields from si and
> clears si->cluster_info after freeing to avoid a double free on the
> swapon() error path.
>
> The new parameter also lets the xswap path access si->flags in the
> function.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>

Reviewed-by: Chris Li <chrisl@kernel.org>

Chris

> ---
>  mm/swapfile.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 13ae681acf07..4b260f9760ac 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3142,14 +3142,17 @@ static void wait_for_allocation(struct swap_info_=
struct *si)
>         }
>  }
>
> -static void free_swap_cluster_info(struct swap_cluster_info *cluster_inf=
o,
> -                                  unsigned long maxpages)
> +static void free_swap_cluster_info(struct swap_info_struct *si)
>  {
> +       struct swap_cluster_info *cluster_info =3D si->cluster_info;
> +       unsigned long maxpages =3D si->max;
>         struct swap_cluster_info *ci;
> -       int i, nr_clusters =3D DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
> +       int i, nr_clusters;
>
>         if (!cluster_info)
>                 return;
> +
> +       nr_clusters =3D DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
>         for (i =3D 0; i < nr_clusters; i++) {
>                 ci =3D cluster_info + i;
>                 /* Cluster with bad marks count will have a remaining tab=
le */
> @@ -3161,6 +3164,7 @@ static void free_swap_cluster_info(struct swap_clus=
ter_info *cluster_info,
>                 spin_unlock(&ci->lock);
>         }
>         kvfree(cluster_info);
> +       si->cluster_info =3D NULL;
>  }
>
>  /*
> @@ -3188,11 +3192,9 @@ static void flush_percpu_swap_cluster(struct swap_=
info_struct *si)
>  SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
>  {
>         struct swap_info_struct *p =3D NULL;
> -       struct swap_cluster_info *cluster_info;
>         struct file *swap_file, *victim;
>         struct address_space *mapping;
>         struct inode *inode;
> -       unsigned int maxpages;
>         int err, found =3D 0;
>
>         if (!capable(CAP_SYS_ADMIN))
> @@ -3284,10 +3286,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, spec=
ialfile)
>
>         swap_file =3D p->swap_file;
>         p->swap_file =3D NULL;
> -       maxpages =3D p->max;
> -       cluster_info =3D p->cluster_info;
> -       p->max =3D 0;
> -       p->cluster_info =3D NULL;
>         spin_unlock(&p->lock);
>         spin_unlock(&swap_lock);
>         arch_swap_invalidate_area(p->type);
> @@ -3295,7 +3293,9 @@ SYSCALL_DEFINE1(swapoff, const char __user *, speci=
alfile)
>         mutex_unlock(&swapon_mutex);
>         kfree(p->global_cluster);
>         p->global_cluster =3D NULL;
> -       free_swap_cluster_info(cluster_info, maxpages);
> +       free_swap_cluster_info(p);
> +       p->max =3D 0;
> +       p->cluster_info =3D NULL;
>
>         inode =3D mapping->host;
>
> @@ -3662,6 +3662,8 @@ static int setup_swap_clusters_info(struct swap_inf=
o_struct *si,
>         if (!cluster_info)
>                 goto err;
>
> +       si->cluster_info =3D cluster_info;
> +
>         for (i =3D 0; i < nr_clusters; i++)
>                 spin_lock_init(&cluster_info[i].lock);
>
> @@ -3725,7 +3727,7 @@ static int setup_swap_clusters_info(struct swap_inf=
o_struct *si,
>         si->cluster_info =3D cluster_info;
>         return 0;
>  err:
> -       free_swap_cluster_info(cluster_info, maxpages);
> +       free_swap_cluster_info(si);
>         return err;
>  }
>
> @@ -3947,7 +3949,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specia=
lfile, int, swap_flags)
>         si->global_cluster =3D NULL;
>         inode =3D NULL;
>         destroy_swap_extents(si, swap_file);
> -       free_swap_cluster_info(si->cluster_info, si->max);
> +       free_swap_cluster_info(si);
>         si->cluster_info =3D NULL;
>         /*
>          * Clear the SWP_USED flag after all resources are freed so
> --
> 2.54.0
>
