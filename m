Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628043;
	b=IfZ2KApp3eb/UQQ7NgYa54WboN7dbAp4uZy/ORqiPqCcsiync1k4WbyMDTPby60t8RD9
	 i/XfeeDJ5xctFCGsKC0BNcyAuXkbenvLq2oLBZ1ZTJZfg9QsCZlvHZ4uFy5jYi2ekZLZb
	 NNvzQcRIlNDDGZ9EDi3hBHx0WDGSPCcOpQGYrBdWDW2fEOPEa8NZjE/JY4i4I4Xjx3Wbn
	 1n759+kuwAPZ6ZySC+FTV2pMBalXiRfy59An2oLBzCc3g1XuyVlVdVpwVhg+iYaUce+Ac
	 tFFRMq4huB14U3iRTrXjFZLcy/054R14Z4v2mieHdak1ClEMYLVQ4czL+FX07E1BiJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
	b=eLM9hYWRVPt5cahAaYpRI+if/DThX5ZAKdWl5NEFnXilh6qd8M8LJYUyTFrin1qLQ0iL
	 1qnWOgnJ7pExOsquQVpEFg2IE9J6j4miBRckVTq1baykKkC7LJlV1raMinG059xPmWJqk
	 n2jamOU4iCP1DHAWeehEQ+pOCpAWVC9P19HWyjxcFiUyz6sfzoQcplHRf6bw1Bg3pFIhV
	 yiqPBXLluT4pMWx+8TtmIZ9urp1qypWSN6mHktRyb6eurEfMQNWhERbQrUqWKnBGDw/29
	 Iy6Ml6pzlISP271PQhORMkppOu6uf9UgLs68IGl0Q3EKQmfyYlayeu0WNpwGWVbmTAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqAIi+u2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666AA60A382C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666AA60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqAIi+u2
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4ceaee6770so2153366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793628042; cv=none;
        d=google.com; s=arc-20260327;
        b=d6mYMcZ3WHMu73lAZKDSmFNhgdoQmvR/fsuNGVOGmfih3N+KqASdFTIbfUgWC/EG5k
         1W2gZSZxW1QFOvafveNNXUnYSj6m1L3ad9f2T49zjVzna0MlV2CL/vc84bOwJ+UyqCZJ
         y0AjC/8Eu5iHtJHuR4Peu4mvfpk+A3eEvH028HKtytAYz20sGG7/5Fr1iUkET6kkMyAC
         BG7TfpvRGthVF0Q+GydUvUnEK/EsfNwmxonkYSg+9MxvWyQu5L+o6AbALJmXC8pVdLUd
         9ZjepKJHVuh2GIbm1QrdCXcIDIfekiWL/vXE9Pm9KUbF48F04PeDk5IXp3fl0RsTxQHf
         hHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
        fh=8DxXpLZx/qH9eNp1npEH8BgAS1PfONJAgG8Iapan1gI=;
        b=jsIU0rrYD7fNTO2SEPqD78UiAKfiAmMT7SDxCZXqyP9fLdiZvEO0FAsBUUvOxOoRpx
         pG36bJsfpylHDDzuxx05WyHO5LWg7t2ZHDXF7lRbXtZXkrxRSs2iQJrNUGWdQSeShHN6
         8kts+48blHtjzIRt3XAwfB5B/mw3L5NgDN3PqYjKAFMgqNi1rLYPGcsTK1VHyHBy/E5d
         /pHBqmGdnAlnQtwOtcjhyED/AdnrXd6kQbJHA86uTgGqcg0akuLkcNVbS4+DuySObK1/
         qvufZ08+QyKCT+Ku0wwP44FNosUL56sjR4oXu+cT7xba+haTgzo6weSX+l7t98LGRnAB
         Rpsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628042; x=1794232842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
        b=sqAIi+u2ogK6jCFX9j76dArnOThd5X0GCkPk+9VoPxB/STC2ao3yNQSapJ/76uyvZF
         UQeJMLj3OjZQ6jYb3yKYpQYBgapfOVjbaeH6XWMUdukR6YyyOJiZarpmEibYav80QQel
         ARzb1zBdJX680p6g7SYIcqKej0UMKNcuV/AzvXi9sTPGi/DS+5e8TNR91gHolVHyQs08
         0pb9QRYTbtnS9lHSmz2/j9UIRd0UCpD0n6qnEqh4x5brTozZCvk/gpLraes7Ilzx05Qt
         g2ZPufDM/NVNfGkokXFUysAeDG9pH92EnlHodWhDjFX58izRV8iTvo18CdxRQeNzpMZ6
         WV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628042; x=1794232842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
        b=WaAuIOQYeFd7ehlfjfPSW8w43AgrJuZym7chzn/VrdDnWXps+rWeHUOnjGogI2p223
         oYnUFjNLXok+ZJgca0Dt6Xj0Z9XiMe0ci3cBHphuQRFE9nO/eFinsZPxeXJQohc2+q2G
         ztfnBuRThFlJh5ho41ma6yGBazqNIfcVh1mjtwaCEzQDyYqBJhjIDKEy1nJGi8PEfNmc
         nDnQBjRuZwec27vmZvTU+mQ+CGeN6INBKz1v4/Z1UED0NmzgjN5jxL01lCf9qWjFpkep
         9Yjjx8c+dztPT933Th7kK7xReVtHnSIIhQF9N/0hUDUz2V1cUrxvW8FkVZQKa+aAv9mu
         azOg==
