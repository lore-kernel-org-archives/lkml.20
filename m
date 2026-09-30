Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10CC511E61
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790802; cv=pass; b=f1IxdtmFQTsiBulCjNI6n5a6b79SbcY7CyJk3IQTYZMUWlxK/YPjZMG8sEA+htMcR40O69dr5VL1CetS+qRIU38L/dI4OAzWFR4q9hjtemtUwDJoJJBvecXksGJv1VxqsXgFrbvDPC5Hngvet/shhrt5k9BkUx+OporsOBBEkHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790802; c=relaxed/simple;
	bh=o3VIlTMxuOZrZ96VHRzt4yQ/gVvxjmLY0Xi72EOkAbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsYwgiL4+nugUS90bNMCWkKj12enmii/JbrA+50shhP2OrjIVmX84L1nQY8GyU2Yqs1t5WzUPM+rMLt4/XSApWlTgLIlHYYI9efmR/jNk6d/QvVn1lG4KptXyBSfqqpuyULY4TBNMVBaihxmvd38WDANGAeDBEnotH3j/9jXJwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEm31K/A; arc=pass smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEm31K/A"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc78d45f78fso3581842a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790790799; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJRIR+Qx4eI+C089lDGqyB2dA0M5dRgjX/8oIOQYzbAnPLBZCO+yqfmZ4Zqq2nhn9U
         txa1nldG15rcPE/kUOcCCXIhitWp2GUwxL8Oevo1Q46zqpkfpF7YJksyAvyVzh6U5haV
         M9Mn3JjZZ7mSNihsVR73Xl7DlugpgiosstRQk5d/L3i3mqM/HAuzEbrGikFMmz2031mn
         BAJSfMKmZ6kmXZkNGw7QXlr6cnPSGIqmRKGQjy+m+Y0iDppgAIzhVG18X1oz76/3C7es
         QzvXh3q87X6VclSbi6CoaMZJ9JB5AokujI8/NxXcOAq3P2KBFzhLPLXFGW5eiJs4iZXW
         FrCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kjuozAwciaOEQARJglehTP/0nPN82KmH5/o+wbMJJYM=;
        fh=+phSkkh5fHvxRrsl+kYdYJS8RtaH/f7W4N4PL0nR0X0=;
        b=V81QrtAc6wH4LT/H2AD1echIWJmBuSKajgr3aLZgxHZxsqwbFGH59TFzIw66nerz1k
         f+AEIwi99jKZz9tle9qeNRVl/5QSzcKTcYuIDsyB94tbvSNcrw2p2ebaJ032tMgaK6+m
         yur1fAw6ReiQTBqTvDWclCfp2BI9ScImmIaACSNzCrt5XdwPVvZBxraJ+AhuhzWguB5A
         oGysoPJHtfPUreG4gJ1rtGTbu3BCa5g6ahQjrhRSpmaHA9wfXM4JDRHa0S9AOhw66gPL
         4+0P8vWCJIU6i+T/yuzUnZiRQfPtN7EDZaKvE987cirK5RR5MyZbgDksDI+SihOhec+l
         R6Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790790799; x=1791395599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kjuozAwciaOEQARJglehTP/0nPN82KmH5/o+wbMJJYM=;
        b=NEm31K/AN4huSY2azOGTwkxI7M+bqfXOiQBnKt51qCYOqAMtIjY36qxRV3ysSZ7Djj
         gTkJDmI1Cp5E4XdSE55aT9G2Lk4jHyhgkJ2G0DX0OwHNT1oaUYsH5vasFZDL4lT316LC
         pW7k8P2gtbdDs02OaIclLAk3OjYAhccfpn01Wpg9f5eBVjsR4tPRyZTo0r/tXhFih1M5
         xA18czDg5S093FlLGLb8jBeysSdB15Y4dPgqw1FpurtcxXHSL4kpHPhe8rlNomXnCvrr
         JatxYiIGpBnFpSPotrTTiCwNn/byTUhhi01SiS8aLYR6V9Miny+UQVRfjYhE6rUm+3pn
         otuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790790799; x=1791395599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjuozAwciaOEQARJglehTP/0nPN82KmH5/o+wbMJJYM=;
        b=GtY7wAE6bM98QKLc+uEnvvLjIdf2Q5J3W513TEgKxvzbCxSiqoJe4/md3Lzy2JkH6u
         rHWcVKNoi1CCRBl1I2KNn6FzIu7Vg0p/c8kt4GcRaVbnPrXOsxHMb9La7tdKlKa7FWM+
         CImLtd4PPgzOApADL9FUo1htu5n0p4KpO4g1uZ3F2GnQlpwbsgSmcFxh64wbi036q67X
         B6gTyThZBaZ2jx0GL8ZwHSaUZUd4bxS5SuI/rxURCz3tGgAVbosa0rnKIFzlPOjDxlH7
         J8Z5vPppo7xSKxEtCFERXKevZ4M/suf+7ttSQ7Pfy5JGqn7cb/9FcBdjMK83BrOxp/ph
         IeGw==
