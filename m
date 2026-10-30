Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793395305;
	b=5XjZJWX4bvtLdbMgK3AqUnZjcujaAAfMT30szXba2tG3FiT2K8t+0Qnf7P2wEJ2Udxxg
	 0zjDZTDEOW4yk24IpWTzDlEPOch3Gm3CoGDd7ERRPqpNknEMOR4/aTDzPPqfHMjLMTk8P
	 RuLaD7uE7ovl/vu8rwO8Ru+gxHWZsSiNPIdFzMu/Fuew1d2Bv0Ufjt84pRgbjM9O0TD2j
	 2x0yWj/sMp42rn/Il4TEcbiyd3gy8KyK0dFMvvoFV7Br+JCntU9i8yjJBXxehbc2srxcm
	 dk40E1L42dIiO0eh4up8/T9/EbB0I+OYljv1bau9yOcTL2aTRedtzHFWf0Z3GFXWg2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=h/uLCgfJCB/vTxqIrnartH+bYB9n7PIJ+8qkafTO8Pk=;
	b=GMR7N1EZyyduumUUQrbBuNy3HFd1B6mtulN36YVk2YzcmJto7ifFk7fnlUxcxRLwlzjv
	 G54kQ5/cvoK7E0Ysv6GscqKsG6f4c51HUOA6E2Hi5ftApceRJxTT1Jx4Jo/gY0LwSfEzc
	 51HPWzPXJn8rvTuO/71Xtp5cKvRCZ30C4VDAXzn+vkMdcE4+cBTNBP2nm3JIUpDL2n7Fz
	 A7TfxYSgeLObAAT/tJZTO7OqeA/YY2WiJm7GxYBDvXGPBNX/2XWA3cSN/7+ebuUlr3hZp
	 WUxmPhRqOR+mMWtuwUJ9OBfiTxUB+YoTqr7KlCLDVSmEpBHoy5xbPMHomaLdtqiOYkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T+KmU/cA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793A6606E55B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793A6606E55B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+KmU/cA
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06210b29fso562030b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793395305; cv=none;
        d=google.com; s=arc-20260327;
        b=SclOZSpZXaTydWNfBn676SgS8HwVsW0pwu2SOT7Z7UEmo84loUJ07kx0BIIbeXWz1V
         1SqgR0Ee2yFM64WxOOC3MByoSy+P7o4huq41MhbWYwm1Q3pjN2i1C/5HglGMFIBRv1oi
         GJhRwf4eUFwaNbhS7qNgD0Ya3ihupj4c5lB5lzSN0iky5dL+B4jrQzcx5oIPYEQOeWRd
         9hie4Rcb9ktdQjMz0uqbMH34u6jd+yWLzrdJCVUgXTBWApQfV/xESN1JBmR76L3pp594
         ZY5kSTx2ey7zPPIDQJ8BgW1ieRE6bUfx2Ms0AGTbObV5n0DAGFNaIZlK0IsVRuofX3GW
         06Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h/uLCgfJCB/vTxqIrnartH+bYB9n7PIJ+8qkafTO8Pk=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=OgA4C0PH7Xj+R9lOXXmn5YWErKG9/cgcBGnkxSPT7FcmySeLAkUNE+aAeL8HUME/v6
         v0JyMs4KFLeAgBLHxtEejgxe5WOgrd8ViNxd6xCMijiowqbM38sYVxOZfYfKivQktBGB
         sIQ43jcSL4uVp/A4zETA0XUnFNOcJZ0slPWF37BwPBKtfq3PAa9V2oO4pFoV2KvxcMAa
         /VTduVAOifaCGlEetkEY2ijiPBTcJvlsHjdRoAMhVk1YVRJS/4jlylXbH+sNCr0mKTmI
         ZmPzhBK+84dJrdAVnynPoDKr88qONyYUSUC8p43cvCaaNmvsIHEjOhhxo6rMGbEdMwAf
         z1qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793395305; x=1794000105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/uLCgfJCB/vTxqIrnartH+bYB9n7PIJ+8qkafTO8Pk=;
        b=T+KmU/cAPiXjkiLzzQD/6ZOyw6jptEWni1rhueRGV6nkKvmyKAgbnTKDMUyzVzydfJ
         PG4efKkGP5kZxjhK1q9A5g4ZI53rtE3rURCUjVzM5a9ow1TPq4FBJx75Ge0bxFMKwuPN
         BCdvDPoD7sm2TYnr7lepb+GJqNKb3TbpQrOADp6CQEWAsj/prNrC8bZUowrQAkTTAfKX
         GZitjmoYZWHVUzjjzbiB0y8t/GHV0ZHPM3nb9Endfs5FQ2mldR43cW0Ho+P1B1iWgDL6
         xY0xIf7Lu5DCPLE0qNi/icwG/kOnFZhZiN+stu1qCQBqmrbRULyZCFlkNgv4MbFCIHOx
         XlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395305; x=1794000105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/uLCgfJCB/vTxqIrnartH+bYB9n7PIJ+8qkafTO8Pk=;
        b=OV3fnFUNskbl5PRFznHU4qykxvlq+6Texgpb7md6+vMkBBI3jf6oPf3WuyR1C/v08m
         3ZJ0SICpeCepCqVo2Dd6nCmy3PYU7Yf/Ru0Mbf8Y1PgnZbdtXjMTyHzALSw5e2oqKmZT
         WjuqrtGjFQlcYDBRzGlhQvp1TJBqup3Rb695OXw5dIu9FPP+WjPbr5uoO1egLYvh4v4r
         awOrP7IcQiIm6D5F21XoWP24RLCFxKyzQKLzkHRzHT0Id8++xWi35yHtCDQtnAA43WVy
         5HwphQHgXMUV6a7tVhIJqVgjXW59Vt2q9zZ6xzow88o+E8KU62qnXcBB26z+56YQecWS
         jjug==
