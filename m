Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810964E73D5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614468; cv=pass; b=Gc9qMzhnwunM/xs+clOWE78PXgHUlATDf7u2eIpcvYz58HfMBT3ld2ohcgfHfinu2dL/hIJQjTccpi5zUZbr0EB5Al7wYHX/2Zjy3+JmQvYtBhf9f1HChxjphGLCnYte7WSmMUoesiDPzJ7CKb7dAF3DayzRUyJGODLrgM7DnqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614468; c=relaxed/simple;
	bh=PeRqSAXycZ3/v9MFXEhT/rNRrbBgQNiLeiEttWl2YpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAf+0D4BLoBufAtDFt3NUVyg+BEa3PNP9ZHgI+cFAqAy6a4ak+s1rv2KWJwOGlU2AxPcoI1pvte/TdFOQC5wDaHu2DOI6Y0NPYmVbijGq4bE5S9BOQK68QeAeUC5ooaj6nyYN68bDn+semM5REEh8JKKvHv87bNH1TjwjOCC4SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmZHrlfb; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmZHrlfb"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf5e6878fso4298165a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790614463; cv=none;
        d=google.com; s=arc-20260327;
        b=gau8b5+5Nx3YgLlIbO6sd+XFpIhDEP8lgy4jRCLQ0hO5HGkkOOt3MabNJhqyjet2mb
         lfOyKAPzWZyX4tLNsCM/KQZR5OS4bd2KCE0t3+x11ECD+6q+HsLNckwbrEQS0CVooTNG
         1UdHQaxL/Rbb11bl5krO0FtJn835MZh4K7ynpeDBJBBor9NAkxtmfuSnGPupAncjt3v8
         2DIG+6q9KVYwpanSPVKikxDdLAz2kQwHr2IEbD1Az4GbWOoEkJsAhEcljyXTcqnUtfKV
         h/f6QYQhOzkaNAB+XkYVhoyn0cJDG3N6ovUJvBFK7cNjf41EDV2T0CuPvsvju3xUTZOt
         VfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lcq2UsqObmNwMniWecezaiOjJ0L6W2l4RK9FG3PiK5o=;
        fh=DxQMIkbY4bPT18AkoH1XjsmeQg+1l03RoI+C/yXPinY=;
        b=SbyhrTy6CH0VaBcmdVtLPwO26OIUJR+YnQBXdeuDSjS0ZVEaHx+XPGblfGMRw6pBf/
         JRN0QBHhut8ICyuYJFzInNBs0iGTXEyh0BOpRxf+XX3GqXJTUqtnYp7g5o4QxSTMa2CC
         xu/G0yt3ETuBxEgTM076TV0NX6BwDkCG/xesCkpCsA0Sfn1umL1lYWI6bR/VHh/v8uVY
         wkF2dtXLFmUeGwpjC6h0fHNzjAxxzfMt1GhbMBYIGxvvQJh1od+fnjjlLeP0E078tW9z
         Ka3AEtWoSm4KW8zbEe1/+t+wdir3jLNMIrNWfvjkeePO8hXAMgKjikUNO5KhOHywR8L8
         c5Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790614463; x=1791219263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lcq2UsqObmNwMniWecezaiOjJ0L6W2l4RK9FG3PiK5o=;
        b=gmZHrlfbDgm2bO/HozAErkOyH30JjvrKev9cRErB4bYha9nRi00b0WK0AUuUcosqDF
         fVbw/kQKhVnWKVqZefEhP2w3EravwH1jPCEyG6ZMEWIMqNH/sbGogDuLk60cLdy/lj/y
         JSoASgSgrukyVjIQosdVUDUphtuXLYPbbuREVczA/rq8CRLQUDZ3YDWEuSf5fdJlLQjG
         du1B4gzKCIs6y/lnTP/+tbF0Skshod3OnPREAJWpQzMxNXHYj7Q9PP0X56PnQlB343ly
         thkC+6GQ8QsWs1iPj58n7+OCyM5jXb+JzAf546J1V0s7byN1mVrfuKttLhkTI2t0kEtE
         ZfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614463; x=1791219263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcq2UsqObmNwMniWecezaiOjJ0L6W2l4RK9FG3PiK5o=;
        b=qLzgHlMOj575FpmUxYz/sB7nYp+fEv6ORIZKYEOjkM1j/nIvKhrPElHEGbaLaffNv2
         6wweC1HYKePvAlV2HbzA0xrRV0cKbdddb7+3uX6UTK4sFg2xGEW209S/S/rwN+Jj7cUk
         ZHLRNDYwwZXefcEq3cLE2IhXyXZcCMxyad4xoZHkFyGsI1UxCEHDC6iDdqw1VW6O8gIS
         54LgQ9RLaI1rOxjA5yi1ASOST+qzhv5s3J9ibfKejG52xdePs86BWQ3YSE2ewzjJiOf7
         onZLD5uAwRQ1rT0HWHRhgj3ThxZcUcvGAV1t7LTszz4LL378NWImYIIB0Thb4D2IqSiY
         tWSw==
