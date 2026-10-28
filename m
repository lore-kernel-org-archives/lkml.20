Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221955;
	b=bk5dPvXpFBOU1EoI/7k18jeCKFoNp/R528ZR/FoZ+GV46ej+KOx+oFY1COvBTl/H4J9A
	 mkdcyFidOnPhthFEEow9iHXTpD3Pp8VgUILyA4PrE55yUHTSn+AIv3+vfnKknqV2L42Yo
	 oxN9yLJ5gR7ZCuiKLfSRsZkRS/24HfyqPfgxnFnVmNOl+vdVyikbKAzQq1e2EOxeg8/0z
	 5YMZEBpy3vF5kRkmoge8apV/IsrGNeMVd1T9tHuV3JhGIZnaJCfD/u7Bomw+SVl9HaoJ3
	 fDQ0p5xQQa1pIUZ931LYvhfsaInqgZ+nMjfGsczX8F2A84lUL7VnWzGXBL0L24bdFXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:X-Mailer:
	 References:In-Reply-To;
	bh=xQYG6Eek7tElytcLfy1wx1UEuQsespAi1XALnFrixwk=;
	b=ZH8KwU2IAZGzRNmLwK68FRKizfc1N4zQHDlvYEDIVO1RFO1JdsWMvB1b6aaMtpC2Rjyc
	 xBBqcNimhcN4t0JVcUkwq3wC41OmVv7hDmqd97c5TO5FluN83mRuy+1eoMxS8M/sugy/L
	 tb6EIr0ou+ZK2jFHTc0V9HFbizAupZuZCxM7yjMg6beHab5n6fDTyaHU96oWTTB/eNtt6
	 tQ8ecbmmqXd7dYqjimL77hOxp6OmKAFi+r7LGgroE2Bk2VAnKA+0ATzkI5grVtSLh3r63
	 6/SKLjH8gUKXayHIlO/W89KKcRdc6gwaV3gu0+h1sYFx//rizS0phyx1zrbQknFTUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MBhdeAFs;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8354606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8354606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MBhdeAFs
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d870d54so964630f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793221953; x=1793826753; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xQYG6Eek7tElytcLfy1wx1UEuQsespAi1XALnFrixwk=;
        b=MBhdeAFsQ4fJS9yta/S1s+KXAQFfwSDfwbV5Eugq9byXI7ZZumVDaWmVrAY1pFSkU+
         WXtgEI+tt4/gCJESMnuNeIrRg84JRF6une+kiz0smneo63C7Mdba4MDTMJ8IXU3lkvQ6
         0lKJM/hz/wTYNxUYTr6KLA44Qv2kqBcbi2Twl2d3nJJVcCvb21BHZqCl0UC4kxxQG8h9
         JJ2qCT8UlStGXxTBua22UapnaM7e7nItbpLioHv6YZ7iCNfIgErMyNX9HdK421gmNfAR
         unCsxuxOkz4l92pugfOIkH5jV5WfcPbxMkAYkwZ0VX/3YZdv/2gd7rNhC6qdL7lZgH7v
         /XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221953; x=1793826753;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xQYG6Eek7tElytcLfy1wx1UEuQsespAi1XALnFrixwk=;
        b=sJ0qaTHSpy7IeBD2LAeOVD8S4p7ckjnpmbe0Ry0/t44H0SbIwPalTa6zmBI2XM5cXG
         fOmfkvsEVME4rkLB0RbOf9D6y2WDanCGjlBRDn2xoDn3oxURjaEDQjDqWHjH1ydkI8p0
         n4FlP+xAxAxbjeNfcjKGtO26nBipufe+fU/OkkeNLx/NdN2K4J9AgMz2w42DZHdXOMVv
         r44qU26XG5G4lxB5gfrsBu12DkE2OwOlK12Jf8QZv2y1kfUG/2BA3+MTtg82pgoVId18
         7ReYJFfNnS43JjwNOjPfxFqpoDC6FpadDBgSYimZJLfYF1Qb2pcifCMzzit2qEtaA1c8
         tjlw==
X-Forwarded-Encrypted: i=1; AKwUvByn+QMHNx19BadJlnjWEbu8P7J9xAsc6FjQhcu5v4a7VLeY/x5KSjXV8tN9OGRTVmmcQY8FDkz+lj5eEWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9FWbdxAJ0Krb5qozR8OGFaZ60y6fzEcJqez52M895OKWWMAzh
	8Ko8clFABmhL7CxkSMutp0O8pc07FT8SpBkB8Q3BjQcX/5VVytwfCJKW
