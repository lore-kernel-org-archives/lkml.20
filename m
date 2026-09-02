Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1575351C2D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357705; cv=pass; b=Ju+d/krAbugi5JVijytL5uoKILQdXPsOhlV/Kz+9tI5I2g61mdXR/B3AiCIzbtWBSOIWa/3cTTtNcNcHHzKdRF4M9VGs/EpzHvsXZliUPcPAl8fIC6lrM21+xcHaKZTB6kafEiqwgT4PhPjLjMG3AEOEgm6p1wEbMjvaeSo442w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357705; c=relaxed/simple;
	bh=i4YFRSjr1uq5B1VG9ijzvPlb+5HtsPFiXflnG2nayIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HgEiTM93+ca76vi69TXKCn2o0h4PN0xh5b8zkmG/4WH3uwk9gIxGUoMdTmog53pPDPFGBFYRjQ0znmTWA9MKtTtNCaiHaU/5jt9v76FZ2vKAXOtppH99K1fi0EDEMClnN8vlVg1oWvSDUHnsLY292TLNkx5OSl2xeMkANuAPopI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WT7dU5Zk; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WT7dU5Zk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2092526a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788357702; cv=none;
        d=google.com; s=arc-20260327;
        b=Efa6FSgVNacL+ml9oJ+gXb/ExA4SiL8OU5qKESj5wckCwiA0d83aUY+DA7ZZXz60Ab
         +8NDouXxiitSfhXyWlKdulwURcW6be7a0TwHcwxFqASfxksqyijKCdrkNa5b9UOilWYI
         x6LWnWKPZC+7lL2p7yN2tgdwh5tc85Ghqsap7A7pdJxiWR2CznBaMmdVFemtOSJS4bYa
         TU88vLu5SXyBYTAZ6f8dLZoZ2gZ73w5FGvSz1+/cbWAYYzTvOd76EN31LjmJfEQj/CPl
         9dj+7uEZ6OJMwqcEoIs6IjWh21AaT99nq89J6wbu26uvqNq5STSD8gHw49/+DNmwjmtM
         1A8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=12GYgwyQ7Bsh7S9Ja4UI8pLqfCj3kMfeIBkHdXA17Vg=;
        fh=1eqzNnSUkhskycd+hEejQ4Apkoa8GuuJqPBdg3xtud0=;
        b=J1nhYK0rQu3it/U/N2II5tOKyX9sbKY3Rf0v0YoN2CoJ5w+611lXZRKHR9W1bqZFlJ
         qpwz14Bsm/HwRvawBAJCQYT03IfkgSl8/BD4ihjy3m/Cf9fogXZJ6vCG8ja2LuarK/Sk
         MeULFpA/xy3CSbpbYlcTYJMPfA9UsZT1ggv+Dg+BIXMBkAtawHB8X+1yzktNsbpJrOmH
         5NlhRAk3zOKVNG/6wdAKcqFBcjFrLrr1nAZBoA2WH6GTYWvNTvJG6EjA3I5O4jyBv3qj
         2Hcf5Q1yJuPz/U/JEsTRsMktSdGet/3jO4i4Sorp4Q1NUw8c9ykY/Tg1irsvKP+ZNpoB
         HBYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788357702; x=1788962502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=12GYgwyQ7Bsh7S9Ja4UI8pLqfCj3kMfeIBkHdXA17Vg=;
        b=WT7dU5ZkGf1hVRPXAzkSZH+idFuNubaRBmS31MFPv23yJI/gDXFnRS+EN4TAYTmKmP
         VZ2dgVyNn/7rLkDQp4pT/Xcn9fUJrV8+CXEsP4ZTWta9WCajVU74L6eGmqfUMpwrrd80
         AuNCDEnFa+Zbs9gET/sJuGMGHauhGgRBbo/2/rgFIXUKl9uQuARUA6iEhEWnfkqLMHcV
         EWBrGxzkCqnv/xriG4ouWN6ImGN3vr1sjXI6ORPz0oHLb5/EIBB7KUcVB/C2IRzeVAFp
         Wn4uWtOx4AbKv7cH7bv9qWOGh67S4S/YXLXpjIzuNSL1hNwl1r5kttvvnGFiwSUAq7gM
         R/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357702; x=1788962502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12GYgwyQ7Bsh7S9Ja4UI8pLqfCj3kMfeIBkHdXA17Vg=;
        b=PHXCoB+IhYLsLj7GDBvW6ZLjgl09TDFp9/gHZu29sJbLeuuijLJfU0IqWC6vj3TwgT
         Tzp71HL+QXa5R36z3Luk723iokRQcW5yvUz9hIe/S1U1C7R2aLzyBLcu5OdwmxGh0dRX
         oeA0SWruv0ABEULAoEcnLPP4CoK36cDz/h0O/MmmXpT2ML3iRp11QJcOklzQXbBPVNQk
         FyYu2yVLHUWSt7M56Y+trSxPWpDbzcqDmV+6O+Ad3QNaG57HDQmIvHrYbDGCX7SzUJOT
         ra2PpsLUaVzedSMaIDXx13l2SKUQExaiWx/RUuEwYeG2IBrO6GDyuhIE6fq3hFW0cbCM
         7ORw==
