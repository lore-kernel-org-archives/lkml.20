Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7624547059;
	Thu,  1 Oct 2026 06:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837177; cv=none; b=Hoy6QE1fAj30wWj5ZZyW8TTO+T+EDLoGbOt6zwt5P8yptiVDPKoX10B17WTfzXshBZVEFjnqUKl11arDz+yU6UMhWPntk5D2C+raz/XP+dcWRmKPvsKMhbGpPc9TzLn/m4/ileRwO45KPVL1f7uKzZ5SAUOsjG7nWpU3wMy7NuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837177; c=relaxed/simple;
	bh=9XG3NnyEazFzFaeMLAgpuysfjEoeCrXwje5Lonk2mF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwLwg0IsX1nb5NgpHerDAcuCeW8DKOM/djnfoPRKeyUR75Mql6yyuTk59ZgdbxvlvhRNQiM/N33eQS9+BO0y17qGt4DZNvCR0IPc7pFd8+MxRgG3Yvshw08WsKpJWv3Nuk6GLH9ZWBEoDsxm5KCi7VbIg/cmiswBJCCCn4M1/rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoOGl8vu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoOGl8vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790837175; x=1822373175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9XG3NnyEazFzFaeMLAgpuysfjEoeCrXwje5Lonk2mF0=;
  b=WoOGl8vutGralDs2cBiF2J/OqLkmt+qdofw5BBP6dMNalxEGipZYSwq4
   d1q1rzUzY6T1QkuUNYpzWZWpwznSgtFj0BzHVCxa7tHUPnTElMxwAO2lU
   qqHbpH93AKVmp6dCkSllv05e6okLhnhC31CZfMhga2trthbJkMPn7ztOI
   JSRGl2iOZTk+KfqEKWGz6aiaXiQuYJjwXAhxmj3ZNtbp7D8voyRBWX4yP
   CRD5Hxp7Bc3PHg0GDznpnZMK7ehOpbTmcnBV8X+LEtcaXY+89gYf8KaHK
   Tox4/ogwvQ/yDhg5bJ7KcuyVCGCFSbcSOyZvjYBfjykw4Ie/+j62HLvt6
   g==;
X-CSE-ConnectionGUID: nou0bfUuSvqb9iHq7Vw3Jw==
X-CSE-MsgGUID: PoNt8qEGQq69LVDwBhHMAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90620666"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90620666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:46:13 -0700
X-CSE-ConnectionGUID: JHix8IX1Tt6emvYTEQkXyA==
X-CSE-MsgGUID: UQaPFTEcTMyu7O+xhq3DTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="283970288"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:46:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 21A45121B95;
	Thu, 01 Oct 2026 09:46:08 +0300 (EEST)
Date: Thu, 1 Oct 2026 09:46:08 +0300
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
Message-ID: <ar4BsDNOkcusy4Qz@kekkonen.localdomain>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
 <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>

Hi Jacopo,

On Wed, Sep 30, 2026 at 12:51:20PM +0200, Jacopo Mondi wrote:
> Add driver for the ams OSRAM Mira016 sensor.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mira016)
> +{
> +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> +	struct v4l2_fwnode_endpoint ep_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	int ret;
> +
> +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +	if (!endpoint)
> +		return -ENODEV;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Link frequencies: the driver supports a single link frequency,
> +	 * no need to check bitmap after this call.
> +	 */
> +	ret = v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> +				       ep_cfg.nr_of_link_frequencies,
> +				       mira016_link_freqs,
> +				       ARRAY_SIZE(mira016_link_freqs),
> +				       &mira016->link_freq_bitmap);
> +	if (ret) {
> +		v4l2_fwnode_endpoint_free(&ep_cfg);

I recall commenting about this at in least three occasions earlier.

Also applies to the other driver.

> +		return ret;
> +	}
> +
> +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> +		dev_err(dev, "Continuous clock is not supported\n");
> +		v4l2_fwnode_endpoint_free(&ep_cfg);
> +		return -EINVAL;
> +	}
> +
> +	mira016->bus_config = ep_cfg.bus.mipi_csi2.flags;
> +
> +	v4l2_fwnode_endpoint_free(&ep_cfg);
> +
> +	return 0;
> +}

-- 
Regards,

Sakari Ailus
