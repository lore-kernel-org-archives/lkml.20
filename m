Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90546559CAB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880512; cv=pass; b=WNO608+1WJFFtKRVpBTzZhmd9jkRlLuv0rHtenS5Dn5SlFR9OI9i6ipy2XeeAlgwXjlIVTx8KuJgaZX86MQAtw4CVAnCnbILCMARabjRMxQKPp8cxWzCeAjayjt3GGWB64gTlRLjXDywOZt7YP1+8f+TFv+KR65e50UV6BbpycE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880512; c=relaxed/simple;
	bh=pBdJ57ON/qFDUsOE7VZli4VSyyMWeePsEoC07w8ygoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VFRrPxBHFWnWOnDv/rAjv0y7sjMD+8aRJ1AwGFg7S/Qb1mAz9cL9IR/SlveUS4uAb0FIDoLKdbVNfsFG/vPk9KYwsTLGaaMQOWQj7qwh7i4HSE95utxm34UoNPY1UySswP0DcdExmB1mUJ/u9/LG3jDdGYU+EaYCuuRUjBr0GGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5nSK6XS; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5nSK6XS"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so5403950a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788880499; cv=none;
        d=google.com; s=arc-20260327;
        b=I7elIxIzMG4FJPcllMXd03pQmCDiZHWs74qzXdZ2eY+3PSH4JVEmkamL5DWkRj6MLU
         b6lwhQleg4PyJBUKgLeQWsXF0hiOyx49bkEOpvjpN3gYEnD1v9UVlrEbsswMXHPSy06E
         PzsUlsJGm3+wPDvOkxRwcvLB0TMuXTwPyFRkbPwf3JeK81tUjg9JAKJLaYRjHAf8Rl4v
         gsUR0/It+aTzXTr2hYvha4oMDXAC1wETQvkKUvKvT/srd7asJYJA/YquzuZDk2lGLzRg
         XYSZvT5Ht5Sz8uyAldg3+n5dUh+hLog90QwMYBFfFT4XSWVDHPQRjLHDXOVSQ/j3QDen
         4kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CgYQMTATtyJWpk9CvcV0pYNidzQnxU/fkxOhjlNLIRE=;
        fh=3riLm3FWotPwUlO7HTf5GsFomWj5Sr8sdUiJCl9KjvI=;
        b=QZQYTDr7NPTlKsageQAEiI4K9IWValQlYZ0itI0cMXodmq7bIAfsPuGmN1qKLq+ES5
         SDCj5Cd6RaAJMAqP8aoLctiwdcwFxl6/JTfA6THfzkqCnjMF2zH08vAwKoFWaiqkVXQ1
         7vFyMUQ3vevjcsy7pt0XSdjYccg+r7mdi/UXbp3X4InzW2YV+UO/H0AdcbIPT6EFgoRj
         GS+t9e5cJGRmrXr8BTSafg5B8FIuItaWWyUubSlBUbeZSMH+LryzZhLIEHFnQgAMyrAW
         gMiECXpOWswWK1aqQUgY26tIPy96q614Bb07IMl/P5YUqYk6RL9QIrB1ta8S3EQYND5U
         JNfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880499; x=1789485299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgYQMTATtyJWpk9CvcV0pYNidzQnxU/fkxOhjlNLIRE=;
        b=I5nSK6XSvYkaRoyt+bE2w2/h9d3lkWwaZzEKtzcVTKHTTBQh1104S9Jfvn1K6UDFZK
         EzzXvV+BCrjybujV4RfHnvyAR/ZjOxqCGwg0cAECEZpWmrp6XLVQ3S+gm231fcTWAlAs
         YTwIr3z73UlID2JpyyU3XhzCfR7lyQ9G8FifYHvupEQQpQRhFzdq+7TPFy0Lhb6RzMg8
         CSEk1q9Z9v2IQZsn0yfVlBX+DGxsCgfPqg81RA9xd1oe8POp79YxUXx8tCFMLiIdk34b
         VHgs7Ab2ZfLxHXY7hTbJDklWaOs3ZG8vkfqSSpfTCPP+A6gtIxiF/OtoHGcSEEpBuFer
         M4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880499; x=1789485299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgYQMTATtyJWpk9CvcV0pYNidzQnxU/fkxOhjlNLIRE=;
        b=pNSvA6zDAENXfX7U+67+MgJYnar/PjNbY8f/vTF1QbEisLNfdNAP6Tna7F0YLfYymY
         SfPk8W3Pah0DtvYPSvurjwoNcjWxRhQ0vYwUAzC6Xj18z/K19qvRtqpifQxHD6fsTc5b
         TnnXQ0BXsaJRmyYv4R4kftYqurrDeFA4U6bajJAvwoBYilDNDWaNf3vp088IEsbAbUxM
         h87P/Lbe1cY8NRZ6gWmLDIBXQXHWSXVrI1dPgnTkcQNWcIin678FYgsZV1n+FHdPiJ3Z
         kdNbvdRAY2fGurU7LOYby7xPgmacJRSm2x9+s0FLnvbmByhJXgJZ7cKm8HTR9wbqyWW8
         W2GQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2x27QKwG2tMPI0Da4Z+sJPLJ/d8/lMIKbws+iGmE6ooA1WCBSKwldqe1B3xZe7qypzx676icog0tA3v8=@vger.kernel.org
