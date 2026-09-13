Received: from mail-ed2-f4.google.com (mail-ed2-f4.google.com [74.125.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F0235C6A9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312330; cv=pass; b=MOK1ISk3Ls4hsc56al6SVqk4/v1H4B6BTDdUEYNkJPrvr1O+yDp5GHjMJFoi49cnIF1MGWopEgxfbQ+/kK6L5BzVpfNhqKkLbyxFFiNiJ/QY296a6LPxJbYwRDv3UmyTvvOYaHsm7obT0Pav20q3lJsTkktehKzMHXt9dae5bSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312330; c=relaxed/simple;
	bh=V9KdXH7CS1cOOua64xEPqp2VoZ+exq9zbbv82Os6Ku8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgC1d0Dt6LAODbqb5l7o+1/OAbG4/jF7+8COQKopl38na2LGfCmoFU6GHpAs9PMCzT2GG8u7cNr0sy0gDwcZQAHCyjSdyyvbw5hnFTlfgH0d3fEQ5rXJwf2z9PN9FA5+UdV7gdN6SjxNZg6cTvvKSzRQZfyHqC5+l71RZBpUKpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtQ9PtY+; arc=pass smtp.client-ip=74.125.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtQ9PtY+"
Received: by mail-ed2-f4.google.com with SMTP id 4fb4d7f45d1cf-6a9988c6449so1071479a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789312325; cv=none;
        d=google.com; s=arc-20260327;
        b=Y35qGuKqJjFvlCiFfcWqos4YAcWiBy/RUgeuvUpHjiyj4rsv5bRrLhpAscEiiyXSC5
         WEUyliV0+K1HQlxeM0TKDK0PAcXst6HcqH7IOv7etPTvJH5Kka5FJwsoAZQHSDJvWlqL
         kO6jdqpfRsPmly+qwLC5gm4B9QKqL4flqh5KRVIF5oblV3HP9sAy3cKVtNLovffqX1pY
         JcjEsxjMCOF1RFhWExUx+dVdhgpQhitf9javrYyEuz9FVxEdyAyJdHw/4hO5DBGovusI
         ZTJ537oBC9Bcnggp2B+ci3aE6r2+IOcRh3XKEdTCLTk4zla06WPaWuOXK0FaDlrnl6pL
         9CsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6FKqhHGMKbN+g1kF5qjdCbk6ZlE4yPuWZmPTrF4npY=;
        fh=eX8j8QMIpDTafXucZSfYwk3/7wiHmxGQkvs+lN0HcYQ=;
        b=jBx2eDCLGjsJTcPwCcnTNyhY6QBcOkyITo18CFtviOmexaEOisieUbDTw+qGuFgRbf
         iJWzBGczNCNdYGFqE7R+juPYQU6ajfTzYLyxLfNai+UFzXtJNDpf7QNDtt47rDfbxb+P
         VUQLZXggNQS5AlrIXI+OWscb+Ai8wp2+rdf72Z0g7CsQyTud0kwQadow8DwCWhTkSlkF
         1OpVMsBHijxsKwn+F4PIeAIdUUcz1ilZD1AOPNTtSnvnzVJ6nUCL3hIpif5YRREmVKFU
         55aMf8XNZnNeLEiDx1/CoZOWmLNtYt6U7o/vH2v6YX4HxFRml9aZAJHUa0v2mAPS0Ieq
         jAKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789312325; x=1789917125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6FKqhHGMKbN+g1kF5qjdCbk6ZlE4yPuWZmPTrF4npY=;
        b=mtQ9PtY+hXTDYFGOJzHeDL6RqWAIpqX/sgR8a+JUwBy81Rh7xKGGFJgoORe3fNVKVt
         TZHhaCidM9wa//4IIuALb0RKKz49eW64/83dF+niiS0mFWPtrRIP/dzlTEMEolLfkcze
         /U7Unvva88+erEt31A8qwo7Zn26WESvls8TSNruWdo9zpBTCB+VzhJPWFxDgEl5/3E/1
         77Hr03l9EVAGgqcDFd3lQoQ5sQsStmNJ6/FBr6JLC52ZKTnZfvYybw9H8qoq6IrAu0w0
         4JPjG1V/T9e008tQbGdig3wgpqa19uW/3PEDLVEzOMUZR8PWzax34dpTMPtofkyJ43ho
         Ha4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789312325; x=1789917125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6FKqhHGMKbN+g1kF5qjdCbk6ZlE4yPuWZmPTrF4npY=;
        b=NWmKw+BPk0pp5AR0jTahq2eVhZlT0wCXjNS9YfzsStWRV8UpsdkUxQLBX/QsLQSsP9
         zbOooAsK8IteZQ3tcE2o96PRjTVz468ntbB/sBKW7ffQOjQM4V/Cs3E7p3c43Fn0P0NF
         HwLUzb21+Vl49XQi1wZSch8dw0EAptMTJ2fAYCvHwH6AddWaCmwTG1tukMjdxU/7e2bC
         IHSOq1BL1ncADb0y7akiTpNgNvF3jwBfGb2hl3bOW7xJvfydx/r3Y4J0e5wZQ3XKvOkA
         lES5cPv6nfRGoAXAMuMSVN2DpPI+oil7BSsS8dQRGkrpKWa+wUjBMuzYCh0hvy91/WDl
         rnzg==
X-Forwarded-Encrypted: i=1; AKwUvByXFtGgv+78PD5kBitDYLgbnCBG8kLtNjM7lU9txXFC59zA8l1JX/Xl2yioGhRN+wjEnC3ylQmbQjJStKU=@vger.kernel.org
X-Gm-Message-State: AFuF++l2npnb57f3odA//6aav0q0XbSFd/9rG2s9jNUKFa170U2OFv93
	z27qW54JhHrvd2JM+43q9YjyRaljf0/een5vzeSAARkDqyTzn5b2F0fDfkS4xjTJaoBRz1KV9q/
	yCki0n4dYUPa3wCJkZEzXVFzpdgHSxXE=
X-Gm-Gg: AYBFou2b4cUlvZhyn9xtOdVtmYDiGUACd6qwbx9BLSmcprT5AVoyYO/oSUssb4NLwuo
	q8nIs4oEJyX+h9C5uL2O7tcV4wdeO5L1BXIuIhIQGnCOpT1XoIeJtOHNU9ScFX10/ZBoIZbcBGj
	3ZYbfTKlHKxYC/DWWlGdpnbf9UarVAZuJVb2V2b6sXQ6vOKEw1zmIs1gH8c/TEojV+hpyvCF4KY
	8e9F77f27vcS776q8Dcex8iOtXMNZ1IOoCBsPhRkYuKy7oqzAuZDs56IF/fjDJfBoW2sX/QbV2Y
	dsKUlX8dJAQqPDDbeuHPbUkswbTv2tuTKOtqgNyA7X4q11QBNcmtxqPjZA==
X-Received: by 2002:a17:907:c48d:b0:c25:8eb7:f388 with SMTP id
 a640c23a62f3a-c2966732b44mr1279507266b.17.1789312324376; Sun, 13 Sep 2026
 08:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-5-coiaprant@gmail.com> <20260912201322.126940-1-kuba@kernel.org>
In-Reply-To: <20260912201322.126940-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 23:11:52 +0800
X-Gm-Features: AcwNN1XiM26q-ovJF_4CrXhU4nIDQ7WEDIwpgpUZziGAyddbfl9wQtAk49btimU
Message-ID: <CALj3r0jVNnwhT1odBn_7Fg4hqC5covyQTsw0B3wiNQhiciFTEg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 03/10] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, vkoul@kernel.org, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, romain.gantois@bootlin.com, 
	hkallweit1@gmail.com, neil.armstrong@linaro.org, linux@armlinux.org.uk, 
	shawn.lin@rock-chips.com, david@ixit.cz, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:13=E5=86=99=E9=81=93=EF=BC=9A
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
>
> This adds a "rockchip,sgmii-mac-sel" DT property to the RK3568 combphy
> driver so the SGMII interface can be routed to GMAC0 or GMAC1 through the
> pipe GRF pipe_sgmii_mac_sel bit. The value defaults to 1 (GMAC1) when the
> property is absent, and is written during PHY_TYPE_SGMII configuration.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 229)
>
> A few questions below.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drive=
rs/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 7843356a4dd47..919bb97a4b182 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>
> [ ... ]
>
> > @@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
> >       bool enable_ssc;
> >       bool ext_refclk;
> >       struct clk *refclk;
> > +     u32 sgmii_mac_sel;
> >  };
> >
> >  static void rockchip_combphy_updatel(struct rockchip_combphy_priv *pri=
v,
> > @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device =
*dev, struct rockchip_combphy
> >
> >       priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-r=
efclk");
> >
> > +     priv->sgmii_mac_sel =3D 1;
> > +     device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sg=
mii_mac_sel);
> > +
>
> [Severity: Medium]
> Since the return value of device_property_read_u32() is discarded here,
> rockchip_combphy_parse_dt() cannot distinguish "the DT asked for GMAC1"
> from "the DT said nothing about the mux".
>
> The result is that rk3568_combphy_cfg() writes PIPE_GRF 0x0040 bit 1 on
> every PHY_TYPE_SGMII bring-up, including for device trees that do not hav=
e
> the new property. Before this patch that bit was never touched, so whatev=
er
> routing the SoC reset or the boot firmware established was left alone.
>
> The commit message states:
>
>   "The hardware reset value is GMAC1 (1). If the property is set to 0,
>   the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
>   remains at GMAC1."
>
> The "or omitted" case now depends entirely on that reset value being 1. I=
f
> the reset value is actually 0, or if firmware routed SGMII to GMAC0 on a
> board wired that way and its DT lacks the property, does phy_init() still
> return success while the XPCS ends up attached to the wrong MAC, giving a
> link that never comes up and no message explaining why?
>
> Would it make sense to only write the bit when the property is actually
> present, for example:
>
>         if (!device_property_read_u32(dev, "rockchip,sgmii-mac-sel",
>                                       &priv->sgmii_mac_sel))
>                 priv->sgmii_mac_sel_valid =3D true;
>
> so that omitting the property leaves the mux untouched?

