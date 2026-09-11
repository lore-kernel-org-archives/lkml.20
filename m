Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD548D896
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161079; cv=pass; b=kLOa+qMDISXol+CQw5nRRR3PIK2ytDdA4newNznljRMGOADxc1IEG/dcY7CbsQXgHRzdkuEE4Xu8kZVE0lNAj0CdU5BbzJRhCh0NLb2NCeNKUO85780NLAkpqsmPBZr/hc64ribD4Y5GAoeOz2TtnloSGhkdKj1ggh7s/UrF6iQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161079; c=relaxed/simple;
	bh=qtfRGgc0150IdS009KTkrjseWK9uySmbmCuWcYChZ9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpZ1m/rp2pHUZ8yoHrgXgJEKx0ixXB9QYQJ291CUbiwedwE/YyPyR3b/RUUT7x6Xhp73C48UO7pd3d/UhsCrIf0mk1+KEHgRr1HzS+Ob9lw+hOfbPZ4vGMthLr5zhIdgbHfPg8E/QEIEURlDoyIQW73F6G+AalcXxP8Ny7RdqB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wUoioV8K; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wUoioV8K"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so343803a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789161077; cv=none;
        d=google.com; s=arc-20260327;
        b=gfX5WJBTtRfU70PoAJLkw3UWz/9nalwaS2bgcDOSPA7US9KnlSZ6+duz5tD2TIYIse
         UABAJegff9527VGmsWgN9xraQdixRF49BX+jzqHvFg98QiJfO5QnMYiA3HbGRa1tnXtP
         Or4MNre/reeGe+PMncoCbmUZJsZl/zXwPc6gdN+bSGFHuDaxGe2u6Qp/F6RRXKTtIQH0
         rtc4Joi6QK27nKcj3Sx1Q0LSPeIsAclA2W+E0cWarMZzMIYv9NgJ9r5Q/V0xd9Kr2NcL
         hm4gVTjY2jes8K+0jE9a7DtYrLHRTS6Q1sCnh33aNqDag7+rAYsAV7SstQN/32XUy43l
         9DBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c6HV8uHNfHnA3I2z6iazz6poKohSe+yKAEsfT8M/ffc=;
        fh=ZzOI6ZFigso+1N5JWc5ndTJIL2thxLI9V74D2atPTEE=;
        b=rho99bRYHEKjmJT8eZ2HQ1gt/axxG+ZoXO8evu7oav6X8QWhIUXxBh9GuboVjLK8vi
         gqY4SUw2Y/e75clDX7JlwtUze0TvPi+VekJ5mMAj+2ebvz76srnN4edVkALcy33iJ1SN
         F1mXeTncylg+jARRV5JZ7mu85bRzO3W/KBULeKzIjBu6tY4DAO30dIjPVpwvWCs0iBst
         mT2vmpeNjRcWpSapm1SZsU+0E8tY7Pq9U+YG9iQNrzxs7X5/GeCEt7ToVtDMiEoknQBB
         172iITuQ3ig9cp2gB4jCwvW2RW27rd2e2k7NPe0k3kCVDYDMTDbPTsMmT4CK6Vn6kgdW
         jiTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789161077; x=1789765877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6HV8uHNfHnA3I2z6iazz6poKohSe+yKAEsfT8M/ffc=;
        b=wUoioV8KmTCjJby31NYdsmi2gDM8dWfScP6aBTPzSPvTzWkRMWo+sqNJ5Qe07TA2+Y
         FFCQITvw4HrSkjgBpoQ48nr2mhDwNDiJ/zlvlw9Yp2QAaWUPQ2OVBQYhqSGAQ1sRaDPr
         PH7GHWil68hH8D9OHJgyVVxNN4LjpyDLPUT+AJx1yjUIBXceIgjnvBP+gGkA+ixasXHc
         DE2dUnWtjwCcsF/STMUiPGWu6i1RxS8steSH0FSwy6SLhTJTiT+lU18knXI9g+s446S4
         WrBl9XCzcx9yNRE4C5u4kuyHUwxBK6S7Q0bDZ1i8saeh+vyLcFNJvJeERUpCrege3KWY
         UUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161077; x=1789765877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6HV8uHNfHnA3I2z6iazz6poKohSe+yKAEsfT8M/ffc=;
        b=VWvSK8iuAgslUDUej5e8DLNpDCSzV4L/xcsC+E4goUm8SuySh/paE4joxcBPiNyplg
         4TCy9Gma5Z2lAB30CdndO+BL0oLaSTIFoEWg7INnlAw5raL8Hvw2P8I2TkA9UA07u/bd
         E451mjZBNQr30Vil/8PSUb8Awur+pboGGffDvEtugK9MGGtDkxDFg6YJiyZt0zi+SI7e
         zcbC8U9+x6ZPCj2cMM7/vyPq0unOvbn66yPNTHY/W0Pj2RoLnqnav3TWFARnEWMMKPGP
         xVsm5qLOnpqRaMNSlrfaMZt6w9y+4m3au3eCwrptYAbYRQkNNNp5hgWLj4h2v7qdB5Oi
         oknQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6wh2ap2pYU4b+wfi+JSsxCPzP3FbHXtZX2WFblrHjQQYp5E9lSOznB93JKSesv1e8zMT8umrQS3TyuSY=@vger.kernel.org
