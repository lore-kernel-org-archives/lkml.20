Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8391925BC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791347567; cv=pass; b=jUlWm2x48qfZdoXuG5kUpFwplUs4rn6JDYFEtyNDK/8jMFdIRnCQ80YuMTm+w6ZkX6LeDgFgMLiWlRTFX4+gyy/ysjUNYj4y2JQUcRMrHymvwhzO35sQRm1flvnsxQL3qWtCUCXqs4/0SwdBOzfttyud9ci4HAX48hWDC6juDs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791347567; c=relaxed/simple;
	bh=TCmURO/3fHovnf91TaQ7J2qgpCxoJSVzrXZL4aMCddU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsKXmkSpmE3l9iFpiLKpss/aN5ClQoMzxJtDykvyJ0wl0OSyzrm/75cxkW5vE8K/t5gA6QvGMNPva/qUbfL/iFfuDQJ+0UFkemTU2B4ISKUwI4f6Ki9TDRvGs/NVbuYo3lyQEg5zm0fbXRkjiBgge6paEkIUMWQyRT1QEqDR0Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQTeDrep; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQTeDrep"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so34108565e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 21:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791347564; cv=none;
        d=google.com; s=arc-20260327;
        b=DnlIP7JlPrICNraHMuLPwE45D+wry7CeIloRdL0WrJIaLZgsBLqOUOgcQDbyYjoH6l
         Fn7LvspyPViIZU0b28xNZxtA0847fu4IDYrGYopsU2q1baJNvSqcl80mJTqRtWjYMRc0
         ATir5DfG3fEzYw0mWkhQUFP8DoIF4AD0ASDqrsYCw1JB1ZP9RYFL1Sby929jHxb7bX+e
         f0NU6FpGrz/lVtaDxpzFkAC4E54Yb0Gia9LTLVngCjm38vbQ5K/YAVOEXec90KfTiuvv
         3SdqmDbvOahFp6HnCtxbI1v1vhEN3976BdkSpQWPyv5ntQXilsX6LlvvALzoTAteskx9
         CeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ziYSY4OvbjG7dEn6zvCiVo/zloi2nFktnH/0C9O/jZ0=;
        fh=PnB422gJsnZq/8fpVp2Jn0Fr55Sb9PNOI4pS/k1aSdQ=;
        b=fKLdm6GwwiXKp3z4SaLe3bi/E4RWnaVgN92Qmsbkt7zqAu6BiBLsw1MyyKQsuih4jY
         4ZDX2PaSqPDP/pRtR10eDQaqc6jjZ81LKk8Z57WKLq++q/TAzroqm379uIP75wYe2XjG
         ic3lyRTuyaOQgk80dL1foHHOytGPpDc6AJ1YUD3Cl95QMPCwthSD7E12iT7Q2J1ApH6T
         hdlzD6lyVG51RypI+c+9jgLjKzakonYTRsnW2J81hFRPG1C0ULPNC47fNJmuAXpsaELl
         vRF93DyOyc49cR8pI5lu4oP6L7KqstjeK+x6nuxeFynJ7FVjSeryQS2E5dj718ItovFu
         tnQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791347564; x=1791952364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ziYSY4OvbjG7dEn6zvCiVo/zloi2nFktnH/0C9O/jZ0=;
        b=KQTeDrepdpdyOqUhACV0FOeDD581bwCeytEccWk6IaXbzJeA1imif1Xre0bAwr80nI
         LcDpQaJlaHwQBpZT2d9dwQdpMVp5VGvC+gxj8eWZLXqrcxt6EjAB94ty7NND2fgWQ8hn
         RjAwVUKxM8hMIyGQ4vAAuM6nXiBPJdxuDt2paJ2mtDVWCz+/18CbE8sVb0BVQA3e2K/+
         EcIT9rykD32F8D/DNTc/ruPQMN9lXe3Dyiqqwx5vAJNZtLwGHhVw8m/lwJo4a402/HZc
         cFC1b7rD3o4aAgQixLLfrkqDg34RpkPhznL0PQ1qtlUUWIypnBWDSZ82WMY7CAJ0CaZn
         jpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791347564; x=1791952364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziYSY4OvbjG7dEn6zvCiVo/zloi2nFktnH/0C9O/jZ0=;
        b=p1d4gQilR+vR/xFJgi9cGITca5dxMPRDW3TAcUpAhjYOVRiwVzYZkk219dx4DxNAzc
         lybKfRZiqEoJviRNebdVY/f+qnSQlwj0QN+/nnEgxTI+yOcmhnNbbNJU+NRc/Ox08x/D
         hmLWeZej/PNig1ursyr2EU8yEeVyui3lxRPEZ9a51HveYIbWqjdw4rtU0hhGYxZotnAK
         24mW8dPhhoBxZfHCRQVlC/Xjxn81UqwRcco+w84TRmTnGMkBbDZ8DjHOL1TBREZvUc+q
         byOZoCd2vYmqrXJieIhYebTUJEcjxYjf5+HFn1aEy6v6+9nyvRSsLam76OaHl/tlWl6u
         76GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSXIHqVchN0kj+R3jL9uqRLR0Vr5Le9Xs95Ow6wqBdveKX/prALop60ZECYQJgRhzOxE/v3oBRXNB89t8=@vger.kernel.org
