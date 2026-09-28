Received: from mail-ej2-f20.google.com (mail-ej2-f20.google.com [74.125.228.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB8B4E9C28
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611452; cv=none; b=UqJAf0rAro4eJ6I9RoaQEpwKaplzEvb39jnvyz/T89gyEqYreKfsqd/0D+5s00HPZUskQWVOXZ2sNuNPrWNMY29l8e4KhaF1mR7Q02uQNyvVs4GDdN1k2XXql/OfC6Y5ZyrbA6NdVUAgiV6ex9T/NW2NygFLv93DHxu3m7vORII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611452; c=relaxed/simple;
	bh=+OUWtMoUK/80tt3PXrNgtl9ROxd0swRJbu8F45E/dw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTwyIUH6uy50jjtAdDFUMfkMKRMn0rtKMw3F4YzxZCffiD3AwEe3g2njRhO5zQm49Fs4WBixTc+Oi/SiPTbFTBZjMuhCiuFOqQAuZxwPqWnvYvWcRpCOcYxajkqJd9Td0ULc1YgUxJEp35ujGGVlRBifBsV8pEo5OHQpuS5qeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej2-f20.google.com with SMTP id a640c23a62f3a-c293c683202so463237466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611448; x=1791216248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hBvDF6H9cPXn+plsHym6ckje44L2FB2HOjwEBmwuAlk=;
        b=zBTwg9Ny6Yf4r/vCm3VlaO+9RtNrGxMQFE4FwHSflBeeEdDmzJyg2SVmOpV5G7NGGK
         QnBecqQeI0nqkzifTRroeA3IloTne8RSqutu/EvuRO/LZ6nB0eJjN0TnTH+HzlWCpv79
         lrYviZ33laHPocHvCxjRzdazvjotApeivFpmjmvecl2+ToHjL1vBkdkSoIyXip64yum8
         WJTKe/EIntgDhI/n5RI8MHGjihLj8ON/Q6bzE2ROkFLO9UtBZh7wZiFRLheSpTH+iH3D
         Viinm4BVUEReTp5rtjD0W5B4H70EYuHcQhSJhYnIijePy0j5aIjJdDNq4bCgHSZj2I/V
         ccoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn+NfM1wjMXvZGFARgpkRsJHgz2/9F6qrrUvJTE6/lYJHfXhHf/8gl1At8k1L8CMJh9nkBVUivBELpmwY=@vger.kernel.org
X-Gm-Message-State: AFuF++mKW64Fne1kteLrYghNQBxWI47aa69B36Wqc/mWkh/bCXDH6xZG
	GbKGSqOH7wSajK9aV05CNDiKm8DQjbx4lMYxznoQlqW/DNJVGU67Nb0cSHYIAj0t8DE=
X-Gm-Gg: AYBFou2Xt9RhMbJ+t8+WsBYq2+l3qDIXzpxKcd6z5c5IyHA+mRezq13ib8i+iBGA+YK
	wpTk5K+h0PQPiq+2amreDgOp73K78B7vpxemY0vMBq8KvZEp/cfKykq4eDgkTTmWlYgrsngRZFu
	4LGKi6Bxbd0gN8GG4XNyw6Tsgrg70iuXpjUCyMqIWSUL340M03gb5nA7pkXido0eSRQldQcAtrZ
	I+aqBz7jG4zy3qUzynHHwk+34svPFeMT+lgnFGErCpQOi9NIO5napFYEWVcPLD7VdOC4QLoGrJq
	zGOo2bpqHYpIASwbf7QxGMHUTxpjbvlsGaQCee7GpJijQ/0irULWs0lJS2lho1+uU61ezfGIA79
	A6bXBp5Owej9VOAmJGhJRzTnB8/oliVnVzY0mywb63I3blaAURVpJAQzirMEkA8cpDp0LYDDMw9
	4bFPies7K0v2FZCqeZ6yyhrV5R6Ky07pOaXoXrCl6ywiCASDjPQQF/lLBRjqUvUuL13IHcA0/GN
	288PRCN0tmRckrGAJYLkll48w1aMDZtkwtI
X-Received: by 2002:a17:907:c00d:b0:c2d:bf0a:190 with SMTP id a640c23a62f3a-c2dbf0a0399mr519246066b.15.1790611447632;
        Mon, 28 Sep 2026 09:04:07 -0700 (PDT)
Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com. [74.125.228.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc8b71b4dsm266814266b.1.2026.09.28.09.04.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:04:07 -0700 (PDT)
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac62c88c7cso2978555a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:04:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwL8hJrNdrbNSY+WjWCRkEwBVDVmQwmDXSReRT9qxU+ly5EMDNGBPCMzJ7kzwbFYjKbcVwQHDt7R1uF3A=@vger.kernel.org
X-Received: by 2002:a05:6402:3209:b0:6aa:129a:1f70 with SMTP id
 4fb4d7f45d1cf-6aae8f768ffmr7805248a12.43.1790611446738; Mon, 28 Sep 2026
 09:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927191359.6144-1-kmehltretter@gmail.com> <d4f35d5001924ef9ff4b28ac412a9d4b6048d789.camel@physik.fu-berlin.de>
In-Reply-To: <d4f35d5001924ef9ff4b28ac412a9d4b6048d789.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:03:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRznzGdRwZOHa3=cxhoDNBh1kJqGUoBHqowgj_nzKCRg@mail.gmail.com>
X-Gm-Features: AclHuK-d8jrRoBM8kbq6kTOBOZdCkT4ExdxlaV1GF77pQxLzcRpmuQKgygoql24
Message-ID: <CAMuHMdVRznzGdRwZOHa3=cxhoDNBh1kJqGUoBHqowgj_nzKCRg@mail.gmail.com>
Subject: Re: [PATCH] sh: intc: sort the prio and sense lists after filling them
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Mon, 28 Sept 2026 at 17:10, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> => usb reset; fatload usb 0:1 0x89000000 uImage-7.3.0.gz ; pmb ; bootm
> (Re)start USB...
> USB0:   scanning bus 0 for devices... 2 USB Device(s) found
>        scanning usb for storage devices... 1 Storage Device(s) found
> reading uImage-7.3.0.gz
> 3649306 bytes read in 2074 ms (1.7 MiB/s)
> ## Booting kernel from Legacy Image at 89000000 ...
>    Image Name:   Linux-7.3.0-rc5-00001-g8cd915e93
>    Image Type:   SuperH Linux Kernel Image (gzip compressed)
>    Data Size:    3649242 Bytes = 3.5 MiB
>    Load Address: 8c010000
>    Entry Point:  8c011000
>    Verifying Checksum ... OK
>    Uncompressing Kernel Image ... OK
>
> I also never understood why the load address I used at the u-boot prompt
> differed from the one that the uImage build process showed at the end of
> the kernel build:
>
>   GZIP    arch/sh/boot/vmlinux.bin.gz
>   UIMAGE  arch/sh/boot/uImage.gz
> Image Name:   Linux-7.3.0-rc5-00002-g02d53450e
> Created:      Mon Sep 28 14:56:15 2026
> Image Type:   SuperH Linux Kernel Image (gzip compressed)
> Data Size:    3649249 Bytes = 3563.72 KiB = 3.48 MiB
> Load Address: 8c010000
> Entry Point:  8c011000
>   Image arch/sh/boot/uImage is ready
>
> Any idea?

0x89000000 is the address where you load the uImage.
0x8c010000 is the address where the unpacked kernel image will be
stored.

The latter comes from your kernel config:

    arch/sh/boot/Makefile:UIMAGE_LOADADDR = $(KERNEL_LOAD)
    arch/sh/boot/Makefile:UIMAGE_ENTRYADDR = $(KERNEL_ENTRY)

It's similar on ARM platforms that (still) use uImage.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
