Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59A364926
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857745; cv=pass; b=eJrbAt4/v8R6J4pggdwMmkC7D8+QhEBmccJyhfboB82cGyajVpOnEPeyiG8rfciVI+VikNnJ1+GeH0FqJ70FooDUNNOuudLLbcyXCzGsEtxJkQ+H0DwG/V8kijozTiiNx1OeE7kI/O0h0NUqcDAN7vWzwiLhxgbW40zIzU8C+Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857745; c=relaxed/simple;
	bh=Ot+xgoRfHCJ/031A7h7pT8g1sSWjLvFEByYfHLbtPYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLGFkvCz/M8rqwfhcaMcFL+Xr/ije280wmunFsMsCqHm0XWtzUNjQ3PlGr7/7ma8E6sc26gV70B/S3jbi7ggT1zpKds/JX6kr0neeZHEjstyZM/7raNfmUHJZSBN+H6nMD+XZO+lpQ2+0YnNSPnrStvJW0ZzOiwGKC9qUUR3pv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCNDhqBn; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCNDhqBn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a8af3a704fso1131951a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791857742; cv=none;
        d=google.com; s=arc-20260327;
        b=lcwHEqAOjxM1usTFLPOa816dJpK6uD32c2t1GkaDYKFVmdC+zwXzwXboqb+AhMEKJa
         SyQF6eJWYGYpW0MERaFl9U0PA1AoPcP0yvKd1OSowMpWxKvTKveGJM0srAHBzX25gxll
         jrALRei7YJ4s6s51LnWJMiMwbCGADJvDyztjfJ2LSfSAfWpFduwaWWsN+dzTgvsXSxtc
         aNeg7aTW/AtqOicOO1DKFhdsx75WHgPeOwtp97KxdWkhV6iFzexiqfXClkfns/cXmbJ4
         8d9GxubPPKxyVo1PFDKFBuUeP4zMzFADp/ewLAoMysnESMKJWHhMHJZ4Vc13Ah2xAoKH
         5hqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jFAR5rVHkc3ejplhSM2v0o7c4u68uONwHMCaXP/los=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=NU9z0tvzKob/CbgC3rRa06zttxL+yL6IV8pMwWqtB+/fKYwZslCUi0I9mZlUafjgFj
         iBsaBX2nz6gdhr5qtJZuuGa9uYqKfU6tvAbg5oSSr/bc+umv6DFIKCPeeqKfD+s7OQZd
         fODYLawQ5kmnAc9/zJF1S45wZ2Z/RG/22J4DuVt1w4xFZA6H+IXlJUf8UQVQzFrFFFot
         9i+eQ4bbJWQKBBiUOUgQaGrMwn8B8Iyq+s7WF7HZ8MEavtTwYVUk05h0ILD/4fDXfrIX
         w41GPkR7wyQq+t7PAtwzPGxsLhCnl1MJaaK7U80I68TaBO26ghBHJ+u1VL+lRqizWFI2
         FdYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791857742; x=1792462542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jFAR5rVHkc3ejplhSM2v0o7c4u68uONwHMCaXP/los=;
        b=MCNDhqBnkSqrQR7qsB1+gDrBy8NaAYKfPsmXHYuyjrc255Hm86FrSeYvM3lqT4JjGX
         qkAU3CaGSZJ45Tawcn+LSh0Oko1mbUOpi+O6ZEBPsZC4LO4xVZ7xo6tfR9KxjYj/mWaN
         QbhROwP5/gFc3eEVM6dwcz24kpvczyJktEp16FgwHo1Hf00wLHx8wbphtStvtdpIDGtF
         kCfB9rnKpZTjhNjWQet9XbfiFulJ0BRsLtJlg4aSKNZn9TO8jfaNt0P0tJ2qWk1NEpFj
         fqgKfUUB1RgGNJg2aLPSupQEtp4FG4kw9zYOEm1D6S0H2V/rBA0WXqCXfvqOefMhcz7e
         Qh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791857742; x=1792462542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jFAR5rVHkc3ejplhSM2v0o7c4u68uONwHMCaXP/los=;
        b=JUFHHFMNzU+nxHB22WrgYTdmlV1LEaF6xStkSc5LhZzqE4xCmE6mRdVbf8IuSIKahZ
         /oXvJozPgD7gbrSGJ0twpV3QdTFX+6U3LJe93/54ugojj5IAG71FXyCRSKJAhlH97OSo
         JCEwe+kWKopdvJUAMCusTJDv2ivt3YJGp1nSdQB0pIs4lvobf7pzBWTThNGnYGEWo2Un
         qFbLhWT/+m1Qii4Fm84iSXEiJK2ySfWmOzvAJHzDdlQeaRAleyPlEyB2R5YHCU4QGcrD
         7MjM23am3BXy+fNzZrjbPzbL96rD86jNcV5WmzAKXcfWBoB21BXh4okgz33O14/THeia
         Q3iA==
