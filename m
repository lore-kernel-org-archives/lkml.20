Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C624E4BB7F1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934077; cv=pass; b=ufnf8zESTMGpyd6vIRVMVoTSskKIAW61qOe/HyQDhdda1XUmRn5CHM+y8dX4Ip/4smKy5K+Kx4qnvTrhNifzimwlHRbG2a+el6JiZ8tstbWFTm2pqkCMP5hhkH+IaBQn1uwp3aR/iF70a4JEuKZ9TmUIHatj+77dzUo2zfMIlow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934077; c=relaxed/simple;
	bh=eM2Pty03SEbeViP55+bL5DY740kdB+IX48XF7QjchCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXCZ9cTweLaLeOFtwjxFBM9bFNivCK7vzjFb6PY1/Eow1MQjRMqCupskFBybq5w+kTcQm6PwNv7uKCG55WqlGDuPMhaI4j69XuDS1kV0TWOXHGmmOlqZzfe5ymTpi2daVivxSl6sebpZZDJV7j4HMse70w7GI2UIuJVWhlj+QyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1Sc4l6i; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1Sc4l6i"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcf18ddc95so2657452e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791934073; cv=none;
        d=google.com; s=arc-20260327;
        b=p9b6h/uLBSZDtRezSTBk6aVw/cF+Suf/Hf80quqeL4krGJJOfK2thkRYOYQ74ZsPGL
         y7RAwcHNxotPxInMydGZyVNwExp8lksBQsXyvFSPu0pgpRG0ePnygmPY2DildjNYvjHA
         1R4nKf8+StSIB9qgiHaGPBMJwlTHeJzb7di+pgpxKbq5yzWnXOOmfL13PJ2VOgmSuu/o
         RtH7M6MCsMZG5MiQArZ44mJYf9Tf++KH8OvCU7Q/960KATs2QgMEj6da4I0esunf1zuz
         w4Uwh3Hk1qnFGUJ5er3j3Pr2zVR828UpbSxPNb8VOJovYywepX2gKE4aF9sjW2XogCtc
         Aw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fnnQPQ0twPTCgpcaw4SHEzEVMrmymymHjWL9H0St5+k=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=cuKC+YBgJzsIWeaD/Puk40prBgZgeEfA7rH8bkTBj4xi55ctoFUTFR+W+KtyjeVIrY
         3sOEckqvWlYJEFRjc62xxYOmauag7mBVtJ6WKzo8nJBpQVvR/vNf57dtrAmlwR4mJFMt
         6uwVsL7zW9mPm0U4J/3jyK9sw/JfUOarR5eTNBZIxCDzsPOPmjcNfXUi9J3BvDXkxQr0
         a7MXWt+/JdfY7/afLnjFOfX6q1+1QcaN4LeQ+8MRU12HUpIHFQklcZzUjUYIw5t7tc6e
         IBVUrHCWUHArYHe7x1UUIw6CXH8P8C3EzVb1t4iVMxIVtFEplmmpJ2ZSOnXLgUxfRtd2
         BBQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791934073; x=1792538873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fnnQPQ0twPTCgpcaw4SHEzEVMrmymymHjWL9H0St5+k=;
        b=L1Sc4l6iAKC1viLLgenBeDYFDwjgAVI/wR3qE5FYAI8aC6xouUQP/fh3rgCT6APuW9
         58zScgze5dvXUWJ+k9i6rx12awKsKRRqvYdmAVELuk43BxSnhycZM76MwEUFrlQO5mX8
         KGG3NJXLx/A+SJNUqDXh77wGmIDaeQzK+WTgg9H2nNzSR6BBhKf/afNUAmMjShpKdYxV
         E7xN5T5pZ8w7tY6ylPNwnTpGKEO/fGO3LN2Y4Oqyz9bMq1O9InNjD8NDD+GqGmivomCC
         1wUnZ93yxTlprZogRzKbacazogcWvUEiYKZDdTgYF44698xgFmZhTP90IPu7kJsqFQ65
         I5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791934073; x=1792538873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnnQPQ0twPTCgpcaw4SHEzEVMrmymymHjWL9H0St5+k=;
        b=vdlJeKEg+96xyHxfWu3wv4up5Fvc8qCV4Cii5nk/ijtIZaL66tCZmNsCcz2nG2WSUN
         RiweWcARiCJgz6l6JY641efmNl4OqIpJEwcJEC+IQ0lvceBcz/WljLmLtms/NXPHKTPH
         9uKF7m21It1X6gaGYqrN5TD8hfwVmJ/91cCZYkqXVDFA2pEq8KXJMc2Pk7O2SDW0MNrT
         j9PA+LOy7zx59pT35zy+Vo2bvLURUQvhhuuLNHHDftLmMCMiiGmYqCyyysW+Tdel3d10
         j0Zou+3OPz5p4Mdc6aZJX8ZGCNo7QzHrQHyhj5bjvLZ93yDqWpjaWiatV4P2xrb0S9oT
         id+A==