X-Gm-Message-State: AFq9FYKYqoZRXbUs/GdP7xjXeyyZRbIq6et1wObp2daB63tAQ6C9z/it
	cwkVn99ty3KSDufy/3mg1u48zumR1WXaZ3aXrjvEFbZiXRD6X0RDVDeouUcQyBeyL9ArK+zm1N5
	FVcNbPKoM7fs5wjQAERkpbNZWm2EONNibHBmw
X-Gm-Gg: AYBFou24j9brhgC0QAFnUE7akZWiAf6SYfu0s6QPVz3htGBGtFd5gyeJGXxGTk4Dl27
	6dBNKWXs1BFH54sF5xPJPvR2iLnaNb5WED2LX2T6Irey892a4LntatBw3z9PvX+5026UK7qjH6n
	Tro9EGRWqrQll1W3iaTuu/05gyGY7wQtE4sfSW4bm199i6c6RB+b0ZK7rqUcnL3dCTlqLmEBGC9
	CZQUSlBzl3S09k9nfnDr4Ca9f9hFA713wm/7WywHJGeirAreweu4D/NzF07sEHlisp/f03WBVHT
	DTTyZliYap6wP32AAS1RhKd4gdDg8dVhxNWk8mFrjrc3sUhE+Gz6A4qdwNxi1Dp611Jm+/4JKm0
	REPcAZSVEPtx+RRb8JW2Zvttx6RLkqEgqO/TBMIa3x7OSyxPFOoQmpnWUB5Od71TQAl2Q9y7YYk
	nQa1A1TXUywsltrjbOqG39/7U6VljpUiue/yOe5V0sqr77Zfdr
X-Received: by 2002:a05:6a21:6b8c:b0:3de:5c73:701 with SMTP id
 adf61e73a8af0-3e928a80dfcmr3391582637.5.1793395304690; Fri, 30 Oct 2026
 14:21:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022165526.1539629-1-daeho43@gmail.com> <6fd5d995-776b-4e25-9ea4-e3cc018efda0@kernel.org>
