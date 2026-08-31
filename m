Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D504E3F54C6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180441; cv=pass; b=akoMMe6aOfE5ONC8Pj9sUMWpxf24wCP1GT9HZRHPAFaCtje17QlDmdj3J5VsNs1XN6pFFXvkN/0d74IdnLOpF4SuLeabcA8Y0jjHeN9/sqMyEg6YyITeWeGXOQueHNMfO2d5pt79bsiaS+U2HTLpzaoMq46qZyJEvGz1UgDUuDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180441; c=relaxed/simple;
	bh=Se/KxHv+wKCtXiceCMCBlL7rWl8p/0OTHf8X9oOErOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMuLFI3VfQd6MLW63jPcTVf+McD9ikGXbT5o3zwH96qxyn1PcvNIc7KuAafTkzp0SnQdvYHL1/yw1mJH7r49oEHrBbbk6JadM5mR80X90YHoArtU4+1RcU+hqyi0YhMhWs93K+bX9ezEpaSSpZfOILHUClWdRNkT+cqF+A0Vf9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaRhsqXP; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaRhsqXP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c207cb16cf5so557265766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788180435; cv=none;
        d=google.com; s=arc-20260327;
        b=JTImvRbjas1Katmva2HVD1iIA+VX1cCy7nGuadruexOYWpB48616pPGRVnVa6dClFO
         tEvWdiPq003CXRn5WK9S9iSnQnGhBjmlwS8LT0eCFeRH+0NZbOqhXlQ7lzt3ibX1zRn1
         tc7xXin6WAPHami708zHhjps4kud37QB0wm74kI7Y8+BwR5rZyZLXw+Ivxs7cdjRNCLi
         MCjxtBxR3iytiDRZQJ9F96IWqeDV7TO5eDmeHY0p+BogvQC+orC/o7OhFsXfWNhdpjtN
         PZoYGjPdymziDqnYbGRpDaggJIcoBZvlHdwAEymzHk+T10um9P6c55NafdilK9Idn4NV
         QaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=;
        fh=s0I8ZeAO3J71DWs7r8OsDiFsWmm7zyGc71v3GkQTz8w=;
        b=IRnoDyXMUoVF2uHY4QP7EyDEBCpPE8aeEUZu4NpMwEoYtlfchTuMpghs0fQ89DaYa3
         1odkycf2F/+2Nk1NGFFmFE7/+hw9N0zR9MU8aweMVHdG6AccbE5/Ao4yXEw7ufPnoMwh
         WN/P7F+tCypZQm5PpYX21n4wLE0kYZn4ZMaGJJFnFu7gH7geyaHs/wpV6or39iUJvcLh
         002NMSyPDTEPbZXd+7XccigjAojpOMdItm9An5owfSWMpNNBTAfyJ7IpUAIskkKW10gv
         A5m6fsX4glAwVeH9W1FbfkhQhqhY8LV3ZRykbCZa4WvCKYmhkGCi0RCYKMgMjK1yUnoE
         ixzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180435; x=1788785235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=;
        b=HaRhsqXPzPom2G0Rk6v20+cLVhq93R4JinVaHq11h/DMVhiDOYorJMP/A6KWvhAw2Y
         jZc2VbWjUmLrBaQxviryyYfaoZHfrDqv+RUjfxYG1hN2Jjm4VDihlAXyvzQAzCV4lPdZ
         7JParGxkKnktq1E4enxBxEuYG0wnMNHNpFwvA84Mzts0phjxAg2RTD83f1DuYQQwF/nr
         dlCeK7SEMg+6AHcxDxw3bNd6aeZ1bwXCPloTJt2+WGAh3vVmq0mbJnbVoq3XOo+l04K1
         7ybjnEWO3UiD5zdOwKDyNk3JalVfd1eqxAdw1YXz2T+LcfRoxzuTRB7PJzE34lBZGbYn
         PM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180435; x=1788785235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zLqTvy52sKSUUsDTZl72qNN+V6zjfC7RltS1uqqFZgU=;
        b=V6U/zHnalSPxExoQ4XleaLqbsWtmC2uzWPMNwd1GRWdRTad+xHqjs0pUZn2b1wdeft
         s/xFFQowqVlhxSxfHCcQHj5xi774KWxkSUBCPTPZuB5V3cI10trwf6nItAUu5ObE6y2s
         fjpwk9NFEe79ztW2ucjilVCGPH3M8AY+pC19obqdJ1AFeKdTLVOs50FyNsOEhNtgEzn+
         zVgbxXyyITPLhxpai4l/+9F6DWhIoTlF1SzQBWC+qLhxin++nIYBneY7EJKyh7LMj2XV
         OSwsAx/TGj2ri7zwlYCJaLHss9ftqSLEvXo8Et0a0qYQw9X9JwoGnblDzkTiOlevLr7U
         XCAw==
