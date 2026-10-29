Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297681;
	b=jyKd2ouYEafpbLzOvVfuHPdnx+DttghveYPNYo4NEHkt/uItAuwwfW+5SThx31YP0zFx
	 Lc8fN0jTmiYkU3vkW/GwFLQTaNaj8gf5iRw1Ti1PciPzR5QBww9Vw0cD4xDy15lpa3d6E
	 JRDEFSYXHv5YEoAxCz9UVPjV2ACz5HlUDrrh2nVQBNT32n/dMPMVRop2SsxwakvdMPFUV
	 64LpUdSK/RZrZawC4qteJh3QzqySf7JNLoFyXoOMunwHg974EOIO9Ep0Nls499+zsOK1K
	 FJbiGu8rtwN28Vp9N4IAWr3JPqCXV1KY9KOxkBM/E4C2TBMO4b+N8Q3JQn44wbY9opQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=rtC+N/wAUN3Y5ZwpWm8QmawHowGKNtV4CqLGYj7N8ms=;
	b=rR/Ukx68JN/rCatjWUiADFLGQbohd7XrZvuTXDYYtBAJ5a11gDfog9tzQj4WVOUAcdcU
	 HVG7q3q7BIgwRBtFkNcxiV2kFMDN8WecNL1/Gxoe6Cgg1phQXIEBkdAH5gnAYXhFi1Lh3
	 YG2LNYxlZ2Z5Yva4jUSbuT+UD8+mxccVtmbbNGS9Ayj5Murmn1wImi6s/M7uZ5FbiXjF2
	 P+fj7NHTe8O5m4TqpNSRFDnetL5reFx4FxMMIKLwRCVR+V6eMzrZTX3WSxmsfeKMXr/ch
	 QPxDvFWIlYf3A0R+eD6vmQJ9kg3HFj+jVApNdlMQASAQx6VpBbkuwodvo8wT3rpr3aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kgw4gjoj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D94606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D94606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kgw4gjoj
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ac91f5aa89so19923491fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793297679; cv=none;
        d=google.com; s=arc-20260327;
        b=HC4eJyYfnQ11ylRstEQPq0IRJ1DqUtLbYRsRTwIIdX21YX9D/CUmqk6hXaeXsdBU3S
         RYmv+NBsM4LVnalfsEzO3tnYX3YlPnqovGr7fuv7sNH32YKUsjBPDWpsGeALOf36zh+Q
         EhWiaqsxpB1c9gT5A3vAyMsansa5F7U0h8fHfQxcfqEijU8doJhBezbGKVbD2EGyVvr7
         A00vrUa5Squ8k/eI5eU+oWcl/2slWS3ZKZX6LWa/I9vHFaB6oJW6z9d0KcsHbHjFdY8u
         lSpzOf0bkWQZHn4ZFKn7Aaq14sCoG4x4Jptp5Bz4hgCb4vlDXqfqIzh8OGYukb2OW+9x
         sqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtC+N/wAUN3Y5ZwpWm8QmawHowGKNtV4CqLGYj7N8ms=;
        fh=k1DJS1rTMB4mXoT//JSRF6W8ewspgnic0ayXfSq9mXM=;
        b=ABG40+7+eS4vx7qlKMAcspWHISy8P9bznAQDfHSvee6uiE6Mzs8ejaDIys00qPjGy5
         6rxwMLWagym7N2Bv8xGHxpGlMEtJz/gjXJbRAmeWjNSFjf8/v1zo/HBAtlcQz5/+pwS0
         rxAUkFlTTmZWAbHY9L63ef6KcGvB0rHR098fNBifuBrxkjakvN4fMm4R0e0pilRqOKUb
         IzME+LomUFH42hREUU6C/ET1nPUFtanRpvFwjwpa7uTifTqIv4xUxMtjtcch+e9sNUam
         83g2QtW8FZjTMqkyckvuHZUM4uWSFn61nXCtkCaDCuNgyYyFzvy6hpAY4QbCm6TGOahY
         2EVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297679; x=1793902479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtC+N/wAUN3Y5ZwpWm8QmawHowGKNtV4CqLGYj7N8ms=;
        b=Kgw4gjojwRH6nwL0qkU+Ix0pCWoKiSfDNAJH8oqXUnonN87aO7gZEYhH4XTF00TcO+
         RXYV8eNy+FhUnD5NYt/9N3gP5VuXiRDN/3XKHZg00hU8AER9HeIeZIjEJUVFbjNEeGuO
         AwlOERhoe+5e+RkHYh9VT3EE4nxIQYvdL/deUIvIirlTxvJsdaNep/J0EQS8bBPfHmSg
         APRYZ6HX/aMgCck12z8Z2OC44CiYJWiTe2B/OAJQTTNaTM8BBe7Ot9UJY8hZviz2XM2H
         9VeXNfu1MKY3c8DdmbE+4eDRzPl4osa5F2yJD23r9GUGzIsw1PYpJHpPBhWdmZhyNlnv
         6vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297679; x=1793902479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtC+N/wAUN3Y5ZwpWm8QmawHowGKNtV4CqLGYj7N8ms=;
        b=YQP4oPrceOQMEb5OeenMc721XGa6wPG2KckBnZHsY1DPdR9MDCLbZDVlzxPNmbsxeS
         MIw60Y1YcUQuBdT4QuJ+D30jhYxLhecKkjd1wMH8pg32Rn5g19NIj2utSfFNBtyILq5C
         owrnuhRRVYtbsXe+xIXx31aOpskHRTcMLjpQrFYGKmcqaw/xGX9g5t7eM9Uz71/X7TTl
         2vLldaOLwJsCofKkNSVzHS3mWIaHJJOz9WC+kkLI99VajB+NVnZeExMPRrGRPoQ6kGsG
         1dWi+cPRnOmmsTermnl18LBpWX8l1sM+wdKP5t8Utghl3xgSo6tRXgVpVRkKB5qmd0XO
         wcGw==
