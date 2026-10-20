Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490358;
	b=LIejhaDl0ITCH/vCHmcJxYG8O3qzCM1A7r3DtBDhV0Q7g6Kql4EDCA7PNK/WW+6BRPg0
	 yVMjmgF0qIsnbv8dRG8qiEWQxHkPvwiNboTMr/DXLnWpJrGl6Xar1FYNn7iF24wxvzlJx
	 seRfGPFgJxNn2u8BI3u7HS87vH+ZGRPaJV+M0kC+pxJe7jPO3ph+C3oxTJlWG2lt95zm+
	 6bqSEI8p+ncsycjYkVTIn7mGQ1XPZcELOsTrbsedPZgMe1zs6Zaqh0BX4WRjx9UvmOmCN
	 ub1/p8bjnQ3IkD66miydpzaNjZETyGo5cp5wzX3y1TNqegxQ78zBFrUpFtVvfIoQJgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490358;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LqP9Pj+kaCX0R1bbmtuTNHU6ZBYpAzwwNRJ+ZmbN+5Y=;
	b=T4Hmr/Pcp377cec+D+jakMrWub7AjLb5t1X6qYVMW0mESXKabhMhqedUKGrqy+VaHKoS
	 leceS2BfL8DS+TnMmgU57m8H0z5M5yRf+mTNzFYvg2USo/SQsv6kRAFNgJ2ygLXwiDWv6
	 ZEOrCBI2BBCL5q4hyrDXxGlroHXAQ4zIjyeGxzlyfhjNFgF5zLEhkx4Ovxs8Hf4mEXskQ
	 +s9hm5sFhW+UMMNVOA99wrTHWdepHmGxgVCZuMYrC4rhDTCJjPpFJ+xNh1Uy3GOKqe1wX
	 MfEYCG+6RpD0a4iYy42LpXk92v9eYOkV2tAFeX8I7GaGn6tZPI4KQHE3gjThQu2nXyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Prvg1kul;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D006606A31A;
	Tue, 20 Oct 2026 09:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D006606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Prvg1kul
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792490358; x=1824026358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R1/2gsHs7MqMU0fNGwqMem4SmtGuhTwAKpMY92Fy4fQ=;
  b=Prvg1kul/V95sCPSVQ4QfVlQDhyAA1gWl3qlavt94aiBtXxytYTkLSSn
   kZnWPKEmKFkfVQs2RsOsdkp7Bn8X/NLKdCNvfmCjjXlvY9lOrGva7DF2h
   n2A8fuH+MoweCW5BfFKPl2NYFf+RwGskVLl4RgTdQcuKSAAaTCf44GCEz
   3JFEVawAoBdedA9wDcsoAmDAxgIcGqNLwax+GvB0i2ANydZwnigvvqTJr
   RgG3993+jsOTkMmxr5uyDzAKS62ED++v2Ocqa3sVH8qlbHDSVnf1txn12
   6sBIamqhjj06umQcOB2jOcP9RroJ+/b4rhq+oAmR7WpmuobFAprVSux1W
   A==;
X-CSE-ConnectionGUID: AyTSkc79T/2Qbi+RjtdosA==
X-CSE-MsgGUID: 4p4Z6IB6Q8uiQsKO5NCl4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1091253"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1091253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:59:17 -0700
X-CSE-ConnectionGUID: f3sA2Gz/RK2ZSF2MJg1IAQ==
X-CSE-MsgGUID: a84GicMER8KpDFv1JWjI1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2670100"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:59:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AD28C11F7E8;
	Tue, 20 Oct 2026 12:59:11 +0300 (EEST)
Date: Tue, 20 Oct 2026 12:59:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 06/16] media: sony-starvis2: Allow runtime control of
 link frequency
Message-ID: <atc7b31V9uZ2kk4s@kekkonen.localdomain>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-6-75fcdb4163f3@raspberrypi.com>
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
In-Reply-To: <20261015-media-starvis2-v4-6-75fcdb4163f3@raspberrypi.com>

Hi Dave,

