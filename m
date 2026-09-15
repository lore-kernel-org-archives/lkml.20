Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BBB47ECFE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466407; cv=none; b=I34ftm2ikj1w+zVD932wZ5r3xqu0fPewh7VwRFrEFJ1C5uBMonttK4kN6qH9acS6X58YFjcMqQv9Z8a2DwSMlNubG/Aelk2Tfuq2WCJVmSLnlILlrGir9F5a7B32X27OUlP0gPa0MlAOc7/mfyDZ80/mlkLp+GVP5ytT32kRuWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466407; c=relaxed/simple;
	bh=Lw4HWLxXAbkOxKF0yYYDd4vzq4ymNwy31AhCN1Hq1Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8eePwdu+JIbXkLOfxmeLucqvvyjQodLtF7M5vkgrgp4BJBZZo8BCJ9NC3nhyXcZvAF2NsblPS6dymGESaxkySHoWxdaXItf3bDzmuuEJsVSU4kaqIFjVNk28VHIfMEC8xYzTRmh4qwK4Gmp6QNWUZnFX/Dci9DQIHe2kEHfrsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyarMDMe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyarMDMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C991F0089D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789466404;
	bh=KUWhQOKpsVTzJc+LOgdU897R5lhBLPaZmUG1+ydEkq8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OyarMDMe6JeSt8AJh43gBxYnYZ6NDSJ57nEvfCurWD5BI+kOHFGjm2+DuOO7E0aoj
	 FXz7ddqtaBcPXJ35QjBLlHJnYEVkQQxJ7BqsCF+iGwtuEgJ86bmgkcjcHSaOUCYsbA
	 YbKklmvXoPwDwIvu2FfC59XIjE4VmtNnBx9P1AtEqWTI0094ZKbS2Pgs4bbj/ci3Yd
	 h2K7aF9RPS/fLULUaX+Vgtlid8N1jp3heTydhfvXXP3KTfouG16Ep+RlR2yqVdNaMO
	 uN16kFQpI1tBknZkRMOKG8Co+cNUyZIrZ0lS/MLtDSBvCHMMvuTYJxfMoH/gEOw+s4
	 2cSgUyfzSATPA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b7be8dbabfso2497248e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydzuDTJaTcbta1M3nwL3USHTEbQ6NI/1pMXqOgdeiQDG4PnAlNpYkbUVpbwYuArmk8UTWfPwgiryYAjoA=@vger.kernel.org
X-Gm-Message-State: AFuF++lHTh14Iivct+qKzV/qyN755OwmUU5nm0ZxkzY0ag3YRQJzsjQe
	ltkajHOocpO59SEvJ7Cl988MdWrVSv3rfXBiSY9wD96/2I7A7vjgXuKvh1/suOVTO8/vcftXI3E
	waCbV6br2/ufjOGevl4qU1rq99ko/itU=
X-Received: by 2002:a05:6512:10cb:b0:5b7:674f:caba with SMTP id
 2adb3069b0e04-5b8ae684479mr1733011e87.13.1789466402548; Tue, 15 Sep 2026
 03:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de> <20260915092046.931449-3-alban.bedel@lht.dlh.de>
In-Reply-To: <20260915092046.931449-3-alban.bedel@lht.dlh.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 15 Sep 2026 11:59:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ybSUyzX2YmaQnnuPz0EHJCucmc_dOSiGft-=ZzRkViQ@mail.gmail.com>
X-Gm-Features: AcwNN1W45AomASaWe_arqgDjsGJM8N_Ec_sdw3mERG3MRAQyLKGPHcbSSql0Hxw
Message-ID: <CAD++jL=ybSUyzX2YmaQnnuPz0EHJCucmc_dOSiGft-=ZzRkViQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Support ON Semi CAT9532
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alban,

thanks for your patch!

overall if it should be possible to use the same component as a LED dimmer
then some DT property flag such as onn,gpio-mode; or so is needed to make
sure only the GPIO mode driver is probed?

