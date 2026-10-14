Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED57D53B5F3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984997; cv=pass; b=g/Z9X5fI8nxmmgOma/Pj+eq/WwJsqgluET1gi9Q+qMz568eqABNSmocQTq+lJda8wPTWJqe7hPUWQ0y9OToOL7yj7ixjdpvHMfqp9mxmKNdaQbt4BgIjTdb7RuRJ/gIkwQ5vzVrTqtnBmfRO2aXfmM7kqvGuUhSqtkdW1y+Xnc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984997; c=relaxed/simple;
	bh=IT0qggrd1mARJ6zH4Bx5bdn3EzKctPth4DH9TaUm78M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6874NJRoWhSAu1+B6zNj6wGFrtPuhjyv4lmkEjRJj5eqwl/+1AebMjSjEGZvP2aBMDRXMUP9e7Gb3B0hBlwvUuMaNoZ7z8YGs/FileY5Gu0HuSp8qcgR1UsMo7jCNhz5WJAnRdBzFvhWX+0e6HMLOr8uJzWBkrJRGYHIG2cEP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stl97STh; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stl97STh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so1350751a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791984990; cv=none;
        d=google.com; s=arc-20260327;
        b=hOqoK6fVGDBQsg5nbXnumsEG1dNh1fa40A4k+s87Ndx7i6B/h7mWPmeDddrDXMiYvs
         CQ+lNj3OZVVsQn2MweTnNDmUn/AX5ZHJAuuI8bmhJkl4011dQx1U8WyuxZjOvT1F4Pxh
         FkEDvEFULwgtZXj+9JBBT5PR0kRi+SP+O4aVwqUOKWvA2+8fnQIc3FaKCFVIK2OB+PfT
         baSLZ5Sg0L/AedCXKLHYN2Mj+HO0c8JSBjeQsrkxTwj3CBdgQr477sMRTfYQhb+1CfqI
         bO9mMzm+8opGXbLRTy+D/lHIG22zqHTdTWrA6ts+F6JpFj6/S1t3bUA8nCAg7FeB6DyJ
         uthA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WzfJaWITDWTXbAq39l/2Sp3XytY3nCJV7TfZMBMIxVs=;
        fh=RVzR1gh5/tpng3lg4Xk+RqilSLcNqz2C+olyMCEl3+0=;
        b=PS3M3XZe+19Bm1sdJBy2tlXzAbsW7XyXbv6xgZGPfoQk/4iz8mWWNgvzzehc2OjyPg
         vR6i/Jt8Vy2HedFX+flt+1DcmYbFL7+k1ouvBKXA+xzf+kgvi2khuXSy4wSEp55XP1am
         LrJp0JAaqrsunqseetF/+OHot+5OJDY/oZe0DlAuCrrxHzJt2dHZSOjIPyUAfQSBw5+P
         tMkgrYAaBSbgPNIk81/Yz1TLdglXVqSRA3PmyIWtST2xVJUjuYISEWOn6vq/0J59AQ4d
         JXbrZtg3ufqffd1HQ+xXha5y0Kd9a0YBPKojvOy5yROq8W3tGPa3/T+S0ororllXlTAf
         sNgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984990; x=1792589790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WzfJaWITDWTXbAq39l/2Sp3XytY3nCJV7TfZMBMIxVs=;
        b=stl97SThMAAaKpod2Yo9NGY11Ms0uA2KmHC3Qq68BTZNwq3Nozbh/f2/qLMrAmqXOn
         5c3jcejjbE8lC60StZ16+ykubS3dxO4UA8mbaJAzXuJxyXtSlJsaq76+TwUBiP4e4r1e
         dU/C/3Hty3fh34T3Zs/9Fi2kMW1m25XJOHTiIQBU0lrnhQKzQG7rB5xV8L+ArmPMHkpU
         fiV8bpzGHqByTbO9WbfPvQ7BYcEA6kipWSS1PF7J6v/4Jq/o2Ubdc3KyRKFKqPBwQYIg
         5DWLtQ+eA6KjMnd+kEduCPoJ4pBsoSm8bJquOHX7RDzdfh02iwV4FkL1eENDmnG2DET+
         WBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984990; x=1792589790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzfJaWITDWTXbAq39l/2Sp3XytY3nCJV7TfZMBMIxVs=;
        b=Dl85nvMN0lPwgFYbPPumFc4eG08PIU0TQjeU2ww29gA1PgJFcgkQ19chyUF1J0cugF
         GCoivXTAfzV2lpNvB6SkobT3WrrvhZ1MYLHHPqEglWzq+dmoczMSGTrYAdVu6MtorxMV
         jiCPm/VCJk9Np58MCB+AdZ1XhhdzsS26EpdYmzqLJP0aD7uMCb6Ygo7xC/6UV0Pd5wmB
         aAj44OMyzoo8vEWJ6lFa0hmqCEEUlmexkmnv6Q2AJM0jLbQncKK1a1rZwgUFYEJ/25S0
         r3+v1FG9U4ArbsEVLKwOxVFmvKBCPdwUtUij8CTCi2O8xPMMnWDu6nWuHYUxxpc2Hn57
         YUNg==
