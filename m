Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABED339399
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258196; cv=pass; b=UmScFPgfY17eCMEcCK8U+VkDTioy14ck0CkicGPB9qlkhn+Q71C2ipzZVs1YRtFvI1Jz2drY0Ih/pM1gz4zA6yA8Td1oG6Z6jgBjWMRZWh+QWovIxP3D/ZBvucKvEBdr7BwwNfpL59xgxEaIXRV2bvs8CbrN5Z2MvCJMon+aCqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258196; c=relaxed/simple;
	bh=TE1M8Xp9r8nWKhc0pgoLmT0J1KG+EsmuYHdJ9qwlb4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHc7ZsIX3Osq+jxgBCAEG5ILM/LRHPuzGqjoZREpyrv22Twgm0mkgsXB6cO3N3T6PbmpusINay9l2V1dWRlGt2e+6Pz8B5ZkroaeGunobS4IyCT70Q29H8dw8Ndp3FBs9zOabaJ1jFMU1AbNK8HYqgZ/sS+fSz0NWtTT+ZYHYLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDDHg3a2; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDDHg3a2"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-677c1fc082bso1941197d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791258194; cv=none;
        d=google.com; s=arc-20260327;
        b=iPpFPZXsEAxb9fzLdh3qUvESqQRBhcGWVYb6OCOqyHq77Vp6B36N7zgCEShzWp6089
         7lmHM0ez4y/0CVRa+AeqvrYMJEWLce5MZDkRX7mZWFHizJhNYHXTwc7u78zNE7z6zLCZ
         Z8DiyeR7AmwX3h9gXWGBXmoP1Aw6K0pvXNVrl0RScMWoYbhN3dRTo1+nckN5NYpdyadO
         RPr/WFzjsKGx7ZhGxF4zkp79UZbXi6hEFOrm9BLo12stZmBcfkg0unUcxPcAumZTQMXV
         EV60TScfd1sOcTFLIJwY+qz/ABeIOn7EU8SqnT0I6SVH+E67X/EPPtbQJRbZ2kqhg0mG
         uLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BEXTeQGLzgEVv8xuPTN36lgrQGwcruNuHdFhXGEDQxE=;
        fh=lu3S2JuUtYDC5nzF4mGC4oJwXAIZdXLfvJkswlBSw5Q=;
        b=nig34XjCGcPR+o9ZFirMpzs+7tdLiyA2+Gwp+sjHsFzdY1NzdwcCm5PJbYACxjkfrD
         1IoJHPcCcyGkuNwmoUh7LignR2/KB6DhkuiFi6CEbTOzpTbWtsSvrdOE7YsLrUMoNZWh
         XgGNLRWqrM3dMdeWVQHjp0zgfFydox+ur1fdub+3uVp3WAJgFhpWgi4oBetjUjtKSYUS
         MCbHYbWJBGGkUPmhW8ktwXSR+OylT4IhXyn2ocLwAem58MIHuSO5BPYzyvlL3Ocji5da
         y3fiWJaA5QGpBF75AfangCVf7hGU7eEB+FzcPyKjbDCcZIEy/yQfTiGuODp4yUIGpgE/
         Y+sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791258194; x=1791862994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEXTeQGLzgEVv8xuPTN36lgrQGwcruNuHdFhXGEDQxE=;
        b=PDDHg3a2LCqs+3XiRwyQt0AVuCeWE893FNKT0ilCYLizGNoF0Ro72mkC4XZ7pZiRGY
         fJUrVp50i0p6gdpkFdWfuutcSlbokOt4n+OoPdfXMr/1jKQB3iIDQz4gotpKFoeyLBJC
         f1wZCI1S6ch9Q0qU0LGW7r8Z589g7lh5Pam02mEIdrEHKdKURfYupRCAP9gWyuU+bDkD
         0+Kj/582bszSJRZMz32uOfB3p37sk/FHyXl71OBivn/+XJaYCtOF/5Up5Ss/qOyvglRq
         zr/ZJRrVMp/CcrlWGaBbwAoKhUPZaCkvuwOgFZSZE4cm4jpJ5nTC8x7ytU0pTATQuwcy
         V1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258194; x=1791862994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEXTeQGLzgEVv8xuPTN36lgrQGwcruNuHdFhXGEDQxE=;
        b=E9sJqPp66vm+T2GCQHhCzy2ZuanRnrlzf1V7LqaWcnXwENIYueYsylQXAJft4nDV0Z
         wQb9iAxpA+koXepjqDQ64e6V0FjWk3ZtqQGshc0HKsWr00khyhAwT1GHZQylWAwNcaLe
         9cHZIbK0+yVt35x52iZKHmSXnqXzDXDKjyFrz9Rzb2VndMkITKKOSl2Lhx1Qm5cg87i7
         JYy2FExbTPy8IT2MnDqQQv05TFfL4zpxJWNdK2KJYLKUief2mWXbg62OtIFKfy6+o6wj
         ELr/mgM3aMM7MJJTasHBIR+X74CqE5LjvsbrKcmz7Z48FDu5nxUDeMDjo/DIuNxZd5nS
         Q4/A==
