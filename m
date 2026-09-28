Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF0423A66
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600882; cv=pass; b=HOXU8E9P4iordskW+hMa9QcfXdjTxUMnbEj9a1H6cCTmE5Sm0KA42IkSMS0rtwyhaHTW7OTMHjuHbXl2eZR36ZN+xugKDratSQXuVVO2R/Onub1cYHVG3hhCudVqZ3o4T2OYYUMA2spqfILPeZJkjZKJ79qgWTsPQr9n5LJD9A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600882; c=relaxed/simple;
	bh=xEcymRmGszspdnukJ2qDwmGJzrkJxNGdwFUd0osA0MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZysX/FcDUAOSo9h1JFn5hyVACH1EhtAdOGsTNyDzBBrvIzLCPxCfmlFThW8WeV9gq6sFI1Yi0E1w1q8TphyC8m/kMjpb8eO4qwLb06iD8/Auc2Mkw09E01Fyao4rIzlSJKKYZHkju/8INB3TAIBu5Iqzw+LDP+aIGR5il9XcFNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ma/yyqIV; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma/yyqIV"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af9270c53so262897066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790600877; cv=none;
        d=google.com; s=arc-20260327;
        b=BJsY3kVOViPBc+A+n0WElKlSHRffVchQQ3Nql+yHmZzzJ8/kidfjQV663Us6t/ezol
         71kyarCgUmTztGlObXxYa47jYIMboFbYQW7F/fdTlT3hEz8/9nobzNlGVuEWE+4Nh0SC
         gGCiwowZHya+nm/ox5VmM+13dY7zNiJRMspn0XJlWqSqpQhecQQ6zRISh5Pg2xz6yGMX
         HkGrjrIYQY5QOX9AHmXsNSiqrMcgqkCZGq4szXi6tJbTnM9/dTBbk+dXiUN4Uem08R02
         jTbO1S20KKDjZSAXQ8vcUDNJ+nh45BxYrTEkoJCF5hEPWk+v9KhD1tIZRTBDUHkkyHxB
         ug2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LocOq6XG/4rm3dtwjOYm+24mahJp9YZapm60UEYrnpU=;
        fh=TrhUEHjvP3ep4oy+wNIo5In3E/JIP2PMwAaz2iPpvYA=;
        b=LdorGh8MYfhE3UUdGoHPkFZNCnWMPTM+hy+Trf9AfK5b5tI7tNolTFn1gxDYFXXyTH
         xaWi2mJAJB+4sonmaGsLe0SHDd/Hs8DvyEakfNj5cVBJ7BMnPWHlTGL4ttoP9uJSql/T
         OVRcxd8W0+brSh/S3jJ1V7Arv5qVXOUjos2UxqjPWj1haCWhHvt/0rsrwYOa+pKHQ76B
         2kdH4uxkR3h2sDNrEYNzNeGVR/7WisxBT+14f5DnIoUizdG4RAd2UIf627cB9Duu+89v
         Zy8Ty3oa68EtWMJNsyGPaMUj4rs0h9qH3ziY+wCBJU/fAn7FGNWLt+OeE2Ypm+inYHdi
         odGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790600877; x=1791205677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LocOq6XG/4rm3dtwjOYm+24mahJp9YZapm60UEYrnpU=;
        b=ma/yyqIV6I9wSrTVT0HMFEi1kTrXqW9LVSpyyjZpY03eYHjRr5e5HwmfziYcwnoBBn
         5EaY3DNnp1RZsV8APCX4HDPAKzrfnxPHK49dwyEP/qL5gk9A8x9e5aiROF/6LAz7foBZ
         JO15CSz1+UvCIN+LQZttxSQJaJ2Z2ukiM/5OlvzzTWdHlGfriFv/+68B1oHh4dyk6UUu
         +BYjQjmakJZRfQbJ1iy2PBVGBuLcfrMrvq/wJUjbBwcfsAQRVEH+knwVC/lSuTutMskK
         Ue4RRpeZ/0/gYoIQz0dTGoqRQNW3TpbU+D1R2GdTtX9IUdS2AJ9cpbQX6eJypS3WRCoG
         hSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600877; x=1791205677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LocOq6XG/4rm3dtwjOYm+24mahJp9YZapm60UEYrnpU=;
        b=DFUqPche4hCBtE950gNgNFBrf8n1fz/ZdKO98v/UZ3xClNHwwvj40RLS7n9kday/Zw
         tCnlLqnLYA++O5M2+ML4ERphKt4V/YyFtr6HXjN8ciEW0zwdiM8w0X+Z06ArA6Hcopyr
         JF4VK1qZ4KDF3SVMv4RDPTNifP2IKPy4a8ZrV79VMYc9kMdqldUK6levNbVClXKV+Htl
         IfEV6f5comYrcvmyujb7ejH0dHfHo6TLjvp3uVFUDmspdjZmNT8LED1y4WTKsUjolq78
         OMED+7ZLbQd6R1W6QdpisQZ0BF3tqq5cZg5n0cocCfcJ6+QWcHN5jumwjvhNhZUnMAlD
         rrhg==
