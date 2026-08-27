Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00EA368D7A;
	Thu, 27 Aug 2026 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861045; cv=none; b=QU23NP5ttMHLZeW6Us/47VHc55/HBlIVun20z0GchOLkGBrsffJ+X8KrK3wP5YCrVOByruH7e1kdZnS6ThQ04/H+bq02KVtcx1jx1d4GtXfplnNN3xILovLe2Zldat5sI7o9Lnr2IlHO+na1e424l1HJCuj2yz+byPNgmW8/gS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861045; c=relaxed/simple;
	bh=m5EnKMuWOjf0Ww6jocuZe0jZTZlfTK2Vpjk68B3mk1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9Y+RVY6pxgswot3edMZ9tmvY20fFSbmlv9J1NKS4YmppO1SIL4POL9jrYulAMWb+VfpG7qAH1Bqibnh0Wosz0HqM/zZ2etU2r+lhLkyXwBnzSeVG8PQ6x+br1tgzDllcWxn87TeRcbdOAyY5Jsd0hoQqSAetm8GyNW8wgphMmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4RQLR8r; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4RQLR8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787861044; x=1819397044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m5EnKMuWOjf0Ww6jocuZe0jZTZlfTK2Vpjk68B3mk1w=;
  b=h4RQLR8rOiGbk6gUWSfIq8Fnk91b+91b/AxH5pvplHm0TpwCPhu362+q
   EU6U6Y8kXGmnFEa3pXvUR1bppzto0GOZRVNq3oAr414jQiI7GwofhIBwh
   K/8Rkrof0FWJkQsSKGeG9ongk4i74CkDl9gjdBxlz+k8boQlZuYUlpOEt
   TSAG9PfWKf/8Tp0Tfpbb6bDnG7keRykJPz/1rgCpU4B9PiWjt2E3Mm8QB
   CnYthlblH/9iynLQBILnc79W5tXvOJfzTDJxngY98rYxUJqCFblngogQY
   tIQWlw8FiptHRmJknPGI6po0Wo95rD7BRI1hj06MeW865unWG6FVInllL
   Q==;
X-CSE-ConnectionGUID: 0Nl0NuUsSii5EnPe52Q2Jg==
X-CSE-MsgGUID: aI//14jzQG6LKg/jHGJ7cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88494743"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88494743"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:04:03 -0700
X-CSE-ConnectionGUID: LgLa3mGxR2S8tCZRWcGDVw==
X-CSE-MsgGUID: VxgCP+BMRYWxnrDZ1O/gQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="267367051"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:04:00 -0700
Date: Thu, 27 Aug 2026 23:03:57 +0300
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
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] media: ov2740: add manual white balance controls
Message-ID: <apCYLROF4NNMQgW3@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-10-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-10-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 08:17:54PM +0200, Maurizio Casciano wrote:
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
> +	u32 blue_gain, green_gain, red_gain;
> +	int end_ret, launch_ret, ret;
> +
> +	/* Balance controls use 1024 as unity relative to the digital gain. */
> +	green_gain = ov2740->digital_gain->val;
> +	red_gain = DIV_ROUND_CLOSEST(green_gain * ov2740->red_balance->val,
> +				     OV2740_DGTL_GAIN_DEFAULT);
> +	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
> +	blue_gain = DIV_ROUND_CLOSEST(green_gain * ov2740->blue_balance->val,
> +				      OV2740_DGTL_GAIN_DEFAULT);
> +	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);

Move each of them closer to their first user(s) respectively.

>  	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
>  			       OV2740_GROUP_HOLD_START);
>  	if (ret)
>  		return ret;

red is here

	red_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->red_balance->val,
				     OV2740_DGTL_GAIN_DEFAULT);
	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);

> -	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
>  	if (ret)
> -		return ret;
> +		goto release_group;

green is here

Perhaps leave d_gain as local variable and assign it with
ov2740->digital_gain->val.

	/* Balance controls use 1024 as unity relative to the digital gain. */
	u32 d_gain = ov2740->digital_gain->val;
	u32 blue_gain, green_gain, red_gain;
	int end_ret, launch_ret, ret;


> -	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, green_gain);
>  	if (ret)
> -		return ret;
> +		goto release_group;

blue is here

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
>  }

-- 
With Best Regards,
Andy Shevchenko


