Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56075443C2A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447319; cv=pass; b=Oi1Gs5jqNrZ33Om55seQCvdzuqhm452iUyUiqMV+lEgwOwNPW7olnhFbAOybkXF8hOIIrDYMxbFoRvXrz9JhaXHbPrFGF/jaGFULE5qMX5ZetbFB7iM2scFxzZ9bacOpoU4AEHzVNvNpSHCy1iFJxaECMsKqD2/xb0nhmJVcNAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447319; c=relaxed/simple;
	bh=5cnw4MgwQFZdLGMn6q6mk8Zr2/rF6j4AwXXpyNou4n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHRj9qQYHPiCJ50VFjs3hPOIxIQSdT8CuBliroU3N2Je7gteMhkxlv9odzGkAvYN01NkohAoh3b+cq7TFR9g3V6Rz8HQzx2bB0G+BtYSgUiNkCyiEMI362PL7QwjUWtIYKkoHnmcv3I+fRWbdWZH0Wr+DuoxAhIpmfzKR1TtebI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baogCcxx; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baogCcxx"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34ca2d54925so7641507eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791447315; cv=none;
        d=google.com; s=arc-20260327;
        b=cJ3BtulBBYjTWe3hJz1w+84PpD/cqKMz9EPnnmmdy0Qp2K+eQHlYTucPDBpIbeNcBR
         QIAXVyQivuKp+9j964HvAPSjJgqXqepRx57M8Lz+CNwVbF7gvrM6Aw2cRGL0Zfe/W/Zr
         AO5HpndhWIffxXL6fsH4/Mq6MwaB69SYEPRT1jgvQzOJNFHp4CIbg4PKFJQcaZ5WOqhM
         6OeMDR98RCaEjSMYnsyDnyDCeKNdj6lHNBlcMdkKpwH1nABEncX5FaihyeAa/uYT8YVA
         1/hx7yQRdrSDXHs6ZKWj97k6mWGJlIUNbjyTe2xSOYEKl/5DUetLuhPdFTGOSumx4K6h
         OWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pL3azhN+e8+Ll8Q2wR7Y9QWc8pVlu6BuKJTaisy1mTE=;
        fh=uV0gPmFs69QDV7+PIbuQ8KZx+ReWL5ZeoTEKR/Cz4mI=;
        b=fHDxkABR3HTR3Xb2vsnd1/hU1piDmiT3Xgv0XVVOfgQYFmCe7POoTSnKmYGDsrEros
         BydvlxcJeRTQDJSGNKCI7NUA07UpNAhPLmJEY34TjuYFJ+94Im0VJwKmoMzUpHElMoMl
         vjvYaev6MQwvJj6Qo8nxW7+kO8QZeI7Cy4B8aRYXzeVRvSU3UteJCDdYBENAXBwEFOFF
         tXsPnqMw3Dz5ptE3cPv/Ccvatv2Hcf1L/56hd8DXtW7vegzsakvaKOgLyN+DG1Wz4A6A
         DbGV6v2EDa1cg8F5yNiZEW+fF8sSY/UYYmrjkap+y18Vn2W7Bit5PywDCUxzg2CIJhpv
         lsuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791447315; x=1792052115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pL3azhN+e8+Ll8Q2wR7Y9QWc8pVlu6BuKJTaisy1mTE=;
        b=baogCcxxNvfktxl+YBzBdr+5XsgiYnzFN5vfPudgGddX1mCcyo+wcNh+RrQneDWzSt
         m/vHHwoErfmnctYYQ7M23D96l7Bhj5mKrEuFv5A7mr1fsUJZc+AorNF+WGEgUODXkylr
         8nx4E7MflZ3JwS9SKo1t3INQkUBPsIJW+3l31TuZE9ig6zlgQF3lGhTESnuVqRs37bUc
         ACvYLkmgmwV0JrpNb2MGZ+YI43HTJP0kEtYsqTMLYPpH3IIePkYTXUkMCka1CliPxxAI
         6KCJMgtvIx8WNdru+6PNbgdGweUfwHkELkcvJb65LruFS78QRMExgrrRIQEjl8VZrVEq
         4HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447315; x=1792052115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pL3azhN+e8+Ll8Q2wR7Y9QWc8pVlu6BuKJTaisy1mTE=;
        b=2uoC6DDalEqeK/Y53HQlTQhGjYB0OlxEeImuOxADOU7Q17rLf++We2agulJbvihO+B
         AfdIAYK5tZn7hC68LNdzkRzBRtoqTAd24xH7Tq6FOBWNM0EBOSiaG8UMVFEBMO1dmKZC
         HacgKHajUcfi4LKU+tSFCCMPHC1d1s2c+VAdBTRi/vp5mBgWuqD9ZSUM8F97I+O33f2a
         Mi1S6lUWrvEOOp3gwWiC0ADsz+4hUVtZTsIh9KhsdzgJ1ziOtGzHctV8bHk3HJzGWJwm
         IJqjrHTm5c/su9jesZkoQu40x1qhlLFzizlVdSH4CKuXwfbVTletxYxs63v5pxKcd0BF
         XTDg==