X-Gm-Message-State: AFuF++lBWRv4YNYT1+RraM0sY7UbE22CChFe9Da67xCN8vF7wA38Edkr
	M4HyafA0Q06g5whJk3iJzTiqlLr5jcK/CrXMiNWu6H/OhzK9oY0t2M+vQ4AGljF756Ca6PfMjuT
	y0DWcV0Z7bCaR0OiORvTCNOlIha2pxg==
X-Gm-Gg: AYBFou0Exd7z+40UVeuHoRwKQyyQQXtT0sjtrKGm/MSDxdfcW4PXaELg4NQvl9HrNX4
	kVSWuTcgInzIXQZMzlc/mLXaTTql1Ey2PMsyxvDi63SndtWaro9nt4caCdXKG+2lnRE6hurr6r+
	u4Lc5Eou4Y+gKtMS5bU9xI1ysKyiuLIibkzgVGnndJJBA2T/Oy+XQYhuL0PlpMqFqWX9whRRpV7
	ih+UOBVmC42nx6Un0NrY3RbRQVyPyQ3N+MnsGvUcM+sQ1Ku+W76/JcdP2/ZqDy7hRGEQDxvvdYI
	lOLjCGJOOAM0TogrxITC8sJOJYLerrMxij7jS++g2gY=
X-Received: by 2002:a17:903:26cc:b0:2db:56da:6a0b with SMTP id
 d9443c01a7336-2db56da6ebbmr216182465ad.13.1788880499195; Tue, 08 Sep 2026
 08:14:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com> <178885625700.219967.7168072838761125406@kernel.org>
In-Reply-To: <178885625700.219967.7168072838761125406@kernel.org>
From: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Date: Tue, 8 Sep 2026 18:14:46 +0300
X-Gm-Features: AcwNN1XB_kJovrt7RM82lErwqtpd0arCb5Y1gSidn9sAEhYEVo0spZm52sfv7_Y
Message-ID: <CADDoYm6gVeXpEdQJNzqBfBXXGSqg7TTZeyyqka7nShE=Aw6Rcw@mail.gmail.com>
Subject: Re: [PATCH net v3] net: phy: mediatek-ge: disable EEE on the MT7530 PHY
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, daniel@makrotopia.org, 
	dqfext@gmail.com, SkyLake.Huang@mediatek.com, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com, 
	sean.wang@mediatek.com, olteanv@gmail.com, yangshiji66@outlook.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Both findings confirmed against current sources -- thank you, the
