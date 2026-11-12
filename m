Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473239;
	b=QkejbCCvUKp9f3Q90XtMiKzIGXKFMHgtBq6nrq3G3qVmukpSTZp44+N9Ldr7yiDjWyge
	 J/VXhVMC4mPnzkhfywrzCMRhCw4PJUv9DPxAcbHl3vGW/RQvgfvgMnTiUZwsZzBrUNeeI
	 I/Vjd1oOcGzfLOj7JY7NxJ2h1lqx+naBsSr5jZBOYxuGUtoAQYLcSGkJbTIt/7Q3YaKAu
	 Q9AGDVdteNbx68oTpjiphyxsROdA/2f5IGcu2nV4lKnsB6WBhpWCOElW+ZJRF0jMSlY+U
	 1juPfaKr7lyH4igAPOIy0qjO8Or0V2iSg28iopI0Fpa6P7dlYJq4XR4aExBPVWIGb3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RB86biYg+BPhq88d5PdaceEbdw/e2Gm1TW0EI7mBLjg=;
	b=CeWrQjZNQsYCBJl6TdPAL3c08ppxmYWe+X67BR2aOoT7zxihKequSoes15pCfGCKmyxC
	 /miYFSVqcoPAxkAmyMuOSEZPq75/Lj6naHcBZWDRrxCyMoOirXKcGIVOQV7sUYORkOwE7
	 y685pH2sG1I89A3Oot2BsBWhbB2RBHXEnj1sFpF23xy2tap3vHKE4KD0J5iJ4y68Zu5Z9
	 0H4VKUtUga+uRT9nRJid4pN62mjaalsXiftc80qEnqXUB4r3DVWEmTw8fIFfUW2oVqWci
	 kRb1F17ch3Oy2bnISgn8hpA/6NWtZMIfSXapMt+jFzzmZZeMX5B+DPtKWmGQ63ClAvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxIOdRQr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F75606A8B4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F75606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxIOdRQr
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso4794687a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794473237; cv=none;
        d=google.com; s=arc-20260327;
        b=m510bwQSRviKPcC1A6hx+q3Yr9fqGBOASl09nTDhfbU+H6pLrJHW9SFUiYhP3O9umX
         xSGL0cHoAtofohugtDh+JYdT6DAPTPOnIRzTJvJIgOufco+azcVn5j3fbBz9t5Gh7NFL
         vtfLaHsUyQBsXOpz/61uq350XbyFT0ry4VgjiEtWk2YH+00zBkk4W6WIvwhhv7WttAKL
         Lf8oFRqUXsQWEcGvdALJQ4IPGSbOW82iPXDPYLXSPVFHRXOvVtCckQkKGMVWqKycUtBe
         LenUzOF4ztZcoJZwIf0sqbmCAspY/9aXOvk7+7IuMWkP1LvKvs9CUQJD+HJWKHEL2SDa
         DKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RB86biYg+BPhq88d5PdaceEbdw/e2Gm1TW0EI7mBLjg=;
        fh=z4/falK+tM4Ohclfm9ysLIHIb3PhYmpxF6WrEoonuGc=;
        b=j0rBvEGsHuwQjCBpZzWCObY+/hB8JrY6mR/2zvGaqoiV0ioBZUkMhaB0m19rUMGLKk
         9w6aufo1M4YdXemILrZ30kKQ10vWjT+SR7URFB+s6fhdFx/gpXa5R33qLTSvSlgWfw6x
         Oa9VpS42mS7PYS32mD4QwqR0eWyYBYJ/BTueDt5ccI7bkCqS7ZO13jytS0fAbMqiK6Ol
         kRVVDalM5pNHzfqsuYZlWPt7XSOPvgYMDoUHt7abbU4pVO9ihNA/IS7kFVOc7Ol3UR7a
         g3XUknvbrykI2ZrJpEzdk22mYFgQfvbsttRqVSh1xu9ZB9A0icsWDgnUVuImgA6sRm2o
         Rb7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794473237; x=1795078037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RB86biYg+BPhq88d5PdaceEbdw/e2Gm1TW0EI7mBLjg=;
        b=gxIOdRQrGGYCVviGjxwyVeMmz6w7UXFEUKI8OQN3X4OR+FcEI9NqJN08m7fLY5oB3D
         ZchtKa23lEZZ1jsx8tgTdAzLAls+qRVKLe3KI8Y0LPWSiDRQv401NlBslerNSTBwMv7T
         nuhV0+FyrZFvQYvR61NBtLXUK/oTqHUiId/+algf5iPAoNK2hM8t7ZVLdPwQ81aybg0e
         IfosV53elz8kF42nVZGGAMxLgwcntqqBx8O5VT9x6TWi69+0k5qxx3j0xl14Icjpjj3X
         ENqaL69x+MRgzWQs8gNfVmvXZ0fV2WALM24AQyHocAl0ZUsHRKZeqFx7vdEbMKciAkcE
         n1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473237; x=1795078037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RB86biYg+BPhq88d5PdaceEbdw/e2Gm1TW0EI7mBLjg=;
        b=ttFVUR48uL58bKVufTqD5gi8jdQwm4AOMngSgGewULSBj4IsQdjf3m+zACkhejEOLr
         OSzSCtX19ZPvvuzf2z/SM1M2L5qp21VAEVUR7bK6Jz/8zZAjFQhhgz4lSU8YX7NRb7TQ
         ChrkI0cOF7TxmKra7K18JBxM9AbpXOomQ4dFOHWRbr0d01cxFWaiZyyXENncH3SMDY7d
         uCjUhoVrjdJC4UhdWxPgEwicH4R2ACwMHdk0w9BKOHaMfStyPrUmEV4dxEl/zWnIMLca
         C8sgcKC7Kl5hedAXvOTRJpdM3RzX/AhPrQEPKT0xfpnekpUSOQnewpVuJmhCdJseSbSI
         uLRg==
