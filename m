Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3455248423A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198301; cv=pass; b=L4/0Bq18jvlvAxyU86E3Ut1sSgCrCPaBp2tJiwarCK+CQRWinHvgXCKKh8AHVQzFt5O7bnPiLX0jmP6TCYm8phA7vyL2g6gmxav3qrGggmUTveSNV/X1YYt7fZ2BwJsd5NJHviUOgV7AVk2OS2u5Owz06e7xayJqsLfX7bXLUX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198301; c=relaxed/simple;
	bh=R1+lsCB2Wrz/u50lZLT9P/dlsHUrNtJ4TxBAxyaaxKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvIHvMmV4U7ZFv/noertTMV22mfrfjEPrJH0wgLsrLTjiuCWDDvUbIVFPEhqdHlawyhMKWSWeCxU7hqBAQVxmVC7OgCqIQyHXODCU1GtHcmmHjHCquzei2D7Eh+aZyb3vA5AgSV6b0LZtdNFWmjttXmRHsJ7UPc8/BQPNSMgpMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPE8wOLs; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPE8wOLs"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a1585728b5so29653281fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788198297; cv=none;
        d=google.com; s=arc-20260327;
        b=P5Ow1w+nO9GH7ZZ0RCxUCzfmwK9gMOvgUmsln/HW28hZbwNPCXa7hDTvBUgZvyWSHs
         FOAgp89vtJMDNHtNrsvx+f9Avl/Vdrmsf3oeH1oN+Z595xwkyFJCVdV4LGkTTF5UKUvW
         RSb6BX8gzU0uvlZtIGbZgvev89d3OdJ+9aSHXzh1d7KBIxKNqhV7nnvmINAbcn3c00LN
         H5Iuu0LcGnTpP9WykjrZw8Mpa9vT0R04uYspKBPL/gD2UDI3s1G+/h1eSKnTRDMFSSv7
         cGZkvvAUVCposnAG4oFZXh843k7sbD/Ydj8gS2ebV4k8pvK476q9aTihr8Wdo3wKrEk/
         DOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2otIRoaAN1F9jcqsLH2Lx25EHK0tDk2QjhaewEvWAds=;
        fh=kYVKcLkgDgn9v93rWSpwjBrlWVokfy6kyxC+Qc6eL4A=;
        b=c8WZSP1+s+BSPTwg9V0IdDtnr6XUN/lACP5JRi0/RmKGzd6qxyiB0kpjYzA2QYLSsm
         wmtFVuZT1joc8UEpH19qAkyApndV7LRrhQq4Ca+mmv1km8yghzdtJMZnDhUAag6ewnIS
         o7g3UgLMw4MWz/dQEjPzBuRYdaMVyEOf60xfmqAketOt/XzIlCln6lD6/XxHQiRR2VLr
         Ntz+yTKLiRm2xzgPMrRNldkWZZfabXcCEEIXV8W7ewXmljTqN4LktX8Hx8D7GMtonbA6
         IIxEa5LgKBHvwcBzP/NvtTGhxr3w2ZukVOlVGgPdsNgPyNnB3t3qAfPm3MsagnVbw5aF
         IfPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788198297; x=1788803097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2otIRoaAN1F9jcqsLH2Lx25EHK0tDk2QjhaewEvWAds=;
        b=QPE8wOLsS/xHOpQ+4HJWBC0vGBFhlviY5fWCpct/DJPvqbAoHUNqK9EWXdC7dsa7nE
         uydeeKOb0kapbYx3ivJIVu7RXSJZI/TyPn8NeXla/ySF+UisPhXZPxJK9UkqeiOUZ/0t
         Cy0NVDTYheLkM+kH0sdKLV+aF7fR6eVEVvqDmtiCQ5pAZc6B/trfl/0e5CXxWxie7XqP
         DhM7f/yf0aZn3OsclEl7V4qtXeQpI3PJdumNaGjdnXsL9CAWYGqBEWeRpNiOpNZ2czt7
         t4PYSuG0m4uGjLiChYaDEwRfyH3gcPCqmpTxcBtvZdBAArfLoYbcyFrY34MWVta81MZG
         SqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198297; x=1788803097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2otIRoaAN1F9jcqsLH2Lx25EHK0tDk2QjhaewEvWAds=;
        b=TU0DReuXpEQBFjpK2C2qlGq13AgsdRmuYUuhWFQudydvvzArxR18NCKFEdAGm3e3sp
         W4eiZygCXWXyavHOC8AjPZdkMXBJ6ts4/hP8Q5sF6Biw4rR2NQ7pp51wzdmegrzU0bGV
         BZTFTvZ3Z0JVkB6uZ+MkLulMFu8xHeX8DTcKBDn60GGxV3BPycHD8LEXAEveoA7qrnc2
         9UjMJnVDO9OQQWP8jPAD/qwcHybHY0a3h2LSrjE72d8bFvtxK0yQAlZZFGDwA44+OS66
         846RJaHndrOfDhoSsYqMdn05BHaRcPuDHBEuvwBWq+Be4feh8jTZtm/diLULyqng6L9i
         MuSw==