In-Reply-To: <6fd5d995-776b-4e25-9ea4-e3cc018efda0@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 30 Oct 2026 14:21:30 -0700
X-Gm-Features: AclHuK_lDd7uVUpWrifySMZ9irz-yx1g9CjvOiUjAfu2vqf_FmHq-9kgsvoDty0
Message-ID: <CACOAw_xz-P+=pOavuwRzF+GriUG-vti3PZC25bOU9YX_AbsiUw@mail.gmail.com>
Subject: Re: [PATCH v2] f2fs: reserve space to be shrunk during resize_fs
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 5:58=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> Daeho, sorry for the delay.
>
> On 10/23/26 00:55, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > f2fs_resize_fs() drops gc_lock and the cp lock between the free space
> > check and freeze_super(). In that window, others can allocate the free
> > space, so the second check after freeze_super() fails with -ENOSPC.
> > This is easy to hit on a busy filesystem, e.g. at OTA install time.
> >
> > Reserve the space to be shrunk via resize_reserved_blocks once the
> > first check passes, and deduct it in __get_available_block_count() like
> > alias_reserved_blocks. Release it on success or on error.
> >
> > With the reservation, the second check should not fail anymore, so:
> > - allow root reserved blocks, which root may use in the meantime,
> > - recheck DISABLE_CHECKPOINT, which remount may set in the meantime,
> >    since freeze_super() fails only when the fs is still dirty,
> > - keep the check only as a WARN_ON_ONCE() safety net.
> >
> > Also exclude the alias/resize reservations when updating
> > current_reserved_blocks via sysfs, otherwise it can underflow
> > __get_available_block_count().
> >
> > Suggested-by: Chao Yu <chao@kernel.org>
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> > Changes in v2:
> > - Exclude alias/resize reservations from current_reserved_blocks.
> > - Allow root reserved blocks in the second check, with WARN_ON_ONCE().
> > - Recheck DISABLE_CHECKPOINT after freeze_super().
> > ---
> >   fs/f2fs/f2fs.h  | 18 +++++++++++++----
> >   fs/f2fs/gc.c    | 54 ++++++++++++++++++++++++++++++++++++++----------=
-
> >   fs/f2fs/super.c |  1 +
> >   fs/f2fs/sysfs.c | 12 ++++++++++-
> >   4 files changed, 68 insertions(+), 17 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 089a62c054e..6b9e1d0e71c 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1897,6 +1897,7 @@ struct f2fs_sb_info {
> >       block_t reserved_blocks;                /* configurable reserved =
blocks */
> >       block_t current_reserved_blocks;        /* current reserved block=
s */
> >       block_t alias_reserved_blocks;          /* reserved blocks for de=
vice alias */
> > +     block_t resize_reserved_blocks;         /* reserved blocks for re=
size_fs */
> >
> >       /* Additional tracking for no checkpoint mode */
> >       block_t unusable_block_count;           /* # of blocks saved by l=
ast cp */
> > @@ -2666,16 +2667,18 @@ static inline bool __allow_reserved_root(struct=
 f2fs_sb_info *sbi,
> >       return false;
> >   }
> >
> > -static inline unsigned int get_available_block_count(struct f2fs_sb_in=
fo *sbi,
> > -                                             struct inode *inode, bool=
 cap)
> > +static inline unsigned int __get_available_block_count(
> > +                                     struct f2fs_sb_info *sbi,
> > +                                     bool allow_root)
> >   {
> >       block_t avail_user_block_count;
> >
> >       avail_user_block_count =3D sbi->user_block_count -
> >                                       sbi->current_reserved_blocks -
> > -                                     sbi->alias_reserved_blocks;
> > +                                     sbi->alias_reserved_blocks -
> > +                                     sbi->resize_reserved_blocks;
>
> Can you please take a look at comments from sashiko? it seems valid:
>
> https://sashiko.dev/#/patchset/20261022165526.1539629-1-daeho43%40gmail.c=
om
>
> __get_available_block_count() can underflow here: avail in __sbi_store() =
doesn't
> exclude root_reserved_blocks, so once valid_user_blocks() < root_reserved=
_blocks,
> current_reserved_blocks can overlap with root reserved space, and the ung=
uarded
> "avail_user_block_count -=3D root_reserved_blocks" wraps block_t.
>
> e.g.
> user_block_count =3D 1000, root_reserved_blocks =3D 100, valid =3D 30,
> reserved_blocks =3D current_reserved_blocks =3D alias_reserved_blocks =3D=
 0
>
> Thread A                        Thread B (root)
> - f2fs_resize_fs(shrunk_blocks =3D 500)
>   - 500 + 30 <=3D avail(false) =3D 900, ok
>   - resize_reserved_blocks =3D 500
>   - drop gc_lock/cp lock
>                                 - echo 500 > /sys/fs/f2fs/<dev>/reserved_=
blocks
>                                  - 500 <=3D 1000 - 100, ok
>                                  - avail =3D 1000 - 500 =3D 500
>                                  - current_reserved_blocks =3D
>                                    min(500, 500 - 30) =3D 470
>
> Now for a non-root user:
> __get_available_block_count(sbi, false)
>    =3D 1000 - 470 - 0 - 500 =3D 30, then 30 - 100 =3D> 0xFFFFFFBA
>
> Thanks,
>

Hi Chao,

Thanks, it's valid. Actually, the same underflow already exists with
device aliasing: f2fs_ioc_reserve_dev_alias() checks the space with
root reserved blocks allowed, so alias_reserved_blocks can eat into the
root reserved space, e.g. user_block_count =3D 1000, root_reserved =3D 100,
valid =3D 30, reserving an alias of 950 blocks passes the check, and then
1000 - 950 - 100 wraps for non-root users.

Clamping current_reserved_blocks in sysfs by root_reserved_blocks is not
enough either, since dec_valid_{block,node}_count() grows
current_reserved_blocks back up to reserved_blocks without considering
alias/resize reservations.

So, I'll make __get_available_block_count() saturate at 0, like what we
already do for unusable_block_count, as a separate fix for
device aliasing, and rebase this patch on top of it in v3.

WDYT?

Thanks,

> >
> > -     if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, in=
ode, cap))
> > +     if (test_opt(sbi, RESERVE_ROOT) && !allow_root)
> >               avail_user_block_count -=3D F2FS_OPTION(sbi).root_reserve=
d_blocks;
> >
> >       if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> > @@ -2688,6 +2691,13 @@ static inline unsigned int get_available_block_c=
ount(struct f2fs_sb_info *sbi,
> >       return avail_user_block_count;
> >   }
> >
> > +static inline unsigned int get_available_block_count(struct f2fs_sb_in=
fo *sbi,
> > +                                             struct inode *inode, bool=
 cap)
