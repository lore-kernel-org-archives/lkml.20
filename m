Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4BA2BE7CD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020284; cv=pass; b=tXJEjxIWQ6XWXtgr0MzdMcUmKL4bHsjQF3vxP/EXmToENmTlGEsLwm7Coj7HDNJbKfFfGXBGeQ2yuUmZ87d3rIqF/kIdxtKxfBGetF70JKVWTEeWff4nYC6ziMZCK1ecG3H/0WUVTOHrtWn/KS065JlmThzNQJXPPM4PMWMhi1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020284; c=relaxed/simple;
	bh=Y6b96iet9s2KwwRC14nzYS35sZ+CgS6dHidY71VhHFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odbv5OkggL6RCfTLP9FZwa62y//udxxZa1REFMyCiMZQXFKJGLBdhC6rTVQeR9fttPNSHbbysqC7Q44farELpRyxrbTV2UTmecTJEWkiRWp/MZJIN+UqmU4ycpj6e2T87WIREan3u8oAtrXGPI84OlTRfV7O7M/IiUx049DYkGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXTnZbni; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXTnZbni"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9399d91ee7aso510791185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789020282; cv=none;
        d=google.com; s=arc-20260327;
        b=ED1gMjxDplVtPpT8/zAQidl64tYXqV7JnV9qmWDqhjorhco/Tz3VhT+/RgXI+wI9g5
         QhR+Gd18Ohziga8PycDu0QbU5o2dumFg2TmaaiOwsm3UwSyUMHoRwa87Mt/0aJbTakOc
         0zYeQhajYUkq/nzG3EosVCWImHWrYWqVr5UZObz3QzlvUYTpEY7N2gG/FaRAJ3ZtR7U6
         ogHwlza2XWfUPuG0PUsTon53zoPFkgsLsLJxRPPN+sthER2DtRdUEWtReEKl+bKnUW9Z
         snGnXbtuJ9qoZp/6CxuoTFbyn9vHdyzFNaI6zb86rqlUI2s1meM9jUVBBFiHa2wZh3EB
         Zq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nBNYr0evCGRWWAC1VfILVSzC5WtT6AbMNuwOI5qjq5M=;
        fh=DAfARqAc9P79xBnEDcRXNs3dQmoF32zy17ru5eSCmCM=;
        b=A2mQ8daHNHPQFxALTRshFn6dnccCxMeFAEZVm048xiPDGd7b18mmTpABoVV/vXdNQ9
         x+35AFUUoCRL0q/aAkJhGLNvMJLJaLtaokQYQJJhrn1TolCO6vxWDbJNc53dSg7y2wi5
         K3/l5vBO5HgslgJorF0+q6fzSy7Xy12zxcO4ogi6W1JWR3zidNKnjfX0jA4anZK+mfLH
         whc6bO2YoXGDQ9J0rBiKLM5ppKTZGMF+0rC16kxTgoUcVNW8Gz4a2hK/nvtZsRi7Lowk
         Lv3B/kB0VIoxcmIJAKnJhAY5rkaZKz3WHT/s7gybDPAX3G5vI9hZphqeDaPgFUwyoZMG
         DsDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789020282; x=1789625082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nBNYr0evCGRWWAC1VfILVSzC5WtT6AbMNuwOI5qjq5M=;
        b=PXTnZbniXP8cqgWZBaMnsoBmL8tkiXPbFch2Ai/P5KiRn42qKdd4jpcDZvuveP9RA/
         4q9hP2/czLKhLncOM4zjS61axmk6wGfW7GqwizCfxn1Z6YDURlcijW/APweTuBv4Z3sE
         eJZdW1XfLTQI2i5XaxKukB3Q3XDUAfYN9Fv+52d6FXVDbsy0neqQk3Ukax6L7zGV0luk
         FO96PKDx96zwEmc2JnW37nQq5O7Cv2+D6j0jU1DFmvj8fFRgj8+Sd2vL/pMKYqqsjXDl
         kk56H2Ee2r4N51iOdyD70svcF26v6osgOWs3uLqdU6UfS7q0AyBlFLeQnMWxQDRbxJ9i
         Yysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789020282; x=1789625082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBNYr0evCGRWWAC1VfILVSzC5WtT6AbMNuwOI5qjq5M=;
        b=oShi0BeSLzIuQCBqqXjFKNfaNXJoo7dlOlv1lM5kUZkD5gn1mDlVlwxBr26xansbAi
         SCCDs3OZmnGb+Y6LHs18bGiGBuG1r5wuxRlfLH2ZmzteXtNaHCuLydVBjX1MnMZ49ekW
         pfxrwVi2n8JklS4ibwXryG34zgtNlzYIf7bEYQsfVqHPRibh1qFlD0YuaMQgo2tqszKo
         u1KRm3cetvtSsTyyPbpiVKmmvpAQGvEhxsiOgYiddM9RNpLPEYZF4Z9LH/rVqRLzWMhZ
         vO6GkhcoX0rHnnkFCgEzAENI+FQ/PygeaaKnbWpDX04AuZ0zyqViYrdZP6v1sEDIpgau
         uS+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxSgv1rLqs/AZoy4a0+t6sRecSBNyQ8U2aCIcFKVz7TIHRfvqVI0fVu4omRzimQAU71cMrEiURzDbAYiXk=@vger.kernel.org
