Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA5C2264A9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166098; cv=pass; b=l8D077wLwlHQInkWKKr60DpT8srJyvgEUrv7OMEXJEv4IJcliWrWmwChA6S6QRWzUa051J7y6Cs9rfF2fGL6DIWs0Uhh9JBikBRu5mV9eC7qqkErXrBjlCvqWbAZnLdniRKM0i9xioChRfYm1ButBWE4q3tkZ6kO8JoRWrYRAQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166098; c=relaxed/simple;
	bh=OW/vwBGD8wjJMVEsE3IPodmHgbiHZd7AYptpV/tvUJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtAQOjmAW2jnF6EahsL8kxvGsTHErEAQQ2RCG+mAS9Apf62PL1Y7Jif3A57amyIMDpO/+sk7rzs53VQwSQZbfYyD8Em3aNdn9UqN6PpieiF3UHZxq2vHcM38FnTpnc2KmfcWQGyULG2zBriB4xPneAJYeB2EEFvWW19s/PCMLYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aouFzqx9; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aouFzqx9"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso85537e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166094; cv=none;
        d=google.com; s=arc-20260327;
        b=j9/YrfqKlFvS1jb+hztYko2YebFpKKeijMTTE8cDXF1jDiG0nS8j7s3LWVKRxwF1Kz
         c6xBhNIPqBtHemUFF0AYtxIyd/lnfErLuStx+4CW6LVec9+5sZPbdOXqLUcfsn23dPFq
         Be3ezApNKUazR4z23zr3nrAbvuRV79IZqehjn8DZBADybhk5OpDA5nCIjyf/6kt9I6FF
         AURsEshVGsUaPsJIMLXcipZXngIej0igIQC21idaxlGTDrY4NQOKtJrTwNGFmC4vobdb
         Wd82uXuaZYRCm6YyQkl8vO6tK+GJ3tGYaCIgtvfW3w064XmA9l0z0fcuTtOY6HcddNMW
         V4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I1WJU/OQ2CI4IVniqKQ2vPFgqeH2y6WLVJMOBZUsld0=;
        fh=DQFGKzxY310ciVb6YF5A7ZbgoR+tujTffl4RxMWjUx8=;
        b=LQJ+l4o5Gj3RZm9XcmuM7jlTgAQ/z8sENQMagfW0LLqfjjA3c3AZU+wtAyFExVYW1r
         BTHfsqbj8CR372XGicsZJwpNa0ERmy0XOn+QPCDDO0sHrjNvo0HzByAnXSC/LSyPQtqj
         5kSO95dcW0hzKKxL/2VjXL1FzolP22E8MGRjkaq4lTZvb3n3R96TtQpl+poIRWGtXtis
         sYTVNZvs0zuwFWAIwZenjPF/TCfXPijdKZbt8gFSV2kps1XVDrJ1mZj9oUojDputA5Kv
         Aq5+8llpqgVJbv1Kesgh4mI4wqVJaVCG9Bdiqc9duvj/AQW37z1JiNDNTQeNgFPfPOS6
         IAcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166094; x=1792770894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I1WJU/OQ2CI4IVniqKQ2vPFgqeH2y6WLVJMOBZUsld0=;
        b=aouFzqx9gKbS85xGZHc4arR4BLgnddBJYrFZtgSk4jGKiGiB/P0SIJZPk8TRIBz/ji
         KRVObK0cJh0ia+qsHcOojBgmrMmk89rec0bTBDujpyGvaQFHMm4Xl7b0XNmk7esJhyzM
         h1twxfwzVEpsXfJkPOv2c9k5CxjzVA+65OHSlrafEvVIWq89Enp45eAxbRvLPCB9ysWE
         tjmdtpkwClEfx2QfrOtTWi2yJzvSic8JdZPJY5kRiHLW+MPAKlLuXI+rrZn7PUYB+5bQ
         arwen8gqbbHFQTja3O4j2nVom5/CKvlVtDr9rPBAMQoe/pptIXKJ96MqfY58f80pY0Z6
         tYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166094; x=1792770894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1WJU/OQ2CI4IVniqKQ2vPFgqeH2y6WLVJMOBZUsld0=;
        b=f0E0ZiingkvagohnHhgcub6FQZh3Mkr8oP4WzDJefIhVIo1Uew3QbVq1R9+x7usUD0
         6ZXzyQqr2uWlhAwLmBULR1PP6G3Sh/oW9aK1m6ZZo1kMU9tTtoU8CmwJv9YeiwxgV5wV
         JZZL+JEvbgFDbxuQ7HVYl0MHf1k6RTrN12FnIzuK7a9tl3eMfQUtU0kQp/wtl2zLoGpy
         MlhZeXytDxIAjxaaGLsVMBADcMJ8iMmnfvNvC3u44egRk2PahCrKe67oXZIpG+uAuQp7
         ZBYumKyJa/JV0NFr+cYPrVw52mKaG9W6p0C7KkZZTQFiAO+INnm75Z7v3d3bahNvfLk4
         IPxg==
