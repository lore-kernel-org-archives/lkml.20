Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421778;
	b=QY1LWe3c3jd6nG1VxNUtc3aSX0UucWq5WSh2TrN/BAI4QvNbgK4mRKMhkUjCS7V29IFA
	 xJbRF/KPlObhWxBsM/1SI3XxsSY2EnTcHj1FEM0S3V1qEybcElVX6T0ycvD4SmVHQLcXd
	 0cE6tLMEamYVwHO6O0iZKSM5fwPfj4P6v+cl/KWB/iDq7Gnyp7tPq9QlK3e/2PmmRe8bJ
	 +BY7Oj+V2aCBB5m//9Riw9WL7zGAtZQevNEEhiUm0u1KZNxMb84+ABoACweE8Ug0ucjdy
	 1wLNoVmusLXhFtFLGLKHgfs5U4bD3rQ2dYbVih58YDiJRvlM1MA/ZhvXYGRe/ydPtoQ==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421778;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
	b=ojxo5Woh1T9h5cZFIWRwovDY4zpHr52ahQ6VywtdsdrgP5PpLyihx2NkKGzwfjppC9p+
	 m5anTPmoDbOJYveOc4lKM3HcymZ2r5A8eWfBmFVuwTn/Bt/Y1EaUZB5Gmndr1lXbRmIn6
	 tqx4YXgqQ3/jrF1VVM1rW2j2eKPD+BvJjBrskMbZ/o0jqcUcpgpWWzcuo0yEo2LZ9WxV0
	 sX5Tkrk0KVvB+Epc04AvrG4X9r9NmHfksS2b653vw8YvP32h9ZqVwZ0QbYCaY2xal+6O0
	 RS/bcqPM+2DkMC+dmcOyOo/Qnso1akL5lIWIVmMEodyr+H3vuxdLDbwdrcJ3Qj+jZ7A==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CHbRAuuM;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164EE6072485
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CHbRAuuM
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC336513F3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421778; cv=pass; b=GXPfGfAiqe2fLos2ro9xDomqEiN7jzcNenfpY71Tlfk9+JE4G1xmi31S6s8kHHt655ZUYm/yr72Ki+wdMx/nsWXFHE7NkMqMMoKMi8cSRAFE66v9ZgfOHOD3sC8DKtAZDHwLFbjXrYg5Q2QFT2aimfb9R2E8da8/wYLOwREvORw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421778; c=relaxed/simple;
	bh=ZiWLgE/hDl7NKdkfHl0vrv9PMmfHDU6zMAXwx2zu5ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jN63IN1fy0pH6Q9D/HdkKu+Hv04832RxLfV5Yq1uvMtti1uknjk9iQTpCdjTBfm724UFwP4UhZOCkduJJwWMPospC2JmDFXtDnSSPi/BIlsCbcWSyID1RM0Gafp4HnIRziyhSwsFLVGFRSKPkj2LsVGucHA0fBwpRBz/q/Bca+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHbRAuuM; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f036b17easo117484eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421775; cv=none;
        d=google.com; s=arc-20260327;
        b=CXhrlHGwU/m+YclGa2DhQlRyWh9oSzBlxSD2SjfQMrFXpl6RrdAKt4qgTFnSTkyw/x
         jMQ+eaUc/BDP5NY9lhYPLQsllRH8uRi3jch1XgjCnXixhYZxK3J4tFJCrZI6H1PBQ9vS
         vrSc/d0iJTsE9kEbmj7AcRVP2xCG70jncimH9svNgUcY9JtsyEoVsG7F/kTlq1uz7cgz
         //5U4v2WAo7E3HGvm9SuJk8J8PFtXzngAK9YmFg+DaM6xCi7IrGxTL3RElbYTSSc4VFz
         n5PNkvUoNaomuNftDcwuE1e/OUu+4uHqHRBckZQTiS/NCTkT968p0laVGoCyfoT2IbZ/
         /QIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
        fh=x1JU0u+mzf0Zpr9k6btF1lY1JoBU79R+6mUt/IXrbDU=;
        b=g3w+Jpgds/nm+R1jp0PXiA+/S2GudNGUlrrHnSX8aCCloC+MQfoIi4lWSFriHTV+F2
         Clcu7LQH5phj/U3tNES7Guv5m4vmcYTK+MNE0H5mQnNSgpYOTOANjH/LhCJd0vQ0S2Hf
         E5hnBtzGdNSR2DwDDb24YD6+FURoq/3EXpIX2Bo8OrAB9Zpy/tLyi9pYtypQHveIv6du
         Q9bv+kkSIB/kHoU71FjuX/UHVN3pugqYOfwzI0MhKaz9klTgOm0nmM0umcDx17NC/5zj
         pZLtQf8bApyMoswZK2j9XU2Xfw9uSoUg3ctXuAMY4OaKbzJzyTtLaTHuv+ICG6x5ngMz
         YhBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421775; x=1793026575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
        b=CHbRAuuMRKZCvIY0uPgS4dFur46JM/gE//2fMIqO6Xp7uIF+OTG/zR32b4XVbQxcUa
         sMmGKrFYDLcuTmoeXKppaclS5sd7FXxHQQgn4FRH11egu/i1ag6Ms+JQ2qGa2UMBAo9S
         x0Lwd3Bi/hd9EzYTH6oqyNuNUihONSTkZJaBTlcG5ETg5wSB/Fd9jA9WDQ82uv5Yq3yp
         vJ0wOFgRuczAEqYxtIqSCbvY+vGR/HnwIroqNE7Y3cBw7A9BWYvu/fmo91bHrbLiKAHE
         6V36KMNs/tAl9/sT2h4zAg34rke5sUTugNf3Q7Q/2LwgHHljFBlALwzJ5zP9aCv84wyC
         GDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421775; x=1793026575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
        b=tqVBCMz+4aPAFAZPIka7mEZNh5fnVI60ZfTEXb5QX0bDhWNWuddSMo1ZU5g5vKH5N6
         yOT/WWhluH3c+VigZlzj+oAEgnmj28djdeZBGbfNY9IactXgNGgzkDWMRpmgb54zjMry
         ZgjBYVbHI4BWG9A7HgZl37kYS3Izy2mELUIs8IJLpQ8qCtmTPHEmVXbW0FBo7KGbmsPA
         c6w25PE2YuyWtidX0GIK1qIgdBitmfYkVAusZykft9E7aarFhJj0lakjIoY5I9HOP4ud
         fMdecgRfY/bj6kwxgPeI5+4Cg9Os4rPXTNmNHBjbTqOoZd4YTjlHm/0eymuLhs9cfHEr
         5CTg==
