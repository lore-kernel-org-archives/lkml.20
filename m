Received: from mail-ej2-f8.google.com (mail-ej2-f8.google.com [74.125.228.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5210C346ACE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313425; cv=pass; b=g2Tm5qMalUHiFV1OeB82b0PJUADGQILgs8cEOuDcqJCnAhNjjXvUFm3NlzvZG8T2wOqoTJzdDCj/Y6cepfQ0XtGpbK95dbDy+d2esTC0dEn6hNX3Xxgj5naJof7Hu7XPgioMsieNsfIx7D4m5RaUSZd7hN8iIRQgpRyyXyRi2Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313425; c=relaxed/simple;
	bh=QOnd9Be0VKsR33e3Mz4oeKHlFLKxA5Rt/jBaVV6NUZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTllGsWdjTwfu1KTMOm9RDAgm8x64FKlMbZQ0wkGivZQYKfcV80PZs82JoPJtZKWxxwsdYe9ywwSdHuLm1Y24tD86T+mNEKFXxlcMJ9wkxoo7MwhpYoKwYPiPed027+BViJvas6IudEFUbmaHeJ1NGHXCMr9+pbHSG19djgid2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxBeHxwc; arc=pass smtp.client-ip=74.125.228.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxBeHxwc"
Received: by mail-ej2-f8.google.com with SMTP id a640c23a62f3a-c254403ada6so123200966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789313421; cv=none;
        d=google.com; s=arc-20260327;
        b=IoehPm3G5EmSyvJ+9mk7vJCmBZ5P7hyxPcK17JKQyOCUSi/ooCssyi4F9yJjyBPbpu
         dCKwtDRV32TIJUfJBsswvaz5HWC9MOHv5FdL3QRaSfhp5cxdFWRKdfk7Xsr9nQXnRtaG
         VqL1gwrmCeWP0rB//oGEtiO7sOt7z7e9fW9hMwzW7a0k9Aa9BuZQNZsNC0wtuzwBGZg9
         ++NJcgW5Pf9W0GX/1aGv24xcgI9ZC+mu5VLBuMuthxSCpwlFykxg7/+WvNzjNhokux9R
         7d26nbPhlTGMwNzatwVLc2zc5eWwomKoVt+EeNBBKTPPCuD+ymaVVLmzOFCrObNafm5g
         N6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUmHj/LFwOw941/kenFz/i5xXlBgFi4Hi0DQiphahvI=;
        fh=CjtOdIkop7yGOuOorsJp3uFrzsDyaDG8IPEjDkSxCSE=;
        b=PSIK8dIh0kDBH+2yKfTT8/bQmkpC3x0H5KtVSKrX7mmm6Y8FR2/SN5MpVeSpMwuSTV
         DJvD12afo6XNW3RVVVNkSIVFHMXW+23NBVZ+xCp903dhvtiOmRWeqaMJIPRbnH0DdhNR
         Ok7271HZq+h1J00Y1iP+oX6S6RxqTZBbjiPAkABCXUpbFx7y5JT3RwI2rZ2sZtWZrU3N
         C5F3a1SLsxkvtyRnUtAsuD3pkla87Tr3JhKrF/5Z7iz3JFEhdn58V3YMBW1s4Mp6UeN1
         leVOVOPFiyqBg+zzPiqv27UaOqEvwyeNfVlin0kkKbS93+lI0SYDhI7JO8iJV0Mnp8dA
         kCsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789313421; x=1789918221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUmHj/LFwOw941/kenFz/i5xXlBgFi4Hi0DQiphahvI=;
        b=sxBeHxwcYJZnauDyGs4G+wJeTExNt2znk2aa0D9SeqyB6QWN/P9OCBXnV+lGAV6VUt
         2GOOIAUQxtnIk/8e4HZjGu5ZydTndQciLuyvL0FiOyWI7gDI2SUpuWDJNXgJe6rIfdWo
         8tYxoNQZclHs+5mChholUzK1yKUzVIjlNONUYMvSotyj1o4WdAaPuNUdfe7xWCpWpC1Z
         fBdDhSScik7JO1Wat4ounuDbOZTXwIFfQHCg2gKrfF0u9W28Rw0qsdpghlXgvba6N9z/
         VXvpkXmpUIsiSSDqXCPxKJ8s8UrNfAvEUfxOtYk5TGV25hLGwJqI1KjPZ1Ibr7rNlN4k
         k9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789313421; x=1789918221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUmHj/LFwOw941/kenFz/i5xXlBgFi4Hi0DQiphahvI=;
        b=BS0MNJBEfrdwR00qb5YCaQsYrX6qPpbAhi+U5ujj2jjaxzPtEog3IujNj7jctPRKxv
         We5XNTakd2bsI3S/6B2nIf+g/FohlP8dzjhPQTwnQb42IHXqc7eKuXRjg2E3WKs41S/Q
         ZrXBLRHVzDCZH9D2yUQpgYCSYIQM+DtsFNkaklfa6zHEmHS4cAGUNUW+Th58upUSEeqg
         j6taLjDLUyETUjiNmRbJwWoz7Lp3OSEMjn+3vdGcDicxaR8NkZS8jR4Mdf8FPmwOGIU7
         dGbHGhBiY8KYsotPI+UQyRDf0n8pAnst7SDBHn6mnUR/nxTPHI2aMy8zDR3DD2tR2Dau
         R/4w==
X-Forwarded-Encrypted: i=1; AKwUvBxQ/aSnX6eHMy1o+AIKiv4RS15liDhQTHlsJtUXsVcdcvK9fmrDvXkV4XRLmNdx9JiIiq7zUR1/ZF9CZ/c=@vger.kernel.org
X-Gm-Message-State: AFuF++mIQyKBb27S7e73P3BOs4mUMFjSAdV78XWuQqlJOHFSSOsqoBzN
	XxNetuYkgq2ZSIa/E7myFQlr5lC6ChZf9ylAjkOWkyfCx2+0xHpCIXGIR2CCq1G4T1SpVETqrkA
	yh8sJw2kNhTE4IRz1ynCdSd7Z2pjmQh8=
X-Gm-Gg: AYBFou3EKLfi/QARfm1/Q6b6mY2aB0GgNt3Xkq9h1cFI8cGbOUrRf2Bp0vMGqy0fdVT
	mPxVappEpZmzQT2RJecT3z5ymIA0SDFZyOmGhW81or2X5iDVmPPDeJesLoHOEO1XVyILSNY9y2B
	FFF0vPlTqNH0a+SFQe5MkxyPJJtbNqg6zeAcLN2mIlsineCNl1L9L5DaImwUpNXWU5HEJC5Ca5a
	GyotpqlN8DEPRVfmzJPe3s4PVi7u5fR5DbLIUfZ7SsepyEcag9eMrF0d8fyHWcRMaW3IZfvGgVO
	l4ZyY20XuzVs3mAFtB0W6bKzJw1SKyofiXYc41NsAjW/QoYcgm/TluXvVsc=
X-Received: by 2002:a17:907:6d0c:b0:c26:1649:47a5 with SMTP id
 a640c23a62f3a-c29858afb4dmr388468266b.27.1789313421314; Sun, 13 Sep 2026
 08:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-6-coiaprant@gmail.com> <20260912201324.126973-1-kuba@kernel.org>
In-Reply-To: <20260912201324.126973-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 23:30:09 +0800
X-Gm-Features: AcwNN1WBFJod78ZuorP_y9LCkHOcoGiWiUu5Cum7Oj84vat35RmRCRAX8YYOUss
Message-ID: <CALj3r0hevQ2Y9ttORKOa-oOFmyi7zDwNdLETRG0endxhCoFibA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 04/10] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs support
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
> dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
>
> This adds a new standalone schema describing the Synopsys DesignWare XPCS
> as integrated on the Rockchip RK3568, with a CSR window, csr/eee clocks, =
a
> Naneng Combo SerDes phy, a power domain and four MII child ports.  A few
> questions about the property set and the file naming below.
>
> > diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.=
yaml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> > new file mode 100644
> > index 0000000000000..0852d0bcb66a2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/pcs/rockchip-dwxpcs.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>
> [Severity: Low]
>
> This isn't a bug, but should the file be named after the documented
> compatible, i.e. rockchip,rk3568-xpcs.yaml?  The other schemas in
> Documentation/devicetree/bindings/net/pcs/ all use that form:
> snps,dw-xpcs.yaml, fsl,lynx-pcs.yaml, mediatek,sgmiisys.yaml,
> renesas,rzn1-miic.yaml.
>
> A rename would also have to update the $id line above, since it encodes t=
he
> same name.
>
> Related: the example at the bottom uses pcs@fda00000 and pcs-mii@0, while
> the sibling PCS binding uses the generic ethernet-pcs@... node name, and =
no
> $nodename constraint is added here.  The SoC dtsi added later in the seri=
es
> copies the pcs@/pcs-mii@ names verbatim.

I chose rockchip-dwxpcs.yaml intentionally, in case Rockchip integrates
the same XPCS IP into other SoCs in the future. The filename is more
generic and can cover multiple compatible strings if needed.

However, I understand the convention is to name the file after the
compatible string (like snps,dw-xpcs.yaml and fsl,lynx-pcs.yaml). If
you prefer rockchip,rk3568-xpcs.yaml, I will rename it.

> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3568-xpcs
>
> [Severity: Low]
>
> This isn't a bug, but would a set of SoC-specific if/then blocks in
> Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml be preferred
> over a second schema for the same IP?
>
> To be clear, a snps,dw-xpcs fallback compatible or a $ref to that schema
> would be wrong here.  The glue driver added later in the series builds CS=
R
> addresses with only a 3-bit MMD field:
>
>         return FIELD_PREP(0x70000, dev) | FIELD_PREP(0xffff, reg);
>
> and remaps the vendor MMDs in xpcs_rk_mdio_read_remapping() /
> xpcs_rk_mdio_write_remapping(), so the generic direct mapping described i=
n
> snps,dw-xpcs.yaml would compute different offsets.
>
> So the only question is where the description should live, not whether th=
e
> compatible should be shared.

As you noted, a $ref to snps,dw-xpcs.yaml would be wrong because the
Rockchip glue uses a different address mapping (3-bit MMD field with
remapping). A separate schema is the right choice.

> [Severity: Low]
>
> Should the sbd_intr_o output be described as an optional interrupts
> property?  With additionalProperties: false at the end of the file, a
> conforming device tree cannot carry it, although adding it later stays
> backward compatible.
>
> The single unnamed 2 MiB window itself does match the driver:
> xpcs_rk_init_res() uses platform_get_resource(pdev, IORESOURCE_MEM, 0) an=
d
> requires resource_size(res) >=3D SZ_2M, and the largest computed offset
> 0x7FFFF << 2 =3D 0x1FFFFC still falls inside 0x200000, so reg-names and
> reg-io-width are not needed.

These are optional and can be added later without breaking ABI. I'll
leave them out for now, since the mainline XPCS driver doesn't use them.

> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    items:
> > +      - description: APB3 bus interface clock (clk_csr_i), required fo=
r register access
> > +      - description: EEE clock (clk_eee_i), required for Energy Effici=
ent Ethernet operation
> > +
> > +  clock-names:
> > +    items:
> > +      - const: csr
> > +      - const: eee
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  phy-names:
> > +    const: serdes
> > +
> > +  power-domains:
> > +    maxItems: 1
>
> [Severity: Low]
>
> Should resets/reset-names be described here too?  The RK3568 CRU exposes
> four dedicated reset lines for this block in
> include/dt-bindings/clock/rk3568-cru.h:
>
>         #define SRST_XPCS               150
>         #define SRST_XPCS_TX_DIV10      151
>         #define SRST_XPCS_RX_DIV10      152
>         #define SRST_XPCS_XGXS_RX       153
>
> Since the schema ends with additionalProperties: false, a conforming devi=
ce
> tree cannot express them at all, and the glue driver added later in the
> series never requests a reset control, so it depends on those resets alre=
ady
> being de-asserted.
>
> Peer blocks in the same island do describe theirs, e.g. combphy0 with
> resets =3D <&cru SRST_PIPEPHY0> and gmac0 with resets =3D <&cru SRST_A_GM=
AC0>.
>
> Note the XPCS core does provide a register-level reset via xpcs_soft_rese=
t()
> in drivers/net/pcs/pcs-xpcs.c, so a state-machine restart is possible
> without the CRU resets, and an optional resets property can be added late=
r
> without breaking the ABI.

These are optional and can be added later without breaking ABI. I'll
leave them out for now, since the mainline XPCS driver doesn't use them.

> > +patternProperties:
> > +  "^pcs-mii@[0-3]$":
> > +    type: object
> > +    description:
> > +      One of the four MII ports of the XPCS. The port is linked to an
> > +      Ethernet MAC controller via the pcs-handle property in the MAC's
> > +      device tree node.
> > +
> > +    properties:
> > +      reg:
> > +        description: MII port number.
> > +        enum: [0, 1, 2, 3]
>
> [Severity: Low]
>
> This isn't a bug, but is pcs-mii@N the intended name for these per-port
> children rather than the generic ethernet-pcs@N?
>
> Resolving a MAC pcs-handle that points at one of these children does work
> with the rest of the series: xpcs_rk_create() in
> drivers/net/pcs/pcs-xpcs-rk.c reads the child reg, walks up with
> of_get_parent() and calls xpcs_create_mdiodev(pxpcs->bus, port), and
> rk_pcs_init() in drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c does
> of_parse_phandle(np, "pcs-handle", 0).  So the open point is just the nod=
e
> naming.

Yes, I will use ethernet-pcs@N

> > +
> > +    required:
> > +      - reg
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - clocks
> > +  - clock-names
> > +  - phys
> > +  - phy-names
> > +  - power-domains
>
> [Severity: Medium]
>
> Does requiring phys and phy-names here make dtbs_check fail for the RK356=
8
> boards?  The SoC node added later in the same series omits both, because =
the
> SerDes selection is board specific:
>
> arch/arm64/boot/dts/rockchip/rk3568.dtsi:
>         xpcs: pcs@fda00000 {
>                 compatible =3D "rockchip,rk3568-xpcs";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>                 reg =3D <0x0 0xfda00000 0x0 0x200000>;
>                 clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
>                 clock-names =3D "csr", "eee";
>                 power-domains =3D <&power RK3568_PD_PIPE>;
>                 status =3D "disabled";
>
> and only the board fills them in:
>
> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts:
>         &xpcs {
>                 status =3D "okay";
>                 phys =3D <&combphy2 PHY_TYPE_SGMII>;
>                 phy-names =3D "serdes";
>         };
>
> dtschema validates nodes irrespective of status =3D "disabled", so wouldn=
't
> every rk3568*.dtb apart from the Photonicat report "'phys', 'phy-names' a=
re
> required properties"?
>
> Should phys/phy-names be dropped from required (or made conditional), or
> should the SoC dtsi carry them instead?

This is not actually a problem. dtbs_check and CHECK_DTBS only validate
required properties for enabled nodes. As confirmed by Rob Herring:

    "the dtbs_check only checks required properties from yaml if the
     node is enabled. Yes, that is exactly how it works."

The xpcs node in rk3568.dtsi is marked status =3D "disabled", so boards
that include rk3568.dtsi without enabling XPCS will not trigger any
validation warnings. Only boards that enable it need to provide phys
and phy-names, and they do so at the board level (as Photonicat does).

This is also the standard pattern for SoC nodes with board-specific
connections: keep the SoC node disabled, and let the board dts enable
it with all required properties.

The phys/phy-names properties cannot be moved into rk3568.dtsi anyway,
because the SerDes connection is board-specific: some boards use
combphy1 for SGMII, others use combphy2 (like Photonicat).

Thanks,
