Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C23AE198
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791277895; cv=none; b=LbyO/EoXeD1hK2Hh+v9hmqnD0doPHPHd3UdL+KAFLD70nRHMPTExzbMK8v0BSm/UEfBlnmn2lNny6nSG+g/cb+Yi6JSHwbG0FEYuUl+TDTEMIOcKpjOfo9MVj9DSHHy+vAFI4Ml+02o8q+yqeWnKv7ZIHL6OiJ58l1oM2Z55RG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791277895; c=relaxed/simple;
	bh=QSk/c0xFPnxckSA8D/FbrazTD+8/+fmgSsCPpvOdXsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhDABDX1WvbKoWlvVseQSK00QYQ7DWJFyAyad2uApWKd+w0/3euGR++CSsT6+GTDwoVfSKrc3XAl7gnL+UKF8v7ePuQ0ZGkJbXrBCbhMjknnIh7Oly3ifZs7/Jji8mX2WFE28LQhSSQvio6Sf79oR52+feIj7WqxYldzePrqb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-49dd13a91d0so782681fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791277892; x=1791882692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm8inQeYXbBmJrsjm+/9U5OYHNYAqX7VnlqX5vcQTFU=;
        b=XQPQe8xRE3ZYcwgj2RbTdOfanhmHvl2b+4B1W50M4rhjMlEwJD/RDknI58OuKF+zIS
         2MVh8Rvi3PvZSn4YJuaUqr3HOYS59x8+Yaiao3LrM3dg+xz4rwSpNFR6M69c8DoKkE0Q
         58B9LjdCQEIlChFv99q31hmg0OWq+qAYb/TFNgG6h9bgFOsdvIC3g34mTM9KzyGsWZEl
         y4RWYjqIAzIJ+ts52W5XC7il82KS0SOBjl63Rl7AOBvTckK8XvD3JuVoyTFyIzaAktfo
         Q2nPhYt6d4FY/cTWcEi2JnMAJpooc2cJluzkdglZ5Vt+xxKKagl7RV3LyM9mLRajXs0o
         x7Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwUpDC0ZHM/xQqbMxiRJOBbgHcMwPjmu/MZN6BbiVhQ01bKD+Pj5u3LbBFbiHfw5GPuj+ih8/XXpBgmLjw=@vger.kernel.org
X-Gm-Message-State: AFuF++kyIyix5z/XgtV4TlFgIbOn6gg+sx3+eFuZMcbf+wFZHGWc8luU
	Hf2i0Y/u/LgEHGUTJptfVBYt73t9uRYU9hHiA2RxluSUxZ/rUAMqen4Ijo/nbIGjMm4Jyg==
X-Gm-Gg: AYBFou224PX3D3fHz5WWYFUWm2vx/dxN2lTggn8JYXgHAyVBNZ/E+my8zsd4byNEBY+
	zawuiloRD5BU6dQkfDhTDOdMgaAGLGqA4BP3QrYtdoGOuJseO/qY04j0WZdsZ9bKMX8g6ttYtiO
	4fyQkqidSxrmOTgv/rNlUN5CwVYHPB2Y9IXmy6cALx4nFNOoGBdzA+cOhwc8UTtSfwUKEjKFCXh
	wbPLXumf5TpphSJogTuKLpl40PTA/J4dVTjCu8xxW/vDSVTo1PldbB0AgQagns8S6WW6DjnfcYc
	FX2Udup4+++wlF7mxLoqpWbpbmJvBhMbklLb5zN72GMH4CNOC6+k2UQRuvN7VGC4ouBlhjZLrtT
	f2h1EMv9q7yG6F14THErADk7xux/PWA67up8COozN/0OhXrHirr8cGk4RuJMrJ8B9gWrqqusQWf
	N0FcnN3I6wpR4iWjhq4gfGLCAP+o/qBP583cH/+CEfMyf7ENBAaYSyqfGLWZ9raI+CpZQECmQ5T
	tqdM1jNOZTFOptHas65Wf/F/D9Dl1bjgscibOoiHSj1KQUE7+IcQb0BsVKhPYgQ9lY=
X-Received: by 2002:a05:6871:4727:b0:494:7c40:ed7c with SMTP id 586e51a60fabf-4a240484247mr612424fac.29.1791277891911;
        Tue, 06 Oct 2026 02:11:31 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16d70e59sm12265889fac.6.2026.10.06.02.11.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 02:11:31 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4af173320f9so1448233b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:11:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKaCJUqFGuXVcceKGNHe7xtWY3FwMd85aBeKnCFG3QT6CAxhPfjy7nGFqtkpQnlTQMN+vVbLddHJlv8EI=@vger.kernel.org
X-Received: by 2002:a05:690c:e216:10b0:89a:63bc:8be with SMTP id
 00721157ae682-8b04f45511emr1435597b3.72.1791277525323; Tue, 06 Oct 2026
 02:05:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004144046.391444-1-tanure@linux.com> <20261004144046.391444-7-tanure@linux.com>
 <f282770c-2238-4a1b-b811-c0c483fa7681@lunn.ch>