X-Forwarded-Encrypted: i=1; AKwUvBz4TC8UhFcShaq7Kl8TUaHax8yMFlyAo4nFGqjFJz0EGZ9XjFCRW/+MXOu/w6dtmup3Sduq2xQ8pRG8RZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwUPDNeEO6eDJsnB1pv2A1mCQTkX/nM1smj9dv6dCq3uwxeHcU
	pITNhObY5SC43x5wukOwYfmIVq6IMQWrZlQ2AYSqtKmQM4VY9QnQOq5h2uOFyZAkdDYmxsBKNm1
	uLkF5t/dSRRTQwEE+nwjlUJSqGC0fWmk=
X-Gm-Gg: AYBFou2mJx4CgPnVZTSUvex4J6LsB50Br/IU/6a0QTVRqYMsGwTmLyh2xzM3ZziZBZf
	vuh5Qc5dyLOS+8LznO4A8v5v44g/zDoGNutmd9lTjkrkQSRFGsuBk+61A3tZRDX2OPOSnobe0+1
	eHHpJYaMEjs4ZrQWSqsbnc0QxpbqrmQPU4C/tvYBZ9OF1i1GHngcNujapap1UISEiTQQHZDjETj
	zt1U4BU2J9ilMhp62feZ3HxKQS8/SozFWjufiOcfav9GdvWuKMCFzlUKDkp/kNuaFTvaGNPwPi6
	siKd/V6+wJQVy1pdKdusNl+a+MC7zQ8o5uCeaUo1JgmP7J1HuWU/GBtyi1+YLcMqyb/YcP8e3fU
	0aEWHMZe/rZUXM9P6Gy/BqEQ=
X-Received: by 2002:a05:693c:20d2:10b0:356:7ddb:2e54 with SMTP id
 5a478bee46e88-361a2349f61mr12825749eec.29.1792421775026; Mon, 19 Oct 2026
 07:56:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-4-clamor95@gmail.com>
 <179198329794.839288.10569542357230656958@kernel.org>
