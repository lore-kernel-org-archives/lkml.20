Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11474D6C4A;
	Thu,  1 Oct 2026 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849251; cv=none; b=C1UPayifUbRsB64ZGugS40H260C/Q05t4vZ7G5CYlW5b1dk44F77MYmoDpscAr0oK0RazpLH7MeDiouSu/5v+xIAYVzSlRCotNBulN8qcZPwGD7TdQtkTqVSwe7xMf+FogmKK4bRC/tDb82AFqS43uvvqwT+2OxvI06BOAOzACI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849251; c=relaxed/simple;
	bh=CBFSA9BeY4t6/i9+jFeJRK4DM5K/GyNwSJwe+3JRIxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9hqfRPZqrTkk3Gn/WRJyAZtv22pHhXs/eEDgCVv2yE37MefzWo4C1Iy16ClCru+ROPiTr0M6B8dxXmQ35PvXbYhm78AqzmM4QtZYWay7qFReV+JA5s+VA2n0KnBzYzpQ+2bTEXT6Rs4nDzsifTunLeyQ/VFdBHrjna8wipEhHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tlMWDHl6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tlMWDHl6"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B484593;
	Thu,  1 Oct 2026 12:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790849126;
	bh=CBFSA9BeY4t6/i9+jFeJRK4DM5K/GyNwSJwe+3JRIxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlMWDHl64vujWZeEzx2c+11pprDphiIHT1/qMUDnEHDfOUdKHdSdgXKHv7e6d0FMu
	 6YXoWh3f4J1ApDGReTSbpwoiIkUTdEVV+RZ0u+hB+up5N8xUzFn01kSCoc2ELh9qOF
	 Pu1lt31Rn4Hfw8waTVftuooSHeAVcOi76atTt8hU=
Date: Thu, 1 Oct 2026 12:07:16 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ar4ve6qfiOVQc1Kd@zed>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
 <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
 <ar4BsDNOkcusy4Qz@kekkonen.localdomain>
 <ar4IKQHYzprZ3CPv@zed>
 <ar4RQ2OnP20BOhC7@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ar4RQ2OnP20BOhC7@kekkonen.localdomain>

On Thu, Oct 01, 2026 at 10:52:35AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Oct 01, 2026 at 09:19:02AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Thu, Oct 01, 2026 at 09:46:08AM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Wed, Sep 30, 2026 at 12:51:20PM +0200, Jacopo Mondi wrote:
> > > > Add driver for the ams OSRAM Mira016 sensor.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mira016)
> > > > +{
> > > > +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> > > > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > > > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > > +	};
> > > > +	int ret;
> > > > +
> > > > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > > +	if (!endpoint)
> > > > +		return -ENODEV;
> > > > +
> > > > +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/*
> > > > +	 * Link frequencies: the driver supports a single link frequency,
> > > > +	 * no need to check bitmap after this call.
> > > > +	 */
> > > > +	ret = v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> > > > +				       ep_cfg.nr_of_link_frequencies,
> > > > +				       mira016_link_freqs,
> > > > +				       ARRAY_SIZE(mira016_link_freqs),
> > > > +				       &mira016->link_freq_bitmap);
> > > > +	if (ret) {
> > > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > >
> > > I recall commenting about this at in least three occasions earlier.
> >
> > And, again, I have replied twice to your comment without receiving a
> > response: https://lore.kernel.org/linux-media/arPJ_-yKVMXE-Gav@zed/
> >
> > I'll repeat here anyway: do not mix cleanups and gotos. In this case
> > it's harmless, but why contradict the usage notes to avoid typing out
> > v4l2_fwnode_endpoint_free() 2 times ?
>
> It's not about typing but correct error handling. It's much easier to miss
> unwinding whatever needs to be unwound in multiple places when you're not
> using goto's.
>
> In other words, the pattern you're following is bad, please stop using it.
>

You seem to be missing my main point, and if you think it's not
correct please tell me why instead of keep repeating the same thing
over and over.

This routine uses cleanups because of

	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;

functions using cleanups shall not use gotos

from cleanup.h

 * Lastly, given that the benefit of cleanup helpers is removal of
 * "goto", and that the "goto" statement can jump between scopes, the
 * expectation is that usage of "goto" and cleanup helpers is never
 * mixed in the same function. I.e. for a given routine, convert all
 * resources that need a "goto" cleanup to scope-based cleanup, or
 * convert none of them.

As said, in this case is harmless, but given that this function might
be extended I wouldn't introduce a goto now to later having to care if
it gets in the way of the cleanup path or not.



> >
> > >
> > > Also applies to the other driver.
> > >
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> > > > +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > > > +		dev_err(dev, "Continuous clock is not supported\n");
> > > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	mira016->bus_config = ep_cfg.bus.mipi_csi2.flags;
> > > > +
> > > > +	v4l2_fwnode_endpoint_free(&ep_cfg);
> > > > +
> > > > +	return 0;
> > > > +}
> > >
>
> --
> Kind regards,
>
> Sakari Ailus
