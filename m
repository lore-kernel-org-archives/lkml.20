Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A51B57D231
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196690; cv=pass; b=f4H1CgpxrM7CTquwFoPCscrFXywxZN0BHtKhPXsXhUowasvEJ4uD/RC3jGAvbgwF5YE9tdMiNIbVncK/+4DQGptZ2soPvM7yzGNGjADG2h2wCuH19Zm2rrdb71X5utqVPjeUegZnRyfLKIyJ7iQ2qMpHbYceD7NSIuKnJPzyp/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196690; c=relaxed/simple;
	bh=5RYTLQDvsY6XpN1VQbrbqg1sz7KWIZfN0YLEprJU4uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gckgeTIa/oAuk1PDzj+hhiDME4DjOADbtYzBME4x7peZ6FSsdajw8Fch2JKHqodVBDF+8U2wlhN9eQrFTrOVsg+86hy6Z4yETwKQGM1F+m+G5a/OEpqAhd8nPlcgz5VEeMOoEcKc2DlGFf8EJFr6cLH5he6g94Q5WX8FDctRMUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Jy9s/CTR; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Jy9s/CTR"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso7124215ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790196684; cv=none;
        d=google.com; s=arc-20260327;
        b=qpdcrSViB041Fj9O88IK6ZOHBkJ1ba8iE701MY2pdbyQ4rksUfKiDPp2ic0T7uPy+B
         sHTViMNQtRf4svxQ2kpAi5sSIy3UbClKFx6MqxvPpN0V/fubY8PKDf5Qtb/CtGzq6IuC
         dI9IXigXyULCOEj4qhNXbkE5LGSXFKg/rzqy1BZogL/13I6tYyTpHI1az71wshvmxS6e
         +qnPB+jJQywSIu3faJi7WA7KiPoxBs3qwBvE86xVbdAU0yhKYoGVaEmgdmpw1jmR0DMy
         0oiUOcubs/ZGcUXfYnA2gpNMuW/mARJvRxqx+AFj8vOLz4US57b5eEu7x8Nc0rABp4z7
         dbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNvgCnr3l8BtKs/YQ4o409r9tmPanak9V4c7Oc/FOcE=;
        fh=n9YWhB+bSiCPa3EIXKTpjEhp+EfDEHmP8adJYGwQUVM=;
        b=JPu6ZhPmsFgMhrTJLqYuVAelVlBnxeX1tIZ28mRMjPvtMWCBR1bwpUDWOIbFbAg4sH
         w0LYFR5a9YilKIAH0lZmmyIt+rHA1lVSnviFOEF8qOTb74/deS/+TEPgSSfB6TNPt64F
         /5SomzefjGsgiQcW77e55+YdIVoDM6YBMAaGTcNrNkxN+IEc4zWPn7aFAt2MDA6s2+Db
         CvXn3UuP1rWH1dfLy7K2DyyzXR9BLqNPu5NzBABtPF/jdKsUgoDHIEP5J3liSRu/tOua
         DwJzplLhgxA3M5EpvXWBWVyL++J2FhiP5iUbdQ3SIwdxV7omCIBjojXzNa2U7MLtyxeL
         FBKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790196684; x=1790801484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNvgCnr3l8BtKs/YQ4o409r9tmPanak9V4c7Oc/FOcE=;
        b=Jy9s/CTRgYkWy45lZFpncBbKX8Sd/nTIvGyjYjanbW7ikSfVqw8ik5En4HWNPwurQE
         gZLY07EzDW41AOBEcY8zzByVGoS/0e1wuD67qoHF5Z0EmXtNyy5NDocRHSxszpBCNbl2
         I+mdYAr/Wb/9focNs3Uj4ppYm+TcJmP8qUXVRuvXvzjtyT0KTbXySBugKdeomMwnUc2Z
         N0JVZkJuF4whi4wThkpNHkeCukHWiffsvhpICjsCG3YPS06j1nqAsFhJyQlDo7Wvl0lx
         vmXqZfjO8UMXIxBehvuMT6kVaHG0Bvb+2JZRcxoDyqVcofLyfWtZKQDrySK+/5oAsLmx
         33Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196684; x=1790801484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNvgCnr3l8BtKs/YQ4o409r9tmPanak9V4c7Oc/FOcE=;
        b=VwJkZn2t78Q3TGuaQKaP3GZZUEnJqLISSH+gYX9gZDAVtYyRYN5LS2Xjk04eil+MH8
         D6mcsUsyuSaXCL77VAj8mbVi/DgXj+PH7a6qHTIxe9ADFSso54ecgeriovGa/zgEWzOF
         1Chz8wj9RSEiwJwxykQH1d1EXFnLzquoCutgSgZj9qr4abHhM9HKuyQk2Gdb5sjUCcDk
         rF0sgLYiwnFmdGLwPL91XsPn+lpX76F4H3xLlbykZ8PkvxlhXJEy02p2xB8ZoyJrKkP2
         7Ax3pqo19FY/4tGu715o6Zljx1ZsPgY1p2II7UHAuagnKWQcJlddmQduwZgdzOmZ1FU8
         DD2A==
