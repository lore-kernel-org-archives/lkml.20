Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F04F052A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483776; cv=pass; b=uaH4JbsjWCQeayHPn20C5MPxKVr0J7ILwojAkKvn+8d7+1IFI/ij+md+JZQVT/mq7Bbs2MlnlF1PWdU/HPzKZP1xfs01WHs1bnR2UuOzfemVfexsGn+Xfq3iK/p2M/nZrGLY0FA0JMw6YViYX56/7Xml7ceKX+fWPb01lmF+Mas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483776; c=relaxed/simple;
	bh=IHB3LC0rNoKz5cxHKJp0l28SgMAXvrRsSm2CxCU28mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NN69zHK+l6yY+MBR6sqKUWKD4zdjjkPfL+RZveiQECpG7p4XLwyL4PNokqzqzayG9aWztSuRCr7NhCpeANG2YcINN7yFIWlWc8SHo9g/BcrSAfQzk0RVW5PpQo+jsxEm+YZs+KieMVX1f7919nZLLk+OkVuQhlQ6cFKUMf8w8ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKy6nqf4; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKy6nqf4"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3156e7705cso669339866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791483770; cv=none;
        d=google.com; s=arc-20260327;
        b=ZpeN6z3CdSb0MhyeiE77HFnW9ZBPFjQkYCWr/2eWyexz/Njpx7fXybU8w6asswVy/3
         nGp0aO5JNzdmVe6b8wjIooENx9VUJc+3M/5f5KyyXvGGHfJitA2K75ihoQDsRxSy1DSN
         d7AqiDg4TU/GHkA+F2aLmfkzXxOB0lBF68DW8IBqapQoV/x9N4E5Jn2811QiB+gZHtF2
         JknCYaPoEvtqF4kXWRweYpibVIgcuhia0qLFmRbZXQ2f7v/tz9dfdkiBXzhW0lJcc3hp
         hAPs+sZH0jMIooLWaUq4huTt/wxvTzNk9qDGA0NbXXAt6My2AozvT4c24sUjl9gvo0T3
         NVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d6IuYjlepm9J2tShQSO68HEsdwbgtH2/b+EQaLyhTtw=;
        fh=qb1FliO7MMr+umU0C3aiK56rSyKWhk64xOucEpV6JtE=;
        b=DvUDWFWE52KRt3FxrYuPEL3GR3tBbax2+ftq2NouqJgrk8jo1zXIkG8jvPayWFkb2A
         V3ZzI/iqBLOcs3nRF8CBAGXnr5bY04Qkxks0Qj2YdEsUlYgAim9z0pacSykbfcm1/arF
         7XIfdkBREj3o3I7QelkkVTwCWWeQToZ8Bj13KUAFzcBfK1BU78PBETqmeFr8jRgg4jyk
         b6GKcmyxeDWIBqZ53oaXkLQiH81X25vXa2GT6VN/4ysH+W9ivQ1zUpWD0sGxS/5mRuUp
         GQZqS+Uoo+YEapS39A+pNeri3xnM5boI0LCbDjlheAofkMKG2pe5ROCqmf7A5MNLp+6M
         ZcoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791483770; x=1792088570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d6IuYjlepm9J2tShQSO68HEsdwbgtH2/b+EQaLyhTtw=;
        b=pKy6nqf4JtQ9cs67N5WTvspg/Ro4eZBBHjifhS50siI5gXP8PbWDNOVky0EA7nIgSh
         enIC0qzjAJSa/mLjDFXzHahaZfjAOq8FaftGusjT/Ct70i0m0lAxPZA/1UHbnjJk7ACi
         0WUtuPftxgqgGrSehuCbcuhEMass2SpiK41a9lUiSqIC1v1PZNEXlr/EQpy3zZ2PT4rX
         bURjHrecy5d39HEMl53Mg78qOswQZgdEyeicaEevYW8vFnSKkfJBzAFG2nY2vGHg7k24
         u7nbxMib59YMIewvp+oy5yGaRdXbO2gR1nj78SPF19LZAiU3JUStGHQNKPnJ8gXVu+BF
         /4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483770; x=1792088570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6IuYjlepm9J2tShQSO68HEsdwbgtH2/b+EQaLyhTtw=;
        b=MWTiRMv+9cOliUGhXYXBh3165c67AMLug2I3h0rbv52CYKnnFWAPPDO0Sfzj2SI+EK
         JcX55OZEja65hMwv90SrGg0Ul/wzVtnVIupXSdgHR7CLmvX2op4R0IGbz3CN2HAiRX+6
         voHQayIzeuGokPZV+ct4R3m/32kNI1SutyDYzbhJ5J2Pey5lx0WJAYq5RvWAEX0gwdoQ
         Owy/42ehTzUKio0vCopCY+QzY0tIle4wSCUjEjS2zKIWoRPY6wrz7TzgXACsBswbcgIp
         AyUiaUsachWGgpUXSdRn2cq6t0iJdOIrSgpVlDQI5XFNdLrFdkwfCe63x7IdjEHaewCa
         cPQw==