X-Forwarded-Encrypted: i=1; AKwUvBxZifUZmGF7C3CZ1FtC7ys9upd+NYs04YWEOjNolXX/+pCk7IGZb3O9MLBYNEEni+4thHQf55vzUmMGA2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYInNqk/e1nSZJZ9KTP3S0v0dQyWLkED15PxPXs2mfHdGocx2EXn
	hKrh3SZYVUY4mIu83ceOZRKNaup1N5IAQ3FTJ5ADaRVZ7TRrP40mrJrWJVLJeZWl0mvK2hD2ss8
	EKS5p2lW9sxKVV35+dq3p6lMuGWs7MuJScQ5rtjY=
X-Gm-Gg: AYBFou2O2gn/lbaGP4FOr1zH4it0gqDGASxz5DNK7Ki/uz8toUadmIceXvgsNg7gLU9
	JZNvMsiL1shmpYVtpGuRVn7V8n3C953g0vLyrkgPd7sWuJxL3Td727rjFs8wyfIQ49rgK8FjWpY
	dO0Tfj+eE3AAM8u+siEe55MHRCa9i0SHSx8HYPfCTByu6cPT+kuXTIuZmuUdkcttzPAHzDQl2ZR
	QY6hVCE05F2Sqc3eYOE0JDTmxdNxpO+PKObwM0C+XGp262vkr1J+nOXi/6Oo4wGRWr0A8f01o64
	Q6iLEQv732jFOzsCdXPR5txq3Gc3o7x6i3D4CRH4Hn2NTRQjBwptZYIyD+q702d5zFY=
X-Received: by 2002:a05:6402:4043:10b0:6aa:f198:4e39 with SMTP id
 4fb4d7f45d1cf-6aaf1985cfemr5033290a12.44.1790614462164; Mon, 28 Sep 2026
 09:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927141437.1432584-1-russ@har.mn> <20260928014357.2285448-1-russ@har.mn>
 <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com> <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com>
