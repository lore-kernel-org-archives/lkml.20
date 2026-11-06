Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793987313;
	b=imRzUFSnFr4FDQKHtb3tz+l+ua9ugnrD8ktICQ2oBW5CkkdRc7NbrLcwJYiE7KpIJUd1
	 90MPpQfA+5cn+gLSl7Sp35YHlsNOsRWFL2bUZ7adgfAbnSDLyDScdof4wVz6w5wgxWf7A
	 kBmjCEYjVR/xYuUFPCBXuedLK2PkyV6+J2lY6dpG4VP84pilbqc1I+PnOpECbBoppsZjg
	 QOzktjGFOnCQG8mIMpdgP+jFT+lwVoIPY62txXBLrQHl6iL/LoZqQARUnVz9Qds7yo0R9
	 S5GQmtxwVuoBeFstt+7qy9LfaQZwsFgYfDLJmtGGLE58gpClWULshYNwbAtkls68yTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wW8vMELsSAVnBK6VCjyzxOTijbmPZLXMkWBj11p0mqM=;
	b=vzhxz6bzH1KmIBk32Mm28qqVcck5x9Rd3nmlkcO+jLhymBjixzRNLHkwaIvOUmeNJ7Ff
	 buhX714w4wEBZ/jorZYipamlpLKX/rfUBRRrJdN/ZvFpH/NUBCDfoWC8XhwrWR5pR5VyJ
	 F8QenSpu3Rj/BB1KROzGR1E0Ls43ms+GD/6s1/oGd4CSLN931fjK/gSN9IyQerHUZnHal
	 NOS93HchnWfMEO4VdaWD+DlPKB2kedTPYs1/5m0ax/LItoe5yB531WShpf9PAjAX8fNxJ
	 7nwM0bTt3wUyVf45Bmxd/G0GY271AHrCN19UDF7lUESeBJPnBNYbTTwi2jZM0rbPdTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yixKFmpR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA565606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA565606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yixKFmpR
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e987a2ba0cso5176005ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793987312; cv=none;
        d=google.com; s=arc-20260327;
        b=FAFdQ/fYHMx2krJ/581+WDb5yN4y5sSlJMJEdhYDE8LjorHGhp9lPpGU+kv1uIQbp/
         0TqJsnF9ebpW7itqhxUl0duMJ1X3K1bv8ChgAXT3cagVvKZZulYmAcyIoz1dXUS4+xc1
         CZkn5BllpU9jDOXMaQTSd0Mf1sPlebxg4S5hTlqZVyvoTxvMEo+r3jQSzdB6l7YM4cX/
         E8V9iU+QpKdkQER9Iwq9lIJvXw9UIddzYfpcgDj3Iy2NVTzlGiGg9r3Y41tRQlbF+ZlY
         A0yVwuGBUeQz1CxytbNgKuaFUV1Lq7cqM/ErZoJySnTT89WhXJqjWNzDA3HSRp2nJcsa
         B7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wW8vMELsSAVnBK6VCjyzxOTijbmPZLXMkWBj11p0mqM=;
        fh=W61cOWASSdUAbJ/3ej4TV99twXAkE/WQeootx+AJmU0=;
        b=O7yNCVaIZlb6C+kbisjk+F+xKzZpbOrnW1Ab91EQy4wQd6eAUNHpEZ3MkAwYYe/NiD
         S5F6EX2EbOqjaDpD2QzkKG3XFy5VHIidUe8BMWPRtZ7qKIvkhAwPvpSaJrfo6mBv9C0i
         subM7S6ipl5MzpngLR+TpUUQQodPvHfs/wFiCo0/Mujp+mfZCDl006wmJS+TUDmBFYD0
         ZsYXcR4DR4Cun43pdNni+rIsGDjkMLzyAaNU9WIIZoflkPfNFa89qej4H+9+HiN4eD5x
         /14omwxHUFvoEZFJo/hjrAjw4hP+VL2xkKI1LeodJjlC5jDtmFBAeevq9eR3/LRkvNqN
         Dwhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987312; x=1794592112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wW8vMELsSAVnBK6VCjyzxOTijbmPZLXMkWBj11p0mqM=;
        b=yixKFmpRcBMF//X09M50mh2S5/EOg7hKShzsAngsCyLSF3KfFWa8hzZktyl5UoeMwE
         dHf9H6unilL1dutvIOd4XLxHP+ujF6ttvCOLXHVg00az7TlBfsDGLa8WFmbJMu5XNF2w
         RulIdnjeLfsiZRK9200ts/dMIR9qfn7fxELYEx3/yWqrAOi4Lx86kq/q0aK7rKfSKz97
         zwcDjC6YxqEbsXiz1snrUvC3xeUqS5JDEj9WAImw8WOOhkrNicLI8UTywSkk7ovGHrKf
         Z1hnGVAuhJVDCYhGkQJl7JlFs/70kGbIGeOrqKoq2ql55JFPRQTlnnk7XtgIgygBETqJ
         HzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987312; x=1794592112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW8vMELsSAVnBK6VCjyzxOTijbmPZLXMkWBj11p0mqM=;
        b=s/vyTMV9nOWJJ0lXEw7jS37aF3iZClRpHaZ18xt33ZiUVc47jUrns6Zio5maN5ueH0
         9y/M1DNGHWUb4x/EfGQ8S9Tud/woalbx7r9TLpHcY4+BQvmKQXkf97LVKsw/lslsvIW4
         xxrMH0c1SbnoXrJE0jx/GrtelD0FZGhQ3o+vuKht0+ZGKSJHVtJlYPJy5LVGLjBHkrHV
         hDXJknbzD1AoRysJwRLBOuxJeU63X9XqEHQs7ltu1g7N9rnP4o73/AyFByDkwBEElsiQ
         77jFroQ31RznN0FllTUHsyrnVF3kUwA3rEwS/1TdOTCVa5umimqQ7xfKa/KQqT/Er7mj
         bsng==