X-Forwarded-Encrypted: i=1; AKwUvBysia2JT4+mNYo5UJgS58opfxq6tJJXGkEy7uBv6d1aULlqraZiSs8OpgwSzF+FFtpuSgf/uYtibl8yt9U=@vger.kernel.org
X-Gm-Message-State: AFuF++m3N+A85jHKSm0fw54OM8zE8XDTOE0x4CK/5/ogpgmFm34P/R/p
	USe92JIwHRcyZk1/a+doUXgsVHJYg2QBkR3Z3o8OmnN5+fduZxckpyXwO/ebWou7k/IpI5Axv8y
	/LDyLXlcTCTx++6JphXVCgYDIH3yAnxQ=
X-Gm-Gg: AYBFou1qHlXkn1Gnm9I97D/U7rqdH0XgYgPdW0WPAjBbjILh+NN7JTW6WkpdQaHMNpk
	GatnFAGODpsjCpOXWBrsblMRWtTGMHJdzgn4TeAuj32MfONf5xZsRDEgpJf8GmQ8gfi8Ib8Chb/
	qN5xSyy4SkICkRFnCVsl2hJAU3EQ/vQ5Uofl/+jNs3luzbgqz5zf5nR+FZ4PTr3hIumk5I4lqoX
	5d4w13hWAdq2SaFnWYvZmYvOmhyVGYLFfK4wwqWvc0CmNPFTbWxKa9MpgnuW5iGxECB4hJGdkMe
	hXzgjf3OxTp4LN2+verWxfyuDZRUQisulO6+eOq7LFOZWtW8mEHqj/xn+FvyG2/Ins+JM9vQDKL
	A
X-Received: by 2002:a05:6402:2b96:b0:6a6:32f5:ff41 with SMTP id
 4fb4d7f45d1cf-6a682af6339mr3326940a12.21.1788357700968; Wed, 02 Sep 2026
 07:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803125138.1937674-1-mjguzik@gmail.com> <apSkPymcTBsKOjCV@lt-jori.localdomain>
