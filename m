Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8584F3CB548
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311975; cv=pass; b=KI2L2jbhaCZNdsJf+kIPEpVj2QZ/CO1MOkchHKCYTrJ/aGLj/tRRVgJZYjvNgBoxIZV1X5k42Wo3gHf94UrABzwN9z6PYBHKH+kIzAdB3vupeG0Zx1CsOc/Mqdf/3uo+WopfDyfszxC8dAzY50CtCMCSu70555UcH1Jvolm3QtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311975; c=relaxed/simple;
	bh=2RlNsuIIzo2boyH/LiGXPsxkr43jX708YTVIEODYsE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baB+77G+6iCy/6gL5fO6xekNrZKIV2wj1BdI/G+rQUYwH1UMMEXNmnjMTkATAUiemmAxifyEtrBdF0riqX1JFRF/hamGmxXDjMH7NBLoq+3/O8YAZ/jtMo6DO7vGEYGGv26emRhZICMB8BCiELafYbS89gceJxFHx/pDT0hyPAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+hFGbsr; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+hFGbsr"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c29440ee0e7so21050766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790311971; cv=none;
        d=google.com; s=arc-20260327;
        b=MIJmDY8ownwRfqA90sWOXSwDyQvb7S7027p32WfJdPXLEbZYBRtPK/gc/3P/vMC+5H
         Iuf73eLs1xDdPTkxcv4whMUw6pBgaPXEz8tOjAAHIuMfTKuZgWf/1hzFxKoqe/mudNrN
         vGkac5io6aLvzSezLfGqYg3aoZ2Jcs5mel3LBsmElTteiVajTfJKUL8+kzsTEw+HmmI9
         xLonoLLklkOQDZF0nooR1KrAWJhpKyx6iKrq34ktxCkQJ+OY5S4dCC+4RUSdWHARF6YY
         DA7peO/soO1JraD6O+c3XyL2EvKrFHK/+mETVOVIYBHthQP/wciEAAdjq/LB2CPShXce
         iGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YMLuV6/uZsUNZeXVfeQcmRIEgi8iWHmU4wnnVaPLUtw=;
        fh=S7sGMdEqGn3Dih68q9tqsj5cxGJjQeUkkwq+RKXstC8=;
        b=N8Sffu30QjZkKkWjoCWyKEqhS7UC/s0GUppVm6/EpjI+8R8//+BImOdja2H1nhNUCu
         VfEGXCQnguDf+nJYapvOM/moO7p0mpa1AKd987h1jHJdXXKnLnRiDoCvbYC/WlVL/LnS
         OR5nfGT8568xBcmlBqatNa3b2sBVmbSTp9rxHaj4nc9+9UPcCoxOfiEPiFAPMnYpLB/k
         LSOUFWl61pZptFqOZTsn/iunO48FzxDazXuG9ymUU3rIO7RlM+OI7+aKCYF6kWeHCKoI
         BwWDmXZcpUOhwwfUuOvozSlwRNGuIIfVLRnk7qJ/AYcF+HwOO9fnNEWpujJNWVd37qFo
         d71w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311971; x=1790916771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMLuV6/uZsUNZeXVfeQcmRIEgi8iWHmU4wnnVaPLUtw=;
        b=C+hFGbsrBH7m8keH9lXPdZ5+FclcqQByatUP6YnMsCxmNmxpzHI7ZLKHc7B6+8YwJ1
         idxgcvCkfhkzrLEDXd3X1WUz2CwqTMGZpQOeA4Sdlh/XAYfxmklBTHQt58SZVUpAZ4qd
         AHmq29DeqvLGcV2WwTYu6WOg2od+rVGtZcTTeRne+EyVN3hMgi4NZHNQ2wT+WmbHJYQc
         p3LQEYoys3gvEKHeDW9sr0zL7iugJrC+OKp7jYfF7vmS70exLznIHwEIXen8IrhOKNHB
         UxOZphZaJnGN1Cq2+qIG+sImzXWs0WWkW3vE4BsgQcsL1X/7uuz1mNSivyGBXBv/KHfT
         rAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311971; x=1790916771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMLuV6/uZsUNZeXVfeQcmRIEgi8iWHmU4wnnVaPLUtw=;
        b=f9iTQfHxCbTxmZsmw/OPrMGveXxwvLOaexD+UCSlaYkCMRnCevqYcsxG4tZqYZ/uzj
         9d1h+pil+/VtE04H00GprjE2UcIIPU5iGchNeWSqwFbWG6RKqxi1PHf2Xp1QWQs9HL74
         iNUwbQfa4x3NRCNhWMCP6dLYWXQolFdUSWG58tKtheVnxcTSuQTLBCm5sK5p+REZKFgo
         +VE2UAnKOT2lnar8hz13BGdjygCnbKHYovLpoiig3Dh7lMGkjNpgbgzr3jhyzrd0mg08
         KcrhHO/EegDgj2mTLo4mo+f+9Dunuih1LgUqzSDSjgvUNv3UJWUCAX2KNOyk8PTGsy6E
         HqUw==
