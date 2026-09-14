Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF67389118
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377685; cv=pass; b=pBqYHnZS5rch48SPWSbJe2ELB913Mdgzt9fy8NG0OkultJ8v/Vrkl/pOlHuThLb413+3lRiN//zTOwqppFiL6i4X1ul++pcsYWc4bLPp3JuLbvFzp6PAqHeBgwj5ktShD3RBzD0F/KlpcdHEOletrUvkUOdFFQKSj4AwNnbEg+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377685; c=relaxed/simple;
	bh=PBUimy4kSdBR4uGCcugZcWXE2d1vCdgIxXnWsl15N7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUS9r+p9+xesuMyScHAf10n2gv76lFeV9myo7oTETB6ZDF+RVUPvRHlY4dId0USY24xge/EsuXXBZTPkM8+JzGIJ9MVKb3X9NDj+XTE+V9GEyATatUhC1Vf8IFfPgabvXDJoY0CjBSxuWaW+ebFf1O00DOrTUoIPutqP2IuFlTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkGmGUjP; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkGmGUjP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so252047f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377681; cv=none;
        d=google.com; s=arc-20260327;
        b=r3gYxqVqYhLF0HFNateBpDLriJBefahKN4nM93GSdo9kjP6GXvYxFcS2QuERz1SHFZ
         GTIisc76Yz9G+QIAGyTeU/nXknpFj5ZATFphArXo3Ng9N0vJbnsT54Ekg+sYX1gzYx7n
         kNQTZUxgW6QzJoOO7GqgzoR3pBauoOtCahR+GZzX6uZjNnkcQi2Xbi6iJrFbLZTNhfAc
         j9W9RidivVa0iH0UYAQTNCPzCnfE8m50SAr8VA6oNmqd3NKDDDLKeuopdNGzBYrvoPpa
         cTBTCfi0PgDU4dC5lHSOnH0wLz0pmNh5O/pTkGLn93ndXcV/1lqFdbc9sOtUNcKcGkZs
         E3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wwrq1AQ7AQhYuiO/PQ/FAIrBktVWNjfbFAJiCq17zCs=;
        fh=ErCng5LHqGMNWWMUhp9gDAnOu9V1vlh3jwzKR4qVbrA=;
        b=m4DprgIbrJFLN2fnm0ahJTYuP3GxUGdHwMrCYg65V1a6HuhWvHfqd5lTM/1vCRwZbA
         7puSaJXwfclfwPXslypIPdmRG8XsRbBbnDsI7oD6qkom9JHozun7pQRajRYtlS4RRy7Y
         UV12IvyBHIlFj6n8Fnp9FKx23Qdxf0pWWjfVmIkedrZpW8bZljeTYS3EFz9gkj1VsHqJ
         6OgVrKxpbhl7c+PqbDrtJv1YIyOBOOnJd9/gI4LSA+RI27bQDyF3dXcGJ3TB2aVPbDb4
         TbWqdHTPFSZf4c1lVY6kSxGnC06UxbaplA93ni2UIdw9rw57kh6tG6ywTx4RbCNRWs8p
         Wwtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377681; x=1789982481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wwrq1AQ7AQhYuiO/PQ/FAIrBktVWNjfbFAJiCq17zCs=;
        b=rkGmGUjPsdzBw0jw9IYhOOmJk1/pdvych2JAuURIfL29AYJVkgBAZlgi60oFqsc+02
         Q8FS80UcHBBmZ2SdoqECcA0Dqi657VaUlQphNvkG7eNnCtEX2MfeOx5ffFsZZo7kgA5G
         SIhErB8cTpy8oSXroutlhBclopqbm/KSMGsCWYWFhmbPDhzPf+/Na12PK0AwwFTUWh3t
         7dA6sAzlrIVwnhusNpqfwRI1S2SGI6cpR0UKmRzppRaDKARMk+IKjsMQQNucN4FKABXi
         0DSo7pYQZevsYmMAnMzzwEpfCUzwoGNQabYzMNZ6sCZmP7iI1eo4CqtWgNHKbhKS7TMZ
         P3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377681; x=1789982481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wwrq1AQ7AQhYuiO/PQ/FAIrBktVWNjfbFAJiCq17zCs=;
        b=Yp2yQ6feuUEOtM7ilt7SCbPXdOPsgnEPRv/LRISf9pxGTL+58JYPH8f+dJkqvWwQQX
         QZLzRk0Z4ViIM/vPq2WIKvebbkCCMegZwVl445WNMbUaNv9JNRFwIGLJtgsVbEZjupzY
         RH+PKa8JJtfWLzPZQ2dSWbFGlBtg7Y9iL2rdFj8l7h8aMjEzRkLgoTKlkum8n+nek8ml
         70Xx3NiMrTESbbC3HcNzT2qdEoGNzU8tfzYuE+s7CT5aqMAl6MYGJ6PucyU1jSibMJqU
         O4b7ZY2HKerC35xSNGfNB0ujPh0RBgBWGJ+hmGoz4Av7FpA+bOTHM9ECcYGQblTXXf0c
         +pHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8QUHvNkjHpFlyyZHKU3lWZovIqDcFn+SqEDp2snfKUhf7M6UX5Cjd6xkUYOBiwd8XjShhDOgL/4Sz7GE=@vger.kernel.org