In-Reply-To: <179198329794.839288.10569542357230656958@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:56:02 +0300
X-Gm-Features: AclHuK-So1fk-SufXF9ELHqjLzJsGlTnieaKofgBf88_CnYDM-h4bTkcCd70Qok
Message-ID: <CAPVz0n3cfh3LcYwARJ-5gkvQZj3cPVG8XGwH+YkPaOrW36cJ-A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mfd: aat2870: Convert to use OF bindings
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
1 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 13 Oct 2026, Svyatoslav Ryhel wrote:
>
> > Conversion of the AAT2870 driver to use OF bindings requires a few comp=
lex
> > changes that should be done simultaneously.
> >
> > The AAT2870 essentially provides two functions via child devices:
> > backlight and regulators. Both functions are fairly self-sufficient and
> > may not be populated on the final board. Consequently, the MFD
> > registration API was replaced with of_platform_populate(), and each
> > sub-device was given its own compatible string.
> >
> > Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
> > was converted to use modern gpiod/OF helpers, allowing the redundant
> > aat2870_enable() and aat2870_disable() helpers to be removed.
> >
> > The aat2870-regulator driver was updated to register each of the four L=
DOs
> > from a dedicated OF node using modern regulator framework.
> >
> > The aat2870-backlight driver was changed to populate all required
> > properties from a dedicated Device Tree node. Its channel map was updat=
ed
> > to use u8 instead of int. Furthermore, because the maximum current is n=
ow
> > parsed as an absolute value rather than an enum entry, the calculation =
and
> > application of the maximum current were updated accordingly.
> >
> > All of the changes above allow platform data to be removed entirely.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/aat2870-core.c            | 115 +++++--------------
> >  drivers/regulator/aat2870-regulator.c | 159 +++++++++++---------------
> >  drivers/video/backlight/aat2870_bl.c  |  51 +++++----
> >  include/linux/mfd/aat2870.h           |  95 +--------------
> >  4 files changed, 121 insertions(+), 299 deletions(-)
> >
> > diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
> > index 0d56cd6fbc6a5..909c14ee60323 100644
> > --- a/drivers/mfd/aat2870-core.c
> > +++ b/drivers/mfd/aat2870-core.c
> > @@ -16,8 +16,15 @@
> >  #include <linux/gpio/legacy.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/mfd/aat2870.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/regulator/machine.h>
>
> Since we are moving away from legacy GPIO and MFD APIs here, does it
> make sense to replace '<linux/gpio/legacy.h>' and '<linux/mfd/core.h>'
> with '<linux/gpio/consumer.h>'?
>

Sure

