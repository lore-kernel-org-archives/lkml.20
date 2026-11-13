Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564378;
	b=OVAPipGuwcL4U4sRrKNNkXKCWVNR702Nr3YoVO5OtdG9r5lXE+uEVmjdRp+mIFL9u1TZ
	 FTB/zS7+pUvpjjYG3oS1cHfDZybwTPl6uSSHHFD3DBmL9U+ZFXQW7ykV9QCa98o1P2ccD
	 jIHGDZqlsl0aQEm3hYH/Esxo0Te5G22AIJ58Stwc91KB4KpaM0G0O6AkmbzqHd9WrtjKy
	 Xq8sVS7HApu9+m2E6q7EaROKkI2KgDs19mCJpWJFdMxdKzBvUeDKLxTbw/PMA75EolTSB
	 0U2pJKlJ3KeaKntVaek6YoVgXjMOB+h1ofQlbQQidgbNm1GX6V+e2V6Whi7Y8gxrJ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
	b=PcgwJKEJfVJqWjRp+FPAyp9i1tygL3ctC42k1fpaYe/ASkLCxM3wyM5zlKu7tWRbFM6K
	 ZQhCGS4PL+k0iDNTl51hG6nl8RXlded6I957arpJFS1ojvDfA82+b1cMOtaVd4HAkMAuo
	 FSTqbPEMPZ5SFh2r64k9knA/RPzyZV6uLfkHsJlgL8zk9N0BjXsB0WHoD9xRrraIXJ6vk
	 FQV6cQzgmfJuNwgWvmiROw0gW6evLJnadT4IYHcOlh0OLLD8Icaws5HRsQw7/NkXAvpjD
	 0kYmUk12+NILaUFoV6CcUwG1oGfhn2hmGtSsgc7QXwtqrx18o4ApWUUrs1vtI+rDGTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WDdVkHgl;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1268606A88B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1268606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WDdVkHgl
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso1499718a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564376; x=1795169176; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=WDdVkHgloKbBDmiudlEZ3ZWe+zg0BVZ0Jxwgdy+X6nc8ZJ9FIVi7F/SYJVqBRxNf3G
         3Gnq29xgDZdSKYiYaDVmU8W0xCuGm4Eu82rb/A8U6D5iLEOgHTmlDog4vSfdCU82B9rm
         qMGycG7Kl4j8h61zt+kqUkohzwqy0DPARMdjq2hKw51hdb6jylA1cwqwSD8nreSBsEB9
         DkDXk5ueYK99P4pH+jY8EwMoZnNW6BehoecLG+1JSq6wWJXsZMYgAdKGybKKFJkxuO0p
         O8Ri4u2My3QdIqEe8fwKAquZP0382+IuLTCd4KpBNa7znuGAHwPb5rxafjOggGTtG7Td
         r9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564376; x=1795169176;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=oKzV/JWVtabO/21ER2snZDG1mO/TOBiKg8b3gm2rP4oFE5obMs9wiDasgUqXtZICRT
         oN8IXLW4ZpShQXSvdZk5bzcqMOCQSQGdyig0oK6oyRPldnVEFcY7CMpeo28LvnrhPnho
         ImAy+mj2WGsL8KYfxVHTT7+kawUhE7Mf2N1w21+LdnXvLVKxOKqAIoGm+RUDmQq5MDKL
         uLFhIy13yopcFxtoTw0ih9eyDCvvXPM0YovrSwba1yWwFkKwFl928Omud19/Fr+PYNvI
         muhzr5FiumbRe/L+g0omxsOZTNXXt3L00I+ApBscOumpSDX2fl7ny0Sa2/5IRIdu5ETs
         mAtA==
X-Forwarded-Encrypted: i=1; AL+hErF6BEFen0zLvrgOUnDySy3CXyjKYqUMPGrJHdJWB2ThZ0GPEqFCrqXkc3DFWqDwwV0Cdl3JPLZ3Qol0t3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r7EOEUOi2mtYoWtJhYK0TS5Qpa2SiK4xY+rITnTYoaUFxNdW6
	MxTQcwLGT3JgKAPZjJsbyZSZ7BP7WQBhTnVs6EWGMAa3Mfy+0XZhn0+dKuViniPhy/pI
X-Gm-Gg: AYBFou08Seplrz8/71q863g52J1XW9hEclh+QuHBddxaieqJdzx6BfDMMCk8yYF2+8P
	8SIN6x0MIFrtqIpppC4c2py9VWyDCGYNfHX7hiZm8IVFa2CF9ltC14fPOFRT5k1KcujibbWbpRf
	JuwMIeRWVXRYWPef/c5LHkCyce+gg9vFBU9ZUj5FS/ffo5R1xqTJUY0/RkJbjV1SffveYE57ef8
	ezri7EQC4mfnKwC4m07fdHJpOyhRNa/ktu2Mh2G5vfJKiXHX+RyPrpqCzwMHAU7dyEEpxD37N5V
	HNwqGYEi3ZUByD+XWB6/5Vfp3Rj9aHToaAKDcaz3+2ho1+jbthoIfigxUs74c6f+uHbXMLnQy7g
	x555GhF4UG5EpDWjezujuWZnGGYOPms6zksiWGHpSwn66P3/KTWf6lzfF6lYhdYAORICsNoL6nv
	emtv6fX5dmLAoU92OiWhYFMuCcWSzTBv+8A0JYb3JJiv2eA1yaFQNA5tDng7f/zd9iz0uGF6A/R
	/ajUL9H3wKsVIhSxFe9nHkhwfaH0o18AnYB7W7g9UTgSYToT3zdwrn7mb1Up7kg3X3sbs7ivhZi
	8V9TIbmGHXi01Gx1OBz2G6Kv+Z4LmSlyhdISXI61qiyWOMpzdP1bdira+yqhE+Q=
X-Received: by 2002:a05:6402:280d:b0:6b6:4dcd:967e with SMTP id 4fb4d7f45d1cf-6b7c0bbc394mr1685420a12.20.1794564376161;
        Fri, 13 Nov 2026 02:06:16 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm706711a12.4.2026.11.13.02.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:06:15 -0800 (PST)
Message-ID: <4dfa19dd41ec1a202182284d9617926a259288a7.camel@amutable.com>
Subject: Re: [PATCH RFC 16/41] configfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:06:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
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
> Initialize configfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. configfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/configfs/mount.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
> index d8cac1cbf3bd..60ba24e7ae2b 100644
> --- a/fs/configfs/mount.c
> +++ b/fs/configfs/mount.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> @@ -106,6 +107,7 @@ static const struct fs_context_operations
> configfs_context_ops =3D {
> =C2=A0
> =C2=A0static int configfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &configfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
