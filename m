Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E0A361953
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791752393; cv=none; b=M+eipXIOwaHEykhjex+zPNsgHLN1GHdIavJsGEYhcz71OrAXWgLxHmtbzowhy1dvRDReSe87XO0OpT9MtUS93e7DmcW6MgazMAoUmvuZat5DvunikFddzfFqCmJvMnBR8WRNse1qJNlaj1lOCB/Z5r5Lpy9sTMuJM+L5BxxiR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791752393; c=relaxed/simple;
	bh=tXcYG9Tgnf/w79aqHoVBOQqy0FwpciJpb2bql709lg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvTOWM15vPSfw+7raHuID878JeF3htGVVwEHc5mcrAaOp+vVOWhb7KKhYjzhzNrMzyIMiB3oAHnnKA0vZ77pgEw0C/ysz0JXWjRJzAdRQmEWS2lCJb7FBtvDGF7vhvL4/UlFl+Qks/hfMb+QiMVtYl9YZtPJRPOwrCl8f5ylWfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORimQn+2; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORimQn+2"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-530e75d1ba1so14517051cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791752390; x=1792357190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCy1e3NZqgOW9wFmDtISdWyir4YXd1R4yANWBfWOaw0=;
        b=ORimQn+2lHn6EQeVZYkaooTrS2ANBoSjrcqWPi1DjqrD+rjLLLuNz9hdP9S97w4wuu
         AYF/Yh/LfxGDXS6WlGw8wtcJ7zZL5Bu6jajwAUDyC/Jw5MxTitMQAgbaWMqzr6XtLKMm
         l8hLFByoaXF//EHDjlvFmMqZxuHOWDEGxGfgLgKEa0hs7IidDxx31tp6iRu7PWwR61Zb
         P5x2k4Eg7A9UmsvI0e7WADWwvqFhiSmkVAjjWQUiSYvvUWnLF8Mj8TgUSvesZPApkYoq
         Shxbli0HOO9BnEfAL7fxHLZhNnrRGGV5wpT/9FXbGjvSbcDj1M9tvFnBUzWZ5ko+1EaF
         varg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791752390; x=1792357190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCy1e3NZqgOW9wFmDtISdWyir4YXd1R4yANWBfWOaw0=;
        b=IXdLLvFVgvP1mIEDwXao4fjiekcMvMi8ZbGAfBqoo5DX1xor2DHfoSE1bS2gQesFmz
         ErDVyTkkrW8KQxMCZHA+A8UxsfmMLrZ9OdyzgKGhylIDIo8NFaBlIHntKk8zGkPsjW4t
         9fnvOgWIIqJdRoxXgTHRuOimFPdS0c0x9hGrejDf90pPwn2dE4sRqQ4xtWgTroOsP2HA
         ZDgY7Cc3885UvLpx3iyndhFENwvLgpnf/WDgMm+cci6LA4iS4RGavtVBwmMEa86jRLyP
         0Sk8MCqMUNNoE+OZaC/0aMcYq1I9Gu5/HaD2hyJzKNfiWASA7H7m742e4CboCmq6tqee
         HAyw==
X-Forwarded-Encrypted: i=1; AKwUvBydR7+dz2VC4hSUJ6o1NA3/Ff3McbnZoKkYGK/DKvoEnevdQgmr5K5almoh0gNL298sgLh3RBj5vHs5q6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWrrDMQMCjUTbpXSa9VpxglGEZ/BxrL+NvHWDtIy7YFSq92NpV
	tEtVzCy+ef2bTWXraslyj20h93j5uXZV2kpiuiUjXWlvJFyr6aqY/40p
X-Gm-Gg: AYBFou1Zd6TJC9de9YqvUkt7sbivbJa7dsvP68MkAoZtiCLuLyXyTRYHFE9xczJC1tj
	KHYgUUDvrrOgpuZ1OLBa1unblz6qkV4vItcVhm3KaTvB8sDoyz0wd4fxq+99Q0OJTUBWVP2P2aD
	slMaQ/BQhtOJLwEfeRvQlNOb5PIEtVLgwOvSysSYuNaLcSigRmNJuO2tGONO+hhZxCiI3F6Tr1e
	YBMqVO0inXj3CsHudQ92rnXOstlIbsw52fruN9FOiMYiMhFTyxhqbYzdk2PzZw85FtvHhSN9Aw3
	hs1en6N3nUG5r+LjObv1XwlmP5G/J0caIO1SEbtRR8gp4cDAtFKPXZ17ERivCTa7OVsIZCvRE6+
	14wAEXr86eH+MTm02A4UFurSc3T1bLQhqLL141/D7DSsxQI0Jglj7oVtj5/F7L6Px6IVz0LAHhL
	ncqD/WKcMVRuHkV9g3lEu/BL9CxSfZDuy40CsOn2p4XqeJrWDQH6rP22ym1cs103KRv1Ma3sC1H
	7dgpbpI+FDEnL4zf7YjaaSCsp895LPfJPFHyXGSOG0eMPfjmTjpv1mUxa4308I2+95C5ttC79vi
	4L15JEXamsTYjI0pqn+MvxxuOsbjU4kVsvW0
