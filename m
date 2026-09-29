Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B83296BCF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661891; cv=none; b=td0/Hcyy3R6CUgdu5DDMckXjcvIUJKhLeWzybjMKEXxy7ZakIvBRNIfp57xoIk66XSobhbsZO1OApubDtL4iNKlFRUUMonNKzEm0PNkKxbda20BlKSYV1GjejQ43IWMUsLwme9ghsq5jxgI1DxJopzUkDbMG4BedXhrlAnjj4Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661891; c=relaxed/simple;
	bh=a4Kw0/+7x9IW9EMICVZHdLINZ3mYtw/nqjRwyV3ufBE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=himi3X6OGoOKky1bEide3Qr9uNbkf0uXUPK4TvezNqb1phmQ7+mAh92ec3CfpQQSq9H6N4dCv6NYt7DFTkhHRFbtGIhk7rdiXEFRqMbWAI2RP89gh5NHGmwKAb9B8wfZJENzntL9NqCHBFlecH+DbKXKb2MaMD9LnohzyVvUVWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roFgokrf; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roFgokrf"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af0707d41so227218f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790661888; x=1791266688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0TZEPIVidw3xLm+2nRYFt1HaNZNBSK8y9IPaB77MDo=;
        b=roFgokrftoEMCPFcmgnQByHUmYf58p4TT7+pKkCFrhvkYKtJOexweECRJ9/RQeM5XM
         srSCD9U27eZqEhW0kbiOQNZNru8jIp8hnL9MnuvXGSfokKUdJ7ASFNewtXtgRdDbIoCb
         jUAElwbaV4XJ+RYXQx+gSilEJ+REmqyHube9HKFPMctfcOO2CDcKIMW7KcpLaKoZcWIp
         9jbsU2zVS1wtEL6EVmpW9aQ8BKuv/6EG6x5a9pOMZe741ydBgxzI+rsQQlZcapIjgWvS
         CPLJsvWI4segTHDZCXkHkjsovp1DLi93usTeNhrjlnFNoRGI5Xi2W4P3PEKZ55v+nW38
         U0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661888; x=1791266688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0TZEPIVidw3xLm+2nRYFt1HaNZNBSK8y9IPaB77MDo=;
        b=z8uXOLqe2A941mkKr0u72dRe2yFq0THAlKaUShKPfMrR5bL9aj1SWI5AO2PFZqZQO0
         0RaF2dSt5TJWyRb0bMQpuiffnmMAj4Z8RgdedHMwTNGf4KfS+OF+QibMlTxEMlDBJpd6
         AKVadSYgytS+HfusRFcMCRDERwjewSX1RWzv7d8/GKIJytHqsYVYawzkHFGVybF4HRug
         9sy3qfxEBMs4IHpJUQRZeJa6z+d815suRnEXLPzeNl3l8aats4a4lYsNhcjYI1HSLwmT
         O2Qn6wPaNQ4EYOhYrHIMeUl96D98VPt2jy/X1sMIaXNWqivU+952yp5b+fT1l6bUPsNR
         02sg==
X-Forwarded-Encrypted: i=1; AKwUvBwyicixOXHwBHbrsnnMKuDFVPNWDeClKcWw3g0Xi5J9vGpRVuemmNqkZ8wQo4wMb1M6CHP2N9MVwjIRpbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLguab/Q0+WWDGs0H/sPBZoZdiG151uF+WtlLngzUglFkyTFpS/
	OKL/nLfZyeY2IF0C03hr84AcOLPKTb79Wt9IuyWUgfYBvgonydGg2jvD
X-Gm-Gg: AYBFou3YP2++LvTgyYwai/SuSuo7ffpyNy68e6ZK6PZXbn2R9MlCrOnpyE74cTBqdQz
	PK0iOH5HrFoT1Q3uAB6Tu7jA0yj6rJTE4umqtjfHeDfXIE+QD7wq8riSeDiFj8yh3BVts1IyLuB
	QpVBc2XgbWvI7+ngivSraLeKFrvy/va7GfNDMHH3uuk8mtF4TEK9/EFYOmAY1TVpfA5UykY7zg0
	B2QS3yrgqUR+Fn09XqF9FxqCAGxGizlWN0xmNtFcQkpalsE7n3gMH6LDnjcny3gVyuPSm8iwdDm
	z9OHoeNCJdbAsh1u50XTW+JigDbifbtA2PSFUxTHDw+iHpS3NHJw+Iyya2DCB1Tbac4YsbxSu57
	xeImdlgQPmlLP+Z/p3hyuvtWpDXS54oyh/7nD+pAU+eDOlzPhPNsON0uKu0HJlIp6cRinXprym2
	4VuvprkYsrsMwyuB5MHSt/9aN7G2V5AeSvAUIc6lqIzEiYbj9tJRQodtiTWm+qbTCI5UPwy0L4j
	zUkgyuCLskIgcq0T/4BG1oaVx9xXzXo1oXkLWhZu7Zx3A==
