Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B7344BC92
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345988; cv=pass; b=ALDTqqpqYiRAEKrmQQBUOwDoHaX4XqaO5KnmncqhdatuWkL4JoS2HNItC9ptVVNZw/XOJq7jLDMz0cBZk8c05WOaipJfueI7g778ymvfpVlFkFNIku6k2XWjIXnw4qW6QGIKkqsSODCyfgOhVQm1LDtslo5SRRtAJiZ2x/uMlkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345988; c=relaxed/simple;
	bh=kVNfe+6q5mTRfGOeFMVqumQmkz7iGMhPBDKDnA+QXA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsmWTub2YJyN8JHDx7xtRpT6Z10revz+T5Epf97YvIaBadf9MOB9ymWVSiPVwGtRjOdDT9Zitjlw6YpRrpAuf1Y3bnayjhsOuVDmU01YX84rFtuyc95llW44EqJ84HJBhwRgPq1JcRfHIPt4BQGQjolBF8dKFZQwxCIchS5b5V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n26YH9rn; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n26YH9rn"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1677c91969so82557666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788345976; cv=none;
        d=google.com; s=arc-20260327;
        b=HE6eP+sfwSOsz8FqwdoHZKzS+qpKFNf8/YwUjxU75YejiL4QLakyGruf6EcQW7M4/l
         uSXFGx/jTuRyBdwX/7QpYEf/rkWRCItvsEU6nqp68xt/Yrxlk/vpYv2WsWa9iE973Ahc
         dsrofP81W4uj7+bho8pq9TIecpxGIH5vM+rFS6tyCbyrjq/hUNPQqape1k6mJBdocvLl
         C0iLoMOmp69TTWQOKKQz60F/qRa41cUlGYjJhlktwhBTqajEF8uKE10EQQcrHPfvb8oA
         /or1vQ7HItC5Gt8/hK8rcXjZeAXkScmXudjGuEfE9MtIK/QNPgKtsnvtA2ChfAaTprNX
         D/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OTz0t3n1QqLxKiOigrC3g5ZZ4pvXb24k5OSrPzNavSI=;
        fh=KzaV96bmDhfmDOG7s+v4rkRH/Rnq5mID0iJLKd9c9Co=;
        b=bqB8vrN/hYuAU6+RNs4avDhWhsTpzkjcU/i3eUq6pjOm7ZJURXLnRiPmneoBzcndMR
         lYgCYq2MOBqGsjbTLyJwahMNvmdfaNuPJ+JvBO7SxG6lrir74+guRDPnLGZw1POcK7vy
         9DAq7qlYgtRJmFgLT9QhN3sm7heuvBizsykJGaQYIprgdvhrb8SG6p3THNXous7zNL1z
         zUFj+TIvf03l3HeikxjpDwJgkG+/b5zRac0AJ3ogGOBPXu7ohWzR/eLwP5yVwwtR0P2L
         xDLJA0JDX9RSkiUbCbAxkM+0zyjdjTdkt7NTlBuufGDFt3bViMy9fb+ZKr51Q5orvC9I
         D9UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788345976; x=1788950776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OTz0t3n1QqLxKiOigrC3g5ZZ4pvXb24k5OSrPzNavSI=;
        b=n26YH9rnC/IFEmLDF1CJtS/y5ZEEhQgHX6jzevVN9qC8hZD2lwycsjMSatTt87xrQz
         5NI7eYJRstQQ5XaQq69wxm8OByK9hvg281q5zEb2AY+7AeBavVZLo6g3OnYXDy4PhuJS
         A3lSESFCIWxKnyvoJm5xRWIn7K+gIs2+SoHJnsZlcWlt0byM5M07pY8JHDZASQbZ/kJz
         rsiNTZMlkZDF+84nkAURtOdZLtWP+V5mHbxXADmgHNPX4DJiSMBaaYCJkksYQSMazVYc
         Nh3CcyauTP3jI6SfIFvrkeDKEZce5wVRTtST8QUy3FZD9xn9MJ8HdYAfAru/YRwIFqnU
         WK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345976; x=1788950776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTz0t3n1QqLxKiOigrC3g5ZZ4pvXb24k5OSrPzNavSI=;
        b=ESQCgYdNwM8JWQVxvKJBpkm91eYKn99Y4G9CssKBMafq950r2eD5wUdIVzUMFXU6C/
         pS3mZ+P3uWZyHSEZoFo/qe69gEvS7KxVSes4QVm949mwjCEAIsym4gceF8I/DzBcmSNY
         tpOOcojmXemfKaEyq1BbrL2wqJPsmVk6OoGDGjBq0w87HZcHO61sBgvfLXA+0I5XoY2Q
         6s0STz8JObkFO042wYQnjJ7EnC94U2n6T52t2pZDJ2L+B0JS5GlexGGq8VhjUDAQLaMZ
         cj3VNkn2DoJnXcNPFpMOVtZUQnbOBBvUy7jWWk3Vp+78tZLyZ5bcuwYVSzWpEoRLjtsS
         QwuA==