X-Forwarded-Encrypted: i=1; AKwUvBwS3yYo6isJRcfaLVREGlYU8kTIYqFZiYXVRzVf+ia2vCayT+vQFVMVQTwghwaDLUF0gXpP7WbN36Pq6Wk=@vger.kernel.org
X-Gm-Message-State: AFuF++mbVROAMPxf1psx9z9cEw/Ro5l5Tq5cQySWIfFbzdpvo2A++IfQ
	1yGXRYq6ea5FgwJ0zK5oRGvTfUz3LxKM93410D/WcVjpamrKEaa2Q1iagBBS39cUO7+HyRfo7Jv
	EmHQtpT1TJDTXxqA4nRUxYpftoajLfMg=
X-Gm-Gg: AYBFou0Fv/3ZH4lxk56TizVTHmGt0PYIAtt/85QEScszfpG9ha99TH1gVat+01HWPiU
	5lRH1a0jo3tBH4XPrmcZzS6+NNyJ4M54VD0jrF+gv1bPDYphIGPTUDiwOaCe2CysrTj6HZHwZ/S
	aBirQX+1Cd/EWskOMxYcGr/lRC5m3YGCPsdt2WfoIcQrNY2Ua8Q6qThWYPwaudulOrgQUcFcKqY
	qgkxvjWbOMxIvy7aP8xkM1HpM/7Xlp7p/xUkg3/wIFpx71haDfb2iGxUzwSvuEL4oJxkg4zWDqC
	3+5nqXyr9xDFBEhEent2wnFCp/4OkVRdeuNgsqJGTFzkngVYIK3Tu17AvQQM7tJp/2rnyFKQ57Q
	xUVPjPYzCMbeevxswF4qjA5FVQI+b5qR+MQ==
X-Received: by 2002:a2e:be20:0:b0:39b:3e32:4a58 with SMTP id
 38308e7fff4ca-3a3395ff1f6mr7268061fa.10.1788198296685; Mon, 31 Aug 2026
 10:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829060524.2656620-1-qiwenjie@xiaomi.com> <20260829060524.2656620-3-qiwenjie@xiaomi.com>
In-Reply-To: <20260829060524.2656620-3-qiwenjie@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 31 Aug 2026 10:44:44 -0700
X-Gm-Features: AcwNN1WVogtz2BDZ19XTLp20o3rrWnn2R24TEqroa3RcLburK3RkCqO8C0u6EQU
Message-ID: <CACOAw_z1UUG0e+LSGmer_mPv+YcYVcjFiMLZ6RwhmYtmrObKXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] f2fs: refresh pinned allocation boundary after resize
To: Wenjie Qi <qwjhust@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, sunqiuyang@huawei.com, 
	daehojeong@google.com, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:05=E2=80=AFPM Wenjie Qi <qwjhust@gmail.com> wrot=
