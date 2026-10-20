Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792513573;
	b=V54lkcHSTKPXMdjS49+Lfb5D3Qncym+NX/tq1U8P9iuZ4Yv67WLd2+EDlK9T7fMZ4ctq
	 3liIV3yMfYzHaR7qjtvclb8jHFEIBqQG+ixEMliu1qLLwgNJkgsmvc6unQsFhfhaueUqI
	 Cn61OkPBAcyDDajO/it8u/LyJRsVGz2U9azeCNHMZImE9zg2ojkvZF26Kn91LLfEvPqfx
	 GiD6xi56GAuYEj8ccmp5Dw1+ywDPpXCPSWoOahIiq6SEr5ZSFIjFFQidfGL0XBwhJanfY
	 l0qMZIT8n6CJp2ADknhNfAeEnqsdJap2jJpFKDy3A4oMN5WjVxuQDAFl7iJ4MmIx5Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=i5VCNFsiActAG/QeC/85RIQAntpDGhNKO2VQiTeZ8TM=;
	b=2Z7nT6Ah3PZq1gs/vz9gCaEI9T5NIui+/t0xi0Nf673/NzPovRUj0Xv+f8TNsPwWDD/z
	 bAOdmnIOJOLNWqH5eLQM0DmT+ANETH+8Z8ph847qqoKWMUrrt2gNYA5sfH7h5Vk4vouUH
	 r3lF6b+yJ7ziGKJQaGQoVdE/D9/Ue+gqpkKKEnfLAcqzxooHQ8kdxkwBQunprUnSRPTT2
	 mnyPo/w9ctuVQKBvSNDq2YGtSiEqMAgZwRCAm6K7SAm+h7RjTsxwLyN7KRuxfZHMYKuRy
	 nz9IrEqI7H32imRkqYQS63Hvcl9hsDWaUvzj89hTNSfmXFIPWxPvCsSmoxpnxim8zRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gOmg+vyv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E76606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E76606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gOmg+vyv
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e96502e447so24731445ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792513572; cv=none;
        d=google.com; s=arc-20260327;
        b=O69FaAecu7trLuBlL4As7qQGV0HXPK1zTRcY8Kv85c2Pxy51FDwaFlmvzjDc66rUJ7
         Hqa3b/g0k6psWN15xP9vmc/kH6V8WrZtxi73YseXAe4yRzhfrnum/zlWx6vLTozYcMot
         5PPVnZckVm8YQ6EIJx/4BL/S6dkHlg7RnURrbxiKQy0aPSHbLj4kmnFIe4gLNNuGqq0L
         ZPDEvWP4s0XFEzg5p1vgj6ipszN6+X0w48rPQtOc2rfDnXCuqvSopn+Yogz/elGHJPoq
         PH9eMDMiv+BkX9HzXhnQ81nWQy7xIn/511UZHAqF2UlJPlDzWJIbMkhIOHj+PYxI1bA3
         JVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i5VCNFsiActAG/QeC/85RIQAntpDGhNKO2VQiTeZ8TM=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=K+6plclFNvZC1ykUEpFxjTCaJRic0m77GWtHv0xacRF0KInV6AGUQubfk58wwBGVnS
         pTtG1EqhK12z/d51ptZY/rcd0xAnDrdz8Hk718Jk63m1zAOWj1AWh/1VAd6gbOaWD/VX
         KXWHzyzsqvdtM7vI0izo3ya7CbWby8euOFJ7LUAKhM+GkQE6kB2ZrOUwC7BjimyJgndA
         H+fExzveimGoOm/K/aCnMdK6shjmrSDPXy4SXBgxELK4HEU8+VoOodG+MMRurYddFZVf
         5o1qEE954YHJSZdo+SqS1X7V7o6s20JmwxBEErc8M3HPhpSLnYFSxe3y9NWkAvlj0Ju9
         muEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792513572; x=1793118372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i5VCNFsiActAG/QeC/85RIQAntpDGhNKO2VQiTeZ8TM=;
        b=gOmg+vyvmWIMuS2hx5IRLchijNNSzBjjz0B7TdGImrb8nIvBP1nkZ1u0WBGOTBjq7R
         9+OzKmyI4ka0TZWG4hnYwBR9eQGpOp5s2UlzMfjaQpXodbm22d173/XNhqRJY0cVrtJ+
         tUOEFOwHSVzTocD35ojctfo6ve6fPH+mCuWbofsfGxdUVlrRTXhGkfxny49Q8CWxrkDk
         MVsdVhT+vlyoze5JgDgPVHtAlDTi3KlEe9pvyDhJVrbLUfUKOJVP1CmgVkSVT9090lf4
         GqzRzoIT2W92ENV/8HW7PRSq0nDIbldt0KEAk8ciIv4GQbfPpsINQR3mI7LP6Hh69SXF
         QaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513572; x=1793118372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5VCNFsiActAG/QeC/85RIQAntpDGhNKO2VQiTeZ8TM=;
        b=S4cKak/la2FynUtJFYmQqQz0ASGX+mMfaJUdlGSyq/3p9m+vOro4n5G7OSln3lbBgZ
         NMv3MHpTAawZRxlOdBFMkazpEwsfluXJN8+LOvjlqlAAZM1xUt5nH+Q05XaaOFdLrhH1
         8kmmHjwYaCxOQef/mN5ofcAvWQ1tmuL/dQO+VHERaoy+p7Z6o6xqB6TpncykUillNxp+
         rMQ4O6jq0egj1eSMhXIvfVonz73t9v8CqL0oO0ni66uRQPSUBaONFWlTLc17s6wvwUB0
         NTdu4SWJKh1E5fBhsSX4teDJ/JNE+gB0AB4548nTUs/mcsXs5qrqOM7ZAnEJWYvlKGyD
         bB5Q==
