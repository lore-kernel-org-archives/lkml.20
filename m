Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794204926;
	b=Sy4KhEMeulyejsjUC39Zj5dSSI7taLyijw2Sb8nQUtirDad3cEndIoz+gn06ThASlt3v
	 QauzDAbsOMtP+/LYWXSn+rWeMUyTJswPeEAAQwTwNZNJ6oG73rhhhuGxtpCOpbGspE3+b
	 bk+HRYm1mTjC2hKWWDM+xNk+/5iUaD9MI6c1INl4H8tTkbm6fMJmnaG/R+ta82FAqJH+n
	 +B9fIQBEb9dCEbuSfFEkRZr4psNgoBxhWEoarfb8NAap5djAsIyAfux+ePYLJwsQE1vFv
	 q4/oft8Os6vZMoGhIuaruqrS7nrffkgtt/pR4t3smU3SisSPOgHmy13gfp7mk6Q1GkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
	b=MLoJFeOTJJBoC0ijwKzkrMsXA3vZ+RoyXkMckvVfGCcFzO3vcrP6iAH4pA/QuWSdOCG9
	 5pgzBFJ+Cd0GKCPB23jYI42yuy5I8Bndy9ne9fq2PkXItoWdg2xMEA6+kM8FyXWmoJH3F
	 Tki2sHlb4js9FpouXBWZPkvjTYGn41ne6aRY54zpHkKLtwMchhwjg7TYirF8j6LKj9PKw
	 lSdP5fT9PhRY+1wBdJGq9Z7ARqZ+6iuqcmS0GYdQrNYezhM4DyWK9YaahSIUWbFYs1V5l
	 Sc/FQXPSUtJo2mCZ0RLDoGVPg6a0SE8aBlrPXcYANxCxRcG4h96DLn5Eh9hK7ZQ7Fng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnjAxhbN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BE0606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17BE0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnjAxhbN
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so702031a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794204924; cv=none;
        d=google.com; s=arc-20260327;
        b=rdMEZywTruDo2Z7GA0LlGKHNPO9L9d+D1nEB37CcbAl6tnAbLEqhxmNurEGSvYFR9C
         3N1q/kMyXICv8DH76eb2Kn8SHushn+K9/zzaIHg0nvJBqFQKNlYaDoz6KhFer7gMwten
         W+9aqBlzeFu3TlALIRR5q1U7TRk+noMfp1HRMehIiAZv6RomZOwBwiTRRHDoe/3xvDz6
         oQKS4zCezGm7FOU4WgU1lUoj+YOz2CI1BgrySsKNNugecu8R/45cMX2zojiW3a70EopE
         U4DpmuGENqJqoFH+fSc/JSBtF9ElCHRRnCpEcTsf3yNV/gKH6tUNcNqLCf0FKC2NTc/Y
         QCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
        fh=XnuVgw5ztP64Hxk0s6pA6DgSyXBk6GzGs0Swc5djqis=;
        b=shSYQX50ZvyXRkVAncRtWJSf7wwke1fVzxF6a1M3nEPMT5q4zNQugzOSnIgwNkKkPd
         1AwfflywUP+JkU0dazhVOz03UuDngOoGeUXG5lfVAaTLf5n2LnmSVXaZIjRkYb9PB1fF
         o1QiDc+LxYT02aaX94MWvVuAzcZ9dOZUJ7vf7InTQOWBIKSQn4q67kn582CeocAwDpDF
         sXpXlTcKGczGbKvCM0o7IrkYP9HZF5KO49W+8u8D42NOS4rtrtP/90dxDIsE3oaldPUJ
         X1QwQKVX+HDEaulGVNR4EbEiK1Vpou32w+dAYn3PQabcZQmfWwZ1hAvZaQaHpwUUag6e
         YKeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204924; x=1794809724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
        b=VnjAxhbNIjKY+l3FrLTmF03OxcKJy99I711bzC3orIvQ/IyAT8tKQ1hKmQCwmbXoPR
         NGkudxmIUppfph+Fay5VwyDK8YO6d5x4aT7B195TrKrr5HfSwfg3KS7Q+PAYuhNhEPiZ
         IRenmIGzDopf4rYBDPbHVT/JQiS+FFrkbVxUynpEC1iK/+YOcP6QSwUx1yCz23ybDlcZ
         Y0fYXmWkLUJ0pXjH0yv1XqMBAArtkh8qyC5x2xrKIwOCmyiDeMmIfSUS/ABWouNZWEaa
         H12QVsoGGcFF3yvgGG+8UzKvr2Y9RB3LSzfnt0J6ZOp0TL3PJ3H1uIJuyrSmZaRtmYi4
         Y3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204924; x=1794809724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
        b=Q0WUJpXwwv1yaXAziYRI5WFyRAmjxBCq7ercxRJFXAFU2bvBBwXpaYoIf7W5UDpF/s
         ndVG+OBbwRZsPGT+vdRAoIRXDlKLSwDsNKGFV80pcTIMJGEi2B0zPicY2kr5XnNk2Sxy
         9laSmTd5zrNBlmvbrGQyFQAvP7Q+OYkDmzYJBYiLcdFrZPBAQFNwy5xz6iHY0p4RBE2W
         rvxyGgpBItRBTiXwotlAz7hghxeXbJSMMIE1ISSDLDiEn9KidA3TO6ZHR7Fmy91Qhvv2
         AjufpMvDe0mgXXpw8IiCQPgiITuy1/e9yfjeJjjyXtLkIm17/Jp5gE+WbG4pI/YxaQDM
         K0fQ==
X-Forwarded-Encrypted: i=1; AL+hErHGz+3+bNzP7FvmkkQ/mYrICkVAEaSynTyjibN21bxyX1Bhd6/HVg6pPxQOA8xxKvi8cWmYWQcH39bznss=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n+MAj6/uC+Ahhs3KW4Hp4bt39kJEWi9eZGfR5DTZMCSZH+mPp
	H+nKGFcSIij2BFYu3Hvx1EMQfRqATIh/HQ3RpPveN68sleM/4AMTU5G3j4fHPp0eMRvy//Y8HnZ
	boh4v48719MIId3bBdZATqks1bggrXGg=
X-Gm-Gg: AYBFou316u4BfsPCXgSHaHk05qvq0e9/UshsKCDE/+XQkR65h89dQpmGkizgQV9Q/MA
	uuBYGFke2mpgBOYKOCSrPxiq4edEhDuJQBfps7CABhx4zz3V6V9TR2MnGZwFw2bXDftQnunWaFA
	Wib5YcHxwemXd40dvBtGEoSPqTntASXX39aiXKnfwmQAZq54SL5NLjChD+E/4G8KLuvdKN1j1e1
	WV4JiN6SOzi2mnx/lqgWa/OPufVuDKYynx4NW2S5pn+OCVGOD8JVznLKhrXmYls9FBxHlKTlghf
	HZp6GKXWu2ywxVSgSxwwkd0XW20SrINghTKFMKdd/7mIGTUuS3q06dktArKzY407EKtvFOqTVYa
	tqCI5S3qFWeKZoLZAsOmzbZ9EefeKi4SRw2ft2QLl4lIMMErHFQax2ecn/tAvn2wriXw3xS48W1
	AH2CBxcemi3f2Pd+ssHyPvoQDZCzmAoP0nRnXsRCTFehWSZL7+onE=
X-Received: by 2002:a17:907:3ea1:b0:c2b:4142:2db1 with SMTP id
 a640c23a62f3a-c4d6d842e53mr191712566b.40.1794204924269; Sun, 08 Nov 2026
 22:15:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108095634.100517-1-clamor95@gmail.com> <20261108095634.100517-3-clamor95@gmail.com>
 <20261108205143.134d6aa0@jic23-hlaptop>
In-Reply-To: <20261108205143.134d6aa0@jic23-hlaptop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 08:15:10 +0200
X-Gm-Features: AclHuK8Qn06eeEYq6AauLfpWkIVYBvVrCQiH0heTOHXTTI9POYlOkAaf0cbYYK8
Message-ID: <CAPVz0n3uRoQAN=rk1dHyHMFxueK8Ry0UsDxkxA=jzgGP7Ykceg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] mfd: max8907: Add ADC client support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 8 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:51=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun,  8 Nov 2026 11:56:32 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
> > support for it along with its regmap and interrupts.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> > diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
> > index 35b2ede54f856..cf304afc782d6 100644
> > --- a/include/linux/mfd/max8907.h
> > +++ b/include/linux/mfd/max8907.h
> > @@ -153,6 +153,51 @@
> >  #define MAX8907_REG_MPL_CNTL         0x1E
> >
> >  /* ADC and Touch Screen Controller register map */
> > +#define MAX8907_REG_TSC_STA_INT              0x00
> > +#define MAX8907_REG_TSC_INT_MASK     0x01
> > +#define MAX8907_REG_TSC_CNFG1                0x02
> > +#define MAX8907_REG_TSC_CNFG2                0x03
>
> ....
>
> > +/* Regulator stride */
>
> I'm not sure what this means. Stride of what?  Seems to
> be some offsets in the register address.
>

Regulator register offsets.

> >  #define MAX8907_CTL                  0
> >  #define MAX8907_SEQCNT                       1
> >  #define MAX8907_VOUT                 2
> > @@ -165,6 +210,8 @@
> >  #define MAX8907_MASK_OUT5V_ENSRC     0x0E
> >  #define MAX8907_MASK_OUT5V_EN                0x01
> >  #define MAX8907_MASK_POWER_OFF               0x40
> > +#define MAX8907_MASK_RST_CFG_INT_REF_EN      0x01
> > +#define MAX8907_MASK_NREF_OK         0x10
>