X-Gm-Gg: AYBFou0X9/B/gncncriube+kwGXTVWi1nEiRrvQ1U35N77PEUzRwmoMVCEDYI8+yT0Z
	chKeWJqAnhAeTzTzCCizPTP9G/ZnD/XFyogvV306+ihXteijNvCp07EV7bsuR2QTjtx4+agz8UB
	cJo1Krdl956MV1Xy9UvhH9m9RXgPzZ9NE5iDhOemYm+h8GKwWKdsEc80+ctj0cWYNhOGApc/PPg
	EfQt+zsgdysOUNEral0UQlqr9FcUDzH3oBWk8mSf9nQ5jyuxWFlGu2Azc4v4Coq/qoeagVnF2eD
	BQHnVW+9pe0b4gVKjUet0wzFWqVRXkB6cronQUUKXluyQlFoPkwv6xS5WQtYXdJZMS35EFrMNMa
	Lo5oe7QLbmpDtA6lpljiojVYNxcc4IlADouJyd9aIOLbP1oeyl6IJXnVgC7QMk6F2gqNjT6+8cd
	upM7Wtqjw0gddL1PmBPw/8k0h8FEx9iELjaTFIqFyIg7XXFrUaoL343hr7/01527bQYtiuGiPgY
	CqH4oeZ5rjS6aFqRRwU8QuqNmPZtBl0odRbvoA0udpTST5Cp/grTty4ZDkeSrk3s9cfLFnHPm/V
	UkW/j0hlrdxDEwIleUf5hZigEQ==
X-Received: by 2002:a05:6000:2304:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e5d5a4195mr8378579f8f.41.1793221952869;
        Wed, 28 Oct 2026 14:12:32 -0700 (PDT)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48fasm30209675f8f.31.2026.10.28.14.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:12:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ef721ab95fb5240873f3268166b2e5d67a30159a361b9b3396093633bbb7;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 28 Oct 2026 22:12:24 +0100
Message-Id: <DMGS4KQLY24Q.14MUTR6U93GIC@gmail.com>
To: "Pedro Falcato" <pfalcato@suse.de>, "koraynilay" <koray.fra@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Chris
 Mason" <mason@kernel.org>, "Jan Kara" <jack@suse.cz>, "Darrick J . Wong"
 <djwong@kernel.org>, "Sean Smith" <defendthedisabled@gmail.com>, "Andrey
 Albershteyn" <aalbersh@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 1/2] vfs: add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028134728.294127-1-koray.fra@gmail.com>
 <20261028134728.294127-2-koray.fra@gmail.com>
 <auILs54TUcWXf3us@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <auILs54TUcWXf3us@pedro-suse.tail5790ac.ts.net>

--ef721ab95fb5240873f3268166b2e5d67a30159a361b9b3396093633bbb7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Oct 28, 2026 at 3:56 PM CET, Pedro Falcato wrote:
> On Wed, Oct 28, 2026 at 02:47:27PM +0100, koraynilay wrote:
>> Add provenance time (ptime), indicating the time when a file or
>> directory was created. This is user-settable via file_setattr() and
>> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
>>=20
>> The semantics of when to preserve this new timestamp are the same as
>> mtime, the idea being that there is a correspondence like this:
>>=20
>> ctime <-> btime
>> mtime <-> ptime
>>=20
>> so every operation (copying, moving, ...) that currently preserves mtime
>> should also preserve ptime.
>>=20
>> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
>> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
>> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
>> allow ptime to be used with the file_setattr()/file_getattr() syscalls.
>
> Random comment, but: could this be doable with xattrs instead? I'm not su=
re
> where I would put the xattrs code (if in userspace exclusively, or if hoo=
king
> the VFS up with this, or if doing it on the filesystem side), but it woul=
d
> surely be less disruptive than modifying a bunch of filesystems one-by-on=
e.
>

Thanks for the comment, I actually wanted to include the "why not xattr"
explanation in the cover letter but totally forgot lol.

I actually have been using fully userspace xattrs[1] for a few months,
mostly for backups, and it "works"; but last week I wanted to merge 2
FSs (and have another merge I have to do), so I ran [1] on all files and
then compared all metadata/data between source and destination and
noticed there were quite a lot of files that didn't have the xattr set.
So I looked online and learned that xattrs only work on regular
files/directories, not on symlinks or anything else (and the missing
ones were of symlinks).
This is what prompted me to search more if anyone had already proposed a
new timestamp (instead of making btime settable) and found the linked
email thread from april, which gave me the excuse to finally work on a
proper patch.

[1]: https://github.com/koraynilay/btime-to-xattr

> This patch is quite simple, but changing btrfs, then ext4, xfs, etc is a
> mess, and inevitably you can't get these timestamps until you upgrade you=
r
> filesystems.

So yeah while I do agree it touches a lot of code that could create
problems, IMO this is the best solution and it would complete files'
timestamps like other OSs have (and this, I think, is necessary for
both backup/archival and migrations).

Best,
koraynilay

--ef721ab95fb5240873f3268166b2e5d67a30159a361b9b3396093633bbb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCauJlOAAKCRDmj22qf5IG
XM7fAP9ndP88PL7Eqo6Vig804tPfrb6wBJOZQWGAifFB0IK6hwD/YzPGX0GZGF3x
jpAvJTnHPxC3rS9RbTeSHSP+qDz7igE=
=GcKG
-----END PGP SIGNATURE-----

--ef721ab95fb5240873f3268166b2e5d67a30159a361b9b3396093633bbb7--
