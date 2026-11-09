Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225541;
	b=2JdhJE3P0VEVuBPYGzGbv8W7+Nofw4X6zmTIFxtkrjlxZ10R2Ljz3g1mE4wrc1PO170X
	 5O7nqGZkVG1HPsLOodc4l6F1db/S+oiqBM9scCI7qr+h+bQ2OVuSn+9l+kfh5zs0LNjfD
	 nEkX8QB73C0A+MrH099uzm9JBiKrgZhPsuErSncSCpATioeGos/cYeypTTT2nTPrGenP3
	 aNG/O7y3zL/klTiR+VfWy2sZ3vy/EVsp4XNhbym/yvReAia7Th5Pz2FaL36cUD/n6ViaM
	 c0wq3/LZqvGs1coHxnHHw8JkBu3BVp2hgbBg54gOAoKHBc6qNcct7XIEsNsfW2+V1Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225541;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4cqX7I6kCs2sET6c6dxg/dwRXSBXOjJ3gpgCvazazBQ=;
	b=LxxIr/7paw6oWNavRFimvOAWQG5Tiq9d6cX/uPMMOCoUH8T3+T5bf/J8hn2K9uQs47lj
	 TKyCnuu9yryxNoR4zzJM6oNwwaPWol+Q5Nm3xVQenbdchzBb1jXNlg2UpPoBdP1eBNpMK
	 JDqStt6O437zBIYkZJJdTjLfEU+kTi9/Wkvi7ysTi+I9rKyQlUXqMAKUDgzGl99bAbgTG
	 5mrjr/k9liDd/DR9xsRKnBkAcY4GH3lSMjKk3VoL1LbqWQFawHX6yaxdHUVUocbUfOr8/
	 0HTeEgDovL3ReeEIljpWjMu3oBPi32/lz5HnwZjO2PEuW1OUV9gkwSneYq2UvUHPBkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NH4Boy0i;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F44606A31C;
	Mon,  9 Nov 2026 11:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NH4Boy0i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794225541; x=1825761541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GrczUdpZDKAB5EGJcV+VNGB6hbqv9b5shiPuAHQYSpY=;
  b=NH4Boy0i/KDJy7wBbQAHXsvlUoShPEXuVSsmNcl0ejNxQsmfYuppMWa1
   MJGfVosahm4uamibnDKCQJ7ATKmwji5O8ROmzJvEu0uYBEpbMYF5EzFvW
   MK7M2eHw5h7X5PERnaA5/s/usarcFPz183L0zb1J2Pj/xAcDxwEBu+Zgv
   VTktJMSrk0s8v0b3Y8HnSREsSXsmq9GgEYdjFUCgarm3zpdup9JqrcFLg
   w+hdDxMSAnYpZG5yf5P9RmO/a0bKoIOxJz9q06jpazGldLAQPApAcfols
   Ar/nHkYPIvt0ckrR6eQyBxGdh3SCGiG9mucm9OdSXMBoDkEdBTzcRp2ai
   A==;
X-CSE-ConnectionGUID: mz2waVY6TaiZ7XY101WP1g==
X-CSE-MsgGUID: 20ErfFnnREqRBwX1kTxlqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3046961"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3046961"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:59:00 -0800
X-CSE-ConnectionGUID: 2Gk/Hdx3SfC/I/Wuy4Mqjw==
X-CSE-MsgGUID: HzfgnlaMQkSDDJ6JeVgj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9706720"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:58:59 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C896E121B96;
	Mon, 09 Nov 2026 13:58:55 +0200 (EET)
Date: Mon, 9 Nov 2026 13:58:55 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: tin.posavec04@gmail.com
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: ov9734: Return -EPROBE_DEFER if no
 endpoint is found
Message-ID: <avG1f6OUHUeHSgeA@kekkonen.localdomain>
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
 <20261017-ov9734-ipu6-v1-1-86eab22ae258@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-ov9734-ipu6-v1-1-86eab22ae258@gmail.com>

Hi Tin,

On Sat, Oct 17, 2026 at 10:31:57AM +0200, Tin Posavec via B4 Relay wrote:
> From: Tin Posavec <tin.posavec04@gmail.com>
> 
> With ipu-bridge, the fwnode graph endpoint of the sensor is only created
> when ipu-bridge is initialized, which may happen after the sensor driver
> has first probed. ov9734_check_hwcfg() then returns -ENXIO, so the probe
> fails and is not retried, and the sensor stays unbound.
> 
> Return -EPROBE_DEFER instead, as several other sensor drivers used with
> ipu-bridge do (e.g. ov2740 and hi556), and use dev_err_probe() to record
> the reason for the deferral.
> 
> Also log an error when parsing the endpoint fails, as the link
> frequency checks already do, and drop the generic error message from
> probe, which would otherwise be logged on every deferred probe attempt.
> 
> Assisted-by: LLM
> Signed-off-by: Tin Posavec <tin.posavec04@gmail.com>
> ---
>  drivers/media/i2c/ov9734.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
> index 8f39609ad..f9280ef0e 100644
> --- a/drivers/media/i2c/ov9734.c
> +++ b/drivers/media/i2c/ov9734.c
> @@ -837,14 +837,19 @@ static int ov9734_check_hwcfg(struct device *dev)
>  	if (!fwnode)
>  		return -ENXIO;
>  
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
> +	 * wait for this.
> +	 */
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>  	if (!ep)
> -		return -ENXIO;
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");
>  

Omit this error check altogether: v4l2_fwnode_endpoint_alloc_parse()
already does it.

>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>  	fwnode_handle_put(ep);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
>  
>  	if (!bus_cfg.nr_of_link_frequencies) {
>  		dev_err(dev, "no link frequencies defined");
> @@ -893,11 +898,8 @@ static int ov9734_probe(struct i2c_client *client)
>  	int ret;
>  
>  	ret = ov9734_check_hwcfg(&client->dev);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to check HW configuration: %d",
> -			ret);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	ov9734 = devm_kzalloc(&client->dev, sizeof(*ov9734), GFP_KERNEL);
>  	if (!ov9734)
> 

-- 
Regards,

Sakari Ailus
