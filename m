Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E346477E31
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548430; cv=pass; b=ibP07x5Mp0LOnA+E0kSQ14IdzEkRGZ7Cq79Xe1okgkT9q1y9j0GEBz61tp3rZaiQenn4CD9IBmiM2/mVTqlYzGs8QZzrYN/SBZyG+X+gbxDFjhnSQdXOIhhmv7b6jdd2eQ3IDPWZTsY3x1NU2Qhexlz+UBqOJ+1XH3CsRgpdUSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548430; c=relaxed/simple;
	bh=+0vbZQ4hrH8TAuny0aCf2eyVVsR0g/zscE6oN+O+NqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umlJ8PgsXicqCzrjjbLMYGX2eGHrPWN04v2bf8Kts6B2J/4EHmLMkA3igFVsJ7196ozSlOA7FmSULMrhmegj+j+uaqTtJz71eaPjcGxf+SdvQc8CmaNCZ+kgVS1PHCHo2cAQ3eNpTt+MRUqec8sEoF9RSjLcvQ9IAbUEpMnSLWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5BG3hHx; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5BG3hHx"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b7654efe67so82878e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789548426; cv=none;
        d=google.com; s=arc-20260327;
        b=pSSJLYjB6B5vnCL9fdilxUgzn6ocLcX2hPWc9uewVmfX7f0Od/6plLgrBdbcbrRLNd
         L836E++0UNGQ7Xq0ng6kDJd9u0h3RvrRR9dTjZmskNCpVFLD0FgSeRgvb2vgtAn5ZP5+
         gopj5zSc68ZDFhueUJLjaGHPl2BXyquNJV1JUvGmO3FTdnQ3MTQegEjD+rJm0U5DkN+8
         NbTL4qvq1uGBYxXohEi3NPnP8plLeirR4evWm5C2cT+HK4AeV64tdCayje99m84cFBk2
         j1lWOtiwGQFwqY1h40O/c6YivQrqtyJhNuVJQ8ZIES7taqXbcvc4fHaCe15TIlA/zmUN
         N4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QR5oPNk/jNiLxqkh/Mwul2PMMrQIX1+RCusUg4zvBbg=;
        fh=6iH7Ap4Fr0TkhUcPzWAHaVQr0Od/J9fdZ9ZXtLRSoMY=;
        b=ou+TFpTNHUcgCuYZUoxr8+O1pNe7JFo4ITuI2pNgoi9l8ICuILgbHwje5P8k+M+b6r
         gAxqD3dZPH9pnLhlxFGmdv063XbeKeyJQAOfEVrL3FTzuPF2bqehhBgTsEqL1i8++4fe
         hIkf6ehAlQp13dyj2vE0JjUbzxEkdSdDONFwT4OcDMK+GSXywWOA7yrxdEHHBsfESwR8
         zxq+nNFQjk6nBiO0yJGX2tlg5UKFOBT0EKrc+zUkTfh7nYWvfJgZsC7VIn86sE/rDc6o
         KnhtrBeX3ojxdcp3uiHVwbWteVVtJO0Bm/OJscMo0gdOVLsEW2W8ebWJ4TSZbBigYLMS
         SIYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789548426; x=1790153226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QR5oPNk/jNiLxqkh/Mwul2PMMrQIX1+RCusUg4zvBbg=;
        b=W5BG3hHxW+DwOc1BHCvLbe/VV2HHtOWgZQi1o6rqSh6+sC9g6Cdt4JmmHcjwDJUwi2
         NWkqKJWTughH9adiCEQgKtLn+1p8G9JrYua8oz4ED5XQG7bxUrYPILfOQ7sPBBR2eheg
         xjN+qi95HJzBSPJNiQ02K2hU2a3uEad9T/s7ErFTBmWv/UXY19/8GSNhx8OhUkpUR+Qm
         VhO4RNoPgvO/aCAseXwkfk3i7Q2GgWK+CGb2O9f7N+BpmeVsccs5tsv/9u1+Osp73evK
         U8xtuFBmPK8SPTg0ZScUoNUepqcMlXJCruULXq3vUy7hslNKmjmfihdHSVTseu1G8Ch3
         9duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548426; x=1790153226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QR5oPNk/jNiLxqkh/Mwul2PMMrQIX1+RCusUg4zvBbg=;
        b=xIV7iyB2/5PEGDSTMGFL4AhEyMEzOLnKFQZAom4sjzdQPfPOAh0CxpX4LYAQHJ1mgA
         y3jj9ZVmfr8Pc6dDN1HWnsGOfqHD6LR6GTz+Iziq6rdsas3mMxgn2gLuSUG3Y5vsb6LJ
         KgGgdpKjAmC0Gx3OBAbkxawYfW9SSlkbIb500blheL0jU2b2NOzSoL0mS+o3xl4joWQ3
         DyT8F7zlij0gg7r1OPPlrWldLSEIKBWHE3r/GHdC7tNtWC5qMz13s/H3ed9X2tNaOeHb
         VhhsQc7CjEJcYjLWOvUEnf8z5ayq0WPrtlYcFx4KYiRsVwErBUBM0NApV9N6JBMvD0Pz
         tf/g==
