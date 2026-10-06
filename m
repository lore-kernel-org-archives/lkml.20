Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609FF46D2C3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304230; cv=pass; b=OMffVl1Qn8G1PZMhJSL6XjAKwStaQRaMDHtn9P99e2OPDWkXw4e6fZYWN6h6O16SM4w5qLpCb6ls/49rmpK8rmeV4rzz2hW6ZW5bxLz11NKHQC3Rdb/gsTpqfMRXu2baGjjRH36iOyA/IHPDqNygyIK+ZBI5+B4ArKSwY91NhgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304230; c=relaxed/simple;
	bh=FwoK1KY3nD1Qu6AMa5OA8mtSIBjWgPFlqGjW58spQ+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSFa+j4RyC2kO+38vQJT8TWaaHuQLKIbc91bNtU0yKCLPDHdD5L+d7Vhg1Gn7dKbJ75+2MKNIwx985CxBx02Q9nfLPntgIbUy32hfWaHQgpd9yj+Tz0If+k2oWJobZ7w/IrWuqnTpbFS91GnhHThM4wRl4oovbR7J3fY0Uyx5d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKCq4E3Q; arc=pass smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKCq4E3Q"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c2e25574351so193780166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791304227; cv=none;
        d=google.com; s=arc-20260327;
        b=q91uy1hi/dh0+xd4OdD6ayQTu3CxQ3R3vLnvCNH2w9oFwG/3sZQklsqIU0gAVCYDjc
         6RHruYSYxDPDJiI7NqYq/hoaoPnpUsLLPVhO1ORBpWrrP1TuDUmZFFSjGGzpw0coLNfg
         pfs8l7e7YS3OYYFbi3jYYhvBDbYgwe+gN4Oh+n3UhfZkVy8he4w1C+RAZaxQxUb/hgRX
         nL/NKmgKkaRa3ZI0CFNp5/8mJziECd3fQFdbMXLGUjZ6W3D3E3Fo95bBd04mqPRwwCQk
         4CPvqQjHB0poFFd6qp4Tj8g4ZW9EDXjo5KOQdZYDieXrvmC+sfjwkbf6b1Tvb/1GO12d
         d0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=;
        fh=oCMKs6WCFywUgB8zbahXaEimgGYF1nPZ6RBJmgP9WFU=;
        b=C2f9l9vtKLdRqvq519yaiL3QqgWmhaAg/IY2/ZfErUSpD2imv9PPYTnjGXTDTuTec6
         Z9sOJJY1S1u8m4VFZuBK5pv5Mw20l0cpf6CPIy6mwVx5jAsmlqdf7bAa3dTQfCshDtSr
         H24sWISYnttb91Lnvk7+iBky0HfL2co+RulMQS98rWC7ZgNnUaHBuNM4dGz5KzQYZvkj
         lNf9vOUMzIy7bV8EToWRLATVkMovhc/XkJ/hUiq1ZP6Q9PMc1b7HA6Ebnu9eTP+uqqsT
         CbpFNYAQ4DWhSrlEK51Mq0B0MnKZKmu9DiTG9MCQSNafLyrf+JG1XVkOrjVC8rM/8i6C
         ViPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304226; x=1791909026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=;
        b=IKCq4E3QWdx0TRQTi+Sfz5fbF2CgtixEmRfCL45zpD7ZNIUZCkWCQEXUHlIFG3Jtvh
         q2nk6wAaFWXwP5+Xs+qNNXOXVWkBxnC5E0MOnkjFDIJ9uv2yxQFQJerfvcXkZYZY/exa
         lT7P6RDrCNFPlz/bgn4sWTqHoYZCl6TuEn6fA4Vujp3Pipn1UdzoHQpFrd+DmBbz9wuQ
         E0/Qar4NJQqvOupomBT2yCGiCJPCxnoVUesbL7OP+0z2yYzezY/fx5iwBtlZ6fZoUfKu
         /iKp2fkl5BIBPQUyfAn/tO4r3bqaMGtk6owdlYDF9k3Br5fqVWtXtyU92UTBlpmPbCHd
         Expw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304226; x=1791909026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74ooKafJysXOQ8/oYCK0iAifCQLvUBwaTgwQCS1kaLE=;
        b=PHnig5BRl9hgFqJ5B6dOeh7HfW8eIYdUC0pYSqJHTAJpvNzMkzGv8/Zg0tAjD2JpjJ
         SZQmwW656YKzrumIHdtUsOrBChVXeLXpCtqVVTVfazXZbOydqczB2LGrIEa0aTe3WtW1
         eTNMhN7pYJHvSikX1DNNkNxf9wsDKwT0Rv+GyqEiFkMoQlUsObmNrZkoDtQKhU/D8soh
         tks50PUN796MHwvkcM2IAQX5iLqh+vopfShnYvl+QtLK1pUiXREG57oJuXgrwNkxK7da
         k+bYqONvwKqWEQjVknBdykU/u0+QgF9z7FrMXiFB2onfd1ex7OHSorCxTze/4jkXTVSl
         /weA==
X-Forwarded-Encrypted: i=1; AKwUvBwI7GJhOMqu/FXxT8yQOo44kM4FNJX+r3eb849z7c4CBR4oWLA8AGx5bOEePCOOqtyUCYynDNwANc2PfjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++loUd1qmrm/noXdV760vHGejGUaTBhOT/1/yX+qSYzo+lYdsOWG
	quwpeWTkrOuhIa3zT8PlsE26oWkGUP0FwlF1Xf3vSzPqxRcIGKDCrYy6O1X6+/YGUJyyDV84dLp
	rymj+9ac5VjgiEQpzr1FGC9QAv3PjUsw=
