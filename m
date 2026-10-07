Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BCD3F54A4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358088; cv=pass; b=WUUvSNtyHmZCxN8BtfyeGdre0L29m4oJnXPPS0Yyd0HFCz7CFUiuEL/r+q4B5v6Zs4uivUT1xjK7/AB02XRpTb25l9oRUl2q3Mwk+rzZQvd8HCRk43okw0iSBlSpmWw1SpuszXzhinbUeN6zy7Pwxxegqez5KChYevX7uy+HQL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358088; c=relaxed/simple;
	bh=lwlqRQGo4x08t5IeEylUOiECkKYgj49qcnof0QlOmWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ah1zXPtXPRiGc0SSPORuMc5ui8S561huOe0xyXUmqyN+muAD2A6FNyya2mS/heBrq3fpfQsey06HsVNQW3hfuboDHi7Z8mFGjvdMrdzw785zcUoACqapipKTbt+BaRZpXq95abXNloiUs7/pazEvqxY4jUUOZEmCsbEJRdoQgII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFdpIIrc; arc=pass smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFdpIIrc"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c1971f5efc3so203502566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791358085; cv=none;
        d=google.com; s=arc-20260327;
        b=QHU/uc4nkTLLv73P597jfyWU6WQ6iXQxU07bzKucJR7JftOza4fgSyxw2GDMFnrdLA
         NjJxAlgNkzMFKY+sHgWpruFh+nPDNVVzVLKFu6cxhOQvtUNrqb9GnMkoKQnO2ibSrFnv
         yehVqDL4PSpEWPOZUluBaXsVKyIt+/uafj+lpv8f6/hbXsJc2+5Z/9zS/0BxshkcysPV
         OCJcOzmC9EmMiGhnzVNk5SYV/kEfyD9bDLUjrELTef+lB6AIKQ3ds6xmWOL1H7tYurli
         xrxfY1zt41RlKwIqNgAuuJeVNitl+14WuwZDBPfXJAJLI7d4uOnmvKTWFjsY/Ty8FGWx
         z/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=;
        fh=zNCz50xuAg+r2VeJUuzTYV7FCffBoolXiXgndm++FOU=;
        b=RCe002JeJp7DLXoxiY5NV22r64bFNDK5PQyk/o0OKxDW0JxNY4NLVFYKv6Me8aKofX
         o6YNLpwpgSjK4hrD+H1hn7+O5Jcyr7T7XXwXVmTVkWZ+rNDoXcaB5MmbXerMj/xAaKyK
         HomlO+Hlvk+Cdz9VskEuBukxInigyYot3+wNK4qp3hKod9y6PfOOqksF8ZnCjA/rWDsL
         zWjT37VhvTJMqYri5R1FHWNli2WmVbD8q4iJC2C7mnLb0BFaXDeEU2eU9jTrUWyMCwVd
         uY2r37zERfaXvyrP54C1pp6t5zwWz6LDGjKNt0hWgWz4iv/Lk+t7DNTBeU/q+KccZ/E/
         GRLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358085; x=1791962885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=;
        b=tFdpIIrclVTIf2KAJrHMWSy1N4TnKP8uAXP0bJtwqfH2mnGsNpfTZnVcKNjvDtwBM/
         vOENIf5Mb+iRERWPg2Qn2S+lxK3nMyWmJ+uq5O13vagsz1lCSW+RvCQtG54rer0ZXhYs
         pX88b12xc8quFypjyCJK0sIm+BrpG4LAzRF4hBJDVJnipYu3lwgTSwqLa/BF7exccDlo
         IzEQfbxo/NApI2FGip4YPvlStWqx0jQ1rWVAUOyAl6AkJREhXClY9XAF//oYTJtaRyoZ
         MD12QDz7vSUZPtvH7jqee+rdsjPUc0BaSlPHwD+S3Vi9WoQJ7BxExPV7DpDmmlv0LG5Y
         d99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358085; x=1791962885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Zq8NlPwkeL9howQ0mnjaivcphRCiBVQ8OhdmA2H/pU=;
        b=d2W3NUjObiAPQdEgTX5cOGSTFg02oYuJtZEFMJTIB7bsW84YKvqKJAy1x+HOK0r9cN
         SY3+mCrIOv7S6cbHK/g1ruqcRFgwIFQuEHWrYeDYdDBKtpV+aSzw/UD28s/B/ZKGXwzf
         uiTM/XgUojWGW6uxGCKQNS/AsZ6sZeTE6HI/Aa4Pw9Y3PDsC5xZOeYOEOYiuutJwmP/D
         AeU2SbTCKp6iulez9JW1bLvlroeKSS2itg3eLba+lX8W9+4ER7f1CiDGtRfyslj6HAN9
         Ur267MP2gGkNH69zKxBs+RXrXWIMqBW5ACKGMk64x5qGluGuVD1wNW79TnOXYSDveN3j
         unwg==
