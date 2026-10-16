Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185A54CE663
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158669; cv=pass; b=Xvkf9guh4rpFNnvtnJD5brjJQmtpTcsb0kwgM9whhXApFH7pZVa48FUFZyW+ULBWSL/CSaUQUF1RZYNa5Ei7snDUwu5dyxYL4jW+3QuS0hnAaqPKsP4lePCsZWACJBuXNBiTd9/gLQoi6j8wM8qsfkaap/H64g3H1y0JKTl5znM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158669; c=relaxed/simple;
	bh=l735HQ+KIvF/w85z+XR45K1w2Il5/7/MhqFAZ9axQOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVDUeSM2eNPfkBdTnHmIBMaGaiKFbZm2aoLIhfYnr54EjlxNqa2uJpb3G7kQPBlBg7qAseNCbC/VRfQwo0x8IVoNwAzWJEPHwRqYdhBrT6WSB2bUHt3MnBs6R9O3b3fjmm9TE6uYdHMDPWHldMXIOoq8N58pU0DbpnVeIf/DTb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJNCQJBY; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJNCQJBY"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab01c46697so13609141fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792158666; cv=none;
        d=google.com; s=arc-20260327;
        b=sIdCpdN4QnSs3AW/SIwpIQ5Nhjb0d9AO0riHtTx1bPLmpQkOKFtwblgOA4/nxiRN7i
         RbLTinlNIfJlOmW2XrGXEoh+xdBanueGe4NoqmRr+wRru/TAphzuE7S+D/tJPRzxW6JS
         98G3OWIaG389Wn5DIBCd00jomykXCromUI0ehKsJ5hdu/xBwH0JsnBL585qsU9L96obF
         UT24vzfl+FzezCOrcizDdN8k8RAunMTljCcsJiTspqf4pz5qIDyZDpHV8zS/lDcHRdXt
         aMNckR1x59VjdZRefPHBHJWjXKm+HBx4YfvrE6Yh4Eh+h9RJmiTBBQVecM8Tfm09/1SW
         KPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhSOLDu9e0H9P6bIO+k82DvZ/zSAtG35D1+0jxFK13Q=;
        fh=rrjjRicKEgny+lvW/IuXpWmsJkVkbJFxrINV5Ie3/Ls=;
        b=FuAgrFHA239izhpA3FqZUMWUI6XdQnehGgv+pkpd54IqxpVZqbXHdC2cQDadf2VCh3
         4IZJ84nvdzd4Y8wBMvb71we4Fc/jVB6LYbM2djv9W+Yi5ITOcl3R4fjfKTh37Svbv+oi
         iZSGm26E/RDxHLQoMQFmglBpUSYbx75hMjRfjFi3eo2GAR2/TfC3zmWf4H0PRtOGEgkF
         J+nk36gjhGoTDfF39uXUU7S4aev8G1VXbqeTMFI8uAhm4PL7Di85HJwgKlxekZP/uuXu
         8gTnFf609frYTKqQq5+928TEfp1igprzHuRwEWN783+sDU4yIqaNFpXbIrNa9DpQf5jA
         Rm1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158666; x=1792763466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MhSOLDu9e0H9P6bIO+k82DvZ/zSAtG35D1+0jxFK13Q=;
        b=MJNCQJBYBNzO6mLDlfMhXdOcGNkAnEkLDrdQ9jDsAVH3YTnigllwAtXhsrdQCfezkW
         c/gtWn4LGRD4aBn7Ac8fWHwkuFthnDAWnqH0gpk/2L10kQrBPu74q80ekyn48j46vxHN
         C+6peQ60FPm5DQ4MPE8wyACk49oYOU4MLwa2yX1WoNG9SR39Qzpok32jBwQ47ZImh/X4
         RzqRmef1sXVEgWTs6QO30UETyLF7xfSKEuOinXWnkFtvPGR+zzvO7m7OaFMBhPcttf5T
         GPehCfe5cZZJ2zizwHvbir4oGb7ifcZB1BOspJqTdfZGQt3OvCicMhK40DniFVTatkR/
         sYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158666; x=1792763466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhSOLDu9e0H9P6bIO+k82DvZ/zSAtG35D1+0jxFK13Q=;
        b=Xudb2uHf8uGmKP4isD9xkw77BZZhJVdAecrOWdnMg+U0cF4nEeYLrp7wyLiYV6PKqh
         nWu3v65KUJBv74z2v3dU8ndqtd9//fRiyGRPPn3z8ALQ5a+KYa8Xr21po6HnSNc2Otba
         pavMRT4WOvyDF6ZIGcogKUXL5ONXPyy4GJGLm3mjlieIXdBe4Yi7O1DkzeQ33HQWv+Rx
         rvo3lIinPP/MiiFDCSPQtiCneXDJAscfSZXjCt372xKsnPvTjTHAx/R++s8fLgIrLGXH
         Ypx4B6OqUlt76WHRxPpTuJEQPgfS2/WVtNtMuWc1tj8pDh+RyP94/sg4c5LYTBENDCvD
         GKUg==
