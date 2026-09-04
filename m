Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD4043B4BF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515865; cv=pass; b=aWuEYkfLOe0whv5LGfqBZsNsRXLBhUhATOWs/bh3z3xndYwhZzg5ZvJuA1Ty+t6fanKGfNDhL6wMcWbfMaiumCVYxmcnjypZLtxHv1t8o5DOfoH6IOual27vZp564R5t2sb0XT0iqFMYp43o72bsrrL3tet/Fi/kCHGtsKEJn6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515865; c=relaxed/simple;
	bh=6WmWFr9BY8WHDH5HOaS9iTFTd4EmRtRdp6fMjyF+1mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qooRsyxPva+eECp6g3+yCJl7JlHqEN08ZJjfOdF+qWO8FIrxrNcWYnud1UpkZSVlxNRT3Sw/weFjZrt3c2m1hKuALhxd9jbde1UuVdYf/UMr8slVeEnqWbGQPaefn/4jIApB6bw0QBQnJAA1stPW4UVduvn1q+OCZrFoQyW91/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p34yhGnZ; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p34yhGnZ"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b7b4b08d78so190921eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788515863; cv=none;
        d=google.com; s=arc-20260327;
        b=FGkvb5xnaya5QPDZcbpXlbg6noJY4J157tWwcX7TXs8iq3W2wGXOOaEldf3fcIrNv8
         sXjhHNqTMktt4Lmi0pekfiW7cq+gu2gKgphLU0zaq2LgYLxpqShZFD94KrB65JyvpCHD
         +LhCxLrtKxGuiGeG0RwcBfmDh7KNi2LzGC0EqpzEa2DLPGhWUU3M8QXMdfwDfzgsJ+Rb
         2JzGoK1lhgzJ2dXZv8DuISyo+gOsDr+YA2BW7qagR+glwC/T52azOZWcyTog2WaVaFIQ
         tSGq6szB7nLaaBnBARFg1T7FsOJ2D8gOKkerH2TBB83Z4IuMlxVf9JFwiiYPWeBcRG7t
         R+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3pmQAxfFHxZRfYhLuLaVrq3tjXnncmJuNgkRzDwbSwk=;
        fh=K+ohNhMi91CU2NabModXyCoOxrVXI4g9xmzzioK2Zho=;
        b=OF/woDe1X35SFlIF6PoLFNMnoE2PEzhjfA4+RKFyzYy3YKrqAD11Xf559y1iIb1yPL
         24W/1u7lq+bb7gfHwb7p8+Q+9eqTiVkBiaeH3weuLtmINhA1BS5XtIDo92JP3+34gVYr
         NB6kVlRQkGJfK46Ac+SM0qH2dwGLp0Tu1upCKkbRF5b8HaSY9Q+xNyalGI/6+2tB4ajT
         lSgglD0j1zhwFVN8MgjtjJkasd0VoebjRoKcLPcwcdjKLU9eODLtUDUxZbb3pyh6Sx6k
         hC5mReFqxkMFxX7QSNxAVpxnMbFBFBjhm9Ibt6SHzAEBwkrpmrRuJYBZvAiBYjQI+IFH
         JWkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788515863; x=1789120663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pmQAxfFHxZRfYhLuLaVrq3tjXnncmJuNgkRzDwbSwk=;
        b=p34yhGnZVz8zMYlY8wulQUE91x2tam8kGrjhqaIwbqLp6Z/RuyPDqnER0vqTTmlYVq
         3BvTZX3KBOJLJAX+8EGkrBhgtRoDPO23k65T+0fBX4vI207R12ZHwdNIkC4vB9iZVzn4
         bI3nZF0hA+OFaNULTutflrZ1uOjJkXIiMHbPDWj+Hwg8UKtsdCqUkJoa9+/08m7C0e/y
         qOaNDmgxASD2bQVX7TMvV5L464sncRHDZU1R3WlgkFo7czqNoHoJXew0DNfXMMvhLtV6
         aIuhMJGf+85TkA6ByjGdLzwwrLcT1mXrxEciHf3N98eKNvWV94eksVFqFirnZ1Uv9jWB
         kbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515863; x=1789120663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pmQAxfFHxZRfYhLuLaVrq3tjXnncmJuNgkRzDwbSwk=;
        b=Sx5GLcTq6ukmKR9o9ay+ItQiSHUe5E1lAQMp9jgrqfHlW8eaisKF+Cy2dLFkLGcsvS
         Jl4uwdcLAbk7n4AvQRgBz2g9MFxNHwI0QIK0hShH1W5oDG6gE80IphsXirsOtQ4Ft2aW
         oupYSnmCdXfnFQcm4G2k/lqVyoYqS+C6BsCA4oFWZ4AK8qDX8DvP3j6m82FXqodKiC37
         Iw5eH8IfspvjWaBBJcAX/vw+UW3OSsiaQyAFsNLsiALgQi6dVChz8QTgUxmS6o01AJ7J
         Z70S6tQmzhPxLGxT1Lpyf+Vf3mtbi3FY9TmhCuJrFaFHttKnidIUwmp8iThuPhZ8YdpA
         attg==
