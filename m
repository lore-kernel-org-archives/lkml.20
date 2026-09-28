Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD70226158B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611463; cv=none; b=mUBis3pr2Rz7AZAUsCx9imf6Zk5OxsK/M8/5X4OqY8DW14BZ2XTrlOGF3xOs4JhoT95qnXyLQi6fzkCOAwVmWkhi+6lVbNLaWzAIZznJqUmUAr0LjadWLFrst7q9mADzVM5qkCArzoT+5AiRIWWLjE4XHnWGFd3UYxGoBfBJlA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611463; c=relaxed/simple;
	bh=w7TeqrT0+Q/zpFwxC4BFJzDfcPHp/MVfoWfOH4bg5mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFLnb6A//D3i+7NZspOsAY+8FORU8z6uPrrnllCa1jV+i8aF3VLvEZ2s79J6K4fAoQFk0WGU83b1AjiUlrGip6SGWyO/B2/lemuMO6yUpMMZo827UDsrmZfgrK2tJXNws5Dl+m38AA86+eZGswX4j/21D3m44Vv6Uj6UUEHmpN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn; spf=pass smtp.mailfrom=har.mn; dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b=eHpo4aNq; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=har.mn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b="eHpo4aNq"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a652a638c8so33701fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=har.mn; s=google; t=1790611460; x=1791216260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BriMvy/fYKfC0r2YX8o1wtevxh7lKkc9wmgSoWI89iY=;
        b=eHpo4aNqovEer8CUMg4iVRRjOJDR3X3B6cqgSuSlXwbyBuzQAbRGnw6r72b0eULRaE
         NYXH3BqoX8yVaj5uLHcu47MxUTOB6qUZMopE9+43JyScIoIrMkl+Aarn/ODy1QW+95+o
         O0l0qi0+tuFaX8NCbshHAg4kgBYXOvc0r/V3IhiT4uVMUTjzuUL7DkLv3KO420m5B37N
         rzEi86nVvU5CM+sdFUhFjwUN0eghe0pU5lpW+AWsr+OhFnnPFIph+jEV5TqKtd/DdKpF
         +Ext0VoSlG47JbxqV5acYlRlZ39zP5V/32Fu1hC/9QFZx6B6H7261edZk9I0zt3NeU+t
         ESSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611460; x=1791216260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BriMvy/fYKfC0r2YX8o1wtevxh7lKkc9wmgSoWI89iY=;
        b=Orh1eQQPfq6EJn+s7hPM75sz2TfvDEHjLItsANb3iilB2Ja9cz2nEhJC2xHDW8WLfw
         H5FYMMuH2D+nCMRR8LhMkbRiiP39zM62BkTS0eYS8Uc7HstrtmbmRq6CT4CTQxUymmWX
         8/a8aBuqb3pg4xCdRAW/p8Xhs27S02cukrXkpoDbCHyt3RNd7idZxExALwYVfVQGWcqo
         6T7cxslVEcXctmh6v1+/nSslzOZzQ5NxNXrT09/9RT3o9cUQhwKgqzYUiLkKjnJdo/mN
         k1DpGwfW54cdDCW8GtALFZ2xZYmgJ0bhEK+78Kmk3uVwZXFKjioO1Rr6yYw6acHsjLkF
         umfA==
X-Forwarded-Encrypted: i=1; AKwUvBxu8mG0X3yLlRtGtDvPOdPl5clGWjqrn+QzYfXMdyGYWdw5EGUXPboL/HftIrxIFVS/LA/OyOC5UKNoBYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCKc+TbNmJ3dMQU1FM+3EzC5qQIQKOzbMm/a1vDNiZHW+YqKYc
	7OsHrtRti4T7kuP0pfIxxvR4QThFarolVl+0lNA0do1nJlYClStUyvkAHASFkc70ErFW7yGv0mF
	Ql1YBFAwAqX7/mA==