X-Gm-Message-State: AFq9FYLiu11Gr22ERZYg9/B1uwCVMmMBlucSTPO1x10cndbzPg5G7ChR
	p+8M6shdbJZv7cMj5GtA4iWFFU67Go9mMGFGCp8I2KNhFwUrh0KFzGm0ZROFZEOYhBf3QFfY6po
	4DKDQbAsNVkdry8EB3xSsMBqle4jIyYBz+w==
X-Gm-Gg: AYBFou0f8m193xKtDxEFDbqf4/2Rsp2x3ADAuEfQ56rOA6ok/VI47Sh53C0+0UB2A1L
	2lMcAUvIm/96agD/M3/HrhOJWzPT/UJ+31y7PW8bL68f2RI92M+YUyqInB9k7oX+7clEQBNRwvE
	pcelWtsO07KCvwT8JWQ+2f9X7W6bTvaNxN3uOg+hRIGxc0NXPu+QyEKNfzJVEkpbOW1en+wG+gt
	l/ozzBGiEyJEliCHuarkaWBydAQWG/wHl2DW+5+MetLD7QZq2FMG8a3tsHCr7zBcz/4pJOX4P9a
	UMXF33dbeQpCGJbNz+2Xc+lHj/Ew9Xe6lTfnqTZVdo9fbUlLhufAq0MSGbFOPPLeA5OfMRsGwhy
	by1/35/TGYAVKb6Bi+FGKo1nHK19ru/DaXlmotMISGp6jfgiyc8E4bbHtBqePSkh0Y2LdRJHrzY
	xopE7FfLGQGeF3d8rvbCuuNi4OWNipPTv320IzzOR5lEc=
X-Received: by 2002:a2e:a554:0:b0:3ab:4f5e:3edc with SMTP id
 38308e7fff4ca-3ac9cf2601emr14475121fa.15.1793297679262; Thu, 29 Oct 2026
 11:14:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022165526.1539629-1-daeho43@gmail.com>
In-Reply-To: <20261022165526.1539629-1-daeho43@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 29 Oct 2026 11:14:26 -0700
X-Gm-Features: AclHuK97xB-G-ok4MxMIHMmR4Roq_yd353XWfUtGXACutJIwawwhiVWKpiNNCtg
Message-ID: <CACOAw_yWifoOgP2kZ+AE8ZsBxq8qYy_+yUD8DOiY1Wz1zGK9EA@mail.gmail.com>
Subject: Re: [PATCH v2] f2fs: reserve space to be shrunk during resize_fs
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>, Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kindly ping this.

