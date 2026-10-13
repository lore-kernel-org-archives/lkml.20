Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D1B51D539
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905793; cv=pass; b=cBQ9PNhDTZwhCxDzRZKEn5DgMN4TfjdKV9HzRTkqNuBY9oQD+dOOTAG4IQjqIw92SHg/zmxI22+kUiOiQTK4ogb1ZvgmkktcMXtyl7f6IQNH7837WO6RxvSS4n5FgSluVeX0tgMXxRjKP2vONKgpN73Et/S/ycUM8zcF/t2Ty1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905793; c=relaxed/simple;
	bh=ELLxw/ooCMRb7euLjYvwRsPFsNsc+OZ/kwA12FIeOxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHpE4xhj733N90UrypDtIzuXmR+A4zmNZ6bH31dpZghtBsAPTHSieEo1xDjeUrXXjWczeSBR4cJdaZ/YSLJG+J27dCkoZRu6hbiFq2uMWsdVNl/r1Bk7uY0jaH52QfW475oLoWa8iQBO5zm/fF5Vq9hkhmZQpz3HXZW2vwnLCCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odsZvgrP; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odsZvgrP"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a980c01033so228621fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791905789; cv=none;
        d=google.com; s=arc-20260327;
        b=oX0X4WXY78ykN9kQ9A7yGn8cNN2yNo0Ds++nU+5+DXc+mGLGJyjqXtQZE5ojd3F+aK
         +WUKz6c7YAAG94Ufz/Fdxfg0b8/tH0KgeAvNcGKgkFQQXmtN+VO/GG511ZpIypeKJD5t
         9J3iDITV1ZiIfvoYc0YTcX3BpLLfFoNz1cr5aQf4w3E5q5IBH8+cxa0IcKcoYPv5MSZo
         4YX/H8rUxPwWhVs2Uby55IGwNGJUfcNd+Qv/Zknejkj2zyV0CdEXtCXci2/D5HnHn2Wq
         pv5B+P8Nosv6CpKEyO0jvWdygnapFeoJLBq+hqCQ/MhG40O5LEG7NuztNIGCMD9GA3XA
         cgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ATtNEuck8HwVtEkKeyc5g6NbggpvO3p/kJfZ8VugW70=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=ngC8vmyRaPEtQGBRZAaZ1Z+S84aW5SINeG77u8UaQRMAGDG6fd8cfj8Lhw+MHzfgSk
         NTHHGPvNwiHKHP9se5KcrBYSBq6bFwod5CGJRH0K7a+lPvjO+Rps+LZ9sSTRdzpSFbt4
         oiP3Ls8knaR0jYarAQkcJ1ZwdkyGQjY+Xtar2SYLjxIuuYmc93OvtV7sk3QV2TFJtWuq
         +D2lMM4ErZLqzmeKhMvu52EpL8hExzvMLs6/ER7H8mdVTkWRb09KGBzGe1stf2a+4onz
         N9NIZ7WhDaYA0JVHAwB1HAJBMypRAOqS2jwhcMz4MNIH9FjcPvM/GJ9hR3fyiA/ZxEEr
         IYxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791905789; x=1792510589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATtNEuck8HwVtEkKeyc5g6NbggpvO3p/kJfZ8VugW70=;
        b=odsZvgrPzxLTb14WFu4kuZG83nqUKWqeG6YtwyM/O7wljjT7Xh/9bn6Y9roHaFFXWE
         uk02Qa4UyjPkxs+2HgHbHrXTHwEP/APKyMf0XHV5qd2ngwm6xxbJuzYqdtme91XUvBvu
         nfwFY2apH4HAP5teeRbkTvrKl+KY9OApS+h3uZfcEv++cj03AzqRyChD1MwxobzL1683
         XqiiT/b3tyR621UOcNtrFpXTVKVjER0r37E3dKwKwEvM8xjAe0ohgOt8S6ynTYBl/rFH
         dsObBQ46BoXEtlU2Gz6KL1wuob3bHYaGdjBv1E6ffHDhMHn2pb2c61eRMOAgX3agSqpD
         d1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791905789; x=1792510589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATtNEuck8HwVtEkKeyc5g6NbggpvO3p/kJfZ8VugW70=;
        b=ESyQzAcFVLvffxcKKTR5T9dkHxXYwIwr1MZ36TTS9YNNPsAW6XnojuS95u1jbjakOS
         pLq4m0lJE1gcE+lVtPThTclRRc/AKroSIF4pcEf0XI0EIXr3ooDLVGdxAOeYCMNgzUSm
         lQxKW8r5XKUkH6VkkUfjVQ3bMj3KTH8FI9miLW7oP2ZFw0tbt0agjdQxgxSVh038eOUC
         gK8gSBxxlA5xafek0mQiuyslexkX91sk+yk5G80mylPm6Qo3baMVvrJzIvUySGObCXQr
         syTHE7Vn6KSXf9aPehZMv4muxn1AZX5BCCH3wiWJ0ZKdjpw4Qe1l9/kZIaxtk2Tzpv/Q
         MLMg==
