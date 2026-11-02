Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793639359;
	b=ECavH486qfHD359yiS45E4Dg/Ix5LULJiCOO2JGK3PQfaySzp3UPWd/3BDApZ8iWTUYZ
	 F3Mj/c5nHZV31/3S6DH5dr/WNR7wIQldtOxoJq5VvGR2ZvpzMfJKGb2muzZl12YQSfeKF
	 dYgth2gZsbHbvBNDGENMUese9HgNVxEZwpU6vouGquJnzJ3jj5iRYKh6xpG4BJ11CaqwZ
	 m1QcBB3g/7FHeDTcL54ha/0LSDLnWQmOPOgm3mORSrYhmBRW1HaHl/FgN33XsgloO/cSD
	 QWzXu0QAKd8C79FohG3UNSJkxx70ihCzsyOI0r4PkoIOvuhqqqrkQ9chjn0vScjD+QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D2kI2cJmhka2UbJogvZr2p/l/soLn2HY1MgkmJ1YjWo=;
	b=DLpyL1tRvRAhOEY6xAl9rQpviv5SX/wwq6dM4xJT1wCw9OjP+esyQ3C2xVS/R+/fvfw8
	 rDOgrvNfNTopUPWQIMDO4CLMauaHRgVsJSubmY5ABOxPPtlQGo3JJqSAA8zCGzqeYzC/i
	 KIyy1r7BikzcQYROwWZWiV20hE4wpJWW8RuTjMXzcLF3fHFXiejcdDFSlNltkzzCK1gtZ
	 8rRvage6KkyGZsVCIYyGmI8UzgxKRSPr9OgkFK0oDSl/GH52mgYI6XQqqejo1z1uguMC6
	 bNF3yHYeQmgouFg4yCpO5TYVahQIg/noMloBVU67WSWH1RZ8l/iOOaqR8+QI3gE5uvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qZG/DAP9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4701260716E1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4701260716E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZG/DAP9
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9995ce866so27853445ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793639359; cv=none;
        d=google.com; s=arc-20260327;
        b=Y1DV5lpBLLknBsW2TGVXSK3j2HKx1yxEUFDx/Pl/vXb0LITth1yPqaLq4deAhkiAGr
         BHaHm3tkebebKxdGCMr5d8sMOYbh5TQSp6T6LIK+ThuEKKCZx7Ci4YRKudAQSKi/AMMY
         bIO3e/P0kwfrMWtYEP+ZArcihzxQ0yGoVV0LkeNeyoAaEu4PNr1aei0TyPIXpJu434JU
         BksxnSuFAdpCub0vlvr9xf4XPs4/ZVgJTkuDMTs7rQlXr3BgAkJpJdFN1rwCpydYJkBW
         04vtJ/hnUVcrPmdkyHJzIvfDCjvP9HmukkOUFqHuW4uWHieTd0Pm+1K3fJDcc2gyMS+B
         dtYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D2kI2cJmhka2UbJogvZr2p/l/soLn2HY1MgkmJ1YjWo=;
        fh=VWcsTqUDU/Zjl8jV1uspXxxdDgDIH7SZ7C6laN+t/JE=;
        b=M3DMjBaKRouQw4WT1DDK2xo2FCASah2GCZ8Ef2iHjb30fT57wvFlg5WZWT6qu3OoCE
         wM4kHq4heWbOCzpJ9JP9Gvx0y+uB0BlZa1Jnj4+DZoQtzubzxkkL+iWkMV6sPpmynhxw
         CwUJyNIOokOPPyEAs4RBvtpvC/4y2i93mDniMF1Thh14nsVoew50WjQqf8ittz10hm+J
         wURk2T5TlZeHcjqzfTjcDE8duSrrY6O1ET33x0O6Wx/5ulCARKFPwOx+Swdq+tj+TJDV
         //3e8UF6hj/jXAJF3l/TOicEIohGNrHQZkidaAvATXyeiqeY/dQWpDXsDoLRzhQIui8x
         LHxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639359; x=1794244159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D2kI2cJmhka2UbJogvZr2p/l/soLn2HY1MgkmJ1YjWo=;
        b=qZG/DAP9EpMtV6yowajORYFDYgnMFqjU7gPigRDZ/sYGkfOtenh6u6wxPmZWF6dTEg
         uXKoUdjpSPsjOyt+OSqzJuyhkbL0hI1T7eVHwdUamiSIOgm4PbYONkQgplXW++9CbwVT
         gGckQ1hqD754TK9lLUfgyYikkPgukXiR4PWrWj2FQ97xyAjBVvYooXJS/txtq7LzQnvY
         pQ1fD0aTxuO5/lDX2K1oVxVwIXFbtBxodEOM8NVBtV70Pzw8kAPJ2nMyxXNqbdltxHmQ
         QbK4zpfefwau1qInM6yIzoajMWPEqX0O5DMlCfNGYxtasOfmi+0A14eO1RdlSRAU7Vrn
         rkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639359; x=1794244159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D2kI2cJmhka2UbJogvZr2p/l/soLn2HY1MgkmJ1YjWo=;
        b=CSXRw20MOb8dhlghzdmSiJbvfqa+/NUN/cXfVYCj9jFh5TQwdVuVQJcdObPMwZAEGA
         7weudX6JcaqHe9erljEakDwW+VsFNJGg4wmC5In7lMoWnNWHgDn1N5myXcK40W5JoJUf
         92rCrggKdJZtJeXnMrbblKTlm8TXE7zCDy7VPyFbqI29AbQDX5PL4kcygeaBmCs8mCXx
         6FHrVHARHc18u4XxS8N66WfEN13tovhCr9zz/ZPmLW/QmM7yl9NRJgvoWWLcF8/2cnE+
         8/4V+/GM+3s6HJr2+c9uzXVOMubRazGobN66VRU2eSgR8iZx+OhkKUW0b0oRWNQncK/7
         BIrw==
