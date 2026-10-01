Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0740B4F68DD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854164; cv=pass; b=p+RXLNMZtMiC1eVzdSrMbWGYSAF9u4dgGAud1fLtI/1gcLcMP2zsT9/YoMOzER73EzN2kTc5eVYvJ7Wd1FiDaht4CKSMhuy+M/3GkCppjgcpJ2ropbZUHSe9aD/9YrGN0G4SwgrDaKe6OJezwJ/9uRun2Yd+W6wPeH1la13vL7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854164; c=relaxed/simple;
	bh=Ot1+xCJHzq0e02e3Cyh06QAAuD68wjvmC/Hp2Hqnjv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdrHkn2eFIuCXJp5Vs4pooYEiwl6ctDrohjzCNd1Lgf3cE7nkAZhXfvM9Pvbf7kqta5Yto9gX4c8sFiFW/skTLrsXxNbz30Zb0U35awvWe5PW1MFMDEvNKE3goIaaPYjdY7Nlr04ZiGfPGdCHqmS/eiak45xIBaN5+6Qjyh5chc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lK9BTSGK; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lK9BTSGK"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so8841094a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790854156; cv=none;
        d=google.com; s=arc-20260327;
        b=i02DWGPsO6+UKmJ42OQgDEgBPg2jl1eOcTQIrmChHgoJciO14UoNNGujFFO1KAywR6
         QKt5cSfNiN3lLMYVXSabBDBdu46FMxZwSY51FVn+KxQqgL/IryCy61VoeS14NK94ZpVd
         iLh2p4zciiJaBBfElZAIQc2sucGJJBJtPL3qbKFYTMqN5pelaQkRlAxAxKNbCUCxERn3
         PwSp3ldYj+NbK8PQ1biqQ5RON2Mxll2kFTjbFRI7OgtpFKm3CGYM0dvapd3NlWB+bQ6K
         5JW9hQVFas0H9fI8fZlyBUYcFFg+8MHWKVptY01dlxv1vVul3ZxxhcdymDxxnt+nnLkT
         QBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RmUrB8DoICBbcpN5AXnNeG9QLbqxZWqBz7y7VYPLydw=;
        fh=Ag5dEHb/u847F1gdRj8xXx1A+TewMkIzIknKGYGjyNY=;
        b=iNLtkEpH51OALbPT7Nu1l/PzKDJyFPSoGjDUb/w9PTO90NFOOwYdtLnacP2wmUYa5o
         3HXGmympsrcou1bAxsGnAeCOoXojUqqDLR80aQwuY/MCBzJJiZWZJG+7jsDLhxfolPJx
         c5Xlyu9d7Lr0d/uqeghgc1V3sj+aYwbJzLT4xl2wIHIr2E96JCDPgT5ptR9QKAXaUrt5
         GAQUK1KqoKduBDLoVbF4gRFwC516ehGJPTz0hnCCjR/X3r+u3Y5LrQiwNoK5WTKFRcSD
         ZopDmYXSe+8/uhLAGHAHYlMO7yqnrlVIlUrw0XE5WgLlDOWR6pulgFtYMJoBqhtdkSoW
         ymBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790854156; x=1791458956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RmUrB8DoICBbcpN5AXnNeG9QLbqxZWqBz7y7VYPLydw=;
        b=lK9BTSGKwiblSiz/mizW948fGsD3gAFBTSoQCy8JrRIaHOJfpP9rjdTHnBtAaU8dYV
         HvesHu2KyEtZigjSGOz3c/0KzNFQyNwuycConmFRBxj28ZvrADyWw/ZIJiBBJLLBZTOE
         nAALkx7ooMm179gdNsj+7rMfNBh76ioI7dZGhbrQ5m8Wk35ABrsoZoDWaSHH4qO76z6z
         EERjO/Wc72cQNP+zhxF5Z/f2pg+fxKdoLLB7pIMO5AdcarVRxreJe8kNrBHWZUOnRvGl
         lk3ZFHayF2xQuSEnlaTQPzjgnAUcxP0/Gegu64CUvIlLamSDJ+M3XvYL7wLmFOTebtyL
         x7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790854156; x=1791458956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmUrB8DoICBbcpN5AXnNeG9QLbqxZWqBz7y7VYPLydw=;
        b=cq0an9qa4p6xEjnlhI/0G1ngVYi9P5WC4czvwuJlg5Rt2/EB90EC5uzAjWB79LNz9/
         2h1MEQmLK9Re+keaJdz5bY+6da6iP0zDvdI0KRQi1ArQkcu8Ksfgep0OXvdPe63yAVv3
         UOqQFr26KML9XJs3ka4ujSrEm/3ZmHUXUzILpVZ7cjR4ar+7sMVzebIvdlMAesorJxNk
         2F0uKU8yB7NuRmZbxJdttnr3EqW5WhfrG0TRSrWB79zohYpY8pm/6mH/qNHueNt822Vf
         ylo0htwwKmUamIDzxsFDPb2FtXjzyuJyH68FywKhyv7Apl7gvGV6gt7oG5rsHT5YOAQO
         uciA==
