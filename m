Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793820732;
	b=yAik7D3nCVaI/AP9rJaUCV1yiPZg4yTm73u5DWR5Xr/RJsN8orjDESNhIGT8vBqXJn1W
	 /ORSGsqRPW3IQWb5YXtuS/ZNN8gNsZbfSDHXcVBZY/l+WyWhTowoZ+5YMd0g3mCpdLdoi
	 wNIuF2a6kKShsIyqcgNgxlnnG0+QmMbZifWqFrLsSGtIvJ2vEuSBMH4aNoMCuRirREduA
	 227u3L+xWoK8Odlk1vvb86KViOJCRGu00Uqom3QqKRz2wSIGaoDMbGuP1g4ByN8SCWvik
	 BuNq6vUvxL409SvWyMocZBbaA5vToyP9eKRlXdqwrUoxSV8TLNGRYT/cSrXimfYfW1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
	b=vTXCxYDuXcCztKcn/k7XxdhEl2WITWvfAYVjK/ZriFxrnvC4qlzfIjMhbBGtJa1Z640n
	 lhXIX0xl7eIYHf+vfEBDzazz4iOIYic9QEAY8W9PoKtEcbdj4VFkOh4u9NZkYiHCiGb9p
	 RKImeMgC5RxHB6ht7V0XA6GSJ5KWdzeGEllzO9fVZibgQsBbOKXgjQbWTETbT0rM9ct0d
	 lbIj2l5n4a1AfuaT3L7zIpopDleea+mbI2PA9u610tAaK4vtd4e/GJoE0e2D4biHZn5Ca
	 WEWCVnvtd949YxPK3BnS4ZLwd7NLkm7dwJKEOvzS+GO3Au3q/6iBRpQ08Tc9z4XldBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBjDeZwg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B650F606D16C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B650F606D16C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBjDeZwg
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so493155a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793820731; cv=none;
        d=google.com; s=arc-20260327;
        b=e1tebuAu3QbpCK86fZhjEgx6W3zY4/Jpcgol0QvMcMsaJuthGl/xW0XTRU8dN5KWft
         vDMdqD4XIe4wDezG8h1XKaiIh6hOw3JROxsAzNsOn7GoQBnYGeDKQJNDJnJ2NlzbkvM7
         97r3WHAZNdQlrIBKMK2elYrpai7GzokC9h1YhgmFw+sUsnfOpxbo+97/dFIRSK2U1gbo
         HvgxLzycmcT9BXGioxcFIukN/QQjOO8wHZIbf/42vIdNmArDmq6qw6p6lpiV+FDpgBBD
         XMs0WOR5fxEqOdeqwXutTg2AZ4J+dtTrmaOH4Jprda2tMgDwUkNuR7p9bEcT+Q9iY0Ta
         b59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
        fh=uYCHCh1VJiMYYsBpBOOMhTFLHBqcXxlQKmfw0YKXQrs=;
        b=fpOC1Zh+59nFOnKTv09dXYzS7o+R/SY9OCKEb5sxYs64RycatgwAq2hoKcL5C3YBfV
         vR9F9sh/XDXyo/r3bXVKgIQfYGhm/qU+KWjLd14w9gGcq8HXj0PtsqCkYjCs3vIEMvUY
         chwJ3rOurSqORTzYMolXtmcfAi5o30SdyEClVno3YrckOO6TWsEbIYA0MVhOu0rN2+ID
         u63AOJFtVT9MRhYXd0Af76EwLYfjlX18h6A6yqe84HQ8imMM15tKf3I7Ec1pKGSGRxiL
         MPmULfrVMMinOnzZsoFN9ZZN4a7HixBgQfaadng5IHZfBzwyDI8CdyVQfy2Zx20mhDR2
         iFCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820731; x=1794425531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
        b=lBjDeZwga7mGWRX50cxyouzQX9R/oabQ4gMEvGHsC/zGTM7cH8KABlfArCyy6+MG+H
         HWj/y0q40Oc8kfYFQEBovfOpgUcSTIpczlit+411W6H0lo7MeoN5z4X4QUpqL4Vwae3r
         wfcpSB7xrmBoxAAflkij3BX5LfqwJXG1ybLECSHUXLqXXhED7SgDMTnrCr0DSByp4OGU
         IIsxiQNogY1X/Yu3Y2dvI7ECHGp1VmIRAeqCybKWIjMyHcMyZIbVDuvgmR/hpxLiKP4T
         SZvX1fv7OKMWVqlNBn0TyunwvdbedsO58kp+18kIrr0xLoXsjeUzCV+LhctYZHEcTz32
         Jz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820731; x=1794425531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
        b=NWzu8GxK8SdzEvGS36JoUPNPCINanGmYiRfEZztB0YhnRkV7szd6hWWa9SZnGbs8Yz
         oeyD+VeTtMXtU5gmmrP+n5MGHXcJZO+EOMQguuZ+WKpxzcIMJvM4OyDsM8v+slQYOItA
         dnBdS3kvpw5HMcBOBhIB1emy+TlaPVKncMNwbY6wcu/s171IXd38RpGOSDeZeX/yx5+V
         O9dEzgB0CzOcEpCkk46R4GJM7TPBo6FGZtu7jgecKV7AbTnlsumZTZqlsSi+n3PpBewg
         UTlr4mHRyPy2/yn2oKDNtIo5pSx9AgRlDy+SpiATGtun/EdnafahYIfuloab3cODMK/4
         ypEA==
