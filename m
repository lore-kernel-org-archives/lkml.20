Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA023EDAAE;
	Thu,  1 Oct 2026 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841162; cv=none; b=BSKWneotbtafyrBSXE0ld/ts5gYEXXuPNayEE155/DYNTlaXDfMiFgR0AKQB9JktF8SG1fDESmOegLdCZXynRQW0h5kRk3kLlcdsPJ7GT4lG2457I/ZTHC+wNI311sTFpYMHYirVRMLUASn2TFV67BZ1NJi54T+xCgZqhbtOylw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841162; c=relaxed/simple;
	bh=j8pnUYyTEBPUJ3+BBmab725EHgwQiNp5ebXhSLWXnXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlyXm4ArhG8G65JvrWYUkAKpPJ9sz4tdqjPtOEzKpbWa/aW6i2RLvLwWY/FeMV6bV9TLKmaMzGfHZi/Ao+wAB0JoA/6ZkaSigvfY5VDSdL64XQ8udCtBIHRshhF2GmJtgPZ/t8pwFRfabYVEm0oLxbJ9X0LVHsO+NRHbZWxv8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdwZDTZn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdwZDTZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790841161; x=1822377161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j8pnUYyTEBPUJ3+BBmab725EHgwQiNp5ebXhSLWXnXc=;
  b=UdwZDTZnhAAXol7HKWV6MLNlFqjrvxjNm7VTw7RNrZyonuonfDRZ6NJA
   t4+FoOLHYWQyp0zKndg+joCdO6ODStnqYn8rsAvCSfxCTrBzAApCW9zk8
   7vX6rMTatYWCvi0xmIDfmVmmnyEqhXk925kxECok0ekjRlVm8yH9tTJZf
   SqziSFDwvnEVHHS2VKTTBQsPzPzOOOzkUgXMMFWvzLr4D/qGeJWbPn3f1
   PLeqDc1TMCuZ/rnN4DIdzFgumG+VvQej6yzzJFL9ePOcLkCy9ZhfbfXFc
   cq9f5d8KABP8BhKT9KnqdMeDrlGEOY6pqwGxS2SyX3w0gQ2oZe94UBcPe
   g==;
X-CSE-ConnectionGUID: lTFgRwSNRXakYNtkok70uw==
X-CSE-MsgGUID: OAwkmD8aRh+4++0KnAAfog==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113379320"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="113379320"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:52:40 -0700
X-CSE-ConnectionGUID: C4og+XwwR2izuGN6ei35WQ==
X-CSE-MsgGUID: snE1L8qPQ36dbR8vZiA4LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275469580"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:52:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 76AE1121D05;
	Thu, 01 Oct 2026 10:52:35 +0300 (EEST)
Date: Thu, 1 Oct 2026 10:52:35 +0300
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
Subject: Re: [PATCH v5 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ar4RQ2OnP20BOhC7@kekkonen.localdomain>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
 <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
 <ar4BsDNOkcusy4Qz@kekkonen.localdomain>
 <ar4IKQHYzprZ3CPv@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar4IKQHYzprZ3CPv@zed>

Hi Jacopo,

On Thu, Oct 01, 2026 at 09:19:02AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Oct 01, 2026 at 09:46:08AM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Wed, Sep 30, 2026 at 12:51:20PM +0200, Jacopo Mondi wrote:
> > > Add driver for the ams OSRAM Mira016 sensor.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mira016)
> > > +{
> > > +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> > > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > +	};
> > > +	int ret;
> > > +
> > > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > +	if (!endpoint)
> > > +		return -ENODEV;
> > > +
> > > +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Link frequencies: the driver supports a single link frequency,
> > > +	 * no need to check bitmap after this call.
> > > +	 */
> > > +	ret = v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> > > +				       ep_cfg.nr_of_link_frequencies,
> > > +				       mira016_link_freqs,
> > > +				       ARRAY_SIZE(mira016_link_freqs),
> > > +				       &mira016->link_freq_bitmap);
> > > +	if (ret) {
> > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> >
> > I recall commenting about this at in least three occasions earlier.
> 
> And, again, I have replied twice to your comment without receiving a
> response: https://lore.kernel.org/linux-media/arPJ_-yKVMXE-Gav@zed/
> 
> I'll repeat here anyway: do not mix cleanups and gotos. In this case
> it's harmless, but why contradict the usage notes to avoid typing out
> v4l2_fwnode_endpoint_free() 2 times ?

It's not about typing but correct error handling. It's much easier to miss
unwinding whatever needs to be unwound in multiple places when you're not
using goto's.

In other words, the pattern you're following is bad, please stop using it.

> 
> >
> > Also applies to the other driver.
> >
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> > > +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > > +		dev_err(dev, "Continuous clock is not supported\n");
> > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	mira016->bus_config = ep_cfg.bus.mipi_csi2.flags;
> > > +
> > > +	v4l2_fwnode_endpoint_free(&ep_cfg);
> > > +
> > > +	return 0;
> > > +}
> >

-- 
Kind regards,

Sakari Ailus
