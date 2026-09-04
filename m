Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164C3443E3F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534018; cv=none; b=LXTv9YkmRpj+R6gDUJDezeTdNWXBgZsePDQu6NNYI9nkmlURMul6WU+E6pM3Ut6ikFY3E8V+AIYmZPi9y/I/GOfkmE0u2TApR8IUsq0T8DE1F4GLM9zCbOrkkB8Y+u3G/46hiWkVyJD2++YVqr9zHhJR/Lf+XLEqkxehQaBRP+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534018; c=relaxed/simple;
	bh=m6woJE35uAQXcaorYQsjjoNm1tJ3wemg4GwQSTR1U+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDCT1BGfVt9CwKhVkqIhv7eZm9CpBspccvr1lIdZdJlEEBWTWjzf9F0FNLktVmc4ExzT/UhndTQf3F9zXOUOsaZBdvzYFPw2h8kcFjHg2VnGz+i/qFsJDRSGtr9COs6XMnVJkxfWfFlGZJSxVKsbE4950JFrhG0CTL9MSy/G9pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bLSDKfbY; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bLSDKfbY"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c20ce3c118aso228634266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788534014; x=1789138814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m6woJE35uAQXcaorYQsjjoNm1tJ3wemg4GwQSTR1U+M=;
        b=bLSDKfbYAucDCz4263+xUGcNYys+DAZF5adG8BTEjaGnLqVSSUDHoBToMNsaLzNh68
         stmgeS+LyT+6Ivk3AfAY+kFCDQ3Tf3UO6yQNpyKa/KrpmCVjeVA89qjiDW9SfCw3z/aW
         jZ7Nkfnk5noqJ7KIMhmJABomFYMSX2H5kuAeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534014; x=1789138814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6woJE35uAQXcaorYQsjjoNm1tJ3wemg4GwQSTR1U+M=;
        b=BctzPHq3nC08xmvsxjRbv2Rfov3mn/8F3laZTKsaSK+kSaixp9Jl5uBBVoa1of9+i9
         IjajDLvAPWTg7Ys9oxryl9CAL56O8+BddA28EJznqzLksLB9Otompt8/w1Kl1u1sr0On
         JvvqQZ0azVG5qmpjg4DFI6uH8UXtsSJOKqV6JQKM5Dk0Nft2i61wa/1O43/j5em+KF2x
         haSRNFqd5lD+bhGtlrd+xdSAVfrtUbNmynEtSYZRZeNgwdAZd9l/3YQzA0otanLNL8VS
         HjSnpdsXhlWLSULePRrtFUvBBJntHMypw7CqlC/G0yNyOuC4F5DosLwJxseKiyQD6Fj5
         8vng==
X-Forwarded-Encrypted: i=1; AKwUvBzirn+TqHlkQVKPWILo5PZTcYPgNPElFqv4zAoJ6BqwauxFmfLOzAgeJ0Eshr+9mnooZAdXeQcCrD+SDZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ582Xik6PloOzh6PqSR26qdzuHWoLpDtObT2+AmpbiXEHsfPS
	EwqkhvQ6b4Ey4lpyck5xInFgrY3J0ngK+GlJSfm6NvClJoJsl88D7+Sg1MdSyTiD97PQX7uicEv
	KY0Q=
X-Gm-Gg: AYBFou2/r3LrTBeCSjCk+EFPrGJK0e5/X7BjVFcJ9asJwXTsuKG8VZVHKCUdONk61hl
	zilqIKJiqdXKlzOly5+cX5awv/ja33UbTNCaxqtL8ODc4lnwat+Yo0FAlhOq5EWORRf70uGxdFv
	pcthe40bdkp3VR8ONpV35fAmeSiYfA+K3oAwJvFYGPHOmPji4DKB+a2lPoCAuUUjsgBle5pnO6g
	2do2k+CJ2m+O+7sYr/0Y9CtYP8XpEhwnpD/Ad4BNoKpMhZeek8NTiLT/nwrfrTQnt+ByAp6lnLz
	HxYY+n6BZ2RZHMZ/iOPijG57jMzvyiMf10/87tmBCJKmTwlR+dq7B9lGGcUfzYSBD2y1ohYCQCQ
	gqMYpG+v+5oBwhUhPL6c325eDBrtfvAcSMkYcWb3fivS+MrL+LBfzMRCwzemrecZNqkeMv381g5
	MiW7YZSbRYPTgv2dXnEd+Y1qF3BAmlfoTwXlmkUxYGspNuePmHWqsXEtlWVPRGhaMsmHwXghgs2
	+zcn3UlrYQ2jLLBMUk7/GvlYOE=