X-Gm-Message-State: AFuF++mBG5UE6HTj96vCxYcxutI7QM+w5ZYVDkKaEWdUtP0bUC+tPwpU
	selduou0qh0AdYxoAHrnCz/IoSa6StPCqq3kozGcIEmlm6X152W2RhOHf9R/HQOqAJbsZkgclau
	EGmVI4OOlh1c5bS53gYp4aGjqKdWvO9A=
X-Gm-Gg: AYBFou3raUGiameMMHnWx9BlnJO0r4I4BrH/n+aJ3KFc69bMubOxxfenZnQgAwDd652
	QWSTRiA+wa3surRH1zamO6YrW/VQ2NxjEYyZpQrJ+I7vSJZGQwoDIk052NjIRSyf1rupu4KKutc
	O+r825F4gAHyDPepfPpLQmoYHApHAYmxyU0loAkjNuE/BkR7p/Q+fCdbwDRxxEai33wuPvIBN3o
	RF65G7TqibxErXancNoa1BuF+8Hv/koq96EF2DV+LqjRxL8DwyZlWEON1u3tla0JuDzAUUOM40o
	QwmVrbmy1RlVyxmkQrf1xbvbPQHQY7dsrTA5XpJ+yddZ0yaLVh2mUP+T
X-Received: by 2002:a05:6000:41da:b0:486:f76c:dacc with SMTP id
 ffacd0b85a97d-48702b0cf11mr1814548f8f.4.1789377680703; Mon, 14 Sep 2026
 02:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911232405.1815804-1-chao@kernel.org> <20260911232405.1815804-3-chao@kernel.org>
In-Reply-To: <20260911232405.1815804-3-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 14 Sep 2026 17:21:09 +0800
X-Gm-Features: AcwNN1Xdk7IOQx3K7FUj3F4rWrOzG0Dg5OIl5Rktm3njl4E0IRtFuD-3voufCK0
Message-ID: <CAHJ8P3JSW+y4PK+Zb6HvpnDgYt7uPko5kOVsbn3zRPefd5o98Q@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 02/12] f2fs: cache: initialize meta cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8812=E6=97=A5=E5=91=A8=E5=85=AD 07:28=E5=86=
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
> ---
>  fs/f2fs/cache.h | 12 ++++++++++++
>  fs/f2fs/data.c  |  3 +++
>  fs/f2fs/f2fs.h  |  3 +++
>  fs/f2fs/super.c | 10 +++++++++-
>  4 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index 72dbf26ab26e..d5ee51691fac 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -194,4 +194,16 @@ void f2fs_truncate_cache(struct f2fs_cached_block *e=
ntry, bool drop_dirty);
>  void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
>                 unsigned long start, unsigned long len, bool drop_dirty);
>
> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
> +
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
> index 6a2f09c61dcd..b731b9bb7b54 100644
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
> @@ -5263,12 +5265,16 @@ static int f2fs_fill_super(struct super_block *sb=
, struct fs_context *fc)
>         if (err)
>                 goto free_percpu;
>
> +       err =3D f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
never fail now?
> +       if (err)
> +               goto free_page_array_cache;
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
> @@ -5596,6 +5602,8 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>         make_bad_inode(sbi->meta_inode);
>         iput(sbi->meta_inode);
>         sbi->meta_inode =3D NULL;
> +free_meta_cache:
> +       f2fs_destroy_cache(META_CACHE(sbi));
>  free_page_array_cache:
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