> > +struct aat2870_register {
> > +     bool readable;
> > +     bool writeable;
> > +     u8 value;
> > +};
> > +
> >  static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] =3D {
> >       /* readable, writeable, value */
> >       { 0, 1, 0x00 }, /* 0x00 AAT2870_BL_CH_EN */
> > @@ -61,34 +68,6 @@ static struct aat2870_register aat2870_regs[AAT2870_=
REG_NUM] =3D {
> >       { 0, 1, 0x00 }, /* 0x26 AAT2870_LDO_EN */
> >  };
> >
> > -static struct mfd_cell aat2870_devs[] =3D {
> > -     {
> > -             .name =3D "aat2870-backlight",
> > -             .id =3D AAT2870_ID_BL,
> > -             .pdata_size =3D sizeof(struct aat2870_bl_platform_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOA,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOB,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOC,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOD,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -};
> > -
> >  static int __aat2870_read(struct aat2870_data *aat2870, u8 addr, u8 *v=
al)
> >  {
> >       int ret;
> > @@ -196,22 +175,6 @@ static int aat2870_update(struct aat2870_data *aat=
2870, u8 addr, u8 mask,
> >       return ret;
> >  }
> >
> > -static inline void aat2870_enable(struct aat2870_data *aat2870)
> > -{
> > -     if (aat2870->en_pin >=3D 0)
> > -             gpio_set_value(aat2870->en_pin, 1);
> > -
> > -     aat2870->is_enable =3D 1;
> > -}
> > -
> > -static inline void aat2870_disable(struct aat2870_data *aat2870)
> > -{
> > -     if (aat2870->en_pin >=3D 0)
> > -             gpio_set_value(aat2870->en_pin, 0);
> > -
> > -     aat2870->is_enable =3D 0;
> > -}
> > -
> >  #ifdef CONFIG_DEBUG_FS
> >  static ssize_t aat2870_dump_reg(struct aat2870_data *aat2870, char *bu=
f)
> >  {
> > @@ -332,9 +295,7 @@ static inline void aat2870_init_debugfs(struct aat2=
870_data *aat2870)
> >
> >  static int aat2870_i2c_probe(struct i2c_client *client)
> >  {
> > -     struct aat2870_platform_data *pdata =3D dev_get_platdata(&client-=
>dev);
> >       struct aat2870_data *aat2870;
> > -     int i, j;
> >       int ret =3D 0;
> >
> >       aat2870 =3D devm_kzalloc(&client->dev, sizeof(struct aat2870_data=
),
> > @@ -348,60 +309,29 @@ static int aat2870_i2c_probe(struct i2c_client *c=
lient)
> >
> >       aat2870->reg_cache =3D aat2870_regs;
> >
> > -     if (pdata->en_pin < 0)
> > -             aat2870->en_pin =3D -1;
> > -     else
> > -             aat2870->en_pin =3D pdata->en_pin;
> > +     aat2870->en_pin =3D devm_gpiod_get_optional(&client->dev, "enable=
",
> > +                                               GPIOD_OUT_HIGH);
> > +     if (IS_ERR(aat2870->en_pin))
> > +             return dev_err_probe(&client->dev, PTR_ERR(aat2870->en_pi=
n),
> > +                                  "Failed to get EN GPIO\n");
> >
> > -     aat2870->init =3D pdata->init;
> > -     aat2870->uninit =3D pdata->uninit;
> >       aat2870->read =3D aat2870_read;
> >       aat2870->write =3D aat2870_write;
> >       aat2870->update =3D aat2870_update;
> >
> >       mutex_init(&aat2870->io_lock);
> >
> > -     if (aat2870->init)
> > -             aat2870->init(aat2870);
> > -
> > -     if (aat2870->en_pin >=3D 0) {
> > -             ret =3D devm_gpio_request_one(&client->dev, aat2870->en_p=
in,
> > -                                     GPIOF_OUT_INIT_HIGH, "aat2870-en"=
);
> > -             if (ret < 0) {
> > -                     dev_err(&client->dev,
> > -                             "Failed to request GPIO %d\n", aat2870->e=
n_pin);
> > -                     return ret;
> > -             }
> > -     }
> > -
> > -     aat2870_enable(aat2870);
> > -
> > -     for (i =3D 0; i < pdata->num_subdevs; i++) {
> > -             for (j =3D 0; j < ARRAY_SIZE(aat2870_devs); j++) {
> > -                     if ((pdata->subdevs[i].id =3D=3D aat2870_devs[j].=
id) &&
> > -                                     !strcmp(pdata->subdevs[i].name,
> > -                                             aat2870_devs[j].name)) {
> > -                             aat2870_devs[j].platform_data =3D
> > -                                     pdata->subdevs[i].platform_data;
> > -                             break;
> > -                     }
> > -             }
> > -     }
> > +     gpiod_set_value(aat2870->en_pin, 1);
>
> Is this needed when 'devm_gpiod_get_optional()' already requested the pin=
 with
> 'GPIOD_OUT_HIGH'?
>

I will check, most likely it is not. I will adjust in v5.

> >
> > -     ret =3D mfd_add_devices(aat2870->dev, 0, aat2870_devs,
> > -                           ARRAY_SIZE(aat2870_devs), NULL, 0, NULL);
> > -     if (ret !=3D 0) {
> > -             dev_err(aat2870->dev, "Failed to add subdev: %d\n", ret);
> > -             goto out_disable;
> > +     ret =3D devm_of_platform_populate(&client->dev);
> > +     if (ret) {
> > +             gpiod_set_value(aat2870->en_pin, 0);
> > +             return dev_err_probe(&client->dev, ret, "Failed to popula=
te cells\n");
> >       }
> >
> >       aat2870_init_debugfs(aat2870);
> >
> >       return 0;
> > -
> > -out_disable:
> > -     aat2870_disable(aat2870);
> > -     return ret;
> >  }
> >
> >  static int aat2870_i2c_suspend(struct device *dev)
> > @@ -409,7 +339,7 @@ static int aat2870_i2c_suspend(struct device *dev)
> >       struct i2c_client *client =3D to_i2c_client(dev);
> >       struct aat2870_data *aat2870 =3D i2c_get_clientdata(client);
> >
> > -     aat2870_disable(aat2870);
> > +     gpiod_set_value(aat2870->en_pin, 0);
> >
> >       return 0;
> >  }
> > @@ -421,7 +351,7 @@ static int aat2870_i2c_resume(struct device *dev)
> >       struct aat2870_register *reg =3D NULL;
> >       int i;
> >
> > -     aat2870_enable(aat2870);
> > +     gpiod_set_value(aat2870->en_pin, 1);
> >
> >       /* restore registers */
> >       for (i =3D 0; i < AAT2870_REG_NUM; i++) {
> > @@ -436,6 +366,12 @@ static int aat2870_i2c_resume(struct device *dev)
> >  static DEFINE_SIMPLE_DEV_PM_OPS(aat2870_pm_ops, aat2870_i2c_suspend,
> >                               aat2870_i2c_resume);
> >
> > +static const struct of_device_id aat2870_match_table[] =3D {
> > +     { .compatible =3D "skyworks,aat2870" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, aat2870_match_table);
> > +
> >  static const struct i2c_device_id aat2870_i2c_id_table[] =3D {
> >       { "aat2870" },
> >       { }
> > @@ -444,6 +380,7 @@ static const struct i2c_device_id aat2870_i2c_id_ta=
ble[] =3D {
> >  static struct i2c_driver aat2870_i2c_driver =3D {
> >       .driver =3D {
> >               .name                   =3D "aat2870",
> > +             .of_match_table         =3D aat2870_match_table,
> >               .pm                     =3D pm_sleep_ptr(&aat2870_pm_ops)=
,
> >               .suppress_bind_attrs    =3D true,
> >       },
>
> --
> Lee Jones
