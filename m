Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9642D36196E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940542; cv=pass; b=XabYJbsCQO+qA074WhfqfOLqXU9WriuwzU7lVGKtYlBhX8vIubXVywBKXVG26JNxfgOrRJuFkk+IDbPQBea1ujRjq9zszyiaqSBy46vNu1BLayF6+MEjElXOhXNGP3B8vGogVGbMOoyqFAXS829Gi2Jvmivv6SMNPYTLKIqZOFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940542; c=relaxed/simple;
	bh=H8c7VDtHldqQBTz3qvNs4yuDs8Y8FJ//byejQyKfD5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNlenC9+QbWUKzJuQKd36Xa8v1Ps609ugMyDi2oBEusTq8x11MOWDZj5QyAHFYxA3QUP6+KhcP3pfhsle409/i/zD3NMvwwKuZBrSHNlrQk8EAO8eh1IRJW+xhSSCZshWzll+9Fyae3AoODOYXJPv5Nir9emT8szKkNfTdWvi+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAC9Q/oi; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAC9Q/oi"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5e5ab03afso1027365e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787940538; cv=none;
        d=google.com; s=arc-20260327;
        b=iz89BD3qVEUo2uBJN/lRwwxtx2Ykr46caaq6oTBEjpNxPGpPBUn2V3j6ltnaUV96Cf
         GkRhosgTOrisy7ownbeF48246MWjRrrP6LtPS7XEmCH0rr4Psze9vq1NITXq7eu3sEJu
         Xw9Jps2XYkMYIgvJY6RgYSipfl08lj9RCxKbG7mx9cvtXXQOqtwsY0btfnfiYfcOr6Yi
         OnFddDUEaheOZAtT1J8XLfWskts3CnemmymkT8zBruy17sW4FEKKdqpo4rTucQdI5Fvj
         rksn+5GL9/zSVsBK0zYBe5aIzDTebMGw4nxNmkVEdlbIMU/n50gBhyanvLkORIirkjDt
         Udrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rJWiSPB+m+cMyk/wRO/QL6lC+/taHEi+2xQjbJBmxR8=;
        fh=vWDUYZ4T7P4+8XJQMlQASWGWXslEFsKRj2u2QX3QDzM=;
        b=Wuwp3wepAQOTdaWY+4N+CPoICsgpC79WB6XB+okYw0DXjPAojqb1xW0+pCaQ4iScgm
         IEHbuo7XZ8HWcbEfOVVXsWZluyWqQV9i8gHO37J2IMqOmNYmdJjfNqADN6eHGs3wTdYT
         cnmcU8+fO4BDcK6JOGPAvseG8KM0zLbQFGFU9u+bqo5QYd8KeNZsORMLPcGenqYjJ5iO
         sMFdWLYq+ZNU9rEPtZXDA0l7vAXEOh/4LKcnPgHKW2fBIIGKZ+ullhkHZljBg8wOTRHS
         9Lz5rwIz09qLr/6JGYZUWkN7zQcT0PA9WuD0PQxpBJS8k4lcQBF2DLzyUzoI2RgRiIe6
         oXsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787940538; x=1788545338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJWiSPB+m+cMyk/wRO/QL6lC+/taHEi+2xQjbJBmxR8=;
        b=ZAC9Q/oih6O4Dwmr555d24IQ9XeSOL+S3tGyUqnAjrydevKYzVjjdKmhh0nD0kp/K7
         cMexGKMcR3OV+a9VSUqDOuko5anCUDi+MM41QgMBDo13uRFN15MdZ0X+wyuBBMj6/itt
         GILM4KEvAzsBIgMpyKVM0O6nmz2sHWcKLHSccLmcIV4ojHWjbL4yfb1Lw1vYtMuqZOrP
         E/2YrosOFSqztD7Bt9G/Qf/mg2PME/EvJK2t54wYyZdIggDOr7q5/a4/zhGPPJYYpKqi
         jRaMwzX7RL2LSkZ3zVE+zbGdxNfrChjSYHLWawXT7q2eWNYrxWyobLAq/gRcesN0og/m
         tDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940538; x=1788545338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJWiSPB+m+cMyk/wRO/QL6lC+/taHEi+2xQjbJBmxR8=;
        b=sKjcrbhOyrO+4AmGM+ZVEJxgk8+1kqowKuGBc2w2R/4f1guM192iE9QHytBbQIvqIZ
         ZCoY/+zzLBwCDGCjZ/7lH6pLT8EuSKnC2ayLfj4OVLKUN3yTvy+rV6w1GA2gMi/hWWKA
         Qz9a8IZFHVw7yz2X8N59mtcCclGwZ5e+t9TbeNVqufKP9yr6Wxd4JqDtOLvkcKM8pmFV
         pb1QcpjGbyPNdgrEF4nGTgV5SFznZVAoqL9ck6WeAYt6xRbd7pYv/OrdJcIeVBRbleIA
         aHqyfifXUU7R/iQbhQFdgDJ6o8NbmTG6MJe16aj+aRQkUPqNruudcUNSvVC3EDK4Y/1I
         y/bg==