X-Forwarded-Encrypted: i=1; AKwUvBzpoUjh50pBLuCy0IVvzpBipRvneg8ruMsCctvUbZVPqGhmcAD1+j72KCpsvqet+mWCxT9L7DznY9ZoVbA=@vger.kernel.org
X-Gm-Message-State: AFuF++lc6144rZYRwyd0D1ZE8hDLRGT829+ASQXQD3+uXxxzReXq6QTw
	WjDrD7Lh3tZlI+hP8MgHis84TrdNJGdLdDJN5j+E1+WlPPXOHLLPkRsVBviQ/UL7pu5lTU97Omm
	/Dm5D3w2gvNhFUjIstc0jBDmNbd49yGs=
X-Gm-Gg: AYBFou3ouKA5qwalThPEoVOre2eniLkLmcWBUpu8ReHX9G9k00kDc6cPvdFqBkVWPDW
	g2j71WQuHU4acoMVyXzh29o0lm+pndQWh7S/j2RquWeS871u9aBm2oj7zBv1D/BfwHiZkpCk+Q5
	ITB9enCMYQbdHHXE83OkdH2k/m1tXyvrdVpk7qnrVCGvVhlBLVanFzrFgDWx3ZDx8WQdcDAIuzs
	OrwSqcdCOmGIjhkRmlqRmPYohIebHd44a/W9C7YV+ECmwPLnPAc8Bd2Liy26rluRgWVpOY5goIA
	O9wH8NA3VL4MAJ1Y8cX472EwOum7ZD/Z5IvLFa94gG+mg7Zg8J3CgTv5DOhfWGVBfi+N2tk=
X-Received: by 2002:a05:6a21:6b0f:b0:3dd:a197:edf4 with SMTP id
 adf61e73a8af0-3de9e946e0dmr2073080637.67.1790790798771; Wed, 30 Sep 2026
 10:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927151016.186493-1-pmazzini@gmail.com> <20260927151016.186493-12-pmazzini@gmail.com>
 <eb443e72-403c-40c1-8ff7-203e0d4c7a94@arm.com>
In-Reply-To: <eb443e72-403c-40c1-8ff7-203e0d4c7a94@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 30 Sep 2026 18:52:35 +0100
X-Gm-Features: AclHuK-aUocNDJMiXcXVrKjqOQFBfal7ZTZCS2t9hXhvGkrxojTiCjV0ebQ1WqU
Message-ID: <CAAxh=jvkQiFXJQWEVSj2KQorHPYTPOxviN+H7r8ONYoGU9ysiw@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] ARM: sunxi: add B288 and the PocketBook Verse board
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

thanks for the detailed review.

> Are you planning on going ahead with just boot0 in the long run?

No, I'll work on U-Boot, but it needs the DT upstream first.

> And in general: how do you boot this device, then?

