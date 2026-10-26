Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793012361;
	b=SSMS21SmAYEagorqGavRGzTKo8wfecGp7y+lG6tFE2k8eqtufe1ZvG5n86ucqiTnRMX8
	 6e7gwUxMt4SZxOiBGEUzMl7Hs/1XYX/gevWEuZN1uJwkRyt5v5HBoE4P0tQP0NDZdxlPJ
	 WPt6aYevLtIA0eq99AKfpdZ+cvexLy/5nCJZNdw1VWBNhRUWvw+7uF4ha3aWK2+6fN7LQ
	 UAIGPhzo7EYyqVJ219oBMfdI6BnwQi5eaE2aGnM+OM1VwR8x/MluSNHMaoTFyqf0HWeap
	 5fuUqmmY8gPUv/L3lnpec5Kx6WOFSFQNHtzyCl9/CWIiTNpbEEEylFEzgLClSfger0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AGezTdH/BGVGTlUMmaGBhI8YtAvNj4R/9yrQQ0+maDQ=;
	b=nSDoMbdpAtXSSgFnem6hW05bEwLGADetYIWBABStVwNdBYl0BX6HTvsM3FVIbaW44qvH
	 UM49F6sacO5YeFH4HRukgHhZorsWL3f/Js0wYqytTD6pt2eSr06HrzSgDW9LapshdeT5H
	 flb7W0CRNorwR3A+PBhgHY43gnxNC9nA2EuTVJ/KbJjD95f3HFmTw0H0ekz+Fj3QYvU5B
	 LmRHopqrOClrj8cnN6RiLlIl069x5630qwGF+pN0s06j5gltRMb+R4zQWVAlKfulYMS07
	 F61QNEb7aXhAJoikvLcuYLoI8646XVQ+59IDp184epK9Ik9Pnb432boIGrKeML4eG3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DyPawvPd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6C7606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D6C7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DyPawvPd
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso413472066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793012359; cv=none;
        d=google.com; s=arc-20260327;
        b=oAyOWcm+/PCHnV6NScXRMB+LKYkRBAnQNQn6zjdw+V4SMiKon61wv/k523THV4WibO
         K6RIte09r1BEDEH6Os+Kq0o8deXYkx3GrPAANbNKmIMaNkHBwwLbGk9AkYsw+F/8NZ6/
         ecurOm/AUleo354jaGKYaDQ0N7/XLR2zoX2n0CgEgrXBFGXgcGKl/MbETNmm5U7yyS7l
         yinuVpzWFu91TyTs6G9DAmHaR1LKpxiIHsWZWIQrsfIPTiukmkVErxr/WRCW8GNrQp/m
         TwoKZ8NAI5ANe3YYsuo6AyNnFbJj3jBjqpjImAiAuotKDadiD2Pb0KzThi3IgyAVcEEu
         nW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AGezTdH/BGVGTlUMmaGBhI8YtAvNj4R/9yrQQ0+maDQ=;
        fh=BClGaiw3QgM9FGrXe1LM3A6sZjhQ59NtGhSYrd1q9kE=;
        b=JQW9jm+P+SuJxsBrK3etgQdGq41g5E80Zim+GtiyW5jA1XycPUZlGnjNTw20jKrwkS
         UeCIjR29hsqwPmc16mXNDzTVtXSBG73sdIwFk0KYfito3jfPNasanqrn9HVdElBoWyQc
         bK7lCvZWlo1/QlQsb6YskIENjJ6s3ADjVi0MSoyB6ay+Ja2pMJcXEC21SK7I2Id/YxCG
         eigICQF0hYk5DG5fjM1lF26o1G9ah9OaeiB+iIMZajTh4OqcX7fzQEqblc43BVNU9avp
         Jak/bwk0QKBsM8Rru6Vd0Z6ai9ptJM40ey0fUwFgKGvvh7WvIRi58Svvif1ksa55MPZp
         W3hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012359; x=1793617159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AGezTdH/BGVGTlUMmaGBhI8YtAvNj4R/9yrQQ0+maDQ=;
        b=DyPawvPdLZA+/2VQT40qcS75p1VuyCgyKbNWWe1/i4Jnn6zhdb7Z5sGIcVCCBtzdve
         wY+MWGwTyiwmh1jMbTXm/hMxmssgBPKY80B+fg+N4kMxRsexoLJTWfqZAgmVmtoKDIZN
         Tbb54fm41IwBUFBGvf0lX5jW4Ji5On0stoi33OFpy9+4mLy9ONwueNlz5I0b6o4vXjr6
         9lTvlwvI3nXk+I7s8tC/G+umy7MC91YkNkJ4WunVziJq4nd80XNkWjBGEIV6u+EX4wpO
         VIdqIHIV40AlLQTZ8v+rmxT4JWsuL8tU9RrZ/vfE1jo7UsTkJEuFDmvaFcQGR6rl888e
         jK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012359; x=1793617159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGezTdH/BGVGTlUMmaGBhI8YtAvNj4R/9yrQQ0+maDQ=;
        b=QF5wbxBrDPlrih/rVKTGjtdF4GDZVBDFsA0oUYKjt+/8iVYPjxI+SSyKPcjnQH/Lx/
         uDeV9UlYp43X8A9svlrhw5kfkggMqBGOTAnlaKF6A/Z7eUAOZp3nhhz8FNDzFw9VYJBq
         hc7z01PwJVT5LJVdJzJebd9vgQW5RgYHplbVpOKwe/rVUZ9SsblrZFEvLVxfMxOkHf1Y
         yMQZ9B56h8WKl2KaxzneIVKnYZ59gRGWBw3xWl2I9kHm7P3tSbnoL5EzjWUQqWaD2KDk
         yDneXX5VXcnjGQ2j1t9k2Xi45FV0Gv5vWhFAO1/B8R5ZmmcpL+yKhpn+EAm/Vq2sIBQw
         1z4g==
X-Forwarded-Encrypted: i=1; AKwUvByHTEZyNqadPje4zUlKYgClK2n7g2KwpWMd0Mtcz6kgIRjw0Oe1/cTYFXUJuuQka7j6fB8YBEpLYHhsonw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWwX3ApnvgAKaD10O2/9GRgmqYFwA9gOw+zEOl2cr3ngD8fHl3
	3S/odXGN6Mf2JAwAIZrjQrpceHJdwrPIYD93is8TUGuGdgCcWUXOWlKZs44SCYtvwid4NRQfR7Q
	rOI/5R7o3o6bboMLFkhdyCkZQrgrh9MY=
X-Gm-Gg: AYBFou2UiDEt/wS4BqD/HoV9/N4l5YAnXW+JanOyAN2Q4pl4T707VVE09vOO6oRt2Gj
	SdkDdAoAdeY/rWu2JlllEkLinPoXvnG633WcEnIsf+FUO/9002ynUksKefWQWnjf8gpw4K5yde9
	RhSFXlp4UsYFVRRIPCKq2n4E9eYuzUTjRkjVSlPuz2/ksnqr45HOQ/L4P2KaJ0Lb/YOTn8NbVcf
	QMA+TlIAxJI2cKKPsVOMhTfRD8sCvv0MMZzc/Seb8gw0RKOiAFuwRaWVlpbfUaWiahuOBoAhqa/
	KjbmT8tO8TgIPXV39ST0HeK24eKKkFkyCBiHwfahMgLVQiMl0eoWgAnlrgMhkja/Wph73cXGizn
	xG3JCVt8SwwcXbtgs4kaY0Kr+rpAbfAR6IYlYRQTMQbuRhGDm97A9l6wUGywVAD2c4jGmyZU=
X-Received: by 2002:a17:906:794e:b0:c34:cf13:a930 with SMTP id
 a640c23a62f3a-c46bde7eadamr829450366b.34.1793012358782; Mon, 26 Oct 2026
 03:59:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261008-cvs-privacy-led-v1-1-b78d5c512cba@gmail.com> <asjE_UdsewYa4kjz@alaakso-desk>
