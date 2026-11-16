Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847456;
	b=cB6hvYZXVwfDU8h7FKjKvuYDWrrot4Ca/6HcGJq+fLqfaYwfnnLT6ZInT33nVQiTazYD
	 XsZkpkFAjaw6GKSN0e5vv4tNJ8caJmLjqh7UPwI2fAw3f7sxkRxDSWiLtMYVFi3BntMx5
	 PFjNv+wqUOKYqW4uzehEprUhKE0/T2spdEZifqg6yzVezEqIM5Zzx6Qk/0CPaxJFUDUF8
	 0zvt7IAQTiAhpAN7wFoXaSYhbNbMxFJeJAN/qVKry5L6XLMLrzMtqw6PbZzH0mMNVmh+D
	 Ixm4XLo4DTh6qef8NEtE7fismLX2dCjP1aWSRWmYeLgtG806ow2/G/2nSO6beeaV/2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
	b=BEzurUH9YkSI05OJzWbQPLhQiTGQZ3JO12b2Hds9MINBO1nsHdbY40tBLH/cSQqvdUpy
	 SXQJgGWzoHmUXOFWI6egGvV9wJqxs880SfrW2GeBCC3x67IbCN8gGmvb3gFO6Heuw8aqH
	 izb9tFvtJht3Ubr3m0KBHdr1p1gSP9m4g8yf4HSZ2ALDOAp+06KNcnSXsgbyJ5eqCFt/C
	 sS/aOEIBVMJmxCk1WRmQb2yi6sGGpscX0xGzX2up62dRZ6gbIhaqOgwmdJ/FzTimhvM8u
	 TfNv7Sp7wgrLDXjkxa1vfIgmiDkX8AlUZOs9gjcXIg1Zxb//FJdD6d4tB9eYT4QHiMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTtDBo6K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E677606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E677606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTtDBo6K
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ee27c9eec0so952558e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847455; cv=none;
        d=google.com; s=arc-20260327;
        b=ORRhGTFRstBfMW8K6JwTGZ0m9abAe9R76/5ZRHVEEMCgCoy6Ito5tqruWvTluT9ZsX
         KUGwctp4a8yYjmqxVbDwM3Wr9bgpPRf6ZkOe4igmAJPpjdOAjm/5xAxoY5f6pgHRIC+v
         XNFtdTJHh8HhxObrs2g77W6BipBemmnHi7E2tvIpRTlF7RVak8WbXuDIMkwu1MYKNWad
         Bp+y9MpypZQB8JAaLa9GShTJDmo1pwwSmm0yD0Z02z62cbc3397yZNEywGR6pkjoPq0K
         9VBOs28JIsLRAO/E7SkIszJPWBOiKzqRJUlwgGzs3bkUSLSJUZNbVJCnfw3wWHiD/QoJ
         +tNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        fh=PoCF2TWma5NXJvYrW0Pi/PXv84eor83+MJJXYegJXPM=;
        b=prW0VD5HZ/bbs7pDAHL/us1lJhTEIvX8E7uPehCemdGGrnFiRikRzsPz2HjOMxtVj2
         AWEQhHPhtqgkY50ZotVuEqWSRmRuD5/d82Tn9nj7Yg+xEGYaOjGeyw4Wx/plFoCFmvnO
         t0AKu+WAwxl7qTv5dgNuqGuV1LkzfXXIX1puOsJGhTOYaeF1W5vUU+knuqyzmU/OqdN/
         eeMNUYtPsjuarW1EJyPGI2Dpx4IMMU4fi+mYxxhW8fCtlXmLqwTHs1rV8M6alAELPwI3
         b1WlsC0hrKvEAZDWcG4Byz8xsZ45r9VZpQffmXh6aESVQjEOSMa6uZQOGzFl9CuB2t6P
         wBpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847455; x=1795452255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        b=iTtDBo6Kk2Q4CljPkycU6qu+JfrYwUurrLMJEv7e7BJcRsJfeLg0v5BzqjWQzcJQps
         +GAkNNhCOtKxve9dKSG8tPUVWxFmc5/gj22YaH/U72/n0AjTXNtgfFbEcgzaVnbreVnF
         /9qoNFm/W/xondSZ6QoFjc9OkKqh8UyAQ910226Ed0BtQ67DAq3Ud7mJ2bGPHTAO7/4o
         9wqPmohwLy/Jzey5Uf0Bk/6m+GWwDOge/l5z8jKMF803BLtMLVKZFJIYyyVk4l7fTBWO
         U6CeYQQGKNWXImLLLe/9VELwb9bNU8iTw1le0s0XQDBPxonOMnZ7zw/7Rqm0Q83cthf1
         WZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847455; x=1795452255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        b=ppOTGBQ4oLknk+WXzVTMXT0KI5yYIgujsZF8B9fXDYgfgjYrmhIUf9u3bzPCeDm1s9
         hX97mZ8XodcBuB6TyNH7DBsb3o6FdLnwl/zqQZSC/UUtDVzkKccfnuWJyhMZSrBHoL40
         oH1ziX0ADJUOTNd5TY92W1ZpHBY4MeLf5NIWOcrS7hNZGzZVLXkY9RcG8OsJvgIOJl5X
         INnSGfVNp4cUiTk99qrMdl+DDELO1OTPUvcYZlrJFT6zjZLOIIEjAjxYpjZfpjN4tiwt
         p15EOhzyEtthvD3udRKk1KMCO7soduhaKW7aDm4s3awR3yWGtGU6JNGBRrZze8p50Tkz
         BNcw==
