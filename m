Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914021;
	b=TRPGMS2FfSNLcl0OBiB8qoErsszThbLOvk+OQRGv9a3UGf6x3qbpoqiq1YJScAeiYSNv
	 +CDYKFdxF7hywmsJCb4ZDPcetCiQNF9O7a7CgRA0NhiPAHobifIjbSyQZu8iSk90VpxUp
	 cRxGdPhbb/SIqvDIfWAa6i2iJFyGNb2T2jAmWc50qOrarL4MMKNCV32zjASmqapMRG4tM
	 C3gpFs5/auwIUL1KSWoAe0HDFM5ZBnX6PDhqloyfAz9hnXaQjZ89EDQdYXZ8n1qcU1NN6
	 KvO0+yidkAGOBzXvASh8tDSz651uH1T/I1WfuJMIdVHkw1tqWykNDMBB7t/GGUnt0Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914021;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=cvFYVydmQCNuG61XmmYr+sAquJ4kRd4CpcFPkVmXEeM=;
	b=mp+Fu/MGC/OVKliUhTOc/4Rx4wQb2zQ3q7JUbeOL2okJYUbYES5k1Mpi4wvWPwCEmMSk
	 VoarXDZb3zcsrA6fFDDyeHiHfZQ2DTOSgU2nTGAmPDQ5OwZnd8rTUyMnxAvYkCIjKn1N7
	 +WwDERCZJRJmwCzOb5TdFt76JJq10s2haw5XBqfAJY1At1iK275rNJ+SArpiLsmpHMPbP
	 NODz/sRMjW/9XaU3qZo4PDE2A5OEJq4WM1KLTBw9rtmn3tJ4TzjBLbeW9/0qrB5mIvnX1
	 c5Z7bwGOKSsPkc03/vFJKgHc2EAvhkBRIIIBXc0N/VNkfPqsyFnBsqon/5JW8YssECg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2937606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2937606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc81984fceso1507507137.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914019; x=1795518819;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cvFYVydmQCNuG61XmmYr+sAquJ4kRd4CpcFPkVmXEeM=;
        b=C/EeYRSziT6n7MIE3sP7OcpUWeWV86HkYdJw5Bt4tMJI6DpJ55wTqAEAi7QfWBkY74
         qOqQOnt++JzHjSQm7ldB0q0YUjJkwleIGX62SZ4i8S2aIMLMJjjoT75y/4K+mZ1Kdrij
         EZT6crTg657LFJYvC/96gaw1+pv9eT6aOJQWELOV721se3jtc7A8SBOF+uC38zF7ARWA
         YjAE2Sk+H6VblryWm3AkjjdvUolJGX2xwKBjzcRTR5Y0j6cSE+YO32hboFRevL2U4rnR
         zUT7ioU0w3LwqmAo3hhh0KOReK9dNetxaMtSiE6SKS5CqSys1kVOatrzqFR/418OKnhn
         BDvQ==
X-Forwarded-Encrypted: i=1; AL+hErGgYZXrILWfFnDgXwIzxl+Xxc5S8tLPgyXdKVPs0Z68qikBU+hw8h0jfTHMwOqg3GsrIqHIfoBM8Skq+Qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NzLBlsegYm22g3YyRb43aAFXuljqJJyppc+Diim54sslVgitI
	vrbgjiNylrTcv4wQyXjZ4ccDab/38fuHDAgmxsK/JIBgNSixwsh3pYEmgfmWDcHs
X-Gm-Gg: AYBFou3lesy+/N9FR9Y4ujWw3wcFnl5rrnArzNoDPp3Ckko5JN7RAJMBezFCF3ZN6T9
	QdE1z7YQqFPruMCZgwqUfBmJn60QcGYcwblId9tVSX1/KYS/qGyYAIXUNgWFzfIDhNYKc87OhxZ
	ezgrlBcoH5GWYRpE/Z7THnre+9o1/GOwi3m/qrzJCFlKICVgaHLJ18k8kVALMXg4mTWqTaI3ZGa
	VK9FcdoTWTPLpg1rF3h5nYl6Esq2YsIc2/WGLS1VRBWaCsSnqOCSHtgwagkYgWHSrqXryoVyzOR
	mMPTF8G2HQzOyMkYCUvpcmfOJg1+ZDWE9/mK1YIACGoQfq4Dp677LjlGv2iAjPQI180Ys3Z/09K
	Mu5egGfzBgS0x6sz4ix9wgey2kKY0tlJ0zl0KnljuIjC6IW9sGt2QP3fKzXjipBA6kiROIY79po
	GssFt9iLPBvDiE4R99r7lrBLL2g8yu9IPz+9aNUQRSg8hx74JLDNISzjfKgmiaQbKYZBaArDY8r
	lUMKg+QatUzB+5Z349kTuZD2Il7Yf0bk6iOWxbZR5LPoDsHtoVIVHqshOjvipqOEXdra+a55K+0
	JEV1+bncIMm65NXUaSqVfVGm3HNWkMbsiMYMJkCDDibzQCuRRtNU5X/5f6CimPeRWxA=