X-Forwarded-Encrypted: i=1; AKwUvBz8KUxyRwDZSdSJ/5w0vF07j4WO5dwjGyMCVD4Xupy9uXK2LywqJUMjz0NiDwkWcYVD2pjyBKtrm+Xyu9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ+ac+QdZC8a9Rg2y2rLrh9Is3ynKVSvZJ8L/UWrq24TOz4eWL
	Wjdgz1rtUSPCJTLmqqNvAr3YLKIy2lydPuVe0E18RGURAu8luPjwZ/qpMbp6alGO9PhDyCngaZy
	rn48Ye4qOxHnoVgLib/FFRisrvLsZq48=
X-Gm-Gg: AYBFou0P4fQofnfzUmCCiosVbNWziN5JZ1gVWbZRcGDQc71ANLAjbTOXt4U21SgMyHZ
	2sFFoXvk6g5PYAW8SwJ9xA3/8xxqRyZGtd/ShXk/ltLt+1MISOACqkXVZKwL8zeew76VFjGeRHL
	C8+Y/AFWgUtCywG/sxSsrQ2Ai72Ht56E2D+veUhayn0fvGjHkYjCI4l5dMQRr8VSmLeXAfT1Bgg
	948IcIbUN51uvJn35BnKPDXJilUkteDX/I/aLllzYtTzKvUR/HajU02MR+SFaQYS3/CXgHLEBj9
	iN5s8q5W2whru7WlWChEmL3H7CKdG8Dwew5sTlh62Rp95NeVx9u7LcdaX9zSfGG6HcvtVRCy8q8
	TPO7fhd9ZAeNK/rjOS9V47Ecs
X-Received: by 2002:a05:693c:20cb:20b0:351:62ef:7cfe with SMTP id
 5a478bee46e88-35162ef8211mr4800802eec.11.1791447314716; Thu, 08 Oct 2026
 01:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-4-clamor95@gmail.com>
 <e69041a4-c03e-46ae-b83a-3d8363070e80@gmail.com>
In-Reply-To: <e69041a4-c03e-46ae-b83a-3d8363070e80@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 8 Oct 2026 11:15:02 +0300
X-Gm-Features: AclHuK8oO-wrh3Vky1FNjCoz08eeII-MlKBmUclvEYuGK-wSYsHn_Xcl26MdxN8
Message-ID: <CAPVz0n2t5tcQB+YhNCFoQCStizEjTdyx7pDzLHtYkoz=B2MPwg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 7 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:04=
 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > The AAT1270 is quite similar to the AAT1290, but it does not support th=
e
> > Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
> > uses an earlier version of AS2C, namely Simple Serial Control, which la=
cks
> > address-sending capabilities.
>
> It seems that it is not possible to set brightness level and flash
> timeout. Those values are controlled by the values of RSET and CT
> elements attached to the controller.

