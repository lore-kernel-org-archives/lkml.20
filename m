Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E5A489889
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588326; cv=pass; b=Eubg5ypLzT4dduFUexBbNfCoTcuaON01I6UaZ5rsS+W21Qw5OenCWwq1MWTP4CtyTeV8jYsNIvxVzPawUOEsjItbF9rvsZ7IxRH39pPpB51ZbWYhZA1ulfPmIrhbrgXtZPmdnqrRvVBreSbdkkTYhsHael8buMQs8uwo3ZCo8xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588326; c=relaxed/simple;
	bh=gb6048TDzYlgycuIW+LHs5ZmNznTudpMWjLZxgLAZuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZTLljbae9gqAYGW+qLJm4YZOolxxY8sMbv/W2kq3HE/TglNn4NyQr5hGjQmROc4K6oWLBwVfrAtfM2I3Bm/ewG1l6KP+VuZnLbPAm7FvlPHtNllScpC/C+017TJLVIYsCs/lS+0STVQYhhAlOTASPuIJV1LTwjE1BfNQ0We0D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1gMmZZ0; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1gMmZZ0"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so3292278a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790588322; cv=none;
        d=google.com; s=arc-20260327;
        b=XcAe0DBUl+9BGtWauieHxl76zkNNDuC7Wyyzm/cCI1e4khC+2NsMQUyp8+QXNTzB0h
         LZcjG5x1NqcVRrJOoP+Rnm0Q0/Tn5IlBOwaOH6dO/eO008T+hrR9/cfNDQeEOATIErjo
         wvmeAfucelynWyS2fUZl5ma5DFMVJqb1DNvMEg2y+BIK8Y0pK0dwUQv0qwI0k0KCdUPt
         a0hbkSiozLuxI0onyHHY5xrLWagZFDQrQVIrF2IG0h0wNB6pzHJab4IPBcSf5eJj9o7e
         l1vL1x0GhABxI9+CAfRZ6PdM1CH0Sa8F/scWKvijFRRHv2cWua3DZLUpLZ9UUVN+go69
         cuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hKDPUtqRH0gCyeriwhHpNabxiyuB4wCzvkW0lk6SNbg=;
        fh=VKq7lFwFgUHFhGPxxMkiNCGS0EJc8oI6isBO8gWFwE0=;
        b=cVTwwvIHyn5ZGWunU0aUttxJbdMdixJtEUtF0VKKBOiwbYhaiYXe242iFahCafl9r9
         Uy8hRV8NiqnSwBYKfVqqUa5W7fmtbfuJeekxhL06aoT9q99CUUZaOQDnB0gBiyObhPz2
         JrBJn2rDKwYMChPTDm+i5XJMjmFg31xJCXDDIENZcXo213tau9Alfjdy/o0Fg0Q4kbUW
         H555cOqFYRCtAbYXJczvmyRfQhpuGK83XC3Lg9w55Fh3Tazt4jAlYB2bSiZd2fPBisYm
         DJMjhH6dRceHbG283rzwAQ738YHyYg0YPp5Er+78k0IAKlf7w58Ddcn0VBAj4AYe5gJx
         LZ2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588322; x=1791193122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKDPUtqRH0gCyeriwhHpNabxiyuB4wCzvkW0lk6SNbg=;
        b=g1gMmZZ0CSMxiEmpNtJwcyO8y7TxMBgQk5+V3AL5gGDdT720hAXgp69f15UyC2KSUg
         D4L0Uk8xiptJ1xjpi80ksAOamOCsQqpqpB5yaRsbHmr4baznpRIGVD0S0M62rZn1rgv1
         IZQqY+hg7CULmw99YA8ODSORJnRPhoUI8Cq6AjYpbUKPNjJrBbs6Ex+8L1+8QAmHluHI
         uFI7EHD20AE/lQlTzfqeKVoUjFqmxvxsXeODOEURcVq1TCpA7kxf0ZM5jxdKEPadNSDe
         hWf5jeayxlRLeabZljZmElcdVrw+jYy8q1QJuJ/TXnFLS51797y4H5p6KNZWYf7hZFkI
         w3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588322; x=1791193122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKDPUtqRH0gCyeriwhHpNabxiyuB4wCzvkW0lk6SNbg=;
        b=tPzzlBq/33tm3Uv/pimL3CXimM2UUW0aoqTc98J2DRgFpbAdgv6qBmwIVRCqo7CSn+
         i4G6alJ9XC7COf/cvHZLEpPjlSbWu9iNyPYjmVrlXXC4Ni/KGdS/d47lQ09vCz0r6EkU
         ZJA8GGHuhKDdmffXIDTwEWlplp5XgPiNQbgnjaw5f5a9shNK9Io7F6O23osVAdCqeVq/
         M8nh8AejIXoYguE5YZDt5wGcD20vLISVGKnZfE/IpN74g4zshZ7AJRbgQ+qpiwiWMgr0
         mqlsvWm21eIM9QKgbSLsWiNy/46QRYuNbebxG9dfwjSk3jyskkOU8d90Pa8+hmPYGW2W
         VApw==
