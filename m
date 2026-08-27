Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461D0479871
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845915; cv=none; b=kGjKUAqXuEiBnrXLRjM+ZbsMTW6S9vUoMPgI4dgMXNeK5LuXM/6i0NqlnGqNxrL4lq9JG6RhlJd4Lijc/Mp3n75w8kILTg3EWuG/I/59FYRURL3XTBwTI3RhNS3G2uuk9E0U3Q0O/Z8jl7YFzvLI7pL8lOJxuyV3M9u7eZJkZ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845915; c=relaxed/simple;
	bh=WXFlshhAI32NCw2cUn89qhkIe5jJyTse+7gVkcC7buY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvxtZNLQ9TsqhfonbZxGhhBUGrXmAcGtF2GXUDR4A9ZY1Vq2XrILtJUDpeRz5DZEpnZ1GmzdutOhn14jCSMiBHLzHLEiCSfLtuIAlgzNXt8IxmeZpWevGRDY5i6Fx2DVQGVXvBulMz3xwEeWRk3KYNqQ1HULkgngGdhkHTCXGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxEiR5+9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxEiR5+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99531F000E9;
	Thu, 27 Aug 2026 15:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787845913;
	bh=aovq1KkciW0KDIYSdKHZRe3g2cVVyF8GtFj742+JzQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BxEiR5+9bnkkKD7WsnInpGQssDcg+5I44XpMJJNvkD+t8EzRlWK+gMhEKfuWVK5aC
	 TI5LRHxPfyRrIGhgsXDlKneH9BMurbymrhO60lXVjHf+x2aFsPMx7LzWvWqRt8U8LI
	 2duPLcdn91mVYO/OYPMXFpDk7I9zkqSTYLV6hwFh6nyqh592sgtPORsoWUxseBndaM
	 z+T6YBaHBKtvdujXi8xDC7/cvAikMaJGTvj9ich6BmoLyKEV5HpuroDXHvNZ83554Z
	 KFTB29RgoeiIYlq6K8/XGwPHhqMG511gxTtW46IbMBtJMiRZkgos1JsnZiKHFBf+GR
	 FUzbjQyev9Epw==
Date: Thu, 27 Aug 2026 21:21:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: omap-usb2: add explicit PHY comparator API
Message-ID: <apBdFetctMKBH-iT@vaman>
References: <20260722053618.602702-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722053618.602702-1-ivo.g.dimitrov.75@gmail.com>

On 22-07-26, 08:36, Ivaylo Dimitrov wrote:
> The existing omap_usb2_set_comparator() API locates the OMAP USB2 PHY
> instance by calling usb_get_phy(USB_PHY_TYPE_USB2), assuming there is a
> single USB2 PHY registered in the system.
> 
> This assumption no longer holds on systems with multiple USB2 PHY
> providers. In such cases, the global lookup may return a different USB2
> PHY instance, causing the OMAP driver to perform an invalid container_of()
> conversion when accessing its private data.
> 
> Introduce omap_usb2_set_phy_comparator(), allowing callers to explicitly
> specify the OMAP USB2 PHY instance to associate with a phy_companion.
> The new helper validates that the supplied USB PHY is an OMAP USB2 PHY
> before accessing its private data.

Well the name can cause ambiguity with old API. Second I would like to
see users of this API as well

> 
> The existing omap_usb2_set_comparator() API is kept unchanged for
> existing users.
> 
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>  drivers/phy/ti/phy-omap-usb2.c | 32 ++++++++++++++++++++++++++++++++
>  include/linux/phy/omap_usb.h   |  7 +++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/phy/ti/phy-omap-usb2.c b/drivers/phy/ti/phy-omap-usb2.c
> index 1eb252604441..ac31b693fce7 100644
> --- a/drivers/phy/ti/phy-omap-usb2.c
> +++ b/drivers/phy/ti/phy-omap-usb2.c
> @@ -70,6 +70,8 @@ struct omap_usb {
>  
>  #define	phy_to_omapusb(x)	container_of((x), struct omap_usb, phy)
>  
> +static int omap_usb_set_host(struct usb_otg *otg, struct usb_bus *host);
> +
>  struct usb_phy_data {
>  	const char *label;
>  	u8 flags;
> @@ -113,6 +115,36 @@ int omap_usb2_set_comparator(struct phy_companion *comparator)
>  }
>  EXPORT_SYMBOL_GPL(omap_usb2_set_comparator);
>  
> +/**
> + * omap_usb2_set_phy_comparator() - associate a comparator with an OMAP USB2 PHY
> + *
> + * @omap_phy: OMAP USB2 PHY instance
> + * @comparator: companion PHY providing comparator operations
> + *
> + * The phy companion driver should call this API with the companion PHY
> + * implementation containing the callbacks required by @omap_phy.
> + *
> + * For use by phy companion drivers.
> + */
> +int omap_usb2_set_phy_comparator(struct usb_phy *omap_phy,
> +				 struct phy_companion *comparator)
> +{
> +	struct omap_usb	*phy;
> +
> +	if (!omap_phy)
> +		return -EINVAL;
> +
> +	if (WARN_ON(!omap_phy->otg ||
> +		    omap_phy->otg->set_host != omap_usb_set_host))
> +		return -EINVAL;
> +
> +	phy = phy_to_omapusb(omap_phy);
> +	phy->comparator = comparator;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(omap_usb2_set_phy_comparator);
> +
>  static int omap_usb_set_vbus(struct usb_otg *otg, bool enabled)
>  {
>  	struct omap_usb *phy = phy_to_omapusb(otg->usb_phy);
> diff --git a/include/linux/phy/omap_usb.h b/include/linux/phy/omap_usb.h
> index e23b52df93ec..96f9792c6ce6 100644
> --- a/include/linux/phy/omap_usb.h
> +++ b/include/linux/phy/omap_usb.h
> @@ -15,11 +15,18 @@
>  
>  #if defined(CONFIG_OMAP_USB2) || defined(CONFIG_OMAP_USB2_MODULE)
>  extern int omap_usb2_set_comparator(struct phy_companion *comparator);
> +extern int omap_usb2_set_phy_comparator(struct usb_phy *omap_phy,
> +					struct phy_companion *comparator);
>  #else
>  static inline int omap_usb2_set_comparator(struct phy_companion *comparator)
>  {
>  	return -ENODEV;
>  }
> +static inline int omap_usb2_set_phy_comparator(struct usb_phy *omap_phy,
> +					       struct phy_companion *comparator)
> +{
> +	return -ENODEV;
> +}
>  #endif
>  
>  #endif /* __DRIVERS_OMAP_USB_H */
> -- 
> 2.39.5

-- 
~Vinod
