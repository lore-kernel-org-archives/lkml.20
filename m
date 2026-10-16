Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0AA4E8E1D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167010; cv=pass; b=Fu5xE9kjANLeh5gme3J7sbZ8/GE/n4/4JeF8dPUpKAtuGueoBGAYL3EOvvA+5HcjgWyFJC3jdF2A6qVDcSOmdDBkL5fmnDb2U/u/g0xCS9q/DloOoCWdVLXrYtpvVPOFD0V4HmeCX7upHYTVcMC0465kgsnrLPkkqn2E9UFhoCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167010; c=relaxed/simple;
	bh=xQ0R6gmFXjRqJk3P1+or2E7lsQbJU1nCV4htsPF/BNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7Dc7hMhUDI8fzPDMYVLND0CKcmezVMayX2/1UnQ4cdXF3f8vx+yZEfEtRIAg+jBMECgd5dYIl39ZKfQwjNM7HAP1FH20Fek3r257OLT+guyLYRx/V0UqxuKwQle4V9vULUUfRzrnMfnCA1mrMQnslZk8KlnNpoBB2CTkedNPuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDEY6zDy; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDEY6zDy"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso73902a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166996; cv=none;
        d=google.com; s=arc-20260327;
        b=Vh0ELxct2Sy60pKZ4CLTSIHyja1a/RHBPa44/EMHzZr7/LRtPSqWWIQ5Dkv3sXL3s/
         gBCRFOoFIPD/RoyV7zgSPp6cvM4kP7i157yHuBs4/8ZwXLZ/zs8tshMf1pA6wbeYCSXH
         SwXXmETbR6e4QlFtjJSHxvlNuzseLY3ds5TviOWzgYLxUX9OQk1W0vKee+6HgixTuOTj
         XGBkU6wOYBgdIDFnSBKsOgLxWJtlPjnzkXjWxMTrxLYAKuRtxn8Etu6jUOOq6yIvJBOQ
         t9VJJfYWiYQVuZDvO5TsLijI+bX6Woqab0zNWtmytZrsUpqU+jviiVAGb2Pa3UpJL+sd
         /q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I4ZQWUr6yWz5tvdTfGM1MIWAClA3orU/pDiXy9/5mck=;
        fh=Vj18VcG1G45yOIYb4XaIFVSZtKbLzFv6uE40R2yPr7k=;
        b=OwJ88NDPlPVv1fLG9X4b9d+9mjV6Mue7G0vOtfTnR9BQqmqYSpIUr05p7fWVGezJXI
         nn4EBAZXZoBYBFwP+cSHiL3F6QxYFSiA+YWEmFdRZRmPOlNbFj0rVONSaFaYSlzhex3i
         pc10O9AKcDrp4nQMpnUlENmYtDzuzus0UQcA6noOTqjJ32tBZef0jl/09RZE7DtDsY72
         DERUfMOh9liZoA9oUGwwBbrSanEl+GHH1jJaPNPyeh2RYhTyk8mbDVoWFGdohC7dXSTz
         FBjDUEQ7o3vyhjfxMPeyYZuaCxvSLdeq2IyUkWAgSOLDi05iKWQK4JNkFlE6uuELon9r
         jttg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166996; x=1792771796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I4ZQWUr6yWz5tvdTfGM1MIWAClA3orU/pDiXy9/5mck=;
        b=HDEY6zDyCdvDd3LjqC+Gq5VQ3MEIMXNnSY1jLKsnwwaw4uu+q3VDF2xaixmhMGJBVx
         LFkRPBzpijX6IvclvUHF4a7GHebnnNhvkBF4wj/dqg4h8qVMW2o7evNrQ10EApaCPNlX
         hmzpBNL5Y9Q1a7mljqYqVSK7tBZK1oPAovDtsCMvhjtMFBANsw++WpirP4v/GDBNbDAl
         lGQL8U2vMkZSdb5mTT6RZbCIg5fUvDImCoylwVfebSWYVfN7amoDVpl4ym1CiZYJdp8M
         QajM0QjeAA3zBK6t2lt+OHinoZNy2je/CPXZ2qhoydwFwnvUG4dDE3mEAQ4YwVbP8Dfq
         Knaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166996; x=1792771796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4ZQWUr6yWz5tvdTfGM1MIWAClA3orU/pDiXy9/5mck=;
        b=VQ5FubKJc7VDZngtoa9u4PTKmyhA8/iKVj09LcmfPVWsu+EMcjOubby73uWZ63G2oD
         jZdmr5W48n2nGQc8gN28QTOYPe3qUOS7eMs+tcch5fmp/GVQw5ROuRYAwbQDRGDagOhT
         yACalEX1/afmxtcCveMZH8Oh4fdBCG0rUBDW5RKBu3dfVuGMptENy/MtWI9qOHRE2BUC
         dm/Mw0sJc5pXaCiHR4BUetzf4u5nGE3+VybZ7uSIr4bhmgKgsw+T7ZZ4RrwONXXVo4hK
         hKD93aPIQhvSfIhnNuCDei1+gtFl/cXJH92u5jUtGJDkTeNaDBefv4hf1VfgTR/zSFHl
         H/Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxOaIk5IYs5zrhVmYq1QSlNI/z8RI8xJQ+a+g51+9Hb1dMd2TEAtHpz8VNypcu0a+9IgE0cIOEGkhQWrFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiDl33dAGKdAgpKZfpMc5SIrFikCV+ohRlUQUgFqNDqibltMGq
	s6rs5mN0p6+JDJn3QBM0FnD8fhkG7phd7dju8ajiCMEYfi7AVAFDWYglfObK8VnivOMLSHCeHZr
	FB72HUodOU6sp86T5ZAXwyLggKkUpDXk=