X-Forwarded-Encrypted: i=1; AKwUvBxPtff7xTVjJw/oG979W7a6j4FGfYgKAaou188CnEU8ZVkmt35DUPzBj6OWI8xNkCxQ7IkFotOZwhvlAcM=@vger.kernel.org
X-Gm-Message-State: AFuF++lsUIL3xQx3OpXqtyfjAlEHiCpQQrqkLuzt0EYCTtoykWbj9gaR
	4Vj8Jp0+EVG7Nz78APrvcYPTgcnrUiWdsB9zdPbi/oaaGeigtyMzDWzDpHpPUeHSnXSR03Ld1uI
	OZbv5S0cIdHgURy65ame2w068m5D/ppSwysPI
X-Gm-Gg: AYBFou3dCR+HgphA00QMlyM63VIbFKSzJv/QmSL6uOEQpVUB5+YIKb2rPIyHbl0Znu+
	+57DeAVUJo5vAeRXMYQbUMpjz1+uWktDfWbXS5AVlatF+aRhoVqpDqkh86BIAt1IIrH1pcdeOTG
	Y4cRTfqZcjqh2bI4UOi+ODRiPcfqyK/wKJ54NE7Xl5FAYF1qUCQxQ3m7Vo7biZxW/t0wca2q9LU
	umhIatYL2xbW1oqSOL0yATCBB6MtSXIoFzBPabTyJmZ9gJD0pL1uk5WbvaTIT0lh6RPbfe26C6v
	OQHTofDmq0cYu6zSlhXVbCxzVaEBRhBU2ShxM4N4CCzMuTMW52eK2mHO
X-Received: by 2002:a05:6512:2246:b0:5b7:5281:b8a1 with SMTP id
 2adb3069b0e04-5b8b666ee86mr414510e87.5.1789548426043; Wed, 16 Sep 2026
 01:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916015440.2232938-1-chao@kernel.org> <20260916015440.2232938-7-chao@kernel.org>