X-Gm-Message-State: AFq9FYJdY2hXUZaIHz4BkT4/gYEpOG9EoQqyCh9p3c8fa5y+200i/bXq
	enkH4mRuvdyNCZWZBW2dzeBy+FxNDfl7uovWBUL6rS2C4HIcF5Fhrvwhyhhs2OwQZriPaASBEQx
	6bWJh8cPBYZ/vQkeBatYJEEnpCjtjNrs=
X-Gm-Gg: AYBFou0IWQPlnMXVCFnDQxQM0fhOQ3FEwQeunG6svjDYKmYn8y/bjLY/BZiPt2IL+sh
	BzSa+k/NjHb+eGs8USn03lV1eWL/XR6gOqAsq01BA+kQCszpnYzbCTgpfw3ewizYrW0pOYRCtnb
	CIAXD/Pb8aHM+2JfyMNCo3Y0Cra6RvR9xOryLa3iQcLqYItsYrjaH6WXQoozRc8/+tnoPdVhLmT
	jKnpn0Tz+kL2U9T5rw0H8y8DJCFQ3C3rYIEJqfVhud3giEd2FTsqIulNRFlburutol6mcBDc8fK
	Xety9A6MTnQEXy8l0MWgcAL8P2JSxtKCFZXxdD6nqpwYhgHMutPJjBNTFTV4bmK+B80v547ykRP
	FDozje2FtCwJFWPPosDDTyiBmS9jMl2fVEKzLXmNYtZc=
X-Received: by 2002:a17:90b:164b:b0:39e:6c69:34da with SMTP id
 98e67ed59e1d1-3ab3a91169cmr9187863a91.62.1791857742227; Mon, 12 Oct 2026
 19:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911143549.909867-1-daeho43@gmail.com> <20260911143549.909867-2-daeho43@gmail.com>
 <3e5f2bd4-f0e6-4f79-b182-6cb8ac331580@kernel.org> <CACOAw_zJGF5GnJoxMWSAH2yXYFKBmo6mXCamdTixyN+pDp+5Hg@mail.gmail.com>
 <ad98fde8-0480-4585-806f-31c65bb623ab@kernel.org>