X-Gm-Message-State: AFq9FYK69SjhzWajtjPGMuzgqRhGIwFZQWdHmSRR6pKL2OtnN1250LJA
	xjYE/ORos2db6tcB+b6DHLYvaKqiRi+7PMht+WlFh69wg+RVD6ad+nNpme6A7UbBxtPxnpJ29Rn
	4XsU17STZKCtj9750LXUt6Kp6fHEJYSQ=
X-Gm-Gg: AYBFou0sFLcoUZwP0cgdJvTzmSFZhRpBkBRn2BEjRC9yddSBRwNcIlKbJnLJPd/2lh+
	yzLFxQpJdjwaDvzTbr2l/ySQSX/JAp/NUYTzzzaNteq0xjs2s5jg1Wn0Iy5LJ1JdNfNye33Zep7
	/In0wzJVyAwcos0amJuwXGeA2HMpabEhaJsa2tOimmNygqCNLo+Uu/vGEpSyh6GaiOZLcWadox7
	TUldCuiJ/CAI2P9fCpNx+P5Qo2AQKBI2YeQrKfyze4e/QYuPpla9NuQHkcbxAkLuL++lqx2gDla
	kJQVn0Uq1644nbEDo6xe4LL2a1RcNmPbvoG7cE9lKTeCGaqBGDNjnO+8m8jolFVbaLYVCdOFavQ
	AL1Owa3I7UvUnliTLe48Iv/Yj+0i8XbYs7Aq2HiWI9g==
X-Received: by 2002:a05:651c:2221:b0:3a6:58f7:da9a with SMTP id
 38308e7fff4ca-3a9c54acd7bmr30144791fa.27.1791905788985; Tue, 13 Oct 2026
 08:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911143549.909867-1-daeho43@gmail.com> <20260911143549.909867-2-daeho43@gmail.com>
 <3e5f2bd4-f0e6-4f79-b182-6cb8ac331580@kernel.org> <CACOAw_zJGF5GnJoxMWSAH2yXYFKBmo6mXCamdTixyN+pDp+5Hg@mail.gmail.com>
 <ad98fde8-0480-4585-806f-31c65bb623ab@kernel.org> <CACOAw_xcio8ermirrAUOAb3AHsYJXtu13t36O3CwMntMtjgzbQ@mail.gmail.com>
In-Reply-To: <CACOAw_xcio8ermirrAUOAb3AHsYJXtu13t36O3CwMntMtjgzbQ@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 13 Oct 2026 08:36:16 -0700
X-Gm-Features: AclHuK_sobXJAqh0E-ImXMahOmptQTsEqi7ADtAoCxb7iwaJqzrobSYjUMiULB8
Message-ID: <CACOAw_zYTiF2kPnZWDZTidAA4mg1ozZoB-emFGozJjc7f=UzcQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce reserve_shrink mount
 option for filesystem shrinkage
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:15=E2=80=AFPM Daeho Jeong <daeho43@gmail.com> wro=
te:
>
> On Mon, Oct 12, 2026 at 6:27=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
> >
> > On 9/15/26 00:24, Daeho Jeong wrote:
> > > On Mon, Sep 14, 2026 at 12:15=E2=80=AFAM Chao Yu <chao@kernel.org> wr=
ote:
> > >>
> > >> On 9/11/26 22:35, Daeho Jeong wrote:
> > >>> From: Daeho Jeong <daehojeong@google.com>
> > >>>
> > >>> When preparing for subsequent online filesystem shrinkage (e.g., du=
ring
> > >>> partition resizing or FOTA updates), sufficient free space must be
> > >>> preserved so that valid data blocks can be evacuated and the filesy=
stem
> > >>> can safely shrink.
> > >>>
> > >>> Existing reserve_root cannot prevent space exhaustion by privileged=
 root