X-Gm-Message-State: AFuF++lYAmjp7ZtmjzY/I2aP9SokLEUURF6Fg3XWUYF4A6o+r43sPG8S
	Z5zcLa9hKpcjpQWtzkWt0nnGwbq3wLHmw1L20mbtNrvZ9p3+1nwqn76ekAhBrNV/+2X7Us9H8qE
	Bx4SPJP8gOBE1UWAOmJ9BW7ikmYYEoGQ=
X-Gm-Gg: AYBFou0LVQxzQ3QxArN0n8DDzxHQFMSQ0kZotmlamFbvngQN26TGxwkf2toAZ5ddd0b
	EKUMjrsglRebybqO5iJZkqd4qUpRRJ9HvlDdB2Abwuwoc0CO00YDL5BkTCoYWWaSY9Vk3C3Pb+P
	i8mro39MrW246ahUU85pTQxmo7G2Wq2KazqrnGbxuvPh9KEp9ticJ7x6Zf4Qky2++sWAfJ8tRgg
	3A9XxrMhXN0TCgfrGwP4voxam9/Yb6JA5H0j0BuetASXHrYtzbhCpBZ5TAIBRy3A4QEKqHlIZYk
	/FmMPCK5Q9gnIZHEpD8UH//XlDKwwahXPY+NJ4U9oQbg4qJrYrgF0q3F
X-Received: by 2002:a05:600c:4f10:b0:4a0:98c:e082 with SMTP id
 5b1f17b1804b1-4a18043b5aamr12107135e9.13.1791347563360; Tue, 06 Oct 2026
 21:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003003136.750633-1-hebaoquan@kylinos.cn> <20261003003136.750633-3-hebaoquan@kylinos.cn>
In-Reply-To: <20261003003136.750633-3-hebaoquan@kylinos.cn>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 7 Oct 2026 12:32:31 +0800
X-Gm-Features: AclHuK9rNw0KhJfEjVigVEkKU4o-iTF05f5OabqTJfPrepOKC4uycIJO-xV9Kvg
Message-ID: <CAN_Opa-Y8zuyuvRUWmmP8btKPuqBQzWQbyQGKGemhbnABWcxOA@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] mm, swap: refactor free_swap_cluster_info to
 take swap_info_struct
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, hannes@cmpxchg.org, nphamcs@gmail.com, baohua@kernel.org, 
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, klarasmodin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 8:31=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> wr=
ote:
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
> Reviewed-by: Chris Li <chrisl@kernel.org>
> ---
>  mm/swapfile.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 32c3133e1211..13ec5c0f3c2f 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3144,14 +3144,17 @@ static void wait_for_allocation(struct swap_info_=
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
> @@ -3163,6 +3166,7 @@ static void free_swap_cluster_info(struct swap_clus=
ter_info *cluster_info,
>                 spin_unlock(&ci->lock);
>         }
>         kvfree(cluster_info);
> +       si->cluster_info =3D NULL;
>  }
>
>  /*
> @@ -3190,11 +3194,9 @@ static void flush_percpu_swap_cluster(struct swap_=
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
> @@ -3286,10 +3288,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, spec=
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
> @@ -3297,7 +3295,9 @@ SYSCALL_DEFINE1(swapoff, const char __user *, speci=
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
> @@ -3664,6 +3664,8 @@ static int setup_swap_clusters_info(struct swap_inf=
o_struct *si,
>         if (!cluster_info)
>                 goto err;
>
> +       si->cluster_info =3D cluster_info;
> +
>         for (i =3D 0; i < nr_clusters; i++)
>                 spin_lock_init(&cluster_info[i].lock);
>
> @@ -3727,7 +3729,7 @@ static int setup_swap_clusters_info(struct swap_inf=
o_struct *si,
>         si->cluster_info =3D cluster_info;
>         return 0;
>  err:
> -       free_swap_cluster_info(cluster_info, maxpages);
> +       free_swap_cluster_info(si);
>         return err;
>  }
>
> @@ -3949,7 +3951,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specia=
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

Straightforward refactor. Passing si lets the helper obtain the
cluster metadata and its size from swap_info_struct, while
clearing si->cluster_info after freeing it makes the error-path
cleanup consistent with the normal teardown path.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu
