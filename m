Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA850AC09
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464664; cv=pass; b=rkPY8yMTArX89V5Q2Mis92Y0nfwg+Unm6eQPOO9uIIpMg5X1VrVsqJME5/v6p4Y0pEgdJbZN64buD8mr02poGWNYMHWDIAiJ/MSUDVfIxcBgKBTNQhHUBW+pPOsPRK2m5brjO4oTrYsEicQHnYy8zcVvxXaVcmgLJSDm9V3X6uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464664; c=relaxed/simple;
	bh=5uwxxeZPYN4Ij6akn4bwbxGcDtLNY+69BXfmEyQCBcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRqarGK3LcaI6oCvscOx4qF/I7eHci+oyLMIl7XABu4goL9fj9r34qQtPvQpJp2EE+NRxrK60QLBmvl8e+pHCqKCRT0+6O3CtLPXNhwxPRrDLMRBdTH1HL3DDxUINzGh0ppZqX1q9XbjgkfakFW254uyRg7E2SPPszQgwE7cRuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfTP3BHC; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfTP3BHC"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a6010a7234so24889a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788464647; cv=none;
        d=google.com; s=arc-20260327;
        b=P/yS5FFObMpUEBrpK4kdHZlCHJgoCJeby2XgSmCvEbeY5EI2b3pBms4WhRStXJT2C2
         0fd2ZBrnbmZSl1Gt162ojBmDTQCKV9upMeY9UkhiceDzhZESbUUtx1uawhCyfgFWJwKk
         IafRDGfO4fMfbPqwLS63Po+R7akzR0z4+stnhTKC6+T/zevezORFNdU4ZuqBK4WZBFye
         j0Y7R35kc+9eqwAMo109Tf0VaXKIRUzhNAs43mOtQm2P02kFNnyawKdZqbcb6Rnmp26a
         MDDxT9n77yNtHqu9UGRLwTLi8DbW1Fz65ZK2qu8j0NjtNKFdx+BxHMFf2sxwhqu2paUO
         yYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nTSGhWAmSp7STouxjDPpEdLgNOmqXAwprS+AGG4sBg=;
        fh=vNow4EkRA2bzHJQ1k1OitOr6dWMmPBiuMkXwxFspgdE=;
        b=ThTg0SS6vYTv5YDzdYkiYtNk035UlPJFdkLP3SUN+KR9vqTxjq13RLvWSRYb6Fanwy
         vRx8vRSNA3d8fCFC7FhJUXt2ulWtzz6cXcKIL7hLwABQyzdQeDJ1e+pgVjSkNLpD1NLp
         6/DJgPbJLKZZHFTRnCYIy6MCMtGojTyzaO+885ihW/BvKAehQ+knC/r7QOyEQh0a5/Gn
         3e6+a4gmDkkxAs+3rVmN9v3c3ZGx798+MKl2UBEsAahEMK/JwOI5NyVZM+/hRiS2M80d
         lZ8lBfaeuv5sOdGYvaUvGlk5pTvZHIJTaXmTybXKUYFhnoYLevRMbRD+i0NxdmzUvEbG
         WcFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788464647; x=1789069447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nTSGhWAmSp7STouxjDPpEdLgNOmqXAwprS+AGG4sBg=;
        b=IfTP3BHChN+WgwQWFEhAvkOCgDBJV5XK0HWHz1E3oaOmWI5qtksAUxUuH807T0ivCW
         yyLlpKb7GLWb/SJy4iiM4/BtIkgPPHLPB3sjP35X7RZsf6Cnv1IgV7TbXDQb6YQIoTAc
         TYMx1TiI8II4jd5M1DuaIV1QagmeNgDmci1T3qbE40yyfZJ5LekJ7rsUbm0LtO7wYkZH
         rABDQ5tRhk96rMoQC8H1VyoqjGERJW3E/2S+leBO0RiYLVREN5NHKSogpKfZQxakCcIk
         IUK4OPzGB0WSZJl4S97smVosq7IayejGyf2V4npgo5p9JTMNHZnAGOv0JIK6qOU91qvq
         II0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464647; x=1789069447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nTSGhWAmSp7STouxjDPpEdLgNOmqXAwprS+AGG4sBg=;
        b=EM9wsgpSgkV8BKxHjSustQOojD8fqiOq+e8qFD8KOh8JYOrmUIugfC3dYvlKHhYOQV
         XHUi+eB/CDllpHhKRJkHZa0stjnsOIBfbNqdq5r38Bd3fIuk51TRC5BMhEPLOox21C7Z
         GdmkcUYqhsNOACGyxG7AxHuCihJO/L5WWhoyCbxbvXqJZtXbchTevtTcksB5WSAbW2Vb
         0KdX8C9jImtEm7F5eDeOVXN82PR6Izo8C4Fi1F0Fj3mOflinmmsOT49CfMCwSv/JnDiP
         U1qR5TLrSYWKiId+TRIHWBDyf5jM3SSAealjqxOxTEgJVoeJxYz/zywr5dzhrpFbJq0P
         7AKg==
X-Forwarded-Encrypted: i=1; AKwUvBz0FnJtODwFGZN94SGVGHEPKbhLsb659HtOR8py7wnKdtSU56N2caTnn+DebhYcP9OpkSiaYyR0Sgj8q38=@vger.kernel.org
X-Gm-Message-State: AFuF++nEqXTBbokCU5G2UZ5Gx0OfxMyUK9ja/aWfFRTltfLp61ZxrPEQ
	Kz6g/TBwJFYZGUGVkTX967EzGBtiKsYRjT9vPsnN+7YdQKwUV48fL2TWhmRxx5Bn1KBB+tyO19D
	PaeO7GKYx/zERP6gK+Wr1H75QGJCo61E=
X-Gm-Gg: AYBFou09magWStAEAAXecR7GFWdz+CdLS2OPcs7AO5oL4ZpgX//gz4NM58QQVN9yrhG
	BmUA6Yh3oFztm31HsShIAhdxd5Fod//TaZjv+aC+LNjbKNhBg2L6C0WPkYp9ftQhdV2Y3sheF1E
	9xBcI6gVqqFVly2LBhGnnS5gYPGvW+iIj7B7z7RSFzRhO1qXUdaVWNsyRJ65WgzcvYaXw/p40EH
	P4YX7MenzPyvImjMayecO8f/OmUUcuHSh9Y6E3G1pePBZPDZDhfh6gXoPiVV8xJGidribbnLHIC
	O58J93EwWRhq6vU4Ho1C9npWRoiYSAj3pWJqCqX9iRDBGFJOsu1wCyZ0DMcapiOAH0ubKIzp6bY
	LFA==
X-Received: by 2002:a05:6402:4585:b0:6a6:32f6:ee8e with SMTP id
 4fb4d7f45d1cf-6a7e8e9c97bmr78640a12.3.1788464647094; Thu, 03 Sep 2026
 12:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-ti-davinci-emac-v3-1-db41e32f3f6d@gmail.com> <178844863252.3394541.10006643092711574384@kernel.org>
In-Reply-To: <178844863252.3394541.10006643092711574384@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 4 Sep 2026 01:13:54 +0530
X-Gm-Features: AcwNN1VED6faEgcpjoUkRbm5zQtgZu9zqcqs2cQMMmJnQoBHnsr_ZAdYEEo-k3k
Message-ID: <CAOWyW_6qRhoUts2MtvDL3JiBx74UOBs73Fye=1FKrky-brmS8Q@mail.gmail.com>
Subject: Re: [v3] dt-bindings: net: ti,davinci-emac: Convert to DT schema
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tony@atomide.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 3, 2026 at 8:47=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> - [Medium] The new schema lets `ti,dm816-emac` nodes carry either 1 or 2
>   `reg` entries with no further constraint, while the driver derives=E2=
=80=A6
> - [Low] The schema makes `clocks` required (justified in the commit
>   message by 'driver probe fails without it') but leaves `power-domains`=
=E2=80=A6
>
> --
>
> dt-bindings: net: ti,davinci-emac: Convert to DT schema
>
> This converts the DaVinci EMAC text binding to YAML, documents clocks,
> clock-names, syscon, power-domains and ti,hwmods, and adds per-compatible
> conditionals restricting reg, syscon and clock-names.  clocks becomes a
> required property and ti,hwmods is marked deprecated.
>
> > diff --git a/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml=
 b/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml
> > new file mode 100644
> > index 0000000000000..f0c539d1bac79
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml
> > @@ -0,0 +1,127 @@
>
> [ ... ]
>
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,davinci-dm6467-emac
> > +      - ti,am3517-emac
> > +      - ti,dm816-emac
> > +
> > +  reg:
> > +    minItems: 1
> > +    items:
> > +      - description: EMAC core
> > +      - description: EMAC control module
>
> [Severity: Medium]
>
> For ti,dm816-emac this leaves reg free to be either 1 or 2 entries, but t=
he
> driver derives hardware semantics from the entry count.  In
> davinci_emac_probe() the presence of the second region is the only signal
> used, both for the control module base:
>
>         res_ctrl =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>         if (res_ctrl) {
>                 priv->ctrl_base =3D
>                         devm_ioremap_resource(&pdev->dev, res_ctrl);
>                 ...
>         } else {
>                 priv->ctrl_base =3D priv->remap_addr + pdata->ctrl_mod_re=
g_offset;
>         }
>
> and for the SCM eFuse MAC-ID instance:
>
>         rc =3D davinci_emac_try_get_mac(pdev, res_ctrl ? 0 : 1, priv->mac=
_addr);