X-Forwarded-Encrypted: i=1; AKwUvBy+pwwCLpict3Wm3HQ7PCWMable82URdpEBAEWNS0CkBaNjxQhT90AWbRhI23WJ6tmmCkJGCQhivUae19Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mBA4rk6Tj3za/BRHfY4UcItxBv8OGNuFLhz4Hsq2wBRHl1qbDM
	EiWb5kM2384y7z5DaWE2L0j94zcyTxWXqB4yf1nJADxsym10INTrCI85Zr/zquLBQI16sjf4/WR
	eXgpbABVQAtqOlqurBjatAJpvLkWkG/M=
X-Gm-Gg: AYBFou1vLocSkJX0/hF4jcftGt4zmAbVFZgzSXyOPxY4mtLvU1dr94dBGDRY1j4BK78
	SdG+auDSH+JtjTpI0ZksYw0Qu9ZLTPlyGZ9/umCgEyFs/c9NleKhbuIpCvCS4/ZI3wI4aDHQ3Ba
	X/fTLio2iKtERLLInUhOaKxiq9G9gBH49XQiYrM5OMk3eUE+8LcwjpOm9+IV4gCnBNVy4l1Cp1P
	NrknD93bKcvOU8vq9/1NApfe48VBqJRvXjFTQYPntLlUqD//+bWnJBtp9ksVjirPNGc4OTcoD7D
	golf4kui8Ekhl2XdMvrdg83i7ASiSYB+iNoRC/I/JMht
X-Received: by 2002:a17:906:c142:b0:c20:3679:a2e6 with SMTP id
 a640c23a62f3a-c25d53e43fbmr250885766b.10.1788345975815; Wed, 02 Sep 2026
 03:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902032353.16106-1-idotohors@gmail.com> <b8cdf49b-91d4-2e86-a8ea-04d1db119225@linux.intel.com>
In-Reply-To: <b8cdf49b-91d4-2e86-a8ea-04d1db119225@linux.intel.com>
From: ido <idotohors@gmail.com>
Date: Wed, 2 Sep 2026 17:46:04 +0700
X-Gm-Features: AcwNN1XVCJpMZPZJzwZyPRRp2o1kacQFWl2WFwFKapbv1l1DXtf_LMmgx5DU7Mg
Message-ID: <CAF-TU9Y22LYDkwes3YK9xCq6J3J9E4KtHqg3L45rM9TEkohtqQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix FA401 series keyboard
 sleep strobe
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. Yeah, that makes complete sense.

I will split this into a two-patch series for v3:
1. A preparatory patch defining named bitmasks and converting
kbd_rgb_state_store() to use bitfield helpers / FIELD_PREP().
2. The functional fix adding the DMI quirk and suspend handling on top
of the clean definitions.

Will send v3 shortly.

Thanks,
Ido


On Wed, Sep 2, 2026 at 4:43=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 2 Sep 2026, Idotoho Reimon Simanjuntak wrote:
>
> > The FA401 series accepts the TUF keyboard RGB power-state command but d=
oes
> > not advertise the device through the normal DSTS presence probe. Regist=
er
> > the state attributes for this series and re-assert keyboard brightness =
in
> > the PM prepare callback so the EC enters S0ix with the correct state.
> >
> > Without the brightness re-assertion, the display server blanks the keyb=
oard
> > before the kernel suspend path runs, leaving the EC with brightness=3D0=
 and
> > preventing the sleep strobe from activating. Because kbd_led_wk may alr=
eady
> > be zeroed by the display server at prepare time, always re-assert level=
 3
