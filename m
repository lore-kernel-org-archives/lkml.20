Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792426047;
	b=BGC24FVRDzJkwHoxqsGHcELrWuBbz9JwGP2k4tHcGSWXeXNB/okrgMmbISGJn8qNT8gC
	 kL59IlihzTkQd6r5PMPCu8ML+KU54xPgmGzt5p85ffC9qn4faEtIRqWq/XjoOQj+//c2P
	 2xGYirGxw7VlHevIC0c/LtoaGGABb9iGP0TsranPMtGYorTNRxQfQ8Ll8JKoELCI8NH/U
	 nWlF0rDt76T6BZBLcvCwMzOSfXn1aTQodry9X9IHOkpHIt4kj0tAPVEKfLky1LrSQBFbj
	 hPLO5In6UojJgMqoc2RpsdlutHXQqG1H4uYo4ON7wAdpg4koErLyUOH2G6n5AmQhAQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
	b=DCrxaAQ7ZZT3xojoR4soxnOMuycvqyEqdwFOovRDg9IiL6kCUc5USe28LHBdboss0wvv
	 rq+1pCsnzjSAvictlujZYWyHxA5HpO5R+GVp2Caf2B/BjivDSspVXRKmkyWxIJUXTu4Yo
	 O11oPmwQJgmT609fmd6kS4uYLMgUNDKMIdUDj6ZIQe7ADNhvPlnp0NpEnxuuBZyi2R7cM
	 D0ttWoMLXZFr1W5Se2dqlCPXgpdp8NEtqZ+YGFkWIm6w0qDBya3Me5NEmmLHtzlXu5l/R
	 xOna8r7g8SXRPLaz586RoSSAJm5tp080WaT3/LP0KdKovpvd73/jJgVeVmT/78oQAdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IoMtSIzZ;
	arc=fail smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57B4606AF96
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A57B4606AF96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IoMtSIzZ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so4865071eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426046; cv=none;
        d=google.com; s=arc-20260327;
        b=h6T8zawY3cioNDDAfGjd6raiaVDX2G4cfrogkMatpIWjVeC/tJqTTqFmalplDbYr3z
         FvU16A2sni9AgvNZ9vH4/EX36d8riZ5xN+gx+SuqEDx8YdPElGc70VEAC8hPh3RoAaYP
         Kfj2NiBeikYi9JT3dZkMbKo1GFZ6jRwR4xq8yAUJDGcpTs+olXHZXZ1bVRxe5lWq4R+J
         wT862Zr2Wvvcbs4wuxwQoUrHHRtyeugtqpgbb4+RCqOHGDXxpBXYY2+IbQPfPodB4mj+
         lHb83hakHnNz309bCctq6vqgrheJ5Ahd4vL0QIJwJ0zJJw55GwVMtOeyZYBEp8WfyzXE
         cwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        fh=3/badwX3/nVFYFoY7BCexrhQGj51mUA9qMQr/olZAZo=;
        b=cVouyPlm92vh7kd6Fseb2sjjlimLdo6Zjhm3tAfawKZi41KhmVhIEfvN6msMVuIkRu
         eTiwYN2dqD0IxXKNhL/LE6SBCgU4pD/8qfSrhvO4EFpZy8k68olJrHTYB4Olb9w80rtj
         MuRJEVJVAAWI01zPSqv1/+kr9U0DoJl8ZWfeCl+/cmJOllAPVMFILsDKVHZPRic3M25w
         dgMUD+t0koe3qMSMI+ImDI6xk2BIdv9JEVm7UmpqCQdg2mzy1U2JLngJZq71Ymy5/Z1f
         kdlu6hLZYb/g5OS28vzif7ocF6drCXao3mENcpgrgygj0TR+iCnMYHcJY9xbzgoUP2rv
         TEyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426046; x=1793030846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        b=IoMtSIzZ9V1R9FIBfWfd5i2fmLTABAnN9sSr/jsrn3j1VU7yRqgsgxXCplEYoNgeRO
         fUK7dI1I3ae8Eb5LFLibzs1NebQxGtWMGaZRJwucN5STa+gRLx58xI0k4HYcvC0Ye/VO
         Keg80OUbiPn9KRWtob6unTbO9PzP1havbwvm0+KafAeqpiZiq1x9+gzsKwBsN7YRHDGE
         +fao+U49ElPaA2TyrQ06S9zLUjdeLHWSlLv+zvUArfRfkzio6Pc1vZKN7iBSe0lk1wx6
         x6BoiIkbWUwVBbRcQj1KivctyNFUIvn0/3E96/KPE0hTBbC4wX0zPb3IjaLQ4+qdZ35A
         jw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426046; x=1793030846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        b=xFPriebZPF5btcU98I9D08H7x52gJb03fS28oBUNepORmpH8LjUfQzyCGT3y8kXFzc
         Xrw6ziDYQ0MjPjfFXJ8w9xaqiPUJsraoJTGuobUpcWqVqU27YVoSaK+Hebp9pLYoSqg2
         rwsk6a/B4nLnxgm6L/IGX6ioJ/ccYt5Kr6NYrJBhHGvDsjljSGI8NZoXfzzbTRi8ecLY
         cQRcFcf0LKa1DCpq2NYRe1TWr4hWyLvljmVjMmlwWLBcga84xJ0C5/Gs8dDIeKBKJHoW
         OUsiXHAKMf5/0A03Qfkb5GoeFWSpksBxuWLVpRf8EGTbB/YWViHiiO9AA6e2eQB2Yrcl
         M9RQ==