X-Forwarded-Encrypted: i=1; AHgh+RpZlHVLOQByx+mcxuXaaW6Y5gCSSLJTBrDMfifzY9P0eCMCaloqgI8aQVRptYmcxmw9mkJdIZ0SMu8ILf8=@vger.kernel.org
X-Gm-Message-State: AFuF++kEOR74bC2cq7sb22ig8lfCtlx0PvYhpDSX0xJWrgpaIrMydGDO
	chY2RggS1BssXPOX3XtehjpDdrUJCulQmUmiF+HkY+53NyWc1nOoVhDvoXzyaX5qxxJVXI6TiDx
	ByAYdcRjux25/Gl7DoV3JqRsxcDykB9s=
X-Gm-Gg: AR+sD13cov6HNzB7StRNjKmWbcTKW86sLRQZWhQxgB1LuqEKqYIMoCiPlF9CWb9/isH
	Za1bv/4GLoc5g78vg/zIxE1vLGwwIR423sFq0onFkrOVFyrvkJVYFYpc8pvtVReSArXVN12yRRK
	146wtUmkRFGu/Yb5NwzrXX1I9xGumhSYNANKUlTau/xnXcVlANdOSa4VcHeItNtdbjXYXwFY70r
	TP3BlaQvec20URaiI9WPH2wiJ2KAviHBnTl8DkkH1J+3C6krVm+EgO1ojEQ/Yc7GceOi89Gi9Fw
	6q4zMm7w0gxv6vFVUFTJpv3bE/HUuN+qfYfYdsN5dWhYtw==
X-Received: by 2002:a17:906:6444:b0:c16:101d:7afa with SMTP id
 a640c23a62f3a-c25b3cde78emr15785266b.16.1788180435211; Mon, 31 Aug 2026
 05:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260830182036.284736-3-prasanth.padarthi10@gmail.com> <178817979463.20922.10263529532171804189.b4-review@b4>
In-Reply-To: <178817979463.20922.10263529532171804189.b4-review@b4>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 18:17:02 +0530
X-Gm-Features: AcwNN1XIrIC7I6xOS5BaNQ3PLnAnWSJKPgHogQbkIGatLAVm1UY68sNUIGJAplc
Message-ID: <CAMFFDGi5eb_+ec5hGz6nE7OXpqYTMg7oZSPAzttXDPZJZw8v2Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thanks, this is very helpful, especially since you have tested the same boa=
rd.

I will rework the next revision to use the existing ASRock Rack DTS
patterns, including the I2C7 EEPROM/NVMEM MAC address handling and the
standard 64 MiB OpenBMC flash layout. I will also investigate the
GPIOs and video memory reservation you mentioned.

For MAC0, I will change the PHY mode to rgmii-id and remove the claim
that the board requires RX-only PHY delay. I will also investigate the
ASPEED SoC-specific MAC delay configuration and the difference between
upstream U-Boot and openbmc/u-boot before sending the next revision.

Thanks,
Prasanth

On Mon, Aug 31, 2026 at 6:07=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> Hi Prasanth,
>
> On 8/30/26 8:20 PM, Prasanth Kumar Padarthi wrote:
> > Add the device tree for the ASRock Rack B650D4U BMC, which is
> > based on the ASPEED AST2600 SoC.
> >
> > Describe the BMC memory, SPI NOR flash layout, UART console, and
> > MAC0 connected to an RTL8211F Ethernet PHY.
>
> Why no GPIOs? Why no I2C buses? You'd need at least i2c7 with an at24c128=
 to
