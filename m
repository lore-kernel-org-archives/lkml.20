Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004130;
	b=AzZSAIn6ee+7Q6CCq7US68NkACmp5RaPNuleWTkk+f7zpKj8zrN5iGbfMFg4mKqSVCCz
	 6qhYAHUf955IWcyyfWN1Xr7BUeV7FDtwgxLwWtzdyYAOKsQwlmX9BBWrXUGuGwODFUfsc
	 I8Decu04/r78vE6P1B49LpIyovvHxThGyt+pBc1dGBZThJT0xjKGjWgkoNJNSo1QtJ4Re
	 j/aYoVJWJJD2YfSgyUpH6SUSI5Q4HiY1dTKjWUG5ua+4sskixLmtkSTBJ9MQx+wY+AWg8
	 Y2GrYukhgYa/ZjJlz/2S8Wdt1MlcoISZcRzRfl8w+bmD90475NzFa9hx1AZu5UIoGXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004130;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=qzSDOlgy7IPmTrnuWw7M56rTWdyjH9dWqupudfVxyvk=;
	b=NOLoh9KrNlesuXGdCYIlTbVkaTEXRMzSl85wuMTpkQIFtLerf8kfEBZz9/tufgYG3mWg
	 ActSVEWkSX9kCZhiVuXWL85Ewuh0ZhMqz/yrs0NaTWTEaKditZZTkNYQnl/Hswlt7hyS6
	 nwQi+FK7UhAcpPJJTTHX2QLkMB87LEfSkbVbCyKe9+1c58UtagxgpkG6c8Em82PQuB9Rq
	 sDMyRlLlTbZ7pMofid3UxrLguOtQcC7Eqrzajyo3Bt/Ayh1jQzzgaqTkVZeiYHa0IYngz
	 Zx0XVX/EMmCeqOrdlHtO+qMaVS6J4pqigJrnZWpyZLu9pTbBx5TvYY3rfpsENfRaqpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE759606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE759606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9906c3fc88cso1166948241.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004129; x=1793608929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qzSDOlgy7IPmTrnuWw7M56rTWdyjH9dWqupudfVxyvk=;
        b=yI36k+NcRwPaU8M9Uu74gWBCiiSanKbzssixkYt8Tv5/F/25QSuEoGIW9zTXGFwpSn
         ruWPJbsAI6WhK+a6mHbc1tTIb3JE7Q5nR/9GCaobYHyvgYW4soZa0iqq+FOPFDsw19+H
         JYrHNHTtUvPPbWDThis4+79L6yMFe+GoHH/3MCCQQCijcv9DXEwVOIoHJf+SYjYYJyJT
         dz9B716M/a9aOCO4DLIonsOLz48Q3eyvGCLMdUe37W45lPS+77+ZMkCa0uF3Oss6leXH
         4Ci8b5tPaKso3MsKdgiyILKqTfkRmN/KygNtSdGR530U8rp6QWcao8L5pF9s+QvRyJwG
         ymrA==
X-Forwarded-Encrypted: i=1; AKwUvBxAPPAatkjxgc02sRS7OyJP1/O1ApuvB07E4Vr7M2B+tgePzDw6XLeTynre0/jTU4GvGQ7+/x16NsDo3Wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhVWZ+D7djT8DMT7Fa88eSS7/E0rJ4GVLvhzUTGdzVxyKtrn+D
	ElfrjHCinob1PkzECnEOdo+3DApJLlSSpDX+8hCscamGjfIz+iMryehIs3sHhpoe