X-Gm-Message-State: AFq9FYKYAk8JCOrXKljHJhi0uiOox2VMSV01bXUE1oNs1yuaGj+2Sttu
	lkfLmrDBA39rEn0VN/3c/kdHSU5sjYlORfR+MLpYjM+4SagbDRYUi17xX70Mu8Xtzy37/uFYXfk
	UWpYnCm0VVYDiVvS5fLPeXr7yECTI2zo=
X-Gm-Gg: AYBFou0O90orayAfdGss068+V1zfKAtCZMlL8qTygsSQAmjN7eH+ay8mhkrhtteuPr5
	YsF+54WoJGQg0VgdHmDYn/tqG9fEcDUiWs6xjXUvBOYEST+qHJBc843gI2E+TO3/Y9+NuFGKQYB
	f+r/ndp9kdQSXq4+4zyAj3u3Z1sUVnMUdEHeKvERXwFP50NIeqjfisZ19fOFvfokpAGfaUX7HZ5
	znjyIo6Vr6OcX7WpU9IM6GpAGrF+Ucb0ndoti8mt5syjzjVF/xjYyyEOpIX1xNzQUXcQtecij62
	H8UGLsW6iE0HT3s8UVD3g7WQiX5yGR4tv2xJV/TJMr5YJCT7zZqOxz/ENTywmT0HAqEZPikulB1
	b2e85B6EpPSoqF71Gx800s8MYVkEmd9AvLj86ztduhrPn
X-Received: by 2002:a05:6512:2586:b0:5bc:e13b:3920 with SMTP id
 2adb3069b0e04-5bce13b3d6emr4231542e87.0.1791934072310; Tue, 13 Oct 2026
 16:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911143549.909867-1-daeho43@gmail.com> <20260911143549.909867-2-daeho43@gmail.com>
 <3e5f2bd4-f0e6-4f79-b182-6cb8ac331580@kernel.org> <CACOAw_zJGF5GnJoxMWSAH2yXYFKBmo6mXCamdTixyN+pDp+5Hg@mail.gmail.com>
 <ad98fde8-0480-4585-806f-31c65bb623ab@kernel.org> <CACOAw_xcio8ermirrAUOAb3AHsYJXtu13t36O3CwMntMtjgzbQ@mail.gmail.com>
 <CACOAw_zYTiF2kPnZWDZTidAA4mg1ozZoB-emFGozJjc7f=UzcQ@mail.gmail.com>