X-Forwarded-Encrypted: i=1; AKwUvByMxgQExQ2wp6IGRSznr6QtmMAvVO5n/3deUYLWHd+mPhfikChUnc86kA5Xh8+waCH7VfBbvPos9ufjaEs=@vger.kernel.org
X-Gm-Message-State: AFuF++m5jXX5JwcclnbBBM6vQCUHceMSmzCsi77rSMXxeUqkkA4p789n
	2AKsKv47/tvYiIbO1PzH4263PMhDOi5zqoJGNHRhw6tp3spLgdJu6boPqmgMEEDHq2wPWEOa54j
	9HGhy2xzYk809I7h84/QXROX4RfjCZI9/ZfhVP8VTT+3lG5fa9ri0qCBVmGw=
X-Gm-Gg: AYBFou1eklpRcTi+QxZ38v6+TeLIeJyTaibw7i3JaijxN4iCKmIujzJR/unGclF39L4
	T5g+y6GxnTx4qsus1N1kOote4fPYq2v0ejz8rTEnpBNB4nuCt1gRjjcLqI7W35O5WARspQjwkF9
	fmOcQuHhgF2XKiB6BmQGj55J+roR/vLnUXfO8OFX0cDgZAMiFiJ5+Z3oKx9ukdleF7rS6A6ldCY
	2Y++kdQZnLZXloRNIYPhHYUAu6twpdGRCUSJ/tTCcDUNh0pnMbgOvTI0ZFea5fVJJYK0SUSvOGY
	N+Ri2YsNPAAhnSgEXzPxeV9vnLOqQLqjEYE6nrlWcjHiE0MQl8emytYAZxOzivaooU/0VIwNvUq
	UXqUD+nXjoDMUrwnafUEAW4jgeGrCiAvAosMFdeuZJouvVy+kgU3VrGkIOMhtBf6g7hGTpRRDyf
	2OaVrrD2O/O0NxJZFQqtbQQRSc
X-Received: by 2002:a05:6820:6ac3:b0:6b0:4170:59ad with SMTP id
 006d021491bc7-6b6fc7d1f64mr3797277eaf.24.1788515862149; Fri, 04 Sep 2026
 02:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-clown-zersplittern-sequenz-987f972a607b@brauner> <6a9a8cd1.a011d2ce.399d32.0000.GAE@google.com>
In-Reply-To: <6a9a8cd1.a011d2ce.399d32.0000.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 4 Sep 2026 11:57:30 +0200
X-Gm-Features: AcwNN1U7j0-le73bygNJxDaUo8VXPRh4lkxTXAwyp7z5061WENtccz_ye1P0Dso
Message-ID: <CANp29Y4e=0yahrA4K8xKO186JiruTorRaq7u+Y=Q4Mo-3SReCQ@mail.gmail.com>
Subject: Re: [syzbot] [fs?] memory leak in path_openat (4)
To: syzbot <syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com>
Cc: brauner@kernel.org, iommu@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 11:18=E2=80=AFAM syzbot
<syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com> wrote:
>
> > On Wed, Aug 26, 2026 at 07:54:38AM -0700, syzbot wrote:
> >> Hello,
> >>
> >> syzbot found the following issue on:
> >>
> >> HEAD commit:    26260251022f Merge tag 'livepatching-for-7.3' of git:/=
/git..
> >> git tree:       upstream
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1196a17958=
0000
> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6c1b5958b2=
d1207f
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=3D7666ed2c3d42=
196bf7e3
> >> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils fo=
r Debian) 2.44
> >> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D139f7179=
580000
> >>
> >> Downloadable assets:
> >> disk image: https://storage.googleapis.com/syzbot-assets/0f75e7622b1f/=
disk-26260251.raw.xz
> >> vmlinux: https://storage.googleapis.com/syzbot-assets/2bbff9fd7b60/vml=
inux-26260251.xz
> >> kernel image: https://storage.googleapis.com/syzbot-assets/95d73300490=
7/bzImage-26260251.xz
> >>
> >> IMPORTANT: if you fix the issue, please add the following tag to the c=
ommit:
> >> Reported-by: syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
> >
> > #syz set subsystems: iommufd
>

