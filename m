Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293507;
	b=FM5mVRqFE/c448XmXIQkCyqAXTHAj0qYAXHbtxIo7XVIHxEaD69aTRttD6LltkOFBY9Z
	 wf9m0Fw7ivGZTKTHfuTHhcqMp7528YdOeaA3Mcmxb1cdOvH+vic82MKUy42Dmy+1uxgaX
	 egLaieZ1lVtnrdgaa+/TZWDy3bqn8Xo7EScseawC1vIBwaYWQKFjSmTCGDnUsUy/osBT1
	 cWUDdVSkob4JgWDqbhtBmWrdwf9cfBJMTlEItLD5gpzgI8GG/x83WqHmo5QpCaryxIl7o
	 MtQWzvLV64R4i4aJUw3uEOHpMmCa1YOySRC62m6CYjbyfoWJwVVVbrqiPhkivip0Mzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293507;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b/60QXV10ir+0hO0A2OQccMEO1lS0/FXObeA4/RD7Qc=;
	b=qHaX0Izei+CR1bXZd26+nuX5Gp7xHaP3OPdlnPLwjs1zzd8sp7zQBsWycpr0MXIvjmub
	 2TPPicqrlrZBfUhrxLQiVZts6YJgRqqwQYpOWnm9hocwX/avaI+1sVdNurf67ZWB1mVze
	 gD23I6wGw67OD37tm/Ygii8xwD3bA9O8q146N22iORf+BhHc4XxHPu6DsGJGYX8q5liNm
	 lv0EAw2hilUJ9OgKyILQ/1qwEk7XAJ1XQvVpkPRpLPeZ9xCMjnyfMq0X/18ZaBynwuxUH
	 Py8g9M9s5X7tmspZFXbCKwXk+o3lClT596uMs+/bnVDWQFNRtkt2C5Ad8VF4nI6/h5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJpEdtzz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3916C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJpEdtzz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A6B1F008BC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293505;
	bh=b/60QXV10ir+0hO0A2OQccMEO1lS0/FXObeA4/RD7Qc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CJpEdtzzFGxM0SbJaeHhWwydjoevDA+1b4poj0JBEzijXour4O+NyLIxD/k+WADqp
	 xdkya6doPGQ7dBmSjoMuRmwfWEVWJnNkS4GI9gO4sNyy+fjd2xMfURxtufLuZZvkPv
	 unwf2m09qUDGPAWWQMg/qLDCj2PSt99yirbs17SGGxV5SFQC54l0UshjVQSmd20e0g
	 wHlJTkk6TSWCk4OABjAcQl9BVIM8ofK6A4hdj46gaR1mtcFcXTYv2L0ALiqMuc1yw3
	 aQOGr9+gQbroZFswm27oCon8jx0GWwuf9clWXeMv3ijYGqZRbhIRl1Q3x+fvjymYuC
	 cbFur/TkvoHjA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso1465961e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:51:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH4YMkzFhpDUaZwBmvyKiBTL3zOOBYEfxpzHOkZFs+5jANq3g5p5IH3JDbqdFd2sWzC7VzMq8SoMmWLXvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9J+ZbIpP8LDbhKtDzdo+bgJnk8nsniycjUGIJRUhn1wu0+fM/I
	zgLL7COF4OY+A3GPebtLTK11/859mGkOkXIeTBpDiLEJcokhKJWapjsQfbBLFcjoPLNjq3TZCDA
	3ExM3x0haHUn8GlXe6h99+XwW5s8ghnM=
X-Received: by 2002:a05:6512:b06:b0:5c1:57ee:1887 with SMTP id
 2adb3069b0e04-5c157ee18f2mr442651e87.13.1794293504580; Mon, 09 Nov 2026
 22:51:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109202339.1380828-1-neilb@ownmail.net> <20261109202339.1380828-3-neilb@ownmail.net>
In-Reply-To: <20261109202339.1380828-3-neilb@ownmail.net>
From: Xiubo Li <xiubli@kernel.org>
Date: Tue, 10 Nov 2026 07:51:32 +0100
X-Gmail-Original-Message-ID: <CAOuZWzwBaz6D23pMUMs31A552QG6XxneFJ4NCnV4We66vAGmZw@mail.gmail.com>
X-Gm-Features: AclHuK-eKt8QhakcBwvRonmOn-C9kXTDESXJ2wc-n-R3dnleBA0Y5UrMHBhmWhM
Message-ID: <CAOuZWzwBaz6D23pMUMs31A552QG6XxneFJ4NCnV4We66vAGmZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] cephfs: Don't d_drop() before d_splice_alias()
To: NeilBrown <neil@brown.name>
Cc: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 07:20:24AM +1100, NeilBrown wrote:
> In two places ceph drops a dentry and then calls d_splice_alias().
> The d_drop() is no longer needed before d_splice_alias() and will
> cause problems for proposed changes to locking.

Tested with a second client creating and renaming entries, and with this
client running mkdir, creat, symlink, mknod and link over its own cached
negative dentries.  With this patch, splice_dentry() now passes hashed
negative dentries to d_splice_alias()(confirmed with bpftrace), and the
results match the other client, with no duplicate dentries.  A 10 minute
metadata fsstress run (create, mkdir, rename, link, unlink, getdents...)
with a second client doing readdir/stat churn was clean under KASAN
and lockdep.

The async create path in ceph_finish_async_create() was not exercised
here: my test cluster never grants the directory caps it needs.

Reviewed-by: Xiubo Li <xiubo.li@clyso.com>
Tested-by: Xiubo Li <xiubo.li@clyso.com>

Thanks
Xiubo

NeilBrown <neilb@ownmail.net> =E4=BA=8E2026=E5=B9=B411=E6=9C=889=E6=97=A5=
=E5=91=A8=E4=B8=80 21:25=E5=86=99=E9=81=93=EF=BC=9A
>
> From: NeilBrown <neil@brown.name>
>
> In two places ceph drops a dentry and then calls d_splice_alias().
> The d_drop() is no longer needed before d_splice_alias() and will
> cause problems for proposed changes to locking.
>
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>  fs/ceph/file.c  | 2 --
>  fs/ceph/inode.c | 3 ---
>  2 files changed, 5 deletions(-)
>
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index 4a19a00be96f..159ec0bdf1fd 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -770,8 +770,6 @@ static int ceph_finish_async_create(struct inode *dir=
, struct inode *inode,
>                         unlock_new_inode(inode);
>                 }
>                 if (d_in_lookup(dentry) || d_really_is_negative(dentry)) =
{
> -                       if (!d_unhashed(dentry))
> -                               d_drop(dentry);
>                         dn =3D d_splice_alias(inode, dentry);
>                         WARN_ON_ONCE(dn && dn !=3D dentry);
>                 }
> diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
> index cfc438b3a446..68da14fced96 100644
> --- a/fs/ceph/inode.c
> +++ b/fs/ceph/inode.c
> @@ -1626,9 +1626,6 @@ static int splice_dentry(struct dentry **pdn, struc=
t inode *in)
>                 }
>         }
>
> -       /* dn must be unhashed */
> -       if (!d_unhashed(dn))
> -               d_drop(dn);
>         realdn =3D d_splice_alias(in, dn);
>         if (IS_ERR(realdn)) {
>                 pr_err_client(cl, "error %ld %p inode %p ino %llx.%llx\n"=
,
> --
> 2.50.0.107.gf914562f5916.dirty
>
>
