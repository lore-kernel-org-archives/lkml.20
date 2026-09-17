Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3504C10FB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660051; cv=pass; b=ra4NwZvc9RMgu+Ve7a+J+MuHKlFYnxQVfwhRODahTYzkBVw5avNGrQDUE3Ld6ng+lZR2pg9ucLrNT6EH/p4N0gNBTZxvvtZNWOyO09a+Cyrc3794vowQWObnmNDNUoTf8+SMPrH0JA4Jf/Sj/GkKua28Urv177qP26qc+G6SEKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660051; c=relaxed/simple;
	bh=HhKgh+AhoovE+nLXKxFmLwpFzc2TTxLCaPaNRYCrGXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbR5Zr8lnOLjor47HxYHdplxCyqvskc8xiS7B28wfgFsYSO4wZwAnaJxpfOqciqha/E7UznjqJoMwXA36a3CpNY0ecJYdLIxTDx4Zyts2GjQNAp/0vCVRXSJsZmx/qPvaej4AsGIh7kpxJ43oRLjSL0jjSAZg+pUEgDY5lqVjoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPH7Kn5G; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPH7Kn5G"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744eso846942e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789660036; cv=none;
        d=google.com; s=arc-20260327;
        b=d/Oc3Rh8pkFaH89ESSFPK0BiLACSGtznEl0kDMhiblwgDbP62BvE+tDKlAeVJcgkMl
         Jk+svxmJtlieBrt1HugRx0RCT+/Vp6TBZqO0Ld/3w0t5rg6xb/QzNlnSEdK/2KQe14N6
         N8pAFW4nZqrd42Vs586mVJ62xJxR6CEO3ehxNoqB2C+0GIKhn5plgbo4k4cKXMWtqXjS
         OlpeiMfA7Oo0Fo25a1zJmHfPz0MX1FZ/4CBb1Ma8aYGD2FAx8Nv412sdeuEtIsDiS2Rw
         tMR1h/3SNsLHzjhWo07rhWu0cV7gMNeIyTQc0XKhr4z2wBxA+47myJAujOafHzJB84J/
         ivXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jzy+gQGDahxjRYzrMpnyvQ4GBuSr45Ef8jvJeyFAvyM=;
        fh=8F3DVi9T8rNGJ3B5HmwM/VosbksNSXCmdtIoolmtyd0=;
        b=Jmm1CvqMz06SXGvaR9Ky6BGqe3fDp1IwRvhyqeN4JPU2cmoOgGCLZ0IjJkpnIEPvkx
         JXsOxbHL3q62h+mzALUdIuoab20HlLo+xSOAW+O3FnVxaOZGkEsKd8L0VrMT9NXjCKDy
         a1r5d+62mxl6MySElalQqS9JcimjYM/lz8qmXmbtSMRFz/TNSknZockGMxGIORVCBlcP
         V/7gCgRKXb/+97CmqC2vxjBAjfH+v0MJOJnZvk5pDA3uKte2XzfVK+D7KBtlwlA/PlL2
         QYwqmhFg3aB16X0D8cyoKDJqIi19yjlaf91axsmONjRhU/1gHnRfjqx8R/3YB+y0wGE7
         dp8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789660036; x=1790264836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jzy+gQGDahxjRYzrMpnyvQ4GBuSr45Ef8jvJeyFAvyM=;
        b=UPH7Kn5Gc2k5NVCrqN4WeOufJSlpZ0TE3hCzj/ldttsZGZq9jp1U0DQLBq6Mtsm+oa
         q93kPN4FQdFYjocqX9S+IMHHNEnVxrbkcQ8OqXrn2H7O/J77oZRbHjdI4Ae0WBusAqpp
         Hdlg9wkikrS3ZgmZPHx5jWzWbLBJJGxW6bhqWIWDdA7lY1DNlyX1waPlZzSqUC48kxE8
         qe3HwkoliuyoYNKDASyiwJi6UTc5X4Dur03+KAkVPxWEFP7C/YFdG2uDKfbgfFkcqjej
         rS7fR9SMTsIY9HUnjvNVvtJ4Aq7rsauHNksjf0LJciyzd1qY1Ri5JrPXiLlEHlNAON1o
         QmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660036; x=1790264836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzy+gQGDahxjRYzrMpnyvQ4GBuSr45Ef8jvJeyFAvyM=;
        b=MjYwrKD7pk8GgFf1TlENzALG63qSH/C0EKkByLPteRw4NG68gY0z+SaCZbuplNzekW
         VdPGUah2gc7Diz++G07O6KZKjS8dD3noMqMoR3Try0Iikxj4NS8Xod6v7+Fvq8b+Sfpv
         ZeCSSz2cYvEOvcIqrGLuAZ/sel1La81ZlxDH+OqEt1xt/3Q8RQaBcEOKzyyiL+3wdwgh
         GXuXyXkLr0MlQ1tA6PytLlx2TvTjhbsuCMEFKsUAURonoMBkerhai3R9flpik7XKUuBP
         uhdXqBWxaLB3nRKTsabKpYP2ZpmO/mGZlAmIgm92aqc9sHZXVMUPkeWeTcaxhwZVi4zj
         Nxdg==
