Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564840;
	b=PMYvin7MGiUVTGYdtxuJEWmLu16cZIMArQR3YVAaFiHXo+ksU+qYNAQO4rqvTQ4JIl0y
	 zNEiEADnWq5Y7jb3XAFdK2wg0eYIDhrjuKmcPreUvm03VyCjz2Zg/WXAHnkQiai0aXy+n
	 fBELDY1fJ7cKT6eDnYh26/ECM3/rV5UDPZ4rCBaX1JYK+/njF4YIuT8rNhAn7HDyLJpg/
	 Go9EfTyUdGHUq4II9CcjFnb65agVflmufa2axuv5tTX608oZgLZJDPt68XmXf9ymjWEbV
	 th8FsJmwBO6g9u39zoVu8dXJSXhTpTZUo+4JIZiyNRlcD5pA4ajNJqdamNVbN/Hgndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
	b=BaYkG8JdTpqcsnVfJm2jqfuparnuMsb0On8KPhILXb0Ye0UrXhXqJQygfSmA1M5EZEHA
	 CdS0yKnB3rvAku9Tx3qCZAGbw8L0WF984zc5jGxyJTeF4UN8Br160EXB+l9ghZhCaaof6
	 PJADAqSnUvqDMZtRYdMHjvKTvoP5uKT5s7MQqvn6OSPfzTDfnAM7Lc1wdimJ+UNWuDFTX
	 BnTUKYz70hC7A9Wl6vRobdPRBNCHKuNhl8uPo8MnAYaCmq9ct5m8VPoMgq/9JRRs6/4ni
	 MBmdQkwfEeg2dg5Ekp2yqdS9wogwSuDFSApggnPVPK3pHc7Mmqcq0s53JMaOzIjcuqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fgkfOyvU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE27606A8B0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE27606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fgkfOyvU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492690dd5daso1015555f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564839; x=1795169639; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=fgkfOyvUu8xf6W8q9zChbNscxyQBBGlOoHgKBKJ1BkQkWvPVGihrF+rRK/++Rh9GyG
         JHspcfYOBNPixo8oPKNP4HMqn4Pm5ECxNu6WadiPSEV1Ef7s5pMOTmdpp1h0qheNYCAL
         reGCPjjBuRkeLgJtvMnJj51efD/XBAnW7OBUZupe3DEOpiY9mIzToOLvbGpl9PZAiITD
         ja/hKOWfLJ2HwVqW5WbU5vpLe4u/8sEd47rKsdelsOgJDSYM8eMKS9Bg+p1Lcupp+2o7
         A8nYundFQzH4qm98PvOkGZvKdsA4h3jxn0f8A/jmsMNUP8nMz4irJ6DT1xabl6IkGIEw
         iw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564839; x=1795169639;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=AB0up07+XydWwff+FGLG4alN2JMsKjA8OM3wTGUgLxtAm4HP7AhPOXMXVkQrFj/wNp
         h7+vuIkNOgpr3epuK9TXw2EqV6nlYudrnQ0TzA+rm0NyhAMIPYQOheh/P3qhGD0+ZMRA
         9sQRI0pTZtx85lOVfzbHpC3DsxphjtYuen0yWyrxmFsOiZcTiS0k4Ktiy01K3GhTsfUG
         nrTU4JhllH4URIqfa+phSDGCuWLT/wqyZn9EfIuLW05l1K08EstNg1vXcIkIohliPsIP
         nT9NXQ+rhxFNyZOq1IQF8sY4shucm9iZLLrP0BCqxAOOKJlVbn3xA/cKtquVTZf883yT
         O0OQ==
X-Forwarded-Encrypted: i=1; AL+hErE9Ze6hFSbDirw923cgVeKMPsVSEVCUiI0mtKxhxQ4KTVmAY7A+CZxTjbkWIaO3ej8J1F5JwDVyZ7nI4nQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kTicHwEsn4qAYWFUlxWWAYoh3Hr3VbuaZMWvsiCAwu2HOedTq
	bdor1UFV/3BN1HmBHjj/dm3kCd7oK+vk0mthQsJidqgoRuPC7BrK1EsjYIc3aYID17ci
X-Gm-Gg: AYBFou0otuk73EIKX2HhSOluahMC6xgKE+WvA0m3GVm/6vBIayWRG9cZCMCT8G7IQr8
	1/F+FF/bcQ9WLEHmbwarEpiTIvCJ60xVLv6e/1ZCiawQ5obzx8lCpr0Nv7eOksRX9TSXpHk2JZK
	iC/82R1GiznpQnWd/m4EMUoEbe5uKSX8ZdltzS3iSdrYldXCUxRH66TirhMB0amt1rqj+DFddAd
	3o+UsJRyqBA83ZYpnrwQOL+xW0cs/A1y44Zi/tgr+HW1JxHvtd460a71Zx6Qkm/B0uKFsvhvHcC
	OcXvhXSQ7csO7CvPl3LgmB79xjvbm6q093Dw82wHof3XCZMigSbnQH/xmQNDFOTZpHZRQpVjRIx
	EaPWJC9waKd4tqm7cFDBXS4lfuqHHiRlBgCKe6XFxJYYGugrsDex7f2rNugt1qZ0rRdq4s9comA
	DVHtirakxv4tRwpSRPtSZKBcRyGvkUAfc7IVXiIyjgbBRVOMPeLK8i756t6pCSuW2sBzC5Nc6u3
	mPgWc9aTnZRtijJmNbjGP3CG7J9umpQUCGBJtnSZfZFCPqE+StMd8Be5TFtrI6YNvpvY5Kw949k
	BvTV17k8YBZA2YVrp3QMsLJFR3GkHeDSjDc2dBhZ8xrLljFTjowThks9imfTWDk=
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr4358101f8f.12.1794564838578;
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm190118f8f.55.2026.11.13.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Message-ID: <77855be3fb9f0e1888c6dddc56d73a1683c820f0.camel@amutable.com>
Subject: Re: [PATCH RFC 25/41] pstore: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:13:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
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

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize pstore as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. pstore never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/pstore/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
> index cf499ba72702..4658561cf90b 100644
> --- a/fs/pstore/inode.c
> +++ b/fs/pstore/inode.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/ramfs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/pstore.h>
> @@ -491,6 +492,7 @@ static int pstore_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->kmsg_bytes =3D kmsg_bytes;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &pstore_context_ops;
> =C2=A0
> =C2=A0	return 0;