X-Forwarded-Encrypted: i=1; AKwUvBzBaAe33WrpCFA1znyuMDgUCtkiUuUjAOgSbuOSKXoV0Or3EsbOemuYi8f4rhfnGVh2s6TnNBYm6KJ7rJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx/jN0T1CiibhNPwLLx0KV43JACaKBUOWyq7X/l0pmWztHsBVC
	wJCGMJNfkUqfjjIbsWKRaOXz5zDG7WaXUDiWdxuj5G5gflUXrsontARYYgr7+2iXRKkfg3gmZGC
	+bq2scIqrkoHOHcO+Gcclf+d0BGOoDsuj51MyeFY=
X-Gm-Gg: AYBFou0ZSVJt6ixRru2FpIygdlElSVaoSEzc4nAcUTViLHS3UoRkuGHd0T8IulcyTxI
	qlh29//HZIWwOAcinfCwGodvE3qKDLu9hmqEsJAcoy+6J/9+D24Q+RgfoJ06EzllEtOl0vmqFoP
	WG9moZ7u+cA53k2nKXAP5/tA7SADSOL5Km7oaaBG78yr24SUL5UHiVULb4nyQCxIyEXHUS7Goa2
	ycLzaPa9+YGDkIhh/NhxWUethskouPKR7NlTxn4bJb+f3YWestLMacyh+KThvGfudUvwaAq0Xhp
	21AGg8HypSeKWChZKZn0b9Fc8yHSHtu7SUTXWnANBm9NIIt+TnEEhM2i
X-Received: by 2002:a05:6402:2112:b0:6ac:73f8:2e5a with SMTP id
 4fb4d7f45d1cf-6ac73f831f7mr2844331a12.41.1790588321442; Mon, 28 Sep 2026
 02:38:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927141437.1432584-1-russ@har.mn> <20260928014357.2285448-1-russ@har.mn>
In-Reply-To: <20260928014357.2285448-1-russ@har.mn>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 28 Sep 2026 11:38:30 +0200
X-Gm-Features: AclHuK_FhmfwqFXI5b-5yRrCn8vRB0dEKaDQXuuiyccQhL2aHv2Nq8mRUxiiswc
Message-ID: <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
To: Russell Harmon <russ@har.mn>
Cc: miklos@szeredi.hu, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd@bsbernd.com>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:44=E2=80=AFAM Russell Harmon <russ@har.mn> wrote:
>
> This patch adds support for propagating the inode generation number from
> the FUSE server to the kernel.

Incomplete statement.
Without the mention of GETATTR/SETATTR this is a misleading statement.

> This is useful for exporting FUSE
> filesystems over NFS, where the generation number is used to detect
> stale file handles (ESTALE) when inodes are recycled.

How exactly does it help?
I am not trying to troll you, I am really curious. how?

Context: I have been trying to improve FUSE NFS export support for a while
I have built a library that provides reliable NFS export for FUSE passthrou=
gh fs
for specific backing file system types [1].

[1] https://github.com/amir73il/libfuse/tree/libfuse_passthrough/passthroug=
h

It is broadly understood that real NFS export support requires extending th=
e
FUSE protocol to identify objects using file handles and Luis has
already started
with this work [2]

[2] https://lore.kernel.org/linux-fsdevel/20260225112439.27276-1-luis@igali=
a.com/

So my question is, what does adding generation id to GETATTR/SETATTR
improve for FUSE filesystem writers that wish to export their filesystem to=
 NFS?

>
> Key changes:
> - Bump FUSE protocol version to 7.47.
> - Repurpose the unused `dummy` field in `struct fuse_attr_out` as
>   `generation`.
> - Add a `FUSE_ATTR_GENERATION` INIT flag with which the filesystem opts
>   into the kernel consuming that field. Gating on the protocol minor
>   version alone would break existing filesystems: the minor version only
>   reflects the library, not whether the individual filesystem fills the
>   field, and a zero there would look like a generation change for any
>   filesystem that reports nonzero generations in LOOKUP.
> - Update `fuse_change_attributes` and related functions to accept and set
>   `inode->i_generation`.
> - Populate `i_generation` from `LOOKUP`, `GETATTR`, and `READDIRPLUS`
>   responses.
> - Detect nodeid recycling on `GETATTR` and `SETATTR` responses via
>   `fuse_stale_inode()`, the same check already used by the `LOOKUP` and
>   `READDIRPLUS` paths, and mark the inode bad (EIO) instead of merging
>   the recycled file's attributes into the existing, possibly still-open,
>   inode.
> - Update `fuse_get_dentry` to validate the generation number against the
>   file handle, returning ESTALE on mismatch.
> - Maintain backward compatibility: without `FUSE_ATTR_GENERATION` the
>   generation field in attr replies is ignored.
>
> Verification:
> Tested with a QEMU harness in fuse-generation-qemu against a patched
> libfuse (FUSE_CAP_ATTR_GENERATION, fuse_reply_attr_with_generation) and
> its passthrough_ll example reporting real backing-filesystem generation
> numbers. The suite verifies that:
> 1.  The generation from `LOOKUP` reaches `name_to_handle_at()` file
>     handles and matches the backing filesystem's FS_IOC_GETVERSION.
> 2.  `open_by_handle_at()` succeeds for a valid handle and fails with
>     ESTALE for a handle whose generation does not match, both while the
>     inode is cached and after cache eviction.

