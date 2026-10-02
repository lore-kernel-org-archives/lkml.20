Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6176E4DA553
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961467; cv=pass; b=FnlOcUHbdj3A/2qtCnXs1ZAWrbYngal1rBbWY8CGIN8Gg5mC5WONDZ+U/RqReLWNowF8+67/gkIRe54bSvOvp/9XBlvkbnnLy7xZa1yVpYENVUopdpUNU0+fqudxK4xu0xV4TnM5dwN9lJyyWD7DneRN+33Gf9dtlGjd+yFY8lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961467; c=relaxed/simple;
	bh=n5D2qlyDzMHZj5m2y0QbEBL1DRTWhDy15nyyKnkV0Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPyu5uEYaqS+D97MnFEkUCMkPtCWWILUIm0bU992Va0NyGkSdm7HuY0iItCNpZNjvfnzk3CGBPG7wEYW94fwVvyv9bDVa/Hd5hAiGPrL32rIzoR0EQLpRBxg9sYMNclVgotVKTHpLW4YTDIEMIC2nQbEG2t02lJM6moTVmhX5AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdQr8fSL; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdQr8fSL"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e30a06b59so18581966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790961452; cv=none;
        d=google.com; s=arc-20260327;
        b=R+7qqc4wV9iVlSln7oGktf4hgwdFfhP7eQP8E+O5OonhATCT2BT1FDAX4lUDY0V9De
         wrLv1DrLGiPJ7iTBJYQyNGzbU7uou54OZo2a+b0HNVStg8YynYOtvKlwRPjwWD8drWRt
         BzwmmGxGVMCgntjZmIl5hDMOklkh4EVFqeudK6QTu7OxC+wn03yutrYq0Xw+bDc42S35
         zFFCFS5OwML3bcTMWg6fpUaAbU/T+inZt/WNg9OUVyZMXb4aWaVP/wiyjVcxbQik4/fA
         9wivOUYlAc7roBTqFnkGCyGyI+ULSvcpqG7WLQTSfa8nXBbJ1mv0koia9CxfgQIXP748
         oLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aADe7OTnnLJ+BldvnfgmjEHwTQr8EjDevVArWJMRlrQ=;
        fh=gqeIAEEt2mByfUFQv1SFwnm1EyjhbEB+V6YlTIXf2vs=;
        b=KarMHi/JWO8zs+V/b2PiWCX7Qu/I0x3BATbxhPRlHyJGImGwVxjOLXCCxpGzavXGQn
         v1xV/nnDOVaQ4y88j5okxcvzZmyYM93ORCquw423NmM46Sz2XbSbY8PywbuTbcGw2i56
         FGIdbWd6cW/7nXVRv15at4ctY6BrzEXH8WFuwlDH6mFHEOaykwR6raSazf8dVCmXFafX
         RroRS0n3zstBuiZYE0/eni8DfbLsbL69z/0eJmKP7N8qTjSk8arkpULQ8RnLeB8C3hLA
         mvSOKBTH5OoIHCR4W/4pLnJU0adpY786mNzBLd8Inm+ZLRnOpw7PX77moBr61tUhDV2w
         8ZKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961452; x=1791566252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aADe7OTnnLJ+BldvnfgmjEHwTQr8EjDevVArWJMRlrQ=;
        b=RdQr8fSL3Jdb9SEmESXIIejOOgUCMGRwB7wHCAiaE5fH7/wqfWvw2t7l8ITENo6YTR
         Vvo+obLgyey2UYijSi19VUp0EDJ4OAHSgWsDAS28OjX42rTC+rpv9zYlPu9snamZcLMj
         7LNtccD7e7xGlHVT+IV0JiIvIuvTwPQOyyJcpxeN+ksgPN8BD+tHtMmdQlNy+QmVwLem
         cB3M0kloTtcL3NcE9bed7vF4ytfHKPXdYQIkqTkv6C1S8tr+QEiye/5h1HaKiWFr82rn
         RlN35nmzU1RIxhAQm8I5Z40STeHR6AKowS4kzwj5d9tIUQauA+LpDgmYbBb0mewYz3SS
         G4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961452; x=1791566252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aADe7OTnnLJ+BldvnfgmjEHwTQr8EjDevVArWJMRlrQ=;
        b=ZSU9o/6JB1QaiIvq3wehGpKuvAmlxJh7LVlAUGMwz4LPs0sOcJjYKAZtNvmH6YSGA2
         GIyjYFzU1Hccfb9rWzyXSfur2bf/UEuyakbxbtX+r/O4k7UPjrpi8luvcZg2E8jG9E3c
         Muz4NeMBBTwWooLPPulHrNyUKfJklmJVJTv3nUeyVWmXiZAhrVGsBY/R2IEMpybKyYnn
         D5VxH7hwqvhGCNps7zUh04qBHHBSrYTFyvCUOcgPy5PTYpzPCbOLmfKh3omg2Y3bHkX1
         C7VkGejYvhI1lJGLFob4OuJaqOojt/B05ChrvcqQL+gTl/k+2HDyI8+Kk0GCX+l12jph
         Y0Lg==