X-Forwarded-Encrypted: i=1; AKwUvBxNOPBVp/rkx4gYakQmXT4xc92G7B43t6UcjVapbBlbZHGPvO2ZiizEG0IZ4ZdcxxJqcw9BS9+ffcI9eOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MdUbxVv98ELo4hAxC0PaY7LqgRDCL3yxl5/Lu0VbXpuHa8eDm
	R2ItGeLtImA/fvgj8qUtrVUiLC5Mz7EnAWdOz0GLuKyp7pJi8ujTLNQfjAO4ZlTK+szSakaO/bf
	UC48DpDxiJqRzl8N9O49XrAw9KV3XrfYLKasbX7eEgA==
X-Gm-Gg: AYBFou2Giy4F1ujUzqN1yFCNIlBki7ahtHB9o+TbYpDv3ybqyIapPnucsttGgM8yLva
	N9GfpGX0ivdnNMQsYkdyEyoCiXAEHgBl79UiZf60HinnlbMby9/3UPzopnuSLoKFvJjZFA6Qmjm
	w3z6tCEZ6hWMJEVzuml9m1wbmTDQHB4kbcmhI/LBFf+Cb7aaKPer4GcZnDNjCbYICxw0X5f8sW3
	shUnd+PZHPdRHUXXxFl29prZWgtVw++oaMchYisDMJA4L1XafaZ83gilc1wUI4i//Rqc2x/RgBV
	mIEAx2J0xfKeYsNz5GdUrcmKYpKVVKU+VcZnqbZBh5MTsvCIYv6drWEzYSrabyRA3YREOYfjzjd
	1+pScfYxGN1WJMQsTEN/F0Cx6sFybU/abRKy6m78g+FjSEW9QGwB8
X-Received: by 2002:a05:6300:6301:b0:3eb:3b69:77d2 with SMTP id
 adf61e73a8af0-3eb3b699956mr8004490637.37.1793820730833; Wed, 04 Nov 2026
 11:32:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101223125.302001-1-pmazzini@gmail.com> <20261101223125.302001-7-pmazzini@gmail.com>
 <20261104192845.41b086ea@kemnade.info>
In-Reply-To: <20261104192845.41b086ea@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 4 Nov 2026 19:31:44 +0000
X-Gm-Features: AclHuK_sPS6tNsygd2RlmqWR3IgNt41nRWT_eWvnGH5AVKDifX_oDkfFeu2npZs
Message-ID: <CAAxh=jtn2W91m9RUQqN-o=FEr+F9H2gdTKgE5UQ+MQX9w_QDWg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] regulator: sy7636a: bind to the I2C device directly
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Nov 2026 19:28:45 +0100, Andreas Kemnade wrote:
> we need that regulator enabled for i2c access, if Patch 5 is merged befor=
e
> this it will happily try to access the device without it being accessible=
.

Right, I will move this patch before the hwmon read change in v3.

Pablo

On Wed, Nov 4, 2026 at 6:29=E2=80=AFPM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
>
> On Sun,  1 Nov 2026 22:31:24 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> [...]
> > -     ret =3D devm_regulator_get_enable_optional(&pdev->dev, "vin");
> > +     ret =3D devm_regulator_get_enable_optional(dev, "vin");
> >       if (ret)
> > -             return dev_err_probe(&pdev->dev, ret,
> > +             return dev_err_probe(dev, ret,
> >                                    "failed to get vin regulator\n");
> >
> we need that regulator enabled for i2c access, if Patch 5 is merged befor=
e
> this it will happily try to access the device without it being accessible=
.
>
> But it then is just another error code than ENODATA.
>
> So if that is considered harmful,  probably this patch needs to be reorde=
red.
>
> [...]
> > --- a/include/linux/mfd/sy7636a.h
> > +++ /dev/null
>
> but if it goes in first, this part will make trouble.
>
> Regards,
> Andreas
>
> > @@ -1,34 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * Functions to access SY3686A power management chip.
> > - *
> > - * Copyright (C) 2021 reMarkable AS - http://www.remarkable.com/
> > - */
> > -
> > -#ifndef __MFD_SY7636A_H
> > -#define __MFD_SY7636A_H
> > -
> > -#define SY7636A_REG_OPERATION_MODE_CRL               0x00
> > -/* It is set if a gpio is used to control the regulator */
> > -#define SY7636A_OPERATION_MODE_CRL_VCOMCTL   BIT(6)
> > -#define SY7636A_OPERATION_MODE_CRL_ONOFF     BIT(7)
> > -#define SY7636A_REG_VCOM_ADJUST_CTRL_L               0x01
> > -#define SY7636A_REG_VCOM_ADJUST_CTRL_H               0x02
> > -#define SY7636A_REG_VCOM_ADJUST_CTRL_MASK    0x01ff
> > -#define SY7636A_REG_VLDO_VOLTAGE_ADJULST_CTRL        0x03
> > -#define SY7636A_REG_POWER_ON_DELAY_TIME              0x06
> > -#define SY7636A_REG_FAULT_FLAG                       0x07
> > -#define SY7636A_FAULT_FLAG_PG                        BIT(0)
> > -#define SY7636A_REG_TERMISTOR_READOUT                0x08
> > -
> > -#define SY7636A_REG_MAX                              0x08
> > -
> > -#define VCOM_ADJUST_CTRL_MASK        0x1ff
> > -// Used to shift the high byte
> > -#define VCOM_ADJUST_CTRL_SHIFT       8
> > -// Used to scale from VCOM_ADJUST_CTRL to mv
> > -#define VCOM_ADJUST_CTRL_SCAL        10000
> > -
> > -#define FAULT_FLAG_SHIFT     1
> > -
> > -#endif /* __LINUX_MFD_SY7636A_H */
>
