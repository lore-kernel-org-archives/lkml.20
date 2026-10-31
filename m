Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793456299;
	b=Jrwzrk/vM3JPXpfS2e/5+2eO+HD/Wd+tBNCmK9TwJi4E9vU/eGQSpNP1zPpUlJnfIcmW
	 Je9dUH/KVLLf7c1hO//4epO9mPM+KYG8nUcK/57fqQMxGoovDKKzduFbGtrK2W0AJhvw8
	 aEeXPHBxwVXO5uYY1G/xFYzGVUl3ukTHfiq8K7H2WIgxl0cFIQFvYlJS9X5j0FRMXLwAb
	 LCy6/b8i0K9ffqULqhUTc3JHBSrIZpEz0Kvc5nOJoARtGuY55VYLErMj503qASgM3Wvzl
	 Ti5G+0BJmDjLP0qtgHwpaewkMKevVGEoWOixsmrmuUnLFHS0k52KPH8u6ZxaAa6ET0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Patvq8zmYKObsZg0m1UZqbH1b5GBfytCkWtSbWUod8M=;
	b=n4IY7cnNyMqUdH1z14QKJBuc2xtci3ysyPGjnQNL1vYuX+oNnWx+DIAlbtvmF1QAkBnb
	 LtwQNSCQVmYlUEU4bzE7oCzK4WKmlji5bz2o+t67shzFeeCVG6u6g5DVyqRm4uTP1XLp4
	 uTsvZXMtZ0n0d0d9p42+0DOofPTJCuRtBEmpVxEtObQhI7pBYu5hni/jSyrap6VA6ZUqY
	 udrWsvPRJ3NX0Ad0s3pzq2XVU5RMhL1HI31ywi/T4Cj3zI4Gb+zz5hG257fZi72ziAuME
	 sKqPpv3uHFgibLx+OX8mwRJLpTxpzC/Dfoqr7tTtcyy78pBpSG8y8+zoN7uXx3RU5cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oQSLLC1m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364E606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E364E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oQSLLC1m
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso2251660a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793456297; cv=none;
        d=google.com; s=arc-20260327;
        b=OyXrfCixaXkIGAEKG6Guh9/v8vF8AFmTRvl2jM12fdDdhNj0mbkSfJcZbwsMACzlVe
         OTUToY0ASwo8qp1R8HYEkt8/72Y4g2437wPODcB+V5affzgw3natVM1Vk5lYu30Vo44M
         DYn+moCUdIPf1yc08OntQa9L1RnWm1/cdFAeDsv5yOkMrrOr7Igeu96+U8SDY93v5E/n
         x93TqfHthtpkanlIO14a40iaf+KAJxgxXXdYPqKPOAJ2QrXRXem+Rvva18KxSWmIzHb2
         oaynhG67nfo6khWrjQlFcQXJjL0509ZVSAp4KEnrzYpI5QxdTlRljnHDgrTRBJOcUWlx
         AEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Patvq8zmYKObsZg0m1UZqbH1b5GBfytCkWtSbWUod8M=;
        fh=ejbueqdndrgSYu6BFZd/TB74OmhJErYbmU0D7JWcWU0=;
        b=ntiylbzoiZCgUGXVWWDZQ6npuyR0fuKKLdDUk8PQDxSQi5wswXaTSzin+DuKI4/Ff9
         ecHcpMFXU2P4lPMdz/+VF4RchHbyMh4TvpgFEwatOF6GIV4DFnzX0IC5m2XOu3Bg4oS4
         nmDbsyPMSbO4zt4aQEKfJPTta+rgP5cCBjcU28APOF48SpjybArYn0qc1NiLQfARhdqT
         ctPdr3pnMxWLOdOeVeUeYn0dIpbnLQrKctHVqkwFhCfJzKoG+TEvbElGOKnU2wNSw5Yx
         fdE9gSEXzbt5Qy8pAonxlM/utE2rxbDjzLNZrVv7KFei+GLkJ+TNIJqulPKK1gjqLu2F
         Y4tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793456297; x=1794061097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Patvq8zmYKObsZg0m1UZqbH1b5GBfytCkWtSbWUod8M=;
        b=oQSLLC1mlwpZCk0ZZrL78sZBTbXMULvV3A5VNNAB+fjwScljqC/+c8krSIy+5QkCTU
         9Aewd6oLipaVsncWBwbOzv9IQ35Sk7bSNgHjp0q9Wh0a2M5YtJgfdFZMc6J+S9HU2qBT
         uw96KgDa0g49IduaTD9SDThtQLiSC3e2cy576lxjGXvJqx2nWlAIGE5JrjKqxNWqltIC
         LeoPRHoC4Uw6ELdtd0segJT9DnVtvGhpAZ9uPZfReqwNibJQV+/ySK4LD1s+LQDGz9h0
         4nHs5O8COquJdR38IVfmn3pvv/jXZZzJuRPfYpx/9C7z2hfBjbua015UnPZLfmLZJ2Xi
         1BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456297; x=1794061097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Patvq8zmYKObsZg0m1UZqbH1b5GBfytCkWtSbWUod8M=;
        b=r//+w9u6nTlA1XWyoBKsTvc7sYeHLm0cPt7js0Cqyn12TEZtakZE+M3Gz6wgB8rf4W
         BFpK1vrFaxSSitayFsDfl/wXaEgp7jaTUzpG4TPVB2TiYtmEZSfWsnjhjXzLj/baI8dq
         HQTwgmtiXPQJcaZOd3Gu17zlXQCbgG1cCuYIXjeb7jflZAwP+OZ/oJPEAdiHUqGWz8NJ
         BqOR4lm0jVGrueRa4h+/8gcamCIpelgBj6XYY6MsaNU6OkgtFoGP8ZF4KzzMiPkREAvw
         lCVjLMS45g62lCnSz2FybBslt6hwGhjOhjL/COGftnWz+L1IKVbRlth4bVuTI9cbk07x
         BFDA==
