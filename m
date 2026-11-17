Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904088;
	b=4i2gcYQFO+o/KeP57nlB1fx4jqWOIi1pHqrTzG/4VnB46+FVzFrxQrod8KgM4QhNh17y
	 fxOPR/U8lzofTiTMDCtaS3kbnc5tqpGsKBh8YcWHIhqC19YBmaGTDXZmQRvFirOkgEPkI
	 BcI0WGxgTdc4gZ0DUDhGPN/EPSEsmqahPwW4B86wSBqUPk9luwRbwkzD6n4NGUcv4JNB1
	 kMjTcYHq6XP0Mp4rzFufcuppFDF7LArrgOBC0f9aiGQoSfsY63/daXnVJ4hE09gwwDZmC
	 xq6kD2ktLcnw4bohSPF2yD9TL6887IhoGfhRi1t+bEqULGX00Xa6g0gBro6R9tbtquA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
	b=UtzRgLDoYWYCbbu+4Tt78YEY2tXi/YP8awUTE4wOifZmrO/I4xn98ctYKci/wGBSk0n9
	 iKa1VDZhIcKNsLTMrJGmLTtqLpks2OquAeMbH4o5Dizopd4wislKBZZ5XfDeODGnJuQgb
	 i68ORZZ0/zN7F+gh0jlGbXTPogJvNHWVNbA3s1U54eRDWlp1kfZqRiEn2IMdnd64y/Exi
	 +5bJcIL3f42NRCGzZnom6vaXBl4B9yUEOcnp2nz+eM1HW50vPEoZMqnFBY1Tv80u5KVnI
	 WVSZJEyyli+vv00lcmbaZs77eBI6o6AdBqs4zVnabD2160RXxwENPximp+bKxpp5qgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G5kPAzk6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ECC606A884
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15ECC606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G5kPAzk6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso26232735e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904086; x=1795508886; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=G5kPAzk6YKyHaocuCdT5IFslrUJH5/ldhNVhV6xYWUthrOIppv7Y8kBtZdevqAkpzI
         BDRFsu2jrF+YCozPia7EV1j3KLeZC6Lnc8BgBdPYFaePytvbOESC0m4eRkryqhoEbPxE
         WM5n2Fa2IGRg+WkSIkgfyoTemIrDdEbfzZV+2Eacmamzzj+t+HuCPRqV+GPswkKxuMa/
         2fm9UdrHUV6v7jtlgmqycAcrxGUcSbURHcUFMMj9LS/XjgTFJtp8hDDDARovdS596Fjm
         xwkar34XXNuYsLWY+RNo1AZ45FE/L69efZRvwjPbSAF3CGRgr3AaMHZz6Kf/cz8pCVs/
         RhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904086; x=1795508886;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=Z4DViwXAoeo2mZ6XsySu+z8HmVcZH1E2g5sT8w+KmSMtQGRRiJ2cpbNjxaJpomrtqg
         cHVAFsOP2HRlliV+OUQX1Mfne568RFHp4OdJcdIbSBg/DWX96KOdXKPt/BUWSxb1s4PV
         JqgRnpTAcyh8tBkyJ/5M8yu7ce2Hh+DSRQH4O14pnkS4jyU+mKwKvQFIedUzGoidtJ8s
         Uti4QjEapUnlWX3ttDuFM2BXVUItXm1IwRUdaSKjP9qU9oKX0IZraT8yFBEUBZRTm3Bn
         x7IOEHS3nDBaaO4H5gVfOMRy12Jyzdzm98ho+6kim+3Mp+S7GVHQ6r/a5+6yZqZ54j9e
         pJ+Q==
X-Forwarded-Encrypted: i=1; AL+hErGeQKjGPlkF9rLTEY6yn+YY31qmjV6LR0KZC7rHLCtnu+0XWiF6dy6Gr2ExEW942SxRcWsQ0c29QD50qY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oimgqPbc/UnS4cYfQ42+pgeuVw+DnTvSSr+5NdxJERlgi5Nel
	myvAWt/ht5u0ym5CC4WlyDbeMBVSCiG+qX4g3Eqj90SWI/tNyLJgL/hy/2FFEgUujhvb
X-Gm-Gg: AYBFou22lwiyLyg0J+XmVrueaImZ29t/f+BjWJlrnfyY+wpc+NrP7QiN81VErXF+jUY
	lrBDbXn7gqF8nDZhGAL9mgWpin198uRUumRoHqJRnIHRUQh0vEB8tGlisyN4gJFoWCIGbvTlpr1
	LyD/eiFDKGzSk6TmdzI+HnHNNioRaMzHicX8OhLIjlM6Vsd7DOOYJ9411mnzKuBmDaizHOWpDjl
	fEYGLP1c97ky8jw6ax+h59nW1WAYv8Cb21C8DjDf4z/xfmrHn0eu6r1FtQJ5Fv22+b2/Zr364ro
	rvNd4rpLoXJYvu5q1Z8wVFrhiRExYEiPqaILzJggYybsQKYstki7v/yjra733j8B4qWKPgZh3Fo
	ZzzvTyWOJJviKZ4bvZGeBHoEtBIF08hFy4gk8MHyKiLEOpH1wE2iBIHHgJ80ShTLYfLaOXF3hFx
	tHVpbkPCgNKUd9zvIxLVBI6Ajjpa2SPVUmleDEVAd7Ep5gkEw6iRZmAqe9NRItg6XUJzEiC8Rfh
	y69GWVJ8ScYBDrPp+Z+//e93TTCddIo88mfF4k3gj0G4CuzOHGtVBprAIF7OLTyKJctDqz3LgvT
	uGKRM7M6ndVHhA7BWmYwKvAzL7BKfq0pLIf0Ex/2UiH77812ra2df2L7hhK8IHZhpYtCH+Ux5lG
	2bcA4YVUwQcjFGqnnTgVrv/FegGF3Exv52kNlGc3lqNxNHSx/pCvD1724
X-Received: by 2002:a05:600c:512:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr209766355e9.19.1794904086313;
        Tue, 17 Nov 2026 00:28:06 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm74782845e9.8.2026.11.17.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:05 -0800 (PST)
Message-ID: <fa0ce0f7ecdbe91cc6773bcbe86be137d2129944.camel@amutable.com>
Subject: Re: [PATCH RFC v3 21/44] nfsd: use fc_init_pseudo()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Chuck Lever	 <cel@kernel.org>, Chris Down
 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:04 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize the nfsd filesystem as a pseudo filesystem. This raises
> SB_I_PSEUDO and also SB_I_NOEXEC and SB_I_NODEV. It never holds
> executables or device nodes.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/nfsd/nfsctl.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index f32311f2d7cf9..ce2666deddbd9 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/ctype.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0
> =C2=A0#include <linux/sunrpc/cache.h>
> =C2=A0#include <linux/sunrpc/svcsock.h>
> @@ -1375,6 +1376,7 @@ static int nfsd_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &nfsd_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