X-Gm-Gg: AYBFou2fJvOJ89xLN2yNv/vi2sQRWo+i669B0n4LTzhBdsHIQivWjohDBwOmu6G1evN
	fXGzR+I8hRycaBS8+Yc3vKR9K1Vjmli3vf0j81eJ82VrB3WqssiIxPEZZFolTyumuZqKTLcgwqU
	Q3gpmmvDqMgZgFfWjwsVDPjiSzjN0ErVI2nHcBMMO3LhUKionA5vboOqh6CF2vtk+slayzFbjrz
	pj38eIizDFArUAKM0hvPpq1jw8I7SR7yMmmT93kB4kRe5eqsPD0062+4IJwS3NGTo5OZ4OQgy8L
	EwCpr6EuKxcDUpsiPicxRFIEBqLQJhRvYaI6PsZusX2qNH+X7IRCtXgvBWGtYGveWsdCjnblySO
	Wt8C9qILFX9d8OeKTor0bajj48ttH3/Ut51C9+EgsrD9McA==
X-Received: by 2002:a17:90b:4f8e:b0:3ac:9785:4c32 with SMTP id
 98e67ed59e1d1-3acef1456f0mr291158a91.30.1792166995477; Fri, 16 Oct 2026
 09:09:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911143549.909867-2-daeho43@gmail.com> <3e5f2bd4-f0e6-4f79-b182-6cb8ac331580@kernel.org>
 <CACOAw_zJGF5GnJoxMWSAH2yXYFKBmo6mXCamdTixyN+pDp+5Hg@mail.gmail.com>
 <ad98fde8-0480-4585-806f-31c65bb623ab@kernel.org> <CACOAw_xcio8ermirrAUOAb3AHsYJXtu13t36O3CwMntMtjgzbQ@mail.gmail.com>
 <CACOAw_zYTiF2kPnZWDZTidAA4mg1ozZoB-emFGozJjc7f=UzcQ@mail.gmail.com>
 <CACOAw_yvwehaFqh-7ufKcZRjfT7AGPEB+aR-ajutLXYE=EX+Jw@mail.gmail.com>
 <0aedc5af-1273-4510-a8fa-5ddf2281b699@kernel.org> <atJHn7SZ-gMf_alX@google.com>
 <CACOAw_xPgPbPYotMFUFvkQtofvs1Yz+74tk8JHmhN5LRabwTjg@mail.gmail.com> <atJK-WKRxVOkdymu@google.com>
In-Reply-To: <atJK-WKRxVOkdymu@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 16 Oct 2026 09:09:41 -0700
X-Gm-Features: AclHuK-atoynqxV9wBLJVfcenBu6eO9stA-xUrF9yw8kLSyM5mHI-vc4asMTeZI
Message-ID: <CACOAw_w9FFU5byN_eqS=zM=ncG+U2Juyedx8Q-yx9qbHNeg_RQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce reserve_shrink mount
 option for filesystem shrinkage
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 9:04=E2=80=AFAM Jaegeuk Kim <jaegeuk@kernel.org> wr=
ote:
>
> On 10/16, Daeho Jeong wrote:
> > On Fri, Oct 16, 2026 at 8:49=E2=80=AFAM Jaegeuk Kim <jaegeuk@kernel.org=
> wrote:
> > >
> > > Are we waiting for v3 along with sysfs's feature flag, right?
> >
> > Hi Jaegeuk,
> >
> > These two are for that.
> >
> > [PATCH] f2fs: reserve space to be shrunk during resize_fs
> > [PATCH] f2fs: expose resizable_tail feature via sysfs
>
> Please check the list of patches below.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?=
h=3Ddev-test&id=3De77a210415848b2f8b1e76173f9689b0ae889ea4
>

Plz, abandon this patch, since I submitted "f2fs: reserve space to be
shrunk during resize_fs" instead of this one.

