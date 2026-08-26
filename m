Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5563F5BEF
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752080; cv=none; b=LZQY9nsdT39w3MmA2ghfXHNgYweZAvR1Hp0HsJwk8QiK/tmy4KRoDRm2n1QWvyY8hHWVKpJteyfrwX60WzOch7kHJ1EDr5kG3SZXqQ3vdLXUUexYDtfWOz0GI0S+DR6g9qcKPD/QNCS+xFtki2RDkriH/KypMVFLxXhOCdIBtHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752080; c=relaxed/simple;
	bh=4R80M2uSqG8aB/kf7mO/4PkvyywvIIAoS2BoNshLVNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixjZA0+WZ9q9Gg0vmfpNPMshLoPtfIj7An8/bgtqoRaKzn4VmjqOgh9kSSI8DTSnudvLl554OmfgBsc6mj1ZdI1txmcNujoUzIXD5RzmWJbLSo7j0xVjfJjw81rmpYvNzc+PUiEjuLB/t7IqNgSzbmP1YWfr6zfpBU9/3+k/oSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bf9466867cso403713e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752077; x=1788356877;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J5AEkQkjMT9TtrBnAvVUmmFOsLJwXzQTGULTsLF/WhM=;
        b=h7N+t8fxgc5CHkQsB0hcNaxcVGacYPGgjShi7rzELay+0h+9urTqa5ZLvhvIKZTpn1
         OR3Y3iIuIAWrmAcW3N/nxhkCOWQ8n4z5ev2lGS2KehcMYpmHCA7XQyYEAVrbQv52pISa
         BZdSs12F32t60Kzq9CzpEzzz8PmqfNj9fWpm7R0MWXmU2K8QrYK2EdxEZjPdik6oaQqX
         w4K9rrBP/XenWQCXQwJsIM8K75nEdjdSfyRBkWC3lKjcbfeo/tgMuSk6y00ya2c6VsuE
         ioQbaxjgd1zxP4XK7qyXQb1RLDJSvRa0/HHzlRQNcc96mTMRgn7xYwiEje/zd/n3w80D
         lS4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqqi0hjRB5GqvVQApCUSXwGFpKOxLXMO0q1nqKwn9qYB+t1AgKskbZPlPpg/+CtRCWJO+27NR4aFTJUS7E=@vger.kernel.org
X-Gm-Message-State: AFuF++kHTDELC37r1gA0agO0PGEYoG+2hDmC+qDkuUc+26SAhFB+GHNx
	4f2w+uP9ho1bsnzOTg9qptNGOFQ8bgz/DvkkPXbFxlMJXv2uvJrCcsf7AwZMdxZW3YM=
X-Gm-Gg: AR+sD11EFSKWEpC3twqZj10Rg7ZNGVpvIjCJwmnUy0YnCWQjA4lg+yYeGktVLsTjPfN
	IaCkCqm0vbJKQt2Xwt2QgTWJqEVe0mB2UGrH/D4urledF5pSyFRhOL9GZY9VweL82RSMVPckfpy
	pPNS+Fslz/ivLz7BKRo+dPjm/s7JsL+i46oPlbWjb6lhNmpY2g2ZdDMnJ6HhGmovsn6UVCSz6GE
	zqxpwMUqXoKiyfMfCUAWmE/YMSwjn5TMJfqaT7qIECu5l6+5x96Ydft/ULsGwjwiZz132cp+i3Q
	0vfnMcZZmq9Pvh62MWlMDLhweLi97j6WkbfjSTXDOFiMJmvECwlYO2zit0Bli+fkuVCqlZgLxpu
	rgSpLXy177M2qPnK/VVtZmfc1IbjRE7vU8tVc75onJr9lpqiUWmPC602wjQHr6M+ZxTHNCLXOrq
	EH9V9q8XQcpsK+KbX3roS2jN7suB7B6Cbz+FLZhujRJ+Fwa5sKzFiaUXGwlctnv7aGTXnmymkby
	SxD8FO8AEk0wyVmLbf+Lb3u3g==
X-Received: by 2002:a05:6122:3112:b0:5bf:7f98:9657 with SMTP id 71dfb90a1353d-5c65c5d0c7fmr2348277e0c.6.1787752076828;
        Wed, 26 Aug 2026 06:47:56 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c66006086bsm1490703e0c.15.2026.08.26.06.47.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:47:55 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9770fffa5a6so351138241.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roj2VySPgelGogGDX7KIE0B+Gk7QR0ZLi99gwZoOsDuN01vWJQ6h4mzDvB5n+GAANVTNInqvsLi4Y7OCrQ=@vger.kernel.org
X-Received: by 2002:a05:6102:c91:b0:778:721:53db with SMTP id
 ada2fe7eead31-782bca45c59mr1975967137.0.1787752074443; Wed, 26 Aug 2026
 06:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Aug 2026 15:47:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
X-Gm-Features: AcwNN1WNtag92uCqJjbPhiZSsO7JkAmcuVOcn1wehvKzSdLbU4TwbVG4gtD6TYg
Message-ID: <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot
 partitions read-only
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 26 Aug 2026 at 13:28, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
> from being modified through the MTD partition interface.
>
> The corresponding boot partitions on XSPI0 are already marked
> read-only.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -825,11 +825,13 @@ partitions {
>                         partition@0 {
>                                 label = "bl2-1";
>                                 reg = <0x00000000 0x00060000>;
> +                               read-only;
>                         };
>
>                         partition@60000 {
>                                 label = "fip-1";
>                                 reg = <0x00060000 0x007a0000>;
> +                               read-only;
>                         };
>
>                         partition@800000 {

Makes sense. However, what is the recommended interface to update
the bootloader in these partitions?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
