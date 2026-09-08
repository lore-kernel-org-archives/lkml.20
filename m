Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266394E2348;
	Tue,  8 Sep 2026 10:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863649; cv=none; b=Hk334kiwCNE7kyaeB1el5XnXIEdi2xtJ1O8h/ViKx66SfDKZC7WY4j2IJykvZvKHMcMnTgAWMt0oH4nwRYhBjyNQddl9G1xz313e9KNkwXnyFqUYTzC8OeKHNo42HQD00gtX5EOVncMaZiawfbLNtVEZxuFu6s7LEjXzMV55ss4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863649; c=relaxed/simple;
	bh=peChoFfnq+wUPZxihOU08hVx9Od5iCWNh7u/2bUA3zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMxi3VjTHtheLYrxTs5ur55R69NxbPpsGZOQBseUJm8/FS6NOSm3d0us3GZe3u/ygZwfO2g2UZtqTLwqaRy/TIO1e6///HCoeZ78DkhdYNFhI57FlAvdX1cijYW20Vdbc4CSa6UloBzrtR2y3QUQyQ4Q0GmtnhY5MXv2QFDlOY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S8Kpb286; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S8Kpb286"
Received: from ideasonboard.com (mob-109-113-65-131.net.vodafone.it [109.113.65.131])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50208C13;
	Tue,  8 Sep 2026 12:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788863548;
	bh=peChoFfnq+wUPZxihOU08hVx9Od5iCWNh7u/2bUA3zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8Kpb286ftEwzHuz4jfXN1Wg/32NtoQEyhj6de1rym8ZiyPCJntVzA9zidjmCxrtB
	 MPQzoLFB8zjvVV6wy3hO9uDOgwSeUS4a67AHPVZhBJvxH6yrSA5qgc5SnwL4qUGRg+
	 vHrseg212hhbI3q39ypA1rbCgvQW75FLj35nDcUQ=
Date: Tue, 8 Sep 2026 12:34:00 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ap_kY7s1545jn1xz@zed>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
 <20260904-mira016-v2-2-1dcf7b3a807e@ideasonboard.com>
 <ap3M0h2S6EFpuC2T@kekkonen.localdomain>
 <ap5n7OyZrI0KzzN-@zed>
 <ap-1tDtGCWGc9Hvs@zed>
 <ap_DfdHTa0cQe1LH@kekkonen.localdomain>
 <ap_TUa3D0-ZGnrXy@zed>
 <ap_fLLHSEmw0J8yN@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ap_fLLHSEmw0J8yN@kekkonen.localdomain>

Hi Sakari

On Tue, Sep 08, 2026 at 01:10:52PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Sep 08, 2026 at 11:21:51AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Tue, Sep 08, 2026 at 11:12:45AM +0300, Sakari Ailus wrote:
> > > On Tue, Sep 08, 2026 at 09:17:15AM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari
> > > >
> > > > On Mon, Sep 07, 2026 at 09:45:16AM +0200, Jacopo Mondi wrote:
> > > > > Hi Sakari, thanks for the review
> > > > >
> > > >
> > > > [snip]
> > > >
> > > > > > > +
> > > > > > > +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mira016)
> > > > > > > +{
> > > > > > > +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> > > > > > > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > > > > > > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > > > > > +	};
> > > > > > > +
> > > > > > > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > > > > > +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg))
> > > > > > > +		return dev_err_probe(dev, -EINVAL, "Failed to parse endpoint\n");
> > > > > >
> > > > > > Don't mask error codes! Just return the error code returned by
> > > > > > v4l2_fwnode_endpoint_alloc_parse().
> > > > > >
> > > > >
> > > > > With PTR_ERR() I presume
> > > > >
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Link frequencies: the driver supports a single link frequency,
> > > > > > > +	 * no need to check bitmap after this call.
> > > > > > > +	 */
> > > > > > > +	if (v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> > > > > > > +				     ep_cfg.nr_of_link_frequencies,
> > > > > > > +				     mira016_link_freqs,
> > > > > > > +				     ARRAY_SIZE(mira016_link_freqs),
> > > > > > > +				     &mira016->link_freq_bitmap)) {
> > > > > >
> > > > > > Ditto.
> > > > > >
> > > > > > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> > > > > > > +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > > > > > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > > > > >
> > > > > > Instead of callind v4l2_fwnode_endpoint_free() here and above, I'd add a
> > > > > > label for error handling.
> > > > > >
> > > > >
                   ^
                   |-- Here ?

> > > > > ack
> > > >
> > > > I'll actually backtrack on this.
> > > >
> > > > Sashiko pointed out that mixing gotos and cleanups is probably not a good idea
> > > > and this time, the bot is right.
> > >
> > > I'm not quite sure what you mean. The general practice is that if error
> > > handling is trivial and there's only a single location to unwind something,
> > > you should do it on the site. In more complex cases use labels and gotos.
> > > That's what we have here. (There are of course more complicated cases where
> > > it's not that simple, but this isn't what we're discussing here.)
> >
> > include/linux/cleanup.h
> >
> >  * Lastly, given that the benefit of cleanup helpers is removal of
> >  * "goto", and that the "goto" statement can jump between scopes, the
> >  * expectation is that usage of "goto" and cleanup helpers is never
> >  * mixed in the same function. I.e. for a given routine, convert all
> >  * resources that need a "goto" cleanup to scope-based cleanup, or
> >  * convert none of them.
> >
> > I take it as "do not mix gotos and cleanups"
> >
> > As the 2 cleanup paths are trivial, I would rather do not mix the two.
>
> I don't recall asking for that.
>

Anyway, in v3 I added gotos, in the next version I removed it.

> --
> Sakari Ailus