>
> >
> > Thanks,
> >
> >
> > >
> > > On 10/14, Chao Yu wrote:
> > > > On 10/14/26 07:27, Daeho Jeong wrote:
> > > > > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Daeho Jeong <daeho43@gmai=
l.com> wrote:
> > > > >>
> > > > >> On Mon, Oct 12, 2026 at 7:15=E2=80=AFPM Daeho Jeong <daeho43@gma=
il.com> wrote:
> > > > >>>
> > > > >>> On Mon, Oct 12, 2026 at 6:27=E2=80=AFPM Chao Yu <chao@kernel.or=
g> wrote:
> > > > >>>>
> > > > >>>> On 9/15/26 00:24, Daeho Jeong wrote:
> > > > >>>>> On Mon, Sep 14, 2026 at 12:15=E2=80=AFAM Chao Yu <chao@kernel=
.org> wrote:
> > > > >>>>>>
> > > > >>>>>> On 9/11/26 22:35, Daeho Jeong wrote:
> > > > >>>>>>> From: Daeho Jeong <daehojeong@google.com>
> > > > >>>>>>>
> > > > >>>>>>> When preparing for subsequent online filesystem shrinkage (=
e.g., during
> > > > >>>>>>> partition resizing or FOTA updates), sufficient free space =
must be
> > > > >>>>>>> preserved so that valid data blocks can be evacuated and th=
e filesystem
> > > > >>>>>>> can safely shrink.
> > > > >>>>>>>
> > > > >>>>>>> Existing reserve_root cannot prevent space exhaustion by pr=
ivileged root
> > > > >>>>>>> processes (such as OTA updaters, package managers, and syst=
em daemons
> > > > >>>>>>> running with CAP_SYS_RESOURCE), which can allocate blocks f=
rom the root
> > > > >>>>>>> reserve and lead to resize failures due to lack of space. M=
oreover,
> > > > >>>>>>
> > > > >>>>>> I'm thinking about reusing existing mount option AMAP, is th=
ere any problem
> > > > >>>>>> to use "reserve_root=3D" w/ 128mb+shrunk_size_mb when we exe=
cute online filesyste
> > > > >>>>>> shrinkage? once it is done, recover w/ reserve_root=3D128mb.
> > > > >>>>>>
> > > > >>>>>>> runtime configurable reserved_blocks represents permanent G=
C and metadata
> > > > >>>>>>> headroom that must persist after resize, which would cause =
double-counting
> > > > >>>>>>> if inflated for shrinkage.
> > > > >>>>>>
> > > > >>>>>> I didn't get it, can you please explain a bit more about thi=
s issue?
> > > > >>>>>>
> > > > >>>>>> Thanks,
> > > > >>>>>
> > > > >>>>> Hi Chao,
> > > > >>>>>
> > > > >>>>> There are three main reasons why reserve_root cannot be reuse=
d:
> > > > >>>>>
> > > > >>>>> 1. Double-counting in f2fs_resize_fs():
> > > > >>>>> f2fs_resize_fs() checks:
> > > > >>>>>    shrunk_blocks + valid_user_blocks + root_reserved_blocks +=
 ... >
> > > > >>>>> user_block_count
> > > > >>>>> Since root_reserved_blocks must persist after
> > > > >>>>> resize, inflating it by shrunk_size causes shrunk_size to be =
counted twice,
> > > > >>>>> requiring 2x free space and triggering false -ENOSPC. Resetti=
ng it right before
> > > > >>>>> resize also introduces a race window where concurrent writes =
can
> > > > >>>>> consume the space.
> > > > >>>>> 2. Root can allocate from reserve_root:
> > > > >>>>> reserve_root allows root/CAP_SYS_RESOURCE processes to alloca=
te. During OTA,
> > > > >>>>> system daemons and updaters can eat into the reserved blocks.
> > > > >>>>> reserve_shrink strictly blocks all callers, including root.
> > > > >>>>
> > > > >>>> Daeho, sorry for the delay.
> > > > >>>>
> > > > >>>> Thanks for the explanation, I see, it's not appropriate to reu=
se
> > > > >>>> "reserve_root=3D" option for your requirement.
> > > > >>>>
> > > > >>>> May I ask that do you need to keep the reservation for a long =
time before resize,
> > > > >>>> e.g. from OTA starts till shrink happens? or is it enough to m=
ake it reserved
> > > > >>>> during f2fs_resize_fs()?
> > > > >>>>
> > > > >>>> If the latter, can we just reserve shrunk_blocks in f2fs_resiz=
e_fs()
> > > > >>>> directly, w/ the same way we did for f2fs_ioc_reserve_dev_alia=
s()? Then
> > > > >>>> we don't need a new mount option. Something like:
> > > > >>>>
> > > > >>>> f2fs_resize_fs()
> > > > >>>>          spin_lock(&sbi->stat_lock);
> > > > >>>>          if (shrunk_blocks + valid_user_blocks(sbi) + ... > sb=
i->user_block_count)
> > > > >>>>              err =3D -ENOSPC;
> > > > >>>>          else
> > > > >>>>              sbi->resize_reserved_blocks +=3D shrunk_blocks;
> > > > >>>>          spin_unlock(&sbi->stat_lock);
> > > > >>>>
> > > > >>>>          free_segment_range(sbi, secs, true);
> > > > >>>>          ...
> > > > >>>>          freeze_super();
> > > > >>>>          ...
> > > > >>>>          spin_lock(&sbi->stat_lock);
> > > > >>>>          sbi->user_block_count -=3D shrunk_blocks;
> > > > >>>>          sbi->resize_reserved_blocks -=3D shrunk_blocks;
> > > > >>>>          spin_unlock(&sbi->stat_lock);
> > > > >>>>          ...
> > > > >>>>          /* error path: sbi->resize_reserved_blocks -=3D shrun=
k_blocks */
> > > > >>>>
> > > > >>>> and in get_available_block_count(), deduct resize_reserved_blo=
cks as we did for
> > > > >>>> alias_reserved_blocks, so that no one, including root, can all=
ocate from the
> > > > >>>> reserved space during resize.
> > > > >>>>
> > > > >>>> Thanks,
> > > > >>>
> > > > >>> Hi Chao,
> > > > >>>
> > > > >>> Thanks for the suggestion.
> > > > >>>
> > > > >>> Unfortunately, reserving only inside f2fs_resize_fs() is not en=
ough for
> > > > >>> our use case. We need the reservation to be in place for a long=
 time