X-Forwarded-Encrypted: i=1; AKwUvByPHXTXpMvYUCdFxGPCASID5sVUEnYNiu9Mz6dApPxvJ4wb8ydbmPDS44Jw4F4MfAtuge4ZidC8EiS4QbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYQkkQbZ1RPZxr+3UNIiYCrugtcY5eCtHa2E9j0KnvdOAkcrxD
	S8lsC2stNp6Q3ZbAxBRPZJDVIL9MIWNBcKBpSibzgLpRR4/4dzr+BC/kXJRDtlRIS/rSV1gTkM4
	NYHsM07UpyPSrENn/M22RyKn+6P08S7nipAf7vfs=
X-Gm-Gg: AYBFou2q1ognfcHPse0OF9JjXYo03Ieygkv7max0rmdymaSsn8+dr/+//EBTcZ5mX/4
	1PBbFq/VkO+GKyDTMjzkccHoke8nwk1iBlE8TeQrOkJo+yk/p6vq+Gqp9wSLT2UuHsNrVvqXMJb
	t46Wl/M/DPBkYakpyl4r2zGeZOfyhEc8kccvnns7OGAJ8b+jE7AKUiaD4mQX7mAvEO1aU3d4VEj
	+82HtVOZi07SZL1sT2uD+bqmEZ047Q5jpvjqnyhvqrleEE0YWeqVFuA/17GhP9TNThXgI0jIWK5
	moEDtwhWSqv79z5UpWK4H5+bbx0byN2RMciSV/smdRAMaAowK74Heydv
X-Received: by 2002:a05:6402:a544:20b0:6af:92a6:97df with SMTP id
 4fb4d7f45d1cf-6af92a6a414mr43983a12.0.1790854155697; Thu, 01 Oct 2026
 04:29:15 -0700 (PDT)
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
 <CAOQ4uxis4tsea6fx+9iAffVX+qwBC9KzHg5GcP7ahthKd1T9KQ@mail.gmail.com>
 <1910540525.790746.1790806610320@kpc.webmail.kpnmail.nl> <CAOQ4uxhYHf-gAkjdhs37vZREOcNds5a_6c3nBX0Lva3resofmw@mail.gmail.com>
 <179084933040.37859.13445625413196658440@noble.neil.brown.name>
In-Reply-To: <179084933040.37859.13445625413196658440@noble.neil.brown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 1 Oct 2026 13:29:04 +0200
X-Gm-Features: AclHuK_pcBihlxtanRskirK29rw2qS74wFNrXL56cTDsIdZmgFEUTJL-6VkpUbc
Message-ID: <CAOQ4uxhryRbKojbMDA2Y9u4o0sNUVTt8KshacWqqEJYb-EYnzw@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] vfs: add O_CREAT|O_DIRECTORY to open*(2)
To: NeilBrown <neil@brown.name>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Aleksa Sarai <aleksa@amutable.com>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 12:08=E2=80=AFPM NeilBrown <neilb@ownmail.net> wrote=
:
>
> On Thu, 01 Oct 2026, Amir Goldstein wrote:
> > On Thu, Oct 1, 2026 at 12:16=E2=80=AFAM Jori Koolstra <jkoolstra@xs4all=
.nl> wrote:
> > >
> > >
> > > > Op 30-09-2026 05:45 EDT schreef Amir Goldstein <amir73il@gmail.com>=
:
> > > >
> > > >
> > > > On Wed, Sep 30, 2026 at 12:15=E2=80=AFAM NeilBrown <neilb@ownmail.n=
et> wrote:
> > > > >
> > ...
> > > > > The problem with this approach is that open(.., O_CREAT|O_DIRECTO=
RY)
> > > > > might create the directory, then return -EOPNOTSUPP.  This is wei=
rd and
> > > > > I'd rather it not be visible.
> > > > >
> > > > > Currently O_DIRECTORY|O_CREAT results in -EINVAL.  I would rather=
 it
