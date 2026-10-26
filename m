Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009710;
	b=wYTgmCvHAuvn02AoQPR8cGARNbVtWTuqUCCtVNlTeXiQ/hJVzt0iyUBv0SQO+tuN3CqV
	 CX8OzaVbkwd2P9LpC9qrCwlwGyLYJ2VBObtrRQnTN0tsQY+zbTTiDW6CVQY8paiZvcDu+
	 sMACVuHBrGrE2Tjor6uWXK2DamLYQE/oOx2/9Auu+jfqc2Yqpcam1d/qaQHPMYLzU6ePP
	 2msSHFWYJ8ZPvRFJj577owXd446hsxvbn8uiBZwundYqrmnW0qaPrJS5zcYbw0T6RN/Ct
	 XP4FUqH9V2PrxPBQexUw2QuzPdCk6peyN0KVPlQklSDvdo1vhbOH8dPiDzgZ0UIkNXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009710;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xvHDL7X7nDz4fdHlD/Zd2vVTXXgNDrA1NXktS57i7t4=;
	b=Bo6H6l1ssv8evISlN5ySRwuwam7bISHkBDwWxQ7RvoM7NXG3W0xEr7kMKmtcopkjgHe6
	 roQUNDxJB0ngQf5fVFnB6I/L3dgPq8hzxuuaVxOJSIMMqvWvF+mcteUJvnhI1hzh9zuQ3
	 /atqRB4971Dh9+feZVCkN2AB79bXA5IUD7b4bdfOR4t4dX0JH7kAggmf0rmY2aWVq4d8V
	 eUSFVW47KqayDIuME2uaUJAIakDDkHvyrs5diqoJ1x19Vkc6S3+YgaiAjrxyuN+TDnjXy
	 du24+4QM5DjAbsT2KR1kVnWT0GIjdgbs8u+36P+Zu3GQQtL0Byx4diVo2MpMV76TQ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2F606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB2F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-78fb1fb9508so2893263137.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009709; x=1793614509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xvHDL7X7nDz4fdHlD/Zd2vVTXXgNDrA1NXktS57i7t4=;
        b=twheL1dQqFymXMXtdCe4TeEVFK9WpETTaU0gFh/jNNfkNP1GEt0d7Q5+8ok68HVAJo
         OubnmCjA0jdlF5zkTyO/acCl/Ry3qM1XT1Z9At3VL044Hqgy+V1zOGzB5NAlFncI4Vrj
         twCE1b/pRmP64Dco8/jXQvNyXx9SScHdVZ1EqCduejur5OmmDksPX70QH2c4Mab52Bmv
         R9jRZ4R0p2ftfPDkIB4EPOjKkvgslQh0YAvsYc4oX2DFj5FlF3m72B6xE9hNXWUX55ha
         aab7mx8/+PcSNhrL0c9EYwhi9zikS7AnjuL2mNVZj7YYcbkkWbvYFJQskFYQKI19r4SM
         l6Hw==
X-Forwarded-Encrypted: i=1; AKwUvBxVBCMBnWfjg9el3cNxG3vsDKBo5HvtH/I6mZrGEFUAPuVwQT3bQrasZLEJVt2m8Z5jFMVlcYSUonOt2YY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb6d1PMOc0gIfJ7Vce9onlxQeOIL0lM2QxcW515cAgik0EmlDx
	a1uFyD9T205oZjwZ8/CFZFik9BU9DYI9AEkz4ab0cD8TZbOTpeBbxjrlBkqycsEy
