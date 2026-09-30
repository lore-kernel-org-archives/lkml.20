Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58E351C11
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761541; cv=pass; b=NirCj5DaIKMo5VzQeAa6DEm01BAjEtXhEBPHvRJH975HogrV66xAGKHecHc4D2wrlOD3xg1OGv6uT0s3yGNL4MX4gwdChC7qakQYqfG9hDFpbncB7woo43zIxYlt+s3ZSLIijN5vKd+tr45yBDvhuerXUSmrBFfU6qHMe1Ztav4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761541; c=relaxed/simple;
	bh=MfkGYre0cHCVfMk8gcn5Fzn+7h5AeTZ619u3NXLb8CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1vd8+NKNOJM5YLRj+aEBQ540YVVdOukMe8hpgtNug2fxRGPIQ4vY5Re4IpiFV2CThmTuGuIPghpvy0yJcK1SuGBzUWbvFNMNqLbd9NJgfFcETwzhDPtq0ZbLsOVdTZSiJ8iQd/5Apl7cIYBQw2WI6JZelI7fQnG7VT1vsjUKHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDJcnY7q; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDJcnY7q"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acae8342d2so2899436a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790761538; cv=none;
        d=google.com; s=arc-20260327;
        b=sb9ZBKsVmppQmncazdvkKdAwXjHTGr8UFqTZsWHjF8S4DM6PbKgF7mdbhLdsf3X0B3
         QIiOMlqHJpCgarEEmW05WfADwIod1OTE3+2YOL+XpOOVko33xpgFQCDIBYmm7Pxo9JY6
         hqRFG3GlaYxAFsQu4fYOtn8jF4qd1JDNqE6BvXjuO53z9qijO7EZ1nAo4SdRZ7qWiJsI
         PFmN1Wg0pvdKjNf4YNZzohRHZDBI06roxQh2tm7X6ujWNwEtqmvfe9xX6hQP3Yxx1uqu
         OWSgyqG/UA6/VKKQ38O70pVleNRl5h7NIE7+csDEKDxl/mqSEPGW0XYrvu3KA1izYvRR
         BjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FHARCqAQXbn4+WxBdhSm8GRSqop6wznDNIi8Um122T8=;
        fh=Og3oph6FkU65lTkDWqMr9fmmLd/ErFp08SZql4e+oKo=;
        b=pMBPqMWlvAPFY3wp2yd/02Sb4hEgA5hwX02PaiOlSKc1SWIaNCAt3wKRS8ni7x1xzr
         Xy8rt8F2w3q2QJtqsUcl3WQoQz0WUqGrykSjaiqJUlKhLRQwDTPOsFLuiAK6ycKP2/X3
         RtzytDL5En2tO8HgfOWNQ+PWYMNeyGCnuDHJgmhCGhTe342zW8WpZH2bscPVHody2NbP
         1HxYBPRZU6O1KKDmFudjQilGQan/kVtK6d5A9KxKImu+XeIukOJt9aBF1ZUCtRwS2R6A
         HXnMCu4N+3ysvyC59k5yjH/opt4zoOoKJcFRtmtdTCWRZ6OoTUGJY6VT3mjtzhQMyo+h
         uneg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761538; x=1791366338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FHARCqAQXbn4+WxBdhSm8GRSqop6wznDNIi8Um122T8=;
        b=aDJcnY7qKkXcbhOiGzogMZjoij3sYu12Vp4wFVRW9b2ZhHCsLJhFOG3UbGkLnhK8zx
         KTpeLOIsFc3eRdd/Dnlw27uRR6BQIcH3e6VPUH9X7lZGMHywPnAc+YrztUgBcdB6P2tY
         GkJvsO03vXfcT8GKU8ERW6/IhO2uJJgezW6V5xGaQgNKxa7RT35NZsGNYLtvBa/Gwm7a
         SCMOi7oAC3TPfoti8ZxIqM8CXFqk236Zqy7FyJ7ug7ZK3bePtpik0rL+rCpO06B0BkUv
         nEo3awzTni/nnUTMv5z0p6BDCo9wZFhTaot+4WlJsSd2HyuCZ8+zR9iBB9Wt7wo3Afy+
         7hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761538; x=1791366338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHARCqAQXbn4+WxBdhSm8GRSqop6wznDNIi8Um122T8=;
        b=VsZJvpQ8vV37C1Ji+sxEnSdsUrWeIrFOU2yIn6pWuo+gCGginGx7YZvv/1uPv9PZZ7
         t0OSz5r++ULuVkjZedhZcS1YNohhJPC9BdNERDJ2KnVM6iWwbL2QpFWCr6a+8sMGkIcb
         jUKTgZl+nxnE04TyggvP+t4VCCJk9IA74zjtF2001wm8rKTbHWi0d1TjxnlPTWZ41hhP
         +P+zBN0sFsZsW5naKZhKs6UG6tndALF/seshJdGm6JEWR6x/OTxnZWYnQfFYChTzTDhT
         XnMj7BwXUZPEjxufTRe6hAfSyGZC6iBpCBUhfGL1+MGlJ0dc7WTXTGTxU4TTEUJysA75
         EH7g==