X-Forwarded-Encrypted: i=1; AKwUvBwG2p974ZlYvO+zWB43ACaaygAedLKsM7OuAYUY5JUF+gKdm8SBYaFLiE3i+atsKmTn9Erily7KhdwZPX0=@vger.kernel.org
X-Gm-Message-State: AFuF++n8AdjJ9H+V8dIbfOkYGq86IIUdMV4E6ZWfctNk2Bjy3DxQHddQ
	Cv86T3VeAjqPDw767rp/0FldIAAI57wVoJT+Q+Gz7ncWZXotJfSS+0zZHsJAIVkbyli1rrUMW+7
	eyAvCbG8DhYy2vAee+qdn6r2lmVP2Bj6+5myFTPxj
X-Gm-Gg: AYBFou1moGaNqdi9O9bnYEpPANTMY/9FRb8vUkkMoC1RQRnzY4BGDuXIiAyNyxoJ+bg
	sF0YejF+vgUoiJfyPf3qA1eZe+8kLR4Oj+q/u0fm6zWzWMGxlSz4Nkm7Er2WiJZPbeQtNxo42/h
	XfiecJ1hfiugbDro1gm8/Ke221pewq8cp7nTiLhM9hfO/jlNB8F/CnQ85EydQ810+4fPiJ3f+XR
	l8YaHJKGdAoOtl61xLYFGA1LZFuVGunKd4A+eCfi5HCMMWO+mYUowy4eLe2XUoT/WaFH4RQdhqd
	v3rsjlTg/6L1/ZhdUzRsCE4cut0xX2qYo3WPmKgVa79rJTSgDrjMsuvZY/AuvP7NdzF0o8lJEoo
	CwK+t2pN6iqk=
X-Received: by 2002:a17:90b:1c8a:b0:39e:6c69:34d5 with SMTP id
 98e67ed59e1d1-3a098e900e7mr270237a91.57.1790196684349; Wed, 23 Sep 2026
 13:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915150739.284189-1-daniel@iogearbox.net> <20260915150739.284189-5-daniel@iogearbox.net>
 <CAHC9VhR2Zp9LzDRwDOZoesOC7o8hretfgRH-PRqQRXA0EES2vA@mail.gmail.com> <04fe4568-90cb-4aac-a21d-c0443e418b46@iogearbox.net>
In-Reply-To: <04fe4568-90cb-4aac-a21d-c0443e418b46@iogearbox.net>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 23 Sep 2026 16:51:12 -0400
X-Gm-Features: AclHuK-ar601PMbFiiED6HOc4D8YTbyv-_xOHtq1GJMVDRpo26gCnJ7sdFUEhlo
Message-ID: <CAHC9VhQ9NvAn=+58weX8to-AaxsOQn9gck9Ztmrw86aemhWWsQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/8] bpf, lsm: Let BPF LSM provide xattrs at
 inode creation
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: dwindsor@gmail.com, alexei.starovoitov@gmail.com, brauner@kernel.org, 
	john.fastabend@gmail.com, memxor@gmail.com, kpsingh@kernel.org, 
	matt@bobrowski.net, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 3:11=E2=80=AFPM Daniel Borkmann <daniel@iogearbox.n=