X-Forwarded-Encrypted: i=1; AL+hErEZ8dtJ7ybnWXbvjTmr8GJ+c2SYA43NWy8sHPeBZDznaKu4nCfzwdkNJaMb2G3VYwl4LGYdtfZii7KBjhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oP+30LIrAYOXXi7CkHRfdh8Acf1yydZQ/tfZ2jRXM0G3Un6ov
	I9n5GReQ8RyAh4A7oP3YUqHKZhaFZ7JUmqJaDGsXhZ/2nfc0PTXiwZEMFBKx5Co4Z3fCZBza1GQ
	a/96dJn2Qk2Qjhpx4f1OHenr2pGaGtp0=
X-Gm-Gg: AYBFou0rq/8vNWiZxVInpdJ66v5ZMxWt1fKLesZwBAv+gJ3VJgfElm3SnwmD18qGSby
	iB7FNfWnldnvZoehufH27IovlxacjX1KoOrb9JkUKa8842bYVZkFr/noty+6jt1QrFa4yvksLTD
	VbQqkXBezmmCrqlnqsJx1k+Y70cSfc45zHvPLffa/4jQbvmaQ+65eUDGTpZ7o7ul3d9DG7POoX0
	EEApmt5ylYnf+jeXjLf30mz8ff+o0vnBbDM1drW5lB0wkeCdAhfkpq2VoNRpDDKGYJoO6YXplZX
	EP7LxffH6RbEtMBZgt0JFBGktqcgG4/pVXtS1azMn9g0Rnvq6VPDLttGb94xIFOhsBaatQe4a48
	FNcQDmrWiM8o0zxdMDBpNMAMBSmxsi+nTQaerBbEJBAEfBbosOv6BU5UtB016d7LRnuyECQ==
X-Received: by 2002:a05:6122:1d15:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ee3465027cmr4058583e0c.2.1794847455049; Mon, 16 Nov 2026
 08:44:15 -0800 (PST)
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
 <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com> <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