In-Reply-To: <CACOAw_zYTiF2kPnZWDZTidAA4mg1ozZoB-emFGozJjc7f=UzcQ@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 13 Oct 2026 16:27:36 -0700
X-Gm-Features: AclHuK9-9xIqc-cpBA680oRzpKDw6gYaiber_lxJJ4CeHvvdKwmVDb5tENuuJ8Q
Message-ID: <CACOAw_yvwehaFqh-7ufKcZRjfT7AGPEB+aR-ajutLXYE=EX+Jw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce reserve_shrink mount
 option for filesystem shrinkage
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Daeho Jeong <daeho43@gmail.com> wro=
te:
>
> On Mon, Oct 12, 2026 at 7:15=E2=80=AFPM Daeho Jeong <daeho43@gmail.com> w=
rote:
> >
> > On Mon, Oct 12, 2026 at 6:27=E2=80=AFPM Chao Yu <chao@kernel.org> wrote=
:
> > >
> > > On 9/15/26 00:24, Daeho Jeong wrote:
> > > > On Mon, Sep 14, 2026 at 12:15=E2=80=AFAM Chao Yu <chao@kernel.org> =
wrote:
> > > >>
> > > >> On 9/11/26 22:35, Daeho Jeong wrote:
> > > >>> From: Daeho Jeong <daehojeong@google.com>
> > > >>>
> > > >>> When preparing for subsequent online filesystem shrinkage (e.g., =
during
> > > >>> partition resizing or FOTA updates), sufficient free space must b=
e
> > > >>> preserved so that valid data blocks can be evacuated and the file=
system
> > > >>> can safely shrink.
> > > >>>
> > > >>> Existing reserve_root cannot prevent space exhaustion by privileg=
ed root
> > > >>> processes (such as OTA updaters, package managers, and system dae=
mons
> > > >>> running with CAP_SYS_RESOURCE), which can allocate blocks from th=
e root
> > > >>> reserve and lead to resize failures due to lack of space. Moreove=
r,
> > > >>
> > > >> I'm thinking about reusing existing mount option AMAP, is there an=
y problem
> > > >> to use "reserve_root=3D" w/ 128mb+shrunk_size_mb when we execute o=
nline filesyste
> > > >> shrinkage? once it is done, recover w/ reserve_root=3D128mb.
> > > >>
> > > >>> runtime configurable reserved_blocks represents permanent GC and =
metadata
> > > >>> headroom that must persist after resize, which would cause double=
-counting
> > > >>> if inflated for shrinkage.
> > > >>
> > > >> I didn't get it, can you please explain a bit more about this issu=
e?
> > > >>
> > > >> Thanks,
> > > >
> > > > Hi Chao,
> > > >
> > > > There are three main reasons why reserve_root cannot be reused:
> > > >
> > > > 1. Double-counting in f2fs_resize_fs():
> > > > f2fs_resize_fs() checks:
> > > >    shrunk_blocks + valid_user_blocks + root_reserved_blocks + ... >
> > > > user_block_count
> > > > Since root_reserved_blocks must persist after
> > > > resize, inflating it by shrunk_size causes shrunk_size to be counte=
d twice,
> > > > requiring 2x free space and triggering false -ENOSPC. Resetting it =
right before
> > > > resize also introduces a race window where concurrent writes can
> > > > consume the space.
> > > > 2. Root can allocate from reserve_root:
> > > > reserve_root allows root/CAP_SYS_RESOURCE processes to allocate. Du=
ring OTA,
> > > > system daemons and updaters can eat into the reserved blocks.
> > > > reserve_shrink strictly blocks all callers, including root.
> > >
> > > Daeho, sorry for the delay.
> > >
> > > Thanks for the explanation, I see, it's not appropriate to reuse
> > > "reserve_root=3D" option for your requirement.
> > >
> > > May I ask that do you need to keep the reservation for a long time be=
fore resize,
> > > e.g. from OTA starts till shrink happens? or is it enough to make it =
reserved
> > > during f2fs_resize_fs()?
> > >
> > > If the latter, can we just reserve shrunk_blocks in f2fs_resize_fs()
> > > directly, w/ the same way we did for f2fs_ioc_reserve_dev_alias()? Th=
en
> > > we don't need a new mount option. Something like:
> > >
> > > f2fs_resize_fs()
> > >          spin_lock(&sbi->stat_lock);
> > >          if (shrunk_blocks + valid_user_blocks(sbi) + ... > sbi->user=
_block_count)
> > >              err =3D -ENOSPC;
> > >          else
> > >              sbi->resize_reserved_blocks +=3D shrunk_blocks;
> > >          spin_unlock(&sbi->stat_lock);
> > >
> > >          free_segment_range(sbi, secs, true);
> > >          ...
> > >          freeze_super();
> > >          ...
> > >          spin_lock(&sbi->stat_lock);
> > >          sbi->user_block_count -=3D shrunk_blocks;
> > >          sbi->resize_reserved_blocks -=3D shrunk_blocks;
> > >          spin_unlock(&sbi->stat_lock);
> > >          ...
> > >          /* error path: sbi->resize_reserved_blocks -=3D shrunk_block=
s */
> > >
> > > and in get_available_block_count(), deduct resize_reserved_blocks as =
we did for
> > > alias_reserved_blocks, so that no one, including root, can allocate f=
rom the
> > > reserved space during resize.
> > >
> > > Thanks,
> >
> > Hi Chao,
> >
> > Thanks for the suggestion.
> >
> > Unfortunately, reserving only inside f2fs_resize_fs() is not enough for
> > our use case. We need the reservation to be in place for a long time
> > before the resize, i.e. from the moment we decide to shrink (mount time=
)
> > until F2FS_IOC_RESIZE_FS is actually issued. During that window,
> > privileged processes (OTA updater, package manager, system daemons) kee=
p
> > writing to the filesystem. If they consume the free space, the ENOSPC
> > check at the entry of f2fs_resize_fs() fails right away, so there is no
> > chance to reserve anything inside the ioctl. Also, statfs would keep
> > reporting space that is going to be cut off.
> >
> > That's why it's a mount option: the reservation is applied before any
> > userspace write can happen, it's honored for all callers including root=
,
> > it's reflected in statfs, and it's released automatically once the
> > shrink succeeds.
> >
> > Thanks,
>
> Plus,
>
> Please think about the FOTA scenario below:
>
> 1) The device downloads the FOTA image. At this point, we check that
>    there is enough free space for the shrink.
> 2) The device reboots to apply the update.
> 3) After the reboot, /data is mounted and F2FS_IOC_RESIZE_FS is issued
>    to shrink the filesystem.
>
> Between 1) and 3), there is a long window that also spans a reboot.
>
> Thanks,

