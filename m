Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873EE3859F4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532474; cv=none; b=WznM5E7rLQFMx48aXD4ziyGR87LP6t+y1q5j4q0EnQzDKlI4wnuY+N6VmcjgZ+DvHYivev7q8bVoPg0lmHYK5yesAoZ1vVfnyUvC+XLUgsZkf/gZoZMrjtH85puetxzr6TICBfTzxd8laaYC3tgwCOHIcXL4l9s62rnAB25Fvfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532474; c=relaxed/simple;
	bh=iwANdAqzga+zM/yuSu0exzs6VE5a7yEytpMIJzjLBcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEu1kveltbUYC/fmSbz1gik3SZUK6qDPLXpcXFW2eYpB3GsCKTvupJRbMmEzCXmP7OaDM6Tszy2hOzwCH2Uwso+dlWhhwWiM0DjsxuWZHrBoNzbk+qzT0LZJpXUZvJlATQCWHCZbSWV5qcPOocgH7T2eXCo1PK2orn1htkfNnZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oXRqdZEO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oXRqdZEO"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso1502672a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788532471; x=1789137271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ck7BSWkkXwWvroZN1jbW0sU0ReXY/y4Y6ENpLqokqE=;
        b=oXRqdZEOfYyYPi2iKjTa4er9gO4ge2Og0W6LYjns9thRKGBFYkSxp2fYL0ns239gAc
         URPTTb0FIuR08wioB4QUj6AfVZlUqUHpN6A2P6VxWT9Gk+c7FEK3+I/2mExILpYGz12h
         v1iGZh6aD6pQHjMo5xe3u2bhLSQS8mXPW/YXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532471; x=1789137271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ck7BSWkkXwWvroZN1jbW0sU0ReXY/y4Y6ENpLqokqE=;
        b=M3bbf6HKx5RrujRBjfQHdw/E+2weoyvqTpUyrU+rChfnL/R/FID74GYFfRE7Ww+xCh
         dAGfw2PJjqPvLvDeLUAdI4Np7ffW2mYJK3l1vhGbe+dPkNdTwY23U1NZ4Zy+B4n9As1W
         RY93wwU/mPRao4fFEaHItttRZwWIwYnNlpLoS4vh9zGE0crYgepIPWMD5Wi3vt16fdoI
         Bfz1D24+wL6fWb/ZRhPuvMJJL8dnyefrwzdJdC51or8YZ6zUaDhaOvvsfMKDuLx2mTWo
         yYRmm0nGEKS1V78NjR86Eg/vGZqhkcZCZveH9wLBPmm61ewFFugJMEyhxSS8bsGLodwN
         PuoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbpL1ZGmz9c7mBH9bp/LGhbp76YCQHMXWQalxbQRcyA8NGJVCaLYAW9q+JOf1lhBQfQ39TNK2TXG/fIGs=@vger.kernel.org
X-Gm-Message-State: AFuF++kSLCOD0eRwM1xnale0x2ZDYzVtEYimpLkDOSWwVU9GTJx60o8O
	gY6AQGkcm13zbA9aehQAVDNMpegBX8shLrAlsnT9YZdbr2Vn9exzmQYksIMkHNV50ENVYWfHNkB
	vu+w=
X-Gm-Gg: AYBFou31lgAJQhnG6uTj25k1CAFyJJDmHcJ5mWPa/FMEYjWTwibHahd5ngHC+INK/s3
	RVwH2olwkKsH7DkFdh4wFBI90a0G/IknTlFDLKl7GNed15OlYux4aUf0HTXFW+ErhWqSNnu+uaV
	g9MWRt3cuwm/Tdt9a/bSK379Cj4nyQP3nIFi2q330rayiMiCCWoZIgHM7R1bAVYA7JJiznfgRGi
	AwuwdSYGpnIpfsD4PHyBBMbsgOd9GRiToyEWQFb/T8nC3V1UktEBixhleXwXi9IH3zifoAX2UUT
	GRsQQXfa0Yc3G2FNu5rahPu+/EUTA+ZFyFjzZf0WzSJwoyIHjDIEk8teovqbwV3uBmkwnCwS+fz
	/5DkPS556IC4MkZtecWOZBqUDSafLSV7jY1r6+Eqp3xBjKHuNI0EMp0jk7HHz6+It3RDyfp1KX+
	Q/rvO/nBkJKdnQVgts8SsrDpewFRohZPfN2Lsw4nFutYg3UEzTFocPwDa6hTHQeIgscu9BH6KOL
	HUl89PgA1686qal8x8YFN3kxCJGiH6aIkUGfA==
X-Received: by 2002:a17:907:608b:b0:c24:c0f4:899d with SMTP id a640c23a62f3a-c260cb46b1cmr533325066b.22.1788532470597;
        Fri, 04 Sep 2026 07:34:30 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5768c2sm114003466b.39.2026.09.04.07.34.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:34:30 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49557167508so12290265e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw4JFkrWwzXjkMhIGSFqPacVgfH3tpnlHfYjoHgn0h/Uc3CC6gS93dPtgvfHpNTW/PjgniU2yN4Z8xfBeI=@vger.kernel.org