This is not entirely true. S2C allows setting brightness level
perfectly fine, I have tested it on my LG Optimus 2X P990 (star) that
has this LED flash driver. Flash timeout is fixed, that is true, but
both AAT1270 and AAT1290 feature mandatory flash inhibit logic which
is not implemented by this driver and can be used to set emergency
flash disable.

> Those values should be conveyed
> via Device Tree, and the LED device API should reflect that accordingly.
>

They are calculated same way as AAT1290 does and set in the device
tree. Being fixed does not mean they should be removed. Device tree
describes hardware and those values are part of hw description.

> The question is whether it is worth a hassle to add support for this
> older chipset version. Could you let as know on which device it is
> present.
>

LG Optimus 2X P990 (star). It is a Tegra smartphone, it is not yet
supported by mainline Linux kernel, but it will be in near future. I
am currently upstreaming missing parts for better support.

>
> > Differentiate the chips by using a description structure with a flag to
> > indicate if AS2C is supported, placing all AS2C-only features under a
> > conditional check.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   drivers/leds/flash/leds-aat1290.c | 66 ++++++++++++++++++++++--------=
-
> >   1 file changed, 47 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/led=
s-aat1290.c
> > index 49251cfd33509..773cdcc73a9e1 100644
> > --- a/drivers/leds/flash/leds-aat1290.c
> > +++ b/drivers/leds/flash/leds-aat1290.c
> > @@ -43,9 +43,6 @@
> >   #define AAT1290_FLASH_TM_NUM_LEVELS 16
> >   #define AAT1290_MM_CURRENT_SCALE_SIZE       15
> >
> > -#define AAT1290_NAME                 "aat1290"
> > -
> > -
> >   struct aat1290_led_config_data {
> >       /* maximum LED current in movie mode */
> >       u32 max_mm_current;
> > @@ -59,6 +56,13 @@ struct aat1290_led_config_data {
> >       enum led_brightness max_brightness;
> >   };
> >
> > +struct aat1290_led_chip_info {
> > +     /* led controller name */
> > +     const char *name;
> > +     /* Advanced Simple Serial Control support */
> > +     bool as2c;
> > +};
> > +
> >   struct aat1290_led {
> >       /* platform device data */
> >       struct platform_device *pdev;
> > @@ -74,6 +78,10 @@ struct aat1290_led {
> >       struct gpio_desc *gpio_fl_en;
> >       /* EN|SET pin  */
> >       struct gpio_desc *gpio_en_set;
> > +
> > +     /* led controller description */
> > +     const struct aat1290_led_chip_info *info;
> > +
> >       /* movie mode current scale */
> >       int *mm_current_scale;
> >       /* device mode */
> > @@ -101,15 +109,17 @@ static void aat1290_as2cwire_write(struct aat1290=
_led *led, int addr, int value)
> >
> >       udelay(AAT1290_FLEN_OFF_DELAY_TIME_US);
> >
> > -     /* write address */
> > -     for (i =3D 0; i < addr; ++i) {
> > -             udelay(AAT1290_EN_SET_TICK_TIME_US);
> > -             gpiod_direction_output(led->gpio_en_set, 0);
> > -             udelay(AAT1290_EN_SET_TICK_TIME_US);
> > -             gpiod_direction_output(led->gpio_en_set, 1);
> > -     }
> > +     if (led->info->as2c) {
> > +             /* write address */
> > +             for (i =3D 0; i < addr; ++i) {
> > +                     udelay(AAT1290_EN_SET_TICK_TIME_US);
> > +                     gpiod_direction_output(led->gpio_en_set, 0);
> > +                     udelay(AAT1290_EN_SET_TICK_TIME_US);
> > +                     gpiod_direction_output(led->gpio_en_set, 1);
> > +             }
> >
> > -     usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIME_MAX_US=
);
> > +             usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIM=
E_MAX_US);
> > +     }
> >
> >       /* write data */
> >       for (i =3D 0; i < value; ++i) {
> > @@ -150,16 +160,18 @@ static int aat1290_led_brightness_set(struct led_=
classdev *led_cdev,
> >               led->movie_mode =3D false;
> >       } else {
> >               if (!led->movie_mode) {
> > -                     aat1290_as2cwire_write(led,
> > -                             AAT1290_MM_CURRENT_RATIO_ADDR,
> > -                             AAT1290_MM_TO_FL_1_92);
> > +                     if (led->info->as2c)
> > +                             aat1290_as2cwire_write(led,
> > +                                     AAT1290_MM_CURRENT_RATIO_ADDR,
> > +                                     AAT1290_MM_TO_FL_1_92);
> >                       led->movie_mode =3D true;
> >               }
> >
> >               aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CURRENT_AD=
DR,
> >                               AAT1290_MAX_MM_CURR_PERCENT_0 - brightnes=
s);
> > -             aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CONFIG_ADD=
R,
> > -                             AAT1290_MOVIE_MODE_ON);
> > +             if (led->info->as2c)
> > +                     aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CO=
NFIG_ADDR,
> > +                                            AAT1290_MOVIE_MODE_ON);
> >       }
> >
> >       mutex_unlock(&led->lock);
> > @@ -178,7 +190,8 @@ static int aat1290_led_flash_strobe_set(struct led_=
classdev_flash *fled_cdev,
> >       mutex_lock(&led->lock);
> >
> >       if (state) {
> > -             aat1290_set_flash_safety_timer(led, timeout->val);
> > +             if (led->info->as2c)
> > +                     aat1290_set_flash_safety_timer(led, timeout->val)=
;
> >               gpiod_direction_output(led->gpio_fl_en, 1);
> >       } else {
> >               gpiod_direction_output(led->gpio_fl_en, 0);
> > @@ -475,6 +488,10 @@ static int aat1290_led_probe(struct platform_devic=
e *pdev)
> >       fled_cdev->ops =3D &flash_ops;
> >       led_cdev =3D &fled_cdev->led_cdev;
> >
> > +     led->info =3D device_get_match_data(dev);
> > +     if (!led->info)
> > +             return -ENODEV;
> > +
> >       ret =3D aat1290_led_get_configuration(led, &led_cfg, &sub_node);
> >       if (ret < 0)
> >               return ret;
> > @@ -489,7 +506,7 @@ static int aat1290_led_probe(struct platform_device=
 *pdev)
> >       aat1290_init_flash_timeout(led, &led_cfg);
> >
> >       init_data.fwnode =3D of_fwnode_handle(sub_node);
> > -     init_data.devicename =3D AAT1290_NAME;
> > +     init_data.devicename =3D led->info->name;
> >
> >       /* Register LED Flash class device */
> >       ret =3D led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
> > @@ -528,8 +545,19 @@ static void aat1290_led_remove(struct platform_dev=
ice *pdev)
> >       mutex_destroy(&led->lock);
> >   }
> >
> > +static const struct aat1290_led_chip_info aat1290_info =3D {
> > +     .name =3D "aat1290",
> > +     .as2c =3D true,
> > +};
> > +
> > +static const struct aat1290_led_chip_info aat1270_info =3D {
> > +     .name =3D "aat1270",
> > +     .as2c =3D false,
> > +};
> > +
> >   static const struct of_device_id aat1290_led_dt_match[] =3D {
> > -     { .compatible =3D "skyworks,aat1290" },
> > +     { .compatible =3D "skyworks,aat1290", .data =3D &aat1290_info },
> > +     { .compatible =3D "skyworks,aat1270", .data =3D &aat1270_info },
> >       {},
> >   };
> >   MODULE_DEVICE_TABLE(of, aat1290_led_dt_match);
>
> --
> Best regards,
> Jacek Anaszewski
>