Over FEL: SPL, U-Boot and the kernel are loaded over USB.

> Can you please create a wiki page about the device

Will do.

> We typically don't hardcode memory nodes in the DT

Dropped for v3, U-Boot fills it in.

> please add the "disable-wp;" property.
> [...] just reference them here.

Done for v3.

> And are you sure the vmmc-supply is dldo2?

Yes: the vendor's board config maps the microSD vmmc to axp227_dldo2,
which is off at power-on.

> If this is a 1.8V eMMC, then please add the 1.8V properties

Added; the eMMC runs in HS200.

> Can you add a comment here that this is labelled as AXP227?
> Do you really need the always-on here?

Comment added. always-on dropped: the eMMC and the pin controller keep
DLDO1 enabled.

> What does "switched per card scan" mean?

The MMC core switches DLDO2 on only while a card is present. Reworded.

> I don't think we put the crystals in their own node anymore.
> So how does SMP work here, exactly?

Crystals moved out for v3. SMP will use PSCI from U-Boot.

> Meh, as the comments in the binding say: please fix your firmware ;-)

Dropped for v3, U-Boot sets CNTFRQ and CNTVOFF.

> [comments, function names, watchdog compatible, sunxi.c entry]

All done for v3: comments trimmed, mmc0/i2c0/mmc3 function names, a
B288 watchdog compatible with the A31 fallback, and the sunxi.c entry
dropped, as the generic machine works.

Thanks,
Pablo