In-Reply-To: <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 28 Sep 2026 18:54:10 +0200
X-Gm-Features: AclHuK9VCaMIyvD_KRebw7goqntlmIe2e7I1-ulKZC0adKd_Mj3mvk6Ho56RGcg
Message-ID: <CAOQ4uxj4xQ9Z=9JH=U21iHnfLBQLboz5dsivigKicWS22M+zgQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
To: Russell Harmon <russ@har.mn>
Cc: miklos@szeredi.hu, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd@bsbernd.com>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:04=E2=80=AFPM Russell Harmon <russ@har.mn> wrote:
>
> (re-sending in plaintext)
>
> Thanks for the review! Comments inline.
>
> On Mon, Sep 28, 2026 at 2:38=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Mon, Sep 28, 2026 at 3:44=E2=80=AFAM Russell Harmon <russ@har.mn> wr=
ote:
> > >
> > > This patch adds support for propagating the inode generation number f=
rom
> > > the FUSE server to the kernel.
> >
> > Incomplete statement.
> > Without the mention of GETATTR/SETATTR this is a misleading statement.
> >
> > > This is useful for exporting FUSE
> > > filesystems over NFS, where the generation number is used to detect
> > > stale file handles (ESTALE) when inodes are recycled.
> >
> > How exactly does it help?
> > I am not trying to troll you, I am really curious. how?
> >
> > Context: I have been trying to improve FUSE NFS export support for a wh=
ile
> > I have built a library that provides reliable NFS export for FUSE passt=
hrough fs
> > for specific backing file system types [1].
> >
> > [1] https://github.com/amir73il/libfuse/tree/libfuse_passthrough/passth=
rough
> >
> > It is broadly understood that real NFS export support requires extendin=
g the
> > FUSE protocol to identify objects using file handles and Luis has
> > already started
> > with this work [2]
> >
> > [2] https://lore.kernel.org/linux-fsdevel/20260225112439.27276-1-luis@i=
galia.com/
> >
> > So my question is, what does adding generation id to GETATTR/SETATTR
> > improve for FUSE filesystem writers that wish to export their filesyste=
m to NFS?
>
> Long answer is https://russ.har.mn/blog/2026-04-09/fuse-loopback-is-incom=
plete
>
> Short answer is that inode on its own doesn't uniquely identify a
> file. The unique identifier is inode + generation. Reason being that a
> user can delete a file and create a new one, and the filesystem is
> allowed to reuse the inode (but if it does it must use a different
> generation).

This is obvious. That's the reason LOOKUP already returns a generation.

>
> As for why it needs to be a part of GETATTR/SETATTR, consider that,
> given the above, without a generation number such calls are actually
> ambiguous. They don't uniquely identify a filesystem object. e.g.
> "what are you asked to GETATTR/SETATTR _on_?"
>

You phrased the question correctly, but the same question
applies to any other command, i.e.
"What are you asked to OPEN/TRUNCATE _on_?"

So you see, what's needed is to change the input argument
of ALL the fuse requests from nodeid to nodeid+generation, or
in the more generic form of NFS handles, a variable size object id blob.

This is from the latest proposal for FUSEX protocol [3]

struct fusex_id {
    u64 nodeid;
    /* will extend with file handle */
};

[3] https://lore.kernel.org/fuse-devel/20260429102058.1362965-1-mszeredi@re=
dhat.com/

> > >
> > > Key changes:
> > > - Bump FUSE protocol version to 7.47.
> > > - Repurpose the unused `dummy` field in `struct fuse_attr_out` as
> > >   `generation`.
> > > - Add a `FUSE_ATTR_GENERATION` INIT flag with which the filesystem op=
ts
> > >   into the kernel consuming that field. Gating on the protocol minor
> > >   version alone would break existing filesystems: the minor version o=
nly
> > >   reflects the library, not whether the individual filesystem fills t=
he
> > >   field, and a zero there would look like a generation change for any
> > >   filesystem that reports nonzero generations in LOOKUP.
> > > - Update `fuse_change_attributes` and related functions to accept and=
 set