X-Forwarded-Encrypted: i=1; AKwUvBw0ZCHvfIFk9Z0ruxZEqFLL+V8NV2eZTQgAejkCwXFatYT7RBCRv9jpXwubyKBHRveYuOiCliXiSXEMjIA=@vger.kernel.org
X-Gm-Message-State: AFuF++mvZMcTi3PFh3OqflZS3WGGeqCiMOOdUuqk6L9vl64QoLy58Lqq
	D8vo//YYOxAMAR83ICV3R9ZN9ethAJCAeA627pyVzvWewUI1BIB13DSB7Uaj83C/2B64AZ4Cxo5
	OGKJEkapnZ2AnSXYr8oAvCZbmhytnwfc=
X-Gm-Gg: AYBFou1drYBBq9A0H6sKPlJ8Ss9oMqrYj3X9Ks+Tkem2e0mGoU+jSAE2dG9juN2D+Yu
	VfcDFXLgMRocnxiCAlvsJUTRzjBtY2qSNhnEfnARwqMhG5Lth1fb9c6M43fqHd4sMlbjzggdA9C
	aKXZUn3fbU2ZtlYOmSF32Soh0CCVz/4ZCnWwNgqP1ddL3S7huHUeDTdZ+ucLEHBptqyrHEfsuXs
	GG+vvNyAH6Kibtl+Fjn+pF9WnVJilWiJLugWkxjeU6ptyxkbbBKxR1Th0pD5rmQTRW+cIUlVVT6
	KM7vzs55nt7MHJLR3wAmv11savQeTjqrg43mbnzaPkiuvQH2X1SZvbbmcVuHFAORPO+e3X63MDr
	L0oazXv+Y2/gaSJOOHgEhH85D6P5Gm8hdWD0SyrAup0PPkpllXYvTJLji/H+j2Ov0KXBxxnXdK4
	TSkxj10hxkUJqAqXxo/UkwIp6+AV24dTD/cvq9IesQ
X-Received: by 2002:a17:907:d005:b0:c26:2151:180a with SMTP id
 a640c23a62f3a-c2ac525fe62mr1010298366b.3.1790600877277; Mon, 28 Sep 2026
 06:07:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928111907.72592-1-pepe.schlehofer@gmail.com> <20260928111907.72592-3-pepe.schlehofer@gmail.com>
In-Reply-To: <20260928111907.72592-3-pepe.schlehofer@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 16:07:20 +0300
X-Gm-Features: AclHuK8LrUHy1cNTkceV0KejktAKpvV1sU6tn8Odpjfo0Yk1ssM4v7bILMVuPmU
Message-ID: <CAHp75VeH70LshOt0qzrvLkZYqDx=43o=34_wmHWkbYcTy7Z3vA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] leds: Add support for Turris 1.x LEDs
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Rong Zhang <i@rong.moe>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:19=E2=80=AFPM Josef Schlehofer
<pepe.schlehofer@gmail.com> wrote:
>
> From: Pali Roh=C3=A1r <pali@kernel.org>
>
> Add a driver for the eight RGB LEDs on the front panel of the CZ.NIC
> Turris 1.x routers. They are driven by the CZ.NIC CPLD firmware, whose
> source is available at
> https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_C=
PLD.v
>
> The LEDs use the multicolor LED class. Every LED except the WiFi LED can
> also be driven by the CPLD from hardware events, exposed as the private
> turris1x-cpld trigger. The five LAN LEDs share one set of colour
> registers, so the colour and brightness set last on any of them apply
> to all five.
>
> The controller device exposes the global brightness controlled by the
> button on the back of the router through `brightness`,
> `brightness_level`, and `brightness_levels/<N>`. The Turris Omnia
> driver already has `brightness`, so its ABI entry is extended to cover
> the Turris 1.x as well.

> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>

> Cc: Marek Beh=C3=BAn <kabel@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>

Please, move these (Cc list) to the block under the cutter '---' line,
so it won't pollute the commit message.

> Co-developed-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> ---

...

>  What:          /sys/class/leds/<led>/device/brightness
> -Date:          July 2020
> -KernelVersion: 5.9
> -Contact:       Marek Beh=C3=BAn <kabel@kernel.org>

> +Date:          July 2020 (Turris Omnia), September 2026 (Turris 1.x)
> +KernelVersion: 5.9 (Turris Omnia), 7.4 (Turris 1.x)

This is quite unusual. If you want to refer to the kernel version, do
it in the description. Also note the version (see below more on it).

> +Contact:       Marek Beh=C3=BAn <kabel@kernel.org>, linux-leds@vger.kern=
el.org

Why? The mailing list is kinda default, no?

...

> +What:          /sys/class/leds/<led>/device/brightness_level
> +Date:          September 2026

Impossible. Use https://hansen.beer/~dave/phb/ to predict the dates of
the next release, this is a huge driver that most likely may not make
v7.4, so the v7.5 is a plausible candidate.

> +Contact:       Josef Schlehofer <pepe.schlehofer@gmail.com>
> +Description:   (RW) Index (0-7) of the global brightness level in use on=
 the
> +               Turris 1.x routers. The button on the back side of the ro=
uter
> +               steps through the levels. Writing to this file selects a =
level
> +               directly. The CPLD keeps the selection across driver unbi=
nd and

the driver

> +               reboot.
> +
> +               Format: %u
> +
> +What:          /sys/class/leds/<led>/device/brightness_levels/<N>
> +Date:          September 2026

As per above

> +Contact:       Josef Schlehofer <pepe.schlehofer@gmail.com>
> +Description:   (RW) Value of the global brightness level N (0-7) on the
> +               Turris 1.x routers, one file per level. These are the val=
ues
> +               the CPLD firmware steps through when the brightness butto=
n is
> +               pressed. Reading returns the value, writing accepts an in=
teger
> +               between 0 and 255. The CPLD keeps the values across drive=
r

the driver

> +               unbind and reboot, and restores the defaults (255 64 32 1=
6 8 4
> +               2 0) at power-on and when the reset button is pressed.

...

> +#include <linux/bits.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kstrtox.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/minmax.h>

> +#include <linux/mod_devicetable.h>

Not anymore. Rely on what platform_device.h provides.

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/spinlock.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>

...

> +struct turris1x_leds {
> +       void __iomem *regs;
> +       /* Protects the CPLD LED registers and @reset */
> +       spinlock_t lock;
> +       /* Set by turris1x_leds_reset(), after which the LEDs are left al=
one */
> +       bool reset;
> +       struct turris1x_led led[TURRIS1X_LED_NUM];

Please, check the layout of all structures with `pahole`, it might
suggest a better one.

> +};

...

> +/* Must be called with ddata->lock held */

This is good, but having a lockdep annotation is even better.