X-Forwarded-Encrypted: i=1; AKwUvBz9RMUNjc2JOHin060TyIfZDrr9die/6PWoP3HCfQvaU3lIBW5lVuhQ4xwvcZoKFkXf8v1n+72yngckS74=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nPBQ6kZjas4lafF+djI3lMHtWMm1dYMELBnuGxLBtoEN9c0I2
	ehepEBl9t/SD6ZjJ5uNszQzSQW8PMugBDzjsLhXLND0CnuilI28oDOvaJHJAIUXLuiHE+rfU9p1
	R6eQmC22dZLd6SWAwSCKjpDRGMtb2qXI=
X-Gm-Gg: AYBFou0gEodGXw3jZTN0/XR3UMIGrOfELKUOUu9XbCKmghxofWU2PH/R4j3poUpfxXb
	z4mxBQCLomVejjnQ9SiRlLgLzPmZBQasV4M4NoAN7tfm30HQKAHw++RM75/SFqncbPue2RoJ7hg
	2z5xbF5S9yjncf/tQ6fD3X7E4ooCyC0q7XBKy54oMm/BJJZowqpKgAidWtF5T7Ir63Z+1FgNGGh
	Ypwx42B7xcmFh5D36wU5HnnKusVPrfi++hGwl4OuycLA3JUpt3lf5zyG58OWBmxpMx7hnN6BY0T
	hqWTY0L22OY6cS6KlrtZ1/oPEPNG6NyA8Itnt7n1N/H15JLRuhNXA1q9iU0710rbe96dYQPUQVF
	fGw2Jfh3/Q3QULzv8coZ9ZbwVZGGE7H7wVtWxvJyxcx9MFM2ooho6
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id
 d9443c01a7336-2eb36495fe9mr103186595ad.14.1793639358420; Mon, 02 Nov 2026
 09:09:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101223125.302001-1-pmazzini@gmail.com> <20261101223125.302001-6-pmazzini@gmail.com>
 <2c48d47a-85f5-48e8-a675-239b033eb0ce@roeck-us.net> <20261102112522.76e02b83@kemnade.info>
 <54497841-56cd-4a41-9f42-e4e6f9c17b51@roeck-us.net>
In-Reply-To: <54497841-56cd-4a41-9f42-e4e6f9c17b51@roeck-us.net>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 2 Nov 2026 17:09:03 +0000
X-Gm-Features: AclHuK-4o-94Gye_cwvUE8cxTJMD-fDe29dNuoUHFNwsKrrKn9e8LbK9-VQetWY
Message-ID: <CAAxh=jvFn1MfEbmqtQsanMrOzrp_t2L5aX6fBCLzpmRa9=9aoA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while
 the rails are on
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andreas Kemnade <andreas@kemnade.info>, Alistair Francis <alistair@alistair23.me>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, I will explain it in a comment in v3, including the limitation.

