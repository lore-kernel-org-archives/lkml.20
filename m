Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263D46D085
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547882; cv=pass; b=VNSHpgfqTeT3urebtyuPUZ2NQaaVEMOjbQb8gZ3rMxxShUmTKmYXDRYH+A+SNlFqS8O1z+VIWyGkLS5aahjoR4P7v4cTLiITHKKshWkhsNwwWe7A81Id2wylTYJBBcLLRfs/4nQJiBEspMOZWpQje9ylTAazH3Gi7z7JhuQN4dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547882; c=relaxed/simple;
	bh=S/X+RO3ysRo8lGeU1qxPd7IqMIXzvcrKZzhoZIr+kGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TzEld5L3fP042iqWGkaCnp9qsBeR+nbCmwuGF73BQl37makjQAO8sdAOe7dluQoyoKB1QKpaO1BBfOOD04Fa5qkKVUBh4ZLVuTo3++7+GD+ksUbMdPRDbxfK2xc2THbvfb4hHgJPuAQ0ktIJ7i98mp6ah59+azMWnPrm195ua8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSolCz0o; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSolCz0o"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b79786cdafso95854e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547879; cv=none;
        d=google.com; s=arc-20260327;
        b=MjQtjBeJu9n+hCy7Fjw5CoBce3bH0b7AVn5ldOTtU+fIfjbve8WwxxtiFw6qC7Du72
         ypSQENPzN/n0Ab5jvoi8kasPcF0iHJ9wRaaU/w8VU9f6Gwf5VdwYNAe9Cp0WdAChgQ0i
         vJrirGgSFEkhngtVqrr3Sa9InJh9JYs4OwjFyMR8WAl3LSK5d7LQqKAm3adISGEmU5E0
         JqVvsL6HR462uNxWe0qGsdESNCQretaN9D/ff0gyy+1LOb16GV0bLmNpJ0Ng3aQpktYW
         +rG0JKpwsOvyUfQJVeHPGm+xc16MElXYQrVBOpYoCfi1tz8dpBwOJpCWLFDKJ/3u76+c
         KRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lnh066cTCuiyfMtY1uf8/R+IhGvvfeHGl2UzvvrxbQ4=;
        fh=pyw+IyV0TH+I+NUhSlTjM5YuKRjKrmOqUs7QX+jy3Rs=;
        b=MRXBVCH3B3/W/six3GNMO6ER2BCex/70X1A9PJlieMlPTWmzuzvOUFAEbQaSpMDe+W
         IIz4zEDePzfGswA8cgU1n3PatXnzvRYLfcJ7QvO0SMJmxOFkdFrT/ZraBQ2q0KV0+ssz
         yMNXkBGAHpeHpdmVrtyEooasLH3Jwn6WbgCqWnKWkyPWYGyHqOVw58p8ibRMCK4cje+T
         W6pgYrAl3EZkiEsajaJPpDMZlzxLTYsCK3ft71EwigS3DjYGu+xRW+ICZzAjLTvPpY/I
         WiE+emH294iUKtkBCArm86jDF4OmsSbuBrMQWphBPO1l3T88huhhdJzwEtxT3gbfoAxg
         SJIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789547879; x=1790152679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lnh066cTCuiyfMtY1uf8/R+IhGvvfeHGl2UzvvrxbQ4=;
        b=aSolCz0oKCB2ebZeJ46Ry45tiGUOIgcy4UeAPicee3c6FkczKTVcQsF05U72vlAEm6
         8KmaB25oHx8qWJVCQI39DdsKMIWs8H8d0M3v7t6scm8VBwfO4NB7tHQB1xpBjBTw92L0
         clzbovT7OQbinQWgeZNHvSba4w1MOviPfFxeb+Y4e/LTr+YPz3hW7XBrvY3nl9PZe0xz
         lzMS4BAI2rcLHI6Zn33nlcMDRs+GzpUZLhgJFQi84kE02fuy9SKofPyjTSeslTJktj3C
         dK7T1Dwto0zp0exlC65GcOVe4bfQ017+OvFP7Mb/jQg7p0ZEaXzg9ptJdDSDqiAJDO8S
         Kgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547879; x=1790152679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lnh066cTCuiyfMtY1uf8/R+IhGvvfeHGl2UzvvrxbQ4=;
        b=uCARzAxWHFgygZOPBA1b6hp95LjvlYwUTFlsu5W4cZWyDCAuXDpK6FzM3UkwSzXhCG
         twQYYatoXTsuRR0BH1mTNcSi46VwYrr1DnvjVDMxTA17oYCTzTuQ73pFHboaI5fd41Ec
         ksA3bvVHSr5voeF4SdyZSsky5IruaFTC/pw+4I74wewvWQ4wpxIoZdmjVt1CFvyjs1M2
         9tGszMUw+vI3/KR+gfZPJunB4qWA4tuGQ0B/yp/QZuL3/btp8kPM8QoS8ouLcejkp52H
         Iu88+f7Q/I+D+wVdQBImJtPMcSs74tZzSDZzVozw69OZU5UWZrX0TvsZg2A/r8ht0Nba
         59QA==
X-Forwarded-Encrypted: i=1; AKwUvBwurAqTOqscxVg1N0uddWr0EBDIQq332f3R3St4p0eRVih9Diqx0B9sh8UO+TwtEvQPEFPZX56v38W2piU=@vger.kernel.org
X-Gm-Message-State: AFuF++mW884dEwqgerTuCob5GKf+hS1a5w9bN6HkUYWwSQ6xaHp/HrVF
	40sdzn49cMSYvPCRXJek8fsYIwmkgiCdIU+WuPF9aeozw61IJqzHC0rx0Ar/PYZwkzYmGqBzL/o
	/FHCfxSj4mdO7bHg9THFS5CT/wX3iF0L/2wV0
