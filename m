Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573510;
	b=FScI0wO+3YMEopXoYNlYtR21A1GvqDsTvRGmtWI1oajicf/+GRzZ1ZLHftVffEJGaMYe
	 kFI/qOWQPKWvx5/QtKxxyMGGWCnJgC3S2pvtkIMQyycmxftDX4byX4pNiaFIIH/cDsEH7
	 JftVMIG2OGPE4qre+zRRYWmkAu+MTEj+7oYjUXFc/f2bxJUixZv2hdTKXWKkrbPZis0Qx
	 iZTRqEy3WpYq3pw15zgfEvV5WepFJP8wVhgan8K8DQHXio7xTr5hATOTspe0OxVKmL8D+
	 Rm14sGJlHeXGlDS4Ye8hb2d3ErcuwCJ0pltb7zbr3yONDx3FvsBFlXFxE1wuH3fAnfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
	b=jkG7TykmuuD+Z55+xrhOCgvTGEPlrObZZ9e2TcKsjg7CMSf9olTxVQtlCUoU/Ipbft/M
	 65h6EP0PNSRYYISMHrd4/am5E6Blyxtq8DFE3gElSxsa9XR/Pn3bGJk6+lGxLtRxmbz5E
	 wcFRMYZwIqf+UjWLLV9SCa38DBiT8yI5nGCei94mn/qu3qVphpOkQCSTsjKINqB4O7DI+
	 MFgHADUlnscKV1t52S4T9RWRgpXnny+AVpEAiSrR0+HIJDusV5VeV8jsXWSKqP3zV9Y2x
	 n875el7+gnIKgjqG5tNyliUWHFEKeHFNcHDDIc4sfKRCKVM1c5ZZnpg65C5TPU+G/5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bz2+TnPI;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDC8606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBDC8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bz2+TnPI
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9108315e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794573508; x=1795178308; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=Bz2+TnPIApHKvsf08kyiSuJZ5AWViHONwTwuNXVAuo2u8JGXjKnEoxSd3hG/r/h3b1
         tdsUEBtaZSOWfU3+mD3LjyqvBKt9Vc6RBsvkZZTD05u5eCDGhnWto1Wbu/C0r64DVVdd
         h2TGnt6meedDH7Iwjf2Hw2JxWOY8jwAvEAcAC10FURsf5jjp4p/KJzFYjzuPwuYFNKea
         Iij0h8HoPs5opXKf2XwMBJpd5hsYSV0+BHP/DvKdCCgwNFtbeIFAwqDf2ag0NBOCbqs2
         OXWiZmXbdGCixyOlqQBMgrkFkrhg1VmbSdmvvBdeQ4Vz+QMvhYl+k9AO6FJ5UW1pg6b2
         DVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573508; x=1795178308;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=HwaTiuKaD6Zsc7Irsxn558+smKqcttK4kbHcJOS+SGXiBLT2WPMKG2izgKOzgFui37
         RQQDr0/DqVd9gLKA8/445lI4rRY2eOHZ3qSInrMa496mmqbpxtGW8eUgCYDYQEvZtf4k
         Um0STt/YAhSMnePcY6DbRR0H9lpqyfn7NGbNhPBp0Irl1xVC8YLmKzQzYldWcuVMdz8g
         e6fKt54r2IE1nHQmcImnKACIwJi4jM1iKleiwEXdWoIVg08MgKA5TyXi0wuo4vE5s+FL
         LKdbP0UYJtHFjww9Opre/oxwm9slw0PZQJy+OImt/Si8WeWUJAdtA0283rbs8vkhLYdd
         cq3g==
X-Forwarded-Encrypted: i=1; AL+hErFSyViwTg+tMETWIaZVw+BAbJ7Ki6rx4Rhi+IOd3XF4A2TTgvoLERlcE2sxFWb6sQI9GvJjgh2JmFeEI+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yyVvFYZ+bJbLs7+HXpG4J7CsLr+W6ouJ9/ty94la1ThAVnQFI
	3a2I2VfLWTVx4cuj6LCW7/dzYLWh1+3fNNC7afq3pKK3mdrMCr3t3Ap2fglPAVlxRHIv
X-Gm-Gg: AYBFou2AbRuCltgSRWjIec0hGCchsBHg/pRfLRKIfE6stJRR7hBab3l8Qt2LZko60RT
	4u1mYoX4IhkaD7FrzEGDR86fPQ0b+cRCwxi/SS1rCkAi001qyqTY1ValNv6/LJZktxoi2phTot1
	gXvrveIZpe4wgzBBpg2VnqdpdEB2kGg3c3jFLlx4B3aMs/4vyKlDt/aT/p9JhsXxJdYD4xz9zqD
	c6kqthB5bda33Bmcjuq2iIK+p8syFy0eze8zUu/8nKssgaWVIigZFfAfSVbdqf4h7iAXo4vtnKt
	xsl0wTqzOOHeukRgiozRlA1jCZrcU1gI4zl48fIYpfGxEOIfMku8wAe0b0k5siwJMe6NOE+31ne
	Faj83ImGdw4SEEimLEr+bRZqOwHCCmUdn9hi3IPZ66Ogh8HvoNVjtHfV8BlAp+uyYv8gvHg3qIf
	pkWh1VkN4pWBHEKgwbax91XWPQ1oKCs4qr/IsnNOt6KkkXXQ9oLWeMrHFzjAXZE+A3as4qkSYc0
	NMSur0r2H820GTgocNce6+8GpAt56XhgRhkABsKxQPxT4E6Z5qtC6/q+J/izHp8uMcmT+laiLKa
	cbeyCeWQEO6hmrv8o+zcZ5hoRLDrq4IrgOgpOBzcaP4V2vqs+hgE149AuNVAyno=
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb55a86fb2mr24790785e9.11.1794573508217;
        Fri, 13 Nov 2026 04:38:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm48348475e9.2.2026.11.13.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:38:27 -0800 (PST)
Message-ID: <28a33fa649dcaae2eadcc934ec49fa591ec1c283.camel@amutable.com>
Subject: Re: [PATCH RFC 20/41] apparmor: use fc_init_pseudo() for apparmorfs
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
Date: Fri, 13 Nov 2026 13:38:25 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
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
> Initialize apparmorfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. apparmorfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/apparmor/apparmorfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/apparmor/apparmorfs.c
> b/security/apparmor/apparmorfs.c
> index a99366467217..351ea3a7120e 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/rcupdate.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/poll.h>
> =C2=A0#include <linux/zstd.h>
> =C2=A0#include <linux/string.h>
> @@ -263,6 +264,7 @@ static const struct fs_context_operations
> apparmorfs_context_ops =3D {
> =C2=A0
> =C2=A0static int apparmorfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &apparmorfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