X-Forwarded-Encrypted: i=1; AL+hErHy9Y5LgJzn5smSzSj+c7TkAKNEl1oZaRqSdc7zFVcPtSFP4R28Ph5EduC9iK7+5w8+ZLmWE3FVqNNN6eM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yFFsKlUn8Us6Ehzr+D3roAQAQ/7bRhrEQtG0cX1OJxHRA8pM9
	4XvKKLhLvhzvLTnV5vjqCnyySCXd3Q/gQsipFMvFtvL5pIW351zL8IZJvdUFkte22gxtBXVKTz8
	U7udJGUdkw9oeKGUBOFhRNm4yCDaEfoU=
X-Gm-Gg: AYBFou1gPixcIlqu39d8O5KRcm6N7ZTvNMYAJts83fibQelzy1yQK05Oiih2DkIy9my
	APastlT1uIiJn93X1hCcGbsd3wdafF0af7nMlcfpGyXbaE4ricbAaI4z7v7H0b8C1Vi+ze3OzQj
	Bl02LIrbY39qIGy5cc6QQgGCeDmQZDFsobZZ3Zeg7LzqMhNa1o4T4x7MKJ9X41emMtsj1tJq+/X
	obAihg8OfNcew5eGFo5uSoe33INgr/ZXfWP+K7YzSjbPLYWc9j3oUYL0/kU8NNRL6frwbAHDNec
	N+RZKA5Aip92Qcus5CkakgnImmJ8pDccGivXxpr8i5H0F1vND6rawJ71V5Liwcq4w0KidPzG4dB
	/i3H9PSb+tZLFzc5hakJhgdMk6OIfvUZw+6tqvowB6GnYrept6JvI3ZoVy12UEa3NL2t1+Q==
X-Received: by 2002:a05:6402:22d0:b0:6b5:7ac2:b4b2 with SMTP id
 4fb4d7f45d1cf-6b7773eddb5mr3024443a12.15.1794473237126; Thu, 12 Nov 2026
 00:47:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-vgacon-ioremap-null-v1-1-6dd05bf390ef@gmail.com>
In-Reply-To: <20261111-vgacon-ioremap-null-v1-1-6dd05bf390ef@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 12 Nov 2026 09:47:05 +0100
X-Gm-Features: AclHuK_fa-iP9Xeaq-QANT8HT3vhxni1COHVSdMAf4Lytq6Fso_wKtQBPBFi4S0
Message-ID: <CA+=Fv5SHTC9XWQJZY7DnZbpMPnk3b7eYNiiH6Dnii+eLJo9YgA@mail.gmail.com>
Subject: Re: [PATCH] vgacon: Fall back to the dummy console if mapping VGA
 memory fails
To: Matt Turner <mattst88@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Nov 12, 2026 at 1:30=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Alpha, setup_arch() registers vgacon whenever CONFIG_VGA_CONSOLE is
> enabled. On Marvel (EV7) systems whose SRM console is serial, no VGA
> hose is set, so marvel_ioremap() finds no hose for 0xb8000 and returns
> NULL. vgacon_startup() then probes video memory through that NULL
> pointer and oopses in console_init():
>
>   Unable to handle kernel paging request at virtual address 0000000000000=
000
>   pc is at vgacon_startup+0x174/0x910
>
> VGA_MAP_MEM() is ioremap() on Alpha and powerpc and can fail. Treat
> failure like a failed probe and fall back to the dummy console. If a
> VGA card is present, locate_and_init_vga() still switches to vgacon
> once PCI is up.
>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  drivers/video/console/vgacon.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgaco=
n.c
> index e7e6750f1f87..09f7c376b468 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -324,6 +324,8 @@ static const char *vgacon_startup(void)
>         }
>
>         vga_vram_base =3D VGA_MAP_MEM(vga_vram_base, vga_vram_size);
> +       if (!vga_vram_base)
> +               goto no_vga;
>         vga_vram_end =3D vga_vram_base + vga_vram_size;
>
>         /*
>
> ---
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
> change-id: 20261111-vgacon-ioremap-null-ad4c7184b807
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>
>

Nice fix! this must have been lingering here for a long time?
Cross-builds passed for generic Alpha, including Marvel. The shared
vgacon code also compiled successfully for x86-64.

Alpha QEMU fault injection confirmed the early dummy fallback and
successful VGA takeover when only the first mapping fails. Without
your check, the injected NULL mapping faults.

Forcing the later mapping to fail too exposes a separate takeover
issue: the console core installs vgacon despite the failed mapping,
leading to a NULL dereference. I don't see that as blocking this fix:
finding the VGA hose normally resolves the mapping failure on Marvel.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