X-Received: by 2002:a05:600c:6087:b0:49c:d52e:d0ea with SMTP id
 5b1f17b1804b1-49cf81e3454mr116251535e9.4.1788532464702; Fri, 04 Sep 2026
 07:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-1-f3999362a9ea@google.com>
 <87fqzp8jex.ffs@fw13> <87wlt13zj1.wl-maz@kernel.org>
In-Reply-To: <87wlt13zj1.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 07:34:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ULeHqEZE-a9vV9F6vVMLVBPDTeXTgnmU_Bqui8sc1ZZA@mail.gmail.com>
X-Gm-Features: AcwNN1VrCYtMK0FuxIEwY-YB8TuqCWsz3J5Ntif2-4hFkWwShLrXdtkOdhxnO4s
Message-ID: <CAD=FV=ULeHqEZE-a9vV9F6vVMLVBPDTeXTgnmU_Bqui8sc1ZZA@mail.gmail.com>
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

On Fri, Sep 4, 2026 at 6:38=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 04 Sep 2026 10:17:42 +0100,
> Thomas Gleixner <tglx@kernel.org> wrote:
> >
> > On Wed, Sep 02 2026 at 18:54, Mayank Rungta wrote:
> > > diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> > > index 2fbff2618a1e..a9973b61163a 100644
> > > --- a/kernel/irq/manage.c
> > > +++ b/kernel/irq/manage.c
> > > @@ -1379,6 +1379,14 @@ static bool irq_supports_nmi(struct irq_desc *=
desc)
> > >     if (d->chip->irq_bus_lock || d->chip->irq_bus_sync_unlock)
> > >             return false;
> > >
> > > +   /*
> > > +    * NMIs cannot set IRQD_IRQ_INPROGRESS because they cannot acquir=
e
> > > +    * spinlocks. Synchronous disable and teardown require querying t=
he
> > > +    * hardware state via ->irq_get_irqchip_state().
> > > +    */
> > > +   if (!d->chip->irq_get_irqchip_state)
> > > +           return false;
> > > +
> > >     return d->chip->flags & IRQCHIP_SUPPORTS_NMI;
> > >  }
> > >
> > > @@ -2034,11 +2042,20 @@ static const void *__cleanup_nmi(unsigned int=
 irq, struct irq_desc *desc)
> > >     struct irqaction *action =3D NULL;
> > >     const char *devname =3D NULL;
> > >
> > > +   guard(mutex)(&desc->request_mutex);
> > > +
> > >     scoped_guard(raw_spinlock_irqsave, &desc->lock) {
> > > -           irq_nmi_teardown(desc);
> > > +           irq_settings_clr_disable_unlazy(desc);
> > > +           irq_shutdown(desc);
> > > +   }
> > >
> > > -           desc->istate &=3D ~IRQS_NMI;
> > > +   /*
> > > +    * Ensure all in-flight NMI handlers on other CPUs complete befor=
e
> > > +    * clearing desc->action or tearing down NMI state.
> > > +    */
> > > +   __synchronize_hardirq(desc, true);
> >
> > NMIs are strictly per CPU interrupts. So how is this supposed to work
> > correctly when looking at irqchip_state(ACTIVE) ?
> >
> > Marc?
>
> I have no idea what this is trying to achieve.
>
> This can only work for a global interrupt, not for a CPU-private
> interrupt, since in general you can't observe the state of the
> interrupt on another CPU.
>
> My guess is that the OP is trying to trigger an NMI using a global
> interrupt, which we never intended to be supported. That's not to say
> that it cannot be supported, but this patch seems to be breaking the
> core use case...

The overall goal is to take the watchdog bark interrupt (which is a
GIC Shared Peripheral Interrupt) and promote it to NMI. An example of
that interrupt in the device tree for one Qualcomm board:

interrupts =3D <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;

The patches in this series seem to accomplish that. With the current
arm64 pseudo-NMI implemnttion, requesting as NMI just bumps up the
priority of an interrupt to "NMI" level and that works fine on SPIs as
well. On arm64/GIC interrupts are routed to a single CPU anyway, so
requesting it with `IRQF_PERCPU | IRQF_NOBALANCING` didn't seem
absurd.

The biggest problem we had was properly cleaning up the NMI at module
"unload" time. To make that work, we needed a way to synchronize the
NMIs to ensure they were quiescent before the module was unloaded.
That's what this patch is attempting, and is mostly attempting to
respond to Sashiko feedback on earlier patches.

I don't think Mayank is tied to any particular implementation and the
overall goal here is to allow the watchdog bark interrupt to run at an
elevated level so it can produce good backtraces even if all the CPUs
in the system are locked up and the buddy lockup detector doesn't
fire. Is this something you think should be doable? If so, what's the
best way for Mayank to go about doing it?


-Doug