X-Gm-Gg: AYBFou1P5nSQ/hQicrZcJ7mRlVS0IzBmI8qAlfFbyisRNngv8FZ/zFhrsaq+WRngajL
	bNE0m+1/+BJ2sYLB6Sr22i0+P022uu//kjSOpISQDKH11bK0BLR552IMIYOxrg9wkw/jYfBoVYh
	Wh5MAQmn7NpqFry2fl/OTs+TFYRZpOK6cwuukDFIxmEoNI4MzD+9Mqo+t6wpXwfSsXl8oHbDBEM
	rX9zjhxlVTXRGTqH5cW5j4aADf7N1Y1OCYWhvt1kj5eVpmaJHKjpWsT99K/Z96YCVlflI0gWUm7
	/1m8XF1ywTbs0z2I6gdWO7lZbDN+gRiXyEpx4TxFbFqODIRg+wKEWK/J5Q==
X-Received: by 2002:a17:907:944d:b0:c2a:fd39:f231 with SMTP id
 a640c23a62f3a-c2e6ed68303mr1020357266b.26.1791304226334; Tue, 06 Oct 2026
 09:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006074749.2010233-1-coiaprant@gmail.com> <20261006074749.2010233-3-coiaprant@gmail.com>
 <08736f4d-a728-4b1e-a28e-882648a412e0@rock-chips.com> <20261006161403.GA2469169-robh@kernel.org>
In-Reply-To: <20261006161403.GA2469169-robh@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 7 Oct 2026 00:30:14 +0800
X-Gm-Features: AclHuK_1XvsTomk5pZfZ6KjwFLcu1GrCsrDj9BN4LAny9Xe_1QYEOW_C3FucYAs
Message-ID: <CALj3r0haEf-oGo3QW5XVaz_F=oTNX14PFs31Owkq+79Vb8qjVQ@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=887=E6=97=A5=
=E5=91=A8=E4=B8=89 00:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Oct 06, 2026 at 10:53:22PM +0800, Shawn Lin wrote:
> > Hi Coia
> >
> > =E5=9C=A8 2026/10/06 =E6=98=9F=E6=9C=9F=E4=BA=8C 15:47, Coia Prant =E5=
=86=99=E9=81=93:
> > > On RK3568, the SGMII interface can be routed to either GMAC0 or
> > > GMAC1 via the GRF register pipe_sgmii_mac_sel.
> > >
> > > Add support for this selection by introducing
> > > the "rockchip,sgmii-mac-sel" DT property.
> > >
> > >  From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> > > bit 1 (pipe_sgmii_mac_sel) is defined as:
> > >
> > >      0: SGMII routed to GMAC0
> > >      1: SGMII routed to GMAC1
> > >
> > > The hardware reset value is 1 (GMAC1). If the property is set to 0,
> > > the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
> > > remains at GMAC1.
> > >
> >
> > Thanks for your patch. I have a question below, please have a look.
> >
> > > This is necessary for boards such as the Ariaboard Photonicat, which
> > > uses the SGMII interface connected to GMAC0.
> > >
> > > Out-of-range values are rejected by dtschema, so the driver does not
> > > duplicate the range check.
> > >
> > > Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%=
20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> > > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > > ---
> > >   drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/dri=
vers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > index 7843356a4dd47..7b867e7520064 100644
> > > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > > @@ -186,6 +186,7 @@ struct rockchip_combphy_grfcfg {
> > >     struct combphy_reg pipe_xpcs_phy_ready;
> > >     struct combphy_reg pipe_pcie1l0_sel;
> > >     struct combphy_reg pipe_pcie1l1_sel;
> > > +   struct combphy_reg pipe_sgmii_mac_sel;
> > >     struct combphy_reg u3otg0_port_en;
> > >     struct combphy_reg u3otg1_port_en;
> > >   };
> > > @@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
> > >     bool enable_ssc;
> > >     bool ext_refclk;
> > >     struct clk *refclk;
> > > +   u32 sgmii_mac_sel;
> > >   };
> > >   static void rockchip_combphy_updatel(struct rockchip_combphy_priv *=
priv,
> > > @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct devic=
e *dev, struct rockchip_combphy
> > >     priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-r=
efclk");
> > > +   priv->sgmii_mac_sel =3D 1;
> >
> > Before this patch, SGMMI was routed to GMACX depends on bootloader(if
> > setting), or routed to GMAC1 by chip default. Without knowing any
> > potential candidates setting it via bootloader, you might not force any
> > DTS files without "rockchip,sgmii-mac-sel" to pick GMAC1 as fallback.
> >
> > Maybe you could just keep the SGMII route as-it if the property is not
> > present. Meanwhile, should validate rockchip,sgmii-mac-sel is a valid
> > value passing from DT.
>
> That is the typical way tri-state properties work (as opposed to using a
> boolean). In that case, no 'default' in the schema would then be
> appropriate.
>
> Rob

Hi Shawn, Rob,

Thanks for the review and feedback. I've just posted v13, which addresses
both points:

- The driver no longer forces GMAC1 when the property is absent; it
  leaves the routing as-is.
- The driver validates the value and rejects anything other than 0 or 1.
- The binding drops 'default', since the property is tri-state.

I'll avoid replying to each comment individually to keep the thread
clean, but please let me know if anything is still off.

Thanks,
Coia