On Thu, Oct 22, 2026 at 9:55=E2=80=AFAM Daeho Jeong <daeho43@gmail.com> wro=
te:
>
> From: Daeho Jeong <daehojeong@google.com>
>
> f2fs_resize_fs() drops gc_lock and the cp lock between the free space
> check and freeze_super(). In that window, others can allocate the free
> space, so the second check after freeze_super() fails with -ENOSPC.
> This is easy to hit on a busy filesystem, e.g. at OTA install time.
>
> Reserve the space to be shrunk via resize_reserved_blocks once the
> first check passes, and deduct it in __get_available_block_count() like
> alias_reserved_blocks. Release it on success or on error.
>
> With the reservation, the second check should not fail anymore, so:
> - allow root reserved blocks, which root may use in the meantime,
> - recheck DISABLE_CHECKPOINT, which remount may set in the meantime,
>   since freeze_super() fails only when the fs is still dirty,
> - keep the check only as a WARN_ON_ONCE() safety net.
>
> Also exclude the alias/resize reservations when updating
> current_reserved_blocks via sysfs, otherwise it can underflow
> __get_available_block_count().
>
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> Changes in v2:
> - Exclude alias/resize reservations from current_reserved_blocks.
> - Allow root reserved blocks in the second check, with WARN_ON_ONCE().
> - Recheck DISABLE_CHECKPOINT after freeze_super().
> ---
>  fs/f2fs/f2fs.h  | 18 +++++++++++++----
>  fs/f2fs/gc.c    | 54 ++++++++++++++++++++++++++++++++++++++-----------
>  fs/f2fs/super.c |  1 +
>  fs/f2fs/sysfs.c | 12 ++++++++++-
>  4 files changed, 68 insertions(+), 17 deletions(-)
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 089a62c054e..6b9e1d0e71c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1897,6 +1897,7 @@ struct f2fs_sb_info {
>         block_t reserved_blocks;                /* configurable reserved =
blocks */
>         block_t current_reserved_blocks;        /* current reserved block=
s */
>         block_t alias_reserved_blocks;          /* reserved blocks for de=
vice alias */
> +       block_t resize_reserved_blocks;         /* reserved blocks for re=
size_fs */
>
>         /* Additional tracking for no checkpoint mode */
>         block_t unusable_block_count;           /* # of blocks saved by l=
ast cp */
> @@ -2666,16 +2667,18 @@ static inline bool __allow_reserved_root(struct f=
2fs_sb_info *sbi,
>         return false;
>  }
>
> -static inline unsigned int get_available_block_count(struct f2fs_sb_info=
 *sbi,
> -                                               struct inode *inode, bool=
 cap)
> +static inline unsigned int __get_available_block_count(
> +                                       struct f2fs_sb_info *sbi,
> +                                       bool allow_root)
>  {
>         block_t avail_user_block_count;
>
>         avail_user_block_count =3D sbi->user_block_count -
>                                         sbi->current_reserved_blocks -
> -                                       sbi->alias_reserved_blocks;
> +                                       sbi->alias_reserved_blocks -
> +                                       sbi->resize_reserved_blocks;
>
> -       if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, in=
ode, cap))
> +       if (test_opt(sbi, RESERVE_ROOT) && !allow_root)
>                 avail_user_block_count -=3D F2FS_OPTION(sbi).root_reserve=
d_blocks;
>
>         if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> @@ -2688,6 +2691,13 @@ static inline unsigned int get_available_block_cou=
nt(struct f2fs_sb_info *sbi,
>         return avail_user_block_count;
>  }
>
> +static inline unsigned int get_available_block_count(struct f2fs_sb_info=
 *sbi,
> +                                               struct inode *inode, bool=
 cap)
