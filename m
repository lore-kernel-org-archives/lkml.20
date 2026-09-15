Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67002493646
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471325; cv=pass; b=Aclj1CmdPfKVZVDA9S8Ut5KvGLsR86uNzERIXLHhIchsTtf2FoVvX9ktpg4qzMBh8yOJr+IK6AZhnDJ1YBEJ7+OO2NudD2nDZ8BVKvLtLVJMT9MrHflNnsvhgkPdqIxsGaKskJ4MZGtih8V4MIEapwE0L4PTgvl32KZsZ+yOI0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471325; c=relaxed/simple;
	bh=7IeKCihFwX9toaZ0cOF5/ll+Kqx7H0W8Cpr7TcnnDvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sW9/Xg7EECPKm6Lh12alsd7ToDRJ/vagTjbjc+n3jZy/Vqli+vPZvKNIFa0m9gKGJFmO5foFCyvvDiZwUg4mQ8+T9Jzaw7f40bd4K204HbYLCIMwRvoh3wVDT0CYIXziVLuTyYsIB/XaJ/Al53Qtr2mdWeYP2VaBKK5IpgFmf0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYFdV5nx; arc=pass smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYFdV5nx"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-c169ae1cb26so86452066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789471318; cv=none;
        d=google.com; s=arc-20260327;
        b=OSanYir2Ki3HsZlqofUCRZzpY5KQOTa5YesM09Ai2UmmbqvgcP3m/8YYh4RnUzNoRB
         XxWFuRvqm/uq9S8FxQQxeiKm5GJCRboWOFrUtjG4o/6eMqGWQKU0W0nF9JHHLvRdB6NZ
         H5O4T8m4nHhnz+4myWn4g2A7EVb3gsi2ivmBMZZrWBuiIpBJBYXkbWk16ZAmPwcer5ch
         AIyU9CKx1YOvijVQ/+b8MjnJpxf9BUCNWS8jg/yjZ6QF2GsFKW239DDn1Qnah/PzYq0C
         7FXriHo2CvGq8RS4xcq85oT8CRwOWecque2VKxfKtACmi9qHiFRQEgeE0EhtMnysyM41
         p/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pdGNp72dbM+gKLQ/Ct6w0QlgPa1CkJQFFgkxU4ZsWxk=;
        fh=BsT+6t8uc6oPh8/W2a+4/Cs++ZJVTmiBHDyWF1pBexY=;
        b=E3RNLKkpvs8uJtvFzDMJFTuwkxLpRBxXUh8lTHD4CO6VI/sc9pRnEW/8dP/2NfGUjh
         P+B2bqiS8GycbF888QPAXwnHjv1BMSSN7zpYqec/892WnKF67wgz+PLNsrBv3HdclM+C
         Ww5mvkfg9hJJR+kKXwkRSlBhkePSN5PHO1W+WXtycXbZNmTDInZO47WCt98o1yekV9b2
         KVe7535OjVUqvKpfgFWfUHtZvJv7T301odjjSdMbJTcQuFAJVC9DcVY3rTrsRKUPuD+P
         WMtXNOFIJvSQ/jl9vozf+vnriGUfrJ1wuFRFhQSsM457NleiFMr/l6aRvwIPjeD0B96t
         nREw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471318; x=1790076118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pdGNp72dbM+gKLQ/Ct6w0QlgPa1CkJQFFgkxU4ZsWxk=;
        b=iYFdV5nxcGf0MXlAK6MIdzuh41gdx6fBuYIPA9qp5JLCnhsKZELMU4oUoxiEsCXNeE
         dmUXg7wuC4avKUtRPoP4SkOo5kenP7HbHGwRuZNJb338WsDltx2ojrPju5FVR9gq+Q3O
         RZF/gQRQPyT/EE9rLcnUxKZPCIv5xHahF9Jf4entzH7tlyJvu8kZ3ghkwDQts2VLNWAT
         2npZMVuRDeOz+HJlDKS3PYTuySlA1ubblYkPFWGyNoHVrMEAgtrADQO6YGaC9pBEjxR2
         CP7NJvYTOz3RoUzYCo+275VAKDgcIADwxvKyBqX1uj9/JMR+cG5c3WZCf5O8YLgZ5TFv
         zu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471318; x=1790076118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdGNp72dbM+gKLQ/Ct6w0QlgPa1CkJQFFgkxU4ZsWxk=;
        b=1Yety7MA9EFb511JpROhTgaApe/dZ1GvMR6S/9jxfirlqOd4FD5wiw65OfSPd/b+Dp
         nz2EJ3P0rzOk+EIrSd/UnpwpLjZcorT+JB06A+MnN2EsOJMjOwKVgMzxUw3m1RLtKo7r
         ckGtQ3Fx1jsvdMSlL+/sLi2uV0QE+gpmCCa+o+GefMoLrjM6cBo9mtEBjGzB6Pbz+n27
         1P3UIaR5sF7tzSj7arW+Ujzm8sKRVKfk/oetVkUVAOqoIG5oXep0pv3jNfO+jlvaeWJh
         aHws54twuPsYFS0j5rPX7KsslT68/9+G80tTgZ1WETnusWEbi6k9CWovGkrg4+pabD/E
         pAUA==
