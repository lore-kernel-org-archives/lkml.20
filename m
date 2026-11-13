Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564237;
	b=Bh/aBA1njXERVmMK3r/XhBC/zpVq6tecdCLI2hwg90h4bicHhbFv5ftGR/AZIjc9BItM
	 yC3w+w1FmqD+7ls9ZRV8bQJqfto0ypAffTfNyYf7mBsuqPoJVfY7ZXAOcIuP9rTqer22H
	 KuUdtsgJVmjiAOWiXPS3yqJUqZG7LMcUpsr5XcJRFdLgT0d8isYv4t3oT3GOU1LAKQjBD
	 H6R54GoV85XtYcTSFznkCcGhJzWbROANdCymRQj0KB1le8l+DQg29j4Gl3YowxCu8JZ+q
	 MRNfNP9XlReaEj6Jm7bPshoC0dyTWAYB3K9U+cmbHmYM5s/MpsfiS7b3mZqmLAIMI1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
	b=DBsH3F1hwGAgPC8b9aiEww3CrXgEicuAqTYqTCfu8kTHuz3wVcLd5bMCrQkr6+9xQRY5
	 SMNc84kE7/m5Yo2uw/nLYcGDJjgw+tIZYp9NhfUnyCzupWucN2qECzfQ7GeuvHd4pAjUv
	 Ip8J8Rvzsuug6RjbBZsGyrw+rAsLX3bsySiyLRIL43TE6jMurKQy5dn+B8CRO5P0lPG4d
	 9tjskgRKsdkqHFbr4wgvz6lKYu+HBKht2eBQHpTTuQy7atr8gU50Fs4Td6Z1TFNSs9olc
	 ivAOarUsH37o0mtDcUuSvo31yY0X7si8jwVtaabG6sUYZGQ2ZSqg6FgoDNljOA63YYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HmOhZp1a;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F3E606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F3E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HmOhZp1a
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so1238364a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564235; x=1795169035; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=HmOhZp1aysVRSGcApaAZDLI81xyeSldeu7ePLUPKkH54FsFfnK+QDVFY4+VQQZDD5I
         H2HloBZm5LZmO+0yz1W9rfEhaL+YICMUwpLNmuFaGXNfAv5LYB2fsAN36refSeHGX9fO
         cryYVQ+kM2KCw8u+OcP3112ltvgpCHGvfl9d9GfdLtqmNcwNDmKz3KTPAT46qO03zj8M
         uuWZNkUaGTWe7Ooua9eiEAKQiiHx3qf0rn/l3lNWMOa2sfege5hzg+R5XNTSj8AN0bpY
         dCBAZCrR4vjcQdomnF2hzC3FA98LaruL1WYTiCQ1DC9kzlEXZqoLyeQdM7U6VrMRD1VV
         Lr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564235; x=1795169035;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=ehugvG60+GVQyveqoeiEObZ7o0HRa485KX+MPhKbxBqKMcdyPLxssJ1tlTpmRvsN8o
         oC3quLA66iBgWjpIvn/DMADsK7hOScZ8AAKg8AhZEG2/+2aPMqeEglJXU2s5KzehuP7P
         HFOjG8haMQ1xUQWgWf1hDwqTltWoC90RTacYhUMhEn5AFMqYcUc1AZGNO8+Kr7ybZKT5
         gVyb3LYtMlbo/nVjx+Wh2NC084c0JU1e5VimNsyNFf98TjqINwOHhnVQEtaaLUIbr1Cw
         MOWXVSD9kNgvuiq/pRGw/7GxWAdnGQLXzHb4hUDLCY79yJ4KPjdhFP6EIL09Gsp3uKHN
         gDtw==
X-Forwarded-Encrypted: i=1; AL+hErHCS6BaqaYc5D/lCvaVE4DXBNleB0RZVFy+wUQHD/EdXddTW8srRzvK9taQTLmWQ80y39Fcdp2USVXLVwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sFBzGZ3KpuKAz9NPyfjF8jAWFyGP0RdIW1kPuyBncxM38p6oe
	yQPNAm2jEL2mPpmp0lsKlrtZtejamUmp+tnmTWy5kBd2LCjgaWuj05jj/NHBsHFmgWbt
X-Gm-Gg: AYBFou0hBmaRVwcGnB85Z+rPdlcPBfLtis+xwrAkoSD6+uTwRD+Bwa+mTUIEVfO5n+w
	eh97XcGpAXbYdDdudsfXN9w8uRJbmZ9Ry1FkXjR5QnJtwxMQdDWfer0d+izSFXWUDn/A/is18AL
	tHZnaJHuJ1VSU3g3Le5GZey0ofRHITU9HlZgbl5PFyBAAFtr/RfkIUlSH/Znj3XgyEYPPcVjAAu
	K5AG5WIksIm/bZhUrpnGCsewndAIWHIC9rF+G61U9nrNWUaARFbw+Awc7uSendrlXYfYVZclw2+
	zB9o1jvneA2GbaFEdwEK5wc7yuHefdufknigZSme0DYjjbvnl5j40C2DVs6OaJwqHyM3YPqq3hP
	guaDbJor/EeH1HaAM00U+/n/AY5BHCRVHN2anU8lmHH5b912XCXQoMGyS8+hpQHmrzif4hW8rLT
	VvHZUwsEHv1ZWV9eiQS1Fldf1Q2P2dMztSd5hlQy3KQGnPsV8crSPBinGqW2hmcSAEbh8SRVsvg
	+4lkzzlZhz09McbBtKQO36isYmIQxrXd2JQCZhrR1g3/1CdBt+cAFuCHc/yCEY5JKH6obE3fClI
	QwHTk0BxTJ+jmCUZuCLjg62fAR5isn4Krq9+CwtHum9Oe57MUPltYjcAo5BG3fo=
X-Received: by 2002:aa7:d556:0:b0:6b5:96e9:ae97 with SMTP id 4fb4d7f45d1cf-6b7c0ccaafdmr1234919a12.34.1794564235160;
        Fri, 13 Nov 2026 02:03:55 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm766458a12.9.2026.11.13.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:54 -0800 (PST)
Message-ID: <16dbddeb5cbb9613dc806b43fc681eb26aa3b0dd.camel@amutable.com>
Subject: Re: [PATCH RFC 10/41] nullfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:52 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
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
> Initialize nullfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/nullfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/nullfs.c b/fs/nullfs.c
> index 319c2f5c5a67..2fe24cb97160 100644
> --- a/fs/nullfs.c
> +++ b/fs/nullfs.c
> @@ -2,6 +2,7 @@
> =C2=A0/* Copyright (c) 2026 Christian Brauner <brauner@kernel.org> */
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/splice.h>
> =C2=A0#include <linux/uio.h>
> @@ -174,7 +175,7 @@ static int nullfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	fc->ops		=3D &nullfs_fs_context_ops;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
