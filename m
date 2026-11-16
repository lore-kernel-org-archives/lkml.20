Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839911;
	b=yeBINdGyAss3sMwWDZWKyKVBg1mT+KAv4ff/jom9/B/Irie+65TizODqCjIr302KC6VQ
	 mw8727UXbR6Q22OYWh7sJ+w0NG/YA06wwrE9/BkWEaJjMA5bXjQtvqWF2uZ6kAUdHTaTk
	 Af4LVP3eLFe4HQi4O391vX+99NaAfqL/dbSBW0jo7Bv8ezlxzQke+OycgzhXtjHNyOsTi
	 L7Fm+PZJMNTTedhGUMwj5bPMOXhldGf2/LQP2U4m8nwjCLIszzbwYjycJrkPisHshjocc
	 b6PXpJ9P9IjLc+bqUB0qwN8DdrJN+yB2pzK8luhuzxZgWl+NDAjWCF6TPI3Pjrnevgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839911;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AB+oE85rBz3kYmqVCq+Wu2uFRwaOKmFVZVyN/Ci/tK8=;
	b=noaYd8JqJ6YltEDi29f0RLRyqqxYQzDjS2dXC8a7hUaJ6Dipj2xv/l9aCuTcUIuXSlkS
	 hoctuwabH9z897tXoZPAQoR1lbr9LYcgLTPtSZR02L+ZFXe65k9yvtiM6PfoFT0O2mN8H
	 579XlGLZh69uD+3VvmLp89pVB28Xq+qLHFNIgZSrlliizRGkGEuGh1tdS/AarswSbVUV3
	 EDZVh/K/dy93iQN0fm6c0TA9RTsekbriHz7icMwybeyPME33Q1Ycr04cLvurvc/h880ci
	 zKojhWdrrc8OyY43X4tYWLMx/B7bn+i7IVGoPU3B7+gRWG3hhyAOvOwPC4Zx5Ti2RSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/vP6umn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F83F606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/vP6umn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D124A1F000CF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839910;
	bh=AB+oE85rBz3kYmqVCq+Wu2uFRwaOKmFVZVyN/Ci/tK8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=H/vP6umnpg8doI5lkkWefq+xXfyvGElZk8fQLWEIscLnlwSeBgmYHRXZxcPyPbakk
	 K4h/NnosT92GjGhxzcv1UGNmTNRlgHog2mDzmAqP4h+FL7Bka3t3W2pP9wWnS9B/k/
	 3/UXDvz9qLBS8asJOU1YAmNtDJAOXtSlqJ1CK7ocsdl6blwRi78YtUfGmofT/EE/ET
	 UM5SEV+m91UMb478Z8XVpg0MJFfpLcWetufctlmvhOVW8lpW4zjNfgpksVpUtS3Eu1
	 U236iqOy/gQKIyH5MMwVCkj5XDreYY+zRQhf9wSJuWxMwAiBQwJfeldLqsPTe+OkXk
	 oT1aPMz5L8RhQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso2046650e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:38:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH5Q9O/EkO7gNJf6pa9Nq9oHMxIQLqXV+Rn8krLudkN2u8cO0VGjnFraVsKvfoeDDig64cneNPsrgG3b7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/++xH6Gz3Kq2heaRU1gT8JcuPf6tV/VK1ArRQS5Ki87CRnjf+Q
	GkCUjuBwJqnqxl1eTGA2GHqcQoRLCO8J1Dh0RE4HpBtQWRs/2dPYWNAHGLBk8Ba8M5y5CzETYsE
	PO0VOGsMmxSZM8SI8VYSPayNHjuk7YJg=
X-Received: by 2002:a05:6512:2204:b0:5c1:5984:a67e with SMTP id
 2adb3069b0e04-5c170b7e0bbmr4090987e87.56.1794839909219; Mon, 16 Nov 2026
 06:38:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
 <20261026-sunxi-orangepi-3-lts-v3-2-98fef4f75184@gmail.com>
 <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com> <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com>
In-Reply-To: <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 16 Nov 2026 22:38:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
X-Gm-Features: AclHuK96KoHqco8_GcNqfELYX9slSpaQgkQilXtuce9_buWQRgFm-Lbh0tQJI6I
Message-ID: <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: Cristian Filipescu <filipescu.cristian@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:47=E2=80=AFAM Cristian Filipescu
<filipescu.cristian@gmail.com> wrote:
>
> Hi Chen-Yu,
>
> On Sun, Nov 15, 2026 at 3:14=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
> > <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> > >
> > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >
> > > Add the board description for the Allwinner H6-based Orange Pi 3 LTS,
> > > including its regulators, storage, Ethernet PHY, LEDs and USB ports.
> > >
> > > Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetection,
> > > which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> > > registration and keep reset outside interface detach so its configure=
d
> > > 125 MHz clock output is retained. Use PHY-internal RGMII delays.
> > >
> > > Select the weakest GPIO drive level for both LEDs. Enable 1.8 V eMMC
> > > DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz.
> > >
> > > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-jern=
ej.skrabec@gmail.com/
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> > >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++=
++++++++++
> > >  2 files changed, 380 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot=
/dts/allwinner/Makefile
> > > index aa21f58a4..7ea136380 100644
> > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-ze=
ro-plus.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.d=
ts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > new file mode 100644
> > > index 000000000..e2ca41b94
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > @@ -0,0 +1,379 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> >
> > We now have a common sun50i-h6-orangepi.dtsi file. You really should
> > rewrite this patch to just use that as a base.  It is mostly the same
> > across all the OrangePi H6 boards.
>
> v4 now uses that include and keeps the LTS-specific additions
> and overrides. I compared the resolved DTBs to check the inherited
> properties and preserved the LTS electrical settings, except for the
> review changes described below. Common naming cleanups are deferred.

[...]

> > Set the supply on all cores.
>
> Done. All four running CPU nodes reference DCDCA, and all four CPUs are
> online with the shared cpufreq policy.

I should've mentioned that since this is already enabled at the .dtsi
level, you shouldn't add it anymore. If anything, it's the .dtsi file
that should have all cores referencing the regulator.

[...]

> > > +&mmc1 {
> > > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > > +       vqmmc-supply =3D <&reg_bldo3>;
> >
> > Something is fishy here. The schematic also shows vcc-wifi-io (on the a=
w859
> > side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at least
> > checking with a multimeter to confirm what the voltage is on the VDDIO
> > pin of the module.
> >
>
> Regarding the AW859A I/O supply, I traced U60 pin 22 (VDDIO) to
> VCC-WIFI-IO, which is connected to BLDO3 in the schematic. I measured
> 1.8 V at an RW1 pad relative to board ground. This supports keeping the
> existing BLDO3 vqmmc assignment; I have left it unchanged.

You traced it on the board or on the schematic?

Can you test at U60? The schematic has two options for I/O voltage from
the LDOs, and then another from VCC-WIFI, hence I would like to be
certain. I imagine the SMT components aren't labeled on the board, so
it would be somewhat hard / eye-hurting to trace the board directly.

[...]

> > > +&usb2otg {
> > > +       dr_mode =3D "host";
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&usb2phy {
> > > +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 *=
/
> >
> > This isn't connected to anything but a pull-up. And you already specifi=
ed
> > host mode only above.
>
> Removed usb0_id_det-gpios with /delete-property/ so the common include's
> PC6 setting is removed too. USB0 remains fixed to host mode. The running
> DT confirms the ID GPIO property is absent and dr_mode is host.

Thanks!
ChenYu
