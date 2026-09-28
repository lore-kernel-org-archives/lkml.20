Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C414DA553
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612099; cv=none; b=BuUIZII/GymqLmjRlTVPapIw3jOIfaZtJkGARX9pEp5Zfshef7ueMYJq0yEanH1+YOzZd7+dXajda8dfZJ/ylZq2Vp6/XnV71HlZadkSAjwKArsNw4JsbedrVfrcJW6k2zFgLEwMan2Lg6c3PlSufVgxrrRKmi38jvQ1pENlI7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612099; c=relaxed/simple;
	bh=HGCq3zgoP0saYvNcEo4pPaH65XFLhzGyGOi+d0Mq0XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rb/xB4qiTKkw3p9nagemqv1nSVPpx90G8llRGA6ZFVbnQ7itmp4sczwFQvxcWsooYpY0EseMfATsvrtL1534/2cHp217WkcQZFI00CsYWJxj/Ujiui2qDiUN5lBPy8eGZj5KMNSYUgQ8SIMWsben5wDdpStdd0Gyku9RX7Daw7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SkwNRIVl; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SkwNRIVl"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae90f528fso4669171a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790612088; x=1791216888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5i0eNwNQJ7C+ZbxkaslWCixtSKQcLs6enIs7bxdCR/o=;
        b=SkwNRIVl29Kr8s5L//UPzL91ubnM5iKJSxJeqj1yPchi3OJk7hYQRBktWyg5XxG4zP
         0v7XPJNvbfZbuz7vIIKDM0545gOHfpYZq/NG8WzRq2qZmmlDLGYuTyDqy6Jg6RHoFS6j
         Q4wGRH+7u1W2WOexxVy9Pd/h2POVOYY6fjBcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612088; x=1791216888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i0eNwNQJ7C+ZbxkaslWCixtSKQcLs6enIs7bxdCR/o=;
        b=bu8uti6G5vNfLRKz+DmqoWr4wUeZHOwKBs+5Z6ppvHkk/BkMdnGnv2FikZMXKnacBL
         BVnHTJjcdiLnTRz1pg2fgLoGFu35qk2Wyxm+9DXgksZDwnEl4X5cD0vm7WlX1aQv7/dR
         A/kai+0gUqk34HFeZyVKBo0RW6x4+aeDlhxdiMc9Sa6McEFqqjG7y6D9liIQuCnOTyKU
         JqgHXqdlfmC/oE/7ZVIZAVHJ/aKZAo1w5vkUq2k0OlteL8gNPq8V7Rjjv2njtCUZuhcg
         +z7yBzK7sOz5VAecbsWKod635Zqtg2Lj2OzOBk8rWyx+lsrCIt+PVcO/QHJxBNtd6eVk
         S3oQ==
X-Forwarded-Encrypted: i=1; AKwUvByyo4TvogX9gUlQgkStJOZ08qIvvaEbH1LsOrkeHGs5tf/8+1EmU7bKUXTgeoL5+F5QHHqhxQwl6m8/Ok8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsCcKOMHCf7PpHg7FzNOB1KrxC72g7UP2I7kNWv5kWtM+om7O+
	XWrVzIKb4q6NLkIft7EKFtM49btCePu1Ef9OE4PIDOMCDu2Ym6R6ZruiIas+EWEp4lkCpHjla8y
	YYOc=
X-Gm-Gg: AYBFou3lrz6nMH+/nGL+xSWzV4XBWtxLZ5Z5Xhwn3pW9rdh6dU1lIkxZqsC8E2Zb0y/
	aY30S+wluHZwKnODzORoDl38EuwtuxipbbgpmGu45joENXDCkPpXgnADLWP4zO6GSZQQpzihlRc
	R+bvmTF4cJN6W9CqUW+05bcWcfz5Bkh0h3A9KCwOG1zan6BMlEdQZtg2PbWZl9dj4lg2ktzUOQY
	w3shUF6+6LbE2IGxqMyHWI4h5HxWqMIXW40o6uTXx+ib7Xq6P2m5q67M7vAcDb4oqhbSZATj3L6
	iQcUcmKT9dNhKwU4zZx9IMOHg4R+2+QEOj3Gv1+RqrzmaqDECv7e7PLr5bolZf4UErLIaHgSziA
	V0F+3FrNX2FA2StRXfI4A8Ep5jfOZDSO+f/lL9LlUVzoA0NbsTg0tC4rdIUuG4LUR5sLcaIgX1z
	N9cRG6xGvcPqm8QCRFgVdtL1lRzZsc7poPXTT/fnwg7fObfW58tIFWQ5BlWQ2dH088Ytj/jVdch
	tjpWl1a3myBMncadj03ukp71SLPFlHklFvsv7+LS2Xm2sLLng==