I'm not sure about how to flag this in DT, check with the binding maintaine=
rs.

On Tue, Sep 15, 2026 at 11:21=E2=80=AFAM Alban Bedel <alban.bedel@lht.dlh.d=
e> wrote:

> Add support for the CAT9532 LED dimmer from On Semiconductor. Altought
> marketed as an LED dimmer it is a bit limited in this regard as it
> only has 2 PWM for 16 pins. As explained in the datasheet it can also
> be used as an open-drain GPIO controller, and that's how it is used on
> the hardware I have at hand. This chip doesn't really map to what the
> gpio-regmap driver expect so it is implemented as it own driver. This
> approch also allow to later add support for the LED dimmer if desired.
>
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
(...)

> +static int cat9532_gpio_direction_input(struct gpio_chip *chip,
> +                                       unsigned int offset)
> +{
> +       struct cat9532 *cat9532 =3D container_of(chip, struct cat9532, gp=
io);
> +       unsigned int reg =3D CAT9532_REG_LS0 + (offset >> 2);
> +       unsigned int shift =3D (offset & 3) << 1;
> +       int err;
> +
> +       err =3D regmap_update_bits(cat9532->regmap, reg,
> +                                CAT9532_LED_OUT_MASK << shift,
> +                                CAT9532_LED_OUT_HIZ << shift);
> +       if (err < 0)
> +               return err;
> +
> +       scoped_guard(spinlock, &cat9532->lock)
> +               cat9532->direction &=3D ~BIT(offset);
> +
> +       return 0;
> +}
> +
> +static int cat9532_gpio_get(struct gpio_chip *chip,
> +                           unsigned int offset)
> +{
> +       struct cat9532 *cat9532 =3D container_of(chip, struct cat9532, gp=
io);
> +       unsigned int reg =3D CAT9532_REG_INPUT0 + (offset >> 3);
> +       unsigned int mask =3D BIT(offset & 7);
> +       unsigned int val;
> +       int err;
> +
> +       err =3D regmap_read(cat9532->regmap, reg, &val);
> +       if (err < 0)
> +               return err;
> +
> +       return !!(val & mask);
> +}
> +
> +static int cat9532_gpio_set(struct gpio_chip *chip,
> +                           unsigned int offset, int value)
> +{
> +       struct cat9532 *cat9532 =3D container_of(chip, struct cat9532, gp=
io);
> +       unsigned int reg =3D CAT9532_REG_LS0 + (offset >> 2);
> +       unsigned int shift =3D (offset & 3) << 1;
> +       unsigned int val;
> +
> +       val =3D value ? CAT9532_LED_OUT_HIZ : CAT9532_LED_OUT_LOW;
> +       return regmap_update_bits(cat9532->regmap, reg,
> +                                 CAT9532_LED_OUT_MASK << shift,
> +                                 val << shift);
> +}

So clearly all GPIO lines are open drain, requiring an external
pull-up resistor.

I would handle things this way:

1. Implement .set_config for this gpio_chip.
2. In the .set_config() callback, reject anything except PIN_CONFIG_OPEN_DR=
AIN
   pinconf_to_config_param(config) !=3D PIN_CONFIG_OPEN_DRAIN return -EINVA=
L;
3. If setting open drain succeeds, mark the line offset as configured
in a bitmap
4. Do not accept any get/set calls until the line has been configured as
  open drain.

This forces users to always properly configure the line as open drain befor=
e
usage.

Maybe it is possible to also add restrictions in the YAML DT bindings
to enforce consumers to set open drain, I'm not sure. But we can at least
enforce it at runtime.

> +       chip =3D &cat9532->gpio;
> +       chip->label =3D "cat9532";
> +       chip->parent =3D &client->dev;
> +       chip->owner =3D THIS_MODULE;
> +       chip->can_sleep =3D true;
> +       chip->base =3D -1;
> +       chip->ngpio =3D 16;

This is right, no using ngpio :)

Yours,
Linus Walleij