In-Reply-To: <20260916015440.2232938-7-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 16 Sep 2026 16:46:28 +0800
X-Gm-Features: AcwNN1VJfhZN3FSG6Q7vrlO-QyNk2XRyZ-lLT3oNdOzm6O_7iRkWt_zUZXaIQeQ
Message-ID: <CAHJ8P3LYuT747ZVd2-ihOuPQwryxUhSTOgHm7Ygq6u3n3twh_w@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v8 06/12] f2fs: cache: initialize node cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=A8=E4=B8=89 09:57=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
>
> This patch introduces node_blocks in f2fs_sb_info structure, initializes
> and destroys the node cache during filesystem mount and unmount.
>
> It also introduces helper wrappers for node cache operation, and register=
s
> node cache into the memory shrinker and writeback kthread.
>
> Signed-off-by: Chao Yu <chao@kernel.org>
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!
> ---
>  fs/f2fs/cache.c |  9 ++++++++-
>  fs/f2fs/cache.h | 11 +++++++++++
>  fs/f2fs/f2fs.h  |  1 +
>  fs/f2fs/super.c |  7 +++++--
>  4 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 4d82697060d0..8ab5e0e46b4e 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -624,7 +624,14 @@ static unsigned long f2fs_do_shrink_cache(struct f2f=
s_cached_block_list *cache,
>  unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>                                         unsigned long nr_to_scan)
>  {
> -       return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
> +       unsigned long freed;
> +
> +       freed =3D f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
> +       if (freed >=3D nr_to_scan)
> +               return freed;
> +
> +       freed +=3D f2fs_do_shrink_cache(NODE_CACHE(sbi), nr_to_scan - fre=
ed);
> +       return freed;
>  }
>
>  static int f2fs_cache_writeback_kthread(void *data)
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index 1e84e66eca79..1eabd787b4b7 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -194,6 +194,7 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_l=
ist *cache,
>                 unsigned long start, unsigned long len, bool drop_dirty);
>
>  #define META_CACHE(sbi)                (&(sbi)->meta_blocks)
> +#define NODE_CACHE(sbi)                (&(sbi)->node_blocks)
>
>  #define f2fs_find_meta_cache(sbi, blkaddr)             \
>         f2fs_find_cache(META_CACHE(sbi), blkaddr, 0)
> @@ -202,6 +203,16 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_=
list *cache,
>  #define f2fs_truncate_meta_caches(sbi, start, len)     \
>         f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
>
> +#define f2fs_grab_node_cache(sbi, blkaddr)             \
> +       f2fs_grab_cache(NODE_CACHE(sbi), blkaddr,       \
> +       F2FS_CACHE_LOCK_CREATE)
> +#define f2fs_find_node_cache(sbi, blkaddr)             \
> +       f2fs_find_cache(NODE_CACHE(sbi), blkaddr)
> +#define f2fs_invalidate_node_cache(sbi, blkaddr)       \
> +       f2fs_drop_cache_range(NODE_CACHE(sbi), blkaddr, 1, false)
> +#define f2fs_truncate_node_caches(sbi, start, len)     \
> +       f2fs_drop_cache_range(NODE_CACHE(sbi), start, len, true)
> +
>  unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>                                 unsigned long nr_to_scan);
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e2b29067eb0a..51c191c514bc 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2108,6 +2108,7 @@ struct f2fs_sb_info {
>
>         /* f2fs internal cache */
>         struct f2fs_cached_block_list meta_blocks;
> +       struct f2fs_cached_block_list node_blocks;
>
>         /* internal cache flush thread */
>         struct f2fs_cache_kthread cache_thread;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1e6b9374df97..fa19152cd4da 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2092,6 +2092,7 @@ static void f2fs_put_super(struct super_block *sb)
>         sbi->node_inode =3D NULL;
>
>         f2fs_destroy_cache(META_CACHE(sbi));
> +       f2fs_destroy_cache(NODE_CACHE(sbi));
>
>         /* Should check the page counts after dropping all node/meta page=
s */
>         for (i =3D 0; i < NR_COUNT_TYPE; i++) {
> @@ -5282,11 +5283,12 @@ static int f2fs_fill_super(struct super_block *sb=
, struct fs_context *fc)
>                 goto free_percpu;
>
>         f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
> +       f2fs_init_cache(sbi, NODE_CACHE(sbi), F2FS_NODE_CACHE);
>
>         err =3D f2fs_get_valid_checkpoint(sbi);
>         if (err) {
>                 f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
> -               goto free_meta_cache;
> +               goto free_node_cache;
>         }
>
>         if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_QUOTA_NEED_FSCK_FLAG))
> @@ -5612,7 +5614,8 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>  free_devices:
>         destroy_device_list(sbi);
>         kvfree(sbi->ckpt);
> -free_meta_cache:
> +free_node_cache:
> +       f2fs_destroy_cache(NODE_CACHE(sbi));
>         f2fs_destroy_cache(META_CACHE(sbi));
>         f2fs_destroy_page_array_cache(sbi);
>  free_percpu:
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