X-Forwarded-Encrypted: i=1; AKwUvByD58BjQ2ZdXiGIS12oXlVmxBghJkb2IvzPwEtMxoNrmiwR0GeE711gLsJUCdYmCzWFBONMpz0hNumui64=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKxH3B0LzzRo+9Q0aXrAmhzKBQmN/D3IuSYlrm9AT2KWI2Oyi7
	9TgBeFmvLWpLA4bQDdrnyT+k70vbrB+QkEXWieVTAhqEBpCuI5/KoSWeA9D8ZybvQz4Kv6c4UjL
	7OeF01bBJ36rJu7RqIoGDGq8qmRP/mvk=
X-Gm-Gg: AYBFou2jWj7S07fAMfnE93lw2yGUByt01MlXmhwUQVvq+7nhtjLgbyqEzLcBNxCS5WF
	pxKqA9Y+lstQ3rRdqd4ZeewiB5/etqbJR0fsTM5F0E2nRtm7DvL145udsF3hd3JIjUan6m49Fht
	0rv55smeGrluJkdoz9XTBBYA+wWWvuawQ+390TOy+KwpkhHgBA3Xl+7bNBcYhQW28sSzldN9ElM
	c6Eg2AVp454rfcBS7RYQpXNfQVHmec+cC3ZcT39KFGt/GmExbxMtRhu1qiHKeOakFVYIw9Q3guH
	C9pIK+xQiU4WdPyRWR6NP6fUo/V4KMhd9X53u9zkCkbSt1ifOGvRrHLxQx6sY56HNVuza63b/YJ
	yVElPNpWWuRA2
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id
 5a478bee46e88-361a2c38d17mr11330019eec.33.1792426045527; Mon, 19 Oct 2026
 09:07:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-2-clamor95@gmail.com>
 <179198322819.839288.5272985130898382430@kernel.org> <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>
 <20261019160202.GE2663669@google.com>
In-Reply-To: <20261019160202.GE2663669@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 19:07:12 +0300
X-Gm-Features: AclHuK9VJmJMQJiC82ERiz5L-8HMq7v4t7pij145Dauw6OWtgiTFIN9w7D539M0
Message-ID: <CAPVz0n2oCKyLKG+pXFw2hAfMTXXSjrwwsFRrhzC24d33LOi-zg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:0=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
>
> > =D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
17:52 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Wrong subject line.
> > >
> >
> > What do you mean by "Wrong subject line"? Specify.
>
> This is a LEDs patch, but you have incorrectly tagged it as `mfd:`.
> Honestly, I would have thought it would have been obvious, hence the
> lack of further explanation.
>

Uh, yes, I have figured this out already, but thank you for
explanation and patience.

> > > > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lig=
hting
> > > > Management Unit.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++=
++++
> > > >  1 file changed, 124 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks=
,aat2870.yaml
> > >
> > > [...]
> > >
> > > --
> > > Lee Jones
>
> --
> Lee Jones