e:
>
> pinned_area_max_secno is derived from MAIN_SECS(), the zoned device
> boundary, and resizable_tail_secno. It is currently recalculated only
> at mount and remount, so online resize leaves the pre-resize value
> active after MAIN_SECS() changes.
>
> A stale value can allow pinned allocations in sections outside the
> new main-area boundary.
>
> Move the calculation to segment.h and call it whenever
> update_fs_metadata() changes MAIN_SECS(). This also restores the
> previous boundary when a final checkpoint error rolls the resize
> metadata back.
>
> Mount option validation compares the tail count with the pre-resize
> section count. Recalculating after a shrink below that tail would make
> the unsigned subtraction wrap. Reject such a shrink with -EINVAL and
> report the geometry before acquiring a mount write reference.
>
> A concurrent remount can change the tail after that early check.
> Recheck it after freezing the filesystem and taking the resize locks,
> before changing block counts or filesystem geometry.
>
> Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinn=
ed allocation")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
> Changes since v1:
> - Simplify the incompatible-tail condition.
> - Log the main, shrink, and tail section counts on rejection.
> - Validate before acquiring the mount write reference.
> - Restore compact formatting in the shared boundary helper.
> - Recheck after freeze to cover a concurrent remount option change.
>
>  fs/f2fs/gc.c      | 27 ++++++++++++++++++++++++---
>  fs/f2fs/segment.h | 13 +++++++++++++
>  fs/f2fs/super.c   | 15 ++-------------
>  3 files changed, 39 insertions(+), 16 deletions(-)
>
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 0a00180c21dc..3c61bf675afa 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -2326,6 +2326,7 @@ static void update_fs_metadata(struct f2fs_sb_info =
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
> @@ -2349,6 +2350,19 @@ static void update_fs_metadata(struct f2fs_sb_info=
 *sbi, int secs)
>         }
>  }
>
> +static bool f2fs_resize_tail_invalid(struct f2fs_sb_info *sbi,
> +                                    unsigned int secs)
> +{
> +       if (MAIN_SECS(sbi) >
> +                       secs + F2FS_OPTION(sbi).resizable_tail_secno)
> +               return false;
> +
> +       f2fs_err(sbi, "Invalid resize: main %u, shrink %u, tail %u",
> +                MAIN_SECS(sbi), secs,
> +                F2FS_OPTION(sbi).resizable_tail_secno);
> +       return true;
> +}
> +
>  int f2fs_resize_fs(struct file *filp, __u64 block_count)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(file_inode(filp));
> @@ -2392,13 +2406,15 @@ int f2fs_resize_fs(struct file *filp, __u64 block=
_count)
>                 return -EINVAL;
>         }
>
> +       shrunk_blocks =3D old_block_count - block_count;
> +       secs =3D div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> +       if (f2fs_resize_tail_invalid(sbi, secs))
> +               return -EINVAL;
> +
>         err =3D mnt_want_write_file(filp);
>         if (err)
>                 return err;
>
> -       shrunk_blocks =3D old_block_count - block_count;
> -       secs =3D div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> -
>         /* stop other GC */
>         if (!f2fs_down_write_trylock_trace(&sbi->gc_lock, &glc)) {
>                 err =3D -EAGAIN;
> @@ -2442,6 +2458,11 @@ int f2fs_resize_fs(struct file *filp, __u64 block_=
count)
>         f2fs_down_write_trace(&sbi->gc_lock, &glc);
>         f2fs_down_write_trace(&sbi->cp_global_sem, &clc);
>
> +       if (f2fs_resize_tail_invalid(sbi, secs)) {
> +               err =3D -EINVAL;
> +               goto out_err;
> +       }

redundant check?

Thanks,

> +
>         spin_lock(&sbi->stat_lock);
>         if (shrunk_blocks + valid_user_blocks(sbi) +
>                 sbi->current_reserved_blocks + sbi->unusable_block_count =
+
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 5949aa5200ac..a31d3a6ca756 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -91,6 +91,19 @@ static inline void sanity_check_seg_type(struct f2fs_s=
b_info *sbi,
>  #define GET_ZONE_FROM_SEG(sbi, segno)                          \
>         GET_ZONE_FROM_SEC(sbi, GET_SEC_FROM_SEG(sbi, segno))
>
> +static inline void f2fs_adjust_pinned_area_boundary(struct f2fs_sb_info =
*sbi)
> +{
> +       sbi->pinned_area_max_secno =3D MAIN_SECS(sbi);
> +       if (f2fs_sb_has_blkzoned(sbi) &&
> +           sbi->first_seq_zone_segno !=3D NULL_SEGNO)
> +               sbi->pinned_area_max_secno =3D min(sbi->pinned_area_max_s=
ecno,
> +                                                GET_SEC_FROM_SEG(sbi, sb=
i->first_seq_zone_segno));
> +       if (F2FS_OPTION(sbi).resizable_tail_secno)
> +               sbi->pinned_area_max_secno =3D min(sbi->pinned_area_max_s=
ecno,
> +                                                MAIN_SECS(sbi) -
> +                                                F2FS_OPTION(sbi).resizab=
le_tail_secno);
> +}
> +
>  #define GET_SUM_BLOCK(sbi, segno)      \
>         (SM_I(sbi)->ssa_blkaddr + (segno / (sbi)->sums_per_block))
>  #define GET_SUM_BLKOFF(sbi, segno) (segno % (sbi)->sums_per_block)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 253a579e9d5b..c8f8ecf49635 100644
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
> @@ -3078,7 +3067,7 @@ static int __f2fs_remount(struct fs_context *fc, st=
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
> @@ -5321,7 +5310,7 @@ static int f2fs_fill_super(struct super_block *sb, =
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