X-Gm-Gg: AYBFou3QcEf4SYBVE9oydpzgFYmdYCrdbASmU/AYnt0hRemLwGe3U5oxw7YwPNJlc1o
	vUxvofSniZl7X1DVswinDH9hayKm0a4otfZyMJEx2l/PYSAIAWLCIn8wOQaYHzgEhyLP+byNIq7
	coCCsJA3n5RGJGvWTl0KJ9O3PqKkD4BFw5RxsMmSsyMbAWrC3xr4jkIiMTem62cMA0MSTSaYktb
	uw38D5RHkzhajAbSRKMIRCwmwgMi9t7Z4EF8PK4o+Hkjj4INektsQJFCLl0FUW55C3xC8F4fcUk
	xGN9dtdPPnZURqg7N0NR/Vm+iJm4Z/eQZO7qpYGmBZS8GbMlAbGO4cFAkIb7sGAGQJX1CNRtoI3
	Y+JPmyuqXE9aRBTUuW7Hdm2Wn8vuNL1E1Xi8T076gWkGtRWKMki5c66rBqjPR1WDz7JZgPAmN6w
	3YVmuHsS/2TC5jSSAkcdmQsuXE0M4oUfJEY/saDgVL75qEiNkT/+nLz0ryh0gumG3ehBtbnTLOF
	U22AFAuyH9fq7Cu2j1wgf7tUMQGYqnowDalVLRwpgJ9tQ19aGPG2vvkj6Lca4l+fFHjm7Knd9+6
	cOFufQ5DEbP2CW0+aA==
X-Received: by 2002:a05:6102:6ce:b0:7a0:eb10:79b5 with SMTP id ada2fe7eead31-7ce5cca862emr2715922137.10.1793004128887;
        Mon, 26 Oct 2026 01:42:08 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e1bd10esm6842429137.6.2026.10.26.01.42.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:42:08 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9906c3fc88cso1166945241.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcitafzG0p+GZ2L25x2XCfWNnS7LytoIPGvhfALTHY9bknF4P5UdVWX94PBziaUGce+KeqB6KXBTu/bPE=@vger.kernel.org
X-Received: by 2002:a05:6102:4b1b:b0:7c3:ac79:9b09 with SMTP id
 ada2fe7eead31-7ce5ce62789mr1802171137.30.1793004127932; Mon, 26 Oct 2026
 01:42:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017233416.47b09ffff48f.i2c-sh-mobile@gmail.com> <atvUWb-PzouZzL5D@zenone.zhora.eu>
In-Reply-To: <atvUWb-PzouZzL5D@zenone.zhora.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 09:41:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnJqADrLwGHdcdbAF7LTmcevhhXeuiDvThjjnnmdg-eg@mail.gmail.com>
X-Gm-Features: AclHuK-70od6XOcmvqKR7Sl7Q5xoAjafCFmOmm0SnnlxPySBXQ6b06PhHFeSvys
Message-ID: <CAMuHMdXnJqADrLwGHdcdbAF7LTmcevhhXeuiDvThjjnnmdg-eg@mail.gmail.com>
Subject: Re: [PATCH] i2c: sh_mobile: request IRQs after mapping registers
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Oct 2026 at 00:09, Andi Shyti <andi.shyti@kernel.org> wrote:
> On Sat, Oct 17, 2026 at 11:35:16PM -0400, Myeonghun Pak wrote:
> > The managed IRQ handlers are acquired before the managed register
> > mapping, so devres unmaps the registers before freeing the IRQs. A
> > transfer wakes its waiter before the ISR's final register read, and
> > unregistering the adapter does not synchronize these IRQs. An in-flight
> > handler can therefore still access the mapping when it is released
> > during driver detach.
> >
> > With forced-threaded IRQs, the handler can be preempted after waking the
> > transfer waiter and before its final ICSR read.
> >
> > Map the registers before requesting the IRQs so that managed cleanup
> > frees and synchronizes all handlers before unmapping their registers.
> > Keep IRQs available while unregistering the adapter because client
> > removal may perform transfers.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: 7fe8a9993337 ("i2c: sh_mobile: devm conversion, irq setup")
>
> Normally, I don't like taking fixes that don't address real
> issues, especially speculative AI-generated fixes.
>
> However, this looks like a harmless reordering that seems
> correct, although the issue it addresses is rather
> hypothetical.
>
> I'll remove the Fixes: tag, since this is purely speculative,
> and apply the patch to i2c/i2c.

FWIW, no issues seen when boot-testing several platforms using
this driver.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