> > (max) brightness when sleep backlight is enabled.
> >
> > Use a quirk flag (kbd_rgb_state_quirk) set via DMI match table rather t=
han
> > ad-hoc dmi_match() calls. Cache power-state flags from sysfs writes and
> > initialize the cache to the default enabled state during probe, so the
> > workaround also applies before userspace writes the attribute. Do not a=
dd
> > a module parameter; the sysfs power-state setting is authoritative.
> > Use the standard dev_pm_ops .prepare callback rather than overloading t=
he
> > Ally-specific LPS0 ops. Define self-documenting macros for the TUF RGB
> > state bitfields at file scope.
> >
> > Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
> > ---
> > Changes in v2:
> >  - Cache RGB power state flags from sysfs writes instead of attempting =
DSTS read.
> >  - Initialize state flags to enable all modes during driver probe.
> >  - Move TUF_RGB_STATE_* bitfield macros to file scope.
> >  - Drop module parameter in favor of DMI quirk + sysfs control.
> >  drivers/platform/x86/asus-nb-wmi.c | 14 +++++++
> >  drivers/platform/x86/asus-wmi.c    | 61 +++++++++++++++++++++++++++++-
> >  drivers/platform/x86/asus-wmi.h    |  1 +
> >  3 files changed, 75 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
> > index aeb461b16..fb06013ca 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -155,6 +155,11 @@ static struct quirk_entry quirk_asus_z13 =3D {
> >       .tablet_switch_mode =3D asus_wmi_kbd_dock_devid,
> >  };
> >
> > +static struct quirk_entry quirk_asus_fa401 =3D {
> > +     .wapf =3D 0,
> > +     .kbd_rgb_state_quirk =3D true,
> > +};
> > +
> >  static int dmi_matched(const struct dmi_system_id *dmi)
> >  {
> >       pr_info("Identified laptop model '%s'\n", dmi->ident);
> > @@ -163,6 +168,15 @@ static int dmi_matched(const struct dmi_system_id =
*dmi)
> >  }
> >
> >  static const struct dmi_system_id asus_quirks[] =3D {
> > +     {
> > +             .callback =3D dmi_matched,
> > +             .ident =3D "ASUSTeK COMPUTER INC. FA401",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "FA401"),
> > +             },
> > +             .driver_data =3D &quirk_asus_fa401,
> > +     },
> >       {
> >               .callback =3D dmi_matched,
> >               .ident =3D "ASUSTeK COMPUTER INC. Q500A",
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index a65090429..a0b678272 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -129,6 +129,18 @@ module_param(fnlock_default, bool, 0444);
> >  #define ASUS_SCREENPAD_BRIGHT_MAX 255
> >  #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
> >
> > +/* TUF RGB power state bitfields for DEVS(ASUS_WMI_DEVID_TUF_RGB_STATE=
) */
> > +#define TUF_RGB_STATE_CMD            0xbd
> > +#define TUF_RGB_STATE_SAVE           BIT(8)
> > +#define TUF_RGB_STATE_BOOT           (0x03 << 16)
> > +#define TUF_RGB_STATE_AWAKE          (0x0c << 16)
> > +#define TUF_RGB_STATE_SLEEP          (0x30 << 16)
> > +#define TUF_RGB_STATE_KEYBOARD               (0xc0 << 16)
> > +#define TUF_RGB_STATE_ALL_MODES              (TUF_RGB_STATE_BOOT | \
> > +                                      TUF_RGB_STATE_AWAKE | \
> > +                                      TUF_RGB_STATE_SLEEP | \
> > +                                      TUF_RGB_STATE_KEYBOARD)
> > +
> >  #define ASUS_MINI_LED_MODE_MASK              0x03
> >  /* Standard modes for devices with only on/off */
> >  #define ASUS_MINI_LED_OFF            0x00
> > @@ -308,6 +320,8 @@ struct asus_wmi {
> >       u32 nv_temp_target;
> >
> >       u32 kbd_rgb_dev;
> > +     u32 kbd_rgb_state_flags;
> > +     bool kbd_rgb_state_valid;
> >       bool kbd_rgb_state_available;
> >       bool oobe_state_available;
> >
> > @@ -1120,8 +1134,13 @@ static ssize_t kbd_rgb_state_store(struct device=
 *dev,
> >                                const char *buf, size_t count)
> >  {
> >       u32 flags, cmd, boot, awake, sleep, keyboard;
> > +     struct led_classdev *led;
> > +     struct asus_wmi *asus;
> >       int err;
> >
> > +     led =3D dev_get_drvdata(dev);
> > +     asus =3D container_of(led, struct asus_wmi, kbd_led);
> > +
> >       if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &k=
eyboard) !=3D 5)
> >               return -EINVAL;
> >
> > @@ -1138,6 +1157,9 @@ static ssize_t kbd_rgb_state_store(struct device =
*dev,
> >       if (keyboard)
> >               flags |=3D BIT(7);
> >
> > +     asus->kbd_rgb_state_flags =3D flags << 16;
> > +     asus->kbd_rgb_state_valid =3D true;
> > +
> >       /* 0xbd is the required default arg0 for the method. Nothing happ=
ens otherwise */
> >       err =3D asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
> >                       ASUS_WMI_DEVID_TUF_RGB_STATE, 0xbd | cmd << 8 | (=
flags << 16), 0, NULL);
>
> Interesting, is this using TUF_RGB_STATE_CMD as literal? Perhaps you
> should expand this into a patch series and make that conversion in
> preparatory patch.
>
> > @@ -5153,7 +5175,6 @@ static int asus_wmi_add(struct platform_device *p=
dev)
> >
> >       asus->egpu_enable_available =3D asus_wmi_dev_is_present(asus, ASU=
S_WMI_DEVID_EGPU);
> >       asus->dgpu_disable_available =3D asus_wmi_dev_is_present(asus, AS=
US_WMI_DEVID_DGPU);
> > -     asus->kbd_rgb_state_available =3D asus_wmi_dev_is_present(asus, A=
SUS_WMI_DEVID_TUF_RGB_STATE);
> >
> >       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
> >               asus->mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
> > @@ -5166,6 +5187,19 @@ static int asus_wmi_add(struct platform_device *=
pdev)
> >               asus->gpu_mux_dev =3D ASUS_WMI_DEVID_GPU_MUX_VIVO;
> >  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> >
> > +     /*
> > +      * FA401 series accepts the TUF RGB-state DEVS command but does n=
ot
> > +      * advertise the device through DSTS. Keep the normal DSTS probe =
for
> > +      * other models and force registration when the quirk is set.
> > +      */
> > +     asus->kbd_rgb_state_available =3D
> > +             asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STAT=
E) ||
> > +             asus->driver->quirks->kbd_rgb_state_quirk;
> > +     if (asus->driver->quirks->kbd_rgb_state_quirk) {
> > +             asus->kbd_rgb_state_flags =3D TUF_RGB_STATE_ALL_MODES;
> > +             asus->kbd_rgb_state_valid =3D true;
> > +     }
> > +
> >       asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS=
_WMI_DEVID_OOBE);
> >
> >       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL=
_POLICY))
> > @@ -5396,11 +5430,36 @@ static int asus_hotk_restore(struct device *dev=
ice)
> >
> >  static int asus_hotk_prepare(struct device *device)
> >  {
> > +     struct asus_wmi *asus =3D dev_get_drvdata(device);
> > +
> >       if (use_ally_mcu_hack =3D=3D ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
> >               acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> >                                          ASUS_USB0_PWR_EC0_CSEE_OFF);
> >               msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> >       }
> > +
> > +     /*
> > +      * The display server may blank the keyboard backlight before the
> > +      * kernel suspend path runs. Re-assert brightness and power-state
> > +      * flags so the EC enters S0ix with the correct state. Always use
> > +      * level 3 (max) because kbd_led_wk may already be zeroed by the
> > +      * display server at this point, and the sleep strobe requires a
> > +      * non-zero brightness to activate.
> > +      */
> > +     if (asus && asus->driver->quirks->kbd_rgb_state_quirk &&
> > +         asus->kbd_rgb_state_available && asus->kbd_rgb_state_valid &&
> > +         (asus->kbd_rgb_state_flags & TUF_RGB_STATE_SLEEP)) {
> > +             u8 brightness =3D 0x80 | 0x03; /* level 3 (max) + light-o=
n bit */
> > +
> > +             asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT,
> > +                                   brightness, NULL);
> > +             asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
> > +                                       ASUS_WMI_DEVID_TUF_RGB_STATE,
> > +                                       TUF_RGB_STATE_CMD | TUF_RGB_STA=
TE_SAVE |
> > +                                       asus->kbd_rgb_state_flags,
>
> This makes things more confusing overall.
>
> One should use FIELD_PREP() consistently for bitfields where a shift is
> needed but here you write a pre-shifted value. In the other place, this
> driver shifts (which should be converted to FIELD_PREP()) while making th=
e
> evaluate call.
>
> > +                                       0, NULL);
> > +     }
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asu=
s-wmi.h
> > index 5cd4392b9..69d224774 100644
> > --- a/drivers/platform/x86/asus-wmi.h
> > +++ b/drivers/platform/x86/asus-wmi.h
> > @@ -52,6 +52,7 @@ struct quirk_entry {
> >        */
> >       int no_display_toggle;
> >       u32 xusb2pr;
> > +     bool kbd_rgb_state_quirk;
> >  };
> >
> >  struct asus_wmi_driver {
> >
>
> --
>  i.
>
