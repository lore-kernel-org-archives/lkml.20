Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848229;
	b=Eg+LTaxF6v0Rcuy9O7Yl+Zv1SR12dv4kEEJo/cmWZV/HsjZm91rg3/UezfxkThY4pTk+
	 cv6dQy2vficlsU86rqFJ+g64I+FNe2fp5K5n3rwx+jvAJrKZOfUDy7PckOxna0pN/U63y
	 6SZfuuv92VFi5hYvAvsiqUWJlUX6S8hxt4lCS+hogtUDmD4te4j/pJq/4QniCxKqiZNqo
	 +oCOr03ilpK+ndRpdK2rCrQtYoPytvJNxDiqDR1IN8Dww1eV8cGyWm08X3DbKQMGB+K5t
	 FTnSWK59xQtC1m6vfGEHicocd5K/I8jfu/SDDepJVzcmTIxeJFVdKVAnswWo62Z6USA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848229;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ihPcbJ+Vb6nHbO8tsEJQxsCuMD2idQvF3dKfV9eNT3k=;
	b=GSU3c1JPxrqvilMuJpjjFx5lLFvG47Ui5VzJkiL0uXOM9t6/mEuxbP40O6btKIcEh6Y4
	 xfGl4HhOoGkcKdqf1uGyHXL8wRxOWS7p88hyyFs0Ez5FFLvAo3qx1QE4r7s7m/tvZA427
	 re/TbvTiReQdHV7wKFR6He6SvlwFFzUWq1JoZNX7f2eNyP1mlsXtog/iyx61GcSPO2yd7
	 94VGOi0KYLvBtpZxI4+y0RC4qCwwM6MWtutuF3PCCynejB0W0TSc3m87FpZE/b3y2RQc9
	 1v68olcmqBGqwOyMgif0NaIwb3cnWxF8/EdvgCXheQ5+xquKArteXuGKFm+vx75YPUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Yqt/tYi5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B097606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yqt/tYi5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211F21F000CF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794848229;
	bh=ihPcbJ+Vb6nHbO8tsEJQxsCuMD2idQvF3dKfV9eNT3k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Yqt/tYi5+ZGwIQFMIV16w9kVWjuuv8MPq2gLuQQHHz864LGcDoIK5AnvfxWMjI1a3
	 AIZmsae9+ORpJ6HXG/NF/pI6pZTpqaKqyJnkwCcWmRhoifXFzHDQcBz+tJB9jFPDB3
	 S6VzaZtLFYnY2b5cVZTOeYK9Uj9QBUpxivUnW+S+OCYG1iJAkHL4NuMcP9eiS5UWG0
	 53YFJk2W+922LiKMEfWkvd8yQBj8w4b2HKEyzBONpFiz4MwQIxD3JGwnEO41NLHSsx
	 ae9RiOUadY8rIXNciX2tpx6qgr6N4dZvIZqlnl+7hVyvOyH+lWMYqqy3gcxXZhfisw
	 1XyI1A0ZYESiQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae5ab4fcdcso4565631fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:57:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG1FF4qV687qY8IjpD6JWnpksJYT+f64cWSAmyaAxGZNC7wbbawPKhZiposi1mLIWPqbu4VtGD6B9bPsYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VDi8IYEA8Kv3UxWKTnAKVsYghc/oxIKdogiz2myTZDkKo4Q31
	SJ7T+2C3yr0CXmz/tGhYi+aJIeshpKtbC5uVhNv7bLMK/b1+iT4wdMLzArJX+46KHSTik81/1WJ
	UGg+WOcjJQTGgftLJy3/v9WiWIps6ZwA=
X-Received: by 2002:a2e:ac0b:0:b0:3a9:abd6:1acd with SMTP id
 38308e7fff4ca-3ae2b4b5d4bmr33782431fa.6.1794848227241; Mon, 16 Nov 2026
 08:57:07 -0800 (PST)
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
 <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com>
 <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com>
 <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com> <CAH87RzSJsk8ypdw0cDZzopeUxgPR1VdyiF_sHDLjKYR4AfzWXQ@mail.gmail.com>
In-Reply-To: <CAH87RzSJsk8ypdw0cDZzopeUxgPR1VdyiF_sHDLjKYR4AfzWXQ@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Nov 2026 00:56:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v65VY0OFaUuE9qX2JGRcGjEMGCKMjUUvurx7UBxDm+81rw@mail.gmail.com>
X-Gm-Features: AclHuK9eCzsnkZ4gGUBVKhOaPUkWgSy2T84SmEfd_eoJadqeR2ggIDq1fX6dZNU
Message-ID: <CAGb2v65VY0OFaUuE9qX2JGRcGjEMGCKMjUUvurx7UBxDm+81rw@mail.gmail.com>
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

