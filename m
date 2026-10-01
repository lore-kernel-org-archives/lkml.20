Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9444E67E;
	Thu,  1 Oct 2026 07:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839152; cv=none; b=a5d4ClhMoua00V0plYrBDsrf7y1rjma8QusOf0qnAI8f0j5tVoQRkO/x1eu/2jeB55I8U/mg7xL+D2x7BDnSCfBZbCU4z1LcGFPNnrw0uZ13cAq4xKA8uEnqgPAl6l8EwZTTi0IQF7VUPwjyyrEKhoeQQrJAyKFz4bXF8+UcR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839152; c=relaxed/simple;
	bh=ugNTc5y/vWX5PsL7yG9DuYBHPRO/PaN7UDGQK3RqmLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epdoTzbrFdbjg+LKMBGIspZQ5azsmYfw2S4N3HF1ThWfasb8ZZy/7Rlil0vYkxx5byDHFT0utpXnJ8o0e40duacZikL6vvZjfBgAgzTPTOskZdx7Gw3G8zGegxcdEZIh9uq/Q/UA2GuFyCL04JJLNnZ3880dBpXcqXmlWU3thBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E3trbZ0f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E3trbZ0f"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD169269;
	Thu,  1 Oct 2026 09:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790839032;
	bh=ugNTc5y/vWX5PsL7yG9DuYBHPRO/PaN7UDGQK3RqmLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3trbZ0f4RtbXohHe9SjfoneP8R2ILlonnkIota1rq6f3AjDlCX/OrQDm3h3Ivzj1
	 YdqJrXteltNW5lTzkEAcmlJax9jSQ+2kION3CAxliifdWwQVt4pMu43cNQJKRCxJ+F
	 gnoMRE/2IpaUjVx4x3lN2BhDeH6hkjqUZrX0MQ60=
Date: Thu, 1 Oct 2026 09:19:02 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ar4IKQHYzprZ3CPv@zed>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
 <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
 <ar4BsDNOkcusy4Qz@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ar4BsDNOkcusy4Qz@kekkonen.localdomain>

Hi Sakari

On Thu, Oct 01, 2026 at 09:46:08AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Sep 30, 2026 at 12:51:20PM +0200, Jacopo Mondi wrote:
> > Add driver for the ams OSRAM Mira016 sensor.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mira016)
> > +{
> > +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > +	};
> > +	int ret;
> > +
> > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > +	if (!endpoint)
> > +		return -ENODEV;
> > +
> > +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Link frequencies: the driver supports a single link frequency,
> > +	 * no need to check bitmap after this call.
> > +	 */
> > +	ret = v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> > +				       ep_cfg.nr_of_link_frequencies,
> > +				       mira016_link_freqs,
> > +				       ARRAY_SIZE(mira016_link_freqs),
> > +				       &mira016->link_freq_bitmap);
> > +	if (ret) {
> > +		v4l2_fwnode_endpoint_free(&ep_cfg);
>
> I recall commenting about this at in least three occasions earlier.

And, again, I have replied twice to your comment without receiving a
response: https://lore.kernel.org/linux-media/arPJ_-yKVMXE-Gav@zed/

I'll repeat here anyway: do not mix cleanups and gotos. In this case
it's harmless, but why contradict the usage notes to avoid typing out
v4l2_fwnode_endpoint_free() 2 times ?

>
> Also applies to the other driver.
>
> > +		return ret;
> > +	}
> > +
> > +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> > +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > +		dev_err(dev, "Continuous clock is not supported\n");
> > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > +		return -EINVAL;
> > +	}
> > +
> > +	mira016->bus_config = ep_cfg.bus.mipi_csi2.flags;
> > +
> > +	v4l2_fwnode_endpoint_free(&ep_cfg);
> > +
> > +	return 0;
> > +}
>
> --
> Regards,
>
> Sakari Ailus