X-Received: by 2002:a05:6402:27c7:b0:6ab:1e8:8b7e with SMTP id 4fb4d7f45d1cf-6ab01e88edemr5588874a12.32.1790612087631;
        Mon, 28 Sep 2026 09:14:47 -0700 (PDT)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com. [74.125.225.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ab5be678b0sm2883748a12.36.2026.09.28.09.14.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:14:45 -0700 (PDT)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff23af865so25722455e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:14:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3owriSTfgWzufGdpyFV5fYDiKY2MqOX5yu8uBBuko+o4HtVG/R+yE+kJY2lMmbT3eUe/zULyo+3fDzbA=@vger.kernel.org
X-Received: by 2002:a05:600c:c090:b0:49f:fd33:ac4e with SMTP id
 5b1f17b1804b1-49ffd33af46mr85097415e9.9.1790612084535; Mon, 28 Sep 2026
 09:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-1-f3999362a9ea@google.com>
 <87fqzp8jex.ffs@fw13> <87wlt13zj1.wl-maz@kernel.org> <87v78l6oha.ffs@fw13> <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
In-Reply-To: <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2026 09:14:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WE-Wn60zTn=nsq4qLis_zjncrS37fND6ehtpuvxYp+DA@mail.gmail.com>
X-Gm-Features: AclHuK9ETuB5rRqTFzisUXaxD45TKAx4fN5yt-CUafFgLF-sfb5ypJ_KbGWMJDU
Message-ID: <CAD=FV=WE-Wn60zTn=nsq4qLis_zjncrS37fND6ehtpuvxYp+DA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Mayank Rungta <mrungta@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 4, 2026 at 8:26=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Fri, Sep 4, 2026 at 8:11=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> =
wrote:
> >
> > The driver change is here:
> >
> >    [1] https://lore.kernel.org/all/20260902-qcom-wdt-nmi-series-v3-5-f3=
999362a9ea@google.com/
> >
> > >  @@ -311,10 +321,25 @@ static int qcom_wdt_probe(struct platform_devi=
ce *pdev)
> > >                if (irq < 0 && irq !=3D -ENXIO)
> > >                        return irq;
> > >                if (irq > 0) {
> > >  -                    ret =3D devm_request_irq(dev, irq, qcom_wdt_isr=
, 0,
> > >  -                                           "wdt_bark", &wdt->wdd);
> > >  -                    if (ret)
> > >  -                            return ret;
> > >  +                    wdt->irq =3D irq;
> > >  +                    irq_flags =3D IRQF_PERCPU | IRQF_NOBALANCING |
> > >  +                                IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> > >  +
> > >  +                    ret =3D request_nmi(irq, qcom_wdt_isr, irq_flag=
s,
> > >  +                                      "wdt_bark", &wdt->wdd);
> >
> > Of course this is a regular global interrupt otherwise it couldn't be
> > requested normally. So this sets IRQF_PERCPU (it has to otherwise
> > request_nmi() would fail), but that looks like a hack to me.
>
> At least on GIC, promoting a regular global interrupt to NMI (or
> pseudo-NMI) level is possible, and Mayank's use case here seems
> legitimate. Any suggestions you have for making this look less like a
> hack are appreciated! :-)

Throwing an extra plea out here to see if we can make forward
progress. IMO being able to make watchdog driver "bark" interrupts run
at NMI (or pseudo-NMI) level is an important thing to do for
debuggability of the kernel. It sounds as if there are no general
objections to the idea. I guess the next step is to make this look
less hacky. Is that something we could send patches for? Any hints for
what you'd like this to look like would be greatly appreciated.

I'll also be in Prague next week for both Plumbers and ELCE, so I'd be
happy to discuss this in person if that helps.

-Doug
