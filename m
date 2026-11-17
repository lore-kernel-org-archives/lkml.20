Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904032;
	b=2lNGevPtJIkyfj2ptB7xQRpQ3Iz23Bn9jCOp2c17h+PILzj9qo7F32JKW4BJN9T3aIvU
	 mh76LavR6yncFT2571y4hYTvW4JjunWNphPQfxXKE8QTsBNbwZCWtjqS2qA5cCFp+Gy0C
	 bZGRqeGHfT8cld3z/fpnG2paVrv7sSiobOTUMK3WZgMWqBulTK2aRDimng0YEae8GYVoe
	 kmI5mFsKsaVaFe0rGrmE+cNbp7DZNkCpaquQkR/SN2ibGlHpy76J8TXgKykM9/aBCUfZM
	 zJlaKLJnU1MXPyfRYCTr0N6SmazBJW/V+Xlz3DY5qqybY7oHxt7qzrm4FY7j7z6tkOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
	b=TufmHiKzXOQ0iPzlLrGuYNMjIdWa2bCi5njhYhmxihLG1OLlg2aFjr1WAjn4c+ieIJcP
	 J7+RNM/jCQf3pTp5jb4m7mLHLYhSCxaD/UpDyGmt2ihzjIMq/37LOhl2pCJElFwv0oWkL
	 hiiqBgwCEaX5SM8CENwy8KYYX7+60n78/HEhm4zsbEsb6KlKCKEt5g9f54xI7ONNfxX3n
	 APMMNjwj8nEwHNkmIoa13TkmFL3MoGvBQNBK0fF4wzy1v3TWIjHZDnjMBji0lRyz4yRrY
	 EPFux3hOPLypYhf1vqUTYmba4ADvCXMTr4CUrGGJzpKJssEQeG5QEsaMLYxZWUIhy4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m3Y+iV2p;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2739606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2739606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m3Y+iV2p
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so38964015e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904030; x=1795508830; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=m3Y+iV2pelmutPYORVxza4CHQMpjq7iS5lmecWgDjvax6Coso4uWa+KMaCm+CB3bWY
         yM9xDjlaUDqClL2wfFs+3EgMKFX4Q8fuLgup7VSVEO3iDYFOyh4nyeN0Shri07+KD82b
         UFGbuWvBELdRnXkiKa1GIWjPRb4Wz8WRQUErt4eMboeCaxWHABbQwTZk6BuPw2NopAXW
         5935wwOL0Ggt8LD7VeJmtmL6iC6DgtiD4S4DRbEtkaj1swNFS1XEbe90cWaNyokAE8Lz
         Ulc1c4G0eNVUIpLzTdbViN3HgCOMoyHpu6hnCIZ+utcpbQY02w1kBKtCyN8iaUfGq6tI
         6sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904030; x=1795508830;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=hFXt47g2D/hJb5d/V3k+tFjJHYVHtKOFJuUdDhmtfTdToe6HmaX6eIgy5vKyEm2ZMa
         o0daJT9fM5HKK2qrSj01kmk4qO9oucwKXbAuQb+BasffXLQVV0CIWLAEfsmMTh3e1sz5
         D4oblqtVJjkPg1WoGknoNiw4d6Dk7n+DU6ZhAm/YFe7A7wpxwhuagTVZHjhGG+O6ZsuN
         5dnsaZ16RjQLpPu8LecfB5d13qZilIZZ/9STvEmheNrQspOPOulO/y7gQOaSzlNeCjHz
         PDTMMRAI+lHlzGomjesll6PtYes4ulY0eGF5KCtPnGKxEyD7kX32J9pxQyNx3K3FvvMX
         XVVA==
X-Forwarded-Encrypted: i=1; AL+hErHRaKeilbQFLeWDsiNtKn6zJ+B0bua9oSR5zvLaQbmEcPyAL8qBDGkT64JQEIcctg9wWcFHZKfbAb2oVnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PyYjlf1Xxyfj6aYA7t/6L7XlUAsye6w2bqeNjsDx3uX0EaOz4
	tyY5RBwvEST9Z5hBGFcDFSLrbUoraKRp07AZJcKpoXt9aXNF6z/JE/0gUmMBBFbLApjZ
X-Gm-Gg: AYBFou1/h+46wweCU6hC8qyUfiEuR3vd5IqT8rJszS+UkXPN8L8S2azCxZTSTQA8n8i
	176FJvA2RbBUIqMaebBH3ctrY4V7ru7U2TR2YPITIcPFujaP75kemaPBhaxDJqD6u0lCpfi202Y
	kx8nEifpE5iDQb26Qa+jZZuTKCtJR+ngOKJIiCsDhAY1xk71hS9F5SRwDiWnOkRuNeljSh7iLnl
	nlUjSqMejEa8+LI01opjRIJ++N/si0YCREcvOoCNN8TepfpDyTFJ5/45ouw7htmTetMncFW6Bl1
	6x+ulLjenPHfZuZdQJK+oOQqY0RWiu1X6r+BJeDKkr9nYmDHdljFVoAdh9RJXY/VJU1e7Afy6/e
	6q9TxaIDkxGd7ZO/unHCEAd0HW7S07/2QwFVwSKK8VlLWP2QJlQWBtKU4d28a6MVUI9LVP+td3g
	qdRoASTc0s3fcOj6t8aJZ9VxkGQyv+fXPan7c7233rOZinL6yPYmGtOd98AY/aX8VPw3jy2z28i
	J8udm3oFsDYuytE8YPsVq5Q4pFfwQjxoKpPriSBkfZJMJ3Fq1cCnP1UldtpRrj3aa8S6hozbHsg
	989R/5J/PFmkY8jCPAowtkRBRKbsFoN7nxhP01wpcaRZdx24WV4aD4lZu1wF0dUzzH+wgr9kghz
	EW4cC7neZuQPu0s1XEdzKUzbW4vM+nh3pirmTYt9yn8yrQjrRgJ+ngLbk
X-Received: by 2002:a05:600c:3494:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb6c71c232mr134135095e9.6.1794904030378;
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7838c912sm45730155e9.4.2026.11.17.00.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Message-ID: <0ec7b8c90cc456b24e5b19c1db673d497ae43735.camel@amutable.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:27:08 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
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
> Initialize binderfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/android/binder/rust_binderfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/android/binder/rust_binderfs.c
> b/drivers/android/binder/rust_binderfs.c
> index 5f020226720db..04468c5b5c116 100644
> --- a/drivers/android/binder/rust_binderfs.c
> +++ b/drivers/android/binder/rust_binderfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/compiler_types.h>
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/gfp.h>
> =C2=A0#include <linux/idr.h>
> @@ -667,7 +668,6 @@ static int binderfs_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	 * necessary and safe.
> =C2=A0	 */
> =C2=A0	sb->s_iflags &=3D ~SB_I_NODEV;
> -	sb->s_iflags |=3D SB_I_NOEXEC;
> =C2=A0	sb->s_magic =3D RUST_BINDERFS_SUPER_MAGIC;
> =C2=A0	sb->s_op =3D &binderfs_super_ops;
> =C2=A0	sb->s_time_gran =3D 1;
> @@ -759,6 +759,7 @@ static int binderfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->stats_mode =3D binderfs_stats_mode_unset;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &binderfs_fs_context_ops;
> =C2=A0
> =C2=A0	return 0;