> > >>> processes (such as OTA updaters, package managers, and system daemo=
ns
> > >>> running with CAP_SYS_RESOURCE), which can allocate blocks from the =
root
> > >>> reserve and lead to resize failures due to lack of space. Moreover,
> > >>
> > >> I'm thinking about reusing existing mount option AMAP, is there any =
problem
> > >> to use "reserve_root=3D" w/ 128mb+shrunk_size_mb when we execute onl=
ine filesyste
> > >> shrinkage? once it is done, recover w/ reserve_root=3D128mb.
> > >>
> > >>> runtime configurable reserved_blocks represents permanent GC and me=
tadata
> > >>> headroom that must persist after resize, which would cause double-c=
ounting
> > >>> if inflated for shrinkage.
> > >>
> > >> I didn't get it, can you please explain a bit more about this issue?
> > >>
> > >> Thanks,
> > >
> > > Hi Chao,
> > >
> > > There are three main reasons why reserve_root cannot be reused:
> > >
> > > 1. Double-counting in f2fs_resize_fs():
> > > f2fs_resize_fs() checks:
> > >    shrunk_blocks + valid_user_blocks + root_reserved_blocks + ... >
> > > user_block_count
> > > Since root_reserved_blocks must persist after
> > > resize, inflating it by shrunk_size causes shrunk_size to be counted =
twice,
> > > requiring 2x free space and triggering false -ENOSPC. Resetting it ri=
ght before
> > > resize also introduces a race window where concurrent writes can
> > > consume the space.
> > > 2. Root can allocate from reserve_root:
> > > reserve_root allows root/CAP_SYS_RESOURCE processes to allocate. Duri=
ng OTA,
> > > system daemons and updaters can eat into the reserved blocks.
> > > reserve_shrink strictly blocks all callers, including root.
> >
> > Daeho, sorry for the delay.
> >
> > Thanks for the explanation, I see, it's not appropriate to reuse
> > "reserve_root=3D" option for your requirement.
> >
> > May I ask that do you need to keep the reservation for a long time befo=
re resize,
> > e.g. from OTA starts till shrink happens? or is it enough to make it re=
served
> > during f2fs_resize_fs()?
> >
> > If the latter, can we just reserve shrunk_blocks in f2fs_resize_fs()
> > directly, w/ the same way we did for f2fs_ioc_reserve_dev_alias()? Then
> > we don't need a new mount option. Something like:
> >
> > f2fs_resize_fs()
> >          spin_lock(&sbi->stat_lock);
> >          if (shrunk_blocks + valid_user_blocks(sbi) + ... > sbi->user_b=
lock_count)
> >              err =3D -ENOSPC;
> >          else
> >              sbi->resize_reserved_blocks +=3D shrunk_blocks;
> >          spin_unlock(&sbi->stat_lock);
> >
> >          free_segment_range(sbi, secs, true);
> >          ...
> >          freeze_super();
> >          ...
> >          spin_lock(&sbi->stat_lock);
> >          sbi->user_block_count -=3D shrunk_blocks;
> >          sbi->resize_reserved_blocks -=3D shrunk_blocks;
> >          spin_unlock(&sbi->stat_lock);
> >          ...
> >          /* error path: sbi->resize_reserved_blocks -=3D shrunk_blocks =
*/
> >
> > and in get_available_block_count(), deduct resize_reserved_blocks as we=
 did for