X-Forwarded-Encrypted: i=1; AKwUvBzlMzCcJZZdm0LzypfKxaBX56qY1T+vYf8tpmQ9BAaTD+s97sFJdo/dII2llOePq9kAQRlr3NKUBT7n2G8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuJSZkIoei1DkD8+77Ao3TWLYMLbPJdR6qVpa3P6dGW2r/K0IT
	kkOI4iBOnaPdGD06Aus+5KLN5nMGvrCkfftAkA2Hcmm6nDwnVbL8xi8TuzvwfI5IduccxPJ4k8D
	hsbUCOi3a1fPOVt/A4PaDpMhW6pIutgs=
X-Gm-Gg: AYBFou1len/PV4Xvwx41g0UhAlcsxnCRmKMN2VyhbZ9i8xy8sBdnw0Cw0sm1YYPiCgh
	GdDTPixssYze7WRyu62y8pT1Q53oP9KrpQqof83FdzsW3fSsmpS7VJvvHuxJq4sEv7OMcB4occg
	2ogWYLQEI6sH/SGZmkRzmpgXhzJo1gdnauAnEjMSsijw77nH7rrtEumDJHtBU+vIMPIrai12dFx
	Ry1hg8u0TKEA8D7cTwnIhWReVXBhW34NqZQ5NbgCHqQWxmcWQiO/puICne8HOcYm/vKodOzGBLP
	Ku8/4NPDiicW4QK+SF0PiCvRqhf1ku0JMtvhhJ6NoNhHLTr5Euxi+BhCfrZDCBi/EF/qWX6k8hN
	p2uM9uEfTMA62xaEGWy2l33agCGgu2WdpZWDRAYIL+8cW
X-Received: by 2002:a2e:a9a3:0:b0:3a2:f233:5c6e with SMTP id
 38308e7fff4ca-3a9c515d16dmr53790271fa.6.1792158665553; Fri, 16 Oct 2026
 06:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792116883.git.qiwenjie@xiaomi.com> <226abf7d629d7345f450753a42e924b436c99ec0.1792116883.git.qiwenjie@xiaomi.com>
In-Reply-To: <226abf7d629d7345f450753a42e924b436c99ec0.1792116883.git.qiwenjie@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 16 Oct 2026 06:50:51 -0700
X-Gm-Features: AclHuK8vpgAnY9xHHeD4VkceCLXKMKMXp9Gw8FXUKb93oc0cPZDjjzKkDWi3A1c
Message-ID: <CACOAw_wvwY93mFW4ksF0m8XDf7opykefeDNg7NCnE8OkpxN0_g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] f2fs: refresh pinned allocation boundary after resize
To: Wenjie Qi <qwjhust@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com, 
	sunqiuyang@huawei.com, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 10:44=E2=80=AFPM Wenjie Qi <qwjhust@gmail.com> wrot=