X-Forwarded-Encrypted: i=1; AKwUvBw8w9iISlhN0V5ozsZU3H8vJPN2O0o/kORkYod2CPN4sXRYNdCfFTxJeHCU8+k8Pbp8eGaSkB1j4wqO3lE=@vger.kernel.org
X-Gm-Message-State: AFuF++l1V8eyTaeyQBFdwrWjIzVVsAEGYCvmnU8pg6HoN3AJ8FD4+SjA
	82AzhVK9ZUBTQbe74BZeknumMSoTpuD6CqkE0aSbzWrhraIosZ+vrWLygOqHvef2GCODWoaLSbL
	JQdAlGlAQtqsY7DYsAKHScAhyFOphDGE=
X-Gm-Gg: AYBFou3WlonRlGY+1pRErWCVG7g6NDdIWmmi/eFZogyQkWhX5xnbS1IDniRsahyhhqN
	cXW3mIKj01aPbcEGx3Vk2hUTwg2io6xVBUN0bE5AWzBjkwmmlF+RfTrcVzrYMrCCfUq2espa1Nj
	rRKYq6E0jikiaQY5LcgEl9UYDGkUAMO5hHp8FECxvEZvJ4zGTJAR3Kc3tbGO6WEMojfumYWxxnP
	KsZwl/8uEN1bvWnlnOALdDj1pNrAynKbbfBftM52s1H5avQW0Zcobel/NzLA3o6RHeeTg/Z0raQ
	z9ROpyTfLq7vr+5/0BFg7YfgqF3UP1CKg8SM2kAGLxDEkDU34ciBMqAmdDLDJF6KPyX91w==
X-Received: by 2002:a17:907:e155:b0:c2a:c799:d068 with SMTP id
 a640c23a62f3a-c2ac799d409mr238869566b.28.1790311970470; Thu, 24 Sep 2026
 21:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-8-coiaprant@gmail.com> <179030182389.2160803.3666914180615619528@kernel.org>
