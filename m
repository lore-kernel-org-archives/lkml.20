Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CDE5038E8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067098; cv=none; b=ME6kj3tTmpCz2jO350sYkmh20NTWJE8Yc8l7FyBCiXeV4aNlTLUficVqFuCkbCAoxZdyfrL0ydms7Oj6wDKBUg2kbD7FJ2N+EnPi6g0+AHkPhWDUbKoqCTi9dk5Tg5Smg1J7HbtJp2a9S9ecqfEuoNArnaCZg/OpqDZ/1xFk+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067098; c=relaxed/simple;
	bh=ZT5nfL5cWvVR+FVtK69hN39LbUZkLY55DyGOyx8pbbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hxj39WktxU0G5VLuBpUduu+lNcyz0qHSvMbEiiA8YzYWvGjVBjZiR+7/21vUT2x1U0kPUEcOI+qlv2AYzEUuhUFK6h8potRPTn4R4uckw+mTCkh66ndopUOgRHlEjhN9fXiQ/p4hssI0vbcfguSEf3yxioL9Ia9MT504sVjA3Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e91e422859so2573380e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067095; x=1792671895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gQc0B6ddBetoMPj6D5PkGmJUAko65vy6l7KddjggnuQ=;
        b=1pM2I+MsPcfQTQCrgV9rJsVn/1zZhQZUsETyvi+9KUMhbVTX+n0ghMxO7hVvfBDbg5
         AGDkFowMOuA/LE/ADu4Dds7UEjPyYG1drgl7E02OxJiLggJgoGfaqvjFigFFtYAH9oHS
         FqNegz6JdlT3JJvya+160DS2/FKVwVDhJ6li63RFUkXw4GPPTmeqnRTC/dDHw3UIMXJX
         BiGzFfbiVVq8wnROUIvIANtQ+BGnDsGa1X3gn4XZxQJ4KDti66LhPGJdtQrxF4lg14iC
         jSg7FrevX780gLEnMRKmmUiZW7DhY4a9T9hwgHRNYJiDLC2Oxe5EUZ9M6gkKK2lwib8a
         BmCw==
X-Forwarded-Encrypted: i=1; AKwUvBwJgKxD9yYDEIBd1ILfuu8Q9GeFZCyhHUpXa8M8slPVIrTlVur2wSGQ/aV6/XnICDc8vNzL9KzRH6unLUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/HLf8hjBj/i5u6rstZhVZAH/3oVEkm15nEsIvxgo8ez64iiTX
	gCVDXIndaUxwmV2zOv0rK30HKp545i6OyoAVVLz5DY9wARE5vP7wUG5MxSq+sqFVaQw=
X-Gm-Gg: AYBFou25M2H/AbmQYvLk25UWgjxVWggRduJ4xmhI8eXjOgWNAttKyj1n+Gv0ttMPFAP
	sP8e+BY9MrL3zGHpLwr8TnIcxZuV4Y+M5DmattBxQFHsgdZ+6yFkR6QGtJxfICLYKmwhPdXTiCK
	PlT+Mh6x/ra64RuZZac0yGFhNvlnLEKpIS1tceJ56r/uVOQhwiEA2je/GaxbxWlBPlZYRG9AOVI
	70fmCC/mAyMnsoJ526O6M62SeeTaFG4IT4WxzdGJKIV7/QE2hoXP6LIqGP2lV4Eo0ARZ6x7wv9w
	HinplqRn56Kg57TE0mBzohHIGSnVGcgcvApONHwBmApk8iIXyAqFixyqwZ+ayRU4GiVup+QHfyZ
	1Z0ID9v2S7EdRhA3wNu7F7/S2TlFLyM+eMPSpz7IzO2BfqPSq/mSmrMRgzORTMHqpQhVGo5zMAw
	0yvVBmkFsCLX+ahIyUz6lPWuJ9T3SY9A1SI7acxGnG9RPc2q3iqNDX1VoGgPXMVuUMwVQDuAvyq
	8guqPpxkvzGUxVUBNe2cHULqVKqfkcY/dlCFVJi
X-Received: by 2002:a05:6122:4892:b0:5dd:bc1:93da with SMTP id 71dfb90a1353d-5e91f537983mr6104633e0c.17.1792067095223;
        Thu, 15 Oct 2026 05:24:55 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab8c40sm13803642e0c.3.2026.10.15.05.24.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:24:54 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5e9405fbc33so2277513e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9HriGWXllJAUfQYjoUu1BKkpZM0xwWd9d1CzyPSFjXvKRy0mnBiq9jHAabEKm19bHC43rfA+Oj5Io258=@vger.kernel.org
X-Received: by 2002:a05:6102:5792:b0:7cb:288a:b68b with SMTP id
 ada2fe7eead31-7cb373ecaa6mr4423446137.37.1792067094049; Thu, 15 Oct 2026
 05:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
 <atAQAI0WWtwh8kvf@xhacker> <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
 <atC9jZIF1T1x0w1X@xhacker>
In-Reply-To: <atC9jZIF1T1x0w1X@xhacker>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Oct 2026 14:24:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkzgE7=n7MJ1-QS10y=f75vO7OribUgM3wb134LN+5kQ@mail.gmail.com>
X-Gm-Features: AclHuK8AEmS4BjewOhDIhzzUqFg00oT4fEiD3JuX6PdEzowUpGV1zfOobCzXRp4
Message-ID: <CAMuHMdXkzgE7=n7MJ1-QS10y=f75vO7OribUgM3wb134LN+5kQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend on MMU
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jisheng,

On Thu, 15 Oct 2026 at 14:08, Jisheng Zhang <jszhang@kernel.org> wrote:
> On Thu, Oct 15, 2026 at 09:43:40AM +0200, Geert Uytterhoeven wrote:
> > On Thu, 15 Oct 2026 at 01:48, Jisheng Zhang <jszhang@kernel.org> wrote:
> > > On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> > > > These options are irreleant for nommu systems.
> > > >
> > > > Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
> > > >
> > > >  config RISCV_ISA_SV48
> > > >       bool "Page-Based 48-bit Virtual-Memory System"
> > > > -     depends on 64BIT
> > > > +     depends on 64BIT && MMU
> > > >       default y
> > > >       help
> > > >         Add support for the Page-Based 48-bit Virtual-Memory System.
> > > > @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
> > > >
> > > >  config RISCV_ISA_SV57
> > > >       bool "Page-Based 57-bit Virtual-Memory System"
> > > > -     depends on 64BIT
> > > > +     depends on 64BIT && MMU
> > >
> > > hmm, I think we also need to make RISCV_ISA_SV57 depend on
> > > RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
> > > !RISCV_ISA_SV48. Human won't make this wrong combination, but
> > > the random config can.
> >
> > Is that really an issue?
> > If I build a kernel for an SV57-system, do I really need to enable
> > support for SV48, too? It builds fine without...
>
> This is to align with the spec:
> "implementations that support Sv57 must also support Sv48"

IMO that is something different.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