Hi Chao,

Sorry for the confusion. Our scenario has recently changed.

Now the shrink is triggered at OTA install time, before the reboot: the
updater figures out how much space the new partitions need, and issues
F2FS_IOC_RESIZE_FS on the mounted /data right away. So we don't need to
keep the reservation for a long time before the resize anymore. What we
need is to protect the space during f2fs_resize_fs(), between the
dry-run GC and freeze_super(), where other processes (including root)
can consume it.

So your suggestion fits the new scenario better. I'll drop the
reserve_shrink mount option, and send a new patch that reserves
shrunk_blocks inside f2fs_resize_fs() and deducts it in
get_available_block_count() for all callers.

Thanks for the review,

>
> >
> > >
> > > >
> > > > Thanks,
> > > > Daeho
> > > >
> > > >>
> > > >>>
> > > >>> To resolve this, introduce a dedicated reserve_shrink=3D<blocks>
> > > >>> mount option:
> > > >>> 1. Symmetrically mirrors reserve_root=3D<blocks> in block units t=
o
> > > >>>      pre-reserve space specifically for subsequent filesystem shr=
inkage.
> > > >>> 2. In get_available_block_count(), unconditionally deducts
> > > >>>      reserve_shrink_blocks for all callers, strictly rejecting al=
l
> > > >>>      allocations (including root / CAP_SYS_RESOURCE) once availab=
le blocks
> > > >>>      are exhausted.
> > > >>> 3. In f2fs_statfs(), deducts reserve_shrink_blocks from f_bfree (=
and
> > > >>>      f_bavail) so that filesystem statistics accurately reflect u=
sable space.
> > > >>> 4. In f2fs_resize_fs(), automatically resets reserve_shrink_block=
s to 0
> > > >>>      and clears F2FS_MOUNT_RESERVE_SHRINK upon successful shrink =
completion,
> > > >>>      releasing any remaining reservation.
> > > >>> 5. In sysfs: reserved_blocks, subtracts reserve_shrink_blocks whe=
n
> > > >>>      validating the upper limit of configurable reserved blocks.
> > > >>>
> > > >>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > > >>> ---
> > > >>> v2:
> > > >>>    - Split out mount option bitmask expansion (BIT_ULL) into a se=
parate
> > > >>>      prerequisite patch (Patch 1/2).
> > > >>> ---
> > > >>>    Documentation/filesystems/f2fs.rst |  7 +++++
> > > >>>    fs/f2fs/f2fs.h                     |  9 ++++++
> > > >>>    fs/f2fs/gc.c                       |  5 ++++
> > > >>>    fs/f2fs/super.c                    | 47 ++++++++++++++++++++++=
++++++++
> > > >>>    fs/f2fs/sysfs.c                    | 13 +++++++--
> > > >>>    5 files changed, 79 insertions(+), 2 deletions(-)
> > > >>>
> > > >>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/f=
ilesystems/f2fs.rst
> > > >>> index 771216f45207..dbdc5d5a83ad 100644
> > > >>> --- a/Documentation/filesystems/f2fs.rst
> > > >>> +++ b/Documentation/filesystems/f2fs.rst
> > > >>> @@ -191,6 +191,13 @@ reserve_node=3D%d           Support configur=
ing reserved nodes which are used for
> > > >>>                         gid, the default limit is 12.5% of all no=
des.
> > > >>>    resuid=3D%d            The user ID which may use the reserved =
blocks and nodes.
> > > >>>    resgid=3D%d            The group ID which may use the reserved=
 blocks and nodes.