In-Reply-To: <179030182389.2160803.3666914180615619528@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 25 Sep 2026 12:52:38 +0800
X-Gm-Features: AclHuK_QSlVOHZL4rfbkJK77lciB5Q35Ewt_icBWLaH_ziPpWM-jpQQyPZjBPUs
Message-ID: <CALj3r0gFPLE3Prxvqd_2XzW8=j7tPZYioyfBXdXLTdLwYeGOyw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 07/11] net: pcs: xpcs: add Rockchip RK3568
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
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8825=E6=97=A5=
=E5=91=A8=E4=BA=94 10:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 3 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] In drivers/net/pcs/pcs-xpcs-rk.c, xpcs_rk_system_suspend()
>   relies solely on device_set_wakeup_path() to keep the PD_PIPE power=E2=
=80=A6
> - [Medium] xpcs_rk_mdio_write_remapping() (drivers/net/pcs/pcs-xpcs-
>   rk.c:137-150) forces writes of DW_VR_MII_AN_CTRL,=E2=80=A6
> - [Medium] xpcs_rk_create() (drivers/net/pcs/pcs-xpcs-rk.c:537-546)
>   dereferences the struct device_link * returned by device_link_add()=E2=
=80=A6
> - [Medium] Concern: xpcs_rk_create() validates the supplier with an
>   unlocked read of the driver-core-internal field=E2=80=A6
> - [Low] Concern: xpcs_rk_create() is EXPORT_SYMBOL_GPL'ed and published
>   in a new header include/linux/pcs/pcs-xpcs-rk.h with no in-tree caller=
=E2=80=A6
> - [Low] In xpcs_rk_create() (drivers/net/pcs/pcs-xpcs-rk.c:518-558) the
>   comment justifying the device_link handling misstates the API=E2=80=A6
>
> --
>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This adds a Rockchip RK3568 glue driver for the DesignWare XPCS that
> exposes the APB3-mapped CSRs through a virtual MDIO bus, splits the
> generic platform glue into its own PCS_XPCS_PLATFORM module, and adds
> power-management handling for the shared PD_PIPE power domain.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > new file mode 100644
> > index 0000000000000..35ee980a759e5
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> > @@ -0,0 +1,619 @@
>
> [ ... ]
>
> > +static int xpcs_rk_mdio_read_remapping(int addr, int dev, int reg)
> > +{
> > +     switch (dev) {
> > +     case MDIO_MMD_PMAPMD:
> > +             return ROCKCHIP_MMD_PMAPMD;
> > +     case MDIO_MMD_VEND2:
> > +             break;
> > +     default:
> > +             return -ENXIO;
> > +     }
> > +
> > +     /*
> > +      * Reads are redirected by hardware to the port's read-only mirro=
r;
> > +      * only writes have to be targeted at MII (see the write path).
> > +      */
> > +     switch (addr) {
> > +     case 0:
> > +             return ROCKCHIP_MMD_MII;
> > +     case 1:
> > +             return ROCKCHIP_MMD_MII1;
> > +     case 2:
> > +             return ROCKCHIP_MMD_MII2;
> > +     case 3:
> > +             return ROCKCHIP_MMD_MII3;
> > +     default:
> > +             return -ENODEV;
> > +     }
> > +}
> > +
> > +static int xpcs_rk_mdio_write_remapping(int addr, int dev, int reg)
> > +{
> > +     switch (dev) {
> > +     case MDIO_MMD_PMAPMD:
> > +             return ROCKCHIP_MMD_PMAPMD;
> > +     case MDIO_MMD_VEND2:
> > +             break;
> > +     default:
> > +             return -ENXIO;
> > +     }
> > +
> > +     /*
> > +      * These registers physically live only in MII (the management po=
rt).
> > +      * Ports 1-3 expose read-only mirrors of these bits, so writes mu=
st
> > +      * always target MII; the read path remaps per address and the
> > +      * hardware redirects to the port's mirror.
> > +      */
> > +     switch (reg) {
> > +     case DW_VR_MII_AN_CTRL:
> > +     case DW_VR_MII_AN_INTR_STS:
> > +     case DW_VR_MII_EEE_MCTRL0:
> > +     case DW_VR_MII_EEE_MCTRL1:
> > +     case DW_VR_MII_DIG_CTRL2:
> > +             return ROCKCHIP_MMD_MII;
> > +     default:
> > +             break;
> > +     }
>
> [Severity: Medium]
> Reads and writes of the same (addr, reg) pair resolve to different MMDs f=
or
> addresses 1..3.  xpcs_rk_mdio_write_remapping() sends AN_CTRL, AN_INTR_ST=
S,
> EEE_MCTRL0/1 and DIG_CTRL2 to ROCKCHIP_MMD_MII before the per-address swi=
tch
> is reached, while xpcs_rk_mdio_read_remapping() returns ROCKCHIP_MMD_MII1=
/2/3
> for those same registers.  Since xpcs_rk_addr_format() folds the MMD into=
 the
> APB CSR index, the two accesses land on different physical offsets.
>
> The unmodified core does read-modify-write on exactly these registers, e.=
g.
> in xpcs_config_aneg_c37_sgmii():
>
>         ret =3D xpcs_modify(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_CTRL, mask=
, val);
>         ...
>         ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
>
> and in xpcs_get_state_c37_sgmii():
>
>         an_intr =3D xpcs_read(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS=
);
>         if (an_intr & DW_VR_MII_AN_STS_C37_ANCMPLT_INTR) {
>                 an_intr &=3D ~DW_VR_MII_AN_STS_C37_ANCMPLT_INTR;
>                 xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, a=
n_intr);
>
> For port 1..3, is the value read from the port mirror then written back i=
nto
> port 0's register, and is the autoneg-complete latch that was observed a
> different one from the latch that gets acknowledged?
>
> Two related questions on the same mapping:
>
> AN_CTRL (PCS mode / TX_CONFIG) and the EEE registers become one shared
> instance for all four ports with no serialization, yet the commit message
> says ports 0..3 can be routed to GMAC0 or GMAC1 independently.  How is
> cross-port clobbering avoided when two MACs configure their PCS?
>
> DW_VR_MII_DIG_CTRL1, which holds VR_RST plus 2G5_EN/MAC_AUTO_SW and is
> modified by the core in xpcs_config_aneg_c37_sgmii() and
> xpcs_config_2500basex(), is not in the list and therefore goes to the
> per-port MMD.  Does that contradict the comment's claim that such vendor
> registers "physically live only in MII"?

For ports 1..3 the vendor registers are read-only mirrors of MII. The
hardware redirects reads to the port's mirror, so reading MII1's
AN_INTR_STS returns the same value as reading MII's, and writing MII
clears the shared instance. The read-modify-write sequence is
therefore equivalent across ports.

On the cross-port clobbering question: ports 0..3 can be routed to
different GMACs, but the vendor registers live in a single shared MII
instance by hardware design. The glue mirrors what the hardware does;
it doesn't add serialization beyond what the core already provides.

DW_VR_MII_DIG_CTRL1 goes to the per-port MMD because the Rockchip
hardware has a per-port copy of that register, unlike the shared
registers in the list. The comment in the write path is about the
specific registers that only exist in MII.

> > +     /*
> > +      * Establish the device link before reading the supplier's drvdat=
a.
> > +      * device_link_add() does not fail on a supplier that is unbindin=
g:
> > +      * it creates the link in DL_STATE_SUPPLIER_UNBIND. Whether the l=
ink
> > +      * actually protects the drvdata depends on the supplier's state =
at
> > +      * creation time.
> > +      *
> > +      * Check link->supplier->links.status right after creation. If th=
e
> > +      * supplier was DL_DEV_DRIVER_BOUND, the link is in
> > +      * DL_STATE_CONSUMER_PROBE and device_links_unbind_consumers() wi=
ll
> > +      * wait for this probe to finish before unbinding the supplier, s=
o
> > +      * the drvdata stays valid for the rest of the function. Any othe=
r
> > +      * state means the supplier is not usable yet; defer and retry.
> > +      *
> > +      * The link is released automatically when the consumer device is
> > +      * destroyed (DL_FLAG_AUTOREMOVE_CONSUMER), so no explicit
> > +      * device_link_remove() is needed on the failure paths.
> > +      */
>
> [Severity: Low]
> Two details in this comment in xpcs_rk_create() look inaccurate.
>
> include/linux/device.h describes the flag as:
>
>         /* Remove the link automatically on consumer driver unbind. */
>
> so is "released automatically when the consumer device is destroyed" the
> right wording?  The core drops such links from __device_links_no_driver()=
 on
> consumer probe failure or driver unbind, not at device destruction.

DL_FLAG_AUTOREMOVE_CONSUMER is dropped on consumer probe failure or
driver unbind. device_del() also purges the link via
device_links_purge(), so the comment isn't wrong, just incomplete.

> The claim that a DL_DEV_DRIVER_BOUND supplier implies DL_STATE_CONSUMER_P=
ROBE
> only holds while the consumer is DL_DEV_PROBING:
>
> drivers/base/core.c:device_link_init_status() {
>         case DL_DEV_DRIVER_BOUND:
>                 switch (consumer->links.status) {
>                 case DL_DEV_PROBING:
>                         link->status =3D DL_STATE_CONSUMER_PROBE;
>         ...
> }
>
> An already-bound consumer gets DL_STATE_ACTIVE and anything else gets
> DL_STATE_AVAILABLE.  Could the comment (or the kernel-doc of the exported
> helper) state that xpcs_rk_create() must be called from the consumer's pr=
obe?

This function is called only during the stmmac probe =E2=80=94 as indicated=
 by
subsequent dwmac-rk patches =E2=80=94 and has no other users.

> > +     link =3D device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONS=
UMER);
> > +     if (!link) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     if (READ_ONCE(link->supplier->links.status) !=3D DL_DEV_DRIVER_BO=
UND) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
>
> [Severity: Medium]
> Is it valid to dereference the pointer returned by device_link_add() here=
?
> DL_FLAG_STATELESS is not passed, so this is a managed link, and the
> kernel-doc above device_link_add() says:
>
>  * If that flag is not set, however, the caller of this function is handi=
ng the
>  * management of the link over to the driver core entirely and its return=
 value
>  * can only be used to check whether or not the link is present.
>
> No kref is taken for managed links (kref_get() only happens on the statel=
ess
> path), so the caller owns no reference on the link object, which the core=
 can
> free from device_link_drop_managed() -> kref_put(&link->kref,
> __device_link_del) or from device_del() -> device_links_purge().
>
> Since link->supplier is just &pdev->dev, and this function already holds =
a
> reference on pdev from of_find_device_by_node(), would reading
> pdev->dev.links.status instead give the same result without touching the
> link object?

Agreed in principle: for a managed link the return value is only good
for checking presence, and I hold a reference on pdev from
of_find_device_by_node(), so reading pdev->dev.links.status directly
would give the same value without touching the link object.

That said, this doesn't actually cause a problem today. The link is
created in DL_STATE_CONSUMER_PROBE and the supplier waits for this
probe to finish, so the link object cannot be freed while we're in
xpcs_rk_create(). The dereference is safe under the current caller.

I'll clean this up in a separate patch, together with the same pattern
in mtk-svs, so it's one change rather than two.

> > +     pxpcs =3D platform_get_drvdata(pdev);
> > +     if (!pxpcs || !pxpcs->bus) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);
> [Severity: Medium]
> This is a check on a driver-core-internal field (links.status) followed b=
y
> use of the supplier's devm-owned data (pxpcs->bus, pxpcs->eee_mult_fact) =
and
> registration of an MDIO device on that bus.
>
> For the in-tree caller the window does look closed: rk_pcs_init() runs fr=
om
> stmmac_pcs_setup() in __stmmac_dvr_probe(), so the consumer is DL_DEV_PRO=
BING
> and the new link is DL_STATE_CONSUMER_PROBE, which makes the supplier wai=
t:
>
> drivers/base/core.c:device_links_unbind_consumers() {
>         if (status =3D=3D DL_STATE_CONSUMER_PROBE) {
>                 device_links_write_unlock();
>
>                 wait_for_device_probe();
>                 goto start;
>         }
> }
>
> But xpcs_rk_create() is exported and does not document that precondition.
> For a caller outside the consumer's probe the link would be
> DL_STATE_AVAILABLE or DL_STATE_ACTIVE, nothing would wait for it, and the
> supplier's devres could be released while pxpcs->bus is in use.  Also not=
e
> that xpcs_rk_create_data() publishes drvdata before bus and eee_mult_fact
> exist:
>
>         pxpcs->pdev =3D pdev;
>
>         dev_set_drvdata(&pdev->dev, pxpcs);
>
> so the read here relies entirely on the supplier being fully bound.  Woul=
d
> it be preferable to document the probe-context requirement, or to avoid
> inspecting links.status from a driver altogether?

