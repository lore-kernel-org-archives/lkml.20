Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093296;
	b=cpC3xqZMCttmajV6h1QMN0qwFt3gWc5EpIxQkavugWPXp9Jh1qTqWgRVg1B7y2Ki8Dis
	 1393QyyzSSO7vqapqhJmzyEBiQYrN7P92E9Vg9koqzLj+Nuq+dXYiyQjESMwnAo3/Mw7X
	 e7lC1PdI9e6/DkhmyvRKLZi0sNBmXPfJP3t5n6dZM0mwvz5lg4F2FlDgWDSoLH/vKn87s
	 NxR7HxV8q+Ds/HA5C+V6cQHbo5AW+YflOA7Nil0b2Oi0gKAKlSDEcERLBeyhBzYC45hBb
	 NimZvKFd/Bjk5dC3LQFfHXngYlt2HpvVxGNf61WMQmKvzzvHv21nujvPADnT874i87A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093296;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HdpV8/8ebIhU1zoXk4jFUfi23O/1u5Y3/kMloldzY3o=;
	b=07XSbegBNqp0N2WoDRyIy8y31gG1tloW4gWBtr/fda4BfZZGK/6HCSX0u7QC5Ed3wLAD
	 LIrswBwG5IrOC7J3SQKE2P5quasFWQuZ09aEJzZmMViQAJUc3Ac2gKJ6pjLhzG1biR6X9
	 pEsP7ss/x7ukZaMEkZGJ0q5nGy4+3ZfAIMqqUL8QYNm+hAUclDk3Ppct5FtpRqKl4r3zF
	 Yy4rBLbpF4QRQaRlXfPMueVDyt+Moku9K2Ek+RPD1CETYi6cT0Y/vvSv5yU/rp6P+JKon
	 g5Dvx5uxM/FM9Rqu2dXGlULWrq9D+4fvU7XjxRvt3QfQlcv2dfw6uh5unk75eEeAPRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUBb3Qhh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76163606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUBb3Qhh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D43D1F031E3
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093295;
	bh=HdpV8/8ebIhU1zoXk4jFUfi23O/1u5Y3/kMloldzY3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QUBb3QhhXF/1sAdgLNkyeIBkfegZ2auDCxH+GLk8G/jkRgMkdJk+HdNEifadd/lM4
	 /u05qFnd7H5zy54uBgARdMPEVVnBwYD3AgZnwGM2PNGlOpIGdcG/bUv0XvRqDbNs2f
	 umdA6Hu09Po2N/Y/rDfSTipeeX0I5PUysZx0TGpd2yWJljSsWHt7SFP3xppQHd+9av
	 KjIGKvaulGuzHFWB5UBuprDsFOvsgz9q3fr9OJzgWNs7sAvUmJ0PvvHCBMLuYQXzVY
	 gQBpDWZoIBF73dIdRGvzKdCcOL8TTsXsp27CkeS0GVB34xwMMhbY3KPnwpo9yemJv4
	 wPGNYce2LWXYA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso591206566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:28:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKIwCKkbUloIGvbH6V3GieZbApLBb5SPNYgEa65eoFXOdBImg2NoChLg3gmLyYJGOsSef1xIAHk8tFiIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfU8j2vkhN91NpUaz5CfEZbjDjbpzP6K506o6LoQhA1OxSXn5Y
	ktGnV25aOw7IfVFQV0BMqzlX+RSX82gGFDkeJ65GNPTru4JuFanDfv9f71X/4v50DpZK/LKCU0o
	NY95ZdcUUC7tErf0OLB0YoHx6fKUPGf4=
X-Received: by 2002:a17:907:9711:b0:c2e:8eb7:53dd with SMTP id
 a640c23a62f3a-c46bde23c36mr970710666b.42.1793093293725; Tue, 27 Oct 2026
 02:28:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026125541.87507-1-dar1knessx@gmail.com>
In-Reply-To: <20261026125541.87507-1-dar1knessx@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 18:28:00 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-NkB-fDPN-tCLbcFOfbGLQoVE7RSPwYvpZ-BX5mEBxYA@mail.gmail.com>
X-Gm-Features: AclHuK-9hOq04acXPgcCfbFyvdOXqJ2p-mYNoPkIXSRdIeTvt563ht1dQ3pl9tU
Message-ID: <CAKYAXd-NkB-fDPN-tCLbcFOfbGLQoVE7RSPwYvpZ-BX5mEBxYA@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: use the resolved share path for the share root
To: Denis Kulikov <dar1knessx@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, Steve French <stfrench@microsoft.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 9:56=E2=80=AFPM Denis Kulikov <dar1knessx@gmail.com=
> wrote:
>
> If the share path is a mount point and crossmnt is not set (crossmnt =3D =
no,
> or ksmbd-tools that predate the option), the share root looks empty to
> clients: QUERY_DIRECTORY on it returns only "." and "..". Files created
> in the root go to the mounted filesystem, but a directory query cannot
> find them afterwards, so e.g. "rm" of a file that was just uploaded
> fails with STATUS_NO_SUCH_FILE.
>
> An empty name refers to the share root. For it, ksmbd_vfs_path_lookup()
> looks up share_conf->path again starting from its parent, and the mount
> on the last component is not followed, which gives the directory covered
> by the mount. All other names are looked up relative to
> share_conf->vfs_path, which was resolved through the mount when the
> share was set up.
>
> share_conf->vfs_path already refers to the share root, so return a
> reference to it instead of looking the path up again.
>
> Fixes: 74d7970febf7 ("ksmbd: fix racy issue from using ->d_parent and ->d=
_name")
> Signed-off-by: Denis Kulikov <dar1knessx@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!
