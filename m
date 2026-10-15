Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EA853C3CC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079395; cv=pass; b=Pq2Qng1M9MWRBIG1S59rWLRLxDrr6gIHJHcn9gLUBWMywpG/WuHki7YIRMwr+e2bad259HW7Kc7+fGgMfDrH1TmoOY7E6qGMvf1zeZvNmG9HPdiFMMXDerJ9i39+TxP6rLt5o0iyiAWuuH9HbMb9KtxTEV1h7WfRw4lW06wksUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079395; c=relaxed/simple;
	bh=R1mYwX3yRkvDLzWYsC4r/yr2yIVVfIoanYUcIYYcjzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfBe3+UtD6tSGYHeDkKzKllAW5xIvjclKcjz+pdHRSCNJDQzP93tGcNvJnzcixcxqvPNdifiyxo9adAlo2q2xvgD31zuEqau49/y1UlWH0mcqpqYcYQ4P9B/JN+LNt37af1hunfOYT8L3NNVg8ViQEbQWWqoC5ul71lDAQCBOvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzBXHsfD; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzBXHsfD"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so3868734e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792079380; cv=none;
        d=google.com; s=arc-20260327;
        b=egYHnZoOxsPY6r8PxsUn89QCdk+xbBRfQvacig6RDqTfB4dBsrLf8lchyQy9S5gwf8
         S9mS0kHlQkjWhiJidODvUJvJ85R3XQbGDZ3j6tvY7etcWSZ049GcDagEA8UgzzyC0uZY
         QCJ4E3AmVH6FaC+HxwadFcylif8ff8TeTQ5X62pZQHlCI5F5ROnFUkXbaXOvuYJ3kA2u
         cyop+evVCHK87UZPMKRTf/YJzRdMF6kK4LqrBoISU20VeQ7O0xKMBCqSPHqtTvcBfIO7
         oiYwiO/ki54L3+dBOOq5T6Rod5YpwmzYphmbbt8WNUW0KJZAnN8OyDeQNSyqWHehEMVm
         teiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dlFmbbSkYOSwwkrWf1csOPu5k7fva5x/XQQTAYQQ+4w=;
        fh=CDxMcNPojesyTMB2KCHHXqCJM/USU/h+Tb+jAu09628=;
        b=LKUZjGOVbvrfhT3eG3NhV2uI+3LzkDt7X7O6WUWbxKFQRN/xv0gtITNoCJHrFP5XBy
         5Y+w8QgD9yofLQdsMGyVN6Qn5kVDUYElajAlOhQqKh3BM2co9Q75uIm7k0B2nVc23hEN
         VbByh1CSbSFows0IFARZJ3BFR8K2EdVd++Dcs0MrCyERTW4FXXNa+i1l2CbOzBG+N1b+
         f0S2q4gp1dYbo2U3VroVGb1DH10OKzk1irnsc0lLOAP/VXSXQGtWrYHZv8E+feGVZPBL
         UVxIVwOQk3rWROrT6VzqJ3d+8srH2c9jMCGijtRwoWpph9i73pRYoRpuZqFrfRtwk2bc
         no+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792079380; x=1792684180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dlFmbbSkYOSwwkrWf1csOPu5k7fva5x/XQQTAYQQ+4w=;
        b=WzBXHsfD0AHvZ1SWNPVkN6jXHHuxkOZR9voFgohzjbiXTNCQK2Vmr6HCCJaDkYU/NF
         SwbKMFi5QWRHOGXlunnCsLx9OlxZ1I9IHaQkLnwDGh/hWtOUFr+jMgujyj4/1cBEvdh3
         JlwEa9qIgAYqUX7iWJj+KSbCXGI1fJ98uNXWv1U93FSa+UtaokvYTvox7evigPpcqny5
         vt/VOZWPGf3fp0wlgVu4Jwe4FolU4ioyqrn1cXZaXcTL+oN23xXnhcTn1UClRcmrC5r4
         y9olkHMFCurtrEkcPyUKV7wBp3haqUumzqHasUWwWeooBB93lPgxf1MUGfKB8gIVrAX5
         LSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079380; x=1792684180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlFmbbSkYOSwwkrWf1csOPu5k7fva5x/XQQTAYQQ+4w=;
        b=YX45hNZ52h5Gp/iebamx7trV7XD4b37V2yVGUeqRi6XsxcPeTtZj/ByGC1ku8rlL2I
         O0/371GJjLvRBTxtY3VJBmQYYNnn0LdmbjrjAwnrTSRSD2ZNHsXKmUaRXqsJcbj7CGMQ
         2cnLfGxlNCbRYkarH9RE1CRdHm6wXsS8lB8c07prQ0UkEosGGbaDY+M/4DeUMc7G9qHz
         PvGS6vFzbxT7Ry8gYuMpzwUf8E8m6spSI/rdBWJn0eL88Fle5ND0AxwcJ9MVfu0pifui
         37iHm/KhMqB4EOsK+0mTOfSz3mc4CDZ0d+rPq+jY5kkmmalKs2+s4dEcHMgx7Bgh0xaA
         Rl4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwalTDJeBtxn22ujJ8x17lbE1PA1Wyi2xMZ82jsmRZxunYrW58hHw0p5SpSoglfBzgt2xhfXe58xR1ugM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLivCtE3Z51ZIZ67cPPgv7u1Bbg/wHD4wJKvpGg1Bw0Do1Z/VdX
	PzxvRFxTMo/Ekir2ZK0YmEalnVZJOcbkU/J4Q3MZlfAyAvI1ygvI+Lyr9kk8U0vf0Z2xng9wEtF
	EU/pVcQDyskK/zASaCwspHpUPEFBrwuw=
