Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC24447A0AB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467683; cv=pass; b=FaogrTOGbacyrrtAXTtiH2bw1nEe6/Fr2PPJ/GeIiDyYs97UH4kwuyQwSic4QXB4DeJSKxv0W+/bX1UN5G+UAoM3sttaIDbjbTXQKX0Phode/og42msHfoU34VEjoNwTChu9vYjzPVjdFrVxiUahy47IRSN4/s3SpFUm/2Wtas8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467683; c=relaxed/simple;
	bh=K6NQ56CQz4opirfqBqoQPOdTzRJCAXPxXX+W2EVrPSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdqlrLK+6VWsrceqQWFLkDujkc4gQYC0xAYdpoWs7XoX+9Rjo5yXzpiXM98eEKGbXQymzawne6+5KMP5QlOSqaPiw7o6mJKPnmZcj/qJYVspsVZ5bq9waC9iJJhS61+arIqs++tx4cj0gDmwLQfUdbguiH0BOA9jvPrzkzORFhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orAd+Y+E; arc=pass smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orAd+Y+E"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c28e3998eb7so254228766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467678; cv=none;
        d=google.com; s=arc-20260327;
        b=fjJpI5vBWoSwa9NUIJspQEoOITv0JmHZk0F21Po8/B8M0xeI/YtNFKaoypXWMauKHT
         mPoK02KXstA7vKCX7vwV/SUYUepIHEn+nc99RZ/KkGP7xV2wx0rAs50Z0EgySWq4qnGz
         dxYmLa6mlkUZHooJtieJFQzU/iu7hcb3obhJ2FjKbcTtLQO3WoeU9SWNJG41yKic9Hw8
         VAJQoc3xHNakAyxH+ri5NhDaBtf5AxowmpzM8eO8UPL7cANzJqJR05TU09NPGpPuAfSA
         93PkVKWYpq07MLSx5/3pV4ZzuFWS0JrubyNhu1Wrg2DToPVIW19nehDX7i7q0XzzLjz4
         O8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XABCwRH1cz9pvG8xb1/rc/NU2wG7piHZfQQ4/81JX2E=;
        fh=k7ukl++vKpaE5FoOhP5DEVveQqY6OOVV3/QmXdJS+qU=;
        b=st/BjtFvTr4f/etfbva3IvSrD7lC8szVzw+7lxZ4rLXn14Z4rxgBT2UBUqO4hVvLVf
         5b9v+hT4mywJ+1zf63afmFHPQ2f76kccy8aJosvamUkXhjfzPYr1GeaoPxlDzkTPpChY
         P2Dre3V1eoLJq3HUm8PElDTfG/K6aFGLhB7dLK5TSNft26EobqGPvBtRzN4AEvc99/xO
         4kDoDwRzBz8K3IBwNkScXv5rkOkpePMaHN4C2qmXyBDHZcOI6jWUCi17y5Q2DhPImqOS
         sHtpHkMQ9XWDtvvxVGwBGucAR2eV5jtUyHah6zblWq7xGwbU+DIwmANjj4OjyYdscq8P
         L7QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467678; x=1790072478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XABCwRH1cz9pvG8xb1/rc/NU2wG7piHZfQQ4/81JX2E=;
        b=orAd+Y+Ef1rdZCPWtpE6sqjJf2dwQ7/WOTgt6g4aU4JZWgwfo0YLgqC/4p/wDfOiGU
         aCxcgmAv5PwaYmfj2nUFF/2Ui3AYJ1FBvHBbn8c+fMN4qbRBa2tpKufl8huRmxrRb8sa
         ZNBCScdbx2pl74mACjGGUGVUV50uFp3vAhimgJmR6L7hJb6qx+c4d9SK88U8Yb6TLVq6
         xZ17/CwIdtW9vuR4GMKdn8xk08DW8AXKp5IfOm5YtIdT0JLwP/O8Wz+a2sDvmPley9u7
         YE/QPmdQxtji3LkBeY8vYhfIA+Uv4XG3RFgcEMgFx9cyeZ+IX/qq0s1Kt+ym99qFmI+l
         xxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467678; x=1790072478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XABCwRH1cz9pvG8xb1/rc/NU2wG7piHZfQQ4/81JX2E=;
        b=PDchBa6YbUqtUAx+4t85LQaNziQwlrNjtgAdbMMHeExzXMvLZMBP8CQ/5ZcSyPpnQj
         1pGx1oBUVQ8QZPyA0+giX5yABb9FG0OmR6Q1fcr48mjvHcL9mNTcQxWrTkeVHT7QtWe4
         6iuwqa9pil4e09PMrVfu6A8VlVjM6MeUnH3ROWDIAB+c5cLsVMuStw8qUCRQWjtOqCzL
         eBzccPju5FKZhzKdVOkRP2//hBhH3h6k79yi78IOcayJ1A46NIj2ZXVh9honIf/lGQtf
         eqygZzawC0z6LKOADky5DyCZ5uDG3VQsjGeEgYLH5dD3a8xsDwORpHqEJoE9izQbIRqD
         YQbQ==