X-Forwarded-Encrypted: i=1; AL+hErHwTcEjnYCYt3fyUHUfXgJA2VzzVenLprl1nGV7q6cd8K2cXmPpYZzFPMVFZRYpdu5RvzQFDgxftgm3kKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t2TOvmVekGc0r11BTEEnnaC7q0BE8YACDafYzCPzWpCyjD5G4
	Y6DoCqd+/YD0zOdrse9y0gIBsk9p5xgRQyb4i28kswNuIilci1EpvIr6EBjLHLfmJCH2mPXVyNX
	RmFrptn3MYcIlxww/gxe7QL787i8zI2g=
X-Gm-Gg: AYBFou3xomFqIl0n4AWh5kIgMlk8yghVVS/pQuUgp0R79AHjWdwvFx8cTBuyhllGnQX
	M26+O3U6v4iWt12uj1fFgHiPaSabUwT0r/tfKR5ADf915FrG4pnMrKIutee7oOReUiDzf7ehpts
	IIhNLoE9U1yWMO2t1pHe7Ad++FQkBvXXogcpu6bhklMyBBRLEvBgqhButhP7ZuGXw3m/W6YbK3l
	19IQSPNPM4XKkw4JBsVROT5lfDFYiOKDUWCXcuTTfGhFHAPPQOfLdehmmdBXQ1wD57FLpuKkeTW
	FH6mhHD6kractM8m66Z7z+vvXe567X12MqmdU8K7eYd9K7cTKCgyPrj0kYo/wqlyKHwkY/NkA3M
	u/Kh79uLfNFEKDyWefsC1wmwrypo/PaCgor/X8bRqHC1+z0ykeYlxduakFRE=
X-Received: by 2002:a17:902:ce8d:b0:2df:9057:8bf4 with SMTP id
 d9443c01a7336-2ed40c7730fmr38292825ad.43.1793987311883; Fri, 06 Nov 2026
 09:48:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
 <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
 <CANA1Db=sBQFR99pw0YUSS9sUcHtHVn-SoUyj3p6Vxa+LLJF_Ug@mail.gmail.com> <a7668081-54cc-4f8a-9d9b-376365b90dc8@amd.com>
In-Reply-To: <a7668081-54cc-4f8a-9d9b-376365b90dc8@amd.com>
From: Munique Feitoza <muniquefeitoz4@gmail.com>
Date: Fri, 6 Nov 2026 14:48:20 -0300
X-Gm-Features: AclHuK--dc6lBKAHReoOoB6g9IcoALLNd05TNw0fRkqc3CU2ssJv_1d6fR8uNF8
Message-ID: <CANA1Db=d9=Suwh0V8Zu_G_BGq8YX=dsXKU+1DF1hy_NhYU4aWA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ and
 skip unhandled EOI
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Linus Walleij <linusw@kernel.org>, "Mario Limonciello (AMD)" <superm1@kernel.org>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario,

