Received: from mail-ej2-f5.google.com (mail-ej2-f5.google.com [74.125.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854A84E77FF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675272; cv=pass; b=rki8iBPiSJVuKEbZHC8xboOlV4W6+zMWw+qQVyDZSb4+UihsJgILHVZFCi/GGGklThdRrO9fYL0gIWZt+QX8rgiYO+uXq5pFaO3mPeMRLOXAVmSUBwJO4k5WuDZVzbx6FAZNh8gFgOni2msVmQcbY8Mnz9ASpHgJCXr9eKNKjBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675272; c=relaxed/simple;
	bh=SmoZlNcgK004ejU3QG4/6TIoXHLt4hQyxud9+pfi8WQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqhm6wMuQHD5Kh0PmMzJ8Y6NXmMd9MOYB9NpfnmdW6LPgkY5XXH+vphl/3E21aWvcvDU/2sPnAya+PB/LCdBRi9WCj6PYiIkWyNn/mKB2poGrY6qyFvpBmPjk5srb8qjhMxhcB512Owac0j65KH7waiBJPU7UCL60T0IYbftZCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kjzf9KC/; arc=pass smtp.client-ip=74.125.228.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kjzf9KC/"
Received: by mail-ej2-f5.google.com with SMTP id a640c23a62f3a-c29d14021b9so258166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789675269; cv=none;
        d=google.com; s=arc-20260327;
        b=d3wjcpff5DTaqny156GtMCM3+rxtAL8W68XyFUHK1x0+tlMr4uBieMiF2QfWbfIOkV
         l/+XBeP9Pj7KZc3UMNopG/b/B5/JCNATRGo2sS/Gzl+MNaPQOXVOgNAKg4R/xn2FhXk9
         mButn7bJjgQrXaSDoYinFJpBHnl6ftLIEWaehTnRUxXS+9iIFRQPUb04TeuHCNoJrOM+
         HrUgxwi0/oBXCyo78Nkjv+kQZ+mhXmsk4xzgXFen4t+BHbjAvjn+DaLvaRWvMz/9ovaQ
         58Y+xGe9sS5hVEEPHXgyl18B9IURflOU3vVvxrnf50y77iMqUXNMKub4W6xxMBgd7kK5
         4HSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X5WNGNe1lhNBokZFGMokFyVzO+LFHTSqDV1bGq+2Clo=;
        fh=Zh/QnJRy9vsCIuDvawrMTGjaVJd/fYnX5l7icdvD/jI=;
        b=bpUg7L3sdV12272ugygqBrkoaJShR0GekbGs1yFtzPgaIoWr+KloI77iAxsZ2QCJv6
         NXZjpzPsXriA87bykVIwiHlrS1Itx8DRGC2lRx1q6TKlxbIrazpwK2HI5GIY+9waITEW
         SuX3p3bEqLpes2cLYza/tKz+p7cvu9KhLWMCboFz8Z3OB9YHjIZZmx2USB/4qN8YsrTo
         jRp23p7OGShIDGZDrI4Zr/mnhNmUR8C+b0pSluDNN5TOEHbAK0rF3TPpXdDF567FaU0G
         6GQhBC4FStBJT+WrtKuy0ZJGLpa6wJu2LHBElu0WUVv5ECRO+8JoPbQ0GYNnFvvOePNA
         c6Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675269; x=1790280069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X5WNGNe1lhNBokZFGMokFyVzO+LFHTSqDV1bGq+2Clo=;
        b=Kjzf9KC/wmLYEVbiTNKN1y54MJ1RxLNsvydzIAoj8u06QveCYk+BP1Gy6nXWvIKtlZ
         bNMN4BjCceUvnmtFs8ySapMBgiE+0vf5S2OSQkwMK2QNLjTZXVhdXUGJYF7kwubeBQpP
         7Gopr9dipHGfXPp8MOiM3cXbsYtdGMxAcT7cjpIqi5pSQKlTShO78qH6OYL5iAk5GnSW
         jNa8v1274UUReHEpZ/UldCJfqsc9rs0xB28musIcokoZ9x9Y+2pJ5YLcSU8ScLqLKBMv
         bEUwInOLdAGFtR0PtfincmvDdVVshPcmZydY013dTjau4LUEfikv1jhVK1530gH1ZP5C
         Nf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675269; x=1790280069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5WNGNe1lhNBokZFGMokFyVzO+LFHTSqDV1bGq+2Clo=;
        b=v2d5/xKXb9jIgzGK0wkcJNLJ1jmOM54LV8opEWZ/Wi0aCS4ZXY46hKAngujsMhGq6N
         t0ZpqVKcaD9FpiRKZE3EgyuscU28/ssulVC4j+bfhDKCNokx1BPGYeVJCEWz+3QY8vTE
         J2ZSm9Llwv28WURRzpZsfB5nhg3q/6XhNctQZSOGTX8wKfMbDKZw2uODgKpxL5WFyJ1t
         pWq1Y31/fYpaKJeHYe6LafcLPkZg45iUKs6RMcSfYLsmBpgf/Tl/pwYAb9eIyVtYI3/Q
         FzsiXxNRYj2ljTLBEJYoF00i9v6sjDHERnbbxaOvDpBRdZC4TDALuaHmn4hZGsIk/91T
         NSbw==
X-Forwarded-Encrypted: i=1; AKwUvBzzo5OKR730dKi3vgQjir9b18189Q/B7rOKxHVONOoEnomfUfoOm30zl6Itlju5B42HEQs0Cj14F45uDbY=@vger.kernel.org
X-Gm-Message-State: AFuF++ndmWlBvR6eF2yK6t1wTkhTk23OVersNsGyx5ApBfIczfsHrS1F
	obLRPCVanmUGicYIikGaKNvQkVgxjlYa6o4oi9RKk67UVX9rmbnGrlBe4MDc4dtAbNEs1OddbCF
	hXnNJXffMXJWIk7zz57iwZQ/nMEsUkOM=
X-Gm-Gg: AYBFou1E3koYlZvFbvGTIGath1pJ4OMmney905Ztv3eSz1XI+FWkX+ULkFBwsJFrv77
	kNaxqBXH0A8b4Y1kpJ7XPU1x1OVXdnnpPOs4Q88jEin/9jk/pFBZB+OkZphbd60bdMgokWjyir/
	Gwtb5oboMVDUBrPkLaJST7RfGwJdq9Wk7lKuUAEatwBeaIJR3KbnWcV9W0i4DkfVnyDa2rG3T0N
	CXJnzQNYaEbrIqAT4+7h16tqiS3/RVJdg/HCGOXzx8izmmYQIJzwA9Iz8u/a1WIdXCJZSKwR6+V
	ab+oZKV/tiSYrWAmZm12ZLetY09gdfPvLGZeyId4gWsx+rxiqk3d8WeSMg==
X-Received: by 2002:a17:906:9fcc:b0:c25:4ba1:594f with SMTP id
 a640c23a62f3a-c2a15f67cf6mr21382466b.0.1789675268485; Thu, 17 Sep 2026
 13:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915123802.1561724-2-coiaprant@gmail.com> <178967028545.22033.5966180145855511133@kernel.org>
In-Reply-To: <178967028545.22033.5966180145855511133@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 18 Sep 2026 04:00:57 +0800
X-Gm-Features: AcwNN1W0xTkmloUsW1i5szl1NVx3ZPQaoGTeeiTrBr7OCO9p4oUaPDdA4g8lK3Q
Message-ID: <CALj3r0iGMEbOwFZV8U0k_Ok7+QAdRdR-Y2B=8RjjLYTADU5opg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 01/11] net: stmmac: move XPCS lifetime
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

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8818=E6=97=A5=
=E5=91=A8=E4=BA=94 02:38=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 (1) =C2=B7 Low: 0
>
> - [Medium] stmmac_pcs_setup()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:426) loses the only=
=E2=80=A6
>
> Pre-existing issues:
> - [Medium] Clock reference leak in the XPCS constructor now invoked from
>   intel_mgbe_pcs_init(): xpcs_init_clks() (drivers/net/pcs/pcs-=E2=80=A6
>
> --
>
> net: stmmac: move XPCS lifetime management to platform drivers
>
> This moves XPCS creation and destruction out of the common
> stmmac_pcs_setup()/stmmac_pcs_clean() and into plat->pcs_init()/
> plat->pcs_exit(), converts the Intel mGbE glue to create its own XPCS,
> and makes the renesas-gbeth, rzn1 and socfpga pcs_exit() callbacks clear
> priv->hw->phylink_pcs after destroying the PCS.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > index f5f9fa67ecd77..4308dccbf2570 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > @@ -603,13 +603,47 @@ static void common_default_data(struct plat_stmma=
cenet_data *plat)
> >       plat->mdio_bus_data->needs_reset =3D true;
> >  }
> >
> > +static int intel_mgbe_pcs_init(struct stmmac_priv *priv)
> > +{
> > +     struct fwnode_handle *devnode, *pcsnode;
> > +     struct dw_xpcs *xpcs;
> > +     int addr;
> > +
> > +     devnode =3D dev_fwnode(priv->device);
> > +
> > +     if (fwnode_property_present(devnode, "pcs-handle")) {
> > +             pcsnode =3D fwnode_find_reference(devnode, "pcs-handle", =
0);
> > +             xpcs =3D xpcs_create_fwnode(pcsnode);
> > +             fwnode_handle_put(pcsnode);
> > +     } else {
> > +             addr =3D ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
> > +             xpcs =3D xpcs_create_mdiodev(priv->mii, addr);
> > +     }
> > +
> > +     if (IS_ERR(xpcs))
> > +             return PTR_ERR(xpcs);
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but since the XPCS constructor
> call now lives here, it may be worth noting: can the failure path inside
> xpcs_init_clks() in drivers/net/pcs/pcs-xpcs.c leak the clk references?
>
> xpcs_init_clks() takes the references and, if enabling fails, returns
> without putting them back:
>
>         ret =3D clk_bulk_get_optional(dev, DW_XPCS_NUM_CLKS, xpcs->clks);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to get clocks\n");
>
>         ret =3D clk_bulk_prepare_enable(DW_XPCS_NUM_CLKS, xpcs->clks);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to enable clocks\n=
");
>
> xpcs_create() then takes the error path:
>
>         ret =3D xpcs_init_clks(xpcs);
>         if (ret)
>                 goto out_free_data;
>
> out_free_data calls xpcs_free_data() (mdio_device_put() plus kfree(xpcs))=
,
> so xpcs_clear_clks() - the only caller of clk_bulk_put() - never runs and
> the xpcs->clks array is freed with the references still held.
>
> intel_mgbe_pcs_init() only receives an ERR_PTR here, so it has no way to
> release them. Would adding clk_bulk_put() on the failed
> clk_bulk_prepare_enable() path in xpcs_init_clks() be the right fix?

This is a pre-existing bug in pcs-xpcs.c and is not introduced by this
series. It belongs to the XPCS core driver and should be fixed
separately.

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
> This removes the only generic reader of the documented "pcs-handle"
> property (and of mdio_bus_data->pcs_mask). For a glue driver that does no=
t
> install plat->pcs_init, stmmac_pcs_setup() now returns 0 before looking a=
t
> the firmware node at all.
>
> Does that make "pcs-handle" a silent no-op for the plain Synopsys
> compatibles handled by dwmac-generic.c?
>
>         static const struct of_device_id dwmac_generic_match[] =3D {
>                 { .compatible =3D "snps,dwmac-4.10a"},
>                 { .compatible =3D "snps,dwmac"},
>                 { .compatible =3D "snps,dwxgmac-2.10"},
>
> dwmac_generic_probe() sets no pcs_init, while "pcs-handle" is defined
> generically in Documentation/devicetree/bindings/net/ethernet-controller.=
yaml
> and imported unrestricted by snps,dwmac.yaml. Previously such a node got =
an
> XPCS via xpcs_create_fwnode(); now priv->hw->xpcs stays NULL and the
> former probe diagnostic ("No xPCS found" on -EPROBE_DEFER/-ENODEV) is gon=
e
> with nothing in its place. Should the bindings be updated, or should a
> generic pcs_init helper keep honouring the property?
>
> The commit message says:
>
>     First, if a device tree specifies a "pcs-handle" but no select_pcs()
>     callback is provided by the platform driver, the created XPCS is neve=
r
>     used.
>
> Is that accurate? priv->hw->xpcs has two consumers besides select_pcs().
> stmmac_phylink_setup() uses it to widen the interface masks:
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
> and stmmac_init_phy() uses it to skip PHY attachment:
>
>         if (priv->hw->xpcs &&
>             xpcs_get_an_mode(priv->hw->xpcs, mode) =3D=3D DW_AN_C73)
>                 return 0;
>
> The commit message also says:
>
>     Platforms that do not need an XPCS simply leave the callbacks as NULL
>     and no change in behavior occurs.
>
> For a platform that relied on the generic "pcs-handle" path, does behavio=
r
> change - narrowed config->supported_interfaces (and config->lpi_interface=
s
> when priv->dma_cap.eee is set), plus an unconditional PHY attach where th=
e
> DW_AN_C73 bypass used to apply?
>
> There appear to be no in-tree DTS files pairing "snps,dwmac" with an
> "snps,dw-xpcs" node today (RZ/N1, RZ/T2H, SoCFPGA and Rockchip all go
> through glue that sets pcs_init, and pcs_mask is set only by dwmac-intel,
> which this patch converts), and the gap is not filled later in the series=
 -
> at the end of the series stmmac_mdio.c still only dispatches to
> plat->pcs_init and "pcs-handle" is parsed only by dwmac-intel,
> dwmac-renesas-gbeth, dwmac-rzn1 and the new dwmac-rk. Could the commit
> message state plainly that generic device tree XPCS attachment is being
> removed?

You're right that this removes the only generic reader of the
"pcs-handle" property, and that dwmac-generic.c no longer gets an XPCS
from it. This is intentional: PCS handling is now the responsibility of
each platform's glue driver via pcs_init(). No in-tree platform relies
on the generic path. I'll state this explicitly in the commit message.

I'll also reword the "created XPCS is never used" sentence to
acknowledge that priv->hw->xpcs is still consulted by
stmmac_phylink_setup() and stmmac_init_phy(), even without select_pcs().