X-Forwarded-Encrypted: i=1; AKwUvBwzzbNN2qepNbQf/0jwR8izgWq5rwhHu1DR4MWwj82UlmaHyB7NGsRQs1v5Vl6ricdtIxeC3BP+AOz8aJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlkfyPb67LQBhUkmjc3L4xAUv+5oP5hjj9TqKQDWkzsnef638r
	anUkSi7E/87lIOnOOf8VjVSp17GwrFKa5sqLfCH5gFubxNu3y2wX9eoEnN5ApTusQXy0oli+nOb
	N+TXsISL5kAGo4jruDni5wx1ETpR+W1c=
X-Gm-Gg: AYBFou0zfHX9+GFCA/nW+PKO7hOsrp1qQ2MZI/ycqcO1xW5Lz+nA8RfZQfWtcb0JvaD
	gps3UsKeE0qy2wh6yaYNkdXW0+z4eZKFGbd+fSNorGcFumXbJYccdUCRu100rwYG3EVSebzVZtL
	Uq06yaAUmlGEM1TTcZNeLd0s7Ux3Ht+ZMmaQWhjQFJKsk3QmjXloWDL7ko8FIj+Nc/0P+LmEY0z
	y5/gx5DjbNxIB7O5b5ofWJAdi7nBzLZcESMy/geSauBC0rHKUx5NdBbQCofLbsd49H7OrsScLGN
	a0NCELpcBGZ9uVQPvg5o2yKhcm2fq+MDC947WMVFbdx1dOCZNFQWiOgM
X-Received: by 2002:a05:6402:27d0:b0:6ab:7700:9371 with SMTP id
 4fb4d7f45d1cf-6ae19949151mr494749a12.25.1790761537887; Wed, 30 Sep 2026
 02:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913185016.523376-1-jkoolstra@xs4all.nl> <20260913185016.523376-8-jkoolstra@xs4all.nl>
 <20260918-reklamieren-syndikat-gemildert-763b72008b46@brauner>
 <178972607557.207413.4312278359822083538@noble.neil.brown.name>
 <178977609418.207413.15011378414000392029@noble.neil.brown.name>
 <1010887891.582666.1790682845752@kpc.webmail.kpnmail.nl> <179072013439.37859.465558431050704411@noble.neil.brown.name>
In-Reply-To: <179072013439.37859.465558431050704411@noble.neil.brown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 30 Sep 2026 11:45:26 +0200
X-Gm-Features: AclHuK8Amj1Yr5P1E2teJ2-t4xn3JttqZscbtcEuqEUsIh1tIwH5q_lJG3Wg0dM
Message-ID: <CAOQ4uxis4tsea6fx+9iAffVX+qwBC9KzHg5GcP7ahthKd1T9KQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] vfs: add O_CREAT|O_DIRECTORY to open*(2)
To: NeilBrown <neil@brown.name>, Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Aleksa Sarai <aleksa@amutable.com>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:15=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrot=
e:
>
> On Tue, 29 Sep 2026, Jori Koolstra wrote:
> > > Op 19-09-2026 02:01 CEST schreef NeilBrown <neilb@ownmail.net>:
> > >
> > > >
> > > > nfsd_create_locked() used to do that before vfs_mkdir() could retur=
n a
> > > > dentry, but it doesn't any more.  The reason was because
> > > > d_splice_alias() on might return a different dentry.
> > > > In this case we want the same dentry, but we need to do a lookup on=
 it.