X-Gm-Gg: AYBFou0H5DZsx7KZ5x1RGXY/Tyk5iXbttXUuqiVpzWoU0lVKmYBfOUMq4wls4s46grU
	1vUV/G5gANJCEDBdqj7ybp/5svahsdVTn36ElphwTa61ieZCCD2Tx7kRme4ImLBdy6Flf0NE3Su
	ZIMoW13TrENlvdf2wyHgKc+PsfYA1zvkuXCz6e0eaUBiKYoxD8tuFtY/d0D7JK2bN9uKrn2bdLD
	tED+/LNmIFXBx61LfwPUsuy+ePrBzPzsZ5vXNFDkOMMCnW5gkzMokjx7XY5e7U5QzDBxiqtFQNc
	4BkW2uMQWFURq6Da93cjq4g+678ddNjQ0VKLOTKCHeGc5I16f38msZEPOJRF3vgHJVJ6fVtkQvt
	+CiWmxAR3TwQsUXuPBFI4RoHrjK7CUVAwzgSOznZviu3h750D52i9JLRMOJo/PDRUsxqo2iRDBU
	dWmd6DnDO/NGkZvJjngfK58zqDbCRSIQjdearTGVCLEz7OrtuZubaW99seVRnOR1tnJKqWzZkOq
	WWUCBo2tYqUG21RocqtwNiSsx7r8uBAKno=
X-Received: by 2002:a2e:b8c5:0:b0:3a7:635c:d564 with SMTP id 38308e7fff4ca-3a7635cd61emr390651fa.14.1790611459689;
        Mon, 28 Sep 2026 09:04:19 -0700 (PDT)
Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com. [74.125.230.99])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580f75sm31048981fa.14.2026.09.28.09.04.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:04:15 -0700 (PDT)
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a58fef219fso12007271fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:04:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXHYvRZomC7lAsHH0YLorDAijHRJfbsamHJaZSL+ULOL8zg3SIhNrgaDI9ovg42CuHECTNAuw3ByERpC0=@vger.kernel.org
X-Received: by 2002:a2e:be83:0:b0:3a4:99bb:2821 with SMTP id
 38308e7fff4ca-3a63c09eb9bmr31672301fa.9.1790611455223; Mon, 28 Sep 2026
 09:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927141437.1432584-1-russ@har.mn> <20260928014357.2285448-1-russ@har.mn>
 <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
In-Reply-To: <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
From: Russell Harmon <russ@har.mn>
Date: Mon, 28 Sep 2026 12:03:46 -0400
X-Gmail-Original-Message-ID: <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com>
X-Gm-Features: AclHuK_Zkx66j8fqE1hQWtePuXRLJqJWpqTyVuJzCfueMw32hJriOENdTx-0j2M
Message-ID: <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd@bsbernd.com>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(re-sending in plaintext)

Thanks for the review! Comments inline.

On Mon, Sep 28, 2026 at 2:38=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Mon, Sep 28, 2026 at 3:44=E2=80=AFAM Russell Harmon <russ@har.mn> wrot=
e:
> >
> > This patch adds support for propagating the inode generation number fro=
m
> > the FUSE server to the kernel.
>
> Incomplete statement.
> Without the mention of GETATTR/SETATTR this is a misleading statement.
>
> > This is useful for exporting FUSE
> > filesystems over NFS, where the generation number is used to detect
> > stale file handles (ESTALE) when inodes are recycled.
>
> How exactly does it help?
> I am not trying to troll you, I am really curious. how?
>
> Context: I have been trying to improve FUSE NFS export support for a whil=
e
> I have built a library that provides reliable NFS export for FUSE passthr=
ough fs
> for specific backing file system types [1].
>
> [1] https://github.com/amir73il/libfuse/tree/libfuse_passthrough/passthro=
ugh
>
> It is broadly understood that real NFS export support requires extending =
the
> FUSE protocol to identify objects using file handles and Luis has
> already started
> with this work [2]
>
> [2] https://lore.kernel.org/linux-fsdevel/20260225112439.27276-1-luis@iga=
lia.com/
>
> So my question is, what does adding generation id to GETATTR/SETATTR
> improve for FUSE filesystem writers that wish to export their filesystem =
to NFS?

Long answer is https://russ.har.mn/blog/2026-04-09/fuse-loopback-is-incompl=
ete

Short answer is that inode on its own doesn't uniquely identify a
file. The unique identifier is inode + generation. Reason being that a
user can delete a file and create a new one, and the filesystem is
allowed to reuse the inode (but if it does it must use a different
generation).