X-Forwarded-Encrypted: i=1; AKwUvBx+01d+BvFzEfnfv3X6ys2Ah1QjeKgwurTkQ1NZ5Nb1UyYS/6by6YLT7O5pRcPN188it9VTjsGTZk9j8iU=@vger.kernel.org
X-Gm-Message-State: AFuF++nNyfEQjZpllkUSlS5X1GIzLazGbnx7e/aF0fg1t6FIIdv1oLLz
	hCeOAACCRZKgrmdN3DdHfMnefuXPs/ZyAySWAwxVkj03VWjRn0kyB7EyrIoprbq8ohkpNZqX2gt
	ipQLMBlih+ZqTdgOQ+X8OTgWFSsxZZH8=
X-Gm-Gg: AYBFou10OW/wMsbkw3GrRAucT5zPd8DZqmw5/p781d0OuwADX4Gs71byZik98cUaOHI
	VZ+a5DlsfigpmHxZGNFvSKsB+gBCNHQQzP+ogvCUr2HPxSmqGFyYxv756LeyXOLr7m8JBPd/mHv
	2AV0Us2SVSy6xbWAWIjXa18Aweu/yQLmSO1F1pwlsYxjz1rJIJruRZc7gaTW1AL3g2ZNovcq7eW
	Gg0xGChFdLAK4iV8WPpN1snHtvGPGkRDFkQQBTzctC1NOJFfZogZIIXOal89nS/r92ur2GW+GOI
	vCIIPZ54cYeoShziBI0lMAamdZRfE8Rx+4p/r4heY13+qGtaDY5YeMndhupuCSAYoAt4
X-Received: by 2002:a17:907:6ea8:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c317bdfe7aamr131010766b.27.1791358085108; Wed, 07 Oct 2026
 00:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com>