X-Forwarded-Encrypted: i=1; AKwUvBwm6AfNUnyHt9Zgpu/XFr05v8GVVX9tXV/uO5GzGrbRZg7v/D8bG4vP5zglOJtl2jfyQ4LEzgooWo6Xgus=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJamUGZX/HeMKqRj/iLRZKCWceKo9r8lfZwU475beu5y7yTqeM
	OXorA1e1upViNlfmxVZUf3t4XW73peMlaC2YLqUEvQTSuZ1gCJWeEqjMQBG+yDGQc6fL7IPo9uB
	6n7HRRh8zR07nQYbvbdNBM8r6QNDtyyU=
X-Gm-Gg: AYBFou2USzECRgL3bUjgc0nMkBUmAx+NiMjo95IG4QRwWKKOWjRqtZMIdtNPjtdW0Vb
	N+6OD1XlRp6Iytcw7R61YFlSgGYBAS6DtyIkM0GMZQ8G5E0pjX+iEbe0DN6gOcQSZrs1ib1cRaO
	PeK4s6wW4B+pe9zedGY6VEyHmvp69z71FYJ255YudcNFvkQNvGBGqDBbJlMDStJWMql0+FBAbo+
	yknn9bqC6ohlu8f+tUcdJSAT+px9QTHCvBfXAMM3PJgYFIGZ/WUumnyPCrKnrOHkYu3nZV52zyk
	V9ia9haDrQiuaiLPRry0ZceffRP8PNE5A69PNDVh5FLO0hegbdIgRZronvhKOIguuyrv+hhb3oj
	SMkJ/7F65r+Q1duvFkwmO2yWUMNjJogvyTiqM4ycrFrVw
X-Received: by 2002:a05:6512:2216:b0:5be:4e1b:5fa2 with SMTP id
 2adb3069b0e04-5be4e1b60d0mr601186e87.52.1792166093663; Fri, 16 Oct 2026
 08:54:53 -0700 (PDT)
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
 <CACOAw_yvwehaFqh-7ufKcZRjfT7AGPEB+aR-ajutLXYE=EX+Jw@mail.gmail.com>
 <0aedc5af-1273-4510-a8fa-5ddf2281b699@kernel.org> <atJHn7SZ-gMf_alX@google.com>
In-Reply-To: <atJHn7SZ-gMf_alX@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 16 Oct 2026 08:54:39 -0700
X-Gm-Features: AclHuK-C34_gveklf7jAFfJ3AuWyNvaUqmLXafOg8A2m8jN-tgx7sO2L-qyUv2g
Message-ID: <CACOAw_xPgPbPYotMFUFvkQtofvs1Yz+74tk8JHmhN5LRabwTjg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce reserve_shrink mount
 option for filesystem shrinkage
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com, 
	Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 8:49=E2=80=AFAM Jaegeuk Kim <jaegeuk@kernel.org> wr=
ote:
>
> Are we waiting for v3 along with sysfs's feature flag, right?

Hi Jaegeuk,

These two are for that.

[PATCH] f2fs: reserve space to be shrunk during resize_fs
[PATCH] f2fs: expose resizable_tail feature via sysfs

Thanks,


>
> On 10/14, Chao Yu wrote:
> > On 10/14/26 07:27, Daeho Jeong wrote:
> > > On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Daeho Jeong <daeho43@gmail.co=
m> wrote:
> > >>
> > >> On Mon, Oct 12, 2026 at 7:15=E2=80=AFPM Daeho Jeong <daeho43@gmail.c=
om> wrote:
> > >>>
> > >>> On Mon, Oct 12, 2026 at 6:27=E2=80=AFPM Chao Yu <chao@kernel.org> w=
rote:
> > >>>>
> > >>>> On 9/15/26 00:24, Daeho Jeong wrote:
> > >>>>> On Mon, Sep 14, 2026 at 12:15=E2=80=AFAM Chao Yu <chao@kernel.org=
> wrote:
> > >>>>>>
> > >>>>>> On 9/11/26 22:35, Daeho Jeong wrote:
> > >>>>>>> From: Daeho Jeong <daehojeong@google.com>
> > >>>>>>>
> > >>>>>>> When preparing for subsequent online filesystem shrinkage (e.g.=
, during
> > >>>>>>> partition resizing or FOTA updates), sufficient free space must=
 be