X-Gm-Message-State: AFuF++nQpn6UjuAoP6RS/5TrgZTLyHXdC4NoQkEkS4vaKnab1bAfXjUS
	RmCqDJVgpjbikc5/ahwMSo5jTYB6ISUV5QT2fy9JJ+kvx3ubD8T4h4H4kKDGM0VA1DGdMlsfdH4
	OwlNycX83grUYICMeUXdka7ePVa1oY5+Y4RtRBXbGxgqOJXqLIqp0QwwWtTI=
X-Gm-Gg: AYBFou0X92uGTn5bU/LXV0R8c1hiYsg9T/Kp1nNXZa0W4LSdDa8OeGcivyYFJ4QSDNH
	ZY3XejwVBs/5QQqNeqNDo1Ga09q+Mhi/O19u3+eycFpCrLwDUVGZtDIE/b3XoTo1envztpPVB/H
	r7WYvpeBVd65qTOrkCyqEidCXiykPA/1vpQ2cfI3sXk3XNQrFkS2q1TiPG6pY6DIB9nG3Z8Z1tB
	vOuws4PECJ9UtDFEs9AajjRHFb4VuluRK5uxc2otgXLfm/GVisOPM5mf8zFC5QNvdNIC2I0HBJj
	cWhWe4yQxvdIyukZkCypvZgLaQmBvYRn9f+BFuKbSMlXUAjA4nqZBIXL
X-Received: by 2002:a05:6a21:a95:b0:3da:6bdd:2c74 with SMTP id
 adf61e73a8af0-3daed306372mr12662047637.10.1789161076494; Fri, 11 Sep 2026
 14:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901180713.4185641-1-dmatlack@google.com> <CAEvNRgEs82CVTL_CUn=Ovrwvt86U1dxzr8psWGu=nk98ZH6Esw@mail.gmail.com>
 <aqRFSiicubfsw3N6@google.com> <CAEvNRgFCrcyk6F0vJ11pgj2EDSUAXj6Zw-oEdZpfj2SrH1Cv9g@mail.gmail.com>