> > > > > remain a -EINVAL on any filesystem which doesn't completely suppo=
rt
> > > > > the functionality.
> > > > >
> > > >
> > > > Joining late to this party so apologies in advance if my questions
> > > > have already been addressed.
> > > >
> > > > I agree with Neil's statement above, but IMO, the atomic_open() fs
> > > > match the description of "doesn't completely support the functional=
ity."
> > > > Therefore, I think that rather than success if directory exists, th=
ey
> > > > should also return -EINVAL/-EOPNOTSUPP consistently (see below).
> > > >
> > >
> > > The issue with this is that if you want per fs atomic_open() opt-in (=
in
> > > contrast to either implementing all instances in one release or disab=
ling
> > > all), you have the issue that your lookup now depends on the caching =
status
> > > of the directory dentry.
> > >
> > > If that dentry is in cache, and positive, d_lookup() earlier in looku=
p_open()
> > > makes it return early:
> > >
> > >         if (dentry->d_inode) {
> > >                 /* Cached positive dentry: will open in do_open(). */
> > >                 goto out;
> > >         }
> > >
> > > So you get your lookup. But if the same dentry is not in cache, now y=
ou
> > > suddenly get -EINVAL. I thought that behavior was more unwanted then
> > > what I eventually settled on, namely to strip the O_CREAT bit.
> > >
> >
> > Maybe I am missing something, but I think you misunderstand me.
> > What I mean is - if directory inode has a ->atomic_open() op,
> > bail early with -EINVAL/-EOPNOTSUPP, because this is a network
> > filesystem that does not support atomic O_CREATE|O_DIRECTORY
> > and in most likelihood never will support it.
>
> NFS can certainly support O_CREATE|O_DIRECTORY.  The MKDIR request
> creates a directory and returns the file-handle of the directory that
> was created.  I think other network filesystems return the identity of
> the created thing - or fail if it already existed.  That is enough for
> full support.
>
> The only cases where I think I think there is any doubt of support is
> kernfs and tracefs because they don't return the inode.  tracefs is
> interesting because it drops and retakes the parent lock so it isn't
> immediately clear what atomicity is available, though it doesn't support
> rename at all so maybe there is no interesting race.
>
> >
> > This gating criteria is not dependent on cache state,
> > which is what we wanted.
> >
> > The justification of using ->d_revalidate() as another opt-out
> > is that existence of ->d_revalidate() means that the state known
> > to dcache is only semi-reliable, so making atomic create/open
> > promises is problematic (O_EXCL for example).
>
> The idea of using ->d_revalidate as a gate is certainly interesting.
> Apart from the interaction with case-insensitivity, if we initially only
> supported filesystems that don't have ->d_revalidate, I think we would ge=
t
> coverage for enough filesystems to be interesting.  We could then take a
> bit more time to think through the rest of the picture.
>
> I don't think O_EXCL is at all problematic.  ->mkdir() is already
> required to return -EEXIST if the directory already exists.
>
> >
> > The problem is that some fs (overlayfs/ext4/f2fs) register
> > a mostly-noop  ->d_revalidate() so I proposed how to deal with those.
>
> Presumably the fs would provide two dentry_operations structures and
> choose which to pass to set_default_d_op() when creating the superblock.

Yes, either that or clear sb->s_d_flags & DCACHE_OP_REVALIDATE
when d_revalidate is not going to be used.

> Doing that would even provide slightly better performance in the
> case where no d_revalidate is needed.
>

Very slightly, so this should not be a reason, but advertising corrects
contracts to vfs.

For example, if overlayfs would want to install:

static const struct dentry_operations ovl_dentry_real_operations =3D {
        .d_real =3D ovl_d_real,
};

It needs to know that none of the underlying dentries is expected to have
a d_revalidate op at super fill time.

Thanks,
Amir.
