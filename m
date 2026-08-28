Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0067337BA4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942624; cv=none; b=Xrldf7I8T0bjbWtMiYVHiFmK+1rMyzqJhRmGVItABdzS5j83JhHC8wnaUZpDyFUwWpPIh51ak3mvUt9qJsIVpZkKVGkRrfcycDPlOsKVM5aNsD6aBHjPCyz1sNqEHMsscYRQizW6dR86TG7FDuu7qxqNSnwmNZi4mmSbh6Q+vRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942624; c=relaxed/simple;
	bh=uFKQ0s8xluJy9Zpcg8C1QnUtvrA1YtXx82Hhup22bbg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=maV/fx+E1z0yjKbjXTKUTfBxWIeI9d4kIhobWlWEP5qldoNEupiCJdk533JmaRfCKRVVXROhx1rRMDqP9Yy+jpq7gO8hs64EzYAmXbf/O9ukSl3MPBBBeyqxvApW1QQ9m6y8y0qGZ98qHyZIbICpFFBz4bQWOuq9Kw2L1j3thu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FhXnOduq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FhXnOduq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so10159725e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787942621; x=1788547421; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=94qIvbYZT++RxO/2P31L+sX5StAbNx1nSTIfspZGHEQ=;
        b=FhXnOduqEF3YvJD0kvRFTHXn8KfpF4aUICteto21b+KRBJBlQyW6lpF0NBgFMkp1B4
         Mcx+yydNQ9G/Y9Z5GPVVQF3fbWxv4NqWkSOt81gvmosJMO3Y1NbzSrx70gHuFxJAzlzU
         EwGojidVnyIJdFQatgeFX7jXylxPa76U2cgF0Y+/cexULQdG7AYJNHkefVNtisctJEU1
         Ax2QGUsaIah7F/llgnimZ+hK1CuXmO2UC+PQp7NgbNrM5Uk89W9LMyfAbweQQMtmmSWH
         A/DeaDbyTYWoTojGe/CF0pyWRC8qoBnUhdFr4cJAqOlLMnrMqDDj/YDXfOesHUK02SGN
         M8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942621; x=1788547421;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=94qIvbYZT++RxO/2P31L+sX5StAbNx1nSTIfspZGHEQ=;
        b=BVNvXG5UgdEZ8HNWrxO3EXV5NTBXWVQ8gCIE9mi9NcvxIu7US7syycRzVQyyKK3AmB
         Glf/HSICvqgPe/+objrbJvGqVM5ZMW4i2ud1KtGog8I5gZdMKUILc7xdl2SAOHx56mv2
         TIoyy3LLzvJNBvR18s2gCSfaK8IB96iUaccMh4410bk85IgTUBYrhl9asOTKcNya87Lz
         059ysZ/qyKqcLNNSm2ha9KfGMacz9jzGwXGQIrg0QCIb8GPCw88NldmFPV+v/2w/4tsZ
         Faq8m1/mUQef2UnRM/l22ExrWMzdj0VQc2B5jMlmOudqYATLUoNuPfgowZ4WRsQXdCjv
         zwnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpT+lG9Ro5I+Jd4CeW97XNsbQ8wzRqNwXvS7v9Xrw6CP41f8PuDBp1vg7wY6Tcl6193AtYm7tuhh+982lw=@vger.kernel.org
X-Gm-Message-State: AFuF++kJVSXKu00mh5T4eQoDtXgngVb0VggaGkJwVgn0e/U2g6tmePal
	IyMqVGcopAFnl3tG0B40qZcoccbT4N+EFquTc9hxUVffbyKoWPPmzzGNNPfn5PhS0t4=
X-Gm-Gg: AR+sD10ylSpuXBATyFvZEDj+42uN+O3KjYfBpGo1s75lAlrUieV3ERc6cgMuDijMvH8
	Zc1MC16PKVIei0CnpB589YzBAaQ4GDRtadREuBLce4GdZSKKTGDQwJwSIFn4fokYKTOrb70BaiF
	+k6Gskqvgbu6O7OmkwrXWkZGnKhONo0jY71XcAyiVFWzt66SsUECbOZFZB2R1H1NXWNNcFeco14
	YW47Ze+EjVzgSJ33uv72BXAbGnjG7DSs8P3ypfdhmwlDyyGOkPY3NvMVHsmifKfjPTPdA9UM2KI
	/Vo88/aFBhDwBRUKX5blWP8pOWJ/KJa6eWhjm2K541a5pISHdJnK13BSb8ezbl33OtuC8PAEMaE
	0swLpdd/KeH4gaw+EEwPDbcZ+3DoHHdfDg28Kzp6gg8x6d5/sLPnwWsyurJQv8en1+EHxdkv2RW
	79IxsbcMsAXHuC6JHX+kCRA6jxNqJnDxP4E0zPLdAbG7f+crAyXt4Tg1eI
X-Received: by 2002:a05:600c:1992:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-49b91c1fc56mr135192265e9.1.1787942620290;
        Fri, 28 Aug 2026 11:43:40 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm85816455e9.8.2026.08.28.11.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a7aa0324e835eeeaba0f23eb03b67331f6e5a492435f41d33f1303199557;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 28 Aug 2026 20:43:30 +0200
