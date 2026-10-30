Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358945;
	b=ULRkBd1a/RtVJN/iJTg3wBuMsHBpkcJKQgCToCjIsHRlvIpgJBsVznvgjMT3PBb3gNWa
	 BonOK1HdEBEwRqq6n3xeTwgza2BQNuBUzUlgm8Je9jHSUgVllYO/d2pJ9h+gGJsaUCf12
	 Y1klAayZ9dc3+gWbBXT3NpykVeeGLwYGFqhVQhCtkjJXBqUvmuAZ9Ns9AToT+bOt/GVuO
	 /RKDgGgl3Ro5TOAPkP022obIE44ss1zm65Z9OFOzwzSeCJr/6SExgSECSxEicl893WLo8
	 qM0VZ1A0dDfQBs8b56whCL7uGduB+3VlEz24fPkbfIXY+DodNDxmXd2Ia24ZwuS0tog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358945;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8hSfFKZLcr4Vj9uXUxH0NwPinqQl70FDf0YhoVqgA4M=;
	b=VM26dpiC0uQHaHqvxtjbv73sLwS4NDceX0Sd9myHzzuGtxv/lAQp1NZM0Ry2yQ5F4oda
	 TnD3WD1Stg5ze75DgUWd2FMQvH8wwk/isbnP4GMQRc2Q6pT7MPZlRS6AwdbkqSLU3tvgZ
	 hag9+BAwSys2H5nzFzklV09O0187UZMGcyB0D3vHHqaRZwonI6+Soc2wEfb/UCI7YJ1J8
	 Dn/InJhqCFbToJpMEYV7wrdcIe/fARWjTcv0O/yHTJHXKZfH0L2xLeXn6y80LOimLiPaz
	 Sj1Mjfc27BejCobrt4MkpXMSgaU5HebKROC/RdqWkowdUO4fPkyAqeiMfAM8B0NbGgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ksjGaRkQ;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B3360A260B;
	Fri, 30 Oct 2026 11:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B3360A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ksjGaRkQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793358945; x=1824894945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+yLlQYWQxyhfRTtoPHcALwiDE7XLgGJw8areWO7Am+U=;
  b=ksjGaRkQe4lq/XRw+rG5tqJ77UEdEtdU2zLkN8vxqUWJOHG4ucESDW8c
   O3eNx0oR5DeokeP0rgeQawTELbNWzeIpaWJGEpXQ6qiEz7XoO6W29RCK1
   wEVElWJR+4Ds66Y5mQMayo53fjB1YqH45zHtIRvCDv+5Nhyvlgp7j+cic
   bK1WABtRQxrJ7EwYhW9kZrs2MNtrG6BLdzkCIWTbwi5aW57XmOgC4wVjZ
   5eu26/gHVT0OThYUA1nbM+954AqsMOVDoy4uAtpgBUoeGysWxvfQieqhB
   9bbINXpKtyK9cQjSY1EmonLAwhGFPAn1ZXVlAxxeM5f88XqGunveiNKMQ
   Q==;
X-CSE-ConnectionGUID: JUDCXk2STg2gyJUdkkKj+Q==
X-CSE-MsgGUID: rZtxv4WAQROEcysrMxgUeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2133133"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2133133"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:15:44 -0700
X-CSE-ConnectionGUID: roXvE3uJRo2zDBillbcoqg==
X-CSE-MsgGUID: wNtNA0WUR0WLAYaewFwsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5943847"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.19])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:15:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 64F76121BA9;
	Fri, 30 Oct 2026 13:15:48 +0200 (EET)
Date: Fri, 30 Oct 2026 13:15:48 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: jai.luthra@ideasonboard.com,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/15] media: i2c: os05b10: remove unused control
 fields, simplify error handling
Message-ID: <auR8ZL9cFjznhUgs@kekkonen.localdomain>
References: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
 <20261030104806.1223991-8-tarang.raval@siliconsignals.io>
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
In-Reply-To: <20261030104806.1223991-8-tarang.raval@siliconsignals.io>

Hi Tarang,

On Fri, Oct 30, 2026 at 04:17:56PM +0530, Tarang Raval wrote:
> link_freq and gain don't need to be stored in struct os05b10; make
> them local.
> 
> Parse the fwnode properties up front and register them before the
> single ctrl_hdlr->error check, so all controls are covered by one
> check and the per-control NULL guards before setting flags can be
> dropped.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/media/i2c/os05b10.c | 46 +++++++++++++++----------------------
>  1 file changed, 18 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 46d514d2a479..abcb7c766754 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -457,10 +457,8 @@ struct os05b10 {
>  
>  	/* V4L2 Controls */
>  	struct v4l2_ctrl_handler handler;
> -	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *vblank;
> -	struct v4l2_ctrl *gain;
>  	struct v4l2_ctrl *exposure;
>  
>  	u32 link_freq_index;
> @@ -920,8 +918,13 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>  	u64 hblank_def, vblank_def, exp_max, pixel_rate;
>  	struct v4l2_fwnode_device_properties props;
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	struct v4l2_ctrl *link_freq;
>  	int ret;
>  
> +	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
> +	if (ret)
> +	        return ret;
> +
>  	ctrl_hdlr = &os05b10->handler;
>  	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>  
> @@ -929,21 +932,16 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>  	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
>  			  pixel_rate, pixel_rate, 1, pixel_rate);
>  
> -	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
> -						    V4L2_CID_LINK_FREQ,
> -						    ARRAY_SIZE(link_frequencies) - 1,
> -						    os05b10->link_freq_index,
> -						    link_frequencies);
> -
> -	if (os05b10->link_freq)
> -		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
> +					   V4L2_CID_LINK_FREQ,
> +					   ARRAY_SIZE(link_frequencies) - 1,
> +					   os05b10->link_freq_index,
> +					   link_frequencies);
>  
>  	hblank_def = mode->hts - mode->width;
>  	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
>  					    hblank_def, hblank_def,
>  					    1, hblank_def);
> -	if (os05b10->hblank)
> -		os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
>  	vblank_def = mode->vts - mode->height;
>  	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> @@ -958,27 +956,19 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>  					      exp_max, OS05B10_EXPOSURE_STEP,
>  					      mode->exp);
>  
> -	os05b10->gain = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> -					  V4L2_CID_ANALOGUE_GAIN,
> -					  OS05B10_ANALOG_GAIN_MIN,
> -					  OS05B10_ANALOG_GAIN_MAX,
> -					  OS05B10_ANALOG_GAIN_STEP,
> -					  OS05B10_ANALOG_GAIN_DEFAULT);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  OS05B10_ANALOG_GAIN_MIN, OS05B10_ANALOG_GAIN_MAX,
> +			  OS05B10_ANALOG_GAIN_STEP, OS05B10_ANALOG_GAIN_DEFAULT);
>  
> -	if (ctrl_hdlr->error) {
> -		ret = ctrl_hdlr->error;
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
> +					      &props);
> +	if (ret) {
>  		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
>  		goto error;

If you're left with a single goto (hopefully that's the case), you can just
handle the error here (and avoid the goto).

>  	}
>  
> -	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
> -	if (ret)
> -		goto error;
> -
> -	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
> -					      &props);
> -	if (ret)
> -		goto error;
> +	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
>  	os05b10->sd.ctrl_handler = ctrl_hdlr;
>  

-- 
Regards,

Sakari Ailus