1 and 2 should work on upstream FUSE right?
This is something worth mentioning.

> 3.  When a `GETATTR` reply reports a new generation for a cached inode
>     (inode recycling), the kernel marks the inode bad: fstat() on an
>     open fd fails with EIO, while a fresh path lookup recovers and
>     pre-recycling file handles fail with ESTALE.

How did the inode recycle happen with passtrhough_ll which keeps
open fds for fuse inodes?
Something is missing from this test report.
If you just used a mock filesystem which makes no sense in the real world
then the value of this change is questionable.

>
> Signed-off-by: Russell Harmon <russ@har.mn>
> Assisted-by: Gemini:gemini-3.1
> ---
> v2:
> - Bump FUSE_KERNEL_MINOR_VERSION to 47 to match the new 7.47 changelog
>   entry (v1 added the entry but left the minor at 46).
>
> v1: https://lore.kernel.org/all/20260927141437.1432584-1-russ@har.mn/
>
>  Documentation/filesystems/fuse/fuse.rst | 32 +++++++++++++++++++++++++
>  fs/fuse/dir.c                           | 21 +++++++++++-----
>  fs/fuse/fuse_i.h                        | 10 ++++++--
>  fs/fuse/inode.c                         | 23 ++++++++++++------
>  fs/fuse/readdir.c                       |  2 +-
>  include/uapi/linux/fuse.h               | 11 +++++++--
>  6 files changed, 81 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentation/file=
systems/fuse/fuse.rst
> index 0fbd5a03fdc9..f67bc9fc6316 100644
> --- a/Documentation/filesystems/fuse/fuse.rst
> +++ b/Documentation/filesystems/fuse/fuse.rst
> @@ -49,6 +49,38 @@ using the sftp protocol.
>  The userspace library and utilities are available from the
>  `FUSE homepage: <https://github.com/libfuse/>`_
>
> +NFS export support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +FUSE filesystems can be exported via NFS if the filesystem daemon suppor=
ts it.
> +For reliable NFS export, the filesystem should provide a unique inode
> +generation number for each inode. This generation number is used by the
> +NFS server to distinguish between different file instances that may
> +share the same inode number (e.g. after an inode number is reused).
> +
> +The inode generation number is provided by the filesystem daemon in the
> +following messages:
> +
> +- `FUSE_LOOKUP`
> +- `FUSE_GETATTR` (see below)
> +- `FUSE_SETATTR` (see below)
> +- `FUSE_READDIRPLUS`
> +- `FUSE_CREATE` / `FUSE_TMPFILE` / `FUSE_MKNOD` / `FUSE_MKDIR` / `FUSE_S=
YMLINK` / `FUSE_LINK`
> +
> +A daemon that keeps the generation number in its `FUSE_GETATTR` and
> +`FUSE_SETATTR` replies (the `generation` field of `fuse_attr_out`,
> +protocol 7.46) must announce this by setting `FUSE_ATTR_GENERATION` in
> +its `FUSE_INIT` reply flags. When the flag is negotiated, the kernel
> +compares the generation in every getattr/setattr reply against the
> +cached inode: a mismatch means the daemon has reused the node ID for a
> +different file, and the cached inode is marked bad (subsequent
> +operations on it fail with EIO). Without the flag, the field is ignored
> +and the generation is only taken from lookup-type replies, preserving
> +the behavior of existing filesystems.
> +
> +If the filesystem daemon does not provide a generation number, the kerne=
l
> +will use a default value of 0.
> +

On the one hand, I still need to understand the value of reporting generati=
on
in GETATTR/SETATTR.

On the other hand, I do see the value in the server negotiating at init tim=
e the
fact that "Generation values are reliable".

What happens today is that NFS exporting is allowed for all FUSE filesystem=
s
regardless of the reliability of generation id, so after inode evict
and recycle,
an NFSv3 client  that had access to inode X.Y may get access to a completel=
y
different file or even a directory with inode X.Y, where X is the recycle n=
odeid
and Y is an unreliable generation provided by the server.

The problem is that FUSE does not require opt-in for NFS export, it only
allows servers to opt-out of NFS export (FUSE_NO_EXPORT_SUPPORT).

So what can be done given a declaration of the server that generation
is reliable?

One option is to set a non-zero uuid/fsid to the fuse filesystem.
This will allow exporting the fuse filesystem without the opt-in uuid/fsid=
=3D
in /etc/exports.
This will also allow setting fanotify FAN_MARK_FILESYSTEM watches
on this fuse filesystem, whose file handles could be trusted to be a genuin=
e
unique identity of the filesystem objects.

But if we take this route, it is better to take it one step further
and allow the
server to determine the filesystem uuid/fsid during negotiation.

In any case, I am not convinced there is value in doing all this
without extending
the protocol with LOOKUP_HANDLE/LOOKUPX lookup by file handle, so if you
have compelling use cases, please spell them out.

Thanks,
Amir.