X-Forwarded-Encrypted: i=1; AKwUvBxUdc78bMn40m/+41NDlrBP/IfDVfgNoAnP3g3vlZo0RvhEH2FyRZxgDk7J7RV1SIPFAnh8AbuwSYIshHU=@vger.kernel.org
X-Gm-Message-State: AFuF++noJ4+sVenZ8mVU1Pf3/c1R0O9YSIbJYFbHG5Y2tlsGP7Gm+loR
	bc9aBOiNz35Rr9EB6qsfLCBHn+kCtSYETWCpzCdlZ9Mzc5TjBbZjv4Lio1G4A7l9Yrlgvv9LT7R
	K3BSh29d1t1wPa5X/SQIPotCGtryHQd0=
X-Gm-Gg: AYBFou2zNiHYErtdFO+C28gc7S3UznWljHQPXNhzxfMpPbMKkKG+maTIPk8ju/WG6mu
	nDoiqqgtZYVAu9WQxM4zTr4nPE/vlixhLYh8RslSzrJk6qWmIJWfHZDqK31Lh5H8Lxg0rBZt/+3
	u1bwEZKNQdEGAcXf87pQlLQDdv1viBLWc2dEDOmL5XwdmkDpFddTVHJSDgs0qQ1pjBIhC9MKIf8
	rCs7RL+XFymUacpdVMr+Pj7tUHLPktOMAUm649m14nV1dFrZp6wFRzyZdTH6BVuI1f27n1BeoyT
	clwPcMEeDnScnc/AVEYuSEb9XtO7qI4e8FTIZAIH5H3vBmVpJXcExGfL
X-Received: by 2002:a17:907:807:b0:c2d:cd1a:d5b4 with SMTP id
 a640c23a62f3a-c2e4ad79a59mr254697166b.11.1790961452112; Fri, 02 Oct 2026
 10:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929092007.1184843-1-o.rempel@pengutronix.de> <179085726415.434549.9532496066289384267@kernel.org>