This driver logic relies on the reg entry count to determine the port
instance. This is a software implementation detail and not hardware
detail. I believe it is bad idea to rely on the number of reg entries to
get instance, It's better to use of_alias_get_id() to get instance of port.

From a hardware perspective, eth0 requires 2 reg entries because MDIO
node occupies the 0x800 to 0x8FF.

>
> which flows into ti_cm_get_macid()/cpsw_am33xx_cm_get_macid() and selects=
 the
> register pair at offset + slave * 8.
>
> Given that, can a schema-valid DM816x node land on the wrong hardware?  T=
wo
> cases seem possible:
>
> A single-reg EMAC0 node with a 0x800 core window (as in dm816x.dtsi, wher=
e
> MDIO at 0x4a100800 is a separate node) plus ti,davinci-ctrl-mod-reg-offse=
t =3D
> <0x900> would make ctrl_base point 0x900 past the end of the ioremap.
>
To resolve this I can either:

Use nodename to hardcode exact address for eth0 and eth1 something like
  if:
      properties:
        $nodename:
          pattern: "^ethernet@4a100000$"
  then:
      properties:
        reg:
          minItems: 2
or
Enforce 2 reg for both eth0 and eth1, For eth1, even though there is no
MDIO, the base+0x800 to 0x8FF is simply unused, so describing it as
split regions is still accurate. But this will require a driver fix
for getting port
instance.

> An EMAC1 node written with two reg entries would be passed instance 0 and=
 get
> EMAC0's factory MAC address, putting two interfaces on the wire with the =
same
> address.
>
> In-tree, arch/arm/boot/dts/ti/omap/dm816x.dtsi happens to pair these
> correctly (eth0 has two reg entries, eth1 has one), but nothing here requ=
ires
> that pairing.  Would it make sense to constrain this per instance, or at
> least document that the presence of the second reg entry also selects the
> MAC-ID instance?  The commit message line:
>
>     - Allow 1-2 reg entries for DM816.
>
> reads as though the choice is free.
>
> [ ... ]
>
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - ti,davinci-ctrl-reg-offset
> > +  - ti,davinci-ctrl-mod-reg-offset
> > +  - ti,davinci-ctrl-ram-offset
> > +  - ti,davinci-ctrl-ram-size
> > +  - clocks
>
> [Severity: Low]
>
> clocks is required here, but power-domains stays optional.  For
> ti,davinci-dm6467-emac, is clocks alone enough to describe an enabled mod=
ule?
> davinci_emac_probe() only queries the rate and immediately drops the cloc=
k:
>
>         emac_clk =3D devm_clk_get(&pdev->dev, NULL);
>         if (IS_ERR(emac_clk)) { ... }
>         emac_bus_frequency =3D clk_get_rate(emac_clk);
>         devm_clk_put(&pdev->dev, emac_clk);
>
> There is no clk_prepare_enable() in probe, so the LPSC gate and local res=
et
> appear to be handled by the genpd reached through power-domains.  In
> drivers/clk/davinci/psc.c each LPSC registers a domain with
> GENPD_FLAG_PM_CLK and davinci_psc_genpd_attach_dev() adds the LPSC clock =
to
> the device's pm_clk list:
>
>         lpsc->pm_domain.attach_dev =3D davinci_psc_genpd_attach_dev;
>         lpsc->pm_domain.flags =3D GENPD_FLAG_PM_CLK;
>         pm_genpd_init(&lpsc->pm_domain, NULL, is_on);
>
> That matches da850.dtsi, the only in-tree user of this compatible, which
> carries both clocks =3D <&psc1 5> and power-domains =3D <&psc1 5>, and it=
 matches
> the example added below.
>
> > +allOf:
> > +  - $ref: ethernet-controller.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: ti,davinci-dm6467-emac
> > +    then:
> > +      properties:
> > +        syscon: false
> > +        clock-names: false
> > +        reg:
> > +          maxItems: 1
>
> Since this conditional already narrows reg, syscon and clock-names for
> ti,davinci-dm6467-emac, would adding power-domains to a required list her=
e be
> appropriate?  Without it, a conforming node describes a module that is ne=
ver
> ungated, while probe continues and later register access in emac_dev_open=
()
> and the cpdma setup targets a gated, reset-asserted module.

Yes, I will fix this in the next version.

Best regards,
Bhargav