> > >>>>>>> preserved so that valid data blocks can be evacuated and the fi=
lesystem
> > >>>>>>> can safely shrink.
> > >>>>>>>
> > >>>>>>> Existing reserve_root cannot prevent space exhaustion by privil=
eged root
> > >>>>>>> processes (such as OTA updaters, package managers, and system d=
aemons
> > >>>>>>> running with CAP_SYS_RESOURCE), which can allocate blocks from =
the root
> > >>>>>>> reserve and lead to resize failures due to lack of space. Moreo=
ver,
> > >>>>>>
> > >>>>>> I'm thinking about reusing existing mount option AMAP, is there =
any problem
> > >>>>>> to use "reserve_root=3D" w/ 128mb+shrunk_size_mb when we execute=
 online filesyste
> > >>>>>> shrinkage? once it is done, recover w/ reserve_root=3D128mb.
> > >>>>>>
> > >>>>>>> runtime configurable reserved_blocks represents permanent GC an=
d metadata
> > >>>>>>> headroom that must persist after resize, which would cause doub=
le-counting
> > >>>>>>> if inflated for shrinkage.
> > >>>>>>
> > >>>>>> I didn't get it, can you please explain a bit more about this is=
sue?
> > >>>>>>
> > >>>>>> Thanks,
> > >>>>>
> > >>>>> Hi Chao,
> > >>>>>
> > >>>>> There are three main reasons why reserve_root cannot be reused:
> > >>>>>
> > >>>>> 1. Double-counting in f2fs_resize_fs():
> > >>>>> f2fs_resize_fs() checks:
> > >>>>>    shrunk_blocks + valid_user_blocks + root_reserved_blocks + ...=
 >
> > >>>>> user_block_count
> > >>>>> Since root_reserved_blocks must persist after
> > >>>>> resize, inflating it by shrunk_size causes shrunk_size to be coun=
ted twice,
> > >>>>> requiring 2x free space and triggering false -ENOSPC. Resetting i=
t right before
> > >>>>> resize also introduces a race window where concurrent writes can
> > >>>>> consume the space.
> > >>>>> 2. Root can allocate from reserve_root:
> > >>>>> reserve_root allows root/CAP_SYS_RESOURCE processes to allocate. =
During OTA,
> > >>>>> system daemons and updaters can eat into the reserved blocks.
> > >>>>> reserve_shrink strictly blocks all callers, including root.
> > >>>>
> > >>>> Daeho, sorry for the delay.
> > >>>>
> > >>>> Thanks for the explanation, I see, it's not appropriate to reuse
> > >>>> "reserve_root=3D" option for your requirement.
> > >>>>
> > >>>> May I ask that do you need to keep the reservation for a long time=
 before resize,
> > >>>> e.g. from OTA starts till shrink happens? or is it enough to make =
it reserved
> > >>>> during f2fs_resize_fs()?
> > >>>>
> > >>>> If the latter, can we just reserve shrunk_blocks in f2fs_resize_fs=
()
> > >>>> directly, w/ the same way we did for f2fs_ioc_reserve_dev_alias()?=
 Then
> > >>>> we don't need a new mount option. Something like:
> > >>>>
> > >>>> f2fs_resize_fs()
> > >>>>          spin_lock(&sbi->stat_lock);
> > >>>>          if (shrunk_blocks + valid_user_blocks(sbi) + ... > sbi->u=
ser_block_count)
> > >>>>              err =3D -ENOSPC;
> > >>>>          else
> > >>>>              sbi->resize_reserved_blocks +=3D shrunk_blocks;
> > >>>>          spin_unlock(&sbi->stat_lock);
> > >>>>
> > >>>>          free_segment_range(sbi, secs, true);
> > >>>>          ...
> > >>>>          freeze_super();
> > >>>>          ...
> > >>>>          spin_lock(&sbi->stat_lock);
> > >>>>          sbi->user_block_count -=3D shrunk_blocks;
> > >>>>          sbi->resize_reserved_blocks -=3D shrunk_blocks;
> > >>>>          spin_unlock(&sbi->stat_lock);
> > >>>>          ...
> > >>>>          /* error path: sbi->resize_reserved_blocks -=3D shrunk_bl=
ocks */
> > >>>>
> > >>>> and in get_available_block_count(), deduct resize_reserved_blocks =
as we did for
> > >>>> alias_reserved_blocks, so that no one, including root, can allocat=
e from the
> > >>>> reserved space during resize.
> > >>>>
> > >>>> Thanks,
> > >>>
> > >>> Hi Chao,
> > >>>
> > >>> Thanks for the suggestion.
> > >>>
> > >>> Unfortunately, reserving only inside f2fs_resize_fs() is not enough=
 for