> > alias_reserved_blocks, so that no one, including root, can allocate fro=
m the
> > reserved space during resize.
> >
> > Thanks,
>
> Hi Chao,
>
> Thanks for the suggestion.
>
> Unfortunately, reserving only inside f2fs_resize_fs() is not enough for
> our use case. We need the reservation to be in place for a long time
> before the resize, i.e. from the moment we decide to shrink (mount time)
> until F2FS_IOC_RESIZE_FS is actually issued. During that window,
> privileged processes (OTA updater, package manager, system daemons) keep
> writing to the filesystem. If they consume the free space, the ENOSPC
> check at the entry of f2fs_resize_fs() fails right away, so there is no
> chance to reserve anything inside the ioctl. Also, statfs would keep
> reporting space that is going to be cut off.
>
> That's why it's a mount option: the reservation is applied before any
> userspace write can happen, it's honored for all callers including root,
> it's reflected in statfs, and it's released automatically once the
> shrink succeeds.
>
> Thanks,

Plus,

Please think about the FOTA scenario below:

1) The device downloads the FOTA image. At this point, we check that
   there is enough free space for the shrink.
2) The device reboots to apply the update.
3) After the reboot, /data is mounted and F2FS_IOC_RESIZE_FS is issued
   to shrink the filesystem.

Between 1) and 3), there is a long window that also spans a reboot.

Thanks,

>
> >
> > >
> > > Thanks,
> > > Daeho
> > >
> > >>
> > >>>
> > >>> To resolve this, introduce a dedicated reserve_shrink=3D<blocks>
> > >>> mount option:
> > >>> 1. Symmetrically mirrors reserve_root=3D<blocks> in block units to
> > >>>      pre-reserve space specifically for subsequent filesystem shrin=
kage.
> > >>> 2. In get_available_block_count(), unconditionally deducts
> > >>>      reserve_shrink_blocks for all callers, strictly rejecting all
> > >>>      allocations (including root / CAP_SYS_RESOURCE) once available=
 blocks
> > >>>      are exhausted.
> > >>> 3. In f2fs_statfs(), deducts reserve_shrink_blocks from f_bfree (an=
d
> > >>>      f_bavail) so that filesystem statistics accurately reflect usa=
ble space.
> > >>> 4. In f2fs_resize_fs(), automatically resets reserve_shrink_blocks =
to 0
> > >>>      and clears F2FS_MOUNT_RESERVE_SHRINK upon successful shrink co=
mpletion,
> > >>>      releasing any remaining reservation.
> > >>> 5. In sysfs: reserved_blocks, subtracts reserve_shrink_blocks when
> > >>>      validating the upper limit of configurable reserved blocks.
> > >>>
> > >>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > >>> ---
> > >>> v2:
> > >>>    - Split out mount option bitmask expansion (BIT_ULL) into a sepa=
rate
> > >>>      prerequisite patch (Patch 1/2).
> > >>> ---
> > >>>    Documentation/filesystems/f2fs.rst |  7 +++++
> > >>>    fs/f2fs/f2fs.h                     |  9 ++++++
> > >>>    fs/f2fs/gc.c                       |  5 ++++
> > >>>    fs/f2fs/super.c                    | 47 ++++++++++++++++++++++++=
++++++
> > >>>    fs/f2fs/sysfs.c                    | 13 +++++++--
> > >>>    5 files changed, 79 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/fil=
esystems/f2fs.rst
> > >>> index 771216f45207..dbdc5d5a83ad 100644
> > >>> --- a/Documentation/filesystems/f2fs.rst
> > >>> +++ b/Documentation/filesystems/f2fs.rst
> > >>> @@ -191,6 +191,13 @@ reserve_node=3D%d           Support configurin=
g reserved nodes which are used for
> > >>>                         gid, the default limit is 12.5% of all node=
s.
> > >>>    resuid=3D%d            The user ID which may use the reserved bl=
ocks and nodes.
> > >>>    resgid=3D%d            The group ID which may use the reserved b=
locks and nodes.
> > >>> +reserve_shrink=3D%d     Support pre-reserving space for subsequent=
 filesystem
> > >>> +                      shrinkage (e.g. during partition resizing or=
 FOTA),
