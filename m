Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DA23A7F6E;
	Tue,  8 Sep 2026 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855169; cv=none; b=JoFlWIAUc3vEzd4cAE468MOIHgl4M1ACSzxJld4onCiocIo8O3WZGIGnTVBLO6jk1oURbma+8mYyDdNdQzGWk6GAletkeyBI2JXXRZpBWSx6b8Eo31TjfeBPkraql+RcUhVhrDFijaSuYbJWdpLTDBFbOycGFNiF/rSaWqVNMYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855169; c=relaxed/simple;
	bh=x+59V6QVPdZd1RB11vMlKZq02WAPGG7wz+JyTRzkurs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrryyVAvLGfmCorYqno/FHvq8LK5Evl2AZmKjmd583aql+2nx4EF0KYd3MiY+bjj6P2Qo3IlFmHSAygoeL1YQOXWgBe1Oa+WD241uFqjrK6T4Bysl8gka/j3MaYc8gqmvLzzajkJTcZOQ4WW4W09giTn0Mu2C421UQEvzCo5Nuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfKw1eEr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfKw1eEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855167; x=1820391167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x+59V6QVPdZd1RB11vMlKZq02WAPGG7wz+JyTRzkurs=;
  b=AfKw1eErOyG2PxdxKTP0FTs1MJa2ZlDWdqxSNUg9P0Urb/ScqUhWVhxq
   8JMh2OUrG0VoaPOiBg4KymkLuqj7vUJLBZXrADcdo8M0pEOZ+SDMnR5Jk
   t+Pwg7sLCrIqNcTTyHEx40GKUNnEyVGHk0jJmmOt9/R2Muzitr+Ej/wSY
   1P6rMXmp/ZQ6h2MvU44kOSSFgfntHoV1vhB6/zNZKbbwMGdQGuTWyQ0bb
   OaB7JOeZJUmhh58laqxFISYSAGXooZ0nxg8jRZIr62nzTMtd0GeQoc5yn
   UDTrDJhc0Iwv60kj8+BCaogxnZUCDVSTTOIFRU0/RxoHHwxwPkf5vwDwk
   g==;
X-CSE-ConnectionGUID: V78cyBq4TEOitYZna85LZg==
X-CSE-MsgGUID: mlgnbdPIT8u35JF+bOIdjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76810433"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="76810433"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:12:46 -0700
X-CSE-ConnectionGUID: lqXlvJeJSCuMV049azwnqQ==
X-CSE-MsgGUID: /Ng6qplmQ4mj19rJuP37FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269195508"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:12:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 92F3811FA3A;
	Tue, 08 Sep 2026 11:12:45 +0300 (EEST)
Date: Tue, 8 Sep 2026 11:12:45 +0300
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
Message-ID: <ap_DfdHTa0cQe1LH@kekkonen.localdomain>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
 <20260904-mira016-v2-2-1dcf7b3a807e@ideasonboard.com>
 <ap3M0h2S6EFpuC2T@kekkonen.localdomain>
 <ap5n7OyZrI0KzzN-@zed>
 <ap-1tDtGCWGc9Hvs@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap-1tDtGCWGc9Hvs@zed>

On Tue, Sep 08, 2026 at 09:17:15AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Sep 07, 2026 at 09:45:16AM +0200, Jacopo Mondi wrote:
> > Hi Sakari, thanks for the review
> >
> 
> [snip]
> 
> > > > +
> > > > +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mira016)
> > > > +{
> > > > +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> > > > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > > > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > > +	};
> > > > +
> > > > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > > +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg))
> > > > +		return dev_err_probe(dev, -EINVAL, "Failed to parse endpoint\n");
> > >
> > > Don't mask error codes! Just return the error code returned by
> > > v4l2_fwnode_endpoint_alloc_parse().
> > >
> >
> > With PTR_ERR() I presume
> >
> > > > +
> > > > +	/*
> > > > +	 * Link frequencies: the driver supports a single link frequency,
> > > > +	 * no need to check bitmap after this call.
> > > > +	 */
> > > > +	if (v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> > > > +				     ep_cfg.nr_of_link_frequencies,
> > > > +				     mira016_link_freqs,
> > > > +				     ARRAY_SIZE(mira016_link_freqs),
> > > > +				     &mira016->link_freq_bitmap)) {
> > >
> > > Ditto.
> > >
> > > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> > > > +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > >
> > > Instead of callind v4l2_fwnode_endpoint_free() here and above, I'd add a
> > > label for error handling.
> > >
> >
> > ack
> 
> I'll actually backtrack on this.
> 
> Sashiko pointed out that mixing gotos and cleanups is probably not a good idea
> and this time, the bot is right.

I'm not quite sure what you mean. The general practice is that if error
handling is trivial and there's only a single location to unwind something,
you should do it on the site. In more complex cases use labels and gotos.
That's what we have here. (There are of course more complicated cases where
it's not that simple, but this isn't what we're discussing here.)

-- 
Sakari Ailus