As for why it needs to be a part of GETATTR/SETATTR, consider that,
given the above, without a generation number such calls are actually
ambiguous. They don't uniquely identify a filesystem object. e.g.
"what are you asked to GETATTR/SETATTR _on_?"

> >
> > Key changes:
> > - Bump FUSE protocol version to 7.47.
> > - Repurpose the unused `dummy` field in `struct fuse_attr_out` as
> >   `generation`.
> > - Add a `FUSE_ATTR_GENERATION` INIT flag with which the filesystem opts
> >   into the kernel consuming that field. Gating on the protocol minor
> >   version alone would break existing filesystems: the minor version onl=
y
> >   reflects the library, not whether the individual filesystem fills the
> >   field, and a zero there would look like a generation change for any
> >   filesystem that reports nonzero generations in LOOKUP.
> > - Update `fuse_change_attributes` and related functions to accept and s=
et
> >   `inode->i_generation`.
> > - Populate `i_generation` from `LOOKUP`, `GETATTR`, and `READDIRPLUS`
> >   responses.
> > - Detect nodeid recycling on `GETATTR` and `SETATTR` responses via
> >   `fuse_stale_inode()`, the same check already used by the `LOOKUP` and
> >   `READDIRPLUS` paths, and mark the inode bad (EIO) instead of merging
> >   the recycled file's attributes into the existing, possibly still-open=
,
> >   inode.
> > - Update `fuse_get_dentry` to validate the generation number against th=
e
> >   file handle, returning ESTALE on mismatch.
> > - Maintain backward compatibility: without `FUSE_ATTR_GENERATION` the
> >   generation field in attr replies is ignored.
> >
> > Verification:
> > Tested with a QEMU harness in fuse-generation-qemu against a patched
> > libfuse (FUSE_CAP_ATTR_GENERATION, fuse_reply_attr_with_generation) and
> > its passthrough_ll example reporting real backing-filesystem generation
> > numbers. The suite verifies that:
> > 1.  The generation from `LOOKUP` reaches `name_to_handle_at()` file
> >     handles and matches the backing filesystem's FS_IOC_GETVERSION.
> > 2.  `open_by_handle_at()` succeeds for a valid handle and fails with
> >     ESTALE for a handle whose generation does not match, both while the
> >     inode is cached and after cache eviction.
>
> 1 and 2 should work on upstream FUSE right?
> This is something worth mentioning.
>
> > 3.  When a `GETATTR` reply reports a new generation for a cached inode
> >     (inode recycling), the kernel marks the inode bad: fstat() on an
> >     open fd fails with EIO, while a fresh path lookup recovers and
> >     pre-recycling file handles fail with ESTALE.
>
> How did the inode recycle happen with passtrhough_ll which keeps
> open fds for fuse inodes?
> Something is missing from this test report.
> If you just used a mock filesystem which makes no sense in the real world
> then the value of this change is questionable.

Ack, I'll dig more into this. Sending responses to your other
questions now and will reply again once I've got an answer.


