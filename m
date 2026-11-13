Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564206;
	b=FXtiim9A9Kk5sp5zXN8yDQ6uSuZk0h0mi0StePm06a8tIRT5aVvRWjnJqxFndG87ps6D
	 +7AiHSP3n1qvrnTlW0Rs8tqendpBGFRKqHQPIUCpFRK5Koiw46L5oKuxw2JCIe3gfh3Fr
	 17ODjEjijYK5O0hgvLRLAtrXfxWqPM4ko9tnvocJ+g2hjM9nzLN2BS7jvQ6/aRha4wntk
	 sYC1NOS8F7F2yhu1ypMbTcfy7njOyKIUZrBQeN7OPPAp6D1/c1mI1J+j8TXs6be4L+ceK
	 7+J/9ug3iNjAWB1djjQLo7Q3I3r0eYOPf+CYzos1hpz15zqU5ThoTiYGago1ebFgkFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=yP9dZgkD4P/bNBFnmHOgKVBIpz9VJZUP73dl9853V04=;
	b=ODfrk1Wqu2HlecO8uceIeuiQx4+OMXEAjoDp8bTJVUEX9ISu7PD7t573wKirsIQEgcKt
	 pXceOF0r8T2OA4T7EM5rnfRbMTPFOyk6WO7/wZ1GNEvOYkqWXVDTuow5jWnEOnMB5v90R
	 rn3liNT5zQAGcWgA5VETbncFkLRCVU1o1GaZxfZNeXawWqgZ8UtUWoQI1wrGuj3DyolXE
	 xdPSFUTkWl0OI6CRHlTWcGHAAYlz6nTJhvp35i8ghCbtWFiVIboRrt2fCbaxSSaHclCX6
	 5FmC/SmT11CESkNABNaGgXbsZNYNMdNz6lvrYY/IXROCrN3/59P1kDxTZWnKTZo0AdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gwzE4vcd;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E6760A2615
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E6760A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gwzE4vcd
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so1112850a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564204; x=1795169004; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yP9dZgkD4P/bNBFnmHOgKVBIpz9VJZUP73dl9853V04=;
        b=gwzE4vcdu75novdCBouGsk6add5G1MbU4rjoUAUKLfhHjN16JXpL3TW62te0KeNQ4h
         CFkYIh/ZmfunLC+OqOwxPpTEErLMClrM1fcYGPQemfzJ8eoNcG0IRaMTNTZVl4uFMmTY
         NY1KgETdjv8quXYbE0ixE9wDZSzgcrDYvO5KUD1dPMwQkdJqOZ2wE5l6rVs/yjm1Qi5n
         44DBR0sdjAGKBFCF4ajO9UcYXSr02RfqiQv/3Y8VdogG9ka76OpTkDSlKx1J0txrvJw5
         RvPlb1UdQfd5RzPQ+F4LJqddQeogWrPEdkR1aa5XunF4ZwrUyeTcEOKG0iN98ugSQ46P
         5SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564204; x=1795169004;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yP9dZgkD4P/bNBFnmHOgKVBIpz9VJZUP73dl9853V04=;
        b=iFAnHcJoPd3xtRbGGB7jSJXyBFrdGav5Rr+o2MnkDE0iidBUSrJmMn66jkk8AlzPCw
         TukBQMUXSBShsmuk3N/7L3yGJSiHiU8pVEpRTkJKDV1cwHs36F/Cc4RFdez1BQ8E9EXo
         pJgm+vgx6xGA6CXc1FXO0OeNxrv/Dq7odVmUsNrsOCp5zjcN5RTBPLsJldvoAfM/NQzL
         2bnPO7Kne81ERnHMWEipL4bbrcHeDAlKZJcHacVRXrauLHb3wsmu4d7jp9DCi+2dKN1T
         nZTX8eKFMsP4DfImvPQOHkpUcQT5CTcKYEQooardiWogr9DLlOUK4Ckkcpl9tg6KAUqf
         C/eg==
X-Forwarded-Encrypted: i=1; AL+hErEVt9BWitxMJLZFimUltn+NO4Pk6v4rq3gPMRkVHUC6Zl5eeu5eCDJl8Z+OvGzY4TfSa3nS6X2P88WhRjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XhjUjOHx6U/Ua2whZZJCnHWe6U6ipCxYqRJrJvrqj7NjvkXQD
	cfyfhGMYIrX+osZCcw5pbkJWomof/hWfZgG/C3JXy1Ykr0EVis06lDZl/PX1jOG7VoTJ
X-Gm-Gg: AYBFou2Yv1JS4BCkEf4FBCYqO8XAOHowAPRnvhUw6MCThMcOcjaiu2Ar7BDFWavCP18
	sX0eM8/IelqgCuSwGxPQzQ7YHKh7FgRwDtyjUjevKzSW5m2dlJTmnOrqlXpEJC/TWEwRjiY2KlL
	8RN3O9xaCKIGt7fAg14tXfE4Us1ZwkAayf/GQnR7N9a1Jl6E1oO8B1cwsJ2sBRYzb2AqIo9VmNj
	ERu8JPJAriTaUOmtYUSqWimLUXKl4J1VhAxo3qroeVxoRLKhoGRTOsJ3VqqYQnvjxHHg8jXgGce
	DCHB9HPs0/X8nKT9RVAWS/MKRwuWpMQ70fOZjXnDukUPmpjWGTK/YhgamvsWL/hPqBkKhV0P+Xo
	/0ut1gWN0RIlsH3k0ftONJ/FUt1VCqf0Z7ABhFj6BB4YcRoYurCit8BwM+/kDp4azq+yFk9wARu
	ogL+3dydNnrtzmHebFOPVZzQjX/tkIVYZQpD078pZocNS+7RDr6XAe5CM5K1uA5ezInqmJAG76Q
	yYHgfWDyDuO1ybjZpUuzOoOUxGMsXrNG4HmKvW47J7ZuO+h2BWuRkj7E3ZGr8KeyFy854owZf3i
	D08pM9FkWBBwi+tAZRPEoASZztPhHNdIvVhsXCMOZgFXSj4umBcid18O+mH3xgk=
X-Received: by 2002:a05:6402:270d:b0:6b7:d479:654a with SMTP id 4fb4d7f45d1cf-6b7d47965e6mr298323a12.36.1794564203570;
        Fri, 13 Nov 2026 02:03:23 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm752333a12.6.2026.11.13.02.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:22 -0800 (PST)
Message-ID: <e5f36cc53b733383ac1d1f1e8c03f73091595edf.camel@amutable.com>
Subject: Re: [PATCH RFC 08/41] mqueue: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:20 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-8-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-8-4c998976c6c7@kernel.org>
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
> Initialize mqueue as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0ipc/mqueue.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/ipc/mqueue.c b/ipc/mqueue.c
> index 322c3dd98c44..8bbe32d0881f 100644
> --- a/ipc/mqueue.c
> +++ b/ipc/mqueue.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/file.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/sysctl.h>
> =C2=A0#include <linux/poll.h>
> @@ -405,7 +406,6 @@ static int mqueue_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	struct inode *inode;
> =C2=A0	struct ipc_namespace *ns =3D sb->s_fs_info;
> =C2=A0
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> =C2=A0	sb->s_blocksize =3D PAGE_SIZE;
> =C2=A0	sb->s_blocksize_bits =3D PAGE_SHIFT;
> =C2=A0	sb->s_magic =3D MQUEUE_MAGIC;
> @@ -457,6 +457,7 @@ static int mqueue_init_fs_context(struct
> fs_context *fc)
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(ctx->ipc_ns->user_ns);
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &mqueue_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