> > >>> our use case. We need the reservation to be in place for a long tim=
e
> > >>> before the resize, i.e. from the moment we decide to shrink (mount =
time)
> > >>> until F2FS_IOC_RESIZE_FS is actually issued. During that window,
> > >>> privileged processes (OTA updater, package manager, system daemons)=
 keep
> > >>> writing to the filesystem. If they consume the free space, the ENOS=
PC
> > >>> check at the entry of f2fs_resize_fs() fails right away, so there i=
s no
> > >>> chance to reserve anything inside the ioctl. Also, statfs would kee=
p
> > >>> reporting space that is going to be cut off.
> > >>>
> > >>> That's why it's a mount option: the reservation is applied before a=
ny
> > >>> userspace write can happen, it's honored for all callers including =
root,
> > >>> it's reflected in statfs, and it's released automatically once the
> > >>> shrink succeeds.
> > >>>
> > >>> Thanks,
> > >>
> > >> Plus,
> > >>
> > >> Please think about the FOTA scenario below:
> > >>
> > >> 1) The device downloads the FOTA image. At this point, we check that
> > >>    there is enough free space for the shrink.
> > >> 2) The device reboots to apply the update.
> > >> 3) After the reboot, /data is mounted and F2FS_IOC_RESIZE_FS is issu=
ed
> > >>    to shrink the filesystem.
> > >>
> > >> Between 1) and 3), there is a long window that also spans a reboot.
> > >>
> > >> Thanks,
> > >
> > > Hi Chao,
> > >
> > > Sorry for the confusion. Our scenario has recently changed.
> > >
> > > Now the shrink is triggered at OTA install time, before the reboot: t=
he
> > > updater figures out how much space the new partitions need, and issue=
s
> > > F2FS_IOC_RESIZE_FS on the mounted /data right away. So we don't need =
to
> > > keep the reservation for a long time before the resize anymore. What =
we
> > > need is to protect the space during f2fs_resize_fs(), between the
> > > dry-run GC and freeze_super(), where other processes (including root)
> > > can consume it.
> > >
> > > So your suggestion fits the new scenario better. I'll drop the
> > > reserve_shrink mount option, and send a new patch that reserves
> > > shrunk_blocks inside f2fs_resize_fs() and deducts it in
> > > get_available_block_count() for all callers.
> >
> > Hi Daeho,
> >
> > I see, thanks for the sync-up.
> >
> > BTW, could you please add above background information into commit mess=
age?
> > I think it can help developer/reviewer to know more background info.
> >
> > Thanks,
> >
> > >
> > > Thanks for the review,
> > >
> > >>
> > >>>
> > >>>>
> > >>>>>
> > >>>>> Thanks,
> > >>>>> Daeho
> > >>>>>
> > >>>>>>
> > >>>>>>>
> > >>>>>>> To resolve this, introduce a dedicated reserve_shrink=3D<blocks=
>
> > >>>>>>> mount option:
> > >>>>>>> 1. Symmetrically mirrors reserve_root=3D<blocks> in block units=
 to
> > >>>>>>>      pre-reserve space specifically for subsequent filesystem s=
hrinkage.
> > >>>>>>> 2. In get_available_block_count(), unconditionally deducts
> > >>>>>>>      reserve_shrink_blocks for all callers, strictly rejecting =
all
> > >>>>>>>      allocations (including root / CAP_SYS_RESOURCE) once avail=
able blocks
> > >>>>>>>      are exhausted.
> > >>>>>>> 3. In f2fs_statfs(), deducts reserve_shrink_blocks from f_bfree=
 (and
> > >>>>>>>      f_bavail) so that filesystem statistics accurately reflect=
 usable space.