Thanks! I've created Bugzilla ticket 222242 and attached the requested
files: https://bugzilla.kernel.org/show_bug.cgi?id=3D222242

Please let me know if you need any additional information or further debugg=
ing.

Best regards,
Munique


On Thu, Nov 5, 2026 at 11:49=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 11/5/26 18:27, Munique Feitoza wrote:
> > Hi Mario,
> >
> > This is a real issue observed on my desktop system during boot:
> >
> > CPU: AMD Ryzen 5 5500
> > Motherboard: HA0QING A520 (BIOS 5.17)
> >
> > During boot, the system experiences an interrupt storm on the AMD GPIO
> > controller (IRQ 7), eventually triggering irq 7: nobody cared and
> > leading the kernel to disable the IRQ line entirely:
> >
> > =C2=B4=C2=B4=C2=B4
> > irq 7: nobody cared (try booting with the "irqpoll" option)
> > CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Not tainted 7.2.14-arch1-1 #1 PREE=
MPT(full)
> > Hardware name: HA0QING A520/A520, BIOS 5.17 04/02/2026
> > Call Trace:
> >   <IRQ>
> >   dump_stack_lvl+0x5d/0x80
> >   __report_bad_irq+0x35/0xaa
> >   note_interrupt.cold+0x1a/0x58
> >   handle_irq_event+0x72/0x90
> >   handle_fasteoi_irq+0xb6/0x1f0
> >   ...
> > handlers:
> > [<00000000d546c9c3>] amd_gpio_irq_handler
> > Disabling IRQ #7
> > =C2=B4=C2=B4=C2=B4
> >
> > Checking /proc/interrupts shows IRQ 7 (pinctrl_amd) accumulating
> > around 200,000 unhandled interrupts on core 5 before being disabled.
> >
> > When looking into do_amd_gpio_irq_handler(), pins that trigger an
> > interrupt but are not registered as IRQ lines
> > (!gpiochip_line_is_irq()) only have BIT(INTERRUPT_MASK_OFF) cleared
> > while BIT(INTERRUPT_ENABLE_OFF) remains set. Clearing both bits stops
> > the spurious interrupt status from re-asserting.
> >
> > Best regards,
> > Munique Feitoza
> Hi,
>
> Thanks for confirming.  Can you please share:
> 1) your full kernel log
> 2) an acpidump
> 3) /sys/kernel/debug/gpio
>
> On a kernel bugzilla?  I'd like to look at a few things.
>
> At least this sure *sounds* like a floating GPIO.
>
> Thanks,>
> > On Thu, Nov 5, 2026 at 5:18=E2=80=AFAM Linus Walleij <linusw@kernel.org=
> wrote:
> >>
> >> On Fri, Oct 30, 2026 at 8:50=E2=80=AFPM Munique Feitoza
> >> <muniquefeitoz4@gmail.com> wrote:
> >>
> >>> When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> >>> that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> >>> currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> >>> BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> >>> INTERRUPT_ENABLE_OFF enabled allows the pin status bit to keep
> >>> re-asserting in WAKE_INT_STATUS_REG0/1. Clear both INTERRUPT_MASK_OFF
> >>> and INTERRUPT_ENABLE_OFF when disabling a spurious GPIO IRQ on both
> >>> main and RGPIO banks.
> >>>
> >>> Additionally, if no GPIO interrupt was handled (ret =3D=3D false), re=
turn
> >>> early before acquiring gpio_dev->lock and writing EOI_MASK to
> >>> WAKE_INT_MASTER_REG. This avoids unnecessary MMIO accesses and spinlo=
ck
> >>> contention when the IRQ line is shared or asserted by an unhandled
> >>> spurious interrupt storm.
> >>>
> >>> Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
> >>
> >> Sashiko comments aside, we really need to put Mario on CC for
> >> AMD patches, Mario what about adding yourself to this MAINTAINERS
> >> entry:
> >>
> >> PIN CONTROLLER - AMD
> >> M:      Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> >> M:      Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> S:      Maintained
> >> F:      drivers/pinctrl/pinctrl-amd.c
> >>
> >>
> >> Yours,
> >> Linus Walleij
>