X-Forwarded-Encrypted: i=1; AKwUvBwRMPH9W66tcGY/3/TejlzKfhkj04D+3hk6/Gkc8RyR6eEe8qpcNU1RNiuxzgKCvld24O0iqUTe4QYwCrk=@vger.kernel.org
X-Gm-Message-State: AFuF++m1sr59tPWPu1KOcMjUVVzywYcBegaF78+5MzrMKrft99TOy3Cw
	VkcbHmrJZwI/sUsKXAK54vuyHbT2NqmvY9Z75iPCXpS3X9XQ3RYCqqL8tp11MNFMnjwSgEiO/ID
	3dPb8AtlEszd/uAQuCo83LjC62oNit5k=
X-Gm-Gg: AYBFou30+n2zzUgHuOMqyIsyHcKAsIiooGimaiNSM9JNgriqVLk5MRZNwm6vIGbEldG
	PMmdfkBUF3qAqrznaoc5tsV12EtXEagJsVrQrWiIl/GrfdraAi8oUJU797nyiKo+MsRrkFqvp/K
	MokK0o2D8nH89BHY8JWDDqZ9JyiOHRxa7xN0klpdbP4X9M0VVBMRwaTuqkmKO0Y9C7hvKjjg/rA
	oxb4rzGyBvSY07DQOL1ePXFgdBN0WiC0x8MGyqqeQr+3qCcXSgOe+etXG33LB02kCmpG0+yknNS
	R7C/GGpSoVbwRGnpMg79T4L/Zo12CmsR3btdUNb9Fcc1Dbwnzdx1OkBrCZ2x0kHiqLXmKWjeZXv
	2y7GIVakwB3jfNvX8iaKOvQ==
X-Received: by 2002:a17:907:c17:b0:c29:3821:ae6c with SMTP id
 a640c23a62f3a-c317c1135ffmr637885666b.37.1791483770211; Thu, 08 Oct 2026
 11:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913144918.1606123-1-mjguzik@gmail.com> <20260913144918.1606123-3-mjguzik@gmail.com>
 <178943070662.207413.9700024518083440241@noble.neil.brown.name> <178943102713.207413.2253649379310238579@noble.neil.brown.name>