On Tue, Nov 17, 2026 at 12:44=E2=80=AFAM Cristian Filipescu
<filipescu.cristian@gmail.com> wrote:
>
> On Mon, Nov 16, 2026 at 7:38=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > On Mon, Nov 16, 2026 at 7:47=E2=80=AFAM Cristian Filipescu
> > <filipescu.cristian@gmail.com> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > On Sun, Nov 15, 2026 at 3:14=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org=
> wrote:
> > > >
> > > > On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 R=
elay
> > > > <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> > > > >
> > > > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > >
> > > > > Add the board description for the Allwinner H6-based Orange Pi 3 =
LTS,
> > > > > including its regulators, storage, Ethernet PHY, LEDs and USB por=
ts.
> > > > >
> > > > > Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetect=
ion,
> > > > > which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> > > > > registration and keep reset outside interface detach so its confi=
gured
> > > > > 125 MHz clock output is retained. Use PHY-internal RGMII delays.
> > > > >
> > > > > Select the weakest GPIO drive level for both LEDs. Enable 1.8 V e=
MMC
> > > > > DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz=
.
> > > > >
> > > > > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-=
jernej.skrabec@gmail.com/
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> > > > >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++=
++++++++++++++
> > > > >  2 files changed, 380 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/=
boot/dts/allwinner/Makefile
> > > > > index aa21f58a4..7ea136380 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangep=
i-zero-plus.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > > > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-l=
ts.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > > new file mode 100644
> > > > > index 000000000..e2ca41b94
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > > @@ -0,0 +1,379 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > > > > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> > > >
> > > > We now have a common sun50i-h6-orangepi.dtsi file. You really shoul=
d
> > > > rewrite this patch to just use that as a base.  It is mostly the sa=
me
> > > > across all the OrangePi H6 boards.
> > >
> > > v4 now uses that include and keeps the LTS-specific additions
> > > and overrides. I compared the resolved DTBs to check the inherited
> > > properties and preserved the LTS electrical settings, except for the
> > > review changes described below. Common naming cleanups are deferred.
> >
> > [...]
> >
> > > > Set the supply on all cores.
> > >
> > > Done. All four running CPU nodes reference DCDCA, and all four CPUs a=
re
> > > online with the shared cpufreq policy.
> >
> > I should've mentioned that since this is already enabled at the .dtsi
> > level, you shouldn't add it anymore. If anything, it's the .dtsi file
> > that should have all cores referencing the regulator.
>
> Understood on the CPU supply. I have rebased onto sunxi/dt-for-7.5 at
> 098728144545 and removed the board-local CPU0-CPU3 supply declarations
> and CPU/GPU OPP includes. These are now inherited from the common
> Orange Pi H6 description. I also removed the redundant ramp-delay and
> CPU maximum-voltage overrides, keeping the existing LTS 800 mV minimum.
> Any all-core supply cleanup belongs in the common include.
>
> >
> > [...]
> >
> > > > > +&mmc1 {
> > > > > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > > > > +       vqmmc-supply =3D <&reg_bldo3>;
> > > >
> > > > Something is fishy here. The schematic also shows vcc-wifi-io (on t=
he aw859
> > > > side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at l=
east
> > > > checking with a multimeter to confirm what the voltage is on the VD=
DIO
> > > > pin of the module.
> > > >
> > >
> > > Regarding the AW859A I/O supply, I traced U60 pin 22 (VDDIO) to
> > > VCC-WIFI-IO, which is connected to BLDO3 in the schematic. I measured
> > > 1.8 V at an RW1 pad relative to board ground. This supports keeping t=
he
> > > existing BLDO3 vqmmc assignment; I have left it unchanged.
> >
> > You traced it on the board or on the schematic?
> >
> > Can you test at U60? The schematic has two options for I/O voltage from
> > the LDOs, and then another from VCC-WIFI, hence I would like to be
> > certain. I imagine the SMT components aren't labeled on the board, so
> > it would be somewhat hard / eye-hurting to trace the board directly.
> >
>
> The Wi-Fi connection trace was from the schematic. Initially I was worrie=
d I
> would short some pin, but I see pin 22 is at the edge. I have now measure=
d
> 1.8 V directly at U60/AW859A pin 22 (VDDIO), relative to board ground aft=
er
> the kernel boots.

Cool! Thanks for confirming.


ChenYu

> > [...]
> >
> > > > > +&usb2otg {
> > > > > +       dr_mode =3D "host";
> > > > > +       status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&usb2phy {
> > > > > +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC=
15 */
> > > >
> > > > This isn't connected to anything but a pull-up. And you already spe=
cified
> > > > host mode only above.
> > >
> > > Removed usb0_id_det-gpios with /delete-property/ so the common includ=
e's
> > > PC6 setting is removed too. USB0 remains fixed to host mode. The runn=
ing
> > > DT confirms the ID GPIO property is absent and dr_mode is host.
> >
> > Thanks!
> > ChenYu
>
>
> Regards,
> Cristian Filipescu
> ------------------------------------