> > > > >>> before the resize, i.e. from the moment we decide to shrink (mo=
unt time)
> > > > >>> until F2FS_IOC_RESIZE_FS is actually issued. During that window=
,
> > > > >>> privileged processes (OTA updater, package manager, system daem=
ons) keep
> > > > >>> writing to the filesystem. If they consume the free space, the =
ENOSPC
> > > > >>> check at the entry of f2fs_resize_fs() fails right away, so the=
re is no
> > > > >>> chance to reserve anything inside the ioctl. Also, statfs would=
 keep
> > > > >>> reporting space that is going to be cut off.
> > > > >>>
> > > > >>> That's why it's a mount option: the reservation is applied befo=
re any
> > > > >>> userspace write can happen, it's honored for all callers includ=
ing root,
> > > > >>> it's reflected in statfs, and it's released automatically once =
the
> > > > >>> shrink succeeds.
> > > > >>>
> > > > >>> Thanks,
> > > > >>
> > > > >> Plus,
> > > > >>
> > > > >> Please think about the FOTA scenario below:
> > > > >>
> > > > >> 1) The device downloads the FOTA image. At this point, we check =
that
> > > > >>    there is enough free space for the shrink.
> > > > >> 2) The device reboots to apply the update.
> > > > >> 3) After the reboot, /data is mounted and F2FS_IOC_RESIZE_FS is =
issued
> > > > >>    to shrink the filesystem.
> > > > >>
> > > > >> Between 1) and 3), there is a long window that also spans a rebo=
ot.
> > > > >>
> > > > >> Thanks,
> > > > >
> > > > > Hi Chao,
> > > > >
> > > > > Sorry for the confusion. Our scenario has recently changed.
> > > > >
> > > > > Now the shrink is triggered at OTA install time, before the reboo=
t: the
> > > > > updater figures out how much space the new partitions need, and i=
ssues
> > > > > F2FS_IOC_RESIZE_FS on the mounted /data right away. So we don't n=
eed to
> > > > > keep the reservation for a long time before the resize anymore. W=
hat we
> > > > > need is to protect the space during f2fs_resize_fs(), between the
> > > > > dry-run GC and freeze_super(), where other processes (including r=
oot)
> > > > > can consume it.
> > > > >
> > > > > So your suggestion fits the new scenario better. I'll drop the
> > > > > reserve_shrink mount option, and send a new patch that reserves
> > > > > shrunk_blocks inside f2fs_resize_fs() and deducts it in
> > > > > get_available_block_count() for all callers.
> > > >
> > > > Hi Daeho,
> > > >
> > > > I see, thanks for the sync-up.
> > > >
> > > > BTW, could you please add above background information into commit =
message?
> > > > I think it can help developer/reviewer to know more background info=
.
> > > >
> > > > Thanks,
> > > >
> > > > >
> > > > > Thanks for the review,
> > > > >
> > > > >>
> > > > >>>
> > > > >>>>
> > > > >>>>>
> > > > >>>>> Thanks,
> > > > >>>>> Daeho
> > > > >>>>>
> > > > >>>>>>
> > > > >>>>>>>
> > > > >>>>>>> To resolve this, introduce a dedicated reserve_shrink=3D<bl=
ocks>
> > > > >>>>>>> mount option:
> > > > >>>>>>> 1. Symmetrically mirrors reserve_root=3D<blocks> in block u=
nits to
> > > > >>>>>>>      pre-reserve space specifically for subsequent filesyst=
em shrinkage.
> > > > >>>>>>> 2. In get_available_block_count(), unconditionally deducts
> > > > >>>>>>>      reserve_shrink_blocks for all callers, strictly reject=
ing all
> > > > >>>>>>>      allocations (including root / CAP_SYS_RESOURCE) once a=
vailable blocks
> > > > >>>>>>>      are exhausted.
> > > > >>>>>>> 3. In f2fs_statfs(), deducts reserve_shrink_blocks from f_b=
free (and
> > > > >>>>>>>      f_bavail) so that filesystem statistics accurately ref=
lect usable space.
> > > > >>>>>>> 4. In f2fs_resize_fs(), automatically resets reserve_shrink=
_blocks to 0
> > > > >>>>>>>      and clears F2FS_MOUNT_RESERVE_SHRINK upon successful s=
hrink completion,
> > > > >>>>>>>      releasing any remaining reservation.
> > > > >>>>>>> 5. In sysfs: reserved_blocks, subtracts reserve_shrink_bloc=
ks when
> > > > >>>>>>>      validating the upper limit of configurable reserved bl=
ocks.
> > > > >>>>>>>
> > > > >>>>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > > > >>>>>>> ---
> > > > >>>>>>> v2:
> > > > >>>>>>>    - Split out mount option bitmask expansion (BIT_ULL) int=
o a separate
> > > > >>>>>>>      prerequisite patch (Patch 1/2).
> > > > >>>>>>> ---
> > > > >>>>>>>    Documentation/filesystems/f2fs.rst |  7 +++++
> > > > >>>>>>>    fs/f2fs/f2fs.h                     |  9 ++++++
> > > > >>>>>>>    fs/f2fs/gc.c                       |  5 ++++
> > > > >>>>>>>    fs/f2fs/super.c                    | 47 ++++++++++++++++=
++++++++++++++
> > > > >>>>>>>    fs/f2fs/sysfs.c                    | 13 +++++++--
> > > > >>>>>>>    5 files changed, 79 insertions(+), 2 deletions(-)
> > > > >>>>>>>
> > > > >>>>>>> diff --git a/Documentation/filesystems/f2fs.rst b/Documenta=
tion/filesystems/f2fs.rst
> > > > >>>>>>> index 771216f45207..dbdc5d5a83ad 100644
> > > > >>>>>>> --- a/Documentation/filesystems/f2fs.rst
> > > > >>>>>>> +++ b/Documentation/filesystems/f2fs.rst
> > > > >>>>>>> @@ -191,6 +191,13 @@ reserve_node=3D%d           Support co=
nfiguring reserved nodes which are used for
> > > > >>>>>>>                         gid, the default limit is 12.5% of =
all nodes.
> > > > >>>>>>>    resuid=3D%d            The user ID which may use the res=
erved blocks and nodes.
> > > > >>>>>>>    resgid=3D%d            The group ID which may use the re=
served blocks and nodes.
> > > > >>>>>>> +reserve_shrink=3D%d     Support pre-reserving space for su=
bsequent filesystem
> > > > >>>>>>> +                      shrinkage (e.g. during partition res=
izing or FOTA),
> > > > >>>>>>> +                      unit: blocks. Unlike reserve_root, a=
llocations from
> > > > >>>>>>> +                      this reserved space strictly reject =
all callers
> > > > >>>>>>> +                      (including root / CAP_SYS_RESOURCE).=
 Once the