In-Reply-To: <ad98fde8-0480-4585-806f-31c65bb623ab@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 12 Oct 2026 19:15:28 -0700
X-Gm-Features: AclHuK_mlt8oTkh4Vzibt5LkwQGQUG_3C1kMipNwRm83lZ_tS7sh_vEuu5Gxzf8
Message-ID: <CACOAw_xcio8ermirrAUOAb3AHsYJXtu13t36O3CwMntMtjgzbQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce reserve_shrink mount
 option for filesystem shrinkage
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 6:27=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 9/15/26 00:24, Daeho Jeong wrote:
> > On Mon, Sep 14, 2026 at 12:15=E2=80=AFAM Chao Yu <chao@kernel.org> wrot=
e:
> >>
> >> On 9/11/26 22:35, Daeho Jeong wrote:
> >>> From: Daeho Jeong <daehojeong@google.com>
> >>>
> >>> When preparing for subsequent online filesystem shrinkage (e.g., duri=
ng
> >>> partition resizing or FOTA updates), sufficient free space must be
> >>> preserved so that valid data blocks can be evacuated and the filesyst=
em
> >>> can safely shrink.
> >>>
> >>> Existing reserve_root cannot prevent space exhaustion by privileged r=
oot
> >>> processes (such as OTA updaters, package managers, and system daemons
> >>> running with CAP_SYS_RESOURCE), which can allocate blocks from the ro=
ot
> >>> reserve and lead to resize failures due to lack of space. Moreover,
> >>
> >> I'm thinking about reusing existing mount option AMAP, is there any pr=
oblem
> >> to use "reserve_root=3D" w/ 128mb+shrunk_size_mb when we execute onlin=
e filesyste
> >> shrinkage? once it is done, recover w/ reserve_root=3D128mb.
> >>
> >>> runtime configurable reserved_blocks represents permanent GC and meta=
data
> >>> headroom that must persist after resize, which would cause double-cou=
nting
> >>> if inflated for shrinkage.
> >>
> >> I didn't get it, can you please explain a bit more about this issue?
> >>
> >> Thanks,
> >
> > Hi Chao,
> >
> > There are three main reasons why reserve_root cannot be reused:
> >
> > 1. Double-counting in f2fs_resize_fs():
> > f2fs_resize_fs() checks:
> >    shrunk_blocks + valid_user_blocks + root_reserved_blocks + ... >
> > user_block_count
> > Since root_reserved_blocks must persist after
> > resize, inflating it by shrunk_size causes shrunk_size to be counted tw=
ice,
> > requiring 2x free space and triggering false -ENOSPC. Resetting it righ=
t before
> > resize also introduces a race window where concurrent writes can
> > consume the space.
> > 2. Root can allocate from reserve_root:
> > reserve_root allows root/CAP_SYS_RESOURCE processes to allocate. During=
 OTA,
> > system daemons and updaters can eat into the reserved blocks.
> > reserve_shrink strictly blocks all callers, including root.
>
> Daeho, sorry for the delay.
>
> Thanks for the explanation, I see, it's not appropriate to reuse
> "reserve_root=3D" option for your requirement.
>
> May I ask that do you need to keep the reservation for a long time before=
 resize,
> e.g. from OTA starts till shrink happens? or is it enough to make it rese=
rved
> during f2fs_resize_fs()?
>
> If the latter, can we just reserve shrunk_blocks in f2fs_resize_fs()
> directly, w/ the same way we did for f2fs_ioc_reserve_dev_alias()? Then
> we don't need a new mount option. Something like:
>
> f2fs_resize_fs()
>          spin_lock(&sbi->stat_lock);
>          if (shrunk_blocks + valid_user_blocks(sbi) + ... > sbi->user_blo=
ck_count)
>              err =3D -ENOSPC;
>          else
>              sbi->resize_reserved_blocks +=3D shrunk_blocks;
>          spin_unlock(&sbi->stat_lock);
>
>          free_segment_range(sbi, secs, true);
>          ...
>          freeze_super();
>          ...
>          spin_lock(&sbi->stat_lock);
>          sbi->user_block_count -=3D shrunk_blocks;
>          sbi->resize_reserved_blocks -=3D shrunk_blocks;
>          spin_unlock(&sbi->stat_lock);
>          ...
>          /* error path: sbi->resize_reserved_blocks -=3D shrunk_blocks */
>
> and in get_available_block_count(), deduct resize_reserved_blocks as we d=
id for
> alias_reserved_blocks, so that no one, including root, can allocate from =
the
> reserved space during resize.
>
> Thanks,

Hi Chao,

Thanks for the suggestion.