X-Forwarded-Encrypted: i=1; AKwUvBxYwOjfRUoEGOnsIPo0Zzqkf7zxy68fww49EedEwxVfMgK9tn0/w6PRO2+bf7Lq0A+4hq+sS980yUy9ZPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEB2XSCttljMxzoOxRf8IKcu9uYvUg+ySmpMrnbzj6TCB2DIyz
	mE2WJF8EAqZT9KMJlEdnl9gAVjOw9ZN4TY39hI1Gsyyjja0NK8vml68kD3zX+Cd6Rmw25R4xlmg
	6/EXLLCol3bb9aHg4V8p8C96BXJhiNio=
X-Gm-Gg: AYBFou02dG5Uj3EzfIc7oVd4T6hbklI9luYggFh/3RWSj4yL+gCJnhZa6clkQ1RNWb4
	gAJSXr33/U8zxLrY2PXoKn1oisVWYs+0yLz2zF4JUrEbhsQFWFFUg2X27G0iyjhmcMrWkivxZu/
	ac+qNK08dVy9kgqxFNX+7p7qCStYTHumcnmo5LTysqcosLbnrDWnhHtTc+jWWDrrHM+rnDrpVAv
	aIYckBNkJamL1kGIIMi4cJY3uELIiXn7sSzVW/vXwzOdcJ6LuraTqDyL6YlmZPdN+MRFZl/Zhpt
	izy+bcKMowlwI0QfsipBF8HWPkbuw4J4q6ktwSu3qg/bijn/e6xkNCF2GFx4r7M3+ANS1hoOxYz
	UT6AYy5j2QKGbq0xbcHz68yVcNfsQopCkAjavbx/fcZW9irwRJK1LmyXpp4sQlAFl0g3+KQ==
X-Received: by 2002:a05:6402:50a:b0:6b4:5a0c:a7fe with SMTP id
 4fb4d7f45d1cf-6b4d4c72396mr3193898a12.28.1793456297060; Sat, 31 Oct 2026
 07:18:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028134728.294127-1-koray.fra@gmail.com> <20261028134728.294127-2-koray.fra@gmail.com>
 <auILs54TUcWXf3us@pedro-suse.tail5790ac.ts.net> <auMzpUIEmGCE_x_N@amir-ThinkPad-T480>
In-Reply-To: <auMzpUIEmGCE_x_N@amir-ThinkPad-T480>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 31 Oct 2026 15:18:05 +0100
X-Gm-Features: AclHuK_VupdwTnfkty2dMVhzMxaAc8BrZ6HJFAl7_OYvEEgnr1tOPYIrNbWdV30
Message-ID: <CAOQ4uxiuy0VwZj+3M-zRqQ49WTpHZpiaQ+6MZ8z8WdLjyQM_zA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] vfs: add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Chris Mason <mason@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:53=E2=80=AFPM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Wed, Oct 28, 2026 at 02:56:39PM +0000, Pedro Falcato wrote:
> > On Wed, Oct 28, 2026 at 02:47:27PM +0100, koraynilay wrote:
> > > Add provenance time (ptime), indicating the time when a file or
> > > directory was created. This is user-settable via file_setattr() and
> > > retrievable via statx(2) (using STATX_PTIME) or file_getattr().
> > >
> > > The semantics of when to preserve this new timestamp are the same as
> > > mtime, the idea being that there is a correspondence like this:
> > >
> > > ctime <-> btime
> > > mtime <-> ptime
> > >
> > > so every operation (copying, moving, ...) that currently preserves mt=
ime
> > > should also preserve ptime.
> > >
> > > Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> > > FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> > > xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr()=
 to
> > > allow ptime to be used with the file_setattr()/file_getattr() syscall=
s.
> >
> > Random comment, but: could this be doable with xattrs instead? I'm not =
sure
> > where I would put the xattrs code (if in userspace exclusively, or if h=
ooking
> > the VFS up with this, or if doing it on the filesystem side), but it wo=
uld
> > surely be less disruptive than modifying a bunch of filesystems one-by-=
one.
> >
> > This patch is quite simple, but changing btrfs, then ext4, xfs, etc is =
a
> > mess, and inevitably you can't get these timestamps until you upgrade y=
our
> > filesystems.
> >
>
> I disagree.
>
> I think that creation time should be a first class property in
> filesystems that support it.
>

One of the reasons that I think this API is a good match for the Windows
style creation time is that it was already discussed as an API for the
Windows style DOS attributes [1].

koraynilay,

In your next posting, I suggest that you first demonstrate how the proposed
API is used to facilitate filesystems that already support a user-settable
creation time (smb, ntfs,vfat,exfat), before adding btrfs support.

Thanks,
Amir.

[1] https://lore.kernel.org/linux-fsdevel/20241227121508.nofy6bho66pc5ry5@p=
ali/