SGMII has never been functional on RK3568 in mainline before this
series. There is no existing user that relies on the old behaviour,
and no in-tree device tree enables SGMII. Boards that have the SGMII
routing configured in their bootloader were never able to use it with
a mainline kernel, because the driver did not support it.

Given that, unconditionally writing the MAC-select bit (with a default
of GMAC1, which matches the hardware reset value) is reasonable. It
makes the driver's behaviour explicit and deterministic rather than
depending on whatever the bootloader happened to leave behind.

I'll keep the current logic, but I'll make the commit message clearer
about the hardware reset value and the fact that SGMII is new in
mainline.

> >       priv->phy_rst =3D devm_reset_control_get_exclusive(dev, "phy");
> >       /* fallback to old behaviour */
> >       if (PTR_ERR(priv->phy_rst) =3D=3D -ENOENT)
> > @@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
> >               break;
> >
> >       case PHY_TYPE_SGMII:
> > +             rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_s=
gmii_mac_sel,
> > +                                     priv->sgmii_mac_sel > 0);
>
> [Severity: Low]
> The binding added in the preceding patch of this series declares the
> property as:
>
>   rockchip,sgmii-mac-sel:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     enum: [0, 1]
>     default: 1
>
> but "priv->sgmii_mac_sel > 0" collapses the value to a boolean, and
> rockchip_combphy_parse_dt() does no range check.
>
> Does that mean a device tree setting the property to 2 or 0xffffffff is
> silently treated as GMAC1 rather than rejected? Similarly, a
> present-but-malformed property (wrong length or type) makes
> device_property_read_u32() fail, and the pre-seeded default of 1 is used
> with no diagnostic.
>
> dtschema only validates in-tree device trees, so for bootloader-supplied
> DTs or overlays the driver is the only place the enum can be enforced.
> Would checking the value against {0, 1} and returning an error, or
> alternatively documenting the property as a plain flag, close that gap?