X-Forwarded-Encrypted: i=1; AKwUvBy95+2k9bLaaJxhAHFdcJqI/d/iVhJzMN2T3HQ/MsbXqr4Z7r0a3odFWloJDo0DXsE0cBFN2yjbM/lQ5dM=@vger.kernel.org
X-Gm-Message-State: AFuF++mwIXRZibEDKZ9L+xiZk9kabtzs6pckmFMv9y4RJUkVRbZ4fpC1
	X4e6Ci7aLmfaSNaveAs++cvtFdXNc/UpuUUfYFBmKKBHttGQ48+XCP33lxxAlntp5G77OonBaWU
	V2vFXZ7WwmnFgo4Vy4nTVVaT2h2S753w=
X-Gm-Gg: AYBFou3GXRNIZOdhldN8vwhAkNA5Wx1/VRIhwmOxTAbjzEbxniO7cvggo7oxWDCufcK
	D+Y9jEMTO6U/3qXNyE512BYVdD9bqJ0eujZ8BlO0iIDGAKSPr1JytQux9MQle6UxyRUUs9N5Gkd
	WReyhj8a+kXSrbjLnDrogUvCxcylGcH1QMuoQjW3ccv4717W0u09FoYYT9oje3VUBC3iNiQp8ju
	G/FzncGyZPWF5pRaXROXms+xgvpMNbUSk8YYn44JLzRA+B3j7lIDrEKJbI3kQhwaxvCL+akYLxD
	w0Uhq3QN9y7tyNu5uDUlVJfPX0+HppQUf0fpzVlINBc+lTKkcS7ajuRz0bLWXvAnsGaKeg==
X-Received: by 2002:a17:907:7241:b0:c20:3402:bd35 with SMTP id
 a640c23a62f3a-c29b86141d8mr457395166b.12.1789467677591; Tue, 15 Sep 2026
 03:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913185849.907479-2-coiaprant@gmail.com> <178941747507.22033.8211069120708719813@kernel.org>
In-Reply-To: <178941747507.22033.8211069120708719813@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 18:21:05 +0800
X-Gm-Features: AcwNN1U3Qit6ntXQAFPttYjh805h_onbrrSTpOF8OG9JEjoB8ua8kiIB7eBD0O4
Message-ID: <CALj3r0gwMFRg7GADhOThGWbpJ=9CGGQYUb=xYtsDV8kLAHkMuQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 01/11] net: stmmac: move XPCS lifetime
 management to platform drivers
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org, 
	linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8815=E6=97=A5=
