Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D338237B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532693; cv=none; b=MY1xWLFeU1W3aUxaUXmdza8cfknoTO56yGInqtU8cLZgDhlLET5lXBNsGE0R6nmqlzOHngb3ZDXNZBw8NwaHPdb2cvUJembDbIpNTSo+4VJLdaxOo7ItIwhlTuaDd2qIO1SnK9I1Dd6Fv3gLLDjN0Ty/D2MueSr8ZAqU/KnXSrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532693; c=relaxed/simple;
	bh=JH7KvzgDb3hj1YazwEjzQhCEGqKDsL5tuzoEKmOZ7Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bc6Ajj0D0vxBOsCHM8ECcSBnWN6RMkal9NKc8lXQVT97K9hsoht9kBgBCckJPkjYGxIFYnEU8gDKWVYlaqpnrwcLfDdS1y6TaaXEYAuEDSiHEPAzWsrYRQtp6U62dOj+SLlB5JY10Rsc/NGBxbpPJDV9CjNCNRpTn0EPNPJa8Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AAZqo1Eq; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AAZqo1Eq"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c25b661d37dso154662866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788532689; x=1789137489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=17oI+rSj+VUBq1gOiNZqYe2TLy7jpSRVJ40pUTx77t8=;
        b=AAZqo1Eq290sBuUqQpir3xhjsIRd9vxUkeBxIkZ78ZsUQ1TCwAAcxCl1d1lC2iqoFt
         H1mjlICU4NhFh5Nx5csZetueNhJniAqEoP8cSqLrlSqyGKYcU7GkPnnWXY1s6zpE7qWd
         Fzh97vac2ifuYxCe2gB9pBzGKAkdfxzfQXNz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532689; x=1789137489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17oI+rSj+VUBq1gOiNZqYe2TLy7jpSRVJ40pUTx77t8=;
        b=peHNsfe0VZtkY93mpbCdQ/mW6zOywT0kewu/DwS4eM3O0Hsd44UKHk27Oq7psYnb6a
         cjgwwLlGtPEpEBQnobT5h4xRix6vPeMKf2cSgI3EXbOErFiaKQiJfjLOloHiK8rRezGY
         Dn/VuR4ZpuRzkJ4qlNpFUIwwicga6PnykZwqt0omOILnRKUFAyw0oZOWU7h/MmXkHFl0
         DD8h6E8WvNrIaOSmeeQr958nSY9rEVO9Nzbf04hmE6C+w3NAT18kjT1vaJSVqd/N1og+
         7dyR+HpS+4Fl0PKkpAjbNlDAt+Dk1Q/O1Ljl1OkT/fhtAhcEVzru3878FS2IWD3bn/pf
         3XKA==
X-Forwarded-Encrypted: i=1; AKwUvBzzNj+j0ieQzNtsDFzqcX1LLTQdhuXUIvK6j6rA7+Lq/oO2c3aXBFlIOG3Q0929oVPatfCnQRUOiMLK/Kw=@vger.kernel.org
X-Gm-Message-State: AFuF++mkW4JLCrVmkY68d2/lWMjBqTFyx8iaqs1EHI+w3759ZRfknTMN
	kczXspdTU0sYFRzk1tiwol5i2pN47riEB/slVObWEI9Xu0GF4/8b1O6A/QPiopzvWodTerVriFz
	xDME=
X-Gm-Gg: AYBFou1Sa2rzczUbbquVvHBCVrBd86T9DPWIM0UfPv18fjm2Gx1xOwumUuOrF42COlb
	rBlRThIYNKtn+gdKkw9bIKnDhh0d+MBlzvX77WKl8XQI2OyMelpeZbhRtEaOQny/vX5OcysPbvI
	7qn1eErheX2mxshW54kb4yO80QFSj/EZSKvjnFbVN2evBCvB0Nn7lmyQJ1JiiOmaR1wo3vEr+W0
	GgIj6HkGUbX5lbv9dGi072R4rQWT+wPtV1kef63ZMJEE2p++aKk/D9EEXi8u6gBNqbr4ilqAgby
	Iwcv5o8rNoYLYI2PfWzdeKzOBHbv5pTw2JhW7SttUyZl1LS0py0Cwnl3iTEjbSAcHaP1rM+Oe3x
	ZMy3ITDo8g6cQtJh3RB1xf/kYK5KSVIcfyrEsp7HRzZeGjy5FvUfJDBam2upjGC5uhSsxVR6G0D
	I/9rAWGZ5/iijX6PX/HKA4TtxDjPWb9wkyo0RGQqN/X4lhz2pmbKi1jD7AbrgNYZw4hm9oj53Ow
	OvxprjonLl8y8hGKm5e5yM10e0=
