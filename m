Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547083115B8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620493; cv=none; b=X9xunantVkyx6JPuhmllKI4bJDw9hubX0fAUZNQYzMop0EfeCY+Bbwglujaxl+9EUEMjj7vrgcAwR/tnoEO1pq/lpRanQsz6xXrp+8L85eFGKVGGNrK0sP+gzSkgjSDPbT56AMBlHdoX9TIIOBusxVdCfRECsaaYRbBNFvEOyFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620493; c=relaxed/simple;
	bh=XLItMJPdAx0hBKSEVX164+vsLvrIEiEGfT05Ltl1XnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwxGYpGbou07B7v+WXP7QCzjDPi5VEard3t2oClxAm49363qY/PzzG+GNDuwiOhyo/3nmlxgfggqeCWeW+tAvtNWO98deWnd2lNp/BOT4ilcvyWjjLcWgWzmBSL8Z87sbQyV0AfxAaRM2cFK0CymqM79OFw+6+CmSxBAs9cxaqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso2903647e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620490; x=1791225290;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dao+KgMYeGslshjBh6bHUN/qsnnMh5dXTPRbot4HOPo=;
        b=U+Yv22RcajyRwUGYPYvbRanZ3qeZb/noLHZ1/FfQMdZlMh5Zi+IvAsaPEk4qt+q7iH
         S0zM6HoiUJZ6AbnQDgzw85EarUIoDRPRZa1GusmO/H3TS7WvWPMukf8MSBN2Nj4qzz0f
         Zxa47nbdJgaxY1o2za/8hBn4F/eQ9t0/8BUCQi476V3u0PfiMLysIMQQ53qdq1J7GEzB
         dvxx/tTNo3SglNTsz/SI+2NjM3GhyHiP8tQA/KHOqWZoy0GdacVj89xzlT3Oh8MjuSHH
         TM9Psydb65kZ4hTZOPibnsrIrSclUp/7S8z2G16EDgpHYH9qD4tM9VAOB4a+0BJVng40
         XRqA==
X-Forwarded-Encrypted: i=1; AKwUvByl+dYsuVuGMx4jvJvsfcf9vqA8t7EvyB8BslBGwH6SE1pCFFHcaR2sJbE5EgFZepcNNYOE84KnA8nG5P4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLILBU+hYdmXnDYCC/36saHY/g9o86FdEbA1uMSWFKjgT4azIok
	8WoOa1d/o4rXTI+2hLEdIxQRbMi+JOsE3z+Oz7dLOb9Ie2AIKV4x9lby1yQwQwcf2XU=
X-Gm-Gg: AYBFou0T0kyPLVVJkSDYwdOqZ57MWnBojE77n6FGZAwq7qr5Zz40pZq5Voq55S/zjkn
	+T80I58xdpT0+GPTQbHZB135st63iGfYKUdUqi2qSh5XwsyrCLhTYQSMY3mOkVgJ3y0qSZ2lDMy
	Da6uM2l4NLNnHHUc4hnxVevQ5mE9MBGF1feD4J44i7p8dTC5T1YG37CHR8EoiKhgbkUcLj65NJg
	bHmkJxNtuoFBFxAnTnDRktQTiBA0zkMEkISfGZfiPUQaqsKQQ/mDoTCt6TR2cf36Oz4xjV4suV8
	yjWDigFTWXqztF4xEgoeh8MkBXw2ldL3t4GbCCNI6LIuStNsIboCeG99if+JDMdHnTaLtcL737a
	cI2ybCmcl/xSdei+Mx8uJxP296uEkfvGZ4/qcKwrCwfEowoe00XGtzkodEqlF4h7ueNjLF/pKo2
	b3Y8wSpbaeD1r9LchKx03u18vClulhUqRT6JkuLYOgwVUGme3webDIJqbXqWHOMNJW0tNBo0dUM
	atAPJPm2IVlYMgWQXV5sv1kZRKjM0p0EQCKgA==
X-Received: by 2002:a05:6122:4f81:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5cb080766b9mr6886856e0c.4.1790620490094;
        Mon, 28 Sep 2026 11:34:50 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde02784b7sm9677125e0c.0.2026.09.28.11.34.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:34:49 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-988a071feabso826573241.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:34:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVFoV5hfN5naE03BYe4HDw8A6aUDWHwu34BDWlUcf0q1CoL1OKDuked5YxUbe9ePzPH8ixq4lqWYHeOcE=@vger.kernel.org
X-Received: by 2002:a05:6102:5491:b0:7af:8089:2734 with SMTP id
 ada2fe7eead31-7b79926dc9fmr1139598137.27.1790620488844; Mon, 28 Sep 2026
 11:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927191359.6144-1-kmehltretter@gmail.com> <d4f35d5001924ef9ff4b28ac412a9d4b6048d789.camel@physik.fu-berlin.de>
 <CAMuHMdVRznzGdRwZOHa3=cxhoDNBh1kJqGUoBHqowgj_nzKCRg@mail.gmail.com>
 <ed4f818f00df446df53a9168054bee1a9a993409.camel@physik.fu-berlin.de>
 <CAMuHMdW=amt+3ej6+i5TMaO6VUKJt3qqYvSWctFtSt8Tttrk2g@mail.gmail.com> <cdb4898094f152eb617ea353c0780e7fbb000659.camel@physik.fu-berlin.de>