> > > >
> > > > I'd rather fix this in kernfs, but maybe that is a longer-term goal=
.
> > > >
> > > > The comment in kernfs_dop_revalidate() suggests the we should d_dro=
p()
> > > > the negative dentry and d_alloc_parallel() a new one and ->lookup t=
hat.
> > > > I'm not certain that is needed if we keep the parent locked, but we
> > > > would need to be certain.
> > > > We at least need to d_drop() the dentry before ->lookup as ->lookup
> > > > cannot handle hashed dentries and a hashed-negative dentry is passe=
d
> > > > to ->mkdir.
> > > >
> > > > I wonder if we could just disable O_CREATE|O_DIRECTORY on kernfs ..=
..
> > > > probably not.
> > > >
> > > > Summary: I think that if vfs_mkdir() returns NULL (success) but the
> > > > dentry is negative, we need to d_drop() and call ->lookup with a bi=
g
> > > > comment about kernfs.  But we need to double-check that this will d=
o the
> > > > right thing with ->d_time (I think it will).
> > > > We also need to think carefully about races with
> > > > kernfs_dop_revalidate(), which could happen concurrently with the
> > > > ->lookup.
> > >
> > > I've thought a bit more about this ...  I think that doing a lookup a=
fter
> > > the vfs_mkdir() results in a negative is a bit ugly.  It assumes thin=
gs
> > > about the fs that I would rather not assume.
> > >
> > > I would rather have the current proposed code check for a negative
> > > dentry, and fail with -EIO or similar.
> > >
> >
> > I just noticed that there's precedent for this in overlayfs in super.c:
> >
> >               /* Weird filesystem returning with hashed negative (kernf=
s)? */
> >               err =3D -EINVAL;
> >               if (d_really_is_negative(work))
> >                       goto out_dput;
> >
> > Shall we just do this for current kernel release, then we can add suppo=
rt
> > later if wanted.
> >
> > (But let's do EOPNOTSUPP instead of EINVAL)
> >
> > What do you think?
>
> The problem with this approach is that open(.., O_CREAT|O_DIRECTORY)
> might create the directory, then return -EOPNOTSUPP.  This is weird and
> I'd rather it not be visible.
>
> Currently O_DIRECTORY|O_CREAT results in -EINVAL.  I would rather it
> remain a -EINVAL on any filesystem which doesn't completely support
> the functionality.
>

Joining late to this party so apologies in advance if my questions
have already been addressed.

I agree with Neil's statement above, but IMO, the atomic_open() fs
match the description of "doesn't completely support the functionality."
Therefore, I think that rather than success if directory exists, they
should also return -EINVAL/-EOPNOTSUPP consistently (see below).

> To do that we need some way to detect kernfs and tracefs.  I think
> the only way we can do that is to make some change to those two
> filesystems.
> Maybe a new  SB_I_ flag in sb->s_iflags would be ok in the short term.
>

Maybe, but then I think we should also exclude all the atomic_open fs.

Food for thought:

If you agree that tracefs/kernfs and <network>fs should have consistent
"API not supported" behavior, then gating the flag combination on
sb->s_d_flags & DCACHE_OP_REVALIDATE covers all the fs that we
want to exclude, plus some fs that we shouldn't really care about.

My agent tells me that the list is:
afs, coda, ecryptfs, exfat, hfs, jfs, ocfs2, orangefs, proc, ubifs, vfat

Two exceptions that we MAY care about:
1. overlayfs DCACHE_OP_REVALIDATE is derived from underlying
    layers per dentry (If any of them have the flag) but always has it
    in sb default_d_op, but it could technically derive sb->s_d_flags
    layers at sb fill time, without any behavior change
2. encrypted/casefolded directories with fscrypt_d_revalidate (ext4/f2fs)
    with CONFIG_FS_ENCRYPTION=3Dy
    ecrypted/casefold is the non common configuration, technically
    sb->s_d_flags could be set according to sb features at sb fill time
    without any behavior change

Thanks,
Amir.