> > >   `inode->i_generation`.
> > > - Populate `i_generation` from `LOOKUP`, `GETATTR`, and `READDIRPLUS`
> > >   responses.
> > > - Detect nodeid recycling on `GETATTR` and `SETATTR` responses via
> > >   `fuse_stale_inode()`, the same check already used by the `LOOKUP` a=
nd
> > >   `READDIRPLUS` paths, and mark the inode bad (EIO) instead of mergin=
g
> > >   the recycled file's attributes into the existing, possibly still-op=
en,
> > >   inode.
> > > - Update `fuse_get_dentry` to validate the generation number against =
the
> > >   file handle, returning ESTALE on mismatch.
> > > - Maintain backward compatibility: without `FUSE_ATTR_GENERATION` the
> > >   generation field in attr replies is ignored.
> > >
> > > Verification:
> > > Tested with a QEMU harness in fuse-generation-qemu against a patched
> > > libfuse (FUSE_CAP_ATTR_GENERATION, fuse_reply_attr_with_generation) a=
nd
> > > its passthrough_ll example reporting real backing-filesystem generati=
on
> > > numbers. The suite verifies that:
> > > 1.  The generation from `LOOKUP` reaches `name_to_handle_at()` file
> > >     handles and matches the backing filesystem's FS_IOC_GETVERSION.
> > > 2.  `open_by_handle_at()` succeeds for a valid handle and fails with
> > >     ESTALE for a handle whose generation does not match, both while t=
he
> > >     inode is cached and after cache eviction.
> >
> > 1 and 2 should work on upstream FUSE right?
> > This is something worth mentioning.
> >
> > > 3.  When a `GETATTR` reply reports a new generation for a cached inod=
e
> > >     (inode recycling), the kernel marks the inode bad: fstat() on an
> > >     open fd fails with EIO, while a fresh path lookup recovers and
> > >     pre-recycling file handles fail with ESTALE.
> >
> > How did the inode recycle happen with passtrhough_ll which keeps
> > open fds for fuse inodes?
> > Something is missing from this test report.
> > If you just used a mock filesystem which makes no sense in the real wor=
ld
> > then the value of this change is questionable.
>
> Ack, I'll dig more into this. Sending responses to your other
> questions now and will reply again once I've got an answer.
>
>
> > > Signed-off-by: Russell Harmon <russ@har.mn>
> > > Assisted-by: Gemini:gemini-3.1
> > > ---
> > > v2:
> > > - Bump FUSE_KERNEL_MINOR_VERSION to 47 to match the new 7.47 changelo=
g
> > >   entry (v1 added the entry but left the minor at 46).
> > >
> > > v1: https://lore.kernel.org/all/20260927141437.1432584-1-russ@har.mn/
> > >
> > >  Documentation/filesystems/fuse/fuse.rst | 32 +++++++++++++++++++++++=
++
> > >  fs/fuse/dir.c                           | 21 +++++++++++-----
> > >  fs/fuse/fuse_i.h                        | 10 ++++++--
> > >  fs/fuse/inode.c                         | 23 ++++++++++++------
> > >  fs/fuse/readdir.c                       |  2 +-
> > >  include/uapi/linux/fuse.h               | 11 +++++++--
> > >  6 files changed, 81 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentation/=
filesystems/fuse/fuse.rst
> > > index 0fbd5a03fdc9..f67bc9fc6316 100644
> > > --- a/Documentation/filesystems/fuse/fuse.rst
> > > +++ b/Documentation/filesystems/fuse/fuse.rst
> > > @@ -49,6 +49,38 @@ using the sftp protocol.
> > >  The userspace library and utilities are available from the
> > >  `FUSE homepage: <https://github.com/libfuse/>`_
> > >
> > > +NFS export support
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +FUSE filesystems can be exported via NFS if the filesystem daemon su=
pports it.
> > > +For reliable NFS export, the filesystem should provide a unique inod=
e
> > > +generation number for each inode. This generation number is used by =
the
> > > +NFS server to distinguish between different file instances that may
> > > +share the same inode number (e.g. after an inode number is reused).
> > > +
> > > +The inode generation number is provided by the filesystem daemon in =
the
> > > +following messages:
> > > +
> > > +- `FUSE_LOOKUP`
> > > +- `FUSE_GETATTR` (see below)
> > > +- `FUSE_SETATTR` (see below)
> > > +- `FUSE_READDIRPLUS`
> > > +- `FUSE_CREATE` / `FUSE_TMPFILE` / `FUSE_MKNOD` / `FUSE_MKDIR` / `FU=
SE_SYMLINK` / `FUSE_LINK`
> > > +
> > > +A daemon that keeps the generation number in its `FUSE_GETATTR` and
> > > +`FUSE_SETATTR` replies (the `generation` field of `fuse_attr_out`,
> > > +protocol 7.46) must announce this by setting `FUSE_ATTR_GENERATION` =
in
> > > +its `FUSE_INIT` reply flags. When the flag is negotiated, the kernel
> > > +compares the generation in every getattr/setattr reply against the
> > > +cached inode: a mismatch means the daemon has reused the node ID for=
 a