> > > >>> +reserve_shrink=3D%d     Support pre-reserving space for subseque=
nt filesystem
> > > >>> +                      shrinkage (e.g. during partition resizing =
or FOTA),
> > > >>> +                      unit: blocks. Unlike reserve_root, allocat=
ions from
> > > >>> +                      this reserved space strictly reject all ca=
llers
> > > >>> +                      (including root / CAP_SYS_RESOURCE). Once =
the
> > > >>> +                      filesystem is successfully shrunk via resi=
ze, this
> > > >>> +                      value is automatically reset to 0.
> > > >>>    fault_injection=3D%d   Enable fault injection in all supported=
 types with
> > > >>>                         specified injection rate.
> > > >>>    fault_type=3D%d                Support configuring fault injec=
tion type, should be
> > > >>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > >>> index 4aaf29de3f6f..48a91771be95 100644
> > > >>> --- a/fs/f2fs/f2fs.h
> > > >>> +++ b/fs/f2fs/f2fs.h
> > > >>> @@ -145,6 +145,7 @@ enum f2fs_mount_opt {
> > > >>>         */
> > > >>>        F2FS_MOUNT_LAZYTIME,
> > > >>>        F2FS_MOUNT_RESERVE_NODE,
> > > >>> +     F2FS_MOUNT_RESERVE_SHRINK,
> > > >>>    };
> > > >>>
> > > >>>    #define F2FS_OPTION(sbi)    ((sbi)->mount_opt)
> > > >>> @@ -226,6 +227,7 @@ struct f2fs_mount_info {
> > > >>>        unsigned long long opt;
> > > >>>        block_t root_reserved_blocks;   /* root reserved blocks */
> > > >>>        block_t root_reserved_nodes;    /* root reserved nodes */
> > > >>> +     block_t reserve_shrink_blocks;  /* reserve blocks for shrin=
k */
> > > >>>        kuid_t s_resuid;                /* reserved blocks for uid=
 */
> > > >>>        kgid_t s_resgid;                /* reserved blocks for gid=
 */
> > > >>>        int active_logs;                /* # of active logs */
> > > >>> @@ -2658,6 +2660,13 @@ static inline unsigned int get_available_b=
lock_count(struct f2fs_sb_info *sbi,
> > > >>>        if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(=
sbi, inode, cap))
> > > >>>                avail_user_block_count -=3D F2FS_OPTION(sbi).root_=
reserved_blocks;
> > > >>>
> > > >>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > > >>> +             if (avail_user_block_count > F2FS_OPTION(sbi).reser=
ve_shrink_blocks)
> > > >>> +                     avail_user_block_count -=3D F2FS_OPTION(sbi=
).reserve_shrink_blocks;
> > > >>> +             else
> > > >>> +                     avail_user_block_count =3D 0;
> > > >>> +     }
> > > >>> +
> > > >>>        if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> > > >>>                if (avail_user_block_count > sbi->unusable_block_c=
ount)
> > > >>>                        avail_user_block_count -=3D sbi->unusable_=
block_count;
> > > >>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > > >>> index bc22dde1cb30..556c4793478d 100644
> > > >>> --- a/fs/f2fs/gc.c
> > > >>> +++ b/fs/f2fs/gc.c
> > > >>> @@ -2492,6 +2492,11 @@ int f2fs_resize_fs(struct file *filp, __u6=
4 block_count)
> > > >>>                spin_lock(&sbi->stat_lock);
> > > >>>                sbi->user_block_count +=3D shrunk_blocks;
> > > >>>                spin_unlock(&sbi->stat_lock);
> > > >>> +     } else if (test_opt(sbi, RESERVE_SHRINK)) {
> > > >>> +             spin_lock(&sbi->stat_lock);
> > > >>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D 0;
> > > >>> +             clear_opt(sbi, RESERVE_SHRINK);
> > > >>> +             spin_unlock(&sbi->stat_lock);
> > > >>>        }
> > > >>>    out_err:
> > > >>>        f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
> > > >>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > >>> index a5e109bdcebc..58f33750b2a8 100644
> > > >>> --- a/fs/f2fs/super.c
> > > >>> +++ b/fs/f2fs/super.c
> > > >>> @@ -196,6 +196,7 @@ enum {
> > > >>>        Opt_data_flush,
> > > >>>        Opt_reserve_root,
> > > >>>        Opt_reserve_node,
> > > >>> +     Opt_reserve_shrink,
> > > >>>        Opt_resgid,
> > > >>>        Opt_resuid,
> > > >>>        Opt_mode,
> > > >>> @@ -328,6 +329,7 @@ static const struct fs_parameter_spec f2fs_pa=
ram_specs[] =3D {
> > > >>>        fsparam_flag("data_flush", Opt_data_flush),
> > > >>>        fsparam_u32("reserve_root", Opt_reserve_root),
> > > >>>        fsparam_u32("reserve_node", Opt_reserve_node),
> > > >>> +     fsparam_u32("reserve_shrink", Opt_reserve_shrink),
> > > >>>        fsparam_gid("resgid", Opt_resgid),
> > > >>>        fsparam_uid("resuid", Opt_resuid),
> > > >>>        fsparam_enum("mode", Opt_mode, f2fs_param_mode),
> > > >>> @@ -407,6 +409,7 @@ static match_table_t f2fs_checkpoint_tokens =
=3D {
> > > >>>    #define F2FS_SPEC_lookup_mode                       (1 << 24)
> > > >>>    #define F2FS_SPEC_reserve_node                      (1 << 25)
> > > >>>    #define F2FS_SPEC_resizable_tail_secno              (1 << 26)
> > > >>> +#define F2FS_SPEC_reserve_shrink             (1 << 27)
> > > >>>
> > > >>>    struct f2fs_fs_context {
> > > >>>        struct f2fs_mount_info info;
> > > >>> @@ -550,6 +553,27 @@ static inline void limit_reserve_root(struct=
 f2fs_sb_info *sbi)
> > > >>>                                           F2FS_OPTION(sbi).s_resg=
id));
> > > >>>    }
> > > >>>
> > > >>> +static inline void limit_reserve_shrink(struct f2fs_sb_info *sbi=
)
> > > >>> +{
> > > >>> +     block_t block_limit;
> > > >>> +
> > > >>> +     if (!test_opt(sbi, RESERVE_SHRINK))
> > > >>> +             return;
> > > >>> +
> > > >>> +     block_limit =3D sbi->user_block_count - sbi->reserved_block=
s;
> > > >>> +     if (test_opt(sbi, RESERVE_ROOT)) {
> > > >>> +             if (block_limit > F2FS_OPTION(sbi).root_reserved_bl=
ocks)
> > > >>> +                     block_limit -=3D F2FS_OPTION(sbi).root_rese=
rved_blocks;
> > > >>> +             else
> > > >>> +                     block_limit =3D 0;
> > > >>> +     }
> > > >>> +     if (F2FS_OPTION(sbi).reserve_shrink_blocks > block_limit) {
> > > >>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D block_li=
mit;
> > > >>> +             f2fs_info(sbi, "Reduce reserved blocks for shrink =
=3D %u",
> > > >>> +                       F2FS_OPTION(sbi).reserve_shrink_blocks);
> > > >>> +     }
> > > >>> +}
> > > >>> +
> > > >>>    static inline void adjust_unusable_cap_perc(struct f2fs_sb_inf=
o *sbi)
> > > >>>    {
> > > >>>        if (!F2FS_OPTION(sbi).unusable_cap_perc)
> > > >>> @@ -953,6 +977,14 @@ static int f2fs_parse_param(struct fs_contex=
t *fc, struct fs_parameter *param)
> > > >>>                F2FS_CTX_INFO(ctx).root_reserved_nodes =3D result.=
uint_32;
> > > >>>                ctx->spec_mask |=3D F2FS_SPEC_reserve_node;
> > > >>>                break;
> > > >>> +     case Opt_reserve_shrink:
> > > >>> +             if (result.uint_32)
> > > >>> +                     ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK)=
;
> > > >>> +             else
> > > >>> +                     ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_SHRIN=
K);
> > > >>> +             F2FS_CTX_INFO(ctx).reserve_shrink_blocks =3D result=
.uint_32;
> > > >>> +             ctx->spec_mask |=3D F2FS_SPEC_reserve_shrink;
> > > >>> +             break;
> > > >>>        case Opt_resuid:
> > > >>>                F2FS_CTX_INFO(ctx).s_resuid =3D result.uid;
> > > >>>                ctx->spec_mask |=3D F2FS_SPEC_resuid;
> > > >>> @@ -1775,6 +1807,9 @@ static void f2fs_apply_options(struct fs_co=
ntext *fc, struct super_block *sb)
> > > >>>        if (ctx->spec_mask & F2FS_SPEC_reserve_node)
> > > >>>                F2FS_OPTION(sbi).root_reserved_nodes =3D
> > > >>>                                        F2FS_CTX_INFO(ctx).root_re=
served_nodes;
> > > >>> +     if (ctx->spec_mask & F2FS_SPEC_reserve_shrink)
> > > >>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D
> > > >>> +                                     F2FS_CTX_INFO(ctx).reserve_=
shrink_blocks;
> > > >>>        if (ctx->spec_mask & F2FS_SPEC_resgid)
> > > >>>                F2FS_OPTION(sbi).s_resgid =3D F2FS_CTX_INFO(ctx).s=
_resgid;
> > > >>>        if (ctx->spec_mask & F2FS_SPEC_resuid)
> > > >>> @@ -2300,6 +2335,13 @@ static int f2fs_statfs(struct dentry *dent=
ry, struct kstatfs *buf)
> > > >>>        buf->f_bfree =3D user_block_count - valid_user_blocks(sbi)=
 -