X-Received: by 2002:a05:622a:413:b0:535:1761:107b with SMTP id d75a77b69052e-5359fad0708mr146103121cf.31.1791752389856;
        Sun, 11 Oct 2026 13:59:49 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f3a:5300:59f5:310c:d10c:6260? (p200300ea8f3a530059f5310cd10c6260.dip0.t-ipconnect.de. [2003:ea:8f3a:5300:59f5:310c:d10c:6260])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ad30csm65795111cf.23.2026.10.11.13.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 13:59:48 -0700 (PDT)
Message-ID: <dbdd5abd-f1b1-443c-adc3-6ecdc95f4854@gmail.com>
Date: Sun, 11 Oct 2026 22:59:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] r8169: allow Giga Lite fallback on RTL8168EP
To: Hee-Suk Kim <hskim@dilluti0n.com>, netdev@vger.kernel.org,
 javen <javen_xu@realsil.com.cn>
Cc: nic_swsd@realtek.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>,
 linux-kernel@vger.kernel.org
References: <20261010135356.85454-1-hskim@dilluti0n.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20261010135356.85454-1-hskim@dilluti0n.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.10.2026 15:53, Hee-Suk Kim wrote:
> Giga Lite is a Realtek proprietary mode which allows links of up to
> 500 Mbps over two-pair cabling. In South Korea, it is widely used to
> support 500 Mbps plans by most ISPs. The vendor driver [1] sets PHY
> page 0xa42, reg 0x14, bit 9 to allow it on RTL8168H and FP. The driver
> does not handle RTL8168EP but I confirmed the same works for it by
> setting the PHY register via SIOCSMIIREG on an SK Broadband 500 Mbps
> plan [2].
> 
> With the bit set, the link still came up at about 470 Mbps even when
> only 10/100 was advertised. So set it only when autonegotiating with
> 1000baseT/Full advertised, and clear it otherwise, to respect a lower
> advertised speed. This matches what the vendor driver does for
> RTL8168H and FP.
> 
> PHYSR reports 0x30 in its speed field to denote a Giga Lite link. This
> value is not handled in rtlgen_decode_physr(), so the reported speed
> varies between 100 and 1000 Mbps on the same link. Handle it to report
> 1000, as there is no 500 Mbps uAPI.
> 
> [1] https://github.com/mtorromeo/r8168/blob/b3e24e4aa74a3561618d0abf01b708bd55def57a/src/r8168_n.c#L6375-L6390
> [2] https://www.tworld.co.kr/web/product/callplan/NI00000567
> 
> Assisted-by: LLM
> Signed-off-by: Hee-Suk Kim <hskim@dilluti0n.com>
> ---
> Test results on a ThinkPad T14 Gen 5 (RTL8168ep/8111ep, XID 502) with
> an SK Broadband 500 Mbps plan ("before"/"after" = without/with this
> patch, throughput by fast.com):
> 
>   kernel  bit 9          advertised   PHYSR  reported     throughput
>   ------  -------------  -----------  -----  -----------  ----------
>   before  clear          10/100/1000  0x10   100          94 Mbps
>   before  set manually   10/100/1000  0x30   100 or 1000  470 Mbps
>   after   set manually   10/100       0x30   1000         470 Mbps
>   after   clear          10/100       0x10   100          95 Mbps
>   after   set            10/100/1000  0x30   1000         470 Mbps
> 
> "set manually" means bit 9 was set via SIOCSMIIREG. Happy to share the
> script if useful.
> 
>  MAINTAINERS                               |  1 +
>  drivers/net/ethernet/realtek/r8169_main.c |  4 ++++
>  drivers/net/phy/realtek/realtek_main.c    | 26 +++++++++++++++++++++++

It would be better to separate the patches for the Realtek PHY driver and
the MAC driver.