> +{
> +       return __get_available_block_count(sbi,
> +                               __allow_reserved_root(sbi, inode, cap));
> +}
> +
>  static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bo=
ol);
>  static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>                                  struct inode *inode, blkcnt_t *count,
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 926e6976bc2..955224f4166 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -2374,6 +2374,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_c=
ount)
>         struct f2fs_lock_context glc;
>         struct f2fs_lock_context clc;
>         unsigned int secs;
> +       bool reserved =3D false;
>         int err =3D 0;
>         __u32 rem;
>
> @@ -2425,10 +2426,17 @@ int f2fs_resize_fs(struct file *filp, __u64 block=
_count)
>         f2fs_lock_op(sbi, &lc);
>
>         spin_lock(&sbi->stat_lock);
> -       if (shrunk_blocks + valid_user_blocks(sbi) +
> -               sbi->current_reserved_blocks + sbi->unusable_block_count =
+
> -               F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_c=
ount)
> +       if (shrunk_blocks + valid_user_blocks(sbi) >
> +                       __get_available_block_count(sbi, false)) {
>                 err =3D -ENOSPC;
> +       } else {
> +               /*
> +                * Reserve the space to be shrunk so that no one, includi=
ng
> +                * root, can allocate it until the shrink is done.
> +                */
> +               sbi->resize_reserved_blocks +=3D shrunk_blocks;
> +               reserved =3D true;
> +       }
>         spin_unlock(&sbi->stat_lock);
>
>         if (err)
> @@ -2442,29 +2450,45 @@ int f2fs_resize_fs(struct file *filp, __u64 block=
_count)
>  out_drop_write:
>         mnt_drop_write_file(filp);
>         if (err)
> -               return err;
> +               goto out_release;
>
>         err =3D freeze_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
>         if (err)
> -               return err;
> +               goto out_release;
>
>         if (f2fs_readonly(sbi->sb)) {
>                 err =3D thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> -               if (err)
> -                       return err;
> -               return -EROFS;
> +               if (!err)
> +                       err =3D -EROFS;
> +               goto out_release;
> +       }
> +
> +       /* checkpoint can be disabled by remount before freeze_super() */
> +       if (test_opt(sbi, DISABLE_CHECKPOINT)) {
> +               f2fs_err(sbi, "Checkpoint should be enabled.");
> +               err =3D thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> +               if (!err)
> +                       err =3D -EINVAL;
> +               goto out_release;
>         }
>
>         f2fs_down_write_trace(&sbi->gc_lock, &glc);
>         f2fs_down_write_trace(&sbi->cp_global_sem, &clc);
>
>         spin_lock(&sbi->stat_lock);
> -       if (shrunk_blocks + valid_user_blocks(sbi) +
> -               sbi->current_reserved_blocks + sbi->unusable_block_count =
+
> -               F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_c=
ount)
> +       /*
> +        * shrunk_blocks is already accounted in resize_reserved_blocks, =
so
> +        * this should not fail. Allow root reserved blocks here since ro=
ot
> +        * may have used them after the first check, regardless of resize=
.
> +        */
> +       if (WARN_ON_ONCE(valid_user_blocks(sbi) >
> +                       __get_available_block_count(sbi, true))) {
>                 err =3D -ENOSPC;
> -       else
> +       } else {
>                 sbi->user_block_count -=3D shrunk_blocks;
> +               sbi->resize_reserved_blocks -=3D shrunk_blocks;
> +               reserved =3D false;
> +       }
>         spin_unlock(&sbi->stat_lock);
>         if (err)
>                 goto out_err;
> @@ -2510,5 +2534,11 @@ int f2fs_resize_fs(struct file *filp, __u64 block_=
count)
>         f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
>         f2fs_up_write_trace(&sbi->gc_lock, &glc);
>         thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> +out_release:
> +       if (reserved) {
> +               spin_lock(&sbi->stat_lock);
> +               sbi->resize_reserved_blocks -=3D shrunk_blocks;
> +               spin_unlock(&sbi->stat_lock);
> +       }
>         return err;
>  }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index d683240040f..28e49e8d71e 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5345,6 +5345,7 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>         sbi->reserved_blocks =3D 0;
>         sbi->current_reserved_blocks =3D 0;
>         sbi->alias_reserved_blocks =3D 0;
> +       sbi->resize_reserved_blocks =3D 0;
>         limit_reserve_root(sbi);
>         adjust_unusable_cap_perc(sbi);
>
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 9749da70089..ce70d81eba3 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -594,6 +594,8 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>         }
>  #endif
>         if (a->struct_type =3D=3D RESERVED_BLOCKS) {
> +               block_t avail, valid;
> +
>                 spin_lock(&sbi->stat_lock);
>                 if (t > (unsigned long)(sbi->user_block_count -
>                                 F2FS_OPTION(sbi).root_reserved_blocks)) {
> @@ -601,8 +603,16 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>                         return -EINVAL;
>                 }
>                 *ui =3D t;
> +               /*
> +                * Exclude the space reserved for device aliasing and res=
ize_fs,
> +                * otherwise the reserved blocks can overlap with them an=
d
> +                * __get_available_block_count() can underflow.
> +                */
> +               avail =3D sbi->user_block_count - sbi->alias_reserved_blo=
cks -
> +                                       sbi->resize_reserved_blocks;
> +               valid =3D valid_user_blocks(sbi);
>                 sbi->current_reserved_blocks =3D min(sbi->reserved_blocks=
,
> -                               sbi->user_block_count - valid_user_blocks=
(sbi));
> +                               avail > valid ? avail - valid : 0);
>                 spin_unlock(&sbi->stat_lock);
>                 return count;
>         }
> --
> 2.56.0.218.g1ec904b173-goog
>