> > > >>>                                                sbi->current_reser=
ved_blocks;
> > > >>>
> > > >>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > > >>> +             if (buf->f_bfree > F2FS_OPTION(sbi).reserve_shrink_=
blocks)
> > > >>> +                     buf->f_bfree -=3D F2FS_OPTION(sbi).reserve_=
shrink_blocks;
> > > >>> +             else
> > > >>> +                     buf->f_bfree =3D 0;
> > > >>> +     }
> > > >>> +
> > > >>>        if (unlikely(buf->f_bfree <=3D sbi->unusable_block_count))
> > > >>>                buf->f_bfree =3D 0;
> > > >>>        else
> > > >>> @@ -2524,6 +2566,9 @@ static int f2fs_show_options(struct seq_fil=
e *seq, struct dentry *root)
> > > >>>                                        F2FS_OPTION(sbi).s_resuid)=
,
> > > >>>                                from_kgid_munged(&init_user_ns,
> > > >>>                                        F2FS_OPTION(sbi).s_resgid)=
);
> > > >>> +     if (test_opt(sbi, RESERVE_SHRINK))
> > > >>> +             seq_printf(seq, ",reserve_shrink=3D%u",
> > > >>> +                             F2FS_OPTION(sbi).reserve_shrink_blo=
cks);
> > > >>>    #ifdef CONFIG_F2FS_FAULT_INJECTION
> > > >>>        if (test_opt(sbi, FAULT_INJECTION)) {
> > > >>>                seq_printf(seq, ",fault_injection=3D%u",
> > > >>> @@ -3105,6 +3150,7 @@ static int __f2fs_remount(struct fs_context=
 *fc, struct super_block *sb)
> > > >>>
> > > >>>        adjust_pinned_area_boundary(sbi);
> > > >>>        limit_reserve_root(sbi);
> > > >>> +     limit_reserve_shrink(sbi);
> > > >>>        fc->sb_flags =3D (flags & ~SB_LAZYTIME) | (sb->s_flags & S=
B_LAZYTIME);
> > > >>>
> > > >>>        sbi->umount_lock_holder =3D NULL;
> > > >>> @@ -5322,6 +5368,7 @@ static int f2fs_fill_super(struct super_blo=
ck *sb, struct fs_context *fc)
> > > >>>        sbi->current_reserved_blocks =3D 0;
> > > >>>        sbi->alias_reserved_blocks =3D 0;
> > > >>>        limit_reserve_root(sbi);
> > > >>> +     limit_reserve_shrink(sbi);
> > > >>>        adjust_unusable_cap_perc(sbi);
> > > >>>
> > > >>>        f2fs_init_extent_cache_info(sbi);
> > > >>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > > >>> index aaca9ed9b169..d61940d095b4 100644
> > > >>> --- a/fs/f2fs/sysfs.c
> > > >>> +++ b/fs/f2fs/sysfs.c
> > > >>> @@ -591,9 +591,18 @@ static ssize_t __sbi_store(struct f2fs_attr =
*a,
> > > >>>        }
> > > >>>    #endif
> > > >>>        if (a->struct_type =3D=3D RESERVED_BLOCKS) {
> > > >>> +             unsigned long limit;
> > > >>> +
> > > >>>                spin_lock(&sbi->stat_lock);
> > > >>> -             if (t > (unsigned long)(sbi->user_block_count -
> > > >>> -                             F2FS_OPTION(sbi).root_reserved_bloc=
ks)) {
> > > >>> +             limit =3D sbi->user_block_count -
> > > >>> +                             F2FS_OPTION(sbi).root_reserved_bloc=
ks;
> > > >>> +             if (test_opt(sbi, RESERVE_SHRINK)) {
> > > >>> +                     if (limit > F2FS_OPTION(sbi).reserve_shrink=
_blocks)
> > > >>> +                             limit -=3D F2FS_OPTION(sbi).reserve=
_shrink_blocks;
> > > >>> +                     else
> > > >>> +                             limit =3D 0;
> > > >>> +             }
> > > >>> +             if (t > limit) {
> > > >>>                        spin_unlock(&sbi->stat_lock);
> > > >>>                        return -EINVAL;
> > > >>>                }
> > > >>
> > >
