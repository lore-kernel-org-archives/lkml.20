Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F164C2D73B9;
	Thu, 27 Aug 2026 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841172; cv=none; b=PnPNZgrDi4WD/o8IcTTsgcqSKUZEaCvfhL/keNVJKWiVXY1joLj6zurIDZpn4adIc/P11fNtun4uLRurBVUFvPcixyMH2bVScrkiTn6vEJRWosrHFcLnBvVebRPdF82WBCUkkgRupgWJwH7rWyJse2ZE8v5ihUcX17KzxFrzxAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841172; c=relaxed/simple;
	bh=z5Pi0VPfTvC7nqMX0V205C3Qmo8YbY5AiDLIxa9ThB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n10GZ1WEJWuRm4JxHqS6P6WQiSOxGT5MeF5H/nBPHc2VLHIuYU3lR19nWMP+HVinUHUgeNTAg3nYFK6X3/SeYXKunbA/hnALvv8pCwacOmndiWHYweqYXXit6MLtoQZoU6qK4kR1JhYXftSSFMjNXWQPtl+/GD+XchG3n7/FN1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8Asmg2K; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8Asmg2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787841170; x=1819377170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z5Pi0VPfTvC7nqMX0V205C3Qmo8YbY5AiDLIxa9ThB4=;
  b=W8Asmg2KtvuQwfsnEZ61gOf5i2ttia48PDuBczkZmPq0N4YX97fTRkED
   MP4zrS6k1aSzksBTtcOTeCjaGCiQiVyQMmCS/tSX1bCTJaMp1Pw2r5d+J
   mdjy1VoMnv4ZRHmWxDBll8Y5EmspWE47eRu6L0SWZ2Bd9j2aptElv1/E0
   rc6qSqvH50XK8THYJKpDOmNS/Sooee1Ed45FELZ9VoK8ki/YT7s7g5owy
   VPVOsxLDoQn7+wNYbmJ6Vfut4ouNFuUkOzcGO/hgCOu4vMC4i7zXxwVAB
   PAP0nJFCuMKbQfn+kI8p0gbRtC9IfKZo/dZ+BeslaF06wUIXP+YuEz1t4
   A==;
X-CSE-ConnectionGUID: /qSVKL43SC2rTYEbDyPKtw==
X-CSE-MsgGUID: 0A0QA7azRViz0yBaNMGkSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98676606"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="98676606"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:32:49 -0700
X-CSE-ConnectionGUID: jAfuLjBxS5K96+QewPIuag==
X-CSE-MsgGUID: Yteh2gwlQeOPIesoS59t8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="266095813"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:32:46 -0700
Date: Thu, 27 Aug 2026 17:32:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] media: ov2740: add manual white balance controls
Message-ID: <apBKi1MJI5pMwPUh@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-7-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132256.3343451-7-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 03:22:54PM +0200, Maurizio Casciano wrote:
> The sensor has separate red, green and blue manual white-balance gain
> registers, but the driver currently writes the same digital-gain value
> to all three channels. This prevents userspace from correcting the
> strong color cast of raw Bayer capture.
> 
> Expose red- and blue-balance controls relative to the digital gain,
> update all three channels under group hold, and always release and
> launch the group even when a channel write fails.
> 
> Tested on the Yoga Book OV2740 with live gain changes and continuous raw
> capture.

...

> -static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
> +static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
>  {
> -	int ret;
> +	u32 green_gain = ov2740->digital_gain->val;
> +	u32 red_gain, blue_gain;

Split assignment and combine all three on a single line.
Also, why not u64 from the start?

> +	int end_ret, launch_ret, ret;
> +
> +	/* Balance controls use 1024 as unity relative to the digital gain. */
> +	red_gain = min_t(u64,

No min_t() in the new code. This macro is very exceptional.

> +			 DIV_ROUND_CLOSEST_ULL((u64)green_gain *
> +					       ov2740->red_balance->val,
> +					       OV2740_DGTL_GAIN_DEFAULT),

Is _ULL variant really required? What are the ranges of the _gain and ->val?

> +			 OV2740_DGTL_GAIN_MAX);
> +	blue_gain = min_t(u64,
> +			  DIV_ROUND_CLOSEST_ULL((u64)green_gain *
> +						ov2740->blue_balance->val,
> +						OV2740_DGTL_GAIN_DEFAULT),
> +			  OV2740_DGTL_GAIN_MAX);
>  
>  	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
>  			       OV2740_GROUP_HOLD_START);
>  	if (ret)
>  		return ret;
>  
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
>  	if (ret)
> -		return ret;
> +		goto release_group;
>  
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, green_gain);
>  	if (ret)
> -		return ret;
> +		goto release_group;
>  
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
> -	if (ret)
> -		return ret;
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, blue_gain);
>  
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
> -			       OV2740_GROUP_HOLD_END);
> -	if (ret)
> -		return ret;
> +release_group:
> +	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
> +				   OV2740_GROUP_HOLD_END);
> +	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
> +				      OV2740_GROUP_HOLD_LAUNCH);
>  
> -	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
> -			       OV2740_GROUP_HOLD_LAUNCH);
> -	return ret;
> +	return ret ?: end_ret ?: launch_ret;

To make this looking better it might be good to convert the driver to use CCI
accessors [1]. Maybe Hans knows more about this as he worked a lot on this drivers
and sensors in the past.

>  }

[1]: include/media/v4l2-cci.h

-- 
With Best Regards,
Andy Shevchenko