X-Gm-Gg: AYBFou0aA2Ar5jePa4CefuyzkEMHaO0T/N5EvvFVP2eTIigcam5Zasr0f+i3/gLNCAF
	H3IeCS1gSntuWNjBpib7cEO/POs18qFl1xSzLUriGwiXIFb3pfCTQNGeZjyDX3m8B5BuDLzvW2n
	XQny3406uu7uS86mQeHAOCsaFJSyP6F26mP7xwq4VyVFJi1gw2WlwNcORCZPLmQ0KUyaxQ9NnTr
	3vkqU96Ym1Ws2nSlQJ7igh159jQZQMdDnbVQX/QSHEUUEMxwb6CvZJMopep42lkpzW002ArGTCa
	A97QQFouY1sWSUl4nb4zN9r6Cfm43v/vg03CHIl3NqTxZ+ZUUvCLANQdJhdOy5qDM0RD1u59/+6
	KXs4L6K7jDd1vh1pLkjGdh1X7MONUb0WqyqUZEb2dMA==
X-Received: by 2002:a05:6512:3b24:b0:5bb:7c09:d15e with SMTP id
 2adb3069b0e04-5bcde6c9b6amr7718643e87.34.1792079379478; Thu, 15 Oct 2026
 08:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792050467.git.qiwenjie@xiaomi.com> <eaed01c69f5af16df36a6df9be3f6615e4818d29.1792050467.git.qiwenjie@xiaomi.com>
In-Reply-To: <eaed01c69f5af16df36a6df9be3f6615e4818d29.1792050467.git.qiwenjie@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 15 Oct 2026 08:49:24 -0700
X-Gm-Features: AclHuK-PTTNkxPHCWQFd1oV1FoNaiW6ZIk2ttr8zr3Gv_UTMVbeUtseLk_NlQZM
Message-ID: <CACOAw_yFv9ht_Hbg5a3hdx0+-=L7YXqzx8NhddbZ0Vjj2tNJLw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] f2fs: refresh pinned allocation boundary after resize
To: Wenjie Qi <qwjhust@gmail.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	Daeho Jeong <daehojeong@google.com>, Qiuyang Sun <sunqiuyang@huawei.com>, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	qiwenjie@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:35=E2=80=AFAM Wenjie Qi <qwjhust@gmail.com> wrote=
:
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
> Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinn=
ed allocation")
> Suggested-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
> Changes since v2:
> - Consume the tail reservation instead of keeping its old size.
> - Restore the saved tail before geometry and boundary rollback.
> - Document the remaining-reservation semantics.
>
>  Documentation/filesystems/f2fs.rst |  3 ++-
>  fs/f2fs/gc.c                       |  6 +++++-
>  fs/f2fs/segment.h                  | 11 +++++++++++
>  fs/f2fs/super.c                    | 15 ++-------------
>  4 files changed, 20 insertions(+), 15 deletions(-)
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

One minor thing, not introduced by this patch:

free_segment_range() temporarily reduces MAIN_SECS() and relocates
cursegs including CURSEG_COLD_DATA_PINNED, but get_new_segment() still
uses the old pinned_area_max_secno as the upper bound for pinning. So,
when shrinking beyond the reserved tail (or with no tail), the pinned
curseg can be re-allocated inside the range being removed.

e.g. MAIN_SECS =3D 1000, resizable_tail_secno =3D 0, shrinking by 100:
MAIN_SECS is temporarily 900, but pinned_area_max_secno is still 1000.

Before c966d29e01bb, MAIN_SECS() was used as the bound, so it was safe.
Could you bound it by MAIN_SECS() in get_new_segment()?

if (pinning) {
- max_secno =3D sbi->pinned_area_max_secno;
+ max_secno =3D min(sbi->pinned_area_max_secno, MAIN_SECS(sbi));
hint =3D 0;

Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify
pinned allocation")

Thanks,