> +static void turris1x_led_set_colors(struct turris1x_leds *ddata, struct =
turris1x_led *led,
> +                                   enum led_brightness brightness)
> +{
> +       struct led_classdev_mc *mc_cdev =3D &led->mc_cdev;
> +       unsigned int i;
> +       u8 val;
> +
> +       led_mc_calc_color_components(mc_cdev, brightness);
> +
> +       /* The colour registers are 8 bits wide, do not let values wrap *=
/
> +       for (i =3D 0; i < TURRIS1X_LED_NUM_COLORS; i++) {

for (unsigned int i...) {

> +               val =3D min_t(unsigned int, mc_cdev->subled_info[i].brigh=
tness, U8_MAX);

No min_t(), it should be an exceptional use, and it was especially
proven to have issues with < INT_MAX comparisons in some cases. I
think you mean to have clamp() here.

> +               turris1x_write(ddata, turris1x_color_reg(led->reg, i), va=
l);
> +       }
> +}

...

> +static int turris1x_hwtrig_activate(struct led_classdev *cdev)
> +{
> +       struct turris1x_leds *ddata =3D dev_get_drvdata(cdev->dev->parent=
);
> +       struct turris1x_led *led =3D to_turris1x_led(cdev);
> +       unsigned long flags;
> +       u8 val;
> +
> +       spin_lock_irqsave(&ddata->lock, flags);

Why not guard()()?

> +       if (ddata->reset)
> +               goto unlock;
> +
> +       /*
> +        * If software turned the LED off, the last configured colour was=
 not
> +        * necessarily written to the CPLD. Write it with max_brightness =
before
> +        * the hardware takes over.
> +        */
> +       if (!led->on)
> +               turris1x_led_set_colors(ddata, led, cdev->max_brightness)=
;
> +
> +       /* Disable LED software control */
> +       val =3D turris1x_read(ddata, TURRIS1X_LED_SW_OVERRIDE_REG);
> +       turris1x_write(ddata, TURRIS1X_LED_SW_OVERRIDE_REG, val & ~BIT(le=
d->reg));
> +
> +       led->hwtrig =3D true;
> +
> +unlock:
> +       spin_unlock_irqrestore(&ddata->lock, flags);
> +
> +       return 0;
> +}

...

> +       /*
> +        * Enable or disable the LED under software control. The CPLD ign=
ores
> +        * this bit while the hardware trigger drives the LED, so leave i=
t
> +        * alone.
> +        */
> +       if (!led->hwtrig) {
> +               val =3D turris1x_read(ddata, TURRIS1X_LED_SW_DISABLE_REG)=
;
> +               if (brightness)
> +                       val &=3D ~BIT(led->reg);
> +               else
> +                       val |=3D BIT(led->reg);

If led->reg is unsigned long, you can use __asign_bit() here.

> +               turris1x_write(ddata, TURRIS1X_LED_SW_DISABLE_REG, val);
> +               led->on =3D !!brightness;
> +       }

...