Unfortunately, reserving only inside f2fs_resize_fs() is not enough for
our use case. We need the reservation to be in place for a long time
before the resize, i.e. from the moment we decide to shrink (mount time)
until F2FS_IOC_RESIZE_FS is actually issued. During that window,
privileged processes (OTA updater, package manager, system daemons) keep
writing to the filesystem. If they consume the free space, the ENOSPC
check at the entry of f2fs_resize_fs() fails right away, so there is no
chance to reserve anything inside the ioctl. Also, statfs would keep
reporting space that is going to be cut off.

That's why it's a mount option: the reservation is applied before any
userspace write can happen, it's honored for all callers including root,
it's reflected in statfs, and it's released automatically once the
shrink succeeds.

Thanks,

>
> >
> > Thanks,
> > Daeho
> >
> >>
> >>>
> >>> To resolve this, introduce a dedicated reserve_shrink=3D<blocks>
> >>> mount option:
> >>> 1. Symmetrically mirrors reserve_root=3D<blocks> in block units to
> >>>      pre-reserve space specifically for subsequent filesystem shrinka=
ge.
> >>> 2. In get_available_block_count(), unconditionally deducts
> >>>      reserve_shrink_blocks for all callers, strictly rejecting all
> >>>      allocations (including root / CAP_SYS_RESOURCE) once available b=
locks
> >>>      are exhausted.
> >>> 3. In f2fs_statfs(), deducts reserve_shrink_blocks from f_bfree (and
> >>>      f_bavail) so that filesystem statistics accurately reflect usabl=
e space.
> >>> 4. In f2fs_resize_fs(), automatically resets reserve_shrink_blocks to=
 0
> >>>      and clears F2FS_MOUNT_RESERVE_SHRINK upon successful shrink comp=
letion,
> >>>      releasing any remaining reservation.
> >>> 5. In sysfs: reserved_blocks, subtracts reserve_shrink_blocks when
> >>>      validating the upper limit of configurable reserved blocks.
> >>>
> >>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> >>> ---
> >>> v2:
> >>>    - Split out mount option bitmask expansion (BIT_ULL) into a separa=
te
> >>>      prerequisite patch (Patch 1/2).
> >>> ---
> >>>    Documentation/filesystems/f2fs.rst |  7 +++++
> >>>    fs/f2fs/f2fs.h                     |  9 ++++++
> >>>    fs/f2fs/gc.c                       |  5 ++++
> >>>    fs/f2fs/super.c                    | 47 ++++++++++++++++++++++++++=
++++
> >>>    fs/f2fs/sysfs.c                    | 13 +++++++--
> >>>    5 files changed, 79 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/files=
ystems/f2fs.rst
> >>> index 771216f45207..dbdc5d5a83ad 100644
> >>> --- a/Documentation/filesystems/f2fs.rst
> >>> +++ b/Documentation/filesystems/f2fs.rst
> >>> @@ -191,6 +191,13 @@ reserve_node=3D%d           Support configuring =
reserved nodes which are used for
> >>>                         gid, the default limit is 12.5% of all nodes.
> >>>    resuid=3D%d            The user ID which may use the reserved bloc=
ks and nodes.
> >>>    resgid=3D%d            The group ID which may use the reserved blo=
cks and nodes.
> >>> +reserve_shrink=3D%d     Support pre-reserving space for subsequent f=
ilesystem
> >>> +                      shrinkage (e.g. during partition resizing or F=
OTA),
> >>> +                      unit: blocks. Unlike reserve_root, allocations=
 from
> >>> +                      this reserved space strictly reject all caller=
s
> >>> +                      (including root / CAP_SYS_RESOURCE). Once the
> >>> +                      filesystem is successfully shrunk via resize, =
this
> >>> +                      value is automatically reset to 0.
> >>>    fault_injection=3D%d   Enable fault injection in all supported typ=
es with
> >>>                         specified injection rate.
> >>>    fault_type=3D%d                Support configuring fault injection=
 type, should be