> > +{
> > +     return __get_available_block_count(sbi,
> > +                             __allow_reserved_root(sbi, inode, cap));
> > +}
> > +
> >   static inline void f2fs_i_blocks_write(struct inode *, block_t, bool,=
 bool);
> >   static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
> >                                struct inode *inode, blkcnt_t *count,
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 926e6976bc2..955224f4166 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -2374,6 +2374,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block=
_count)
> >       struct f2fs_lock_context glc;
> >       struct f2fs_lock_context clc;
> >       unsigned int secs;
> > +     bool reserved =3D false;
> >       int err =3D 0;
> >       __u32 rem;
> >
> > @@ -2425,10 +2426,17 @@ int f2fs_resize_fs(struct file *filp, __u64 blo=
ck_count)
> >       f2fs_lock_op(sbi, &lc);
> >
> >       spin_lock(&sbi->stat_lock);
> > -     if (shrunk_blocks + valid_user_blocks(sbi) +
> > -             sbi->current_reserved_blocks + sbi->unusable_block_count =
+
> > -             F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_c=
ount)
> > +     if (shrunk_blocks + valid_user_blocks(sbi) >
> > +                     __get_available_block_count(sbi, false)) {
> >               err =3D -ENOSPC;
> > +     } else {
> > +             /*
> > +              * Reserve the space to be shrunk so that no one, includi=
ng
> > +              * root, can allocate it until the shrink is done.
> > +              */
> > +             sbi->resize_reserved_blocks +=3D shrunk_blocks;
> > +             reserved =3D true;
> > +     }
> >       spin_unlock(&sbi->stat_lock);
> >
> >       if (err)
> > @@ -2442,29 +2450,45 @@ int f2fs_resize_fs(struct file *filp, __u64 blo=
ck_count)
> >   out_drop_write:
> >       mnt_drop_write_file(filp);
> >       if (err)
> > -             return err;
> > +             goto out_release;
> >
> >       err =3D freeze_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> >       if (err)
> > -             return err;
> > +             goto out_release;
> >
> >       if (f2fs_readonly(sbi->sb)) {
> >               err =3D thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> > -             if (err)
> > -                     return err;
> > -             return -EROFS;
> > +             if (!err)
> > +                     err =3D -EROFS;
> > +             goto out_release;
> > +     }
> > +
> > +     /* checkpoint can be disabled by remount before freeze_super() */
> > +     if (test_opt(sbi, DISABLE_CHECKPOINT)) {
> > +             f2fs_err(sbi, "Checkpoint should be enabled.");
> > +             err =3D thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> > +             if (!err)
> > +                     err =3D -EINVAL;
> > +             goto out_release;
> >       }
> >
> >       f2fs_down_write_trace(&sbi->gc_lock, &glc);
> >       f2fs_down_write_trace(&sbi->cp_global_sem, &clc);
> >
> >       spin_lock(&sbi->stat_lock);
> > -     if (shrunk_blocks + valid_user_blocks(sbi) +
> > -             sbi->current_reserved_blocks + sbi->unusable_block_count =
+
> > -             F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_c=
ount)
> > +     /*
> > +      * shrunk_blocks is already accounted in resize_reserved_blocks, =
so
> > +      * this should not fail. Allow root reserved blocks here since ro=
ot
> > +      * may have used them after the first check, regardless of resize=
.
> > +      */
> > +     if (WARN_ON_ONCE(valid_user_blocks(sbi) >
> > +                     __get_available_block_count(sbi, true))) {
> >               err =3D -ENOSPC;
> > -     else
> > +     } else {
> >               sbi->user_block_count -=3D shrunk_blocks;
> > +             sbi->resize_reserved_blocks -=3D shrunk_blocks;
> > +             reserved =3D false;
> > +     }
> >       spin_unlock(&sbi->stat_lock);
> >       if (err)
> >               goto out_err;
> > @@ -2510,5 +2534,11 @@ int f2fs_resize_fs(struct file *filp, __u64 bloc=
k_count)
> >       f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
> >       f2fs_up_write_trace(&sbi->gc_lock, &glc);
> >       thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> > +out_release:
> > +     if (reserved) {
> > +             spin_lock(&sbi->stat_lock);
> > +             sbi->resize_reserved_blocks -=3D shrunk_blocks;
> > +             spin_unlock(&sbi->stat_lock);
> > +     }
> >       return err;
> >   }
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index d683240040f..28e49e8d71e 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -5345,6 +5345,7 @@ static int f2fs_fill_super(struct super_block *sb=
, struct fs_context *fc)
> >       sbi->reserved_blocks =3D 0;
> >       sbi->current_reserved_blocks =3D 0;
> >       sbi->alias_reserved_blocks =3D 0;
> > +     sbi->resize_reserved_blocks =3D 0;
> >       limit_reserve_root(sbi);
> >       adjust_unusable_cap_perc(sbi);
> >
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index 9749da70089..ce70d81eba3 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -594,6 +594,8 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >       }
> >   #endif
> >       if (a->struct_type =3D=3D RESERVED_BLOCKS) {
> > +             block_t avail, valid;
> > +
> >               spin_lock(&sbi->stat_lock);
> >               if (t > (unsigned long)(sbi->user_block_count -
> >                               F2FS_OPTION(sbi).root_reserved_blocks)) {
> > @@ -601,8 +603,16 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >                       return -EINVAL;
> >               }
> >               *ui =3D t;
> > +             /*
> > +              * Exclude the space reserved for device aliasing and res=
ize_fs,
> > +              * otherwise the reserved blocks can overlap with them an=
d
> > +              * __get_available_block_count() can underflow.
> > +              */
> > +             avail =3D sbi->user_block_count - sbi->alias_reserved_blo=
cks -
> > +                                     sbi->resize_reserved_blocks;
> > +             valid =3D valid_user_blocks(sbi);
> >               sbi->current_reserved_blocks =3D min(sbi->reserved_blocks=
,
> > -                             sbi->user_block_count - valid_user_blocks=
(sbi));
> > +                             avail > valid ? avail - valid : 0);
> >               spin_unlock(&sbi->stat_lock);
> >               return count;
> >       }
>