X-Forwarded-Encrypted: i=1; AKwUvByTC7U1fBp7WlRB4lep3ctSJnj+xmgLfrtSzplDIuhXbdAHiD/BodfxJDEZn1/xn+uDTVp8zs7O73vSnIk=@vger.kernel.org
X-Gm-Message-State: AFuF++n/J7GDVQFiMo8VyF2LZOwgu1Ehwa+CoL3VvTd5WwunRFmpRo7i
	cx5PVbPIT+Irk5iyW8FPLGywUkk/I1ZzGSJjgp2OhSo/RLP7uFMCc+fHVb/CG5OglA2MZ07+URY
	qWaeV82F80Qk7MOD5mx8Pnhiwz0gQ3Pw=
X-Gm-Gg: AYBFou3/EHOGjnwvs5yfnIUYyFpXxzJjzUIeBvNSZspnXS6p4biMdgwaiILE5E5QXKE
	sAjJHzlSQEaXAmxfx+MscVHschdXiF96zhXLqtoX9U3GCo6k+dpgNLuynD8PqIyWmNJZ7QnipD0
	R6CT5be+6Bzjv+ILYXfNJHqHWzF8ojx7skqM8HZMPKw+EotUalNbQh+z1yol78EeyRbTH5lS5Zq
	cHxz/4eFKwNiQAQxOBKYqIfwGhL+wNrXbDjbVgbwUdaaDzbFA32NpWKCUwa8w44NEdi7EHinU1T
	lzyA3r6R6/yVYjM0f0TwI1essPgS7T9XaxVQKfwmJM8B5zoRm5gH0caYoA==
X-Received: by 2002:a17:907:3fa0:b0:c1c:4c72:e6df with SMTP id
 a640c23a62f3a-c29c85ac70amr237889766b.0.1789471318328; Tue, 15 Sep 2026
 04:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913185849.907479-8-coiaprant@gmail.com> <178941748759.22033.1861925605437398903@kernel.org>