=E5=91=A8=E4=BA=8C 04:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 1
>
> - [Medium] Commit message mischaracterizes the removal of the generic
>   XPCS creation as removing dead code.
> - [Medium] DT binding vs implementation mismatch: after this patch
>   nothing in the stmmac core reads the generic 'pcs-handle' property,=E2=
=80=A6
> - [Low] The commit message describes two defects, one framed as "more
>   critically" (the common code overwriting priv->hw->xpcs after a=E2=80=
=A6
>
> --
>
> net: stmmac: move XPCS lifetime management to platform drivers
>
> The generic XPCS creation in stmmac_pcs_setup() (pcs-handle lookup and
> mdio_bus_data->pcs_mask based xpcs_create_mdiodev()) is removed, leaving
> only the plat->pcs_init() / plat->pcs_exit() dispatch. The Intel mGbE glu=
e
> grows its own pcs_init()/pcs_exit() that create and destroy the XPCS, and
> the renesas-gbeth, rzn1 and socfpga pcs_exit() callbacks now clear
> priv->hw->phylink_pcs after destroying the PCS.
>
> A few questions on the commit message and on the removal of the generic
> path.
>
> >     First, if a device tree specifies a "pcs-handle" but no select_pcs(=
)
> >     callback is provided by the platform driver, the created XPCS is ne=
ver
> >     used. The phylink framework requires select_pcs() to actually retur=
n
> >     the PCS to the core, so the pcs-handle property becomes effectively
> >     useless without the matching callback.
>
> [Severity: Medium]
> Is "the created XPCS is never used" accurate?  An XPCS stored in
> priv->hw->xpcs has two consumers that do not go through select_pcs().
>
> stmmac_phylink_setup() in stmmac_main.c uses it to widen the phylink
> interface sets:
>
>         /* If we have an xpcs, it defines which PHY interfaces are suppor=
ted. */
>         if (priv->hw->xpcs)
>                 pcs =3D xpcs_to_phylink_pcs(priv->hw->xpcs);
>         else
>                 pcs =3D priv->hw->phylink_pcs;
>
>         if (pcs)
>                 phy_interface_or(config->supported_interfaces, ...
>
> and stmmac_init_phy() uses it to decide whether to attach a PHY at all:
>
>         if (priv->hw->xpcs &&
>             xpcs_get_an_mode(priv->hw->xpcs, mode) =3D=3D DW_AN_C73)
>                 return 0;
>
> So for a dwmac instance with a pcs-handle but no plat->pcs_init, does thi=
s
> change narrow config->supported_interfaces (and config->lpi_interfaces) a=
nd
> alter the PHY-attach decision, rather than just dropping something unused=
?
> Would it be worth spelling that behavioural change out in the commit
> message?

The XPCS's runtime functionality is entirely driven by phylink through
pcs_config() / pcs_get_state() / pcs_link_up(), all of which require
the pl->pcs pointer returned by mac_select_pcs(). Without that callback,
pl->pcs stays NULL and none of them are ever called.

The two reads in stmmac_main.c are one-shot setup-time side effects.
They do not exercise the PCS, so I consider the statement accurate in
the sense that matters here.

> [Severity: Low]
> This isn't a bug, but could this paragraph say that no in-tree platform i=
s
> affected today?
>
> All three pre-existing pcs_init() implementations store their PCS in
> priv->hw->phylink_pcs, not priv->hw->xpcs:
>
>   renesas_gmac_pcs_init()  -> priv->hw->phylink_pcs =3D miic_create(...)
>   rzn1_dwmac_pcs_init()    -> priv->hw->phylink_pcs =3D miic_create(...)
>   socfpga_dwmac_pcs_init() -> priv->hw->phylink_pcs =3D pcs
>
> so the old "priv->hw->xpcs =3D xpcs;" on the pcs_init branch overwrote NU=
LL
> with NULL.  intel_mgbe_pcs_init() added here is the first in-tree pcs_ini=
t()
> that stores an XPCS, which makes this a refactor that removes a latent tr=
ap
> rather than a fix for observable breakage.

The wording is intentional. All in-tree pcs_init() implementations
except Intel store their PCS in priv->hw->phylink_pcs, so the old
assignment was a latent trap rather than observable breakage. Calling
it out as critical reflects the risk it would have posed for the first
driver that stored an XPCS there.

> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > index afe98ff5bdcb0..7396b68899c66 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > @@ -426,35 +426,14 @@ int stmmac_mdio_reset(struct mii_bus *bus)
> >  int stmmac_pcs_setup(struct net_device *ndev)
> >  {
> >       struct stmmac_priv *priv =3D netdev_priv(ndev);
> > -     struct fwnode_handle *devnode, *pcsnode;
> > -     struct dw_xpcs *xpcs =3D NULL;
> > -     int addr, ret;
> > -
> > -     devnode =3D dev_fwnode(priv->device);
> > -
> > -     if (priv->plat->pcs_init) {
> > -             ret =3D priv->plat->pcs_init(priv);
> > -     } else if (fwnode_property_present(devnode, "pcs-handle")) {
> > -             pcsnode =3D fwnode_find_reference(devnode, "pcs-handle", =
0);
> > -             xpcs =3D xpcs_create_fwnode(pcsnode);
> > -             fwnode_handle_put(pcsnode);
> > -             ret =3D PTR_ERR_OR_ZERO(xpcs);
> > -     } else if (priv->plat->mdio_bus_data &&
> > -                priv->plat->mdio_bus_data->pcs_mask) {
> > -             addr =3D ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
> > -             xpcs =3D xpcs_create_mdiodev(priv->mii, addr);
> > -             ret =3D PTR_ERR_OR_ZERO(xpcs);
> > -     } else {
> > +     int ret;
> > +
> > +     if (!priv->plat->pcs_init)
> >               return 0;
> > -     }
> >
> > +     ret =3D priv->plat->pcs_init(priv);
> >       if (ret)
> > -             return dev_err_probe(priv->device, ret, "No xPCS found\n"=
);
> > -
> > -     if (xpcs)
> > -             xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100=
ns);
> > -
> > -     priv->hw->xpcs =3D xpcs;
> > +             return dev_err_probe(priv->device, ret, "Failed to initia=
lize PCS\n");
> >
> >       return 0;
> >  }
>
> [Severity: Medium]
> After this change, does anything in the stmmac core still read the generi=
c
> "pcs-handle" property?
>
> The property is still documented generically in
> Documentation/devicetree/bindings/net/ethernet-controller.yaml:
>
>   pcs-handle:
>     $ref: /schemas/types.yaml#/definitions/phandle-array
>     items:
>       maxItems: 1
>     description:
>       Specifies a reference to a node representing a PCS PHY device on a =
MDIO
>       bus to link with an external PHY (phy-handle) if exists.
>
> and snps,dwmac.yaml $refs ethernet-controller.yaml and ends with
> "additionalProperties: true", so pcs-handle stays schema-valid on every
> dwmac node regardless of which glue is bound.
>
> On a glue that does not set plat->pcs_init, stmmac_pcs_setup() now return=
s 0
> without looking at the property, priv->hw->xpcs stays NULL, and nothing i=
s
> logged - whereas the removed code would at least fail probe with
> "No xPCS found" for a bad phandle.  Should the binding be updated to say
> pcs-handle is only honoured by specific glue drivers, or should the core
> keep a generic path (or emit a warning) so the two agree?
>
> The same question applies to struct stmmac_mdio_bus_data.pcs_mask.
> stmmac_mdio_register() still treats it as "a PCS lives at these MDIO
> addresses" and masks them out of the bus scan:
>
>         new_bus->phy_mask =3D mdio_bus_data->phy_mask | mdio_bus_data->pc=
s_mask;
>
> but no core code creates a PCS for those addresses any more, only
> dwmac-intel's private intel_mgbe_pcs_init().  Does a glue that sets
> pcs_mask without pcs_init now end up with that address neither scanned as=
 a
> PHY nor instantiated as a PCS?

This is intentional. Only platforms that set pcs_init() are considered
to support a PCS. A glue that sets pcs-handle or pcs_mask without
pcs_init() is misconfigured, and the new behaviour makes that explicit
by not creating anything.