In-Reply-To: <cdb4898094f152eb617ea353c0780e7fbb000659.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 20:34:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVw+-V5OKgRugm2Jz+S=0dOD7hi1p-U=Fzmh3piCOkE3Q@mail.gmail.com>
X-Gm-Features: AclHuK9bbUIKcZF4zgbW3tRGKzYbZJEfzpLse2uaWdPoVWd3lVPNeO1ic2feMew
Message-ID: <CAMuHMdVw+-V5OKgRugm2Jz+S=0dOD7hi1p-U=Fzmh3piCOkE3Q@mail.gmail.com>
Subject: Re: [PATCH] sh: intc: sort the prio and sense lists after filling them
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Mon, 28 Sept 2026 at 19:21, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Mon, 2026-09-28 at 19:00 +0200, Geert Uytterhoeven wrote:
> > On Mon, 28 Sept 2026 at 18:46, John Paul Adrian Glaubitz
> > <glaubitz@physik.fu-berlin.de> wrote:
> > > On Mon, 2026-09-28 at 18:03 +0200, Geert Uytterhoeven wrote:
> > > > On Mon, 28 Sept 2026 at 17:10, John Paul Adrian Glaubitz
> > > > <glaubitz@physik.fu-berlin.de> wrote:
> > > > > => usb reset; fatload usb 0:1 0x89000000 uImage-7.3.0.gz ; pmb ; bootm
> > > > > (Re)start USB...
> > > > > USB0:   scanning bus 0 for devices... 2 USB Device(s) found
> > > > >        scanning usb for storage devices... 1 Storage Device(s) found
> > > > > reading uImage-7.3.0.gz
> > > > > 3649306 bytes read in 2074 ms (1.7 MiB/s)
> > > > > ## Booting kernel from Legacy Image at 89000000 ...
> > > > >    Image Name:   Linux-7.3.0-rc5-00001-g8cd915e93
> > > > >    Image Type:   SuperH Linux Kernel Image (gzip compressed)
> > > > >    Data Size:    3649242 Bytes = 3.5 MiB
> > > > >    Load Address: 8c010000
> > > > >    Entry Point:  8c011000
> > > > >    Verifying Checksum ... OK
> > > > >    Uncompressing Kernel Image ... OK
> > > > >
> > > > > I also never understood why the load address I used at the u-boot prompt
> > > > > differed from the one that the uImage build process showed at the end of
> > > > > the kernel build:
> > > > >
> > > > >   GZIP    arch/sh/boot/vmlinux.bin.gz
> > > > >   UIMAGE  arch/sh/boot/uImage.gz
> > > > > Image Name:   Linux-7.3.0-rc5-00002-g02d53450e
> > > > > Created:      Mon Sep 28 14:56:15 2026
> > > > > Image Type:   SuperH Linux Kernel Image (gzip compressed)
> > > > > Data Size:    3649249 Bytes = 3563.72 KiB = 3.48 MiB
> > > > > Load Address: 8c010000
> > > > > Entry Point:  8c011000
> > > > >   Image arch/sh/boot/uImage is ready
> > > > >
> > > > > Any idea?
> > > >
> > > > 0x89000000 is the address where you load the uImage.
> > > > 0x8c010000 is the address where the unpacked kernel image will be
> > > > stored.
> > > >
> > > > The latter comes from your kernel config:
> > > >
> > > >     arch/sh/boot/Makefile:UIMAGE_LOADADDR = $(KERNEL_LOAD)
> > > >     arch/sh/boot/Makefile:UIMAGE_ENTRYADDR = $(KERNEL_ENTRY)
> > > >
> > > > It's similar on ARM platforms that (still) use uImage.
> > >
> > > The thing is that it stopped working after 6.5.0 and I never figured
> > > out why. I did test all kinds of changes and it just never worked
> > > again while pre 6.5.0 kernels work just fine.
> >
> > Have you tried to bisect it?
>
> Yes, I did. I did not manage to find the commit that caused it.

Perhaps a size limitation? Your kernel image is flirting with 4 MiB.
Perhaps a config issue? The safest way to preserve your config for
bisection is:

    cp .config arch/sh/configs/bisect_defconfig

and to run "make bisect_defconfig" in each bisection step.

> Maybe Karl has an idea. This image is known to work [1]:
>
> glaubitz@suse-laptop:~> file uImage-git.gz
> uImage-git.gz: u-boot legacy uImage, Linux-6.5.0-rc2, Linux/SuperH, OS Kernel Image (gzip), 4416616 bytes, Mon Jul 17 14:17:35 2023, Load Address: 0X80001000, Entry Point: 0X80002000, Header CRC:
> 0XBA69203A, Data CRC: 0XD097D603
> glaubitz@suse-laptop:~>
>
> It boots fine with:
>
> usb reset ; fatload usb 0:1 0x89000000 uImage-git.gz ; pmb ; bootm

Do you have a config for that kernel?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