> > Signed-off-by: Russell Harmon <russ@har.mn>
> > Assisted-by: Gemini:gemini-3.1
> > ---
> > v2:
> > - Bump FUSE_KERNEL_MINOR_VERSION to 47 to match the new 7.47 changelog
> >   entry (v1 added the entry but left the minor at 46).
> >
> > v1: https://lore.kernel.org/all/20260927141437.1432584-1-russ@har.mn/
> >
> >  Documentation/filesystems/fuse/fuse.rst | 32 +++++++++++++++++++++++++
> >  fs/fuse/dir.c                           | 21 +++++++++++-----
> >  fs/fuse/fuse_i.h                        | 10 ++++++--
> >  fs/fuse/inode.c                         | 23 ++++++++++++------
> >  fs/fuse/readdir.c                       |  2 +-
> >  include/uapi/linux/fuse.h               | 11 +++++++--
> >  6 files changed, 81 insertions(+), 18 deletions(-)
> >
> > diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentation/fi=
lesystems/fuse/fuse.rst
> > index 0fbd5a03fdc9..f67bc9fc6316 100644
> > --- a/Documentation/filesystems/fuse/fuse.rst
> > +++ b/Documentation/filesystems/fuse/fuse.rst
> > @@ -49,6 +49,38 @@ using the sftp protocol.
> >  The userspace library and utilities are available from the
> >  `FUSE homepage: <https://github.com/libfuse/>`_
> >
> > +NFS export support
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +FUSE filesystems can be exported via NFS if the filesystem daemon supp=
orts it.
> > +For reliable NFS export, the filesystem should provide a unique inode
> > +generation number for each inode. This generation number is used by th=
e
> > +NFS server to distinguish between different file instances that may
> > +share the same inode number (e.g. after an inode number is reused).
> > +
> > +The inode generation number is provided by the filesystem daemon in th=
e
> > +following messages:
> > +
> > +- `FUSE_LOOKUP`
> > +- `FUSE_GETATTR` (see below)
> > +- `FUSE_SETATTR` (see below)
> > +- `FUSE_READDIRPLUS`
> > +- `FUSE_CREATE` / `FUSE_TMPFILE` / `FUSE_MKNOD` / `FUSE_MKDIR` / `FUSE=
_SYMLINK` / `FUSE_LINK`
> > +
> > +A daemon that keeps the generation number in its `FUSE_GETATTR` and
> > +`FUSE_SETATTR` replies (the `generation` field of `fuse_attr_out`,
> > +protocol 7.46) must announce this by setting `FUSE_ATTR_GENERATION` in
> > +its `FUSE_INIT` reply flags. When the flag is negotiated, the kernel
> > +compares the generation in every getattr/setattr reply against the
> > +cached inode: a mismatch means the daemon has reused the node ID for a
> > +different file, and the cached inode is marked bad (subsequent
> > +operations on it fail with EIO). Without the flag, the field is ignore=
d
> > +and the generation is only taken from lookup-type replies, preserving
> > +the behavior of existing filesystems.
> > +
> > +If the filesystem daemon does not provide a generation number, the ker=
nel
> > +will use a default value of 0.
> > +
>
> On the one hand, I still need to understand the value of reporting genera=
tion
> in GETATTR/SETATTR.
>
> On the other hand, I do see the value in the server negotiating at init t=
ime the
> fact that "Generation values are reliable".
>
> What happens today is that NFS exporting is allowed for all FUSE filesyst=
ems
> regardless of the reliability of generation id, so after inode evict
> and recycle,
> an NFSv3 client  that had access to inode X.Y may get access to a complet=
ely
> different file or even a directory with inode X.Y, where X is the recycle=
 nodeid
> and Y is an unreliable generation provided by the server.
>
> The problem is that FUSE does not require opt-in for NFS export, it only
> allows servers to opt-out of NFS export (FUSE_NO_EXPORT_SUPPORT).
>
> So what can be done given a declaration of the server that generation
> is reliable?
>
> One option is to set a non-zero uuid/fsid to the fuse filesystem.
> This will allow exporting the fuse filesystem without the opt-in uuid/fsi=
d=3D
> in /etc/exports.
> This will also allow setting fanotify FAN_MARK_FILESYSTEM watches
> on this fuse filesystem, whose file handles could be trusted to be a genu=
ine
> unique identity of the filesystem objects.
>
> But if we take this route, it is better to take it one step further
> and allow the
> server to determine the filesystem uuid/fsid during negotiation.
>
> In any case, I am not convinced there is value in doing all this
> without extending
> the protocol with LOOKUP_HANDLE/LOOKUPX lookup by file handle, so if you
> have compelling use cases, please spell them out.

I'm trying to implement a caching filesystem which uses a sqlite
database (stored on an SSD) to cache all file and directory metadata,
ultimately to avoid HDD spinups (and the associated electricity cost)
for operations other than file reads. I'm also exporting this
filesystem over NFS, hence the need for NFS support.

If I remember correctly, name_to_handle_at on a FUSE filesystem
contains just the inode+generation, and open_by_handle_at results in a
LOOKUP of that inode (and now inode+generation). But I'll
double-check. Assuming my memory is correct, I think that's
sufficient, assuming that we consider inode+generation as a unique
file object identifier.