X-Forwarded-Encrypted: i=1; AHgh+RoeVOYV/+D6ys/Ah1WwfPD+bDIz7yBMjzYz+IvbMgb7eR2V1tuiG6z1efKfglNSJrS9X0YH6LHgr6BI+60=@vger.kernel.org
X-Gm-Message-State: AFuF++mNzmmWGFV7z8xDDad4PSWRtg5IGFRcHJ+82w8YvM9Bcn8Q+zum
	soiDPgi2sKTGC8450MUbHmuNsYIB0i8huBm8vrR7ix4mscD18ldVjAWUvIIvaDSRlX/u2c0ucFg
	4cpbXGnezyALewJNSKrEjrJXEfcg2doY=
X-Gm-Gg: AR+sD12j7yILy5a1kyW++uu0nxeP2MH32ToNfSOjpQsJVusO0L8ljY9/uI9G9nDWkah
	OY6lpAfXck9FpgQaEBOJiNfddRJu3vVZuSmRKbiaj7zyVYC9MzULZo5okyZavmGmpBhI+BbNSAR
	sDiWC9IoeU5jwqRpj0PVCKBlV4AYn4lTsGvBaEhDgluLLlpDt1H/G/QuNf+HzxklwCRpdnTms6Q
	NDPCWjKUzxbCBRnsQ/5TH4UNtgCdvcPmOMdXwL1Tbtu6cBgw/iicvqXdGSEB+8wMsQhPB/7mt7W
	37BbEHxd+KT3NCNWM2vZb2v33LBXo8DRpQzzo9V0Lu8ia4czHppQWfiNKQbBQ4yrTy0GiGeNFTt
	xLVk0gjPQrF/yVjJY4/kdHRmn9GWkeuAyLg==
X-Received: by 2002:a05:6512:15a5:b0:5ad:58c8:5de8 with SMTP id
 2adb3069b0e04-5b5e68b1a24mr2612127e87.1.1787940537981; Fri, 28 Aug 2026
 11:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828141240.2391915-1-qiwenjie@xiaomi.com> <20260828141240.2391915-2-qiwenjie@xiaomi.com>
In-Reply-To: <20260828141240.2391915-2-qiwenjie@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 28 Aug 2026 11:08:44 -0700
X-Gm-Features: AcwNN1WbGVBoKLqV-ihD_BlHKcdZ1wsGv3r08oGB56QUCYkUdiEkmhuobuWAWvo
Message-ID: <CACOAw_x47vsdmPnYD1seCRjXMktocfcbAjPk7RMQEoPPJHLNiA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: refresh pinned allocation boundary
 after resize
To: Wenjie Qi <qwjhust@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com, 
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	qiwenjie@xiaomi.com, sunqiuyang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:19=E2=80=AFAM Wenjie Qi <qwjhust@gmail.com> wrote=
:
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
> the unsigned subtraction wrap. Reject such a shrink with -EINVAL
> before taking resize locks or changing filesystem geometry.
>
> Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinn=
ed allocation")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
>  fs/f2fs/gc.c      |  7 +++++++
>  fs/f2fs/segment.h | 16 ++++++++++++++++
>  fs/f2fs/super.c   | 15 ++-------------
>  3 files changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 0a00180c21dc..978e85578c79 100644
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
> @@ -2398,6 +2399,12 @@ int f2fs_resize_fs(struct file *filp, __u64 block_=
count)
>
>         shrunk_blocks =3D old_block_count - block_count;
>         secs =3D div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> +       if (secs >=3D MAIN_SECS(sbi) ||
> +           F2FS_OPTION(sbi).resizable_tail_secno >=3D
> +           MAIN_SECS(sbi) - secs) {
> +               err =3D -EINVAL;
> +               goto out_drop_write;
> +       }

Hi Wenjie,

The condition can be simplified to avoid unsigned subtraction underflow:

if (MAIN_SECS(sbi) <=3D secs + F2FS_OPTION(sbi).resizable_tail_secno)

Plus,
1. Could you print out some message here for users to recognize the
failure reason?
2. Can we move this check earlier, before mnt_want_write_file(filp)?
That way we can return -EINVAL immediately on invalid parameters without
the unnecessary mnt_want_write_file() / mnt_drop_write_file() cycle.

>
>         /* stop other GC */
>         if (!f2fs_down_write_trylock_trace(&sbi->gc_lock, &glc)) {
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 5949aa5200ac..7c7ca0730d77 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -91,6 +91,22 @@ static inline void sanity_check_seg_type(struct f2fs_s=
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
> +               sbi->pinned_area_max_secno =3D
> +                       min(sbi->pinned_area_max_secno,
> +                           GET_SEC_FROM_SEG(sbi,
> +                                            sbi->first_seq_zone_segno));
> +       if (F2FS_OPTION(sbi).resizable_tail_secno)
> +               sbi->pinned_area_max_secno =3D
> +                       min(sbi->pinned_area_max_secno,
> +                           MAIN_SECS(sbi) -
> +                           F2FS_OPTION(sbi).resizable_tail_secno);
> +}
> +

In f2fs_adjust_pinned_area_boundary(), the line breaks around min()
seem a bit excessive. Can we format it more concisely like the original ver=
sion?

Thanks,

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
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