> +static int turris1x_led_register(struct device *dev, struct turris1x_led=
s *ddata,
> +                                struct fwnode_handle *fwnode, u8 val_sw_=
override,
> +                                u8 val_sw_disable)
> +{
> +       static const unsigned int colors[TURRIS1X_LED_NUM_COLORS] =3D {
> +               LED_COLOR_ID_RED, LED_COLOR_ID_GREEN, LED_COLOR_ID_BLUE,
> +       };
> +       struct led_init_data init_data =3D {};
> +       struct led_classdev *cdev;
> +       struct turris1x_led *led;
> +       unsigned long flags;
> +       u8 val, dis;
> +       u32 reg, color;
> +       unsigned int i;
> +       int ret;
> +
> +       ret =3D fwnode_property_read_u32(fwnode, "reg", &reg);
> +       if (ret || reg >=3D TURRIS1X_LED_NUM)
> +               return dev_err_probe(dev, -EINVAL, "Invalid or missing 'r=
eg' property\n");
> +
> +       ret =3D fwnode_property_read_u32(fwnode, "color", &color);
> +       if (ret || color !=3D LED_COLOR_ID_RGB)
> +               return dev_err_probe(dev, -EINVAL, "Invalid or missing 'c=
olor' property\n");

Do not shadow the error code.

> +       led =3D &ddata->led[reg];
> +       if (led->registered)
> +               return dev_err_probe(dev, -EINVAL, "LED %u already regist=
ered\n", reg);

EBUSY / EEXIST ?

> +       led->reg =3D reg;
> +
> +       /* Set the initial colours to those currently in use */
> +       for (i =3D 0; i < TURRIS1X_LED_NUM_COLORS; i++) {

for (unsigned int i...) {

> +               led->subled_info[i].intensity =3D turris1x_read(ddata, tu=
rris1x_color_reg(reg, i));
> +               led->subled_info[i].color_index =3D colors[i];
> +               led->subled_info[i].channel =3D i;
> +       }
> +
> +       /*
> +        * LEDs 1-5 (LAN) share one set of colour registers, and the brig=
htness
> +        * of an LED is applied by scaling its colour, so all of them sho=
w the
> +        * colour and brightness written last. Each LED still keeps its o=
wn
> +        * intensities and brightness, so multi_intensity and brightness =
report
> +        * what the LED was last given, which is not necessarily what it =
shows.
> +        */
> +       led->mc_cdev.subled_info =3D led->subled_info;
> +       led->mc_cdev.num_colors =3D TURRIS1X_LED_NUM_COLORS;
> +
> +       init_data.fwnode =3D fwnode;
> +
> +       cdev =3D &led->mc_cdev.led_cdev;
> +       cdev->max_brightness =3D 255;
> +       cdev->brightness_set =3D turris1x_led_brightness_set;
> +
> +       /* All LEDs except the WiFi LED can be driven by the hardware tri=
gger */
> +       if (reg !=3D TURRIS1X_LED_WIFI) {
> +               cdev->trigger_type =3D &turris1x_hw_trigger_type;
> +               cdev->hw_control_trigger =3D turris1x_hw_trigger.name;
> +       }
> +
> +       if (!(val_sw_override & BIT(reg)))
> +               cdev->default_trigger =3D turris1x_hw_trigger.name;
> +
> +       if (!(val_sw_override & BIT(reg)) || !(val_sw_disable & BIT(reg))=
)
> +               cdev->brightness =3D cdev->max_brightness;
> +
> +       led->on =3D !(val_sw_disable & BIT(reg));
> +
> +       ret =3D devm_led_classdev_multicolor_register_ext(dev, &led->mc_c=
dev, &init_data);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Cannot register LED %u\n"=
, reg);
> +
> +       /*
> +        * A linux,default-trigger property replaces the hardware trigger=
, and
> +        * the CPLD then keeps driving the LED and ignores software contr=
ol.
> +        * Take such an LED over in the state the LED core reports.
> +        */
> +       spin_lock_irqsave(&ddata->lock, flags);
> +       val =3D turris1x_read(ddata, TURRIS1X_LED_SW_OVERRIDE_REG);
> +       if (!led->hwtrig && !(val & BIT(reg))) {
> +               dis =3D turris1x_read(ddata, TURRIS1X_LED_SW_DISABLE_REG)=
;
> +               if (cdev->brightness)
> +                       dis &=3D ~BIT(reg);
> +               else
> +                       dis |=3D BIT(reg);
> +               turris1x_write(ddata, TURRIS1X_LED_SW_DISABLE_REG, dis);
> +               led->on =3D !!cdev->brightness;
> +               turris1x_write(ddata, TURRIS1X_LED_SW_OVERRIDE_REG, val |=
 BIT(reg));
> +       }
> +       spin_unlock_irqrestore(&ddata->lock, flags);
> +
> +       led->registered =3D true;
> +
> +       return 0;
> +}

...

> +       best_level =3D 0;
> +       best_error =3D INT_MAX;
> +       for (level =3D 0; level < TURRIS1X_LED_NUM_LEVELS; level++) {

Ditto.

> +               value =3D turris1x_read(ddata, TURRIS1X_LED_LEVEL_VALUE_R=
EG + level);
> +               error =3D abs(value - brightness);
> +               if (error < best_error) {
> +                       best_error =3D error;
> +                       best_level =3D level;
> +               }
> +       }

...

> +/* _level is always a literal 0..7, it is pasted, stringified and stored=
 */
> +#define TURRIS1X_LEVEL_ATTR(_level)                                     =
       \
> +       static struct turris1x_level_attr turris1x_level_attr_##_level =
=3D {      \
> +               .attr =3D __ATTR(_level, 0644, brightness_level_value_sho=
w,       \
> +                              brightness_level_value_store),            =
       \

Don't we have __ATTR_RW() ?

> +               .level =3D _level,                                       =
         \
> +       }

...

> +       device_for_each_child_node_scoped(dev, child) {
> +               ret =3D turris1x_led_register(dev, ddata, child, val_sw_o=
verride, val_sw_disable);
> +               if (ret)
> +                       return ret;
> +               count++;
> +       }

> +       if (!count)
> +               return dev_err_probe(dev, -ENODEV, "No LED devices found =
in device tree\n");

We have counting API, so this can be done ahead. Yes, it will iterate
over the list twice, but I don't think it's an issue.

--=20
With Best Regards,
Andy Shevchenko