e:
>
> Online shrink updates MAIN_SECS() but leaves resizable_tail_secno and
> pinned_area_max_secno unchanged. The pinned allocation limit can exceed
> the new main area when shrinking beyond the reserved tail.
>
> Consume the reserved tail by the number of removed sections, clamping
> it to zero, before refreshing the shared pinned allocation boundary.
> This preserves the boundary while shrinking within the reservation and
> limits it to the new main area otherwise, retaining the zoned limit.
>
> Save the old tail count and restore it before rolling back the geometry
> if the final checkpoint fails.
>
> Also bound pinned section allocation by the current MAIN_SECS(). Range
> evacuation temporarily reduces it before moving cursegs, while the
> cached pinned boundary still describes the old geometry. Otherwise, a
> pinned curseg can be reallocated into the range being removed.
>
> Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinn=
ed allocation")
> Suggested-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
> Changes in v4 (since v3):
> - Bound pinned section allocation by the current MAIN_SECS().
>
> Changes in v3 (since v2):
> - Consume the tail reservation instead of keeping its old size.
> - Restore the saved tail before geometry and boundary rollback.
> - Document the remaining-reservation semantics.
>
> Changes in v2 (since v1):
> - Simplify tail validation and improve rejection diagnostics.
> - Validate before taking the mount write reference and recheck
>   after freeze for concurrent remounts.
>
> v1:
> - Refresh the pinned boundary on geometry changes and rollback.
> - Check the tail against the requested shrink geometry.
>
>  Documentation/filesystems/f2fs.rst |  3 ++-
>  fs/f2fs/gc.c                       |  6 +++++-
>  fs/f2fs/segment.c                  |  2 +-
>  fs/f2fs/segment.h                  | 11 +++++++++++
>  fs/f2fs/super.c                    | 15 ++-------------
>  5 files changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesyste=
ms/f2fs.rst
> index 771216f45207a..55798421f2c45 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -421,7 +421,8 @@ resizable_tail_secno=3D%u  Control the number of sect=
ions at the tail of the
>                          (MAIN_SECS - resizable_tail_secno) - 1. If set t=
o 0
>                          (default), there is no tail restriction unless r=
unning
>                          on a zoned block device where conventional zones=
 are