In-Reply-To: <CAEvNRgFCrcyk6F0vJ11pgj2EDSUAXj6Zw-oEdZpfj2SrH1Cv9g@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 11 Sep 2026 14:10:45 -0700
X-Gm-Features: AcwNN1VPqi3zVmYZAELfBj-CBxTUTXJC8KC_tY6rHii958hpSbyM_Grda2-osHc
Message-ID: <CALzav=cKG9hXskFgQfub3Jg5O-rKUWBe8TBcPdJz+tBKzenFrg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] liveupdate: LIVEUPDATE_SESSION_RETRIEVE_INTO_FD
To: Ackerley Tng <ackerleytng@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:59=E2=80=AFPM Ackerley Tng <ackerleytng@google.co=
m> wrote:
>
> David Matlack <dmatlack@google.com> writes:
>
> > On 2026-09-11 11:04 AM, Ackerley Tng wrote:
> >> David Matlack <dmatlack@google.com> writes:
> >>
> >> > This series adds support for LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, a =
new
> >> > UAPI to enable preserved files to be restored into a userspace-provi=
ded
> >> > file instead of a kernel-allocated file, and uses this to support
> >> > preserving tmpfs files in-place without any changes to the LUO ABI.
> >> >
> >>
> >> I'm interested in the idea of retrieving folios into an fd for a
> >> different reason, I'm exploring handling over ownership physical memor=
y
> >> to a guest_memfd.
> >>
> >> > The Live Update Orchestrator (LUO) API currently explicitly returns =
a
> >> > new struct file for every preserved file during retrieve() (e.g. via
> >> > memfd_alloc_file()). This then forces userspace to use anonymous mem=
fds
> >> > for all in-memory files it wants to preserve. This works reasonably =
well
> >> > for VM guest memory but does not work well for other types of files =
that
> >> > userspace may want to preserve (e.g. in-memory logs, binaries,
> >> > configuration files, etc.).
> >> >
> >>
> >> Does this assume that VM guest memory is usually provided using
> >> anonymous memfds?
> >>
> >> More generally, is the problem that there isn't a simple way to
> >> implement retrieval into anything other than anonymous memfds?
> >
> > Roughly, yes.
> >
> >> > Preserving entire tmpfs mounts in-place would require a large amount=
 of
> >> > kernel support and would effectively make tmpfs an ABI, which is a
> >> > non-starter (or so I hear). Instead, we can delegate the reconstruct=
ion
> >> > of the tmpfs mounts (directory structure, permissions, etc.) post-ke=
xec
> >> > to userspace. The kernel just needs to preserve the contents of tmpf=
s
> >> > files and provide userspace a mechanism to restore those contents ba=
ck
> >> > into a specific file on the filesystem after the kexec. Hence,
> >> > LIVEUPDATE_SESSION_RETRIEVE_INTO_FD.
> >> >
> >>
> >> Suppose pre-kexec, the data was in a tmpfs file (and fd), how would th=
e
> >> preservation work? Would the user have to
> >>
> >> 1. Transfer the data from tmpfs fd -> anonymous fd
> >> 2. Preserve from anonymous fd
> >> 3. kexec
> >> 4. Set up the tmpfs fd
> >> 5. Retrieve into the tmpfs fd
> >
> > No, the proposal in this series is to support:
> >
> > 1. ioctl(LIVEUPDATE_SESSION_PRESERVE_FD, {TOKEN, tmpfs_fd})
> > 2. kexec
> > 3. tmpfs_fd =3D open(..., O_CREAT)
> > 4. ioctl(LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, {TOKEN, tmpfs_fd})
> >
> > No transfering to or from an anonymous fd is required.
> >
>
> Cool that preserving a tmpfs_fd is supported. How is that done without
> preserving the rest of the tmpfs stuff?
>
> Why is it possible to preserve the fd without the rest of the tmpfs
> stuff but not retrieve without the rest of the tmpfs stuff?
>
> Is retrieving into an fd a bit too much of a shortcut? Would preserving
> the rest of the tmpfs eventually be required, and hence retrieval of the
> rest of tmpfs should also be eventually supported symmetrically?