X-Forwarded-Encrypted: i=1; AKwUvByNMvpLw1Aj9L42zSTq34LGdB5Zhv94jMbRybpfU4+eeKd6tHcXdoXBU721Bcua44s79Rl2LmUCpPSmBSQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJalUwcdI8kK6WDTgbpCDi0J5hH9G4hO7+458iGR0BI0uscCC8n
	YLt7beedjPENpRb79y5Qd0RDtW2yuACavSrYkpfvfs4p4l6XPfpFBMfGckhQKeCeEjc1EQ/ZzPA
	2jhQL/jfkX52UFkEdL3Zlee7c9fuBCY8=
X-Gm-Gg: AYBFou2UQ4LDpwMHtkaB4M1rwC6EhNWG0elrQSO9Ot2S48uYEA9WTlNkpys4Kgt3xpS
	WF/a6VYjXf0EX4Qmz9jtSUOYyMwM//OCIRx+Nirp8z4CIeadjToYthEFoVMCQrqCQ2dPL5vwhgD
	fn2qNAftEusfBT9uh537UMXE/jWG1pvyaY6AH+B+hESm7HdHGGBn/bw0w7/70WnYHdZd8b8u8OT
	1/YDIAJs6G1c/YHbgH1gzQEEBikK2uFoOHkt+RI/c9MOfvN3gNkxqy9TMCVgScNh91Jtx2tAJCv
	IBP+1kTz4wnzFcrei90RMH3f/leZSpeZ4+uWFeQZioMqYcaT49hAEG0W9x++M18Bty/v
X-Received: by 2002:a05:690e:4145:b0:674:1336:7d5b with SMTP id
 956f58d0204a3-677bd380447mr3369449d50.52.1791258193959; Mon, 05 Oct 2026
 20:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004055712.1293-1-yogeshgaur.83@gmail.com> <32152011-b196-4dc0-ba7e-495f2132ad15@fygo.io>
In-Reply-To: <32152011-b196-4dc0-ba7e-495f2132ad15@fygo.io>
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
Date: Tue, 6 Oct 2026 09:13:03 +0530
X-Gm-Features: AclHuK-etZgMZhRThOtRlbtdP2ce2Ph0ESLyjNgIBlEnFN-xlVATRsrCZ1wzbZg
Message-ID: <CAG6enPwFpBK=VyEPEnw9a26Yg+Gzt0enieHpYvnJz-v7L5ALyw@mail.gmail.com>
Subject: Re: [PATCH] md: don't hand out the array before md_alloc() has added mddev->kobj
To: yukuai@fygo.io
Cc: Song Liu <song@kernel.org>, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Li Nan <magiclinan@didiglobal.com>, 
	Xiao Ni <xiao@kernel.org>, Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>, 
	Logan Gunthorpe <logang@deltatee.com>, syzbot+95eeb4ada2349a2170ea@syzkaller.appspotmail.com, 
	stable@vger.kernel.org, "xiaobai050@gmail.com" <xiaobai050@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 10:35=E2=80=AFPM yu kuai <yukuai@fygo.io> wrote:
>
> Hi,
>
> =E5=9C=A8 2026/10/4 13:57, Yogesh Gaur =E5=86=99=E9=81=93:
> > md_alloc() publishes the gendisk before it is done setting the mddev up=
:
> >
> >       disk->private_data =3D mddev;
> >       ...
> >       error =3D add_disk(disk);
> >       if (error)
> >               goto out_put_disk;
> >
> >       kobject_init(&mddev->kobj, &md_ktype);
> >       error =3D kobject_add(&mddev->kobj, &disk_to_dev(disk)->kobj, "%s=
", "md");
> >
> > add_disk() makes /dev/mdN openable, and md_open() only refuses the open
> > when MD_CLOSING is set.  mddev comes from mddev_alloc() and is zeroed,
> > so anything that gets in between add_disk() and kobject_add() sees an
> > mddev->kobj that has never been through kobject_init() - no ktype, no
> > kref, state_initialized clear.
> >
> > syzbot opens the array in that window and issues ADD_NEW_DISK:
> >
> >    kobject: '(null)' (ffff8880120640f0): is not initialized, yet kobjec=
t_get() is being called.
> >    WARNING: lib/kobject.c:642 at kobject_add_internal+0xea/0xcd0 lib/ko=
bject.c:225
> >     kobject_add_varg lib/kobject.c:374 [inline]
> >     kobject_add+0x163/0x240 lib/kobject.c:426
> >     bind_rdev_to_array+0x80c/0xdd0 drivers/md/md.c:2621
> >     md_add_new_disk+0xe3b/0x1850 drivers/md/md.c:7684
> >     md_ioctl+0x200a/0x2610 drivers/md/md.c:8499
> >
> > bind_rdev_to_array() is not the only way in.  md_run() calls
> > sysfs_create_group(&mddev->kobj, &md_redundancy_group), and
> > internal_create_group() has its own WARN_ON(!kobj->sd), so RUN_ARRAY in
> > the same window warns too.  Guarding the individual callers would mean
> > finding all of them; the window itself is what should not be reachable.
> >
> > Refuse the open until md_alloc() has added the kobject.  mddev->kobj.sd
> > is NULL until kobject_add() creates the directory, and stays set for th=
e
> > rest of the mddev's life: commit ca39f7502425 ("md: fix mddev->kobj
> > lifetime") dropped the explicit kobject_del() and lets the final put do
> > the removal.  md.c already tests mddev->kobj.sd for "is this array
> > published yet" in mddev_unlock() and md_run().
> >
> > This cannot deadlock against add_disk() itself: device_add_disk() only
> > opens the disk to scan partitions when get_capacity(disk) is non-zero,
> > and md_alloc() does not set the capacity - md_run() does, long after.
> >
> > Fixes: ca39f7502425 ("md: fix mddev->kobj lifetime")
> > Reported-by: syzbot+95eeb4ada2349a2170ea@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D95eeb4ada2349a2170ea
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > ---
> >   drivers/md/md.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/md/md.c b/drivers/md/md.c
> > index 680b34a63cb3..e3326b78aef7 100644
> > --- a/drivers/md/md.c
> > +++ b/drivers/md/md.c
> > @@ -8610,6 +8610,15 @@ static int md_open(struct gendisk *disk, blk_mod=
e_t mode)
> >       if (test_bit(MD_CLOSING, &mddev->flags))
> >               goto out_unlock;
> >
> > +     /*
> > +      * md_alloc() publishes the gendisk with add_disk() before it has
> > +      * initialised and added mddev->kobj, so an array opened in that =
window
> > +      * would let ioctls reach a kobject that is still all zeroes.  Wa=
it for
> > +      * md_alloc() to finish rather than handing out the device early.
> > +      */
> > +     if (!mddev->kobj.sd)
> > +             goto out_unlock;
> > +
> >       atomic_inc(&mddev->openers);
> >       mutex_unlock(&mddev->open_mutex);
>
> This is the same problem that I already replied in another thread, the sa=
me solution
> with different code.
>
> Re: [PATCH] md: prevent opening an array before its sysfs kobject is
> ready - yu kuai <https://lore.kernel.org/all/a19e3020-272b-4f93-8535-00fa=
07002d91@fygo.io/#t>
>

Thanks Kuai. Yes just refusing the open would be going to move the
race condition. I had missed earlier patch from xiaobai050, sorry for
the duplicate.

I would send a v2 that holds reconfig_mutex from add_disk() through
kobject_add() in md_alloc(), so an ioctl issued in that window waits
instead of failing the open. RUN_ARRAY is covered as well, since
md_run() also uses mddev->kobj and runs under same lock.

Thanks
Yogesh
> >
>
> --
> Thanks,
> Kuai