In-Reply-To: <f282770c-2238-4a1b-b811-c0c483fa7681@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 6 Oct 2026 10:05:13 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2pw9=+O0V=e_kNR=c5oVeymbViy0XGGuciw4LL2Y_Ctg@mail.gmail.com>
X-Gm-Features: AclHuK8uuG7S1lotg92U6NQL5L-fFOK6A4NsqpautQX6RPIs4c5SrrUvYH9tz8s
Message-ID: <CAJX_Q+2pw9=+O0V=e_kNR=c5oVeymbViy0XGGuciw4LL2Y_Ctg@mail.gmail.com>
Subject: Re: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 5:27=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&ethmac {
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&eth_pins>, <&eth_rgmii_pins>;
> > +     pinctrl-names =3D "default";
> > +
> > +     /*
> > +      * The RGMII clock delays are added by the MAC, so the PHY is
> > +      * asked for the mode that adds none.
> > +      */
> > +     phy-mode =3D "rgmii";
> > +     phy-handle =3D <&external_phy>;
> > +     amlogic,tx-delay-ns =3D <2>;
> > +     rx-internal-delay-ps =3D <2000>;
>
> I agree with Maxime here, rgmii is wrong. We really need to understand
> what is going on here, especially since you are asking for the MAC to
> do the usual 2ns, nothing special.
>
> Is the PHY not actually inserting the correct delay?
It does. The PHY driver shows both delay bits going from off to on, so
nothing was strapped and the bootloader did not set them.

I swept the MAC RX clock delay and counted CRC errors, to see where the
good window is:

  MAC does RX delay, PHY none:  clean 400 .. 3800ps
  PHY does RX delay, MAC adds:  clean 0 .. 1600ps

Same window, moved 11 steps. So the PHY gives about 2200ps, and the
first window is centred at 2100ps. It is right.

Transmit is the broken one. With rgmii-txid the peer sees nothing we
send.

What does the
> datasheet say?
The A311D2 covers both ways of doing it. Table 5-21, RGMII receive:

  PHY internal delay on:   needs 1.2ns setup and 1.2ns hold
  PHY internal delay off:  needs -0.5 .. 0.5ns skew

with a note to check setup/hold when the PHY delay is on, and skew when
it is off. Table 5-22 does the same for transmit, separate numbers for
"clock delay added" and "no clock delay added".

So the MAC doing the delay is a documented mode of this SoC.

What it does not say is why the PHY TX delay misses. I asked Khadas
about the clock trace lengths, no answer yet.
>
> Also, we have one vendor property and one generic property. Can
> amlogic,tx-delay-ns be replaced by tx-internal-delay-ps? But that
> comes later, once we have determined these properties really must be
> used.
A new version of the series will have a fix for it. It will prefer the
generic one.
One thing to know: that register field is a fraction of the clock
period, not a time.
The driver comment says "8ns / 4 * tx_dly_val". A quarter cycle is 2ns
at 1Gbit and 10ns
at 100Mbit, so 2000 is only true at gigabit.
>
> Humm, what is meson8b_init_rgmii_delays() doing?
It picks the MAC delays from phy-mode alone, with the sense inverted:

  rgmii       MAC adds both delays
  rgmii-rxid  MAC adds TX
  rgmii-txid  MAC adds RX
  rgmii-id    MAC adds none

So the mode that says the delays are internal is the one where the MAC
switches its own off. It also ignores the *-internal-delay-ps
properties in those modes. With rgmii-id and both of them set I get:

  phy-mode rgmii-id: tx-delay-ns 2 rx-delay-ps 2000
    -> PRG_ETH0 delay_config 0x0, PRG_ETH1 cfg_rxclk_dly 0x0

What is
> phydev->interface in the PHY driver.
Whatever phy-mode says, dwmac-meson8b.c never rewrites it. Which
means the MAC and the PHY always split the job:

  rgmii       MAC both    PHY none
  rgmii-rxid  MAC TX      PHY RX
  rgmii-txid  MAC RX      PHY TX
  rgmii-id    MAC none    PHY both

They never both delay the same clock, and never both skip it. So the
driver is self consistent, it is just labelled backwards from phy.rst.
That is why the boards using "rgmii" work, and why rgmii-id is the one
that does not here: it is the mode that hands everything to the PHY.
>
> Please take a read on:
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
> and figure out what is going on here, because at a first look, it
> seems broken.
>
>       Andrew
It is broken. phy-mode describes the PCB, but dwmac-meson8b.c reads it
as which chip adds the delay. The labels are backwards, and in rgmii-id
both *-internal-delay-ps properties are ignored.

I measured each direction with an eye scan. The PHY RX delay is fine,
about 2200ps. Its TX delay does not work at all, so the MAC must do
that one.

Fix: in the -id modes each *-internal-delay-ps property means the MAC
does that delay, and the PHY is told to do the rest:

  both properties    MAC does TX and RX     PHY told rgmii
  tx property only    MAC does TX                 PHY told rgmii-rxid
  rx property only    MAC does RX                 PHY told rgmii-txid
  no property           MAC does nothing          PHY told rgmii-id

Boards without those properties keep today's behaviour, so
meson8b-odroidc1 and meson8m2-mxiii-plus are untouched.

Vim4 will use phy-mode =3D "rgmii-id" with tx-internal-delay-ps =3D
<2000>. 935Mbit/s both ways, no CRC errors.

I am sending a v2 with the fix for dwmac-meson8b.c  as its own patch.

Thanks
Lucas