> >>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >>> index 4aaf29de3f6f..48a91771be95 100644
> >>> --- a/fs/f2fs/f2fs.h
> >>> +++ b/fs/f2fs/f2fs.h
> >>> @@ -145,6 +145,7 @@ enum f2fs_mount_opt {
> >>>         */
> >>>        F2FS_MOUNT_LAZYTIME,
> >>>        F2FS_MOUNT_RESERVE_NODE,
> >>> +     F2FS_MOUNT_RESERVE_SHRINK,
> >>>    };
> >>>
> >>>    #define F2FS_OPTION(sbi)    ((sbi)->mount_opt)
> >>> @@ -226,6 +227,7 @@ struct f2fs_mount_info {
> >>>        unsigned long long opt;
> >>>        block_t root_reserved_blocks;   /* root reserved blocks */
> >>>        block_t root_reserved_nodes;    /* root reserved nodes */
> >>> +     block_t reserve_shrink_blocks;  /* reserve blocks for shrink */
> >>>        kuid_t s_resuid;                /* reserved blocks for uid */
> >>>        kgid_t s_resgid;                /* reserved blocks for gid */
> >>>        int active_logs;                /* # of active logs */
> >>> @@ -2658,6 +2660,13 @@ static inline unsigned int get_available_block=
_count(struct f2fs_sb_info *sbi,
> >>>        if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi,=
 inode, cap))