X-Gm-Message-State: AFq9FYLVNXLWdGdjnOsW6W52ZMN/891dc5M4uKtO7kdEtuUNK1NksTFK
	GXI/PyFJQBmoFwNa54UxFzYxim6l90+X7G9vtGWHi7b0qBe8bFjNY2etEiM4xJ53nPveq4se0WO
	h97jaZjGIrNQ4jrd15xFZrrHgYJhobXI=
X-Gm-Gg: AYBFou2Ld+Q+lzi0GY+pPAL9lEdDtOpSNgQsXnUnCXHWi4cpa1C7lfdMac2lvzIMbQ5
	v9E36v3sg7r6d9bF7AwMRKLBgQmS+69yf+TIIihykbw+qUm9k/dY/4p/FgV5B712BhgNvTMVbyT
	m4AfAI/GtYRIq7vpO9/sysfpO7ldcWBkukOp5FIUABtNn5yoRD5dOtrEe/6zoUlEJ55VwoWVHw3
	40V9Brcw4vclUsXLflLmIUi8F6D8PX8PrsM+5driD6np1+DP7IQbncAn6bRM67Rl0ed4dkaNwGq
	yaqOlMZVLDlkdOnKwQsb2VKsqONJf9FR49ENzQDp6nMWblUCEPJx+0LzbPtXr9vhZkQBmbSZIIj
	yfqQMtUqpCUZWu+6QENCZM53cfqDMRWxMTeCLawhhKw==
X-Received: by 2002:a17:902:cf41:b0:2e3:980:dfd6 with SMTP id
 d9443c01a7336-2e9a6f52a36mr96789475ad.38.1792513572330; Tue, 20 Oct 2026
 09:26:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014030646.662661-1-daeho43@gmail.com> <145faed4-947f-4f09-96af-c0bea87dd1db@kernel.org>
In-Reply-To: <145faed4-947f-4f09-96af-c0bea87dd1db@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 20 Oct 2026 09:25:57 -0700
X-Gm-Features: AclHuK-ASa1KcgVYjmw7SCIz_2ydoB8IjCtGwj_sZs7cG4Z5j4Fo-SXQU-qetAE
Message-ID: <CACOAw_zidP9MX_K0fJU8_A_XQ6sYBRbmeug9vc9i4pjhPO1eoA@mail.gmail.com>
Subject: Re: [PATCH] f2fs: reserve space to be shrunk during resize_fs
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:10=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 10/14/26 11:06, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > f2fs_resize_fs() checks whether there is enough free space for the
> > shrink, runs a dry-run GC to migrate blocks out of the target range,
> > and then drops gc_lock and the cp lock before freeze_super(). During
> > that window, other processes, including root ones that are allowed to
> > use root reserved blocks, can still allocate the free space, so the
> > second check after freeze_super() fails with -ENOSPC even though the
> > first check passed. This is easy to hit when the shrink is triggered
> > on a live, busy filesystem, e.g. by an updater at OTA install time.
> >
> > Fix this by reserving the space to be shrunk once the first check
> > passes. Add resize_reserved_blocks and deduct it in
> > __get_available_block_count() for all callers, like
> > alias_reserved_blocks, so that no one can allocate the reserved space
> > until the shrink is done. The reservation is released together with
> > the user_block_count update on success, or on any error.
> >
> > Also factor out __get_available_block_count() and use it in
> > f2fs_resize_fs() to share the available block calculation, which takes
> > alias_reserved_blocks into account as well.
> >
> > Suggested-by: Chao Yu <chao@kernel.org>
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/f2fs.h  | 18 ++++++++++++++----
> >  fs/f2fs/gc.c    | 41 +++++++++++++++++++++++++++++------------
> >  fs/f2fs/super.c |  1 +
> >  3 files changed, 44 insertions(+), 16 deletions(-)
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
> >  }
> >
> > -static inline unsigned int get_available_block_count(struct f2fs_sb_in=
fo *sbi,
> > -                                             struct inode *inode, bool=
 cap)