#syz set subsystems: iommu

> The specified label value is incorrect.
> "iommufd" is not among the allowed values.
> Please use one of the supported label values.
>
> The following labels are suported:
> actionable, missing-backport, no-reminders, prio: {low, normal, high}, su=
bsystems: {..
> see below ..}
> The list of subsystems: https://syzkaller.appspot.com/upstream/subsystems=
?all=3Dtrue
>
> >
> > This seems to be a reference cycle in iommufd. path_openat() and
> > alloc_empty_file() is just the place where the file is allocated.
> >
> > The reproducer does:
> >
> >   r0 =3D openat$iommufd(AT_FDCWD, "/dev/iommu", 0, 0)      /* =E2=86=92=
 fd 4 */
> >   ioctl$IOMMU_IOAS_ALLOC(r0, 0x3b81, {size=3D0xc})         /* =E2=86=92=
 ioas_id 1 */
> >   ioctl(r0, 0x3b8f, "2800...0400000000...0010")          /* IOMMU_IOAS_=
MAP_FILE */
> >
> > So that last payload can be decoded as:
> >
> >   iommu_ioas_map_file: size=3D40, flags=3DR|W, ioas_id=3D1, fd=3D4, sta=
rt=3D0, length=3D0x1000
> >
> > So fd is r0 itself which is the iommufd fd which is handed back to IOMM=
U_IOAS_MAP_FILE.
> >
> > That causes a cycle:
> >
> > iopt_map_file_pages() does fget(fd) without worrying what it calls it
> > on. So that does iopt_alloc_file_pages() which takes a long-term refere=
nce in pages->file =3D get_file(file)
> >
> > The reference is dropped in iopt_release_pages() in fput(pages->file)
> > from the IOAS teardown. That in turn runs from iommufd_fops_release().
> >
> > TL;DR:
> >
> >   struct file(/dev/iommu)->private_data-> ictx->objects->ioas->iopt->ar=
ea->iopt_pages
> >           ^                                                            =
        ^
> >           |____________________________ get_file() ____________________=
________|
> >
> > Closing the fd does nothing. The hex dump shows the same pattern btw:
> >
> >   - obj1 struct file @ ffff88812811f9c0, obj2 its LSM blob
> >   - obj3 iommufd_ctx @ ffff88811161cd80, first word =3D ffff88812811f9c=
0 =E2=86=92 ictx->file is obj1
> >   - obj5 xa_node, its ->array =3D ffff88811161cd88 =3D &ictx->objects
> >   - obj4 iommufd_object: shortterm_users=3D1, users=3D1, type=3D4, id=
=3D1 =E2=86=92 the IOAS with ioas_id =3D=3D 1 from the repro
> >   - obj6 iopt_pages, kref =3D=3D 1
> >
> > Likely caused by f4986a72d6e4 ("iommufd: Add IOMMU_IOAS_MAP_FILE")
> >
> > Afaic,t, this should either reject based on file->f_op =3D=3D &iommufd_=
fops.
> > But iiuc there's other cycles that can be formed.
> > For example, via a vfio device fd that's bound to the iommufd. It holds=
 an iommufd_ctx reference via iommufd_ctx_from_fd().
> > So mapping a bound but unattached vfio fd builds the same cycle.
> >
> > So probably this should do validation what type of file can actually be
> > used like shmem and hugepage file.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6a9a8cd1.a011d2ce.399d32.0000.GAE%40google.com.