Same reasoning. For the in-tree caller the window is closed:
rk_pcs_init() runs from __stmmac_dvr_probe(), the consumer is
DL_DEV_PROBING, and the link is DL_STATE_CONSUMER_PROBE, so the
supplier waits.

> [Severity: Low]
> At this commit xpcs_rk_create() has no in-tree caller, and the new header
> include/linux/pcs/pcs-xpcs-rk.h declares it without a
> !CONFIG_PCS_XPCS_ROCKCHIP stub.  The caller does arrive later in the same
> series (rk_pcs_init() in drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> calls it and is installed as plat_dat->pcs_init for
> PHY_INTERFACE_MODE_SGMII), and DWMAC_ROCKCHIP does "select
> PCS_XPCS_ROCKCHIP", which forces the tristate to at least the selector's
> value, so there is no y/m link mismatch either.  Noting it only because t=
he
> symbol is unused at this point in the series.

The caller arrives in patch 9 of the same series and DWMAC_ROCKCHIP
selects PCS_XPCS_ROCKCHIP, so there's no y/m mismatch. Splitting the
export and header out would just create a forward declaration for one
patch.

> > +static int xpcs_rk_system_suspend(struct device *dev)
> > +{
> > +     /*
> > +      * Keep the PD_PIPE power domain on during system suspend.
> > +      *
> > +      * PD_PIPE is shared with SATA/PCIe and would be powered down by
> > +      * genpd once all its consumers are suspended, killing the SerDes
> > +      * and breaking MAC WoL.  Mark the XPCS as part of the wakeup pat=
h
> > +      * so genpd keeps the domain on.  Unconditional because the XPCS
> > +      * core has no callback to convey the MAC WoL state.
> > +      */
> > +     device_set_wakeup_path(dev);
> > +     return 0;
> > +}
> > +
> > +static int xpcs_rk_system_resume(struct device *dev)
> > +{
> > +     return 0;
> > +}
>
> [Severity: High]
> Does device_set_wakeup_path() actually keep PD_PIPE powered on RK3568?  T=
he
> commit message states:
>
>         genpd then leaves the domain powered, because the Rockchip power
>         domain driver sets GENPD_FLAG_ACTIVE_WAKEUP on PD_PIPE, which mak=
es
>         genpd check the wakeup path of its consumers during system suspen=
d.
>
> PD_PIPE is registered without active wakeup in
> drivers/pmdomain/rockchip/pm-domains.c:
>
>         [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(11)=
, false, false),
>
> The last argument is the wakeup flag, so pd_info->active_wakeup stays fal=
se
> and GENPD_FLAG_ACTIVE_WAKEUP is never set for this domain.  genpd only
> honours the consumer wakeup path when that flag is present:
>
> drivers/pmdomain/core.c:genpd_finish_suspend() {
>         if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
>             !device_out_band_wakeup(dev))
>                 return 0;
> }
>
> Without the flag, does genpd fall through to genpd_sync_power_off() and p=
ower
> PD_PIPE down, which is exactly the situation the probe comment warns abou=
t
> ("The domain must be powered on before any register access, otherwise the=
 SoC
> will trigger a synchronous external abort")?
>
> dev_pm_genpd_rpm_always_on() does not appear to cover the system-suspend =
path
> either; genpd_sync_power_off() only consults GENPD_FLAG_ALWAYS_ON:
>
> drivers/pmdomain/core.c:genpd_sync_power_off() {
>         if (!genpd_status_on(genpd) || genpd_is_always_on(genpd))
>                 return;
> }
>
> If the domain is power-cycled, what restores the hardware on the way back=
 up?
> phy_init() and phy_power_on() are called once from xpcs_rk_probe() via
> xpcs_rk_serdes_phy_poweron(), xpcs_rk_system_resume() returns 0 without
> re-initialising the SerDes or the PCS, and
> drivers/phy/rockchip/phy-rockchip-naneng-combphy.c has no dev_pm_ops at a=
ll.
> Does that leave the combphy and XPCS at power-on-reset defaults (no SerDe=
s
> configuration, no SerDes TX clock) after resume while the driver, the xpc=
s
> core and phylink still assume the programmed configuration is live, and M=
AC
> WoL, the stated reason for the mechanism, non-functional?

You're right. RK3568_PD_PIPE is registered with active_wakeup =3D false,
so GENPD_FLAG_ACTIVE_WAKEUP is not set and device_set_wakeup_path()
alone does not keep the domain on during system suspend. The commit
message and the comment in xpcs_rk_system_suspend() are wrong about
this.

The separate patch for the Rockchip PD driver to set active_wakeup on
PD_PIPE is here:

https://lore.kernel.org/all/20260925041751.495818-1-coiaprant@gmail.com/

It affects SATA and PCIe as well, which is why it isn't folded into
this PCS glue series. Once it lands, the device_set_wakeup_path() call
here becomes effective.

The runtime path is already covered by dev_pm_genpd_rpm_always_on();
only the system-suspend path was missing.

No respin planned for this series.

Coia