X-Forwarded-Encrypted: i=1; AKwUvBy/BRjZZf/CgV4FR38ale/jE6VhaRpiM2TXN+fYWQLqUMdUyyUCVII7OcUzhcIu1Pe2nvjXlE71TXcxby0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAD6KgEzZ8UFT8+iODh2Y6ISZk6K4f3QM5d9oxFbdUPURau9+J
	/WM5IsvsYG0dbPMkDolHCvXIILGvYhvS6bqqAuyPdm+wlIdWkPbA9HGU5biTBaSxLMbFaVgHh4B
	m/sMQ7Sp1r5Ki4fVu5VwR2aYbtUpom/4=
X-Gm-Gg: AYBFou2cEVJwy7a+Wpom3eY0p9DzY1sD0jxR+/k6vDwcrIW63tadTHZcW8T4AUlEDNG
	Vue4evb+KRS09Hsee+3e6wKhZyBhnlFOkFy2fxbWXLJs/CNOIHr8JQLi82HeErjH/xaC1yb7YV6
	263Exd+Oan6HYtM1vEdcwxl13Q2423t4QnfJcBj90heC4BWNN645lb42OCSk1+htfgHS26jkS3S
	xL5xgDRHIaM2U2UHGhpTQvwxewTGmqrxOqsexYIf6dXzGdadGziO9g/pLZa1PSQ7CJzaVbs+bFQ
	7hK/8WDuIoztV/H8qlmUgdkvRPMJvLrBvqQF5w2ZsScZxMYwb+DDVtJnxF5IigoJPNCA/eorPFB
	szk1DskABXtkdiHv65mJ6nvV1dSbm7VjbRPjMRc+EW5OnDU3iLpUTCqkql+eK6lAKlToR9YC60Q
	==
X-Received: by 2002:a05:6402:461a:b0:6b1:e37c:135f with SMTP id
 4fb4d7f45d1cf-6b1e37c1669mr5342555a12.3.1791984989802; Wed, 14 Oct 2026
 06:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <as5GXPcMKe-CBLXK@ashevche-desk.local>
In-Reply-To: <as5GXPcMKe-CBLXK@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 14:36:03 +0100
X-Gm-Features: AclHuK-KZvXq9usDlegpOUwMj00FdeLieTauYj8tlmG7JTbxbS1FG7D7z0W2904
Message-ID: <CA+V-a8sec-ZzMKGZJeNA-iXw-Tkt9mcXv7OoziMtjeh23BjOsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] iio: adc: rzt2h: Wait for the analog part to stop
 after a forced stop
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Tue, Oct 13, 2026 at 3:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Oct 09, 2026 at 07:41:16PM +0100, Prabhakar wrote:
>
> > When ADCSR.ADST is cleared to forcibly stop a conversion, the analog pa=
rt
> > of the A/D converter can take up to 2 ADCLK cycles to stop operating.
> >
> > Wait for the write to ADCSR to complete and allow the analog part to st=
op
> > before reconfiguring or restarting the converter.
>
> ...
>
> > +     /*
> > +      * When a conversion is forcibly stopped, the analog part of the =
A/D
> > +      * converter takes up to 2 ADCLK cycles to stop operating. Read b=
ack
> > +      * ADCSR to make sure the write has reached the hardware before
> > +      * starting the delay.
> > +      */
> > +     readw(adc->base + RZT2H_ADCSR_REG);
> > +     ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC,
> > +                         adc->adclk_rate));
>
> A single line (84 characters) is okay in this case.
>
>         ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC, adc->ad=
clk_rate));
>
Ok, I will update it as above in the next version.

Cheers,
Prabhakar

> --
> With Best Regards,
> Andy Shevchenko
>
>