> > >>> +                      unit: blocks. Unlike reserve_root, allocatio=
ns from
> > >>> +                      this reserved space strictly reject all call=
ers
> > >>> +                      (including root / CAP_SYS_RESOURCE). Once th=
e
> > >>> +                      filesystem is successfully shrunk via resize=
, this
> > >>> +                      value is automatically reset to 0.
> > >>>    fault_injection=3D%d   Enable fault injection in all supported t=
ypes with
> > >>>                         specified injection rate.
> > >>>    fault_type=3D%d                Support configuring fault injecti=
on type, should be
> > >>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > >>> index 4aaf29de3f6f..48a91771be95 100644
> > >>> --- a/fs/f2fs/f2fs.h
> > >>> +++ b/fs/f2fs/f2fs.h
> > >>> @@ -145,6 +145,7 @@ enum f2fs_mount_opt {
> > >>>         */
> > >>>        F2FS_MOUNT_LAZYTIME,
> > >>>        F2FS_MOUNT_RESERVE_NODE,
> > >>> +     F2FS_MOUNT_RESERVE_SHRINK,
> > >>>    };
> > >>>
> > >>>    #define F2FS_OPTION(sbi)    ((sbi)->mount_opt)
> > >>> @@ -226,6 +227,7 @@ struct f2fs_mount_info {
> > >>>        unsigned long long opt;
> > >>>        block_t root_reserved_blocks;   /* root reserved blocks */
> > >>>        block_t root_reserved_nodes;    /* root reserved nodes */
> > >>> +     block_t reserve_shrink_blocks;  /* reserve blocks for shrink =
*/
> > >>>        kuid_t s_resuid;                /* reserved blocks for uid *=
/
> > >>>        kgid_t s_resgid;                /* reserved blocks for gid *=
/
> > >>>        int active_logs;                /* # of active logs */
> > >>> @@ -2658,6 +2660,13 @@ static inline unsigned int get_available_blo=
ck_count(struct f2fs_sb_info *sbi,
> > >>>        if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sb=
i, inode, cap))
> > >>>                avail_user_block_count -=3D F2FS_OPTION(sbi).root_re=
served_blocks;
> > >>>
> > >>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > >>> +             if (avail_user_block_count > F2FS_OPTION(sbi).reserve=
_shrink_blocks)
> > >>> +                     avail_user_block_count -=3D F2FS_OPTION(sbi).=
reserve_shrink_blocks;
> > >>> +             else
> > >>> +                     avail_user_block_count =3D 0;
> > >>> +     }
> > >>> +
> > >>>        if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> > >>>                if (avail_user_block_count > sbi->unusable_block_cou=
nt)
> > >>>                        avail_user_block_count -=3D sbi->unusable_bl=
ock_count;
> > >>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > >>> index bc22dde1cb30..556c4793478d 100644
> > >>> --- a/fs/f2fs/gc.c
> > >>> +++ b/fs/f2fs/gc.c
> > >>> @@ -2492,6 +2492,11 @@ int f2fs_resize_fs(struct file *filp, __u64 =
block_count)
> > >>>                spin_lock(&sbi->stat_lock);
> > >>>                sbi->user_block_count +=3D shrunk_blocks;
> > >>>                spin_unlock(&sbi->stat_lock);
> > >>> +     } else if (test_opt(sbi, RESERVE_SHRINK)) {
> > >>> +             spin_lock(&sbi->stat_lock);
> > >>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D 0;
> > >>> +             clear_opt(sbi, RESERVE_SHRINK);
> > >>> +             spin_unlock(&sbi->stat_lock);
> > >>>        }
> > >>>    out_err:
> > >>>        f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
> > >>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > >>> index a5e109bdcebc..58f33750b2a8 100644
> > >>> --- a/fs/f2fs/super.c
> > >>> +++ b/fs/f2fs/super.c
> > >>> @@ -196,6 +196,7 @@ enum {
> > >>>        Opt_data_flush,
> > >>>        Opt_reserve_root,
> > >>>        Opt_reserve_node,
> > >>> +     Opt_reserve_shrink,
> > >>>        Opt_resgid,
> > >>>        Opt_resuid,
> > >>>        Opt_mode,
> > >>> @@ -328,6 +329,7 @@ static const struct fs_parameter_spec f2fs_para=
m_specs[] =3D {
> > >>>        fsparam_flag("data_flush", Opt_data_flush),
> > >>>        fsparam_u32("reserve_root", Opt_reserve_root),
> > >>>        fsparam_u32("reserve_node", Opt_reserve_node),
> > >>> +     fsparam_u32("reserve_shrink", Opt_reserve_shrink),
> > >>>        fsparam_gid("resgid", Opt_resgid),
> > >>>        fsparam_uid("resuid", Opt_resuid),
> > >>>        fsparam_enum("mode", Opt_mode, f2fs_param_mode),
> > >>> @@ -407,6 +409,7 @@ static match_table_t f2fs_checkpoint_tokens =3D=
 {
> > >>>    #define F2FS_SPEC_lookup_mode                       (1 << 24)
> > >>>    #define F2FS_SPEC_reserve_node                      (1 << 25)
> > >>>    #define F2FS_SPEC_resizable_tail_secno              (1 << 26)
> > >>> +#define F2FS_SPEC_reserve_shrink             (1 << 27)
> > >>>
> > >>>    struct f2fs_fs_context {
> > >>>        struct f2fs_mount_info info;
> > >>> @@ -550,6 +553,27 @@ static inline void limit_reserve_root(struct f=
2fs_sb_info *sbi)
> > >>>                                           F2FS_OPTION(sbi).s_resgid=
));
> > >>>    }
> > >>>
> > >>> +static inline void limit_reserve_shrink(struct f2fs_sb_info *sbi)
> > >>> +{
> > >>> +     block_t block_limit;
> > >>> +
> > >>> +     if (!test_opt(sbi, RESERVE_SHRINK))
> > >>> +             return;
> > >>> +
> > >>> +     block_limit =3D sbi->user_block_count - sbi->reserved_blocks;
> > >>> +     if (test_opt(sbi, RESERVE_ROOT)) {
> > >>> +             if (block_limit > F2FS_OPTION(sbi).root_reserved_bloc=
ks)
> > >>> +                     block_limit -=3D F2FS_OPTION(sbi).root_reserv=
ed_blocks;
> > >>> +             else
> > >>> +                     block_limit =3D 0;
> > >>> +     }
> > >>> +     if (F2FS_OPTION(sbi).reserve_shrink_blocks > block_limit) {
> > >>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D block_limi=
t;
> > >>> +             f2fs_info(sbi, "Reduce reserved blocks for shrink =3D=
 %u",
> > >>> +                       F2FS_OPTION(sbi).reserve_shrink_blocks);
> > >>> +     }
> > >>> +}
> > >>> +
> > >>>    static inline void adjust_unusable_cap_perc(struct f2fs_sb_info =
*sbi)
> > >>>    {
> > >>>        if (!F2FS_OPTION(sbi).unusable_cap_perc)
> > >>> @@ -953,6 +977,14 @@ static int f2fs_parse_param(struct fs_context =
*fc, struct fs_parameter *param)
> > >>>                F2FS_CTX_INFO(ctx).root_reserved_nodes =3D result.ui=
nt_32;
> > >>>                ctx->spec_mask |=3D F2FS_SPEC_reserve_node;
> > >>>                break;
> > >>> +     case Opt_reserve_shrink:
> > >>> +             if (result.uint_32)
> > >>> +                     ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK);
> > >>> +             else
> > >>> +                     ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK)=
;
> > >>> +             F2FS_CTX_INFO(ctx).reserve_shrink_blocks =3D result.u=
int_32;
> > >>> +             ctx->spec_mask |=3D F2FS_SPEC_reserve_shrink;
> > >>> +             break;
> > >>>        case Opt_resuid:
> > >>>                F2FS_CTX_INFO(ctx).s_resuid =3D result.uid;
> > >>>                ctx->spec_mask |=3D F2FS_SPEC_resuid;
> > >>> @@ -1775,6 +1807,9 @@ static void f2fs_apply_options(struct fs_cont=
ext *fc, struct super_block *sb)
> > >>>        if (ctx->spec_mask & F2FS_SPEC_reserve_node)
> > >>>                F2FS_OPTION(sbi).root_reserved_nodes =3D
> > >>>                                        F2FS_CTX_INFO(ctx).root_rese=
rved_nodes;
> > >>> +     if (ctx->spec_mask & F2FS_SPEC_reserve_shrink)
> > >>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D
> > >>> +                                     F2FS_CTX_INFO(ctx).reserve_sh=
rink_blocks;
> > >>>        if (ctx->spec_mask & F2FS_SPEC_resgid)
> > >>>                F2FS_OPTION(sbi).s_resgid =3D F2FS_CTX_INFO(ctx).s_r=
esgid;
> > >>>        if (ctx->spec_mask & F2FS_SPEC_resuid)
> > >>> @@ -2300,6 +2335,13 @@ static int f2fs_statfs(struct dentry *dentry=
, struct kstatfs *buf)
> > >>>        buf->f_bfree =3D user_block_count - valid_user_blocks(sbi) -
> > >>>                                                sbi->current_reserve=
d_blocks;
> > >>>
> > >>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > >>> +             if (buf->f_bfree > F2FS_OPTION(sbi).reserve_shrink_bl=
ocks)
> > >>> +                     buf->f_bfree -=3D F2FS_OPTION(sbi).reserve_sh=
rink_blocks;
> > >>> +             else
> > >>> +                     buf->f_bfree =3D 0;
> > >>> +     }
> > >>> +
> > >>>        if (unlikely(buf->f_bfree <=3D sbi->unusable_block_count))
> > >>>                buf->f_bfree =3D 0;
> > >>>        else
> > >>> @@ -2524,6 +2566,9 @@ static int f2fs_show_options(struct seq_file =
*seq, struct dentry *root)
> > >>>                                        F2FS_OPTION(sbi).s_resuid),
> > >>>                                from_kgid_munged(&init_user_ns,
> > >>>                                        F2FS_OPTION(sbi).s_resgid));
> > >>> +     if (test_opt(sbi, RESERVE_SHRINK))
> > >>> +             seq_printf(seq, ",reserve_shrink=3D%u",
> > >>> +                             F2FS_OPTION(sbi).reserve_shrink_block=
s);
> > >>>    #ifdef CONFIG_F2FS_FAULT_INJECTION
> > >>>        if (test_opt(sbi, FAULT_INJECTION)) {
> > >>>                seq_printf(seq, ",fault_injection=3D%u",
> > >>> @@ -3105,6 +3150,7 @@ static int __f2fs_remount(struct fs_context *=
fc, struct super_block *sb)
> > >>>
> > >>>        adjust_pinned_area_boundary(sbi);
> > >>>        limit_reserve_root(sbi);
> > >>> +     limit_reserve_shrink(sbi);
> > >>>        fc->sb_flags =3D (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_=
LAZYTIME);
> > >>>
> > >>>        sbi->umount_lock_holder =3D NULL;
> > >>> @@ -5322,6 +5368,7 @@ static int f2fs_fill_super(struct super_block=
 *sb, struct fs_context *fc)
> > >>>        sbi->current_reserved_blocks =3D 0;
> > >>>        sbi->alias_reserved_blocks =3D 0;
> > >>>        limit_reserve_root(sbi);
> > >>> +     limit_reserve_shrink(sbi);
> > >>>        adjust_unusable_cap_perc(sbi);
> > >>>
> > >>>        f2fs_init_extent_cache_info(sbi);
> > >>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > >>> index aaca9ed9b169..d61940d095b4 100644
> > >>> --- a/fs/f2fs/sysfs.c
> > >>> +++ b/fs/f2fs/sysfs.c
> > >>> @@ -591,9 +591,18 @@ static ssize_t __sbi_store(struct f2fs_attr *a=
,
> > >>>        }
> > >>>    #endif
> > >>>        if (a->struct_type =3D=3D RESERVED_BLOCKS) {
> > >>> +             unsigned long limit;
> > >>> +
> > >>>                spin_lock(&sbi->stat_lock);
> > >>> -             if (t > (unsigned long)(sbi->user_block_count -
> > >>> -                             F2FS_OPTION(sbi).root_reserved_blocks=
)) {
> > >>> +             limit =3D sbi->user_block_count -
> > >>> +                             F2FS_OPTION(sbi).root_reserved_blocks=
;
> > >>> +             if (test_opt(sbi, RESERVE_SHRINK)) {
> > >>> +                     if (limit > F2FS_OPTION(sbi).reserve_shrink_b=
locks)
> > >>> +                             limit -=3D F2FS_OPTION(sbi).reserve_s=
hrink_blocks;
> > >>> +                     else
> > >>> +                             limit =3D 0;
> > >>> +             }
> > >>> +             if (t > limit) {
> > >>>                        spin_unlock(&sbi->stat_lock);
> > >>>                        return -EINVAL;
> > >>>                }
> > >>
> >