> > > +different file, and the cached inode is marked bad (subsequent
> > > +operations on it fail with EIO). Without the flag, the field is igno=
red
> > > +and the generation is only taken from lookup-type replies, preservin=
g
> > > +the behavior of existing filesystems.
> > > +
> > > +If the filesystem daemon does not provide a generation number, the k=
ernel
> > > +will use a default value of 0.
> > > +
> >
> > On the one hand, I still need to understand the value of reporting gene=
ration
> > in GETATTR/SETATTR.
> >
> > On the other hand, I do see the value in the server negotiating at init=
 time the
> > fact that "Generation values are reliable".
> >
> > What happens today is that NFS exporting is allowed for all FUSE filesy=
stems
> > regardless of the reliability of generation id, so after inode evict
> > and recycle,
> > an NFSv3 client  that had access to inode X.Y may get access to a compl=
etely
> > different file or even a directory with inode X.Y, where X is the recyc=
le nodeid
> > and Y is an unreliable generation provided by the server.
> >
> > The problem is that FUSE does not require opt-in for NFS export, it onl=
y
> > allows servers to opt-out of NFS export (FUSE_NO_EXPORT_SUPPORT).
> >
> > So what can be done given a declaration of the server that generation
> > is reliable?
> >
> > One option is to set a non-zero uuid/fsid to the fuse filesystem.
> > This will allow exporting the fuse filesystem without the opt-in uuid/f=
sid=3D
> > in /etc/exports.
> > This will also allow setting fanotify FAN_MARK_FILESYSTEM watches
> > on this fuse filesystem, whose file handles could be trusted to be a ge=
nuine
> > unique identity of the filesystem objects.
> >
> > But if we take this route, it is better to take it one step further
> > and allow the
> > server to determine the filesystem uuid/fsid during negotiation.
> >
> > In any case, I am not convinced there is value in doing all this
> > without extending
> > the protocol with LOOKUP_HANDLE/LOOKUPX lookup by file handle, so if yo=
u
> > have compelling use cases, please spell them out.
>
> I'm trying to implement a caching filesystem which uses a sqlite
> database (stored on an SSD) to cache all file and directory metadata,
> ultimately to avoid HDD spinups (and the associated electricity cost)
> for operations other than file reads. I'm also exporting this
> filesystem over NFS, hence the need for NFS support.

OK, so you are implementing a passthrough filesystem (to HDD)
with a fast caching layer, I assume to cache results of GETATTR/
LOOKUP/READDIR/READDIRPLUS? Anything else?
Are you caching a specific type of backing filesystem?

I advise you to look at libfuse_passthrough [1].
You can either see if it fits you or learn from my experience with NFS
export of a fuse passthrough filesystem.
I am giving a talk on the subject in Linux Plumbers next week [4].

>
> If I remember correctly, name_to_handle_at on a FUSE filesystem
> contains just the inode+generation, and open_by_handle_at results in a
> LOOKUP of that inode (and now inode+generation). But I'll
> double-check. Assuming my memory is correct, I think that's
> sufficient, assuming that we consider inode+generation as a unique
> file object identifier.

The problem is, that what you assume is not an API definition, this is
a specific
filesystem implementation, which happens to be correct for some commonly
used filesystems (e.g. ext4, xfs), but is not true in general.
In general the API {name_to,open_by}_handle_at() the file handle is an
opaque blob.

The way that libfuse_passthrough gates against recycled inode numbers
is that the file handle is stored in the server's inode table at lookup tim=
e
(generation is recorded) and all the commands that follow, lookup in the
server's inode table (could be in sqlite in your case) and use
open_by_handle_at() with the recorded file handle from lookup time
to get an O_PATH fd to the object on the backing filesystem (on HDD).

This is called InodeRef in libfuse_passthrough and any request will return
ESTALE to the kernel if it cannot get an InodeRef.

Thanks,
Amir.

[4] https://lpc.events/event/20/contributions/2367
