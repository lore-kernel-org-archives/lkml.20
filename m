Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3244F30E8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614871; cv=none; b=jFtutGl4IVYFFAoHOFB4FKuxD2RRwEM3fQYcXVvywooKYh57nhz6OGOY4Ch7Bm9rXwBBLOIjC9uhzX3pKtk0KWJ7Chokhy6aaxvQyEnvSKfSLXQ5psOAtJV2AseG5bIQzrxg7gW2/R3GP/xYu44YHgTdDWGN5sR1xhQPUOMEKvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614871; c=relaxed/simple;
	bh=ySAFrXK5MJebKLUCNnYUxwzKmDPTTUZoYnhxcVAAOWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDHBsu5SCKv8oiLgE+hw+rSDN698Mijn3utje8jLhr11NcaizIzn/b1asoMZHpGmtrm54Aqd1b+vYw+di9GVMQ4gTbjccIllxOoF2nFA+4C6nGe+dm8EYLQ0C2vXCFn8e1KcolaQCEZkQ0W8d/hj+n8lHOPlGrJdSDpoIANIke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963a787c9so1161911e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614869; x=1791219669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=duVRFtW40fAmBrIcIBAV/xrW8Vqp7gcMK77vMmwGnyw=;
        b=1iPru8QdHvWEHKkiAQRvG7rCZjB17omemVpdIIBpu+JSXHHMvn6qaS4j+WI7sU9nK5
         Hu0ggv2OB3MBoPtxy4a9ZjL6YWpf1RzDv+eZ3jbrCwH7/9ziyGjqgIRyEOFUTRe2opon
         4Luk+gIhSOHJ9Mq0uVygOI9GV3d+HAPgif9gmi0L+xDUlwZqycMGOQaZSN9EhaWtreGW
         REInCt90cTWYU/XmZ0N6SarR80c9X+W2m/SZzeqA0VbikNMq9EynbHZewv1CfLscJJ7d
         WAzYdWEh+DEF/21bHJxDajJCoax31dAVKLxLTDfi+DqvNP/MQlPfqB//EwQo85+LSkht
         09JA==
X-Forwarded-Encrypted: i=1; AKwUvByR98aMUWDIqnQWzLmpuGlsWNMUckEgKRtQ5TZkkUwLzjwwD5TesZ2CXCG5D2MPN3DBpa6yd57HRo7y9Co=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO4iURUY6d8qIMaYF3f82m+HexFTRHwJBJt0jngN5hifHwY189
	XyG+lMuZFgGtuc4Vrd//8lHx6NrYUjKiT2/f3/wfjTGsFGtHxQI8nvp9dAAgysUUFcs=
X-Gm-Gg: AYBFou39bTBhehXpdnmYqB5Ua+XhKLcygVVcmt+eDYphVLAg0j/bBEM1Ez++Qza+fAu
	AB3FIqhuesddCpuwXTbMh0d+dTXra5GX1GNxzdXRAQ/iFN2lTUz9/VNl/EGF+mZ/SQFzU41yL90
	XrUvOrU8DbkLL4hIpGpgcdpZG6X5jxc2hMgB6weuIkGF3aAAsg6CTAdVWZeGUN7q/JoexrSsgG/
	x0foRBcc/dFB2qP12cQAOKePpA+hU7ZgNAX1yhk6dgHsL7Z1qHxAZWitXZ4hoHF2BublTdCFIhY
	dEJhm/nNNRcUEFG2BPFPOtP1qfroqu/EFYfN7azA8vIdm3dYdqSVCyvpur4HI5MLUkTDzTzTGh0
	VTWGLN0UXsVylGhaNYmGIHHIwijIA9IOkMwvRe3oHNJixYGOLDThhh8XPjTWHN8F5eVeeNO/8N/
	6dHbRQrC4SJc7gl6jE8OjXXih8qnyAQk3mvi7dXeEgSQ5Z47WZ7e7Jv11C5Y5/NMmuDeKm9X+CN
	Y2uqZe+y6kK4+v70ttJ8yYjUi0vwOihyQzH1A==