X-Forwarded-Encrypted: i=1; AKwUvBy/7J0AAyzyxdLmm5qpL7pEd8Kw/yUtjmmpjq1mmqO4h8JQ96xaG82gv2c1xmy4WZIeS90V/l+CqPJ4jCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tcu/EXJFWQHiAUHvsDSxWxdlByVaj54p8wt0haUUNvr3osaDi
	2cQLjbKnuw7wXe0KAPonjO5EZrhPZg56KVauNkjoQy6Xx3JF3yRWZ6pthc4++xs7/Sn6nNfue+W
	xP9/Zo1u5JxRULKKkZyLnzsj3CyqF1+4=
X-Gm-Gg: AYBFou32di5s8nsw2MjRdJiX9MEyMT7s0a8XlUO7wPz5/qPdni66TY4mLHqYE/4ZDIr
	XLz7Lb6Dq/ZuL4qOsLmxFqMFmzok2poTYrOE6/j5ePHM16xTGpr2Ua8eWRERwhgKrBhE5HIHcjT
	3EHx1JVRckAL/t+OH3EN6mabZ3dV25/7xt5JgBWrrEnbdJHCzghJi8pXovNTcriWNuQcw4aShGI
	DxextRFi980cG2KZL3KPiYCcLfgGhAp1KAamzfrG1TTS145Ue7R4mlpp5Bj95xpIOE68IrS6Y+B
	uPWklgR867QyH4q5+dE1O40CrV0NG3aGvcVLHfJ3OZ47yd2BQ+5aSCf9B9jyRD2EMvUqAgZrGZt
	0jVKAvGTgDRBgPL2dHJBYIHl9ZFj827Q8Cagbdj+MCoEzM4QysV37mZu7po4A/vQ5L2OpYQ==
X-Received: by 2002:a17:906:9f87:b0:c33:9fab:5f61 with SMTP id
 a640c23a62f3a-c4ca7a80dfcmr888696766b.29.1793628041476; Mon, 02 Nov 2026
 06:00:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-2-koray.fra@gmail.com>
In-Reply-To: <20261101015551.786044-2-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 2 Nov 2026 15:00:29 +0100
X-Gm-Features: AclHuK8C6KXo0yGTK4G9AdpXOF6ch7dlD0GPHOdparCBMVqSIwGLvVGFGi1BG64
Message-ID: <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com> wro=
te:
>
> Add provenance time (ptime), indicating the time when a file or
> directory was created. This is user-settable via file_setattr() and
> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
>
> The semantics of when to preserve this new timestamp are the same as
> mtime, the idea being that there is a correspondence like this:
>
> ctime <-> btime
> mtime <-> ptime
>
> so every operation (copying, moving, ...) that currently preserves mtime
> should also preserve ptime.
>
> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
> allow ptime to be used with the file_setattr()/file_getattr() syscalls.
>
> [ This is a re-implementation of the initial patch[1] by Sean Smith
>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick J.
>   Wong <djwong@kernel.org> of using file_setattr() instead of updating
>   utimensat() ]
>
> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmai=
l.com
> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
>  fs/stat.c                 |  2 ++
>  include/linux/fileattr.h  |  5 +++++
>  include/linux/stat.h      |  1 +
>  include/uapi/linux/fs.h   |  8 +++++++-
>  include/uapi/linux/stat.h |  7 ++++++-
>  6 files changed, 52 insertions(+), 4 deletions(-)
>
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 833e03810b24..c0645cb22bf3 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
>  static void fileattr_to_file_attr(const struct file_kattr *fa,
>                                   struct file_attr *fattr)
>  {
> -       __u32 mask =3D FS_XFLAGS_MASK;
> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>
>         memset(fattr, 0, sizeof(struct file_attr));
>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct file_k=
attr *fa,
>         fattr->fa_nextents =3D fa->fsx_nextents;
>         fattr->fa_projid =3D fa->fsx_projid;
>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
>  }
>
>  /**
> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
>  static int file_attr_to_fileattr(const struct file_attr *fattr,
>                                  struct file_kattr *fa)
>  {
> -       __u64 mask =3D FS_XFLAGS_MASK;
> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;

That is not the correct way to extend this API.
This fixed mask was added as a placeholder for
"We intend to add support for more xflags to selective filesystems":
https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73il@gma=
il.com/

Please see this POC patch for filesystems to publish their supported
xflags mask:
https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73il@gma=
il.com/

This will allow callers of file_getattr() to know if the filesystem
supports ptime
without trying to set it and failing.

Thanks,
Amir.