In-Reply-To: <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 7 Oct 2026 15:27:54 +0800
X-Gm-Features: AclHuK9-vNcZxKo1OhLsfKqvuLHm0D_pklXBR5Ny7XJ7B7WuohnKFrZGwSHbsF8
Message-ID: <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Shawn Lin <shawn.lin@rock-chips.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=B8=89 08:53=E5=86=99=E9=81=93=EF=BC=9A
>
> =E5=9C=A8 2026/10/07 =E6=98=9F=E6=9C=9F=E4=B8=89 0:28, Coia Prant =E5=86=
=99=E9=81=93:
> > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> >
> > Add support for this selection by introducing the
> > "rockchip,sgmii-mac-sel" DT property.
> >
> >  From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > bit 1 (pipe_sgmii_mac_sel) is defined as:
> >
> >      0: SGMII routed to GMAC0
> >      1: SGMII routed to GMAC1
> >
> > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > the driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1.
> > If the property is absent, the driver leaves the routing unchanged,
> > so the effective value is whatever the bootloader or hardware reset
> > left.
> >
> > The driver validates the value and rejects anything other than 0 or 1.
> >
> > This is necessary for boards such as the Ariaboard Photonicat, which
> > uses the SGMII interface connected to GMAC0.
> >
> > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >   .../rockchip/phy-rockchip-naneng-combphy.c    | 42 ++++++++++++++++++=
+
> >   1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drive=
rs/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 7843356a4dd47..f76b48009673d 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > @@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
> >       struct combphy_reg pipe_xpcs_phy_ready;
> >       struct combphy_reg pipe_pcie1l0_sel;
> >       struct combphy_reg pipe_pcie1l1_sel;
> > +     struct combphy_reg pipe_sgmii_mac_sel;
> >       struct combphy_reg u3otg0_port_en;
> >       struct combphy_reg u3otg1_port_en;
> >   };
> > @@ -212,6 +213,8 @@ struct rockchip_combphy_priv {
> >       bool enable_ssc;
> >       bool ext_refclk;
> >       struct clk *refclk;
> > +     bool sgmii_mac_sel_present;
> > +     u32 sgmii_mac_sel;
> >   };
> >
> >   static void rockchip_combphy_updatel(struct rockchip_combphy_priv *pr=
iv,
> > @@ -341,6 +344,7 @@ static struct phy *rockchip_combphy_xlate(struct de=
vice *dev, const struct of_ph
> >   static int rockchip_combphy_parse_dt(struct device *dev, struct rockc=
hip_combphy_priv *priv)
> >   {
> >       int i;
> > +     int ret;
> >
> >       priv->num_clks =3D devm_clk_bulk_get_all(dev, &priv->clks);
> >       if (priv->num_clks < 1)
> > @@ -375,6 +379,16 @@ static int rockchip_combphy_parse_dt(struct device=
 *dev, struct rockchip_combphy
> >
> >       priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-r=
efclk");
> >
> > +     if (device_property_present(dev, "rockchip,sgmii-mac-sel")) {
> > +             ret =3D device_property_read_u32(dev, "rockchip,sgmii-mac=
-sel", &priv->sgmii_mac_sel);
> > +             if (ret) {
> > +                     dev_err(dev, "failed to read sgmii-mac-sel proper=
ty\n");
> > +                     return ret;
> > +             }
> > +
>
> device_property_read_u32() should return non-zero value if it's absent.
> How about this:
>
>         struct rockchip_combphy_priv {
>                 int sgmii_mac_sel;
>         }
>
> static int rockchip_combphy_parse_dt:
>         u32 val;
>
>          priv->sgmii_mac_sel =3D -1;
>          if (!device_property_read_u32(dev, "rockchip,sgmii-mac-sel",
> &val)) {
>                  if (val > 1)
>                          return dev_err_probe(dev, -EINVAL,
>                                               "invalid sgmii-mac-sel
> %u\n", val);
>                  priv->sgmii_mac_sel =3D val;
>          }
>
>
> static int rk3568_combphy_cfg:
>          case PHY_TYPE_SGMII:
>                  if (priv->sgmii_mac_sel >=3D 0)
>                          rockchip_combphy_param_write(priv->pipe_grf,
>
> &cfg->pipe_sgmii_mac_sel,
>
> priv->sgmii_mac_sel > 0);

Hi,

Thanks for the suggestion. I'd prefer to keep the current form, because
it keeps "missing" and "malformed" as two distinct cases.

Current logic:

if (device_property_present(dev, "rockchip,sgmii-mac-sel")) {
    ret =3D device_property_read_u32(dev, "rockchip,sgmii-mac-sel",
                &priv->sgmii_mac_sel);
    if (ret)
        return ret;
    priv->sgmii_mac_sel_present =3D true;
}

- device_property_present() checks whether the property exists.
- If it exists, device_property_read_u32() reads it. A non-integer value
  (e.g. a string) returns an error, which is propagated -- it is not
  silently treated as "absent".
- The range check is done later, in rk3568_combphy_cfg's SGMII case, so
  a bad value only fails when SGMII is actually used. That keeps non-SGMII
  users (PCIe, SATA) working, and leaves room for future SoCs that may
  support a different set of MACs.

With int + -1 as the "absent" sentinel, a DT value like 0xFFFFFFFF would
wrap to -1 and be mistaken for "absent", bypassing the range check. The
u32 + present flag avoids that ambiguity.

So I'd like to keep v13 as-is. Let me know if you still feel strongly
about it.

Thanks,
Coia