On Wed, Sep 30, 2026 at 1:01=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> many thanks for cobbling this together, I do understand that this is
> tricky without schematics or even a manual.
>
> On 9/27/26 17:10, Pablo Mazzini wrote:
> > arm,cpu-registers-not-fw-configured is required: Allwinner's boot0 sets
> > neither CNTFRQ nor CNTVOFF, so the virtual timer storms. Same reason as
> > commit 121b96cd9d7e ("ARM: sun6i: Enable ARM arch timers").
>
> Are you planning on going ahead with just boot0 in the long run? Given
> the age of the platform, and it being close to the A64, I expect a
> U-Boot port being pretty straight-forward. Chances are the DRAM
> controller (the biggest hurdle here) is very similar to the H3/A64/R40
> generation, for which we already have a unified driver.
>
> And in general: how do you boot this device, then? I guess you somehow
> trick boot0 into booting a mainline kernel? Is there some documentation
> about this?
> Can you please create a wiki page about the device, and describe your
> device-specific findings in there? There is
> https://linux-sunxi.org/PocketBook_Basic_Lux_4_(PB618) already, which
> you can use as inspiration. Or maybe, if they are very similar, use that
> very page, even.
>
> > The watchdog interrupt was measured on hardware via GICD_ISPENDR.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   arch/arm/boot/dts/allwinner/Makefile          |   1 +
> >   .../allwinner/sun8i-b288-pocketbook-verse.dts | 122 +++++++
> >   arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 304 +++++++++++++++++=
+
> >   arch/arm/mach-sunxi/sunxi.c                   |   1 +
> >   4 files changed, 428 insertions(+)
> >   create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-=
verse.dts
> >   create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
> >
> > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/a=
llwinner/Makefile
> > index 75b2b6a2f7a6..2dfdc01e4825 100644
> > --- a/arch/arm/boot/dts/allwinner/Makefile
> > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > @@ -227,6 +227,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> >       sun8i-a83t-bananapi-m3.dtb \
> >       sun8i-a83t-cubietruck-plus.dtb \
> >       sun8i-a83t-tbs-a711.dtb \
> > +     sun8i-b288-pocketbook-verse.dtb \
> >       sun8i-h2-plus-bananapi-m2-zero.dtb \
> >       sun8i-h2-plus-libretech-all-h3-cc.dtb \
> >       sun8i-h2-plus-orangepi-r1.dtb \
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dt=
s b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
> > new file mode 100644
> > index 000000000000..91c89d5a097e
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
> > @@ -0,0 +1,122 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * PocketBook Verse (PB629), an Allwinner B288 based e-reader.
> > + */
> > +
> > +/dts-v1/;
> > +#include "sun8i-b288.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +     model =3D "PocketBook Verse";
> > +     compatible =3D "pocketbook,verse", "allwinner,sun8i-b288";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     memory@40000000 {
>
> We typically don't hardcode memory nodes in the DT, but leave this up to
> the bootloader to populate, based on either detection or hard-coding
> *there*.
> I guess this eBook reader only comes in this one configuration?
> Maybe we could allow this node in here, then, to increase compatiblity?
> Depends a bit on how involved this boot0 setup is, I guess.
>
> > +             device_type =3D "memory";
> > +             reg =3D <0x40000000 0x20000000>;
> > +     };
> > +};
> > +
> > +&uart0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply =3D <&reg_dldo2>;
> > +     bus-width =3D <4>;
> > +     cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
>
> I guess this is microSD, so without a write-protection switch? Then
> please add the "disable-wp;" property.
> Also this is missing the pinctrl properties, to describe the pinmux
> used. As you describe the PortB UART0 pins in the .dtsi, just reference
> them here.
>
> And are you sure the vmmc-supply is dldo2? Does the VCC pin on the SD
> card slot go to 0V when you turn that regulator off?
> Just asking because on this generation of devices we most often see
> DCDC1 supplying the SD card, as it needs to be powered at reset time, to
> allow the BROM reading from the SD card.
>
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc3 {
> > +     vmmc-supply =3D <&reg_dcdc1>;
> > +     vqmmc-supply =3D <&reg_dldo1>;
>
> If this is a 1.8V eMMC, then please add the 1.8V properties:
>          mmc-ddr-1_8v;
>          mmc-hs200-1_8v;
> (given that these modes work).
> And again the pinctrl nodes are missing.
>
> > +     bus-width =3D <8>;
> > +     non-removable;
> > +     cap-mmc-hw-reset;
> > +     status =3D "okay";
> > +};
> > +
> > +&pio {
> > +     vcc-pc-supply =3D <&reg_dldo1>;
> > +     vcc-pd-supply =3D <&reg_dldo1>;
> > +     /*
> > +      * PC and PD are named in the vendor rail list; PF is not. It is =
not
> > +      * on dldo2: with that rail off, a pull-up on PF6 still reads car=
d
> > +      * detect correctly, so the bank has its own supply. dcdc1 is the
> > +      * only remaining candidate, carrying vcc-io and vcc-card. Derive=
d
> > +      * from the rail naming plus that measurement, not from a schemat=
ic.
> > +      */
> > +     vcc-pf-supply =3D <&reg_dcdc1>;
>
> Yes, on older SoCs PortF is internally powered by the VCC-IO pin, and is
> fixed at 3.3V. Compare the datasheets from the A64 and H3, for instance.
> And VCC-IO is traditionally powered by DCDC1, since it needs the most jui=
ce.
> In any case, I think we don't need the comment, since it's a common setup=
.
>
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "okay";
> > +
> > +     axp22x: pmic@34 {
>
> Can you add a comment here that this is labelled as AXP227?
>
> > +             compatible =3D "x-powers,axp221";
> > +             reg =3D <0x34>;
> > +             interrupt-parent =3D <&nmi_intc>;
> > +             interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> > +     };
> > +};
> > +
> > +#include "axp22x.dtsi"
> > +
> > +&reg_dcdc1 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt =3D <3000000>;
> > +     regulator-max-microvolt =3D <3000000>;
> > +     regulator-name =3D "vcc-io";
> > +};
> > +
> > +&reg_dcdc2 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt =3D <1260000>;
> > +     regulator-max-microvolt =3D <1260000>;
> > +     regulator-name =3D "vdd-cpu";
> > +};
> > +
> > +&reg_dcdc4 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt =3D <1100000>;
> > +     regulator-max-microvolt =3D <1100000>;
> > +     regulator-name =3D "vdd-sys";
> > +};
> > +
> > +&reg_dcdc5 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt =3D <1350000>;
> > +     regulator-max-microvolt =3D <1350000>;
> > +     regulator-name =3D "vcc-dram";
> > +};
> > +
> > +&reg_aldo3 {
> > +     regulator-always-on;
> > +     regulator-min-microvolt =3D <3000000>;
> > +     regulator-max-microvolt =3D <3000000>;
> > +     regulator-name =3D "avcc";
> > +};
> > +
> > +&reg_dldo1 {
> > +     regulator-always-on;
>
> Do you really need the always-on here?
> Does it power more than the eMMC? Can you boot from SD card and use the
> system with that property removed, and the kernel turning it off?
>
> > +     regulator-min-microvolt =3D <1800000>;
> > +     regulator-max-microvolt =3D <1800000>;
> > +     regulator-name =3D "vcc-pc";
> > +};
> > +
> > +&reg_dldo2 {
> > +     /* Powers the microSD slot (slot pin 4), switched per card scan. =
*/
>
> What does "switched per card scan" mean?
> And it's rather uncommon to see the SD card powered by a separate PMIC
> line, since it needs to be on at reset, to allow the BROM to access it.
> According to the AXP221 datasheet, dldo2 is off at reset, so can you
> please somehow check this? It might be different on the AXP227, but
> worth a try, I think.
>
> > +     regulator-min-microvolt =3D <3300000>;
> > +     regulator-max-microvolt =3D <3300000>;
> > +     regulator-name =3D "vcc-sdcv";
> > +};
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi b/arch/arm/boo=
t/dts/allwinner/sun8i-b288.dtsi
> > new file mode 100644
> > index 000000000000..f5feec87defc
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
> > @@ -0,0 +1,304 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Allwinner B288 (sun8iw10p1) SoC
> > + *
> > + * Addresses and interrupts come from the PocketBook Verse (PB629) ven=
dor
> > + * device tree, cross-checked against the BSP clk-sun8iw10.c.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/sun8i-b288-ccu.h>
> > +#include <dt-bindings/reset/sun8i-b288-ccu.h>
> > +
> > +/ {
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <1>;
> > +     interrupt-parent =3D <&gic>;
> > +
> > +     clocks {
>
> I don't think we put the crystals in their own node anymore. I see that
> we did this for the 32-bit Allwinner SoCs, but it's pointless.
>
> > +             osc24M: osc24M-clk {
> > +                     #clock-cells =3D <0>;
> > +                     compatible =3D "fixed-clock";
> > +                     clock-frequency =3D <24000000>;
> > +                     clock-output-names =3D "osc24M";
> > +             };
> > +
> > +             osc32k: osc32k-clk {
> > +                     #clock-cells =3D <0>;
> > +                     compatible =3D "fixed-clock";
> > +                     clock-frequency =3D <32768>;
> > +                     clock-output-names =3D "osc32k";
> > +             };
> > +     };
> > +
> > +     cpus {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             cpu0: cpu@0 {
> > +                     compatible =3D "arm,cortex-a7";
> > +                     device_type =3D "cpu";
> > +                     reg =3D <0>;
> > +                     clocks =3D <&ccu CLK_CPUX>;
> > +                     clock-names =3D "cpu";
> > +             };
> > +
> > +             cpu1: cpu@1 {
> > +                     compatible =3D "arm,cortex-a7";
> > +                     device_type =3D "cpu";
> > +                     reg =3D <1>;
> > +                     clocks =3D <&ccu CLK_CPUX>;
> > +                     clock-names =3D "cpu";
> > +             };
> > +     };
>
>
> So how does SMP work here, exactly? For the later 32-bit SoCs, we rely
> on a PSCI implmenetation in U-Boot, and I would strongly recommend doing
> so here as well.
>
> > +
> > +     timer {
> > +             compatible =3D "arm,armv7-timer";
> > +             interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_=
TYPE_LEVEL_LOW)>,
> > +                          <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TY=
PE_LEVEL_LOW)>,
> > +                          <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TY=
PE_LEVEL_LOW)>,
> > +                          <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TY=
PE_LEVEL_LOW)>;
> > +             clock-frequency =3D <24000000>;
> > +             arm,cpu-registers-not-fw-configured;
>
> Meh, as the comments in the binding say: please fix your firmware ;-)
> I am not completely against it if boot0 is the firmware to use for a
> while, but if we go with U-Boot, it would be nicely fixed there.
>
> > +     };
> > +
> > +     soc {
> > +             compatible =3D "simple-bus";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
> > +             ranges;
> > +
> > +             /*
> > +              * mmc0 is a v4p1x controller, so it runs in the old timi=
ng
> > +              * mode and needs the sample and output phase clocks.
>
> I think the comment can end here.
> But it would need to be moved below, above the actual mmc0 node.
>
> >               Do not
> > +              * give it the sun50i-a64-mmc fallback: that selects the =
new
> > +              * timing mode, which this block does not implement.
> > +              */
> > +             nmi_intc: interrupt-controller@1c000d0 {
> > +                     compatible =3D "allwinner,sun8i-b288-nmi",
> > +                                  "allwinner,sun9i-a80-nmi";
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <2>;
> > +                     reg =3D <0x01c000d0 0x0c>;
> > +                     interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> > +             };
> > +
> > +             mmc0: mmc@1c0f000 {
> > +                     compatible =3D "allwinner,sun8i-b288-mmc",
> > +                                  "allwinner,sun7i-a20-mmc";
> > +                     reg =3D <0x01c0f000 0x1000>;
> > +                     clocks =3D <&ccu CLK_BUS_SDMMC0_BUS>,
> > +                              <&ccu CLK_MMC0>,
> > +                              <&ccu CLK_MMC0_OUTPUT>,
> > +                              <&ccu CLK_MMC0_SAMPLE>;
> > +                     clock-names =3D "ahb", "mmc", "output", "sample";
> > +                     resets =3D <&ccu RST_BUS_MMC0>;
> > +                     reset-names =3D "ahb";
> > +                     interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&mmc0_pins>;
> > +                     status =3D "disabled";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +             };
> > +
> > +             /* SDXC v4.5. The soldered eMMC; shares the PC pads with =
mmc2. */
>
> This comment should go. Pinmuxing is described separately, and "the
> soldered eMMC" does not belong into a .dtsi file, since it's board specif=
ic.
> If you really want to document some of your findings, you can do so in
> the commit message.
>
> > +             mmc3: mmc@1c12000 {
> > +                     compatible =3D "allwinner,sun8i-b288-emmc",
> > +                                  "allwinner,sun50i-a64-emmc";
> > +                     reg =3D <0x01c12000 0x1000>;
> > +                     clocks =3D <&ccu CLK_BUS_SDMMC3_BUS>, <&ccu CLK_M=
MC3>;
> > +                     clock-names =3D "ahb", "mmc";
> > +                     resets =3D <&ccu RST_BUS_MMC3>;
> > +                     reset-names =3D "ahb";
> > +                     interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&mmc3_pins>;
> > +                     status =3D "disabled";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +             };
> > +
> > +             /*
> > +              * mmc2 (0x01c11000) is an SDHCI-style controller, not SD=
XC, and
> > +              * has no upstream binding. It loses the PC pad arbitrati=
on to
> > +              * mmc3 and is unused here, so it is left undescribed rat=
her than
> > +              * given a wrong compatible.
> > +              */
>
> You can shorten the comment to:
>         "mc2 @0x01c11000 is an unsupported SDHCI-style controller."
>
> > +
> > +             ccu: clock-controller@1c20000 {
> > +                     compatible =3D "allwinner,sun8i-b288-ccu";
> > +                     reg =3D <0x01c20000 0x400>;
> > +                     clocks =3D <&osc24M>, <&osc32k>;
> > +                     clock-names =3D "hosc", "losc";
> > +                     #clock-cells =3D <1>;
> > +                     #reset-cells =3D <1>;
> > +             };
> > +
> > +             rtc: rtc@1c20400 {
> > +                     compatible =3D "allwinner,sun8i-b288-rtc";
> > +                     reg =3D <0x01c20400 0x400>;
> > +                     interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clock-output-names =3D "osc32k";
> > +                     clocks =3D <&osc32k>;
> > +                     #clock-cells =3D <1>;
> > +             };
> > +
> > +             pio: pinctrl@1c20800 {
> > +                     compatible =3D "allwinner,sun8i-b288-pinctrl";
> > +                     reg =3D <0x01c20800 0x400>;
> > +                     interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32=
k>;
> > +                     clock-names =3D "apb", "hosc", "losc";
> > +                     gpio-controller;
> > +                     #gpio-cells =3D <3>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <3>;
> > +
> > +                     mmc0_pins: mmc0-pins {
> > +                             pins =3D "PF0", "PF1", "PF2",
> > +                                    "PF3", "PF4", "PF5";
> > +                             function =3D "sdc0";
>
> We do not use the BSP function naming, but "mmc0" instead.
>
> > +                             allwinner,pinmux =3D <2>;
> > +                             drive-strength =3D <30>;
> > +                             bias-pull-up;
> > +                     };
> > +
> > +                     i2c0_pins: i2c0-pins {
> > +                             pins =3D "PB6", "PB7";
> > +                             function =3D "twi0";
>
> Same here, "i2c0" please.
>
> > +                             allwinner,pinmux =3D <2>;
> > +                     };
> > +
> > +                     mmc3_pins: mmc3-pins {
> > +                             pins =3D "PC1", "PC4", "PC5", "PC6",
> > +                                    "PC7", "PC8", "PC9", "PC10",
> > +                                    "PC11", "PC12", "PC13", "PC14";
> > +                             function =3D "sdc3";
>
> function =3D "mmc3";
>
> > +                             allwinner,pinmux =3D <5>;
> > +                             drive-strength =3D <40>;
> > +                             bias-pull-up;
> > +                     };
> > +
> > +                     uart0_pb_pins: uart0-pb-pins {
> > +                             pins =3D "PB4", "PB5";
> > +                             function =3D "uart0";
> > +                             allwinner,pinmux =3D <2>;
> > +                     };
> > +             };
> > +
> > +             wdt: watchdog@1c20ca0 {
> > +                     compatible =3D "allwinner,sun6i-a31-wdt";
>
> I think lately we used this as a fallback, paired with a SoC specific
> compatible first.
> In many aspects the more recent DTs under the arch/arm64 directory are
> more modern and a better source to copy from.
> > +                     reg =3D <0x01c20ca0 0x20>;
> > +                     interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&osc24M>;
> > +             };
> > +
> > +             uart0: serial@1c28000 {
> > +                     compatible =3D "snps,dw-apb-uart";
> > +                     reg =3D <0x01c28000 0x400>;
> > +                     interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > +                     reg-shift =3D <2>;
> > +                     reg-io-width =3D <4>;
> > +                     clocks =3D <&ccu CLK_BUS_UART0>;
> > +                     resets =3D <&ccu RST_BUS_UART0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             uart1: serial@1c28400 {
> > +                     compatible =3D "snps,dw-apb-uart";
> > +                     reg =3D <0x01c28400 0x400>;
> > +                     interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> > +                     reg-shift =3D <2>;
> > +                     reg-io-width =3D <4>;
> > +                     clocks =3D <&ccu CLK_BUS_UART1>;
> > +                     resets =3D <&ccu RST_BUS_UART1>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             uart2: serial@1c28800 {
> > +                     compatible =3D "snps,dw-apb-uart";
> > +                     reg =3D <0x01c28800 0x400>;
> > +                     interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> > +                     reg-shift =3D <2>;
> > +                     reg-io-width =3D <4>;
> > +                     clocks =3D <&ccu CLK_BUS_UART2>;
> > +                     resets =3D <&ccu RST_BUS_UART2>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             uart3: serial@1c28c00 {
> > +                     compatible =3D "snps,dw-apb-uart";
> > +                     reg =3D <0x01c28c00 0x400>;
> > +                     interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> > +                     reg-shift =3D <2>;
> > +                     reg-io-width =3D <4>;
> > +                     clocks =3D <&ccu CLK_BUS_UART3>;
> > +                     resets =3D <&ccu RST_BUS_UART3>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             uart4: serial@1c29000 {
> > +                     compatible =3D "snps,dw-apb-uart";
> > +                     reg =3D <0x01c29000 0x400>;
> > +                     interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> > +                     reg-shift =3D <2>;
> > +                     reg-io-width =3D <4>;
> > +                     clocks =3D <&ccu CLK_BUS_UART4>;
> > +                     resets =3D <&ccu RST_BUS_UART4>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             i2c0: i2c@1c2ac00 {
> > +                     compatible =3D "allwinner,sun8i-b288-i2c",
> > +                                  "allwinner,sun6i-a31-i2c";
> > +                     reg =3D <0x01c2ac00 0x400>;
> > +                     interrupts =3D <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&ccu CLK_BUS_TWI0>;
> > +                     resets =3D <&ccu RST_BUS_I2C0>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&i2c0_pins>;
> > +                     status =3D "disabled";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +             };
> > +
> > +             i2c1: i2c@1c2b000 {
> > +                     compatible =3D "allwinner,sun8i-b288-i2c",
> > +                                  "allwinner,sun6i-a31-i2c";
> > +                     reg =3D <0x01c2b000 0x400>;
> > +                     interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&ccu CLK_BUS_TWI1>;
> > +                     resets =3D <&ccu RST_BUS_I2C1>;
> > +                     status =3D "disabled";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +             };
> > +
> > +             i2c2: i2c@1c2b400 {
> > +                     compatible =3D "allwinner,sun8i-b288-i2c",
> > +                                  "allwinner,sun6i-a31-i2c";
> > +                     reg =3D <0x01c2b400 0x400>;
> > +                     interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&ccu CLK_BUS_TWI2>;
> > +                     resets =3D <&ccu RST_BUS_I2C2>;
> > +                     status =3D "disabled";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +             };
> > +
> > +             gic: interrupt-controller@1c81000 {
> > +                     compatible =3D "arm,gic-400";
> > +                     reg =3D <0x01c81000 0x1000>,
> > +                           <0x01c82000 0x2000>,
> > +                           <0x01c84000 0x2000>,
> > +                           <0x01c86000 0x2000>;
> > +                     interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2)=
 | IRQ_TYPE_LEVEL_HIGH)>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells =3D <3>;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
> > index e1b7945aac99..c5b19d0e63f9 100644
> > --- a/arch/arm/mach-sunxi/sunxi.c
> > +++ b/arch/arm/mach-sunxi/sunxi.c
> > @@ -61,6 +61,7 @@ MACHINE_END
> >   static const char * const sun8i_board_dt_compat[] =3D {
> >       "allwinner,sun8i-a23",
> >       "allwinner,sun8i-a33",
> > +     "allwinner,sun8i-b288",
>
> Do we really need that entry? Or at least do we need the timer init part
> of that?
> And in any case it doesn't belong into the DT patch, as it's Linux code,
> not DT or binding related.
>
> Cheers,
> Andre
>
> >       "allwinner,sun8i-h2-plus",
> >       "allwinner,sun8i-h3",
> >       "allwinner,sun8i-r40",
>