X-Gm-Gg: AYBFou3mdBv8usSysDs4vC2nrfuKrZ9omCrfaOZ9+btG6Cf00WvJcxMfEqUzfuRWSrd
	1+H9rRYnmWdf6pNtBofNqdPEFnWjKUoUj610DbnrT2nUck4aps4fs1/xtzOThSgh7zfFsN6NPUI
	hAc1CzT8bj3sWwIthcKWe92X9/FGBZ+6yQfvyL1UgWjSUpFp1CTYNXynPGaxCVj5/PWXS4fc5KO
	7qb1PPSF092yOuHcYuS3OAksPuJAsKp7Mj5+sTceod2QT8CpOB41hqv1an2DR0bHAC8HG2vI1rT
	tBPcG9Zue9aRt9n1deGgUWcKgyMJszMiiSPH3j7ja3mdZ2b26FVo3nO6guwwbUsbTS0I0FXswnq
	tsB3Grz85/i7PQUCWuCNzZW6qL4uqalegCURRq9YvKTjc29ACzmsHDj+ykCk84xzBkiMWeifSTe
	GEM2cdEHfkXkNBDLmVy19fXlG26Ti8cQPbZhvgRMGGwVHLeIPUBcGVmzsicLxeiSvvc4wrXwqvo
	JX8xa8btZVC/RIkfXEUwtwhH0JHfOKhQ6BSvGJjAXK3nkG1Qqv4nv1gDfvSOckxRaVXpjUYWFLq
	DwyLkeVJmSRkGSSxFDc2Vw==
X-Received: by 2002:a05:6102:3588:b0:7c3:83a9:edc5 with SMTP id ada2fe7eead31-7ce5d239039mr1305007137.4.1793009709198;
        Mon, 26 Oct 2026 03:15:09 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e1bd10esm7013150137.6.2026.10.26.03.15.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:15:06 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so3370087e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzIfGsF69y1/mcKA3zz4RXO88k8m0TTg+G3aE2BbwfruYhAHGel9kt/pGnsr7xECOv/Zevid1qWCmNOoSk=@vger.kernel.org
X-Received: by 2002:a05:6102:6890:b0:7cc:ace:24ad with SMTP id
 ada2fe7eead31-7ce5c6c0026mr1500062137.0.1793009705218; Mon, 26 Oct 2026
 03:15:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261023175919.160103-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <atyKo0pTYZyt5XJc@ashevche-desk.local>
In-Reply-To: <atyKo0pTYZyt5XJc@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 11:14:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8Q9UKrpoZuZfDUutrG=bOwcNWLnht1bufv0YVXJPNDw@mail.gmail.com>
X-Gm-Features: AclHuK_Zae-S6levySXX9MNUVg775ICficux5w8oZYwqHzeoFMa3QGI09OnmK_U
Message-ID: <CAMuHMdV8Q9UKrpoZuZfDUutrG=bOwcNWLnht1bufv0YVXJPNDw@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Sat, 24 Oct 2026 at 12:38, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Fri, Oct 23, 2026 at 06:59:19PM +0100, Prabhakar wrote:
> > Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which shares
> > the RZ/T2H ADC IP but differs in channel count, sampling, calibration and
> > resolution support.
> >
> > The RZ/V2H(P) ADC provides 8 channels, has a fixed conversion time of
> > 20 ADCLK cycles, does not support calibration, and supports selectable
> > 12-bit and 8-bit conversion resolution.
> >
> > Expose the fixed sampling frequency as a read-only attribute and allow
> > the conversion resolution to be changed through the scale attribute.
> > Use extended scan types so the reported scan type follows the selected
> > resolution, and prevent resolution changes while buffered capture is
> > active.
>
> ...
>
> > +static int rzt2h_adc_write_scale(struct iio_dev *indio_dev,
> > +                              struct iio_chan_spec const *chan,
> > +                              int val, int val2)
> > +{
> > +     struct rzt2h_adc *adc = iio_priv(indio_dev);
> > +     u64 req_scale, scale;
> > +     unsigned int i;
> > +
> > +     if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_RES_SELECT))
> > +             return -EINVAL;
> > +
> > +     req_scale = mul_u32_u32(val, NANO) + val2;
>
> But what's wrong with the simple 1ULL * val * NANO?

IMO that looks like a useless multiplication, which will be removed
again in some future "cleanup"...

There is a reason the mul_u32_u32() helper exists...

>
> > +     for (i = 0; i < chan->num_ext_scan_type; i++) {
> > +             scale = mul_u32_u32(RZT2H_ADC_VREF_mV, NANO) >>
>
> Similar Q.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