et> wrote:
> On 9/23/26 6:57 PM, Paul Moore wrote:
> > On Tue, Sep 15, 2026 at 11:07=E2=80=AFAM Daniel Borkmann <daniel@iogear=
box.net> wrote:
> >> From: David Windsor <dwindsor@gmail.com>
> >>
> >> Many in-kernel LSMs (SELinux, Smack, IMA) store security labels in ext=
ended
> >> attributes. For these LSMs, atomic labeling during inode creation is
> >> critical: if the inode becomes accessible before its xattr is set, it =
is
> >> briefly unlabeled, which can disrupt LSMs making policy decisions base=
d
> >> on file labels. Existing LSMs solve this by setting xattrs in the
> >> inode_init_security hook, which runs before the inode becomes accessib=
le.
> >> BPF LSM programs currently lack this capability because the hook uses =
an
> >> output parameter (xattr_count) that BPF programs cannot write to, and
> >> existing kfuncs like bpf_set_dentry_xattr() require a dentry that isn'=
t
> >> available until after the inode is accessible.
> >>
> >> Add a bpf_inode_init_xattr() kfunc that takes the hook's own xattrs an=
d
> >> xattr_count arguments, passed through from the program's context, and
> >> claims a slot via lsm_get_xattr_slot() on the program's behalf. The
> >> xattr_count output argument is exposed to inode_init_security programs
> >> as trusted read-only memory, so programs can pass it to the kfunc but
> >> cannot modify the count themselves.
> >>
> >> Reserve BPF_LSM_INODE_INIT_XATTRS slots in bpf_lsm_blob_sizes the way
> >> every other xattr-providing LSM does, for the life of the kernel. The
> >> framework keys the collection off the reserved slot count, so a kernel
> >> built with CONFIG_BPF_LSM=3Dy now allocates the xattr array on every i=
node
> >> creation, whether or not a program sits on the hook.
> >>
> >> Give the hook a strong prototype in bpf_lsm_proto.c so that its qstr a=
nd
> >> xattrs arguments are marked __nullable. Both can be NULL for some call=
ers.
> >> Without the annotation the verifier otherwise hands the program a trus=
ted
> >> non-NULL pointer which it dereferences. Also, keep the hook out of the
> >> sleepable set. inode_init_security runs inside the transaction creatin=
g
> >> the inode, with a journal handle held on ext4 and btrfs and the parent=
's
> >> i_rwsem down, which is why everything on the path allocates GFP_NOFS.
> >>
> >> Signed-off-by: David Windsor <dwindsor@gmail.com>
> >> Co-developed-by: Daniel Borkmann <daniel@iogearbox.net>
> >> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> >> ---
> >>   fs/bpf_fs_kfuncs.c         | 99 ++++++++++++++++++++++++++++++++++++=
++
> >>   include/linux/bpf_lsm.h    | 11 ++++-
> >>   kernel/bpf/bpf_lsm.c       | 22 ++++++++-
> >>   kernel/bpf/bpf_lsm_proto.c | 15 ++++++
> >>   security/bpf/hooks.c       |  1 +
> >>   5 files changed, 145 insertions(+), 3 deletions(-)
> >
> > @Daniel, you were CC'd on David's previous patches, so I'm guessing
> > you saw my objection[1], but just in case you hadn't please look at my
> > comments where I requested that David's proposed LSM kfunc be located
> > in security/bpf_lsm_kfuncs.c as opposed to fs/bpf_fs_kfuncs.c.  It
> > would be really nice if we could sort this out now and avoid having
> > this drag out or escalate.
>
> Paul, I reached out to David recently asking whether I could offer some
> help with the BPF bits, added some bug fixes and a lot more BPF selftests
> as I think the inode xattr init is valuable work and something we need as
> well. I just reread this whole thread below given its quite a while back
> and didn't follow in too much detail back then.. the location as it is is
> perfectly fine, I see no reason to change it, and I guess that makes thre=
e
> of us then including the VFS folks [0].

I didn't think there were any doubts that the BPF and VFS folks wanted
the kfunc in fs/bpf_fs_kfuncs.c, but I thought I made my objections
clear in the previous revisions.  While you've changed things slightly
from David's last patchset, essentially folding the proposed
security_lsmxattr_add() helper into the bpf_inode_init_xattr(), it
does appear that the basic purpose and context around the kfunc
remains the same: the proposed kfunc is called from a LSM
inode_init_security callback, it populates a LSM framework managed
buffer, and then when the LSM callback returns the LSM framework code
in security_inode_init_security() does the xattr init based on the
buffers populated by all of the configured LSMs (the BPF LSM as well
as others).  As there are no direct calls to the VFS layer in the
kfunc, but there are direct calls into LSM internal APIs (e.g.
lsm_get_xattr_slot(), as well as the LSM state and calling context
mentioned above, from my perspective this really does need to be
located in a LSM framework BPF kfunc file (e.g.
security/bpf_lsm_kfuncs.c).  I've mentioned several times in David's
previous postings that I'm happy to work with you and the BPF devs to
set that up.  If you are open to that let's sort it out now so we can
get everything in place before the merge window.  If that isn't
something you are able to do, that would also be good to know.

--=20
paul-moore.com