X-Received: by 2002:a17:907:c5c3:b0:c25:f7db:4beb with SMTP id a640c23a62f3a-c26104cbe6dmr205293566b.17.1788534014087;
        Fri, 04 Sep 2026 08:00:14 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d03635csm121973266b.7.2026.09.04.08.00.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:00:12 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48442ea8f59so1683784f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByk+AhWvy0bo5gkkA9wKLW5qcagNK5HGl82KVmMSOI2uWyguLxg81WAri0wvtgDDPTf04gW4OFCc69Bp38=@vger.kernel.org
X-Received: by 2002:a05:6000:4543:b0:485:8ee0:dfd0 with SMTP id
 ffacd0b85a97d-4858ee0e180mr574723f8f.6.1788534009667; Fri, 04 Sep 2026
 08:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-1-f3999362a9ea@google.com>
 <87fqzp8jex.ffs@fw13> <87wlt13zj1.wl-maz@kernel.org> <CAD=FV=ULeHqEZE-a9vV9F6vVMLVBPDTeXTgnmU_Bqui8sc1ZZA@mail.gmail.com>
 <87se3p3vzs.wl-maz@kernel.org>
In-Reply-To: <87se3p3vzs.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 07:59:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSpwYJ5=xTA7qWh+iwp-PdSXn0Ucboejq8yF5buyH4-Q@mail.gmail.com>
X-Gm-Features: AcwNN1UNb-ET4q9cT4xesT3CWAaiu4cvwQTslKfaw_0TzhZI43afTLmag298Cu0
Message-ID: <CAD=FV=WSpwYJ5=xTA7qWh+iwp-PdSXn0Ucboejq8yF5buyH4-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Mayank Rungta <mrungta@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 4, 2026 at 7:54=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> Hey Doug,
>
> On Fri, 04 Sep 2026 15:34:12 +0100,
> Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Sep 4, 2026 at 6:38=E2=80=AFAM Marc Zyngier <maz@kernel.org> wr=
ote:
> > >
> > > On Fri, 04 Sep 2026 10:17:42 +0100,
> > > Thomas Gleixner <tglx@kernel.org> wrote:
> > > >
> > > > NMIs are strictly per CPU interrupts. So how is this supposed to wo=
rk
> > > > correctly when looking at irqchip_state(ACTIVE) ?
> > > >
> > > > Marc?
> > >
> > > I have no idea what this is trying to achieve.
> > >
> > > This can only work for a global interrupt, not for a CPU-private
> > > interrupt, since in general you can't observe the state of the
> > > interrupt on another CPU.
> > >
> > > My guess is that the OP is trying to trigger an NMI using a global
> > > interrupt, which we never intended to be supported. That's not to say
> > > that it cannot be supported, but this patch seems to be breaking the
> > > core use case...
> >
> > The overall goal is to take the watchdog bark interrupt (which is a
> > GIC Shared Peripheral Interrupt) and promote it to NMI. An example of
> > that interrupt in the device tree for one Qualcomm board:
> >
> > interrupts =3D <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> >
> > The patches in this series seem to accomplish that. With the current
> > arm64 pseudo-NMI implemnttion, requesting as NMI just bumps up the
> > priority of an interrupt to "NMI" level and that works fine on SPIs as
> > well. On arm64/GIC interrupts are routed to a single CPU anyway, so
> > requesting it with `IRQF_PERCPU | IRQF_NOBALANCING` didn't seem
> > absurd.
>
> Not absurd, but the implementation as suggested has the potential to
> break per-CPU NMIs if you check for the active state on the wrong CPU.

Ah, got it. So if someone decides to call the synchronous version of
disable_nmi() for an actual per-CPU NMI then it would go boom. That
makes sense.


> Also, checking for that state doesn't mean the kernel is free of
> reference on this interrupt, as you look at the HW state, not the
> kernel's.

OK, fair enough.


> > The biggest problem we had was properly cleaning up the NMI at module
> > "unload" time. To make that work, we needed a way to synchronize the
> > NMIs to ensure they were quiescent before the module was unloaded.
> > That's what this patch is attempting, and is mostly attempting to
> > respond to Sashiko feedback on earlier patches.
> >
> > I don't think Mayank is tied to any particular implementation and the
> > overall goal here is to allow the watchdog bark interrupt to run at an
> > elevated level so it can produce good backtraces even if all the CPUs
> > in the system are locked up and the buddy lockup detector doesn't
> > fire. Is this something you think should be doable? If so, what's the
> > best way for Mayank to go about doing it?
>
> The only thing I can think of right now is some equivalent to
> IRQD_IRQ_INPROGRESS done in a lockless manner. It doesn't have to be
> atomic if you can guarantee that it is checked on the target CPU only,
> after having disabled the interrupt.
>
> But this is rather ugly, and I'm pretty sure Thomas will haete this
> just as much.

Thanks for your insights! Hmmm, maybe it makes sense for Thomas to
weigh in before attempting this. ...or perhaps he has some other great
idea that would make this work.

-Doug
