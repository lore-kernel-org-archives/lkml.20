Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904595;
	b=RNYdwAHoDQfKR6k54vl5fYSYmXGNACVe9akPJ/7ICMu4yXkS/OFz4aVKXWXITNUXRWr6
	 rvMBIJ2OXQ1189aPKenBMN+TfMKZwhbT+wMBAPdA+nLFCQmDy2UEngZYZW26GT9TJMNq+
	 w6DdjFrK1LpJ3r5ZQxAVVeA16uYLblB+2p942OZf1nFEQn6Pzd8y742rJllkMwz0AOiiS
	 K/wOuep3XsWGqH1dr29DfavN5cNUOHauwkWb69TPwrBd+wR9ADUaRwxN/srq0I2Gf2uQ/
	 PIPPVGSAMP7gQzXAuo4GPOcnbyLXnnHe9LgbE37mzcNn1aFzvUr1zGp/bY/dQF0uuzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
	b=pmCsCp6a+Sbt7xmaO77xC7ovgqkf8UkCYYJnZN2PUEo2d7rDQQAQ3P6wJfYqPxITtfee
	 M9/Ay66wyIAmXEWubejdZKQyzWnsotWinWILhrhi5f4EE7myzODwtaxglJcjPV07vueNV
	 uV1KulL9euEYGSevTu1IjUDGPJBBr0m0kWTZ8ZFk3qSQ8Z2O1eVkJxaolPq0Z45fnvVPX
	 svjTGrMHT4S7hPp91ux7LdqaXsqGAH6BY3uRgqz9d8G4ZO0QsVJPm7HVyi2B7CbWgQoDS
	 YVDiMjHAkLDsM1uywkwTIxJ4ecZuIosOtgsYeTJpficQ1oWMMtZAPv8RTz9tji+S65w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VB84C1sh;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F6606A899
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35F6606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VB84C1sh
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so39088845e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904592; x=1795509392; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=VB84C1shjSG034pSk2oK3egXlQwWjuu3VjrdbAKPawk/Twv4Yif6yhPlbROFWtMgPQ
         3tz2NQZOgPBk3fq0QRZC/paJXFCSb8aJt/mhh+A0iXMTZvR4a2C4xo37cxqDT+bS5wyK
         cFfqQ64HX4H+WtOYlqmaNWk53bLD4rVzH3Dam/22N7EldMgTIeT60YiznWNjIzN+eEJD
         Zc6kl9xoD3REW2KAU35dfm9/7zuNgWUL6hteTTxoqyJmYKiacM/NYuvwNSKHsMwzezat
         1L4qftGlpMPZouPAaee8sA2dATEpRVvU+RzrgkUS2mvSj/+KFRi5Npjbd19v9tUdsF88
         Zbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904592; x=1795509392;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=hQJryd21XUZA4saCvByI73Ot//iF6OJ96UzM3n6+FUa/XKRloKOLW1Y498/AzAUNM5
         4GMpJ8w/8e61CSKrkqYjOdUQf/2pkYf0sLT4jTXUO/8PpLIcjkmHz1BIGs5kN6b7OPLH
         Fd9B96+6pe7x84dLMxps5/d1y+hF2zACD2CGcM6oWKq7wl/jwL2/C3eOjc9ZB1r/p0Cj
         oXPWTeUH754LTxyrzi5MyvJC/V0GrKke1WfyDXdiVML82wF+kXCBSmf5WslecnKlbXj7
         CiLxlaIc3AT8TSniiadvx3ROlNJIUZy4jX3BbG1C636cKZJ2dtuLoRkUYY1gd6+fOQ2m
         Slew==
X-Forwarded-Encrypted: i=1; AL+hErFNwJar68AjctrIPl5g5/kafEQgdOtZaA9F0x94CbQe+0Y6CGPnk9+/WK2R0ovYYj/8DMnEqQEgvMEZjFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mS6YOylJ5LltQMnLIL6za7WF0QwrSo5Vz1CBwaEvI2zaVbCXS
	lBSHf3SlNF4AYPBMTRr2IRbjQ5ZQaf2FadQ3QiLxSaxtsOs0lR6hR3UQZUYizYwvz6rl
X-Gm-Gg: AYBFou27P5Z39xZFCneNqAojFYqnzRhurJueCu+mcRaabO70Ofep416c9GyKm/CnaFR
	N07HMoifcyn8lCl8lJWptpBJc3sLhEVY4HOqOwkBUbetVuKL/b3UYPaWfp60w9u0aUh442Gde7P
	hjp7qVSK4qtQukI5/TLiV2/y6qZvyv7r4QomHfejZUugo6Qoyp4Aj+LyhUC0DVuFPreJZGF8vUM
	JWyndEs5bqZXv97PgCjfNfCjHtinPAoDeeNJOOjMQJW5FWo3PLXsPCk+e5OlI2Xic9XxtojVDE/
	6Uhzy2s5aW5VpvofZ1i3S6qjHnfB2i3mozCbgiub0DOpKJGtnyNUjNZPnVsjv+OKr6J+ggCj7fb
	yUBbZ/Iwlnz00pAnibnflwasVenXvCivbQm6nxsGYrO9aKqCLj8/dbe3UWdIbjBQ5Dgnw9eAX+v
	JE4xsAWflLaNGB2euArKX9+rQJoFzCAjyJEJ6zJhf9UMA6gvyrzsKOsKaeH/Y9sY6z7VQaVpIf7
	9s4x0OYepLqupJ+Hp1ELwefcp+MPJq9rigCE6OW0C9RLmzI54Z01A7kI8mfzI6Zpv3Lof1sXVb7
	Z8vhhl+Ug+lDDN4RSHdQ0sMXMBQP9uKKqrHJw+9Yqsv1sw086WU0QDgHev3On6Gs7oOZOrBQAOS
	y3y4rABMu4Tklf6DIxHsJWdJZaO/k4Z/tBq6jn8mEZY4QzpKM3Xmp8VQH
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr266345525e9.21.1794904592167;
        Tue, 17 Nov 2026 00:36:32 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm52548565e9.12.2026.11.17.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:36:31 -0800 (PST)
Message-ID: <411502f9a4f940c223b2b88d7e19fafdce63172e.camel@amutable.com>
Subject: Re: [PATCH RFC v3 29/44] s390/hypfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:36:30 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize hypfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. hypfs never holds executables or
> device nodes.
>=20

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0arch/s390/hypfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> index 559b011e68800..8662169de477a 100644
> --- a/arch/s390/hypfs/inode.c
> +++ b/arch/s390/hypfs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/vfs.h>
> @@ -301,6 +302,7 @@ static int hypfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	sbi->gid =3D current_gid();
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sbi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &hypfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