> > > > >>>>>>> +                      filesystem is successfully shrunk vi=
a resize, this
> > > > >>>>>>> +                      value is automatically reset to 0.
> > > > >>>>>>>    fault_injection=3D%d   Enable fault injection in all sup=
ported types with
> > > > >>>>>>>                         specified injection rate.
> > > > >>>>>>>    fault_type=3D%d                Support configuring fault=
 injection type, should be
> > > > >>>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > >>>>>>> index 4aaf29de3f6f..48a91771be95 100644
> > > > >>>>>>> --- a/fs/f2fs/f2fs.h
> > > > >>>>>>> +++ b/fs/f2fs/f2fs.h
> > > > >>>>>>> @@ -145,6 +145,7 @@ enum f2fs_mount_opt {
> > > > >>>>>>>         */
> > > > >>>>>>>        F2FS_MOUNT_LAZYTIME,
> > > > >>>>>>>        F2FS_MOUNT_RESERVE_NODE,
> > > > >>>>>>> +     F2FS_MOUNT_RESERVE_SHRINK,
> > > > >>>>>>>    };
> > > > >>>>>>>
> > > > >>>>>>>    #define F2FS_OPTION(sbi)    ((sbi)->mount_opt)
> > > > >>>>>>> @@ -226,6 +227,7 @@ struct f2fs_mount_info {
> > > > >>>>>>>        unsigned long long opt;
> > > > >>>>>>>        block_t root_reserved_blocks;   /* root reserved blo=
cks */
> > > > >>>>>>>        block_t root_reserved_nodes;    /* root reserved nod=
es */
> > > > >>>>>>> +     block_t reserve_shrink_blocks;  /* reserve blocks for=
 shrink */
> > > > >>>>>>>        kuid_t s_resuid;                /* reserved blocks f=
or uid */
> > > > >>>>>>>        kgid_t s_resgid;                /* reserved blocks f=
or gid */
> > > > >>>>>>>        int active_logs;                /* # of active logs =
*/
> > > > >>>>>>> @@ -2658,6 +2660,13 @@ static inline unsigned int get_avail=
able_block_count(struct f2fs_sb_info *sbi,
> > > > >>>>>>>        if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved=
_root(sbi, inode, cap))
> > > > >>>>>>>                avail_user_block_count -=3D F2FS_OPTION(sbi)=
.root_reserved_blocks;
> > > > >>>>>>>
> > > > >>>>>>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > > > >>>>>>> +             if (avail_user_block_count > F2FS_OPTION(sbi)=
.reserve_shrink_blocks)
> > > > >>>>>>> +                     avail_user_block_count -=3D F2FS_OPTI=
ON(sbi).reserve_shrink_blocks;
> > > > >>>>>>> +             else
> > > > >>>>>>> +                     avail_user_block_count =3D 0;
> > > > >>>>>>> +     }
> > > > >>>>>>> +
> > > > >>>>>>>        if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))=
 {
> > > > >>>>>>>                if (avail_user_block_count > sbi->unusable_b=
lock_count)
> > > > >>>>>>>                        avail_user_block_count -=3D sbi->unu=
sable_block_count;
> > > > >>>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > > > >>>>>>> index bc22dde1cb30..556c4793478d 100644
> > > > >>>>>>> --- a/fs/f2fs/gc.c
> > > > >>>>>>> +++ b/fs/f2fs/gc.c
> > > > >>>>>>> @@ -2492,6 +2492,11 @@ int f2fs_resize_fs(struct file *filp=
, __u64 block_count)
> > > > >>>>>>>                spin_lock(&sbi->stat_lock);
> > > > >>>>>>>                sbi->user_block_count +=3D shrunk_blocks;
> > > > >>>>>>>                spin_unlock(&sbi->stat_lock);
> > > > >>>>>>> +     } else if (test_opt(sbi, RESERVE_SHRINK)) {
> > > > >>>>>>> +             spin_lock(&sbi->stat_lock);
> > > > >>>>>>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D 0;
> > > > >>>>>>> +             clear_opt(sbi, RESERVE_SHRINK);
> > > > >>>>>>> +             spin_unlock(&sbi->stat_lock);
> > > > >>>>>>>        }
> > > > >>>>>>>    out_err:
> > > > >>>>>>>        f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
> > > > >>>>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > >>>>>>> index a5e109bdcebc..58f33750b2a8 100644
> > > > >>>>>>> --- a/fs/f2fs/super.c
> > > > >>>>>>> +++ b/fs/f2fs/super.c
> > > > >>>>>>> @@ -196,6 +196,7 @@ enum {
> > > > >>>>>>>        Opt_data_flush,
> > > > >>>>>>>        Opt_reserve_root,
> > > > >>>>>>>        Opt_reserve_node,
> > > > >>>>>>> +     Opt_reserve_shrink,
> > > > >>>>>>>        Opt_resgid,
> > > > >>>>>>>        Opt_resuid,
> > > > >>>>>>>        Opt_mode,
> > > > >>>>>>> @@ -328,6 +329,7 @@ static const struct fs_parameter_spec f=
2fs_param_specs[] =3D {
> > > > >>>>>>>        fsparam_flag("data_flush", Opt_data_flush),
> > > > >>>>>>>        fsparam_u32("reserve_root", Opt_reserve_root),
> > > > >>>>>>>        fsparam_u32("reserve_node", Opt_reserve_node),
> > > > >>>>>>> +     fsparam_u32("reserve_shrink", Opt_reserve_shrink),
> > > > >>>>>>>        fsparam_gid("resgid", Opt_resgid),
> > > > >>>>>>>        fsparam_uid("resuid", Opt_resuid),
> > > > >>>>>>>        fsparam_enum("mode", Opt_mode, f2fs_param_mode),
> > > > >>>>>>> @@ -407,6 +409,7 @@ static match_table_t f2fs_checkpoint_to=
kens =3D {
> > > > >>>>>>>    #define F2FS_SPEC_lookup_mode                       (1 <=
< 24)
> > > > >>>>>>>    #define F2FS_SPEC_reserve_node                      (1 <=
< 25)
> > > > >>>>>>>    #define F2FS_SPEC_resizable_tail_secno              (1 <=
< 26)
> > > > >>>>>>> +#define F2FS_SPEC_reserve_shrink             (1 << 27)
> > > > >>>>>>>
> > > > >>>>>>>    struct f2fs_fs_context {
> > > > >>>>>>>        struct f2fs_mount_info info;
> > > > >>>>>>> @@ -550,6 +553,27 @@ static inline void limit_reserve_root(=
struct f2fs_sb_info *sbi)
> > > > >>>>>>>                                           F2FS_OPTION(sbi).=
s_resgid));
> > > > >>>>>>>    }
> > > > >>>>>>>
> > > > >>>>>>> +static inline void limit_reserve_shrink(struct f2fs_sb_inf=
o *sbi)
> > > > >>>>>>> +{
> > > > >>>>>>> +     block_t block_limit;
> > > > >>>>>>> +
> > > > >>>>>>> +     if (!test_opt(sbi, RESERVE_SHRINK))
> > > > >>>>>>> +             return;
> > > > >>>>>>> +
> > > > >>>>>>> +     block_limit =3D sbi->user_block_count - sbi->reserved=
_blocks;
> > > > >>>>>>> +     if (test_opt(sbi, RESERVE_ROOT)) {
> > > > >>>>>>> +             if (block_limit > F2FS_OPTION(sbi).root_reser=
ved_blocks)
> > > > >>>>>>> +                     block_limit -=3D F2FS_OPTION(sbi).roo=
t_reserved_blocks;
> > > > >>>>>>> +             else
> > > > >>>>>>> +                     block_limit =3D 0;
> > > > >>>>>>> +     }
> > > > >>>>>>> +     if (F2FS_OPTION(sbi).reserve_shrink_blocks > block_li=
mit) {
> > > > >>>>>>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D bl=
ock_limit;
> > > > >>>>>>> +             f2fs_info(sbi, "Reduce reserved blocks for sh=
rink =3D %u",
> > > > >>>>>>> +                       F2FS_OPTION(sbi).reserve_shrink_blo=
cks);
> > > > >>>>>>> +     }
> > > > >>>>>>> +}
> > > > >>>>>>> +
> > > > >>>>>>>    static inline void adjust_unusable_cap_perc(struct f2fs_=
sb_info *sbi)
> > > > >>>>>>>    {
> > > > >>>>>>>        if (!F2FS_OPTION(sbi).unusable_cap_perc)
> > > > >>>>>>> @@ -953,6 +977,14 @@ static int f2fs_parse_param(struct fs_=
context *fc, struct fs_parameter *param)
> > > > >>>>>>>                F2FS_CTX_INFO(ctx).root_reserved_nodes =3D r=
esult.uint_32;
> > > > >>>>>>>                ctx->spec_mask |=3D F2FS_SPEC_reserve_node;
> > > > >>>>>>>                break;
> > > > >>>>>>> +     case Opt_reserve_shrink:
> > > > >>>>>>> +             if (result.uint_32)
> > > > >>>>>>> +                     ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_S=
HRINK);
> > > > >>>>>>> +             else
> > > > >>>>>>> +                     ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE=
_SHRINK);
> > > > >>>>>>> +             F2FS_CTX_INFO(ctx).reserve_shrink_blocks =3D =
result.uint_32;
> > > > >>>>>>> +             ctx->spec_mask |=3D F2FS_SPEC_reserve_shrink;
> > > > >>>>>>> +             break;
> > > > >>>>>>>        case Opt_resuid:
> > > > >>>>>>>                F2FS_CTX_INFO(ctx).s_resuid =3D result.uid;
> > > > >>>>>>>                ctx->spec_mask |=3D F2FS_SPEC_resuid;
> > > > >>>>>>> @@ -1775,6 +1807,9 @@ static void f2fs_apply_options(struct=
 fs_context *fc, struct super_block *sb)