X-Received: by 2002:a17:907:5cb:b0:c25:afb6:2d91 with SMTP id a640c23a62f3a-c260c65c15amr326833066b.2.1788532689340;
        Fri, 04 Sep 2026 07:38:09 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a98efsm116241066b.14.2026.09.04.07.38.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:38:08 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1132910f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:38:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSSYN8P7uI0Vr2MrarU+St+JIphJs12WQptNSSyKzBNjv+a3dnms07sjABn4/Gi8oyiN02SMhWAQZun1A=@vger.kernel.org
X-Received: by 2002:a05:6000:4a0b:b0:485:8c16:a32e with SMTP id
 ffacd0b85a97d-4858c16a585mr3711212f8f.35.1788532686831; Fri, 04 Sep 2026
 07:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-5-f3999362a9ea@google.com>
 <3de593de-6851-4a53-8309-a6bf13e9a8f7@oss.qualcomm.com> <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
In-Reply-To: <CABz7rdBv74pZe6jDRifTKRAKzGZB6L08n81_0gCqF0g=s+FEcw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 07:37:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUyQ4F-HC=cmD9Ay-JHcWJCVDc5BSWRax7a6FRJ_v0bQ@mail.gmail.com>
X-Gm-Features: AcwNN1Wo5IR-SJM2QYyqYIK33CmEpWmvlDIs54NEnTFP7obdj1kaNXFucZN0GAE
Message-ID: <CAD=FV=VUyQ4F-HC=cmD9Ay-JHcWJCVDc5BSWRax7a6FRJ_v0bQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] watchdog: qcom: Register pretimeout interrupt as NMI
To: Mayank Rungta <mrungta@google.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 3, 2026 at 1:58=E2=80=AFPM Mayank Rungta <mrungta@google.com> w=
rote:
>
> Hi,
>
> > > When a system is completely unresponsive due to an interrupt storm or
> > > deadlocked CPU cores with standard interrupts disabled, a standard
> > > watchdog pretimeout bark interrupt will fail to execute, preventing t=
he
> > > pretimeout governor from capturing CPU backtraces before the hardware
> > > reset bite.
> >
> > [...]
> >
> > > -                     ret =3D devm_request_irq(dev, irq, qcom_wdt_isr=
, 0,
> > > -                                            "wdt_bark", &wdt->wdd);
> > > -                     if (ret)
> > > -                             return ret;
> > > +                     wdt->irq =3D irq;
> > > +                     irq_flags =3D IRQF_PERCPU | IRQF_NOBALANCING |
> > > +                                 IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> > > +
> > > +                     ret =3D request_nmi(irq, qcom_wdt_isr, irq_flag=
s,
> > > +                                       "wdt_bark", &wdt->wdd);
> > > +                     if (ret) {
> > > +                             /* Fallback to normal interrupt if NMI =
not supported */
> > > +                             ret =3D devm_request_irq(dev, irq, qcom=
_wdt_isr, 0,
> > > +                                                    "wdt_bark", &wdt=
->wdd);
> >
> > GPT noticed this IRQ is requested but never enabled (NO_AUTOEN)
>
> For the NMI path: request_nmi() requires IRQF_NO_AUTOEN. To balance
> this, enable_nmi(irq) is called immediately upon successful
> registration in the probe function:
>
> For the IRQ fallback: devm_request_irq() passes 0 (not irq_flags). In
> __setup_irq(), when IRQF_NO_AUTOEN is absent, the core calls
> irq_startup(), automatically enabling the interrupt line as it has
> always done in mainline.
>
> Both paths are therefore enabled upon probe.

I wonder if it would make sense to either:

1. Rename the variable to 'nmi_flags'?

2. Get rid of the variable and just directly pass the flags to the request_=
nmi()

That would avoid the confusion. While I agree that your code now is
correct, I can understand why GPT (and humans) would get confused...


-Doug