In-Reply-To: <179085726415.434549.9532496066289384267@kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 2 Oct 2026 14:17:20 -0300
X-Gm-Features: AclHuK8NZ5uQBj7n9NZ_Yv6VXKadyF4TKLxzCFdA2RLurxUCYYwPqDYt8w7wMRs
Message-ID: <CAJq09z6YL-sgRHYe=VCJ3awDM66PH5Bo0q34DynGoVt9+XZyEQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/1] net: phy: realtek: add MDI-X support for RTL8365MB-VC
To: netdev-bot+sashiko@kernel.org
Cc: o.rempel@pengutronix.de, linusw@kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	alvin.sipraga@analog.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Oleksij for your patch.

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] Changing MDI/MDI-X on a port that is forced to 10 or 100 Mb/s
>   does not restart the link, so the new setting is not applied.
>
> --
>
> net: phy: realtek: add MDI-X support for RTL8365MB-VC
>
> This commit adds config_aneg and read_status hooks for the RTL8365MB-VC
> internal PHY. They let the MDI/MDI-X crossover mode be forced through a
> chip-specific control register and report the resolved MDI-X state to
> ethtool.
>
> > diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/r=
ealtek/realtek_main.c
> > index 3b3352e2cdc6a..e14960192e791 100644
> > --- a/drivers/net/phy/realtek/realtek_main.c
> > +++ b/drivers/net/phy/realtek/realtek_main.c
>
> [ ... ]
>
> > @@ -3058,6 +3068,74 @@ static irqreturn_t rtl8221b_handle_interrupt(str=
uct phy_device *phydev)
> >       return IRQ_HANDLED;
> >  }
> >
> > +static int rtl8365mb_config_mdix(struct phy_device *phydev)
> > +{
>
> [ ... ]
>
> > +     return phy_modify_changed(phydev, RTL8365MB_VC_PHYCR1,
> > +                               RTL8365MB_VC_PHYCR1_MDIX_FORCE |
> > +                               RTL8365MB_VC_PHYCR1_MDI, val);
> > +}
> > +
> > +static int rtl8365mb_config_aneg(struct phy_device *phydev)
> > +{
> > +     int ret;
> > +
> > +     ret =3D rtl8365mb_config_mdix(phydev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* The pair assignment is only evaluated while the link is brough=
t up,
> > +      * so renegotiate if the crossover configuration changed.
> > +      */
> > +     return __genphy_config_aneg(phydev, ret);
>
> [Severity: Medium]
> Does this renegotiate when the port is forced to 10 or 100 Mb/s?
>
> When autoneg is disabled and the speed is below SPEED_1000,
> __genphy_config_aneg() returns early and drops the changed argument:
>
> drivers/net/phy/phy_device.c:__genphy_config_aneg() {
>     ...
>         } else if (phydev->speed < SPEED_1000) {
>                 return genphy_setup_forced(phydev);
>         } else {
>     ...
>         return genphy_check_and_restart_aneg(phydev, changed);
> }
>
> genphy_setup_forced() only calls phy_modify() on MII_BMCR. If speed and
> duplex are unchanged, __mdiobus_modify_changed() skips the write. Nothing
> then restarts the link: there is no ANRESTART, no soft reset and no power
> cycle.
>
> For example, take a link that is up at a forced 100/full:
>
>   ethtool -s <dev> autoneg off speed 100 duplex full
>   ethtool -s <dev> mdix on
>
> This goes through:
>
> phy_ethtool_ksettings_set()->phy_start_aneg()->rtl8365mb_config_aneg()->
>     __genphy_config_aneg()->genphy_setup_forced()
>
> PHYCR1 bits 9:8 get updated. According to the comment above, though, the
> pair assignment is not re-evaluated until the link drops for some other
> reason. This part depends on the hardware behaviour that comment describe=
s.
>
> In the meantime, rtl8365mb_read_status() reads the new mode back from
> PHYCR1 and reports it as mdix_ctrl. That no longer matches the pair
> assignment actually in use.
>
> The eth_tp_mdix_ctrl description in include/uapi/linux/ethtool.h says:
> "When written successfully, the link should be renegotiated if necessary.=
"
>
> Would it help to handle the forced case the way marvell.c does? That
> driver calls genphy_soft_reset() when "phydev->autoneg !=3D AUTONEG_ENABL=
E ||
> changed".
>
> > +}
> > +
> > +static int rtl8365mb_read_status(struct phy_device *phydev)
> > +{
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260929092007.1184843-1-o.rempel%40pengutronix.de

I tested this patch and tried to reproduce the corner case Sashiko pointed =
out.
My device has a RTL8367S switch, using a straight-through cable
directly connecting lan1 and lan3.

# 1. Force speed to 100/full and disable autoneg on both ports
ethtool -s lan1 autoneg off speed 100 duplex full
ethtool -s lan3 autoneg off speed 100 duplex full
# 2. Establish a working link by setting MDI-X on lan1 and MDI on lan3
ethtool -s lan1 mdix on
ethtool -s lan3 mdix off
# (At this point, the link is UP)
# 3. Force MDI off on lan1
ethtool -s lan1 mdix off
# 4. The link goes down as expected
# ethtool lan1
Settings for lan1:
        Supported ports: [ TP MII ]
        Supported link modes:   10baseT/Half 10baseT/Full
                                100baseT/Half 100baseT/Full
                                1000baseT/Full
        Supported pause frame use: Symmetric Receive-only
        Supports auto-negotiation: Yes
        Supported FEC modes: Not reported
        Advertised link modes:  100baseT/Full
        Advertised pause frame use: Symmetric Receive-only
        Advertised auto-negotiation: No
        Advertised FEC modes: Not reported
        Speed: 100Mb/s
        Duplex: Full
        Port: Twisted Pair
        PHYAD: 3
        Transceiver: external
        Auto-negotiation: off
        MDI-X: off (forced)
        Supports Wake-on: d
        Wake-on: d
        Link detected: no
# ethtool -s lan1 mdix on
# 5. and it is back up
# ethtool lan1
Settings for lan1:
        Supported ports: [ TP MII ]
        Supported link modes:   10baseT/Half 10baseT/Full
                                100baseT/Half 100baseT/Full
                                1000baseT/Full
        Supported pause frame use: Symmetric Receive-only
        Supports auto-negotiation: Yes
        Supported FEC modes: Not reported
        Advertised link modes:  100baseT/Full
        Advertised pause frame use: Symmetric Receive-only
        Advertised auto-negotiation: No
        Advertised FEC modes: Not reported
        Speed: 100Mb/s
        Duplex: Full
        Port: Twisted Pair
        PHYAD: 3
        Transceiver: external
        Auto-negotiation: off
        MDI-X: on (forced)
        Supports Wake-on: d
        Wake-on: d
        Link detected: yes

At least for me, I couldn't reproduce any issue.

Tested-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
