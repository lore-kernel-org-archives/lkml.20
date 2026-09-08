Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052DF4F7991;
	Tue,  8 Sep 2026 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862258; cv=none; b=X+HYkNiIUehxnGclUqrj6LgLlA9+j90a1Yyj9Hxk87scSLs5pBb3VwsYFYStSbitBaDVGm111qzB68UAkMRdOj6mOG49PceTz8k6mnuAh74Kr423drGV7cvMuUUuz36T4ZFvgsZ3GL69KqfSeFsatgHMJ1JBQfNCqGqgyBaDkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862258; c=relaxed/simple;
	bh=qKnx0D28Jj6C3klzzYcvkc/kMUsORdfaOz83p13SD10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8RrBjwfHpZL194sRsy4n0YCDREK4WAp6hBEMbHnYE8zcF4/6cMCCP+o0DKH03K+7y0CJq9oC1E+5gDdWdvOdOuatO5hLUoRcVcax07CnQ9aY3Oe3RgOm+cCgvOm0vc0nyPcIH4nFk9dYxg0aXbl1pg/ijk9EcC+DqG7kxRoGps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBdlO5jd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBdlO5jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788862256; x=1820398256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qKnx0D28Jj6C3klzzYcvkc/kMUsORdfaOz83p13SD10=;
  b=lBdlO5jdAlQrj+HtBDl6V5T2+L7Z1jSP+/zJNngCahJIwgxjq+lW9cLW
   wcCtFOchDynUQhLGEairBBZ/21AQrA4Aedkdle1WfAmjYWJ750CxYIopt
   lz/xjV8PaCK55EPqmmZ2eI0vY1pKIN0D1gloKe8M2h4R8UWktam9sPkjD
   0q7MvGsyoVY22HOzwPUctl0mu0iEaXsy9iUaLU1AcTwQ6WjO9kH7g0ETo
   SGCfE4uz5qcYxmKqGeMvMHc/fJTlNfvcolJ/OmgC5ed71BTEoKHQfiKox
   D4GXKZl8iVJzuHxLTivGEb7+QvsaIl2PdL/3Wk85rexKPIvrXgyK6Nfps
   g==;
X-CSE-ConnectionGUID: DUsx6htURR2ibdz84vpz7A==
X-CSE-MsgGUID: s0uqgzISRM+L0+4AmMFKhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99853768"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="99853768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:10:53 -0700
X-CSE-ConnectionGUID: es+f+PFKRCytO+bPMOawrA==
X-CSE-MsgGUID: MJYa/lB2Rpese1QSksVqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274472907"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:10:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8CB4411F7F5;
	Tue, 08 Sep 2026 13:10:52 +0300 (EEST)
Date: Tue, 8 Sep 2026 13:10:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ap_fLLHSEmw0J8yN@kekkonen.localdomain>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
 <20260904-mira016-v2-2-1dcf7b3a807e@ideasonboard.com>
 <ap3M0h2S6EFpuC2T@kekkonen.localdomain>
 <ap5n7OyZrI0KzzN-@zed>
 <ap-1tDtGCWGc9Hvs@zed>
 <ap_DfdHTa0cQe1LH@kekkonen.localdomain>
 <ap_TUa3D0-ZGnrXy@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_TUa3D0-ZGnrXy@zed>

Hi Jacopo,

On Tue, Sep 08, 2026 at 11:21:51AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Sep 08, 2026 at 11:12:45AM +0300, Sakari Ailus wrote:
> > On Tue, Sep 08, 2026 at 09:17:15AM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Mon, Sep 07, 2026 at 09:45:16AM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari, thanks for the review
> > > >
> > >
> > > [snip]
> > >
> > > > > > +
> > > > > > +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mira016)
> > > > > > +{
> > > > > > +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> > > > > > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > > > > > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > > > > +	};
> > > > > > +
> > > > > > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > > > > +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg))
> > > > > > +		return dev_err_probe(dev, -EINVAL, "Failed to parse endpoint\n");
> > > > >
> > > > > Don't mask error codes! Just return the error code returned by
> > > > > v4l2_fwnode_endpoint_alloc_parse().
> > > > >
> > > >
> > > > With PTR_ERR() I presume
> > > >
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Link frequencies: the driver supports a single link frequency,
> > > > > > +	 * no need to check bitmap after this call.
> > > > > > +	 */
> > > > > > +	if (v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> > > > > > +				     ep_cfg.nr_of_link_frequencies,
> > > > > > +				     mira016_link_freqs,
> > > > > > +				     ARRAY_SIZE(mira016_link_freqs),
> > > > > > +				     &mira016->link_freq_bitmap)) {
> > > > >
> > > > > Ditto.
> > > > >
> > > > > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> > > > > > +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > > > > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > > > >
> > > > > Instead of callind v4l2_fwnode_endpoint_free() here and above, I'd add a
> > > > > label for error handling.
> > > > >
> > > >
> > > > ack
> > >
> > > I'll actually backtrack on this.
> > >
> > > Sashiko pointed out that mixing gotos and cleanups is probably not a good idea
> > > and this time, the bot is right.
> >
> > I'm not quite sure what you mean. The general practice is that if error
> > handling is trivial and there's only a single location to unwind something,
> > you should do it on the site. In more complex cases use labels and gotos.
> > That's what we have here. (There are of course more complicated cases where
> > it's not that simple, but this isn't what we're discussing here.)
> 
> include/linux/cleanup.h
> 
>  * Lastly, given that the benefit of cleanup helpers is removal of
>  * "goto", and that the "goto" statement can jump between scopes, the
>  * expectation is that usage of "goto" and cleanup helpers is never
>  * mixed in the same function. I.e. for a given routine, convert all
>  * resources that need a "goto" cleanup to scope-based cleanup, or
>  * convert none of them.
> 
> I take it as "do not mix gotos and cleanups"
> 
> As the 2 cleanup paths are trivial, I would rather do not mix the two.

I don't recall asking for that.

-- 
Sakari Ailus