In-Reply-To: <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Mon, 16 Nov 2026 09:44:04 -0700
X-Gm-Features: AclHuK8dnGWqOScVe0Mt4jfgEl7XJ4HJYdFbZQ9_mRCIbIF03B9UBE-gzV7FCFI
Message-ID: <CAH87RzSJsk8ypdw0cDZzopeUxgPR1VdyiF_sHDLjKYR4AfzWXQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:38=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Nov 16, 2026 at 7:47=E2=80=AFAM Cristian Filipescu
> <filipescu.cristian@gmail.com> wrote:
> >
> > Hi Chen-Yu,
> >
> > On Sun, Nov 15, 2026 at 3:14=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> =
wrote:
> > >
> > > On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Rel=
ay
> > > <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Add the board description for the Allwinner H6-based Orange Pi 3 LT=
S,
> > > > including its regulators, storage, Ethernet PHY, LEDs and USB ports=
.
> > > >
> > > > Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetectio=
n,
> > > > which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> > > > registration and keep reset outside interface detach so its configu=
red
> > > > 125 MHz clock output is retained. Use PHY-internal RGMII delays.
> > > >
> > > > Select the weakest GPIO drive level for both LEDs. Enable 1.8 V eMM=
C
> > > > DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz.
> > > >
> > > > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-je=
rnej.skrabec@gmail.com/
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> > > >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++=
++++++++++++
> > > >  2 files changed, 380 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/bo=
ot/dts/allwinner/Makefile
> > > > index aa21f58a4..7ea136380 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-=
zero-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > new file mode 100644
> > > > index 000000000..e2ca41b94
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > @@ -0,0 +1,379 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > > > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> > >
> > > We now have a common sun50i-h6-orangepi.dtsi file. You really should
> > > rewrite this patch to just use that as a base.  It is mostly the same
> > > across all the OrangePi H6 boards.
> >
> > v4 now uses that include and keeps the LTS-specific additions
> > and overrides. I compared the resolved DTBs to check the inherited
> > properties and preserved the LTS electrical settings, except for the
> > review changes described below. Common naming cleanups are deferred.
>
> [...]
>
> > > Set the supply on all cores.
> >
> > Done. All four running CPU nodes reference DCDCA, and all four CPUs are
> > online with the shared cpufreq policy.
>
> I should've mentioned that since this is already enabled at the .dtsi
> level, you shouldn't add it anymore. If anything, it's the .dtsi file
> that should have all cores referencing the regulator.

Understood on the CPU supply. I have rebased onto sunxi/dt-for-7.5 at
098728144545 and removed the board-local CPU0-CPU3 supply declarations
and CPU/GPU OPP includes. These are now inherited from the common
Orange Pi H6 description. I also removed the redundant ramp-delay and
CPU maximum-voltage overrides, keeping the existing LTS 800 mV minimum.
Any all-core supply cleanup belongs in the common include.

>
> [...]
>
> > > > +&mmc1 {
> > > > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > > > +       vqmmc-supply =3D <&reg_bldo3>;
> > >
> > > Something is fishy here. The schematic also shows vcc-wifi-io (on the=
 aw859
> > > side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at lea=
st
> > > checking with a multimeter to confirm what the voltage is on the VDDI=
O
> > > pin of the module.
> > >
> >
> > Regarding the AW859A I/O supply, I traced U60 pin 22 (VDDIO) to
> > VCC-WIFI-IO, which is connected to BLDO3 in the schematic. I measured
> > 1.8 V at an RW1 pad relative to board ground. This supports keeping the
> > existing BLDO3 vqmmc assignment; I have left it unchanged.
>
> You traced it on the board or on the schematic?
>
> Can you test at U60? The schematic has two options for I/O voltage from
> the LDOs, and then another from VCC-WIFI, hence I would like to be
> certain. I imagine the SMT components aren't labeled on the board, so
> it would be somewhat hard / eye-hurting to trace the board directly.
>

The Wi-Fi connection trace was from the schematic. Initially I was worried =
I
would short some pin, but I see pin 22 is at the edge. I have now measured
1.8 V directly at U60/AW859A pin 22 (VDDIO), relative to board ground after
the kernel boots.

> [...]
>
> > > > +&usb2otg {
> > > > +       dr_mode =3D "host";
> > > > +       status =3D "okay";
> > > > +};
> > > > +
> > > > +&usb2phy {
> > > > +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15=
 */
> > >
> > > This isn't connected to anything but a pull-up. And you already speci=
fied
> > > host mode only above.
> >
> > Removed usb0_id_det-gpios with /delete-property/ so the common include'=
s
> > PC6 setting is removed too. USB0 remains fixed to host mode. The runnin=
g
> > DT confirms the ID GPIO property is absent and dr_mode is host.
>
> Thanks!
> ChenYu


Regards,
Cristian Filipescu
------------------------------------