In-Reply-To: <asjE_UdsewYa4kjz@alaakso-desk>
From: Praveen Puglia <praveenpuglia@gmail.com>
Date: Mon, 26 Oct 2026 16:29:07 +0530
X-Gm-Features: AclHuK9VDEMKyVEvJ3-kD0nYb3I9skZQwkqBvSZv2CuCDHv1Z2D4dG5lwnZqJg4
Message-ID: <CANfatsqw=XxmJvbCPxD9T-=FBwd_h-e4KaEf+Mz5dgtGoK+pRw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: cvs: Leave the privacy LED to firmware on
 Synaptics SVP7xxx
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: Miguel Vadillo <miguel.vadillo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Marco Nenciarini <mnencia@kcore.it>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Gentle ping on this one. It has Tested-by tags from Marco and Antti,
and no review comments so far.

Anything you'd like me to change?


On Fri, 9 Oct 2026 at 16:12, Antti Laakso <antti.laakso@linux.intel.com> wr=
ote:
>
> On Thu, Oct 08, 2026 at 08:39:37PM +0530, Praveen Puglia via B4 Relay wro=
te:
> > From: Praveen Puglia <praveenpuglia@gmail.com>
> >
> > The Synaptics SVP7xxx (06cb:0701) quirk sets ICVS_HOST_PRIV_CTRL, so
> > SET_DEV_HOST_ID tells the CVS firmware that the host owns the privacy
> > LED. Nothing in the driver drives it, though: V4L2_CID_PRIVACY is a
> > read-only placeholder. The firmware then never turns the LED on and the
> > camera streams with the LED off.
> >
> > The host has no way to drive it on these machines either. On the Dell
> > Pro Max 16 Premium (MA16250) the only camera LED that INT3472 exposes
> > is the IR flood LED. The out-of-tree Intel vision driver sends
> > privacy_led_host =3D 0 for this bridge, and the LED works there.
> >
> > Drop ICVS_HOST_PRIV_CTRL from the quirk (quirks 0x7a -> 0x3a). The LED
> > now turns on while streaming and the stream is unaffected.
> >
> > Tested on a Dell Pro Max 16 Premium (MA16250) with v7.2.8.
> >
> > Fixes: 8e2b43d2c10b ("media: i2c: cvs: Add driver of Intel Computer Vis=
ion Sensing Controller(CVS)")
> > Cc: stable@vger.kernel.org
> > Link: https://github.com/intel/ipu6-drivers/issues/417
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Praveen Puglia <praveenpuglia@gmail.com>
> > ---
> > This is my first kernel patch. I found and debugged this with an AI
> > assistant (Claude), then verified it myself on the laptop: quirks read
> > 0x3a, the LED turns on and off with streaming, and the stream is
> > unchanged. Tested as a rebuilt module on Fedora's v7.2.8, not on
> > v7.3-rc.
> >
> > Marco Nenciarini reproduced this on the same laptop with Debian and
> > v7.2.6, and found no host-controlled privacy LED pin in the DSDT/SSDTs:
> > https://github.com/intel/ipu6-drivers/issues/417#issuecomment-599673834=
6
> > ---
> >  drivers/media/i2c/cvs/core.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.=
c
> > index d4a3b9c3ba..3520325717 100644
> > --- a/drivers/media/i2c/cvs/core.c
> > +++ b/drivers/media/i2c/cvs/core.c
> > @@ -72,7 +72,6 @@ static const struct icvs_device_quirk cvs_quirk_table=
[] =3D {
> >       },      /* Lattice NX33 */
> >       { 0x06CB, 0x0701, ICVS_SKIP_FW_RESET |
> >                         ICVS_HOST_SENSOR_PWR_CTRL |
> > -                       ICVS_HOST_PRIV_CTRL |
> >                         ICVS_FW_BUF_SIZE_256 |
> >                         ICVS_FW_HEADER_SIZE_256
> >       },      /* Synaptics SVP7xxx */
> >
> > ---
> > base-commit: 47324d3a5b3abd781295044d01d92d09f184e872
> > change-id: 20261008-cvs-privacy-led-7d0f2327c31f
> >
> > Best regards,
> > --
> > Praveen Puglia <praveenpuglia@gmail.com>
> >
>
> Tested-by: Antti Laakso <antti.laakso@linux.intel.com>



--=20
Cheers!
Praveen =E2=97=89 praveenpuglia.com =E2=97=89 @praveenpuglia