analysis is spot on.

v4 keeps the probe()-time advertisement clear, which also feeds an
empty advertisement back into genphy_c45_read_eee_adv() during
phy_probe(), and moves the durable disable to config_init(), the
dp83867 placement: config_init() runs after of_set_phy_eee_broken() in
phy_probe(), so the eee_disabled_modes fill is not undone, and it is
the callback phy_init_hw() replays after a PHY reset, so the register
clear is restored as well. The register is also written again there
for the reset path.

v4 follows as a fresh thread.
https://lore.kernel.org/netdev/20260908145213.3976508-1-vladislav.karmanov.=
dev@gmail.com/

Tested on the affected hardware (ASUS RT-AX53U, MT7621): single clean
100 Mbps WAN link + DHCP lease over a 2-pair cable, no flapping. The
ethtool re-enable path is not reachable on this board (phylink rejects
EEE ops at the MAC layer), so that part is verified at the code level
for standalone use of the PHY.

=D0=B2=D1=82, 8 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 11:30=
, <netdev-bot+sashiko@kernel.org>:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> - [High] mt7530_phy_probe() (drivers/net/phy/mediatek/mtk-ge.c:65-84)
>   calls phy_disable_eee() from the driver's .probe callback, but phylib=
=E2=80=A6
> - [Medium] The hardware write that clears the EEE advertisement,
>   phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0) at=E2=80=A6
>
> --
>
> net: phy: mediatek-ge: disable EEE on the MT7530 PHY
>
> This adds an mt7530_phy_probe() callback to the mediatek-ge driver which
> clears MDIO_AN_EEE_ADV in hardware and then calls phy_disable_eee(), with
> the stated goal that neither phylib nor userspace can re-enable EEE on th=
e
> MT7530 internal GE PHY.
>
> > diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediat=
ek/mtk-ge.c
> > index 73d9b72f9d9e2..35600c70cab90 100644
> > --- a/drivers/net/phy/mediatek/mtk-ge.c
> > +++ b/drivers/net/phy/mediatek/mtk-ge.c
> > @@ -62,6 +62,27 @@ static void mtk_gephy_config_init(struct phy_device =
*phydev)
> >                      FIELD_PREP(MTK_MCC_NEARECHO_OFFSET_MASK, 0x3));
> >  }
> >
> > +static int mt7530_phy_probe(struct phy_device *phydev)
> > +{
> > +     int ret;
> > +
> > +     /* The MT7530 internal GE PHY has broken EEE: with EEE advertised=
,
> > +      * some link partners fail to establish a stable link (on a 2-pai=
r
> > +      * cable, 1000BASE-T training fails and the port loops instead of
> > +      * falling back). MediaTek recommends disabling EEE on this PHY.
> > +      * Clear the EEE advertisement early and mark EEE disabled, so
> > +      * that neither phylib nor userspace can re-enable it.
> > +      */
> > +
> > +     ret =3D phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> > +     if (ret)
> > +             return ret;
>
> [Severity: Medium]
> Should this register write also live in mt7530_phy_config_init()?  This i=
s
> the only place where MDIO_AN_EEE_ADV is cleared in hardware, and ->probe =
is
> the one callback phylib never replays.  phy_init_hw() deasserts the reset
> line, optionally soft-resets, and then re-runs only ->config_init and
> ->config_intr:
>
> drivers/net/phy/phy_device.c:phy_init_hw() {
>         ...
>         if (phydev->drv->config_init) {
>                 ret =3D phydev->drv->config_init(phydev);
>                 if (ret < 0)
>                         return ret;
>         }
>         ...
> }
>
> mt7530_phy_config_init() does not touch MDIO_AN_EEE_ADV, so after a PHY
> register reset the register is back at its EEE-advertising hardware defau=
lt
> while phydev->advertising_eee stays empty and eee_cfg.eee_enabled stays
> false, i.e. software and hardware state disagree.
>
> Two paths that re-init without ->probe:
>
>   - phy_detach() asserts the PHY reset signal and a later
>     phy_attach_direct() -> phy_init_hw() only replays config_init.
>   - the SIOCSMIIREG BMCR_RESET case in phy_mii_ioctl():
>
> drivers/net/phy/phy.c:phy_mii_ioctl() {
>         ...
>                 if (prtad =3D=3D phydev->mdio.addr &&
>                     devad =3D=3D MII_BMCR &&
>                     val & BMCR_RESET)
>                         return phy_init_hw(phydev);
>         ...
> }
>
> which returns without any aneg reconfiguration, so nothing rewrites the
> advertisement to zero.  __genphy_config_aneg() ->
> genphy_c45_an_config_eee_aneg() covers the usual renegotiation case, but =
it
> returns early without writing when phydev->autoneg =3D=3D AUTONEG_DISABLE=
.  The
> equivalent in-tree quirk issues the disable from the replayed callback,
> dp83867_config_init() -> phy_disable_eee().
>
> > +
> > +     phy_disable_eee(phydev);
>
> [Severity: High]
> Does the phy_disable_eee() state survive the rest of phy_probe()?  The
> linkmode_fill(phydev->eee_disabled_modes) done inside phy_disable_eee() i=
s
> what makes the disable permanent, but phylib clears that set later in the
> same probe flow:
>
> drivers/net/phy/phy_device.c:phy_probe() {
>         ...
>         if (phydev->drv->probe) {
>                 err =3D phydev->drv->probe(phydev);
>         ...
>         /* Get the EEE modes we want to prohibit. */
>         of_set_phy_eee_broken(phydev);
>         ...
> }
>
> drivers/net/phy/phy-core.c:of_set_phy_eee_broken() {
>         struct device_node *node =3D phydev->mdio.dev.of_node;
>         unsigned long *modes =3D phydev->eee_disabled_modes;
>
>         if (!IS_ENABLED(CONFIG_OF_MDIO) || !node)
>                 return;
>
>         linkmode_zero(modes);
>         ...
> }
>
> So for any MT7530 PHY that has an of_node, eee_disabled_modes ends up emp=
ty
> again unless the DT carries eee-broken-* properties.  An of_node is prese=
nt
> in a documented configuration: mt7530_setup_mdio() registers the internal
> bus with the switch's "mdio" child node,
>
> drivers/net/dsa/mt7530.c:mt7530_setup_mdio() {
>         ...
>         mnp =3D of_get_child_by_name(np, "mdio");
>         ...
>         ret =3D devm_of_mdiobus_register(dev, bus, mnp);
>         ...
> }
>
> and mediatek,mt7530.yaml documents that node, so ethernet-phy children
> described there get an of_node.
>
> With eee_disabled_modes empty, can userspace re-enable EEE again through
> dsa_user_set_eee() -> phylink_ethtool_set_eee() -> phy_ethtool_set_eee() =
->
> genphy_c45_ethtool_set_eee()?
>
> drivers/net/phy/phy-c45.c:genphy_c45_ethtool_set_eee() {
>         ...
>                 } else if (linkmode_empty(phydev->advertising_eee)) {
>                         phy_advertise_eee_all(phydev);
>                 }
>         ...
> }
>
> That repopulates advertising_eee with supported_eee, then
> genphy_c45_an_config_eee_aneg() rewrites MDIO_AN_EEE_ADV and
> phy_restart_aneg() renegotiates, which looks like it brings back exactly =
the
> 1000BASE-T training loop described in the commit message.
>
> Would moving the disable into mt7530_phy_config_init(), which runs after
> of_set_phy_eee_broken(), address both this and the reset case above?  Tha=
t
> is the placement dp83867_config_init() uses for the same kind of quirk.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260904202800.3410838-1-vladislav.karmanov.dev%40gmail.com