The idea is that the kernel is responsible for preserving the
_contents_ of the tmpfs file in place. Userspace is responsible for
setting up a new tmpfs mount, configuring permissions, etc. after
kexec and telling the kernel which file should receive those preserved
contents. Userspace set up these mounts before kexec, so it is
responsible for setting them up after kexec as well. I see no issue
with that.

There is some nuance that this series doesn't handle though (it is RFC
after all). Pratyush brought up offline that the tmpfs mount might
have allocation policies attached to it. The
LIVEUPDATE_SESSION_RETRIEVE_INTO_FD handler needs to confirm the
preserved contents do not violate the allocation policies of the mount
it is retrieving into. But that seems easily solvable to me.

>
> >> > An alternative approach to restoring data to a named file would be
> >> > supporting a zero-copy sendfile() that can be used to convert named
> >> > tmpfs files to/from memfds across the kexec. But this poses signific=
ant
> >> > challenges on the *preserve* side since the preserved file might sti=
ll
> >> > be actively in use. The benefit of the retrieve-into approach introd=
uced
> >> > in this series is that it does not require dealing with two differen=
t
> >> > files. There is only ever one file that owns the preserved memory.
> >> >
> >>
> >> Would it be more symmetric if the process is
> >>
> >> 1. Transfer the data from tmpfs fd -> anonymous fd
> >> 2. Preserve from anonymous fd
> >> 3. kexec
> >> 4. Retrieve into anonymous fd
> >> 5. Transfer the data from anonymous fd -> tmpfs fd
> >>
> >> As to the exact details of "transfer", I think the best we could do
> >> would be some kind of move from one fd's page cache to the other fd's
> >> page cache?
> >>
> >> Is the goal of the transfer to avoid any memcpy and fully transfer
> >> ownership (so, not just by increasing folio refcounts?)
> >
> > Yes this is the alternative proposal that has been proposed and
> > discussed a little bit off list, with sendfile() and copy_file_range()
> > being the possible mechanisms to do the "transfer". I think there are a
> > few fundamental problems with that approach on the pre-kexec side.
> >
> >  1. iommufd requires that fds mapped into it are preserved. If the file
> >     mapped into iommufd is tmpfs, but then we transfer that file to mem=
fd
> >     for preservation, iommufd will fail to preserve because the tmpfs f=
ile
> >     is not preserved.
> >
> >  2. Even if you only use this feature for files not mapped into an
> >     iommufd, transfering the contents in a zero-copy way seems
> >     challenging. What do you do if the tmpfs file is still in use when
> >     you want to transfer it?
> >
>
> When you say in-use, I suppose you mean folio is in-use by some IO and
> is mapped in IO page tables, and that the IO must continue while the
> folio is transferred?
>
> Are you expecting guests (as in stage 2 mappings) to continue to be
> functional while the folio is transferred?
>
> I'll have to think a bit more, I was initially thinking of just
> transferring folios where I could unmap from everywhere (processes,
> stage 2, IO page tables) for the transfer.

I was imagining a userspace process may have the tmpfs file mmap()'d
and is accessing the memory. I guess you can argue that userspace
should stop doing that during LU. But I think the iommufd use-case
shows that that is not really possible. The whole point is to preserve
the memory mapped into the iommufd throughout the Live Update.

>
> >> > By leaving file and metadata allocation purely in the purview of
> >> > userspace, programs can create the target files where they want, wit=
h
> >> > the names and security permissions they desire, before directing the
> >> > kernel to restore the preserved folios into them.
> >> >
> >> > Currently, only tmpfs shmem files are allowed as valid target recept=
ors.
> >> > Attempting to target populated files, or anything other than an empt=
y
> >> > shmem file, will trigger -EINVAL. HugeTLBfs files could be supported=
 in
> >> > the future.
> >> >
> >>
> >> Is this basically that at some point, all in-memory filesystems' fds c=
an
> >> support transfers?
> >
> > Yes, theoretically.
> >
> >>
> >> >
> >> > [...snip...]
> >> >