> > > > >>>>>>>        if (ctx->spec_mask & F2FS_SPEC_reserve_node)
> > > > >>>>>>>                F2FS_OPTION(sbi).root_reserved_nodes =3D
> > > > >>>>>>>                                        F2FS_CTX_INFO(ctx).r=
oot_reserved_nodes;
> > > > >>>>>>> +     if (ctx->spec_mask & F2FS_SPEC_reserve_shrink)
> > > > >>>>>>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D
> > > > >>>>>>> +                                     F2FS_CTX_INFO(ctx).re=
serve_shrink_blocks;
> > > > >>>>>>>        if (ctx->spec_mask & F2FS_SPEC_resgid)
> > > > >>>>>>>                F2FS_OPTION(sbi).s_resgid =3D F2FS_CTX_INFO(=
ctx).s_resgid;
> > > > >>>>>>>        if (ctx->spec_mask & F2FS_SPEC_resuid)
> > > > >>>>>>> @@ -2300,6 +2335,13 @@ static int f2fs_statfs(struct dentry=
 *dentry, struct kstatfs *buf)
> > > > >>>>>>>        buf->f_bfree =3D user_block_count - valid_user_block=
s(sbi) -
> > > > >>>>>>>                                                sbi->current=
_reserved_blocks;
> > > > >>>>>>>
> > > > >>>>>>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > > > >>>>>>> +             if (buf->f_bfree > F2FS_OPTION(sbi).reserve_s=
hrink_blocks)
> > > > >>>>>>> +                     buf->f_bfree -=3D F2FS_OPTION(sbi).re=
serve_shrink_blocks;
> > > > >>>>>>> +             else
> > > > >>>>>>> +                     buf->f_bfree =3D 0;
> > > > >>>>>>> +     }
> > > > >>>>>>> +
> > > > >>>>>>>        if (unlikely(buf->f_bfree <=3D sbi->unusable_block_c=
ount))
> > > > >>>>>>>                buf->f_bfree =3D 0;
> > > > >>>>>>>        else
> > > > >>>>>>> @@ -2524,6 +2566,9 @@ static int f2fs_show_options(struct s=
eq_file *seq, struct dentry *root)
> > > > >>>>>>>                                        F2FS_OPTION(sbi).s_r=
esuid),
> > > > >>>>>>>                                from_kgid_munged(&init_user_=
ns,
> > > > >>>>>>>                                        F2FS_OPTION(sbi).s_r=
esgid));
> > > > >>>>>>> +     if (test_opt(sbi, RESERVE_SHRINK))
> > > > >>>>>>> +             seq_printf(seq, ",reserve_shrink=3D%u",
> > > > >>>>>>> +                             F2FS_OPTION(sbi).reserve_shri=
nk_blocks);
> > > > >>>>>>>    #ifdef CONFIG_F2FS_FAULT_INJECTION
> > > > >>>>>>>        if (test_opt(sbi, FAULT_INJECTION)) {
> > > > >>>>>>>                seq_printf(seq, ",fault_injection=3D%u",
> > > > >>>>>>> @@ -3105,6 +3150,7 @@ static int __f2fs_remount(struct fs_c=
ontext *fc, struct super_block *sb)
> > > > >>>>>>>
> > > > >>>>>>>        adjust_pinned_area_boundary(sbi);
> > > > >>>>>>>        limit_reserve_root(sbi);
> > > > >>>>>>> +     limit_reserve_shrink(sbi);
> > > > >>>>>>>        fc->sb_flags =3D (flags & ~SB_LAZYTIME) | (sb->s_fla=
gs & SB_LAZYTIME);
> > > > >>>>>>>
> > > > >>>>>>>        sbi->umount_lock_holder =3D NULL;
> > > > >>>>>>> @@ -5322,6 +5368,7 @@ static int f2fs_fill_super(struct sup=
er_block *sb, struct fs_context *fc)
> > > > >>>>>>>        sbi->current_reserved_blocks =3D 0;
> > > > >>>>>>>        sbi->alias_reserved_blocks =3D 0;
> > > > >>>>>>>        limit_reserve_root(sbi);
> > > > >>>>>>> +     limit_reserve_shrink(sbi);
> > > > >>>>>>>        adjust_unusable_cap_perc(sbi);
> > > > >>>>>>>
> > > > >>>>>>>        f2fs_init_extent_cache_info(sbi);
> > > > >>>>>>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > > > >>>>>>> index aaca9ed9b169..d61940d095b4 100644
> > > > >>>>>>> --- a/fs/f2fs/sysfs.c
> > > > >>>>>>> +++ b/fs/f2fs/sysfs.c
> > > > >>>>>>> @@ -591,9 +591,18 @@ static ssize_t __sbi_store(struct f2fs=
_attr *a,
> > > > >>>>>>>        }
> > > > >>>>>>>    #endif
> > > > >>>>>>>        if (a->struct_type =3D=3D RESERVED_BLOCKS) {
> > > > >>>>>>> +             unsigned long limit;
> > > > >>>>>>> +
> > > > >>>>>>>                spin_lock(&sbi->stat_lock);
> > > > >>>>>>> -             if (t > (unsigned long)(sbi->user_block_count=
 -
> > > > >>>>>>> -                             F2FS_OPTION(sbi).root_reserve=
d_blocks)) {
> > > > >>>>>>> +             limit =3D sbi->user_block_count -
> > > > >>>>>>> +                             F2FS_OPTION(sbi).root_reserve=
d_blocks;
> > > > >>>>>>> +             if (test_opt(sbi, RESERVE_SHRINK)) {
> > > > >>>>>>> +                     if (limit > F2FS_OPTION(sbi).reserve_=
shrink_blocks)
> > > > >>>>>>> +                             limit -=3D F2FS_OPTION(sbi).r=
eserve_shrink_blocks;
> > > > >>>>>>> +                     else
> > > > >>>>>>> +                             limit =3D 0;
> > > > >>>>>>> +             }
> > > > >>>>>>> +             if (t > limit) {
> > > > >>>>>>>                        spin_unlock(&sbi->stat_lock);
> > > > >>>>>>>                        return -EINVAL;
> > > > >>>>>>>                }
> > > > >>>>>>
> > > > >>>>
> > > >
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