X-Received: by 2002:a05:6000:41cb:b0:48a:f4b7:25c4 with SMTP id ffacd0b85a97d-48af4b727b1mr1097369f8f.1.1790661888208;
        Mon, 28 Sep 2026 23:04:48 -0700 (PDT)
Received: from Ansuel-XPS. (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af507f33fsm1275291f8f.24.2026.09.28.23.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:04:47 -0700 (PDT)
Message-ID: <6abb54ff.332d3c56.21546b.7fef@mx.google.com>
X-Google-Original-Message-ID: <artU_MVOnnHuo-a1@Ansuel-XPS.>
Date: Tue, 29 Sep 2026 08:04:44 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Yongzhao Chen <yongzhao.derek@gmail.com>
Cc: netdev@vger.kernel.org, Ziyang Huang <hzyitc@outlook.com>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 3/3] net: dsa: qca8k: support QCA8337
 internal PHY CPU links
References: <20260928220811.1880-1-yongzhao.derek@gmail.com>
 <20260928220811.1880-4-yongzhao.derek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928220811.1880-4-yongzhao.derek@gmail.com>

On Tue, Sep 29, 2026 at 12:08:11AM +0200, Yongzhao Chen wrote:
> From: Ziyang Huang <hzyitc@outlook.com>
> 
> A PHY-to-PHY CPU link connects the SoC PHY directly to an internal
> switch PHY. The QCA8337 supports header mode on these ports, and
> existing phylink callbacks already handle their internal interfaces.
> 
> Allow QCA8337 CPU port selection to fall back to ports 1 through 5 after
> checking the dedicated MAC-only ports. Preserve the preference for CPU
> ports 0 and 6 across all switch models, limiting the internal-port
> fallback to QCA8337. Support for QCA8327 internal CPU links has not
> been established and is not enabled. Include internal CPU PHYs when
> selecting the PHY access method, without altering the handling of
> MAC-only or external user ports.
> 
> This enables a single internal CPU PHY configured with an explicit
> phy-handle and phy-mode = "internal". The conduit interface uses its own
> PHY on the opposite side of the MDI connection. Existing single-CPU DSA
> forwarding uses the selected port for default flooding and membership
> without extra routing changes.
> 
> Adapted from the OpenWrt PHY-to-PHY CPU link patch, narrowing the MDIO
> filter adjustments to preserve handling for external user ports.
>

Can you put an example DT for this? Also no additional register are needed
to this special mode?
 
> [yongzhao: preserve external user-port handling on port 6 and limit
>  internal CPU PHY support to QCA8337]
> 
> Assisted-by: LLM
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
> ---
>  drivers/net/dsa/qca/qca8k-8xxx.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
> index 7bd9d9abcef..cd36efd1c4f 100644
> --- a/drivers/net/dsa/qca/qca8k-8xxx.c
> +++ b/drivers/net/dsa/qca/qca8k-8xxx.c
> @@ -1026,7 +1026,8 @@ qca8k_setup_mdio_bus(struct qca8k_priv *priv)
>  			return ret;
>  		}
>  
> -		if (!dsa_is_user_port(priv->ds, reg))
> +		if (!dsa_is_user_port(priv->ds, reg) &&
> +		    !(reg > 0 && reg < 6 && dsa_is_cpu_port(priv->ds, reg)))
>  			continue;
>  
>  		of_get_phy_mode(port, &mode);
> @@ -1102,16 +1103,23 @@ qca8k_setup_mac_pwr_sel(struct qca8k_priv *priv)
>  static int qca8k_find_cpu_port(struct dsa_switch *ds)
>  {
>  	struct qca8k_priv *priv = ds->priv;
> +	int port;
>  
> -	/* Find the connected cpu port. Valid port are 0 or 6 */
>  	if (dsa_is_cpu_port(ds, 0))
>  		return 0;
>  
> -	dev_dbg(priv->dev, "port 0 is not the CPU port. Checking port 6");
> -
>  	if (dsa_is_cpu_port(ds, 6))
>  		return 6;
>  
> +	/* Internal PHY CPU port selection is currently enabled for QCA8337. */
> +	if (priv->switch_id != QCA8K_ID_QCA8337)
> +		return -EINVAL;
> +
> +	/* An internal PHY can provide a PHY-to-PHY CPU link. */
> +	for (port = 1; port < 6; port++)
> +		if (dsa_is_cpu_port(ds, port))
> +			return port;
> +
>  	return -EINVAL;
>  }
>  
> @@ -1863,7 +1871,7 @@ qca8k_setup(struct dsa_switch *ds)
>  
>  	cpu_port = qca8k_find_cpu_port(ds);
>  	if (cpu_port < 0) {
> -		dev_err(priv->dev, "No cpu port configured in both cpu port0 and port6");
> +		dev_err(priv->dev, "No CPU port configured");
>  		return cpu_port;
>  	}
>  
> -- 
> 2.43.0
> 

-- 
	Ansuel