The property is validated by dtschema. For in-tree device trees, values
other than 0 or 1 are rejected at build time. I don't think the driver
needs to duplicate this check.

> [Severity: Low]
> The mux write is only added to the PHY_TYPE_SGMII case. The adjacent
> PHY_TYPE_QSGMII case in rk3568_combphy_cfg() programs the same pipe-grf
> register (pipe_xpcs_phy_ready at offset 0x0040 bit 2) but never touches
> the MAC-select bit:
>
>         case PHY_TYPE_QSGMII:
>                 rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_x=
pcs_phy_ready, true);
>                 ...
>
> The binding gates the property on the compatible only, not on the PHY
> type, and rockchip_combphy_parse_dt() runs at probe time before the PHY
> type is known from rockchip_combphy_xlate().
>
> If a device tree sets rockchip,sgmii-mac-sel on a combphy that a consumer
> later claims with PHY_TYPE_QSGMII, is the requested routing simply droppe=
d
> with no warning? If the property is meant to be SGMII-only, would
> rejecting or warning about it for other PHY types make that explicit?

You're right that the property is SGMII-only. For QSGMII, the hardware
routes to both MACs internally, so there is no MAC-selection bit to
program. We have not found any QSGMII device that exists outside of
OEM SDK EVB code, and mainline XPCS does not support QSGMII, so this
case is not currently reachable. I'll leave it as is.