X-Gm-Message-State: AFuF++k1N7wUttJOAD7FuONs1VakA76bAPOt3yMsYVtVfw27oo24DQe+
	2O3LYxok5KiEeJnh2NkyPqB3fuU4w8PWF92bXjUarkthq0b0oSXZVv4NC7flo+I1NCqoOlGCfs5
	i6MPHDmkYUPr+KauFe/0/MkoP9tSkwmYLffai
X-Gm-Gg: AYBFou0n8X5ejP0tu2zSwxJIJjxHtBD8FUvu/6Lrl2bE3qENBOUKjL/8IdNRky9gTjk
	l69j66GBma2JmhPoR19ToViEE7O9rNs2eOzu2yH05Hm5/IAXiU28C+kRpaDeECSWuBqmD0bJkbY
	pXjFztThDVJYc+6ZWUWGMDNsxZTZMO7UwchcamjXdo7lwf3601dfip27SUQfzAIwvlvRuzEE0S8
	Ro2ypDSL3e9wOwWlVCJz9WXYHxKHJcdX8l4CNdQcmcn5MZIYiABptkDttnqWIKXIAQDyreiulHH
	OJ4mnwhYBP1jYffDbsaV3EBa+cl9edgKPqOSolgGXNiiYDspdWY9GWXo
X-Received: by 2002:a05:620a:4443:b0:92e:5d44:73fc with SMTP id
 af79cd13be357-939805cd179mr4210849585a.12.1789020281612; Wed, 09 Sep 2026
 23:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-5-a0282524688@gmail.com> <20260903102447.GL2133376@google.com>
In-Reply-To: <20260903102447.GL2133376@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 10 Sep 2026 14:04:28 +0800
X-Gm-Features: AcwNN1VdtjlRW6XgLdxAdHaEJGhXj6u2d43oLgez_0YxgAUHTZ1OoGurmEs-fpU
Message-ID: <CAOoeyxX8Tmk0qaWHz+xJoUZgGZbrqhcWQnGYbTEPoCWC2bOcdw@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] mfd: nct6694: Rename driver to nct6694-usb and
 update Kconfig
To: Lee Jones <lee@kernel.org>
Cc: Ming Yu <tmyu0@nuvoton.com>, linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

Thank you for reviewing.

Lee Jones <lee@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=883=E6=97=A5=E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, 21 Aug 2026, a0282524688@gmail.com wrote:
>
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > Rename nct6694.c to nct6694-usb.c to accurately reflect that it
> > implements the USB transport backend.
> >
> > Additionally, introduce a new MFD_NCT6694_USB Kconfig option and conver=
t
> > the existing MFD_NCT6694 into a hidden core symbol. The core symbol is
> > now automatically selected by the transport drivers.
> >
> > This Kconfig and naming restructure aligns with standard MFD transport
> > abstraction practices, paving the way for future interfaces (e.g., HIF)
> > to be seamlessly integrated.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
> > ---
> > Changes in v7:
>
> No changes or you forgot to populate it?
>

There is no functional change in v7 for this patch; I'll mark it
explicitly as "No changes." in v8.

> > Changes in v6:
>
...
> > --- "a/drivers/mfd/Kconfig"
> > +++ "b/drivers/mfd/Kconfig"
> > @@ -1164,19 +1164,30 @@ config MFD_MENF21BMC
> >         will be called menf21bmc.
> >
> >  config MFD_NCT6694
>
> So what does this do now?
>
> Will there be another core symbol soon?
>

MFD_NCT6694 is now a hidden symbol that builds only the
transport-agnostic core (nct6694-core.o, added in 5/10): the IRQ
domain, IDA pools and MFD sub-device registration shared by every
backend. It has no prompt because it is not useful on its own, so it
is  selected automatically by whichever transport driver is enabled.

There won't be a second core symbol. The next addition is another
*transport*, MFD_NCT6694_HIF (eSPI, 10/10), which likewise selects
MFD_NCT6694. So the final shape is a single shared core selected by
one  or more transports:
    MFD_NCT6694 (hidden core)                 -> nct6694-core.o
        ^ select
    MFD_NCT6694_USB (USB transport)    -> nct6694-usb.o
    MFD_NCT6694_HIF (eSPI transport)     -> nct6694-hif.o   [10/10]

I'll clarify this in the commit message for v8.

> > -     tristate "Nuvoton NCT6694 support"
> > +     tristate
> >       select MFD_CORE
> > +     help
> > +       Core MFD support for the Nuvoton NCT6694 peripheral expander.
> > +       This provides the common APIs and shared structures used by all
> > +       interfaces (USB, HIF) to access the NCT6694 hardware features
> > +       such as GPIO, I2C, CAN-FD, Watchdog, ADC, PWM, and RTC.
> > +
...
>
> --
> Lee Jones

Thanks,
Ming