X-Gm-Gg: AYBFou1SQsDoV5dC4F86Whp72IIIKC2w+9hldQpaGUvo6yVLwTkys0VORxFIYVWtKZ8
	xDes92PEwvB0htSEmIEgB0quEvdKrZdfWKEyV9Dtqg/bddTrlAZB+6S/4B1Sa57uRQIr3zs5hvH
	97cbQxsMaDLVHkv/NGHXd1r4j30uEzl8KnSKYUctdrJK2uEfgL0NnG35gkJltMpKHQEGibYT1jI
	s3SGsknxUdVHtrGaUGZrOkNxSf8OmJiayucYUOUGXRVbTiDkbZNF+Xe09uiBhYksTUh5Mfb4cZl
	W+BHqvsetnlwTfaiALPNEoiGEswNvcJejIGcRYzq68F3nsmwdSPt/qu2
X-Received: by 2002:a05:6512:39c7:b0:5ae:b6cf:2864 with SMTP id
 2adb3069b0e04-5b8b65b6cffmr482758e87.0.1789547878435; Wed, 16 Sep 2026
 01:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916015440.2232938-1-chao@kernel.org> <20260916015440.2232938-3-chao@kernel.org>
In-Reply-To: <20260916015440.2232938-3-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 16 Sep 2026 16:37:21 +0800
X-Gm-Features: AcwNN1U6Tc80FmVy85b5zrXcT4bV9m6x-OTxVM01uNOxzH9Wj1CoLqa7L-FkLXw
Message-ID: <CAHJ8P3Jk-4ds5CcsBTtYJDv4wFQGr1JwneSOKroRANVe7BXYgw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v8 02/12] f2fs: cache: initialize meta cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=A8=E4=B8=89 09:59=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
>
> This patch introduces meta_blocks in f2fs_sb_info structure, initializes
> and destroys the meta cache during filesystem mount and unmount.
>
> It also introduces helper wrappers for meta cache operation.
>
> Signed-off-by: Chao Yu <chao@kernel.org>
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!
> ---
>  fs/f2fs/cache.h | 9 +++++++++
>  fs/f2fs/data.c  | 3 +++
>  fs/f2fs/f2fs.h  | 3 +++
>  fs/f2fs/super.c | 9 +++++++--
>  4 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index 1fa279f9d69e..d8123a86cdf8 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -193,4 +193,13 @@ void f2fs_truncate_cache(struct f2fs_cached_block *e=
ntry, bool drop_dirty);
>  void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
>                 unsigned long start, unsigned long len, bool drop_dirty);
>
> +#define META_CACHE(sbi)                (&(sbi)->meta_blocks)
> +
> +#define f2fs_find_meta_cache(sbi, blkaddr)             \
> +       f2fs_find_cache(META_CACHE(sbi), blkaddr)
> +#define f2fs_invalidate_meta_caches(sbi, start, len)   \
> +       f2fs_drop_cache_range(META_CACHE(sbi), start, len, false)
> +#define f2fs_truncate_meta_caches(sbi, start, len)     \
> +       f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
> +
>  #endif /* _LINUX_F2FS_CACHE_H */
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d868b939caee..59fef2132177 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -670,6 +670,9 @@ static bool __has_merged_page(struct f2fs_sb_info *sb=
i, struct bio *bio,
>         if (!inode && !folio && !ino)
>                 return true;
>
> +       if (f2fs_is_cache_bio(bio))
> +               return false;
> +
>         bio_for_each_folio_all(fi, bio) {
>                 struct folio *target =3D fi.folio;
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c0c7d51c830f..85c4bf40b4aa 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2107,6 +2107,9 @@ struct f2fs_sb_info {
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>         struct lock_class_key cp_global_sem_key;
>  #endif
> +
> +       /* f2fs internal cache */
> +       struct f2fs_cached_block_list meta_blocks;
>  };
>
>  /* Definitions to access f2fs_sb_info */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6a2f09c61dcd..bc3d378371e5 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2094,6 +2094,8 @@ static void f2fs_put_super(struct super_block *sb)
>         iput(sbi->meta_inode);
>         sbi->meta_inode =3D NULL;
>
> +       f2fs_destroy_cache(META_CACHE(sbi));
> +
>         /* Should check the page counts after dropping all node/meta page=
s */
>         for (i =3D 0; i < NR_COUNT_TYPE; i++) {
>                 if (!get_pages(sbi, i))
> @@ -5263,12 +5265,14 @@ static int f2fs_fill_super(struct super_block *sb=
, struct fs_context *fc)
>         if (err)
>                 goto free_percpu;
>
> +       f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
> +
>         /* get an inode for meta space */
>         sbi->meta_inode =3D f2fs_iget(sb, F2FS_META_INO(sbi));
>         if (IS_ERR(sbi->meta_inode)) {
>                 f2fs_err(sbi, "Failed to read F2FS meta data inode");
>                 err =3D PTR_ERR(sbi->meta_inode);
> -               goto free_page_array_cache;
> +               goto free_meta_cache;
>         }
>
>         err =3D f2fs_get_valid_checkpoint(sbi);
> @@ -5596,7 +5600,8 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>         make_bad_inode(sbi->meta_inode);
>         iput(sbi->meta_inode);
>         sbi->meta_inode =3D NULL;
> -free_page_array_cache:
> +free_meta_cache:
> +       f2fs_destroy_cache(META_CACHE(sbi));
>         f2fs_destroy_page_array_cache(sbi);
>  free_percpu:
>         destroy_percpu_info(sbi);
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
