Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065364;
	b=ZSqe7tKLJ4r9B8fdesmD4JcyvIkQES15KOKNuF9rwEeWAp91B4luoz/A/ZzHR0XXSBMw
	 GBPF/buDOFbWdz4y+e9t8A+bbmSeVA44SMmxdK9dZCBx/ujdf83J4E+lWCHsJZFabgbGH
	 hbtmsXHjnoWVDYX2yLgINNQY6IU12r+44A9oN9rd4zcnGG4PHxgOyAw/nR1JfGFMqvcNu
	 KCJT6httA76fiTPf2P9NZdRL+7NoyZVdo77ndpwHUvIzZODsq5rdZGYk/VAlvGNc+9LpU
	 jZp7VzrYQjdHEc+1tSQRWMYzOpwHpYZ2ZG14dh75sL8oG5SKl3xVDzrJ+Ry1RWpP+Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065364;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k0XwnJekCivSW+VH/v0fFvb2lFTslFCHe3QDSYF+pSQ=;
	b=lJS7nLcmF3gV7m8jqwn/0YCv1WF+dNGgPa/iFUQuJFIyTmiVLFCQxBgRQkZc51DlNGkI
	 kk1VebJ3hVeejmpqKtRCnuuGKAaBD8rNUyOhlspzOkBiTpZBrtt9zkXWqyHMzHNPZYmQA
	 jB3NHldPIsyg2Aa61QkM2uWNFV5hwI8QL3ZbbB28XcncjMIdlCt7uIZXbFDiavKT/AlXo
	 0/qM7hVfcOMrBIPyK0Vo4oZvroQzIyPRbW8QYmTOqahtPKZu4DGKDoNtiOvPqeP/+BJ89
	 LQYn+8dVDkK35cI+4zA4Tw98d2S0DDVoIZMw7x1w+KWKFylzmeFG63/GTXF9SejUdxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwP0f1FX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11541606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwP0f1FX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9721F01829
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793065363;
	bh=k0XwnJekCivSW+VH/v0fFvb2lFTslFCHe3QDSYF+pSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IwP0f1FXs3m+EJ3PDgJ7eC7kAwisFjGK+UbHxV8mFaWmz/lUE71lhpAVbwiOT+nGY
	 DbN41ywKc0Thd8oeLD9ESFCsTkXUIbBeEWr+oqpCLfw+UqmquejFEsYrBXVcSIOfhX
	 AzqJ8TVlKQvSsZBlDtIzbB7/JZnQDKCF4uE401kMVs96TGqidwifJ1cxCJNsHA1kxf
	 EBE0yNPlSeZRbQh6Vu61uVwpzQCdBGQZ8FqIHyQeEl84HT5OT3tfvll/zNYzQERbQ0
	 xjPKGscbdtkXCCT7zaBT0FYeV4uXj0D0s9uS+e28o70UvtvacH0FmRbUavQyZHeg1V
	 zlIwHP3d4SfpA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso540423966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:42:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQDSLzOAofxydbyA3PidY8wedb/KxLvcjZcw+ZGx9l/mkORXMBaGtKCX0T/dtDekJwp/x+UIWuN6XpB64=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD7jLjV/+sIvfDbiLJWVNJvs+AF7kG/FsM8kTv7SFROmA96jdl
	4nGv84RhnQdh/nZ4jcR4uK5UQ3i6WppzJ5cqUjo9LTshzpIw6vsJC4Pw7R+IlwIAJ/SmPOsqQlm
	vkTairCEIeK6vuHzsXAxdJfNp9L+lIGw=
X-Received: by 2002:a17:907:97c4:b0:c2e:4c59:a3ab with SMTP id
 a640c23a62f3a-c46bdeca8f8mr931489766b.48.1793065362417; Mon, 26 Oct 2026
 18:42:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026222600.17323-1-pali@kernel.org>
In-Reply-To: <20261026222600.17323-1-pali@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 10:42:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-i6bzHU0RS-KSxDcHSkyCwnB-bgFuRp2dD7UtNk8EStQ@mail.gmail.com>
X-Gm-Features: AclHuK9411IYVdIn7PjqWWNnslUxj4T0yxGbaRz3q8PiwrR-lpqSE4vScfLdV9A
Message-ID: <CAKYAXd-i6bzHU0RS-KSxDcHSkyCwnB-bgFuRp2dD7UtNk8EStQ@mail.gmail.com>
Subject: Re: [PATCH v7.3 0/9] Various changes
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:26=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> Rebased changes on top of the v7.3.
> No functional change, just fixed 3 oneliners from Sashiko.
> Link to previous: https://lore.kernel.org/linux-cifs/20260825230622.24617=
-1-pali@kernel.org/
>
> Pali Roh=C3=A1r (9):
>   cifs: Remove code for querying FILE_INFO_STANDARD via
>     CIFSSMBQPathInfo()
>   cifs: Remove cifs_backup_query_path_info() and replace it by
>     cifs_query_path_info()
>   cifs: Fix validation of EAs for WSL reparse points
>   cifs: Validate presence of EA $LXMOD for WSL reparse points
>   cifs: Check if server supports EAs before trying to set it for WSL
>   cifs: Extend ->set_EA() callback to allow operate on reparse point
>   cifs: Create native Window socket file compatible also with WSL
>     subsystem
>   cifs: Add support for parsing WSL symlinks in version 1 format
>   cifs: Add support for creating WSL symlinks in version 1 format

I expected there would be 10th Patch to fix the problem below.

---------------------------------8<----------------------------------------=
-------------------------------
> > PATCH 8/9 comment 1 - unbound memory allocation based on symlink length
> > - this is valid, but unfortunately all the symlink parsing code would d=
o
> > similar thing. And we have already more symlink types. Do we have some
> > limit how long could be symlink? Does it make sense to address only thi=
s
> > one issue and let all other untouched? I would rather propose to define
> > one common limit and fix this issue on all places.
> I agree that a common limit is preferable. cifs.ko already has
> REPARSE_SYM_PATH_MAX(4060) for native reparse symlinks.

Lets this for followup change.
---------------------------------------------------------------------------=
---------------------------------

Thanks.
>
>  fs/smb/client/cifsglob.h   |  10 +-
>  fs/smb/client/cifsproto.h  |   1 +
>  fs/smb/client/cifssmb.c    |  43 ++++---
>  fs/smb/client/fs_context.c |  11 +-
>  fs/smb/client/fs_context.h |   3 +-
>  fs/smb/client/inode.c      |  98 +-------------
>  fs/smb/client/link.c       |   3 +-
>  fs/smb/client/reparse.c    | 257 ++++++++++++++++++++++++++++++++-----
>  fs/smb/client/smb1ops.c    |  11 +-
>  fs/smb/client/smb1proto.h  |   4 +-
>  fs/smb/client/smb2ops.c    |   6 +-
>  fs/smb/client/xattr.c      |   3 +-
>  fs/smb/common/fscc.h       |   5 +-
>  13 files changed, 287 insertions(+), 168 deletions(-)
>
> --
> 2.20.1
>