> populate the MAC address on MAC0.
>
> >
> > The MAC0 RGMII RX delay configuration was validated on hardware.
> > The RTL8211F requires its internal RX delay for reliable operation,
> > while an additional TX delay is not required.
>
> No, it does not. The traces have the same length and don't require specia=
l
> delays. If you use u-boot/next, then it might be true because it still mi=
sses
> the correct SoC-specific delays. This is, however, fixed in openbmc/u-boo=
t.
>
> I know that this is not optimal. I'm already working on getting this fixe=
d in
> upstream U-Boot too.
>
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspe=
ed/Makefile
> > index 6b68671f9379..b109491d5c8f 100644
> > --- a/arch/arm/boot/dts/aspeed/Makefile
> > +++ b/arch/arm/boot/dts/aspeed/Makefile
> > @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       aspeed-bmc-ampere-mtmitchell.dtb \
> >       aspeed-bmc-arm-stardragon4800-rep2.dtb \
> >       aspeed-bmc-asrock-altrad8.dtb \
> > +     aspeed-bmc-asrock-b650d4u.dtb \
> >       aspeed-bmc-asrock-e3c246d4i.dtb \
> >       aspeed-bmc-asrock-e3c256d4i.dtb \
> >       aspeed-bmc-asrock-paul-ipmi-card.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > new file mode 100644
> > index 000000000000..aa623f0ca36c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -0,0 +1,95 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +
> > +/ {
> > +     model =3D "ASRock Rack B650D4U BMC";
> > +     compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> > +
> > +     aliases {
> > +             serial0 =3D &uart5;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     memory@80000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x80000000 0x20000000>;
> > +     };
>
> Where's the reservation for video?
>
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             compatible =3D "jedec,spi-nor";
> > +             reg =3D <0>;
>
> That's already defined in aspeed-g6.dtsi
>
> > +             label =3D "bmc";
> > +             m25p,fast-read;
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-rx-bus-width =3D <4>;
> > +             status =3D "okay";
> > +
> > +             partitions {
> > +                     compatible =3D "fixed-partitions";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +
> > +                     u-boot@0 {
> > +                             reg =3D <0x00000000 0x000e0000>;
> > +                             label =3D "u-boot";
> > +                             read-only;
> > +                     };
> > +
> > +                     u-boot-env@e0000 {
> > +                             reg =3D <0x000e0000 0x00020000>;
> > +                             label =3D "u-boot-env";
> > +                     };
> > +
> > +                     kernel@200000 {
> > +                             reg =3D <0x00200000 0x00800000>;
> > +                             label =3D "kernel";
> > +                     };
> > +
> > +                     rofs@a00000 {
> > +                             reg =3D <0x00a00000 0x02000000>;
> > +                             label =3D "rofs";
> > +                             read-only;
> > +                     };
> > +
> > +                     rwfs@2a00000 {
> > +                             reg =3D <0x02a00000 0x01600000>;
> > +                             label =3D "rwfs";
> > +                     };
>
> No. Include the partitions via `#include openbmc-flash-layout-64.dtsi`.
>
> > +             };
> > +     };
> > +};
> > +
> > +&mac0 {
> > +     status =3D "okay";
> > +
> > +     /*
> > +      * The RTL8211F provides the required RGMII RX delay. No addition=
al
> > +      * TX delay is required for this board.
> > +      */
>
> No? I do have this board myself with a custom BMC ROM and I can tell you =
that
> you don't have to set delays other than the described SoC-specific delays=
, but
> this is, as mentioned, already done in the BSP. (And no, I haven't upstre=
amed
> my DTS yet bc I haven't had the time to do it.)
>
> > +     phy-mode =3D "rgmii-rxid";
>
> `rgmii-id`
>
> > +     phy-handle =3D <&ethphy0>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rgmii1_default>;
>
> No nvmem cell to set the MAC address? i2c7@57 offset 0x3f80? Please see t=
he
> other device-trees for ASRock Rack mainboards.
>
> For me, it is a:
>
> NACKed-by: Tan Siewert <tan.siewert@9elements.com>
>
> Tan
>
> --
> Tan Siewert <tan.siewert@9elements.com>