X-Forwarded-Encrypted: i=1; AKwUvBzhj5RxDA3H4cdJSzSPjyD+Sd1ugWUUAGtMSj5xzr/VMAy94jiU9AMqPvY531DBfC0OADD4m6/IYIrBJZk=@vger.kernel.org
X-Gm-Message-State: AFuF++m9oWSA0MT6KgvVo+qVUoD/u9ToPkVyFM3hldn4drFZVtI4Fxq4
	9nOQpYQWBSiMSRGSXlfJHx+ezjmzOlIQS6cJ+4xVFTbRzZTQ3opDeBEwoQ4B5qY/M+SusdXjhi7
	scIu2pL0kDatrexYmTVMeYh1LOrBWYvk=
X-Gm-Gg: AYBFou0EB6D9u34THuCSMuuEUM2tiPnJ6KqMkAm2C5dpJuJuWAwz2AG0kA6l6vb5BLx
	WEKcMcTO4puCV/KNUCV9Zf0Gl1Fjz2aK7LNjliFsejJV2JXwnn6la0CrXPr70HWba8HWoKViS5f
	8ITWv4n4h85CIU8zfm6KD+l7GP0U5My3JepkU8mZiYUPrA3Z2/SQJQiscEocsyW2A00h7gIeKeR
	xCRsnE7U2rhKfCKSULqpivyVMH1CVymTe1NSjpwgZltiVM0fNaIKV1BZeeB5eAYqUIrwgp/944w
	RQu7uznGCG4+kpI9g1SaJQYrH9Q8qFzGzrDa8Xc0o2ULs2JOFp0dSKTR
X-Received: by 2002:a05:6512:3ba8:b0:5b6:183c:5c94 with SMTP id
 2adb3069b0e04-5b8b66525c1mr2236156e87.50.1789660036136; Thu, 17 Sep 2026
 08:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915195223.3331909-1-qwe.aldo@gmail.com> <8eef80c6c8d21e863c5a3721b1ae681fc4ccf54f.camel@dubeyko.com>
In-Reply-To: <8eef80c6c8d21e863c5a3721b1ae681fc4ccf54f.camel@dubeyko.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 18 Sep 2026 00:46:59 +0900
X-Gm-Features: AcwNN1W8Hxz9umrd0xiz0nxXV4xs0ZDavlInPR_CBX7SqfB6dwEpospt6ft_-2s
Message-ID: <CAKFNMok804k_g2CHXfrn0LaOY38r8FtMnAk1kRc3YeZ=omCoag@mail.gmail.com>
Subject: Re: [PATCH v2] nilfs2: validate segment number in nilfs_sufile_get_suinfo()
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>, linux-nilfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 4:06=E2=80=AFAM Viacheslav Dubeyko wrote:
>
> On Tue, 2026-09-15 at 16:52 -0300, Aldo Ariel Panzardo wrote:
> > nilfs_sufile_get_suinfo() subtracts the caller-provided segment
> > number
> > from the total number of segments without first checking its range.
> > If
> > the requested number is greater than the total, the unsigned
> > subtraction
> > wraps and the function may process segment numbers outside the
> > filesystem.
> >
> > Cache the total while holding the metadata semaphore and return no
> > entries
> > when the starting segment number is at or beyond the end.
> >
> > Fixes: 6c98cd4ecb0a ("nilfs2: segment usage file")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> > ---
> >  fs/nilfs2/sufile.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/nilfs2/sufile.c b/fs/nilfs2/sufile.c
> > index eceedca026..573646c5f7 100644
> > --- a/fs/nilfs2/sufile.c
> > +++ b/fs/nilfs2/sufile.c
> > @@ -870,10 +870,14 @@ ssize_t nilfs_sufile_get_suinfo(struct inode
> > *sufile, __u64 segnum, void *buf,
> >
> >       down_read(&NILFS_MDT(sufile)->mi_sem);
> >
> > +     nsegs =3D nilfs_sufile_get_nsegments(sufile);
> > +     if (segnum >=3D nsegs) {
> > +             ret =3D 0;
> > +             goto out;
> > +     }
> > +
> >       segusages_per_block =3D
> > nilfs_sufile_segment_usages_per_block(sufile);
> > -     nsegs =3D min_t(unsigned long,
> > -                   nilfs_sufile_get_nsegments(sufile) - segnum,
> > -                   nsi);
> > +     nsegs =3D min_t(unsigned long, nsegs - segnum, nsi);
> >       for (i =3D 0; i < nsegs; i +=3D n, segnum +=3D n) {
> >               n =3D min_t(unsigned long,
> >                         segusages_per_block -
>
> Looks good to me.
>
> Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
>
> Thanks,
> Slava.

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Hi Viacheslav,

Please take this directly.

I also agree that this change makes sense, and my local test results
are as expected.

However, please drop the 'Cc: stable' tag since it does not cause any
fatal issues at the moment.
If a real-world problem is found or reported, I think it would be fine
to request a manual backport then.

While acquiring information on out-of-range segments due to
wrap-around is indeed possible, sufile is also a metadata management
file.
When accessing out-of-range areas, it simply hits as a hole block and
returns empty data.

Neither memory overrun in user space or kernel space, nor
out-of-bounds block device access or information leaks will occur.

Well-behaved userland tools read segment information based on the
statistics obtained via nilfs_get_sustat(), so no problem will occur
(the difference in behavior was visually indistinguishable).

Therefore, I modified the nilfs-utils to perform ill-behaved calls and
tested it.
Although out-of-range non-existent segments were displayed as empty
data, no critical issue that compromises kernel stability occurred.

At present, it does not appear to meet the basic criteria for stable
backporting, so when backporting, we need to be able to organize and
demonstrate the reasoning why it is necessary.

Thanks,
Ryusuke Konishi