> > +static inline unsigned int __get_available_block_count(
> > +                                     struct f2fs_sb_info *sbi,
> > +                                     bool allow_root)
> >  {
> >       block_t avail_user_block_count;
> >
> >       avail_user_block_count =3D sbi->user_block_count -
> >                                       sbi->current_reserved_blocks -
> > -                                     sbi->alias_reserved_blocks;
> > +                                     sbi->alias_reserved_blocks -
> > +                                     sbi->resize_reserved_blocks;
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
> >  }
> >
> > +static inline unsigned int get_available_block_count(struct f2fs_sb_in=
fo *sbi,
> > +                                             struct inode *inode, bool=
 cap)
> > +{
> > +     return __get_available_block_count(sbi,
> > +                             __allow_reserved_root(sbi, inode, cap));
> > +}
>
> Do we need to use this to cover current_reserved_blocks update? because
> reserved_blocks sysfs bypasses the reservation.
>
>         if (a->struct_type =3D=3D RESERVED_BLOCKS) {
>                 spin_lock(&sbi->stat_lock);
>                 if (t > (unsigned long)(sbi->user_block_count -
>                                 F2FS_OPTION(sbi).root_reserved_blocks)) {
>                         spin_unlock(&sbi->stat_lock);
>                         return -EINVAL;
>                 }
>                 *ui =3D t;
>                 sbi->current_reserved_blocks =3D min(sbi->reserved_blocks=
,
>                                 sbi->user_block_count - valid_user_blocks=
(sbi));
>                 spin_unlock(&sbi->stat_lock);
>                 return count;
>         }
>

Hi Chao,

Good catch. I will cap it by the space excluding alias/resize
reservations in v2, like:

block_t avail =3D sbi->user_block_count -
    sbi->alias_reserved_blocks -
    sbi->resize_reserved_blocks;
block_t valid =3D valid_user_blocks(sbi);

sbi->current_reserved_blocks =3D min(sbi->reserved_blocks,
    avail > valid ? avail - valid : 0);

> > +
> >  static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, =
bool);
> >  static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
> >                                struct inode *inode, blkcnt_t *count,
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 926e6976bc2..5bfdaeae794 100644
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
> > @@ -2442,29 +2450,32 @@ int f2fs_resize_fs(struct file *filp, __u64 blo=
ck_count)
> >  out_drop_write:
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
> > +     /* shrunk_blocks is already accounted in resize_reserved_blocks *=
/
> > +     if (valid_user_blocks(sbi) >
> > +                     __get_available_block_count(sbi, false)) {
> >               err =3D -ENOSPC;
>
> Since we already have reserved blocks in resize_reserved_blocks, we shoul=
d
> not expect there will be ENOSPC case here, right?
>
> Thanks,

Right. While checking it, I found two more cases that could still fail
the second check, and fixed them in v2 as well:

- Root can legitimately use root reserved blocks between the two
checks, which is not related to the shrink. So, I allowed root
reserved blocks in the second check.
- Checkpoint can be disabled by remount before freeze_super(), which
deducts unusable blocks from the available blocks. Resize requires
checkpoint anyway, so I added a recheck of DISABLE_CHECKPOINT after
freeze_super().

With these, the second check should not fail. I kept it with
WARN_ON_ONCE() as a safety net, to avoid committing the shrink with
broken block accounting if it ever happens.

+ /* checkpoint can be disabled by remount before freeze_super() */
+ if (test_opt(sbi, DISABLE_CHECKPOINT)) {
+     f2fs_err(sbi, "Checkpoint should be enabled.");
+     err =3D thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
+     if (!err)
+         err =3D -EINVAL;
+     goto out_release;
+ }
...
- if (valid_user_blocks(sbi) >
-     __get_available_block_count(sbi, false)) {
+ if (WARN_ON_ONCE(valid_user_blocks(sbi) >
+     __get_available_block_count(sbi, true))) {
     err =3D -ENOSPC;

Thanks,

>
> > -     else
> > +     } else {
> >               sbi->user_block_count -=3D shrunk_blocks;
> > +             sbi->resize_reserved_blocks -=3D shrunk_blocks;
> > +             reserved =3D false;
> > +     }
> >       spin_unlock(&sbi->stat_lock);
> >       if (err)
> >               goto out_err;
> > @@ -2510,5 +2521,11 @@ int f2fs_resize_fs(struct file *filp, __u64 bloc=
k_count)>      f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
> >       f2fs_up_write_trace(&sbi->gc_lock, &glc);
> >       thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> > +out_release:
> > +     if (reserved) {
> > +             spin_lock(&sbi->stat_lock);
> > +             sbi->resize_reserved_blocks -=3D shrunk_blocks;
> > +             spin_unlock(&sbi->stat_lock);
> > +     }
> >       return err;
> >  }
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
>