X-Received: by 2002:a05:6102:4455:b0:7c3:2b19:6266 with SMTP id ada2fe7eead31-7d64d7e8a03mr2287490137.22.1794914019529;
        Tue, 17 Nov 2026 03:13:39 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e02d340sm2153339137.8.2026.11.17.03.13.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:13:39 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99e0db26c4bso594236241.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:13:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG6phqRUlMolEmSUWnkIml9EYOrRCmlWXLUPWKQqazn5QXuN3v0LXHKTruEhiHudYCWaCLf2fYhutXNjnI=@vger.kernel.org
X-Received: by 2002:a67:e112:0:b0:7cc:2cef:b341 with SMTP id
 ada2fe7eead31-7d64d482ff3mr2913593137.4.1794914018867; Tue, 17 Nov 2026
 03:13:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112133210.3004176-1-arnd@kernel.org>
In-Reply-To: <20261112133210.3004176-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 12:13:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUL1X9ZsXNiqCew40hCT4c5GyvG3CkOzt+jidZvVAUoQQ@mail.gmail.com>
X-Gm-Features: Aa3M54pZEi7hoEPcYj_x7DNHC7Dh3oAPfO1LjOxVJlXMmy5auKREB8le1SS7INw
Message-ID: <CAMuHMdUL1X9ZsXNiqCew40hCT4c5GyvG3CkOzt+jidZvVAUoQQ@mail.gmail.com>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: add power sequencing dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney@redhat.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Xuyang Dong <dongxuyang@eswincomputing.com>, Drew Fustini <fustini@kernel.org>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, Guodong Xu <guodong.xu@linux.dev>, 
	Joakim Zhang <joakim.zhang@cixtech.com>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Sven Peter <sven@kernel.org>, 
	=?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Robert Marko <robert.marko@sartura.hr>, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 12 Nov 2026 at 15:14, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The dependency on CONFIG_POWER_SEQUENCING is ignored when
> ARCH_RZG2L is enabled, and this can lead to a build failure
> when power sequencing is in a loadable module but the
> reset driver is built-in:
>
> drivers/reset/reset-rzg2l-usbphy-ctrl.o: in function `rzg2l_usbphy_ctrl_suspend':
> reset-rzg2l-usbphy-ctrl.c:(.text+0x21c): undefined reference to `pwrseq_disable'
>
> Change the dependency to always depend on the power sequencing
> interface.
>
> Fixes: 5ca65d048910 ("reset: rzg2l-usbphy-ctrl: Add RZ/G3L support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch, which is now commit eac3b292a26e2210
("reset: rzg2l-usbphy-ctrl: add power sequencing dependency") in
reset/reset/next.

This breaks USB on e.g. RZ/Five when POWER_SEQUENCING is not
enabled (e.g. rzfive_defconfig in renesas-devel), as supplier
/soc/usbphy-ctrl@11c40000/regulator-vbus no longer has a driver.
I guess the same issue can be seen on other RZ/G2L variants.

Reverting this commit fixes the issue.

> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -279,7 +279,8 @@ config RESET_RASPBERRYPI
>
>  config RESET_RZG2L_USBPHY_CTRL
>         tristate "Renesas RZ/G2L USBPHY control driver"
> -       depends on ARCH_RZG2L || (COMPILE_TEST && POWER_SEQUENCING)

AFAIU, the power sequencing part is optional, and only needed on
RZ/G3L (SYSC_R9A08G046 selects POWER_SEQUENCING).
The fact that compile-testing required POWER_SEQUENCING before was
already a red flag...

> +       depends on ARCH_RZG2L || COMPILE_TEST
> +       depends on POWER_SEQUENCING

"depends on POWER_SEQUENCING || !POWER_SEQUENCING"?

I have sent a fix
https://lore.kernel.org/0b1c87b3173a789f6227f13658e4befdac8e47e0.1794913893.git.geert+renesas@glider.be

>         select MFD_SYSCON
>         help
>           Support for USBPHY Control found on RZ/G2L family. It mainly

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