> >               rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_x=
pcs_phy_ready, true);
> >               rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_ph=
ymode_sel, true);
> >               rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_se=
l_qsgmii, true);
> > @@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_=
combphy_grfcfgs =3D {
> >       .con3_for_sata          =3D { 0x000c, 15, 0, 0x00, 0x4407 },
> >       /* pipe-grf */
> >       .pipe_con0_for_sata     =3D { 0x0000, 15, 0, 0x00, 0x2220 },
> > +     .pipe_sgmii_mac_sel     =3D { 0x0040, 1, 1, 0x00, 0x01 },
> >       .pipe_xpcs_phy_ready    =3D { 0x0040, 2, 2, 0x00, 0x01 },
> >       .u3otg0_port_en         =3D { 0x0104, 15, 0, 0x0181, 0x1100 },
> >       .u3otg1_port_en         =3D { 0x0144, 15, 0, 0x0181, 0x1100 },
>
> For reference on the first two comments: this disable/enable encoding
> ({ 0x0040, 1, 1, 0x00, 0x01 }) is what maps the DT value onto GMAC0/GMAC1=
,
> and rockchip_combphy_param_write() always sets the write-enable mask:
>
>         tmp =3D en ? reg->enable : reg->disable;
>         mask =3D GENMASK(reg->bitend, reg->bitstart);
>         val =3D (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT);
>
> so the bit is committed to hardware on every SGMII bring-up regardless of
> whether the device tree expressed a preference. Could the TRM bit polarit=
y
> and the claimed reset value of 1 be confirmed in the commit message?
>
> Note that no in-tree Rockchip device tree requests PHY_TYPE_SGMII before
> this series, and the only user (rk3568-photonicat.dts) is added later in
> the series, so nothing in-tree changes behaviour today.

You're right, the commit message should state this explicitly. I'll
update it to describe both the bit polarity and the hardware reset
value.

From the RK3568 TRM Part1 (Page 229), the PIPE_GRF_XPCS_CON0 register
bit 1 is pipe_sgmii_mac_sel:

    0: SGMII interface is routed to GMAC0
    1: SGMII interface is routed to GMAC1

The hardware reset value is 1 (GMAC1). This matches the default I use
when the property is absent.

I'll include this in the commit message and the binding description so
that reviewers can verify the behaviour against the TRM.

Regarding the unconditional write: as I mentioned, SGMII has never been
functional on RK3568 in mainline before this series, and no in-tree
device tree enables it. So writing the bit on every SGMII bring-up does
not change behaviour for any existing user.

Thanks,
Coia
