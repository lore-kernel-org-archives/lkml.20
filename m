Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD653812ED;
	Tue,  8 Sep 2026 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851842; cv=none; b=GTrURL3SdVxTeV6Q6lwhU6CebIbkKa77tJzCHF2BZITkTHVg60MWpFnggU7aEzm/6pCxI1TaMEQsLjfK582MwPC79lbtZEViuXUANfGnF9ioV3kENvgtaBgNs5oPXnYze7+VzZQ/3fPr60kLfuGGs8/B1bxRtZi2aWOfduuVSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851842; c=relaxed/simple;
	bh=YSyctKQZ61Pu3BHWVIRGxef6oeK0ft72rWOFCAtXmCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzeGzR/k3XQ5goMoSzPqPbmZSg8x29ujCc4ThvuEZyICpeJPen7VBHDaFxynZM1A5YPHEZ1v+qFXxxdprGgdIAO97YjGaO1ddTv3V2wSEFehj7ss87mteK68ua5xHuGARaG8kb/UrtaEkbgiltM8aX5E4Vzu8LshbMhec1U4tsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o1fCgHg1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o1fCgHg1"
Received: from ideasonboard.com (mob-109-113-65-131.net.vodafone.it [109.113.65.131])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67C0BC2D;
	Tue,  8 Sep 2026 09:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788851743;
	bh=YSyctKQZ61Pu3BHWVIRGxef6oeK0ft72rWOFCAtXmCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1fCgHg1SSluz+JRjFE6AqbJ5f34HG4WkxIiVNkJWGOuZbtJdDZEYn8suUiEont3m
	 h2PWgyWuqUMkISE3sAwcrlaUQQ89KDmkKHUyAgsK3hUa6R3yL0/24lRKT+HcX+itUP
	 952DiKQS5MYr31D/YSaGAlH2lp5e5zpFBRkbzCI4=
Date: Tue, 8 Sep 2026 09:17:15 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ap-1tDtGCWGc9Hvs@zed>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
 <20260904-mira016-v2-2-1dcf7b3a807e@ideasonboard.com>
 <ap3M0h2S6EFpuC2T@kekkonen.localdomain>
 <ap5n7OyZrI0KzzN-@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ap5n7OyZrI0KzzN-@zed>

Hi Sakari

On Mon, Sep 07, 2026 at 09:45:16AM +0200, Jacopo Mondi wrote:
> Hi Sakari, thanks for the review
>

[snip]

> > > +
> > > +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mira016)
> > > +{
> > > +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> > > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > +	};
> > > +
> > > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg))
> > > +		return dev_err_probe(dev, -EINVAL, "Failed to parse endpoint\n");
> >
> > Don't mask error codes! Just return the error code returned by
> > v4l2_fwnode_endpoint_alloc_parse().
> >
>
> With PTR_ERR() I presume
>
> > > +
> > > +	/*
> > > +	 * Link frequencies: the driver supports a single link frequency,
> > > +	 * no need to check bitmap after this call.
> > > +	 */
> > > +	if (v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> > > +				     ep_cfg.nr_of_link_frequencies,
> > > +				     mira016_link_freqs,
> > > +				     ARRAY_SIZE(mira016_link_freqs),
> > > +				     &mira016->link_freq_bitmap)) {
> >
> > Ditto.
> >
> > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> > > +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> >
> > Instead of callind v4l2_fwnode_endpoint_free() here and above, I'd add a
> > label for error handling.
> >
>
> ack

I'll actually backtrack on this.

Sashiko pointed out that mixing gotos and cleanups is probably not a good idea
and this time, the bot is right.