In-Reply-To: <178941748759.22033.1861925605437398903@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 19:21:46 +0800
X-Gm-Features: AcwNN1WnaaSrttoZlhP6aYkwPAdiDzhJi8AhYAyuZb9mOKnk6eoTSOOLMaHeYwY
Message-ID: <CALj3r0gm5nKVj3s11q=qpnpu+65DQt2-VmGq7mfQr9-e5054Yg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
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
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 3 =C2=B7 Low: 2
>
> - [High] Incorrect MMD write remapping for MII vendor registers breaks
>   configuration for ports 1, 2, and 3.
> - [Medium] The patch silently re-packages the pre-existing generic
>   Synopsys XPCS platform driver.
> - [Medium] xpcs_rk_init_clk() (drivers/net/pcs/pcs-xpcs-rk.c:361-362)
>   computes `pxpcs->eee_mult_fact =3D DIV_ROUND_CLOSEST(100 *=E2=80=A6
> - [Medium] Acquiring `device_lock()` of another device from within a
>   probe path causes a lockdep warning (recursive locking).
> - [Low] Concern that the newly exported xpcs_rk_create()
>   (include/linux/pcs/pcs-xpcs-rk.h) has no in-tree caller and no Kconfig=
=E2=80=A6
> - [Low] The rockchip,rk3568-xpcs binding lists `phys` and `phy-names` in
>   its `required:` list=E2=80=A6
>
> --
>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> Adds a platform glue driver for the DesignWare XPCS block found on RK3568=
,
> exposing the APB3-mapped XPCS registers as a virtual MDIO bus with per-po=
rt
> MMD remapping so the generic pcs-xpcs core can create a phylink_pcs.  Als=
o
> adds new Kconfig symbols for the generic and Rockchip XPCS glue and an
> exported xpcs_rk_create() helper for MAC drivers.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> > diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> > index e417fd66f660a..080538f193d59 100644
> > --- a/drivers/net/pcs/Kconfig
> > +++ b/drivers/net/pcs/Kconfig
> > @@ -12,6 +12,31 @@ config PCS_XPCS
> >         This module provides a driver and helper functions for Synopsys
> >         DesignWare XPCS controllers.
> >
> > +if PCS_XPCS
> > +
> > +config PCS_XPCS_PLATFORM
> > +     tristate "Generic XPCS controller support"
> > +     default PCS_XPCS
> > +     help
> > +       Generic DWXPCS driver for platforms that don't require any
> > +       platform specific code to function or is using platform
> > +       data for setup.
> > +
> > +       If you have a controller with this interface, say Y or M here.
> > +
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
> > +     depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> > +     depends on GENERIC_PHY || COMPILE_TEST
> > +     depends on PM_GENERIC_DOMAINS || COMPILE_TEST
> > +     help
> > +       Support for XPCS controller on Rockchip RK356x SoC.
> > +
> > +       If you have a Rockchip SoC with this interface, say Y or M here=
.
> > +
> > +endif # PCS_XPCS
> > +
> >  config PCS_LYNX
> >       tristate
> >       help
> > diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> > index 4f7920618b900..f9f6cf2578d72 100644
> > --- a/drivers/net/pcs/Makefile
> > +++ b/drivers/net/pcs/Makefile
> > @@ -1,10 +1,11 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  # Makefile for Linux PCS drivers
> >
> > -pcs_xpcs-$(CONFIG_PCS_XPCS)  :=3D pcs-xpcs.o pcs-xpcs-plat.o \
> > -                                pcs-xpcs-nxp.o pcs-xpcs-wx.o
> > +pcs_xpcs-$(CONFIG_PCS_XPCS)  :=3D pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-w=
x.o
> >
> >  obj-$(CONFIG_PCS_XPCS)               +=3D pcs_xpcs.o
> > +obj-$(CONFIG_PCS_XPCS_PLATFORM) +=3D pcs-xpcs-plat.o
> > +obj-$(CONFIG_PCS_XPCS_ROCKCHIP) +=3D pcs-xpcs-rk.o
>
> [Severity: Medium]
> Should this repackaging of the pre-existing generic platform glue be a
> separate patch, or at least be described in the commit message?
>
> pcs-xpcs-plat.o is moved out of the pcs_xpcs composite object and built a=
s
> its own module, and the new PCS_XPCS_PLATFORM tristate makes the snps,dw-=
xpcs
> platform glue user-selectable where it was previously unconditional under
> PCS_XPCS.  So the snps,dw-xpcs platform driver ships in pcs-xpcs-plat.ko
> instead of pcs_xpcs.ko after this patch.
>
> The commit message only describes adding the Rockchip glue driver and doe=
s
> not mention this change to existing functionality.  Could the Makefile an=
d
> Kconfig refactor be split out with its own rationale?

We have added a default value for existing users when selecting PCS_XPCS.

> > +static int xpcs_rk_serdes_phy_init(struct dw_xpcs_rk *pxpcs)
> > +{
> > +     struct device *dev =3D &pxpcs->pdev->dev;
> > +
> > +     pxpcs->serdes_phy =3D devm_phy_get(dev, "serdes");
> > +     if (IS_ERR(pxpcs->serdes_phy))
> > +             return dev_err_probe(dev, PTR_ERR(pxpcs->serdes_phy),
> > +                                     "Failed to get SerDes PHY\n");
> > +
> > +     return 0;
> > +}
>
> [Severity: Low]
> xpcs_rk_serdes_phy_init() treats the "serdes" phy as mandatory and fails
> probe when it cannot be resolved, and the binding added later in this ser=
ies
> (Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml) lis=
ts
> phys and phy-names under required:
>
>   required:
>     - compatible
>     - reg
>     ...
>     - phys
>     - phy-names
>     - power-domains
>
> The SoC node added in arch/arm64/boot/dts/rockchip/rk3568.dtsi only has:
>
>         xpcs: ethernet-pcs@fda00000 {
>                 compatible =3D "rockchip,rk3568-xpcs";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>                 reg =3D <0x0 0xfda00000 0x0 0x200000>;
>                 clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
>                 clock-names =3D "csr", "eee";
>                 power-domains =3D <&power RK3568_PD_PIPE>;
>                 status =3D "disabled";
>
> CHECK_DTBS validates nodes regardless of status, so does every RK3568 DTB
> now report missing phys/phy-names for this node?  Only
> rk3568-photonicat.dts adds them, so a board that just flips this node to
> status =3D "okay" would also fail probe with "Failed to get SerDes PHY".
>
> Should the SoC node carry phys/phy-names, or should the binding not mark
> them required at the SoC level?

As replied earlier, the SerDes connection is board-specific (some
boards use combphy1, others combphy2), so phys/phy-names cannot move
into the SoC dtsi. dtbs_check skips required-property validation for
status =3D "disabled" nodes, so boards that don't enable XPCS produce no
warnings.

> > +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> > +{
> [ ... ]
> > +     /*
> > +      * Compute the multiplier for the EEE clock so that
> > +      * clk_eee_period * (mult_fact + 1) falls within 80..120 ns.
> > +      *
> > +      * On RK3568, clk_xpcs_eee is muxed between gpll200 (200 MHz, 5 n=
s)
> > +      * and cpll125 (125 MHz, 8 ns), selected by CRU_CLKSEL_CON29 bit =
13.
> > +      * The reset value is 0 (200 MHz), but derive the value at runtim=
e to
> > +      * stay correct if the mux is changed by a board.
> > +      */
> > +     pxpcs->eee_mult_fact =3D DIV_ROUND_CLOSEST(100 * clk_get_rate(pxp=
cs->eee_clk),
> > +                                              1000000000UL) - 1;
>
> [Severity: Medium]
> Can this value overflow the 4-bit register field it ends up in?
>
> For the reset configuration named in the comment (200 MHz, 5 ns) this
> computes 100 * 200000000 / 1000000000 - 1 =3D 19.  That is passed on
> unchecked:
>
>         xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
>
> and the core programs it in xpcs_config_eee():
>
>         drivers/net/pcs/pcs-xpcs.c:
>                       FIELD_PREP(DW_VR_MII_EEE_MULT_FACT_100NS,
>                                  xpcs->eee_mult_fact);
>
> with
>
>         drivers/net/pcs/pcs-xpcs.h:
>         #define DW_VR_MII_EEE_MULT_FACT_100NS           GENMASK(11, 8)
>
> FIELD_PREP on a runtime value does no range check, so 19 (0x13) becomes 3=
.
> The hardware is then told the 100 ns reference is 4 EEE clock periods
> (20 ns) rather than the 80..120 ns the comment and the kernel-doc of
> xpcs_config_eee_mult_fact() require, which affects all derived LPI timers
> once EEE is enabled.  Since the field caps the count at 16 periods, is 15
> the only representable value for a 5 ns clock, and should this be clamped=
?
>
> Two more things about the same expression:
>
> - 100 * clk_get_rate() is evaluated in unsigned long, so on 32-bit builds
>   100 * 200000000 wraps to 2820130816 and yields mult_fact 2.  Would
>   mul_u64_u32_div() or a u64 intermediate be better here?
>
> - If clk_get_rate() returns 0, 0 - 1 stored in a u8 becomes 255, giving
>   field value 15.  Is a zero rate worth rejecting?

You're right, and this is a real bug. Two problems:

1. 100 * clk_get_rate() overflows unsigned long on 32-bit builds.
2. DW_VR_MII_EEE_MULT_FACT_100NS is a 4-bit field (GENMASK(11, 8)),
   so the value is capped at 15. For 200 MHz the formula yields 19,
   which FIELD_PREP truncates to 3.

It will be fixed in the next version.

> > +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node =
*np)
> > +{
> > +     struct platform_device *pdev;
> > +     struct device_node *pcs_np;
> > +     struct dw_xpcs_rk *pxpcs;
> > +     struct dw_xpcs *xpcs;
> > +     u32 port;
> > +
> > +     if (!of_device_is_available(np))
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     if (of_property_read_u32(np, "reg", &port))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     if (!xpcs_rk_mdio_addr_validate((int)port))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     /* The XPCS pdev is attached to the parent node */
> > +     pcs_np =3D of_get_parent(np);
> > +     if (!pcs_np)
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     if (!of_device_is_available(pcs_np)) {
> > +             of_node_put(pcs_np);
> > +             return ERR_PTR(-ENODEV);
> > +     }
> > +
> > +     if (!of_match_node(xpcs_rk_of_ids, pcs_np)) {
> > +             of_node_put(pcs_np);
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> > +     pdev =3D of_find_device_by_node(pcs_np);
> > +     of_node_put(pcs_np);
> > +     if (!pdev)
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +
> > +     device_lock(&pdev->dev);
>
> [Severity: Medium]
> xpcs_rk_create() is called from a MAC driver's probe path, which is
> already running under device_lock() of the MAC device taken by
> really_probe().  Taking device_lock(&pdev->dev) here nests a second
> struct device mutex, and since all device mutexes share one lockdep
> class unless annotated, lockdep will report "possible recursive
> locking detected" on the first probe.  That is a splat in the logs on
> any CONFIG_PROVE_LOCKING build, and a panic with panic_on_warn set.
>
> Holding the XPCS device's lock across xpcs_create_mdiodev() and
> device_link_add() is also unusual - device_link_add() does its own
> locking and the driver core normally expects supplier device locks not
> to be held by consumers.
>
> What race is the lock actually protecting against?  pxpcs and
> pxpcs->bus are published by xpcs_rk_probe() via dev_set_drvdata() and
> xpcs_rk_init_bus(), and the !pxpcs || !pxpcs->bus case already returns
> -EPROBE_DEFER, so the consumer retries later; the device link then
> keeps the supplier around.  Can the device_lock()/device_unlock() pairs
> simply be dropped, or is something else needed here (e.g. checking that
> the supplier is bound) to close the window you had in mind?

Agreed. I'll drop device_lock() and establish the device link first,
then read platform_get_drvdata(). DL_FLAG_MANAGED keeps the supplier
bound while the consumer is, so no extra locking is needed. Failure
paths will call device_link_remove() explicitly, since
DL_FLAG_AUTOREMOVE_CONSUMER only removes the link when the consumer
device is released.

> [Severity: High]
> This block in xpcs_rk_mdio_write_remapping() ignores addr entirely:
> any write to DW_VR_MII_AN_CTRL, DW_VR_MII_AN_INTR_STS,
> DW_VR_MII_EEE_MCTRL0, DW_VR_MII_EEE_MCTRL1 or DW_VR_MII_DIG_CTRL2 is
> routed to ROCKCHIP_MMD_MII, which per the commit message is port 0's
> MMD (7), regardless of which of the four ports the MDIO address
> selects.
>
> So when the core configures a PCS instance created with addr 1, 2 or 3
> - xpcs_config_aneg_c37_sgmii() writing DW_VR_MII_AN_CTRL and
> DW_VR_MII_DIG_CTRL2, xpcs_config_eee() writing DW_VR_MII_EEE_MCTRL0/1,
> and the interrupt-status clear on DW_VR_MII_AN_INTR_STS - the write
> lands on port 0 instead.  That has two effects: the intended port is
> never configured (so its link stays broken), and port 0's
> auto-negotiation/EEE state is silently clobbered by an unrelated
> interface, including its pending AN interrupt status.
>
> The read path is not symmetric either: xpcs_rk_mdio_read_remapping()
> remaps per addr with the comment "read remapping to MII is performed by
> HW", so a write to these registers on port 2 followed by a read back
> would not return what was written.  Is that asymmetry deliberate?
>
> Does the TRM say these vendor registers physically exist only in MMD 7
> and are shared by all four MII ports?  If so, redirecting writes
> silently still leaves per-port configuration impossible, and the driver
> probably needs to say so explicitly (reject the access, or document how
> the shared block is meant to be programmed) rather than aliasing ports
> 1..3 onto port 0.  If instead each port has its own copy of these
> registers, this switch should be dropped so the addr-based mapping
> below applies.  Which is it?

ROCKCHIP_MMD_MII is a management port. The AN_CTRL / AN_INTR_STS /
EEE_MCTRL0/1 / DIG_CTRL2 bits are read-only mirrors on ports 1-3, so
writes can only land in MMD 7. The read path is redirected by hardware
to the port's mirror, which is why the write path is asymmetric.

On RK3568 there is only one SGMII link, so only one port is active at
a time and the aliasing is harmless. QSGMII is not supported by this
driver.