On Thu, Oct 15, 2026 at 04:57:32PM +0100, Dave Stevenson wrote:
> DT allows configuration of multiple link frequencies.
> V4L2_CID_LINK_FREQ allows read write control.
> 
> Join these up so that link frequency can be configured at run time,
> as long as the sensor isn't streaming.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/sony-starvis2.c | 75 ++++++++++++++++++++++++++++-----------
>  1 file changed, 55 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
> index 0edb0b4dd25f..02199336010e 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c
> @@ -725,6 +725,7 @@ struct starvis2 {
>  	struct v4l2_ctrl *exposure;
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *link_freq;
>  
>  	/* Track VMAX for exposure updates */
>  	u32 vmax;
> @@ -755,6 +756,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
>  	struct starvis2 *starvis2 = container_of_const(ctrl->handler, struct
>  						       starvis2, ctrl_handler);
>  	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
> +	const struct starvis2_variant *variant = starvis2->variant;
>  	const struct v4l2_mbus_framefmt *format;
>  	struct v4l2_subdev_state *state;
>  	int ret = 0;
> @@ -778,6 +780,25 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
>  			return ret;
>  	}
>  
> +	if (ctrl->id == V4L2_CID_LINK_FREQ) {
> +		u32 hmax = variant->hmax_min_link_freq[ctrl->val];
> +		s32 hblank;
> +
> +		if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
> +			hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
> +
> +		hblank = hmax * variant->pix_per_clk -
> +					variant->active_area.width;
> +
> +		ret = __v4l2_ctrl_modify_range(starvis2->hblank,
> +					       hblank,
> +					       starvis2->hblank->maximum,
> +					       starvis2->hblank->step,
> +					       hblank);

This fits on fewer lines.

> +		if (ret)
> +			return ret;
> +	}
> +
>  	/*
>  	 * Only apply control values when device is powered on (RPM ACTIVE)
>  	 * and streaming (usage count != 0)
> @@ -824,6 +845,12 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
>  		cci_write(starvis2->cci, STARVIS2_REG_WINMODEV, ctrl->val,
>  			  &ret);
>  		break;
> +	case V4L2_CID_LINK_FREQ:
> +		/* The STARVIS2_LINK_FREQ_ enums match up with the register */
> +		cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL, ctrl->val,
> +			  &ret);
> +		break;
> +
>  	default:
>  		dev_warn(&client->dev,
>  			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
> @@ -938,9 +965,6 @@ static int starvis2_write_common(struct starvis2 *starvis2)
>  
>  	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
>  		  &ret);
> -	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
> -		  __fls(starvis2->link_freq_bitmap),
> -		  &ret);
>  	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
>  		  &ret);
>  
> @@ -1018,6 +1042,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
>  		goto err_rpm_put;
>  	}
>  
> +	__v4l2_ctrl_grab(starvis2->link_freq, true);

An extra newline would be nice here.

>  	return 0;
>  
>  err_rpm_put:
> @@ -1042,6 +1067,8 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
>  
> +	__v4l2_ctrl_grab(starvis2->link_freq, false);
> +
>  	pm_runtime_put(&client->dev);
>  
>  	return ret;
> @@ -1208,7 +1235,6 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
>  	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
>  	const struct starvis2_variant *variant = starvis2->variant;
>  	struct v4l2_fwnode_device_properties props;
> -	struct v4l2_ctrl *link_freq;
>  	s32 hblank, max_hblank, vblank, max_vblank;
>  	u32 hmax;
>  	int ret;
> @@ -1224,25 +1250,26 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
>  
>  	starvis2->vmax = starvis2->variant->vmax_default;
>  
> -	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
> -	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
> -		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
> -
>  	/* PIXEL_RATE is fixed and read-only */
>  	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
>  			  starvis2->variant->pixel_rate,
>  			  starvis2->variant->pixel_rate, 1,
>  			  starvis2->variant->pixel_rate);
>  
> -	/* LINK_FREQ is also read only */
> -	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
> -					   V4L2_CID_LINK_FREQ,
> -					   ARRAY_SIZE(link_freqs) - 1,
> -					   __ffs(starvis2->link_freq_bitmap),
> -					   link_freqs);
> -
> -	if (link_freq)
> -		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	starvis2->link_freq =
> +		v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ,
> +				       __fls(starvis2->link_freq_bitmap),
> +				       __ffs(starvis2->link_freq_bitmap),
> +				       link_freqs);
> +	if (!starvis2->link_freq)
> +		goto err_free_handler;
> +
> +	v4l2_ctrl_modify_range(starvis2->link_freq,
> +			       __ffs(starvis2->link_freq_bitmap),
> +			       __fls(starvis2->link_freq_bitmap),
> +			       ~(starvis2->link_freq_bitmap),

No need for parentheses.

> +			       __ffs(starvis2->link_freq_bitmap));
>  
>  	vblank = starvis2->vmax - starvis2->variant->active_area.height;
>  	max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
> @@ -1250,6 +1277,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
>  					     V4L2_CID_VBLANK, vblank, max_vblank,
>  					     2, vblank);
>  
> +	hmax = variant->hmax_min_link_freq[starvis2->link_freq->val];
> +	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
> +		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
> +
>  	hblank = hmax * starvis2->variant->pix_per_clk -
>  					starvis2->variant->active_area.width;
>  	max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -
> @@ -1285,16 +1316,20 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
>  	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &starvis2_ctrl_ops, &props);
>  
>  	if (ctrl_hdlr->error) {
> -		ret = ctrl_hdlr->error;
>  		dev_err(&client->dev, "%s control init failed (%d)\n",
>  			__func__, ret);
> -		v4l2_ctrl_handler_free(ctrl_hdlr);
> -		return ret;
> +		goto err_free_handler;
>  	}
>  
>  	starvis2->sd.ctrl_handler = ctrl_hdlr;
>  
>  	return 0;
> +
> +err_free_handler:
> +	ret = ctrl_hdlr->error;
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +	return ret;

The error codes will be ctrl_hdlr->error here so you could omit assigning
to ret. You're actually doing that twice above. :-)

>  }
>  
>  static int starvis2_check_hwcfg(struct device *dev, struct starvis2 *starvis2)
> 

-- 
Regards,

Sakari Ailus