X-Received: by 2002:a05:6122:4f81:b0:5bc:42be:f758 with SMTP id 71dfb90a1353d-5cb08074792mr4838518e0c.3.1790614868046;
        Mon, 28 Sep 2026 10:01:08 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d1d23f8dc2sm135137e0c.6.2026.09.28.10.01.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:01:07 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988b3761477so187528241.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:01:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1QnBr6RBwUwgdG8uQpyWq65nsDzE6A5VQpvTuuYduY2kKdxndexDNR9KCYxpSs2cX7aAnQPF8gGZuAVI=@vger.kernel.org
X-Received: by 2002:a05:6102:1627:b0:7b3:67d6:4d7f with SMTP id
 ada2fe7eead31-7b367d65363mr1528582137.17.1790614866101; Mon, 28 Sep 2026
 10:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927191359.6144-1-kmehltretter@gmail.com> <d4f35d5001924ef9ff4b28ac412a9d4b6048d789.camel@physik.fu-berlin.de>
 <CAMuHMdVRznzGdRwZOHa3=cxhoDNBh1kJqGUoBHqowgj_nzKCRg@mail.gmail.com> <ed4f818f00df446df53a9168054bee1a9a993409.camel@physik.fu-berlin.de>
In-Reply-To: <ed4f818f00df446df53a9168054bee1a9a993409.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 19:00:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=amt+3ej6+i5TMaO6VUKJt3qqYvSWctFtSt8Tttrk2g@mail.gmail.com>
X-Gm-Features: AclHuK_mE9VxPUVV-lu6iBsW9hr2zre4AZtKTRqpfURzADLjuYTstkf8GGZ2Z-A
Message-ID: <CAMuHMdW=amt+3ej6+i5TMaO6VUKJt3qqYvSWctFtSt8Tttrk2g@mail.gmail.com>
Subject: Re: [PATCH] sh: intc: sort the prio and sense lists after filling them
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Mon, 28 Sept 2026 at 18:46, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Mon, 2026-09-28 at 18:03 +0200, Geert Uytterhoeven wrote:
> > On Mon, 28 Sept 2026 at 17:10, John Paul Adrian Glaubitz
> > <glaubitz@physik.fu-berlin.de> wrote:
> > > => usb reset; fatload usb 0:1 0x89000000 uImage-7.3.0.gz ; pmb ; bootm
> > > (Re)start USB...
> > > USB0:   scanning bus 0 for devices... 2 USB Device(s) found
> > >        scanning usb for storage devices... 1 Storage Device(s) found
> > > reading uImage-7.3.0.gz
> > > 3649306 bytes read in 2074 ms (1.7 MiB/s)
> > > ## Booting kernel from Legacy Image at 89000000 ...
> > >    Image Name:   Linux-7.3.0-rc5-00001-g8cd915e93
> > >    Image Type:   SuperH Linux Kernel Image (gzip compressed)
> > >    Data Size:    3649242 Bytes = 3.5 MiB
> > >    Load Address: 8c010000
> > >    Entry Point:  8c011000
> > >    Verifying Checksum ... OK
> > >    Uncompressing Kernel Image ... OK
> > >
> > > I also never understood why the load address I used at the u-boot prompt
> > > differed from the one that the uImage build process showed at the end of
> > > the kernel build:
> > >
> > >   GZIP    arch/sh/boot/vmlinux.bin.gz
> > >   UIMAGE  arch/sh/boot/uImage.gz
> > > Image Name:   Linux-7.3.0-rc5-00002-g02d53450e
> > > Created:      Mon Sep 28 14:56:15 2026
> > > Image Type:   SuperH Linux Kernel Image (gzip compressed)
> > > Data Size:    3649249 Bytes = 3563.72 KiB = 3.48 MiB
> > > Load Address: 8c010000
> > > Entry Point:  8c011000
> > >   Image arch/sh/boot/uImage is ready
> > >
> > > Any idea?
> >
> > 0x89000000 is the address where you load the uImage.
> > 0x8c010000 is the address where the unpacked kernel image will be
> > stored.
> >
> > The latter comes from your kernel config:
> >
> >     arch/sh/boot/Makefile:UIMAGE_LOADADDR = $(KERNEL_LOAD)
> >     arch/sh/boot/Makefile:UIMAGE_ENTRYADDR = $(KERNEL_ENTRY)
> >
> > It's similar on ARM platforms that (still) use uImage.
>
> The thing is that it stopped working after 6.5.0 and I never figured
> out why. I did test all kinds of changes and it just never worked
> again while pre 6.5.0 kernels work just fine.

Have you tried to bisect it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