> -                        used.
> +                        used. Online shrink consumes this reservation, r=
educing
> +                        the value by the number of removed sections, dow=
n to zero.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  Debugfs Entries
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 926e6976bc22a..540769ad58acc 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -2342,6 +2342,7 @@ static void update_fs_metadata(struct f2fs_sb_info =
*sbi, int secs)
>         SM_I(sbi)->segment_count =3D (int)SM_I(sbi)->segment_count + segs=
;
>         MAIN_SEGS(sbi) =3D (int)MAIN_SEGS(sbi) + segs;
>         MAIN_SECS(sbi) +=3D secs;
> +       f2fs_adjust_pinned_area_boundary(sbi);
>         if (sbi->allocate_section_hint > MAIN_SECS(sbi))
>                 sbi->allocate_section_hint =3D MAIN_SECS(sbi);
>         FREE_I(sbi)->free_sections =3D (int)FREE_I(sbi)->free_sections + =
secs;
> @@ -2373,7 +2374,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_c=
ount)
>         struct f2fs_lock_context lc;
>         struct f2fs_lock_context glc;
>         struct f2fs_lock_context clc;
> -       unsigned int secs;
> +       unsigned int secs, old_tail;
>         int err =3D 0;
>         __u32 rem;
>
> @@ -2482,6 +2483,8 @@ int f2fs_resize_fs(struct file *filp, __u64 block_c=
ount)
>                 goto recover_out;
>         }
>
> +       old_tail =3D F2FS_OPTION(sbi).resizable_tail_secno;
> +       F2FS_OPTION(sbi).resizable_tail_secno -=3D min(old_tail, secs);
>         update_fs_metadata(sbi, -secs);
>         clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
>         set_sbi_flag(sbi, SBI_IS_DIRTY);
> @@ -2489,6 +2492,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_c=
ount)
>         stat_inc_cp_call_count(sbi, TOTAL_CALL);
>         err =3D f2fs_write_checkpoint(sbi, &cpc);
>         if (err) {
> +               F2FS_OPTION(sbi).resizable_tail_secno =3D old_tail;
>                 update_fs_metadata(sbi, secs);
>                 update_sb_metadata(sbi, secs);
>                 f2fs_commit_super(sbi, false);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index bf8d07fcce331..f6e1cb1c0b71d 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2983,7 +2983,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi=
,
>                 alloc_hint =3D MAIN_SECS(sbi);
>
>         if (pinning) {
> -               max_secno =3D sbi->pinned_area_max_secno;
> +               max_secno =3D min(sbi->pinned_area_max_secno, MAIN_SECS(s=
bi));
>                 hint =3D 0;
>         } else if (alloc_policy =3D=3D ALLOCATE_FORWARD_FROM_HINT &&
>                 hint < alloc_hint) {
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 526764ba31ae5..918bc4452ad09 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -91,6 +91,17 @@ static inline void sanity_check_seg_type(struct f2fs_s=
b_info *sbi,
>  #define GET_ZONE_FROM_SEG(sbi, segno)                          \
>         GET_ZONE_FROM_SEC(sbi, GET_SEC_FROM_SEG(sbi, segno))
>
> +static inline void f2fs_adjust_pinned_area_boundary(struct f2fs_sb_info =
*sbi)
> +{
> +       sbi->pinned_area_max_secno =3D MAIN_SECS(sbi);
> +       if (f2fs_sb_has_blkzoned(sbi) && sbi->first_seq_zone_segno !=3D N=
ULL_SEGNO)
> +               sbi->pinned_area_max_secno =3D min(sbi->pinned_area_max_s=
ecno,
> +                               GET_SEC_FROM_SEG(sbi, sbi->first_seq_zone=
_segno));
> +       if (F2FS_OPTION(sbi).resizable_tail_secno)
> +               sbi->pinned_area_max_secno =3D min(sbi->pinned_area_max_s=
ecno,
> +                               MAIN_SECS(sbi) - F2FS_OPTION(sbi).resizab=
le_tail_secno);
> +}
> +
>  #define GET_SUM_BLOCK(sbi, segno)      \
>         (SM_I(sbi)->ssa_blkaddr + (segno / (sbi)->sums_per_block))
>  #define GET_SUM_BLKOFF(sbi, segno) (segno % (sbi)->sums_per_block)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 773b12ea29c0c..f323d9705aebe 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -554,17 +554,6 @@ static inline void adjust_unusable_cap_perc(struct f=
2fs_sb_info *sbi)
>                         F2FS_OPTION(sbi).unusable_cap_perc);
>  }
>
> -static inline void adjust_pinned_area_boundary(struct f2fs_sb_info *sbi)
> -{
> -       sbi->pinned_area_max_secno =3D MAIN_SECS(sbi);
> -       if (f2fs_sb_has_blkzoned(sbi) && sbi->first_seq_zone_segno !=3D N=
ULL_SEGNO)
> -               sbi->pinned_area_max_secno =3D min(sbi->pinned_area_max_s=
ecno,
> -                               GET_SEC_FROM_SEG(sbi, sbi->first_seq_zone=
_segno));
> -       if (F2FS_OPTION(sbi).resizable_tail_secno)
> -               sbi->pinned_area_max_secno =3D min(sbi->pinned_area_max_s=
ecno,
> -                               MAIN_SECS(sbi) - F2FS_OPTION(sbi).resizab=
le_tail_secno);
> -}
> -
>  static void init_once(void *foo)
>  {
>         struct f2fs_inode_info *fi =3D (struct f2fs_inode_info *) foo;
> @@ -3103,7 +3092,7 @@ static int __f2fs_remount(struct fs_context *fc, st=
ruct super_block *sb)
>         sb->s_flags =3D (sb->s_flags & ~SB_POSIXACL) |
>                 (test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
>
> -       adjust_pinned_area_boundary(sbi);
> +       f2fs_adjust_pinned_area_boundary(sbi);
>         limit_reserve_root(sbi);
>         fc->sb_flags =3D (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYT=
IME);
>
> @@ -5440,7 +5429,7 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>         /* get segno of first zoned block device */
>         sbi->first_seq_zone_segno =3D get_first_seq_zone_segno(sbi);
>
> -       adjust_pinned_area_boundary(sbi);
> +       f2fs_adjust_pinned_area_boundary(sbi);
>
>         sbi->reserved_pin_section =3D f2fs_sb_has_blkzoned(sbi) ?
>                         ZONED_PIN_SEC_REQUIRED_COUNT :
> --
> 2.43.0
>

Reviewed-by: Daeho Jeong <daehojeong@google.com>

Thanks,