Message-Id: <DL0SRC0352S9.2VXHSPLXP6QZR@baylibre.com>
Cc: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>, "Vincent
 Mailhol" <mailhol@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>, <s-kochidanadu@ti.com>,
 <a-kaur@ti.com>, <s-tripathi1@ti.com>, <vishalm@ti.com>,
 <linux-can@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: can: m_can: add out-band-wakeup
 property
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Conor Dooley" <conor@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260821-temp-v3-0-9ac1f8806929@ti.com>
 <20260821-temp-v3-1-9ac1f8806929@ti.com>
 <20260821-regulate-recharger-2e984e9591ef@spud>
 <20260821190511.jwdgox4uocbf4brd@uda0506412>
 <20260824-public-mashing-252473f928c3@spud>
 <20260828-antique-lumpy-donkey-51ff42@quoll>
 <20260828-ladle-hurry-d6f63c45fd19@spud>
In-Reply-To: <20260828-ladle-hurry-d6f63c45fd19@spud>

--a7aa0324e835eeeaba0f23eb03b67331f6e5a492435f41d33f1303199557
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Aug 28, 2026 at 5:46 PM CEST, Conor Dooley wrote:
> On Fri, Aug 28, 2026 at 11:07:29AM +0200, Krzysztof Kozlowski wrote:
>> On Mon, Aug 24, 2026 at 05:50:20PM +0100, Conor Dooley wrote:
>> > On Fri, Aug 21, 2026 at 02:05:11PM -0500, Kendall Willis wrote:
>> > > On 17:45-20260821, Conor Dooley wrote:
>> > > > On Fri, Aug 21, 2026 at 11:07:00AM -0500, Kendall Willis wrote:
>> > > > > Add the out-band-wakeup property as a possible property. The pro=
perty
>> > > > > indicates that the device can wakeup the system even when its po=
wer
>> > > > > domain is off.
>> > > > >=20
>> > > > > Signed-off-by: Kendall Willis <k-willis@ti.com>
>> > > > > ---
>> > > > >  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 2 =
++
>> > > > >  1 file changed, 2 insertions(+)
>> > > > >=20
>> > > > > diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_c=
an.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
>> > > > > index 2c9d37975bedd652b3060ab11ba75c37565edaad..0663beaa532bcc4a=
71cd6ad01520a4dfea294d0c 100644
>> > > > > --- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
>> > > > > +++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
>> > > > > @@ -150,6 +150,8 @@ properties:
>> > > > >      description:
>> > > > >        List of phandles to system idle states in which mcan can =
wakeup the system.
>> > > > > =20
>> > > > > +  out-band-wakeup: true
>> > > >=20
>> > > > Where is "-wakeup" defined genericly, or out-band-wakeup defined t=
hat
>> > > > you're getting the property definition from?
>> > >=20
>> > > I sent a PR to define out-band-wakeup in the wakeup-source.yaml bind=
ing
>> > > in dt-schema repo. I figured it made more sense to be defined in the
>> > > wakeup-source.yaml binding to allow other drivers the option to use =
it.
>> > >=20
>> > > dt-schema PR:
>> > > https://github.com/devicetree-org/dt-schema/pull/205
>> >=20
>> > This sounds like something you should be able to determine from
>> > device specific compatibles for these platforms. Not sure why they are
>> > not used for this particular device, but this is an indication to me
>> > that that is a mistake.
>>=20
>> Yeah, it looks a bit too much replicating Linux PM detail. I can imagine
>> that some devices on some board are capable of waking up the system even
>> when power domain is off, but this does not look like a capability of
>> the actual device, but power domain. Device does not have different
>> wakeups. (by device I mean this individual schema - Bosch CAN)
>>=20
>> Happy to see some bigger picture through DTS or board layouts. Actually
>> DTS, showing same Bosch CAN devices which are different on a board -
>> some are wakeups and some out of band wakeups - would illustrate it
>> better.
>
> As far as I could make out when I looked at the patch, "Bosch CAN" is an
> IP that can be integrated on an SoC rather than a device on the board,
> so I'm doubting that there's any difference in capability to wake up the
> device caused by the board at all. If there is, it's between different
> power domains on the SoC, as you say.

m_can is an IP that can be integrated on an SoC. But it is also
built into external chips, like the TI tcan chips that connect via SPI.
There is also a PCI connected one. Also some SoC integrated m_can
devices are coupled to the mcu and not the main processor and can't be
fully accessed from the main processor, e.g. they are missing
interrupts.

Best
Markus

--a7aa0324e835eeeaba0f23eb03b67331f6e5a492435f41d33f1303199557
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapHW0hsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPK
jQD8DHnq+T1G9nCDq2EMC6Svj7CjJU7Mv5RnfGSyRke5RHsA/jG7hRjq7u2Ym8Y2
DkeSrpmFP4mDOYR5dccQlapP16UB
=hadu
-----END PGP SIGNATURE-----

--a7aa0324e835eeeaba0f23eb03b67331f6e5a492435f41d33f1303199557--