>  include/linux/realtek_phy.h               | 10 +++++++++
>  4 files changed, 41 insertions(+)
>  create mode 100644 include/linux/realtek_phy.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 509b35b5a0e7..a54370ae80a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9789,6 +9789,7 @@ F:	include/linux/phy_fixed.h
>  F:	include/linux/phy_link_topology.h
>  F:	include/linux/phylib_stubs.h
>  F:	include/linux/platform_data/mdio-bcm-unimac.h
> +F:	include/linux/realtek_phy.h
>  F:	include/net/phy/
>  F:	include/trace/events/mdio.h
>  F:	include/uapi/linux/mdio.h
> diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
> index 43c46d483eb8..fe49197c4d7b 100644
> --- a/drivers/net/ethernet/realtek/r8169_main.c
> +++ b/drivers/net/ethernet/realtek/r8169_main.c
> @@ -28,6 +28,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/phylink.h>
>  #include <linux/prefetch.h>
> +#include <linux/realtek_phy.h>
>  #include <linux/ipv6.h>
>  #include <linux/unaligned.h>
>  #include <net/ip6_checksum.h>
> @@ -5619,6 +5620,9 @@ static int r8169_mdio_register(struct rtl8169_private *tp)
>  		return -EUNATCH;
>  	}
> 
> +	if (tp->mac_version == RTL_GIGA_MAC_VER_51)

Any specific reason you restrict the functionality to this chip version?
In the commit message you describe that vendor driver also supports the
500Mbps mode for RTL8168H and RTL8168FP.
Also vendor drivers r8125, r8126, r8127 include functionality for dealing
with 500mbps mode settings. So more chip versions seem to support it.
Hopefully Realtek people can provide some more insight.

> +		tp->phydev->dev_flags |= RTL_PHY_F_GIGA_LITE;
> +
>  	/* Keep EEE off but the version stays EEE-capable so that link-up
>  	 * still clears the MAC TX-LPI bits.
>  	 */
> diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
> index e14960192e79..319122270bca 100644
> --- a/drivers/net/phy/realtek/realtek_main.c
> +++ b/drivers/net/phy/realtek/realtek_main.c
> @@ -14,6 +14,7 @@
>  #include <linux/of.h>
>  #include <linux/phy.h>
>  #include <linux/pm_wakeirq.h>
> +#include <linux/realtek_phy.h>
>  #include <linux/netdevice.h>
>  #include <linux/module.h>
>  #include <linux/delay.h>
> @@ -1706,6 +1707,7 @@ static void rtlgen_decode_physr(struct phy_device *phydev, int val)
>  		phydev->speed = SPEED_100;
>  		break;
>  	case 0x0020:
> +	case 0x0030:	/* Giga Lite */
>  		phydev->speed = SPEED_1000;

So for Giga lite (500Mbps) a wrong speed (1Gbps) is reported to the user.
Not sure whether we want to add a SPEED_500 constant. On one hand it's a non-standard mode,
on the other hand it's apparently widely used in South Korea.
@Andrew: How do you see this?

Alternatively we could add a notification to the user if Giga lite is auto-negotiated.

>  		break;
>  	case 0x0200:
> @@ -1735,6 +1737,29 @@ static void rtlgen_decode_physr(struct phy_device *phydev, int val)
>  	}
>  }
> 
> +static int rtlgen_config_aneg(struct phy_device *phydev)
> +{
> +	int ret = 0;
> +
> +	/* With Giga Lite enabled, the PHY can link in Giga Lite even

As Giga lite is a Realtek-proprietary mode, you may want to add some words
about what Giga lite is.

> +	 * when 1000baseT/Full is not advertised.  Only allow it when
> +	 * autonegotiating with 1000baseT/Full advertised, so that a
> +	 * lower speed set by the user is respected.
> +	 */
> +	if (phydev->dev_flags & RTL_PHY_F_GIGA_LITE) {
> +		bool en = phydev->autoneg == AUTONEG_ENABLE &&
> +			  linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> +					    phydev->advertising);
> +
> +		ret = phy_modify_paged_changed(phydev, 0xa42, 0x14, BIT(9),
> +					       en ? BIT(9) : 0);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return __genphy_config_aneg(phydev, ret > 0);
> +}
> +
>  static int rtlgen_read_status(struct phy_device *phydev)
>  {
>  	int ret, val;
> @@ -3248,6 +3273,7 @@ static struct phy_driver realtek_drvs[] = {
>  	}, {
>  		.name		= "Generic FE-GE Realtek PHY",
>  		.match_phy_device = rtlgen_match_phy_device,
> +		.config_aneg	= rtlgen_config_aneg,
>  		.read_status	= rtlgen_read_status,
>  		.suspend	= genphy_suspend,
>  		.resume		= rtlgen_resume,
> diff --git a/include/linux/realtek_phy.h b/include/linux/realtek_phy.h
> new file mode 100644
> index 000000000000..7fcde616c070
> --- /dev/null
> +++ b/include/linux/realtek_phy.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _REALTEK_PHY_H
> +#define _REALTEK_PHY_H
> +
> +#include <linux/bits.h>
> +
> +/* phy_device::dev_flags */
> +#define RTL_PHY_F_GIGA_LITE	BIT(0)
> +
> +#endif /* _REALTEK_PHY_H */
> 
> base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
> --
> 2.55.0

