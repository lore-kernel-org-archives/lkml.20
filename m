Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497961;
	b=oxbOYJNgMdUFi7eErjHX2FMCGbhqWenAOzgvEaH+TZ4nslcpuhw+XcL0xOrIpAHUaCCM
	 IFFgfEoHGN4MNBkGOuuZKX8Vu2sHmAa+wANxplInLa2+YGV6CSdvT4rSpdokt7fVrKgsw
	 AO7t+e450j930DDJely8zZ8Vso3ChTU/ENqaWysfbn+ptpQQATRnWVzOTyOg5NiDtPL0j
	 +g3gHetpsLcg2miv/87SToM1huZcoJHPvz/ou0j+lOCYeL4C5TnDlzs5J52g9uD0l80re
	 QjWgIQGy+64vGXg1y0Cs5qC6MIhjiLKW2wwF+u6xj66gUX9XNMxc13vT7td9wP6nYBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497961;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=JNnYp35o/nf6vmTuNBxPUZDLjYmnLfH8FNhphGFUILw=;
	b=t1oo9soDbcr3YAzPCSECDNMcqEwEVpLDzwmZogwGiLNkrz1McQbIQ4cEvLhpUC+0hsfO
	 np9Ewf/W1T5RUrEsyXjX0xyesZiPxe6+R7o6rHXRyHcA6MrE/fPc0NdzWkdcz1IXwqIYU
	 9iP3xfsWNaqfmvdCktsTe4EtMp8K5HvG05lhfihPmBJ6CJ0zQHgDf0q6VlEB08Morc5i6
	 hSQyFwORSBfVts50Fd512KyCvJBwBzMMyMl+PrBiINUUpqYriE1e8uJkfb7x/+4XnKcls
	 wMyjic5i8mzWg1gs6qwjmUxAcTReGhEi/J5p37yhVsIWNt2kLqc0f/yTEGPfp4HUXPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wD5zPBe6;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591E2606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591E2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wD5zPBe6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CA7AEC79A9C;
	Thu, 12 Nov 2026 15:39:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7BD705FF85;
	Thu, 12 Nov 2026 15:39:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C23B11BC12B5;
	Thu, 12 Nov 2026 16:39:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794497954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JNnYp35o/nf6vmTuNBxPUZDLjYmnLfH8FNhphGFUILw=;
	b=wD5zPBe6kaum/BhnlH6o+LaQ7BAShR19kjnPomalW1TpQGj6uPuqzef7EcWSGlDS1OF8SH
	DSTpRZNPSr6dZhWViBlT+EdYHo/E2WR0ink4eAqmHj8FvCWiZztJ7R+X9Mxi9SAh75cIfW
	9ndpaN6jBbDTTQ6PBJ5Y3SUlTGmj99QYHcxyy4vsV5txUrG6ak/t7JCioBN+gM3RkPDBn8
	aaK7KGVaPok38beWMpECPkVhTserR9yBDYI0SwAlrvXJM8LFO+qk9Tv6SJJVrJA2HMa3Lo
	xkBkqyucxvXaR2FllFwFLk2SWwCN4yi4rZvDSaRP0v1dgw0sLMDEO5w4PAAqgA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 16:39:06 +0100
Message-Id: <DMTCFJVH99S4.27AWO8PN3ZPK7@bootlin.com>
Cc: "Damon Ding" <damon.ding@rock-chips.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
To: "Jun Yan" <jerrysteve1101@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Heiko Stuebner"
 <heiko@sntech.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3] drm/bridge: analogix_dp: use devm_phy_optional_get()
 for the DP PHY
X-Mailer: aerc 0.22.0
References: <20261110023721.2014061-1-jerrysteve1101@gmail.com>
In-Reply-To: <20261110023721.2014061-1-jerrysteve1101@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Tue Nov 10, 2026 at 3:37 AM CET, Jun Yan wrote:
> The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
> internal eDP port) has no separate PHY device and relies on its built-in
> PHY, which is programmed directly through the GRF registers, so its DT
> node carries no "phys"/"phy-names" property.
>
> Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
> -ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
> misleading "no DP phy configured" error at probe time before falling back
> to a NULL phy.
>
> Use devm_phy_optional_get() instead, which returns NULL when the PHY is
> absent and otherwise behaves identically, and drop the manual -ENODEV/
> -ENOSYS handling. This also removes the spurious error message.
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
> ---
> Changes in v3:
>   - Add missing changelog entries and reference links
>   - Link to v2: https://lore.kernel.org/dri-devel/20261013134659.335829-1=
-jerrysteve1101@gmail.com/
>
> Changes in v2:
>   - Added comments to explain the changes made.
>   - Link to v1: https://lore.kernel.org/dri-devel/20260924020417.868588-1=
-jerrysteve1101@gmail.com/
>
>  .../drm/bridge/analogix/analogix_dp_core.c    | 22 ++++++-------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 6df6963740d2..637b1bff0f6c 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1426,21 +1426,13 @@ analogix_dp_probe(struct device *dev, struct anal=
ogix_dp_plat_data *plat_data)
>  	if (ret)
>  		return ERR_PTR(ret);
>
> -	dp->phy =3D devm_phy_get(dp->dev, "dp");
> -	if (IS_ERR(dp->phy)) {
> -		dev_err(dp->dev, "no DP phy configured\n");
> -		ret =3D PTR_ERR(dp->phy);
> -		if (ret) {
> -			/*
> -			 * phy itself is not enabled, so we can move forward
> -			 * assigning NULL to phy pointer.
> -			 */
> -			if (ret =3D=3D -ENOSYS || ret =3D=3D -ENODEV)
> -				dp->phy =3D NULL;
> -			else
> -				return ERR_PTR(ret);
> -		}
> -	}
> +	/*
> +	 * RK3288/RK3399 use Analogix DP controller built-in PHY,
> +	 * no extra PHY configuration is required.
> +	 */
> +	dp->phy =3D devm_phy_optional_get(dp->dev, "dp");
> +	if (IS_ERR(dp->phy))
> +		return ERR_CAST(dp->phy);

The original code ignbores -ENOSYS, devm_phy_optional_get() does not. So,
either -ENOSYS was just impossible, or this patch potentially changes the
behaviour.

Can you elaborate on that?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
