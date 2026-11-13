Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564808;
	b=FzYRbXa9kDXG+HgobM7HlJTi+p9I/YklUungC+EwLqFanfOs4ZF7N3FC8PsWqX/GysuE
	 Tkodwctg427l6oAcjbWDFN1GpSSWjxQHAsmjb40ZoYgJyZAWYpt56osMDPHlmNPXAxnhs
	 Jd0VLRAFRo+RWtrxwS78DT8uS6xqi7FkLR5ywcwoFg60sv/g5/KmgbaQg7o2/OuVfyeII
	 Y9+N1tLlyZ8sEPkXx8+JtfqoFVXGTGf1myi/ESQ6qQgaualcaAIcDp2Ty2yGPIkQd0s/O
	 reVozqhj4r0C6eKuCCd1oZHqWLC048QTJ9DsLsQlOXB+V43F1amGClPKmkjyLKfgelA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
	b=Vf0CB20c9b0IS8BYuu0B6LlefhEWm6Wjp2Vc1xJk5bdB3rRp41TubhuxyqFSiqJZORR3
	 1MxfjY2jVHTByi6nDpRDGTMAGBPYTEK5lHlfKMJBerd2eczdO5v9xTMWpU/Xvp6Do6FEp
	 vTl67UbAc/WEqo76BkWralUOBp1wWkleDbBHKPprbu9qeNY1mgdZDTZCh9Awhl7BBWGfC
	 M+huGa5MTm4Dm4sUxQQD67VuzkZWAorkt4FV8465IPOwV5DWUVCKrb2AqdB0lyUuHmNLE
	 EvFWJRFyOgBam7p616JL1GRU2rMS37StnUIWW+gLhGbsIjbPh5EqihvxQocGmdteEpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rqBNEWhe;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EFD606B117
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02EFD606B117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rqBNEWhe
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13721235e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564806; x=1795169606; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=rqBNEWhefqtER2dpEJNVPTElbe19fVdkNyIzbVbNULqUnWk9JP4TtodfrAxZg35Ufq
         +ciPTMXXDC3Fn73QdDq1nxL10hoZ0LEMTSuk+HTluWLCH3mNQBpp5ecm/W/Lr1PQghIv
         NQThaRjLVubmwKFzY9W4H2pkvpw752j1vTd8XwcKuq70wsUgwzLrChjclsxLFe4j6CXh
         P2+zI4RYwkyiSmtYnxi7mmM5Yw0kfqLENKBervoD5JNkytp6QIULxp+qmuf3k5WOFN+d
         HC6ACfaHkSpUVoBZwd9XYoAangfmrtxV8FymQjjH9iY0qoozDauX1oxEdXhYxV5zTWYW
         c/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564806; x=1795169606;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=srrKrqbKfhzY7TVPuPilhoaXRszWMMNQQGmr/Y/YAkK4f3Wkq3dSe7ig26YmSOviyu
         /xOoefQ6kAMoZglveEFbc5hnGH2/7p8VtSFB6u/s3aiZEwXoWR0O37miGFiMEoDVpGAd
         jmLzYTZc7HFgNZrMKmc5BHbxLkOoROXwl2nODZt8o8wpjV58TqY9QjwzTLDAT3GW1hPW
         jB7r6ojWVjHd15qrOGzpf4SzvEXpgOaeR3867QBXwd8jvEqoc54D5e5qSn2MnQ83yRge
         mtHKBNkQHeC2K6AbTiAEoDDlYVgwKo8MrD+wjzKd4AQfoajVb1HufQBZyPPqouTHPyfs
         +UQQ==
X-Forwarded-Encrypted: i=1; AL+hErEdH2SFzLX7bSNbfwHFdRVlnATYI1XmakbfvVjxvsKy3ixrjWOrEflDUTlQ8qK2n1l4LQkiX1Qn+dY1Ikw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/afJKbEFqx6Iyl2KXl6T0g7Wz9D0kOYhsT9S4nma3zoay8Pl6J
	Ijfk8pMH/Jy0HrhgUcMA3NlOfelEFgiyitqR8ZhymVNTVhy/4qZdSMM3eFxoBifZqBOP
X-Gm-Gg: AYBFou2/txgW4r9CzKGVQ0TWnYRHzNiIolOiSNeOivZ3JWf5RDbiWxshGSEn84e45hi
	/2zKw2U5cMyKnYCMyEUu7Rizhz0LQuqTXht+Rd5d7XRCSlmf/IjjxUruiWBfCnKyQrO3n8FW69x
	bTL6H587hSk6xmsRB1YccRURtVkPry6l+DdMJzECYhiL2/wBRGGiMFFHkLkHiFHgkyB8DJy6Q7Y
	sRMJtucUnq2xCZUUw963mHQkBHdB0iilyGBTffXoBt3ro8sTf4TkpU9Uezbbd/8mJvHfcPSAu9j
	ga1FF2lEqIU5ZpsU2NhEmiU+3r1pSfcoLoFbUkt48gHfKU1BnTpZhXSYbB6eQPy8H+P/4KD2qyu
	1mUg1lGzgFu+msEZwoLyr5GH0uEFS184ro0clbKjUzD0WX3gpHg8EDLUN/CxiBRTYK09Z86GtLf
	S40aqOIhVqC2691bQanh593AOamXcB8CM9fVBm/g375fXRQoigZ76LBqHy/vRTC2wmJ9OVoN/IT
	wGuKnXAkB8TLzRlCgn3gX9kTxd+la7mBlTIWH7M8vz5FEBGb/9OxX4bnlAkmuP1PAu8BSoCw2Zp
	jUaHEnONJvbgeOk2p6q0GK37ODf5GGaHoleLUE7sUJ4y6PLlRzM60/j6hvp0nF8=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr43583035e9.2.1794564806374;
        Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm4362275f8f.49.2026.11.13.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Message-ID: <23edc29c421f5d4c1103004f79e104e9f94d42c2.camel@amutable.com>
Subject: Re: [PATCH RFC 23/41] fuse: use fc_init_pseudo() for fusectl
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
Date: Fri, 13 Nov 2026 11:13:24 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
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
> Initialize fusectl as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. fusectl never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/fuse/control.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> index 21ffde596d61..4497362e7df0 100644
> --- a/fs/fuse/control.c
> +++ b/fs/fuse/control.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0
> =C2=A0#define FUSE_CTL_SUPER_MAGIC 0x65735543
> @@ -334,6 +335,7 @@ static const struct fs_context_operations
> fuse_ctl_context_ops =3D {
> =C2=A0
> =C2=A0static int fuse_ctl_init_fs_context(struct fs_context *fsc)
> =C2=A0{
> +	fc_init_pseudo(fsc);
> =C2=A0	fsc->ops =3D &fuse_ctl_context_ops;
> =C2=A0	return 0;
> =C2=A0}