On Mon, Nov 2, 2026 at 2:43=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/2/26 02:25, Andreas Kemnade wrote:
> > On Sun, 1 Nov 2026 19:35:16 -0800
> > Guenter Roeck <linux@roeck-us.net> wrote:
> >
> >> On 11/1/26 14:31, Pablo Mazzini wrote:
> >>> The driver enables VCOM at probe, which keeps the panel's high voltag=
e
> >>> rails on for good, and gets a dummy regulator if it probes before the
> >>> regulator exists. Read the temperature only while the rails are on, w=
hen
> >>> the chip samples it, and return -ENODATA otherwise. Read power good w=
ith
> >>> it in one transfer, so the value can not be from before the first sam=
ple
> >>> or after the rails went off. Register it under the chip name, as the
> >>> TPS65185 and FP9931 drivers do.
> >>>
> >>> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> >>> ---
> >>>    drivers/hwmon/sy7636a-hwmon.c | 25 ++++++++++++++-----------
> >>>    1 file changed, 14 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hw=
mon.c
> >>> index f01f368d68e5..475aff997c2d 100644
> >>> --- a/drivers/hwmon/sy7636a-hwmon.c
> >>> +++ b/drivers/hwmon/sy7636a-hwmon.c
> >>> @@ -14,7 +14,6 @@
> >>>    #include <linux/module.h>
> >>>    #include <linux/platform_device.h>
> >>>    #include <linux/regmap.h>
> >>> -#include <linux/regulator/machine.h
> >>>
> >>>    #include <linux/mfd/sy7636a.h>
> >>>
> >>> @@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum =
hwmon_sensor_types type,
> >>>                     u32 attr, int channel, long *temp)
> >>>    {
> >>>     struct regmap *regmap =3D dev_get_drvdata(dev);
> >>> -   int ret, reg_val;
> >>> -
> >>> -   ret =3D regmap_read(regmap,
> >>> -                     SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> >>> +   u8 buf[2];
> >>> +   int ret;
> >>> +
> >>> +   /*
> >>> +    * Read power good and the thermistor in one transfer: the thermi=
stor is
> >>> +    * only sampled while the rails are on, and power good comes afte=
r the
> >>> +    * first sample
> >>> +    */
> >>> +   ret =3D regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, siz=
eof(buf));
> >>>     if (ret)
> >>>             return ret;
> >>>
> >>> -   *temp =3D (s8)reg_val * 1000;
> >>> +   if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> >>> +           return -ENODATA;
> >>> +
> >>
> >> I had a look at the datasheet. It does not say anything about the
> >> temperature not being measured when PG is not set.
> >>
> > That is what I read from there, too. But the PG bit will only
> > be set if the On/Off bit is also set.
> >
> >> The datasheet does suggest that temperatures are only measured
> >> if bit 7 of the operation mode register is set, but that is
> >> different from the "power good" bit in the fault register.
> >>
> > I can confirm from tests that temperature reads zero if regulator
> > was not yet powered on.
> >
> > I read the datasheet in that way so things happen it that order:
> >
> > 1. on bit is set
> > 2. ramping up voltages start / temperature sampling starts.
> > 3. after some time (sampling time + conversion time (ADC_SPL+ADC_DEL)?)=
,
> >     the first sample is ready and the temperature can be read.
> > 4. after some more time voltage lines stabilize
> > 5. after 1.5 ms PG is asserted
> >
> >> So why the association with the PG bit and not with the On/Off bit
> >> of the operation mode register ? That warrants some more explanation.
> >
> > That should definitively be commented in the code. I have pointed out
> > races earlier. This has of course the drawback that it limits the time
> > frame in which reads are possible a bit. I doubt it is worth dealing wi=
th
> > synchronisation code to use that on/off bit (although posssible).
> >
> As mentioned in the other mail, downside is that the temperature will not
> be reported if EN=3D1 and PG=3D0 (for whatever reason), even though
> the temperature may be available. At the very least the reason for
> accepting this limitation will need to be explained in the driver.
>
> Guenter
>