> > >>>>>>> 4. In f2fs_resize_fs(), automatically resets reserve_shrink_blo=
cks to 0
> > >>>>>>>      and clears F2FS_MOUNT_RESERVE_SHRINK upon successful shrin=
k completion,
> > >>>>>>>      releasing any remaining reservation.
> > >>>>>>> 5. In sysfs: reserved_blocks, subtracts reserve_shrink_blocks w=
hen
> > >>>>>>>      validating the upper limit of configurable reserved blocks=
.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > >>>>>>> ---
> > >>>>>>> v2:
> > >>>>>>>    - Split out mount option bitmask expansion (BIT_ULL) into a =
separate
> > >>>>>>>      prerequisite patch (Patch 1/2).
> > >>>>>>> ---
> > >>>>>>>    Documentation/filesystems/f2fs.rst |  7 +++++
> > >>>>>>>    fs/f2fs/f2fs.h                     |  9 ++++++
> > >>>>>>>    fs/f2fs/gc.c                       |  5 ++++
> > >>>>>>>    fs/f2fs/super.c                    | 47 ++++++++++++++++++++=
++++++++++
> > >>>>>>>    fs/f2fs/sysfs.c                    | 13 +++++++--
> > >>>>>>>    5 files changed, 79 insertions(+), 2 deletions(-)
> > >>>>>>>
> > >>>>>>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation=
/filesystems/f2fs.rst
> > >>>>>>> index 771216f45207..dbdc5d5a83ad 100644
> > >>>>>>> --- a/Documentation/filesystems/f2fs.rst
> > >>>>>>> +++ b/Documentation/filesystems/f2fs.rst
> > >>>>>>> @@ -191,6 +191,13 @@ reserve_node=3D%d           Support config=
uring reserved nodes which are used for
> > >>>>>>>                         gid, the default limit is 12.5% of all =
nodes.
> > >>>>>>>    resuid=3D%d            The user ID which may use the reserve=
d blocks and nodes.
> > >>>>>>>    resgid=3D%d            The group ID which may use the reserv=
ed blocks and nodes.
> > >>>>>>> +reserve_shrink=3D%d     Support pre-reserving space for subseq=
uent filesystem
> > >>>>>>> +                      shrinkage (e.g. during partition resizin=
g or FOTA),
> > >>>>>>> +                      unit: blocks. Unlike reserve_root, alloc=
ations from
> > >>>>>>> +                      this reserved space strictly reject all =
callers
> > >>>>>>> +                      (including root / CAP_SYS_RESOURCE). Onc=
e the
> > >>>>>>> +                      filesystem is successfully shrunk via re=
size, this
> > >>>>>>> +                      value is automatically reset to 0.
> > >>>>>>>    fault_injection=3D%d   Enable fault injection in all support=
ed types with
> > >>>>>>>                         specified injection rate.
> > >>>>>>>    fault_type=3D%d                Support configuring fault inj=
ection type, should be
> > >>>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > >>>>>>> index 4aaf29de3f6f..48a91771be95 100644
> > >>>>>>> --- a/fs/f2fs/f2fs.h
> > >>>>>>> +++ b/fs/f2fs/f2fs.h
> > >>>>>>> @@ -145,6 +145,7 @@ enum f2fs_mount_opt {
> > >>>>>>>         */
> > >>>>>>>        F2FS_MOUNT_LAZYTIME,
> > >>>>>>>        F2FS_MOUNT_RESERVE_NODE,
> > >>>>>>> +     F2FS_MOUNT_RESERVE_SHRINK,
> > >>>>>>>    };
> > >>>>>>>
> > >>>>>>>    #define F2FS_OPTION(sbi)    ((sbi)->mount_opt)
> > >>>>>>> @@ -226,6 +227,7 @@ struct f2fs_mount_info {
> > >>>>>>>        unsigned long long opt;
> > >>>>>>>        block_t root_reserved_blocks;   /* root reserved blocks =
*/
> > >>>>>>>        block_t root_reserved_nodes;    /* root reserved nodes *=
/
> > >>>>>>> +     block_t reserve_shrink_blocks;  /* reserve blocks for shr=
ink */
> > >>>>>>>        kuid_t s_resuid;                /* reserved blocks for u=
id */
> > >>>>>>>        kgid_t s_resgid;                /* reserved blocks for g=
id */
> > >>>>>>>        int active_logs;                /* # of active logs */
> > >>>>>>> @@ -2658,6 +2660,13 @@ static inline unsigned int get_available=
_block_count(struct f2fs_sb_info *sbi,
> > >>>>>>>        if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_roo=
t(sbi, inode, cap))
> > >>>>>>>                avail_user_block_count -=3D F2FS_OPTION(sbi).roo=
t_reserved_blocks;
> > >>>>>>>
> > >>>>>>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > >>>>>>> +             if (avail_user_block_count > F2FS_OPTION(sbi).res=
erve_shrink_blocks)
> > >>>>>>> +                     avail_user_block_count -=3D F2FS_OPTION(s=
bi).reserve_shrink_blocks;
> > >>>>>>> +             else
> > >>>>>>> +                     avail_user_block_count =3D 0;
> > >>>>>>> +     }
> > >>>>>>> +
> > >>>>>>>        if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> > >>>>>>>                if (avail_user_block_count > sbi->unusable_block=
_count)
> > >>>>>>>                        avail_user_block_count -=3D sbi->unusabl=
e_block_count;
> > >>>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > >>>>>>> index bc22dde1cb30..556c4793478d 100644
> > >>>>>>> --- a/fs/f2fs/gc.c
> > >>>>>>> +++ b/fs/f2fs/gc.c
> > >>>>>>> @@ -2492,6 +2492,11 @@ int f2fs_resize_fs(struct file *filp, __=
u64 block_count)
> > >>>>>>>                spin_lock(&sbi->stat_lock);
> > >>>>>>>                sbi->user_block_count +=3D shrunk_blocks;
> > >>>>>>>                spin_unlock(&sbi->stat_lock);
> > >>>>>>> +     } else if (test_opt(sbi, RESERVE_SHRINK)) {
> > >>>>>>> +             spin_lock(&sbi->stat_lock);
> > >>>>>>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D 0;
> > >>>>>>> +             clear_opt(sbi, RESERVE_SHRINK);
> > >>>>>>> +             spin_unlock(&sbi->stat_lock);
> > >>>>>>>        }
> > >>>>>>>    out_err:
> > >>>>>>>        f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
> > >>>>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > >>>>>>> index a5e109bdcebc..58f33750b2a8 100644
> > >>>>>>> --- a/fs/f2fs/super.c
> > >>>>>>> +++ b/fs/f2fs/super.c
> > >>>>>>> @@ -196,6 +196,7 @@ enum {
> > >>>>>>>        Opt_data_flush,
> > >>>>>>>        Opt_reserve_root,
> > >>>>>>>        Opt_reserve_node,
> > >>>>>>> +     Opt_reserve_shrink,
> > >>>>>>>        Opt_resgid,
> > >>>>>>>        Opt_resuid,
> > >>>>>>>        Opt_mode,
> > >>>>>>> @@ -328,6 +329,7 @@ static const struct fs_parameter_spec f2fs_=
param_specs[] =3D {
> > >>>>>>>        fsparam_flag("data_flush", Opt_data_flush),
> > >>>>>>>        fsparam_u32("reserve_root", Opt_reserve_root),
> > >>>>>>>        fsparam_u32("reserve_node", Opt_reserve_node),
> > >>>>>>> +     fsparam_u32("reserve_shrink", Opt_reserve_shrink),
> > >>>>>>>        fsparam_gid("resgid", Opt_resgid),
> > >>>>>>>        fsparam_uid("resuid", Opt_resuid),
> > >>>>>>>        fsparam_enum("mode", Opt_mode, f2fs_param_mode),
> > >>>>>>> @@ -407,6 +409,7 @@ static match_table_t f2fs_checkpoint_tokens=
 =3D {
> > >>>>>>>    #define F2FS_SPEC_lookup_mode                       (1 << 24=
)
> > >>>>>>>    #define F2FS_SPEC_reserve_node                      (1 << 25=
)
> > >>>>>>>    #define F2FS_SPEC_resizable_tail_secno              (1 << 26=
)
> > >>>>>>> +#define F2FS_SPEC_reserve_shrink             (1 << 27)
> > >>>>>>>
> > >>>>>>>    struct f2fs_fs_context {
> > >>>>>>>        struct f2fs_mount_info info;
> > >>>>>>> @@ -550,6 +553,27 @@ static inline void limit_reserve_root(stru=
ct f2fs_sb_info *sbi)
> > >>>>>>>                                           F2FS_OPTION(sbi).s_re=
sgid));
> > >>>>>>>    }
> > >>>>>>>
> > >>>>>>> +static inline void limit_reserve_shrink(struct f2fs_sb_info *s=
bi)
> > >>>>>>> +{
> > >>>>>>> +     block_t block_limit;
> > >>>>>>> +
> > >>>>>>> +     if (!test_opt(sbi, RESERVE_SHRINK))
> > >>>>>>> +             return;
> > >>>>>>> +
> > >>>>>>> +     block_limit =3D sbi->user_block_count - sbi->reserved_blo=
cks;
> > >>>>>>> +     if (test_opt(sbi, RESERVE_ROOT)) {
> > >>>>>>> +             if (block_limit > F2FS_OPTION(sbi).root_reserved_=
blocks)
> > >>>>>>> +                     block_limit -=3D F2FS_OPTION(sbi).root_re=
served_blocks;
> > >>>>>>> +             else
> > >>>>>>> +                     block_limit =3D 0;
> > >>>>>>> +     }
> > >>>>>>> +     if (F2FS_OPTION(sbi).reserve_shrink_blocks > block_limit)=
 {
> > >>>>>>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D block_=
limit;
> > >>>>>>> +             f2fs_info(sbi, "Reduce reserved blocks for shrink=
 =3D %u",
> > >>>>>>> +                       F2FS_OPTION(sbi).reserve_shrink_blocks)=
;
> > >>>>>>> +     }
> > >>>>>>> +}
> > >>>>>>> +
> > >>>>>>>    static inline void adjust_unusable_cap_perc(struct f2fs_sb_i=
nfo *sbi)
> > >>>>>>>    {
> > >>>>>>>        if (!F2FS_OPTION(sbi).unusable_cap_perc)
> > >>>>>>> @@ -953,6 +977,14 @@ static int f2fs_parse_param(struct fs_cont=
ext *fc, struct fs_parameter *param)
> > >>>>>>>                F2FS_CTX_INFO(ctx).root_reserved_nodes =3D resul=
t.uint_32;
> > >>>>>>>                ctx->spec_mask |=3D F2FS_SPEC_reserve_node;
> > >>>>>>>                break;
> > >>>>>>> +     case Opt_reserve_shrink:
> > >>>>>>> +             if (result.uint_32)
> > >>>>>>> +                     ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_SHRIN=
K);
> > >>>>>>> +             else
> > >>>>>>> +                     ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_SHR=
INK);
> > >>>>>>> +             F2FS_CTX_INFO(ctx).reserve_shrink_blocks =3D resu=
lt.uint_32;
> > >>>>>>> +             ctx->spec_mask |=3D F2FS_SPEC_reserve_shrink;
> > >>>>>>> +             break;
> > >>>>>>>        case Opt_resuid:
> > >>>>>>>                F2FS_CTX_INFO(ctx).s_resuid =3D result.uid;
> > >>>>>>>                ctx->spec_mask |=3D F2FS_SPEC_resuid;
> > >>>>>>> @@ -1775,6 +1807,9 @@ static void f2fs_apply_options(struct fs_=
context *fc, struct super_block *sb)
> > >>>>>>>        if (ctx->spec_mask & F2FS_SPEC_reserve_node)
> > >>>>>>>                F2FS_OPTION(sbi).root_reserved_nodes =3D
> > >>>>>>>                                        F2FS_CTX_INFO(ctx).root_=
reserved_nodes;
> > >>>>>>> +     if (ctx->spec_mask & F2FS_SPEC_reserve_shrink)
> > >>>>>>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D
> > >>>>>>> +                                     F2FS_CTX_INFO(ctx).reserv=
e_shrink_blocks;
> > >>>>>>>        if (ctx->spec_mask & F2FS_SPEC_resgid)
> > >>>>>>>                F2FS_OPTION(sbi).s_resgid =3D F2FS_CTX_INFO(ctx)=
.s_resgid;
> > >>>>>>>        if (ctx->spec_mask & F2FS_SPEC_resuid)
> > >>>>>>> @@ -2300,6 +2335,13 @@ static int f2fs_statfs(struct dentry *de=
ntry, struct kstatfs *buf)
> > >>>>>>>        buf->f_bfree =3D user_block_count - valid_user_blocks(sb=
i) -
> > >>>>>>>                                                sbi->current_res=
erved_blocks;
> > >>>>>>>
> > >>>>>>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > >>>>>>> +             if (buf->f_bfree > F2FS_OPTION(sbi).reserve_shrin=
k_blocks)
> > >>>>>>> +                     buf->f_bfree -=3D F2FS_OPTION(sbi).reserv=
e_shrink_blocks;
> > >>>>>>> +             else
> > >>>>>>> +                     buf->f_bfree =3D 0;
> > >>>>>>> +     }
> > >>>>>>> +
> > >>>>>>>        if (unlikely(buf->f_bfree <=3D sbi->unusable_block_count=
))
> > >>>>>>>                buf->f_bfree =3D 0;
> > >>>>>>>        else
> > >>>>>>> @@ -2524,6 +2566,9 @@ static int f2fs_show_options(struct seq_f=
ile *seq, struct dentry *root)
> > >>>>>>>                                        F2FS_OPTION(sbi).s_resui=
d),
> > >>>>>>>                                from_kgid_munged(&init_user_ns,
> > >>>>>>>                                        F2FS_OPTION(sbi).s_resgi=
d));
> > >>>>>>> +     if (test_opt(sbi, RESERVE_SHRINK))
> > >>>>>>> +             seq_printf(seq, ",reserve_shrink=3D%u",
> > >>>>>>> +                             F2FS_OPTION(sbi).reserve_shrink_b=
locks);
> > >>>>>>>    #ifdef CONFIG_F2FS_FAULT_INJECTION
> > >>>>>>>        if (test_opt(sbi, FAULT_INJECTION)) {
> > >>>>>>>                seq_printf(seq, ",fault_injection=3D%u",
> > >>>>>>> @@ -3105,6 +3150,7 @@ static int __f2fs_remount(struct fs_conte=
xt *fc, struct super_block *sb)
> > >>>>>>>
> > >>>>>>>        adjust_pinned_area_boundary(sbi);
> > >>>>>>>        limit_reserve_root(sbi);
> > >>>>>>> +     limit_reserve_shrink(sbi);
> > >>>>>>>        fc->sb_flags =3D (flags & ~SB_LAZYTIME) | (sb->s_flags &=
 SB_LAZYTIME);
> > >>>>>>>
> > >>>>>>>        sbi->umount_lock_holder =3D NULL;
> > >>>>>>> @@ -5322,6 +5368,7 @@ static int f2fs_fill_super(struct super_b=
lock *sb, struct fs_context *fc)
> > >>>>>>>        sbi->current_reserved_blocks =3D 0;
> > >>>>>>>        sbi->alias_reserved_blocks =3D 0;
> > >>>>>>>        limit_reserve_root(sbi);
> > >>>>>>> +     limit_reserve_shrink(sbi);
> > >>>>>>>        adjust_unusable_cap_perc(sbi);
> > >>>>>>>
> > >>>>>>>        f2fs_init_extent_cache_info(sbi);
> > >>>>>>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > >>>>>>> index aaca9ed9b169..d61940d095b4 100644
> > >>>>>>> --- a/fs/f2fs/sysfs.c
> > >>>>>>> +++ b/fs/f2fs/sysfs.c
> > >>>>>>> @@ -591,9 +591,18 @@ static ssize_t __sbi_store(struct f2fs_att=
r *a,
> > >>>>>>>        }
> > >>>>>>>    #endif
> > >>>>>>>        if (a->struct_type =3D=3D RESERVED_BLOCKS) {
> > >>>>>>> +             unsigned long limit;
> > >>>>>>> +
> > >>>>>>>                spin_lock(&sbi->stat_lock);
> > >>>>>>> -             if (t > (unsigned long)(sbi->user_block_count -
> > >>>>>>> -                             F2FS_OPTION(sbi).root_reserved_bl=
ocks)) {
> > >>>>>>> +             limit =3D sbi->user_block_count -
> > >>>>>>> +                             F2FS_OPTION(sbi).root_reserved_bl=
ocks;
> > >>>>>>> +             if (test_opt(sbi, RESERVE_SHRINK)) {
> > >>>>>>> +                     if (limit > F2FS_OPTION(sbi).reserve_shri=
nk_blocks)
> > >>>>>>> +                             limit -=3D F2FS_OPTION(sbi).reser=
ve_shrink_blocks;
> > >>>>>>> +                     else
> > >>>>>>> +                             limit =3D 0;
> > >>>>>>> +             }
> > >>>>>>> +             if (t > limit) {
> > >>>>>>>                        spin_unlock(&sbi->stat_lock);
> > >>>>>>>                        return -EINVAL;
> > >>>>>>>                }
> > >>>>>>
> > >>>>
> >