In-Reply-To: <178943102713.207413.2253649379310238579@noble.neil.brown.name>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 8 Oct 2026 20:22:35 +0200
X-Gm-Features: AclHuK9PjIDNTzYHuq2NzBxckIwx6kIlW8DTgQLrmsTci4q13qkhbpb_q_eTIls
Message-ID: <CAGudoHGZ_4AhKKBb8ves8r8ztCCCfjtS8nhF0PTyMYHn2119bw@mail.gmail.com>
Subject: Re: [PATCH 02/10] fs: add path_create(), path_move() and path_clone()
To: NeilBrown <neil@brown.name>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 2:10=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> On Tue, 15 Sep 2026, NeilBrown wrote:
> > On Mon, 14 Sep 2026, Mateusz Guzik wrote:
> > > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> > > ---
> > >  fs/namei.c           | 29 +++++++++++++++++++++++++++++
> > >  include/linux/path.h | 14 ++++++++++++--
> > >  2 files changed, 41 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/fs/namei.c b/fs/namei.c
> > > index ca4f5e3be99a..c8754c7ba8be 100644
> > > --- a/fs/namei.c
> > > +++ b/fs/namei.c
> > > @@ -698,6 +698,35 @@ static __always_inline int lookup_inode_permissi=
on_may_exec(struct mnt_idmap *id
> > >     return security_inode_permission(inode, mask);
> > >  }
> > >
> > > +/**
> > > + * path_create - WRITEME
> > > + * @path: path to get the reference to
> > > + * @mnt: WRITEME
> > > + * @dentry: WRITEME
> > > + *
> > > + * Create a path object using the given vfsmount and dentry pair whi=
le incrementing
> > > + * the reference count on both.
> > > + */
> > > +void path_create(struct path *path, struct vfsmount *mnt, struct den=
try *dentry)
> > > +{
> > > +   path->mnt =3D mntget(mnt);
> > > +   path->dentry =3D dget(dentry);
> > > +}
> > > +EXPORT_SYMBOL(path_create);
> > > +
> > > +/**
> > > + * path_clone - WRITEME
> > > + * @path: path to get the reference to
> > > + *
> > > + * Given a path increment the reference count to the dentry and the =
vfsmount.
> > > + */
> > > +void path_clone(const struct path *src, struct path *dst)
> > > +{
> > > +   dst->mnt =3D mntget(src->mnt);
> > > +   dst->dentry =3D dget(src->dentry);
> > > +}
> > > +EXPORT_SYMBOL(path_clone);
> > > +
> > >  /**
> > >   * path_get - get a reference to a path
> > >   * @path: path to get the reference to
> > > diff --git a/include/linux/path.h b/include/linux/path.h
> > > index 7ea389dc764b..8a621e0e1921 100644
> > > --- a/include/linux/path.h
> > > +++ b/include/linux/path.h
> > > @@ -10,8 +10,18 @@ struct path {
> > >     struct dentry *dentry;
> > >  } __randomize_layout;
> > >
> > > -extern void path_get(const struct path *);
> > > -extern void path_put(const struct path *);
> > > +void path_create(struct path *, struct vfsmount *, struct dentry *);
> > > +void path_clone(const struct path *, struct path *);
> > > +void path_get(const struct path *);
> > > +void path_put(const struct path *);
> > > +
> > > +static inline void path_move(struct path *src, struct path *dst)
> >
> > Oh ...  this is backwards.  At least is it backwards compared to
> > memmove().  I understand different people will read "move" differently
> > and would prefer to avoid it.
> > Can we do without it?  You only seem to use it in one place.
> >
> > How would you feel about:
> >
> >  struct path path_move_from(struct path *src)
> >  {
> >       struct path ret =3D *src;
> >       src->mnt =3D NULL;
> >       src->dentry =3D NULL;
> >       return ret;
> >  }
> >
> > and then use
> >
> >  file->__f_path =3D path_move_from(path);
> >
> > ??
>
> And then of course there is path_clone() which looks backwards to me.
> Can we just change path_get() to return the path, like a lot of
> FOO_get() functions do, and use
>    newpath =3D path_clone(old_path);
> ??

Apologies, I got busy with other stuff and completely forgot about
this patchset.

My issue with the proposed approach is that it prevents the routine
from taking a look at the target.

While the content can be considered uninitialized (and thus arbitrary)
at first, the code can be hacked up so that when the kernel is
compiled with CONFIG_DEBUG_VFS the struct is extended with a magic
number denoting it is populated. Then a repeat call to populate it can
produce a splat.

I'm not married to "clone" and "move" terminology, which I only used
because of Rust.

Would "path_dup" and "path_transfer" be clear enough for you as far as
direction goes?