> >>>                avail_user_block_count -=3D F2FS_OPTION(sbi).root_rese=
rved_blocks;
> >>>
> >>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> >>> +             if (avail_user_block_count > F2FS_OPTION(sbi).reserve_s=
hrink_blocks)
> >>> +                     avail_user_block_count -=3D F2FS_OPTION(sbi).re=
serve_shrink_blocks;
> >>> +             else
> >>> +                     avail_user_block_count =3D 0;
> >>> +     }
> >>> +
> >>>        if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> >>>                if (avail_user_block_count > sbi->unusable_block_count=
)
> >>>                        avail_user_block_count -=3D sbi->unusable_bloc=
k_count;
> >>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >>> index bc22dde1cb30..556c4793478d 100644
> >>> --- a/fs/f2fs/gc.c
> >>> +++ b/fs/f2fs/gc.c
> >>> @@ -2492,6 +2492,11 @@ int f2fs_resize_fs(struct file *filp, __u64 bl=
ock_count)
> >>>                spin_lock(&sbi->stat_lock);
> >>>                sbi->user_block_count +=3D shrunk_blocks;
> >>>                spin_unlock(&sbi->stat_lock);
> >>> +     } else if (test_opt(sbi, RESERVE_SHRINK)) {
> >>> +             spin_lock(&sbi->stat_lock);
> >>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D 0;
> >>> +             clear_opt(sbi, RESERVE_SHRINK);
> >>> +             spin_unlock(&sbi->stat_lock);
> >>>        }
> >>>    out_err:
> >>>        f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
> >>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >>> index a5e109bdcebc..58f33750b2a8 100644
> >>> --- a/fs/f2fs/super.c
> >>> +++ b/fs/f2fs/super.c
> >>> @@ -196,6 +196,7 @@ enum {
> >>>        Opt_data_flush,
> >>>        Opt_reserve_root,
> >>>        Opt_reserve_node,
> >>> +     Opt_reserve_shrink,
> >>>        Opt_resgid,
> >>>        Opt_resuid,
> >>>        Opt_mode,
> >>> @@ -328,6 +329,7 @@ static const struct fs_parameter_spec f2fs_param_=
specs[] =3D {
> >>>        fsparam_flag("data_flush", Opt_data_flush),
> >>>        fsparam_u32("reserve_root", Opt_reserve_root),
> >>>        fsparam_u32("reserve_node", Opt_reserve_node),
> >>> +     fsparam_u32("reserve_shrink", Opt_reserve_shrink),
> >>>        fsparam_gid("resgid", Opt_resgid),
> >>>        fsparam_uid("resuid", Opt_resuid),
> >>>        fsparam_enum("mode", Opt_mode, f2fs_param_mode),
> >>> @@ -407,6 +409,7 @@ static match_table_t f2fs_checkpoint_tokens =3D {
> >>>    #define F2FS_SPEC_lookup_mode                       (1 << 24)
> >>>    #define F2FS_SPEC_reserve_node                      (1 << 25)
> >>>    #define F2FS_SPEC_resizable_tail_secno              (1 << 26)
> >>> +#define F2FS_SPEC_reserve_shrink             (1 << 27)
> >>>
> >>>    struct f2fs_fs_context {
> >>>        struct f2fs_mount_info info;
> >>> @@ -550,6 +553,27 @@ static inline void limit_reserve_root(struct f2f=
s_sb_info *sbi)
> >>>                                           F2FS_OPTION(sbi).s_resgid))=
;
> >>>    }
> >>>
> >>> +static inline void limit_reserve_shrink(struct f2fs_sb_info *sbi)
> >>> +{
> >>> +     block_t block_limit;
> >>> +
> >>> +     if (!test_opt(sbi, RESERVE_SHRINK))
> >>> +             return;
> >>> +
> >>> +     block_limit =3D sbi->user_block_count - sbi->reserved_blocks;
> >>> +     if (test_opt(sbi, RESERVE_ROOT)) {
> >>> +             if (block_limit > F2FS_OPTION(sbi).root_reserved_blocks=
)
> >>> +                     block_limit -=3D F2FS_OPTION(sbi).root_reserved=
_blocks;
> >>> +             else
> >>> +                     block_limit =3D 0;
> >>> +     }
> >>> +     if (F2FS_OPTION(sbi).reserve_shrink_blocks > block_limit) {
> >>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D block_limit;
> >>> +             f2fs_info(sbi, "Reduce reserved blocks for shrink =3D %=
u",
> >>> +                       F2FS_OPTION(sbi).reserve_shrink_blocks);
> >>> +     }
> >>> +}
> >>> +
> >>>    static inline void adjust_unusable_cap_perc(struct f2fs_sb_info *s=
bi)
> >>>    {
> >>>        if (!F2FS_OPTION(sbi).unusable_cap_perc)
> >>> @@ -953,6 +977,14 @@ static int f2fs_parse_param(struct fs_context *f=
c, struct fs_parameter *param)
> >>>                F2FS_CTX_INFO(ctx).root_reserved_nodes =3D result.uint=
_32;
> >>>                ctx->spec_mask |=3D F2FS_SPEC_reserve_node;
> >>>                break;
> >>> +     case Opt_reserve_shrink:
> >>> +             if (result.uint_32)
> >>> +                     ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK);
> >>> +             else
> >>> +                     ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK);
> >>> +             F2FS_CTX_INFO(ctx).reserve_shrink_blocks =3D result.uin=
t_32;
> >>> +             ctx->spec_mask |=3D F2FS_SPEC_reserve_shrink;
> >>> +             break;
> >>>        case Opt_resuid:
> >>>                F2FS_CTX_INFO(ctx).s_resuid =3D result.uid;
> >>>                ctx->spec_mask |=3D F2FS_SPEC_resuid;
> >>> @@ -1775,6 +1807,9 @@ static void f2fs_apply_options(struct fs_contex=
t *fc, struct super_block *sb)
> >>>        if (ctx->spec_mask & F2FS_SPEC_reserve_node)
> >>>                F2FS_OPTION(sbi).root_reserved_nodes =3D
> >>>                                        F2FS_CTX_INFO(ctx).root_reserv=
ed_nodes;
> >>> +     if (ctx->spec_mask & F2FS_SPEC_reserve_shrink)
> >>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D
> >>> +                                     F2FS_CTX_INFO(ctx).reserve_shri=
nk_blocks;
> >>>        if (ctx->spec_mask & F2FS_SPEC_resgid)
> >>>                F2FS_OPTION(sbi).s_resgid =3D F2FS_CTX_INFO(ctx).s_res=
gid;
> >>>        if (ctx->spec_mask & F2FS_SPEC_resuid)
> >>> @@ -2300,6 +2335,13 @@ static int f2fs_statfs(struct dentry *dentry, =
struct kstatfs *buf)
> >>>        buf->f_bfree =3D user_block_count - valid_user_blocks(sbi) -
> >>>                                                sbi->current_reserved_=
blocks;
> >>>
> >>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> >>> +             if (buf->f_bfree > F2FS_OPTION(sbi).reserve_shrink_bloc=
ks)
> >>> +                     buf->f_bfree -=3D F2FS_OPTION(sbi).reserve_shri=
nk_blocks;
> >>> +             else
> >>> +                     buf->f_bfree =3D 0;
> >>> +     }
> >>> +
> >>>        if (unlikely(buf->f_bfree <=3D sbi->unusable_block_count))
> >>>                buf->f_bfree =3D 0;
> >>>        else
> >>> @@ -2524,6 +2566,9 @@ static int f2fs_show_options(struct seq_file *s=
eq, struct dentry *root)
> >>>                                        F2FS_OPTION(sbi).s_resuid),
> >>>                                from_kgid_munged(&init_user_ns,
> >>>                                        F2FS_OPTION(sbi).s_resgid));
> >>> +     if (test_opt(sbi, RESERVE_SHRINK))
> >>> +             seq_printf(seq, ",reserve_shrink=3D%u",
> >>> +                             F2FS_OPTION(sbi).reserve_shrink_blocks)=
;
> >>>    #ifdef CONFIG_F2FS_FAULT_INJECTION
> >>>        if (test_opt(sbi, FAULT_INJECTION)) {
> >>>                seq_printf(seq, ",fault_injection=3D%u",
> >>> @@ -3105,6 +3150,7 @@ static int __f2fs_remount(struct fs_context *fc=
, struct super_block *sb)
> >>>
> >>>        adjust_pinned_area_boundary(sbi);
> >>>        limit_reserve_root(sbi);
> >>> +     limit_reserve_shrink(sbi);
> >>>        fc->sb_flags =3D (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LA=
ZYTIME);
> >>>
> >>>        sbi->umount_lock_holder =3D NULL;
> >>> @@ -5322,6 +5368,7 @@ static int f2fs_fill_super(struct super_block *=
sb, struct fs_context *fc)
> >>>        sbi->current_reserved_blocks =3D 0;
> >>>        sbi->alias_reserved_blocks =3D 0;
> >>>        limit_reserve_root(sbi);
> >>> +     limit_reserve_shrink(sbi);
> >>>        adjust_unusable_cap_perc(sbi);
> >>>
> >>>        f2fs_init_extent_cache_info(sbi);
> >>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> >>> index aaca9ed9b169..d61940d095b4 100644
> >>> --- a/fs/f2fs/sysfs.c
> >>> +++ b/fs/f2fs/sysfs.c
> >>> @@ -591,9 +591,18 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >>>        }
> >>>    #endif
> >>>        if (a->struct_type =3D=3D RESERVED_BLOCKS) {
> >>> +             unsigned long limit;
> >>> +
> >>>                spin_lock(&sbi->stat_lock);
> >>> -             if (t > (unsigned long)(sbi->user_block_count -
> >>> -                             F2FS_OPTION(sbi).root_reserved_blocks))=
 {
> >>> +             limit =3D sbi->user_block_count -
> >>> +                             F2FS_OPTION(sbi).root_reserved_blocks;
> >>> +             if (test_opt(sbi, RESERVE_SHRINK)) {
> >>> +                     if (limit > F2FS_OPTION(sbi).reserve_shrink_blo=
cks)
> >>> +                             limit -=3D F2FS_OPTION(sbi).reserve_shr=
ink_blocks;
> >>> +                     else
> >>> +                             limit =3D 0;
> >>> +             }
> >>> +             if (t > limit) {
> >>>                        spin_unlock(&sbi->stat_lock);
> >>>                        return -EINVAL;
> >>>                }
> >>
>