In-Reply-To: <apSkPymcTBsKOjCV@lt-jori.localdomain>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 2 Sep 2026 16:01:28 +0200
X-Gm-Features: AcwNN1VSsYU-vsvWa7shzQJbqk_ZroS3jGAjSHb54Knwby4SOB8Vpa8jQJn0APE
Message-ID: <CAGudoHHw3ptuOOfUd5ohTGO+Mm2zS6vW5y7KF5_BjZMuMT3YHQ@mail.gmail.com>
Subject: Re: [PATCH v5] fs: avoid spurious dentry ref/unref cycle on open
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 12:05=E2=80=AFAM Jori Koolstra <jkoolstra@xs4all.nl=
> wrote:
>
> On Mon, Aug 03, 2026 at 02:51:38PM +0200, Mateusz Guzik wrote:
> > Opening a file grabs a reference on the terminal dentry in
> > __legitimize_path(), then another one in do_dentry_open() and finally
> > drops the initial reference in terminate_walk().
> >
> > That's 2 modifications which don't need to be there -- do_dentry_open()
> > can consume the already held reference instead.
> >
> > When benchmarking on a 20-core vm using will-it-scale to open the same
> > file read-only, the results are (ops/s):
> > before:       4043375
> > after:        5629378 (+39%)
> >
> > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
>
> So, the legitimize path stuff grabs a ref to the nd path which is
> balanced at terminate_walk(), and you're saying that in the regular open
> path (not O_TMPFILE or O_PATH), since vfs_open() also grabs a ref, why
> not reuse that one. Is that what you are saying?
>
> It seems then that this issue also plagues do_o_path():
>
> static int do_o_path(struct nameidata *nd, unsigned flags, struct file *f=
ile)
> {
>         struct path path;
>         int error =3D path_lookupat(nd, flags, &path);
>         if (!error) {
>                 audit_inode(nd->name, path.dentry, 0);
>                 error =3D vfs_open(&path, file);
>                 path_put(&path);                        // Not needed?
>         }
>         return error;
>

Indeed. I did not bother looking for other uses. This can be sorted
out separately if/when my patch lands or I can add it.

>
> > ---
> >
> > The spurious ref cycle remains an issue and it is trivially avoidable,
> > for the most common case anyway.
> >
> > Al Viro had a more involved patchset which got stalled, see:
> > https://lore.kernel.org/linux-fsdevel/20240822003359.GO504335@ZenIV/
> >
> > I already pointed this out over a year ago when sending v3.
> >
> > Given lack of traffic on the more involved variant, the nice win from m=
y
> > simple patch and its overall triviality, I think it should go in. Worst
> > case, if the more involved work ever gets off the ground it can be
> > trivially reverted later.
> >
> > bench is:
> > $ cat tests/openro3.c
> >
> > #include <stdlib.h>
> > #include <unistd.h>
> > #include <sys/types.h>
> > #include <sys/stat.h>
> > #include <fcntl.h>
> > #include <assert.h>
> >
> > static char tmpfile[] =3D "/tmp/willitscale.XXXXXX";
> >
> > char *testcase_description =3D "Same file open/close read-only";
> >
> > void testcase_prepare(unsigned long nr_tasks)
> > {
> >       int fd =3D mkstemp(tmpfile);
> >
> >       assert(fd >=3D 0);
> >       close(fd);
> > }
> >
> > void testcase(unsigned long long *iterations, unsigned long nr)
> > {
> >       while (1) {
> >               int fd =3D open(tmpfile, O_RDONLY);
> >               assert(fd >=3D 0);
> >               close(fd);
> >
> >               (*iterations)++;
> >       }
> > }
> >
> > void testcase_cleanup(void)
> > {
> >       unlink(tmpfile);
> > }
> >
> > v5:
> > - the extra ref is of course needed, i blame the heatwave for thinking
> >   it is not this time around
> >
> > v4:
> > - rebase
> > - don't grab the extra ref on mnt for truncate
> > - bench opening things r/o. note perf improved from last year thanks to
> >   other changes
> >
> >
> >  fs/internal.h |  1 +
> >  fs/namei.c    | 15 ++++++++++++---
> >  fs/open.c     | 27 ++++++++++++++++++++++++++-
> >  3 files changed, 39 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/internal.h b/fs/internal.h
> > index c658c8a5ebd5..9632239036ac 100644
> > --- a/fs/internal.h
> > +++ b/fs/internal.h
> > @@ -205,6 +205,7 @@ int do_fchownat(int dfd, const char __user *filenam=
e, uid_t user, gid_t group,
> >               int flag);
> >  int chown_common(const struct path *path, uid_t user, gid_t group);
> >  extern int vfs_open(const struct path *, struct file *);
> > +int vfs_open_consume(struct path *, struct file *);
> >
> >  /*
> >   * inode.c
> > diff --git a/fs/namei.c b/fs/namei.c
> > index 3f9bf103ba12..f71481b9bf8f 100644
> > --- a/fs/namei.c
> > +++ b/fs/namei.c
> > @@ -4789,6 +4789,7 @@ static const char *open_last_lookups(struct namei=
data *nd,
> >  static int do_open(struct nameidata *nd,
> >                  struct file *file, const struct open_flags *op)
> >  {
> > +     struct vfsmount *mnt;
> >       struct mnt_idmap *idmap;
> >       int open_flag =3D op->open_flag;
> >       bool do_truncate;
> > @@ -4830,11 +4831,17 @@ static int do_open(struct nameidata *nd,
> >               error =3D mnt_want_write(nd->path.mnt);
> >               if (error)
> >                       return error;
> > +             /*
> > +              * A dedicated reference is needed because after the call=
 to
> > +              * vfs_open_consume() we no longer own the reference in n=
d->path.mnt
> > +              * while we need to undo write acess below.
> > +              */
> > +             mnt =3D mntget(nd->path.mnt);
>
> Is this needed? The file cannot be closed until after open(2) is done,
> so how can that ref be lost before reaching mnt_drop_write below?
>

do_dentry_open() whacks the ref on failure and I intentionally did not
change that to keep the patch small

> >               do_truncate =3D true;
> >       }
> >       error =3D may_open(idmap, &nd->path, acc_mode, open_flag);
> >       if (!error && !(file->f_mode & FMODE_OPENED))
> > -             error =3D vfs_open(&nd->path, file);
> > +             error =3D vfs_open_consume(&nd->path, file);
> >       if (!error)
> >               error =3D security_file_post_open(file, op->acc_mode);
> >       if (!error && do_truncate)
> > @@ -4843,8 +4850,10 @@ static int do_open(struct nameidata *nd,
> >               WARN_ON(1);
> >               error =3D -EINVAL;
> >       }
> > -     if (do_truncate)
> > -             mnt_drop_write(nd->path.mnt);
> > +     if (do_truncate) {
> > +             mnt_drop_write(mnt);
> > +             mntput(mnt);
> > +     }
> >       return error;
> >  }
> >
> > diff --git a/fs/open.c b/fs/open.c
> > index 6b1c14e684a9..2a7697cee00b 100644
> > --- a/fs/open.c
> > +++ b/fs/open.c
> > @@ -931,6 +931,11 @@ static inline int file_get_write_access(struct fil=
e *f)
> >       return error;
> >  }
> >
> > +/*
> > + * Populate struct file
> > + *
> > + * NOTE: it assumes f_path is populated and consumes the caller's refe=
rence.
> > + */
> >  static int do_dentry_open(struct file *f,
> >                         int (*open)(struct inode *, struct file *))
> >  {
> > @@ -938,7 +943,6 @@ static int do_dentry_open(struct file *f,
> >       struct inode *inode =3D f->f_path.dentry->d_inode;
> >       int error;
> >
> > -     path_get(&f->f_path);
> >       f->f_inode =3D inode;
> >       f->f_mapping =3D inode->i_mapping;
> >       f->f_wb_err =3D filemap_sample_wb_err(f->f_mapping);
> > @@ -1055,6 +1059,7 @@ int finish_open(struct file *file, struct dentry =
*dentry,
> >       BUG_ON(file->f_mode & FMODE_OPENED); /* once it's opened, it's op=
ened */
> >
> >       file->__f_path.dentry =3D dentry;
> > +     path_get(&file->f_path);
> >       return do_dentry_open(file, open);
> >  }
> >  EXPORT_SYMBOL(finish_open);
> > @@ -1098,6 +1103,7 @@ int vfs_open(const struct path *path, struct file=
 *file)
> >       int ret;
> >
> >       file->__f_path =3D *path;
> > +     path_get(&file->f_path);
> >       ret =3D do_dentry_open(file, NULL);
> >       if (!ret) {
> >               /*
> > @@ -1110,6 +1116,25 @@ int vfs_open(const struct path *path, struct fil=
e *file)
> >       return ret;
> >  }
> >
> > +/**
> > + * vfs_open_consume - open the file at the given path and consume the =
reference
> > + * @path: path to open
> > + * @file: newly allocated file with f_flag initialized
> > + */
> > +int vfs_open_consume(struct path *path, struct file *file)
> > +{
> > +     int ret;
> > +
> > +     file->__f_path =3D *path;
> > +     path->mnt =3D NULL;
> > +     path->dentry =3D NULL;
> > +     ret =3D do_dentry_open(file, NULL);
> > +     if (!ret) {
> > +             fsnotify_open(file);
> > +     }
> > +     return ret;
> > +}
> > +
> >  struct file *dentry_open(const struct path *path, int flags,
> >                        const struct cred *cred)
> >  {
> > --
> > 2.53.0
> >
>
> Thanks,
> Jori.
