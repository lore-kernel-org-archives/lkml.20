Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4244C504;
	Fri, 28 Aug 2026 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918981; cv=none; b=pXF5Hx5VUa4b/x3No336AaFUIi1PPCJSrSp53ynX7rG8vkKlqhjuoyLX/pa/NrHTo90ftxTZWrvq3YyrMRalVPph+y1bvYNT/LMBwAZuQli0LbGKA5vtMjRjdVmDtdbo7f8efoYXJUFkkki/1dBgwGEL4P96qZX9bVp3T28XxE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918981; c=relaxed/simple;
	bh=Hk/SRw+cpuI+Q59X47vyXCBfdMkqICKzdHMaJ8MlWts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjHjOUt9hzTsUWH/3H3MIAC2REJVUS57oMcedVOl8Cjug8vm9+awhh82pZvAWvBP/BLw7oY4Yc5pyiMLeKL5zASwWV6tIOIwEIje3RDB1RhVZW0ig4uTiiaIJsfuXjYV8dGnYPGqGn9lBnz09KWbikFNP0w8cTksfKg4wbDzSyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F44YXL+S; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F44YXL+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787918971; x=1819454971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hk/SRw+cpuI+Q59X47vyXCBfdMkqICKzdHMaJ8MlWts=;
  b=F44YXL+S4Gk9RQMlDUJzFPvjHGpvip3OkUznnUwur8TYxWOYbxMdO1Hi
   2RsZ2ChjiVAkKXbCyg00Bt6EUffUpuQvh+8ktkyHdYv/7faLiv+3+YVQn
   XwOvccMRKlpikl1W9Ug06bqQoNuGB3Bha/IndEWscDle/6D3Eiq1cyuaN
   +C1uWnLQTVcyUB9LC23cvAC+zO0FsOQSoE718/9hXCUaVU15S3f/4IWld
   eA+PuaJ8eBVA/1j/lvkpReoPHYIoieAbFOIvF7baT9wlebNGG5DM4U1No
   mVc4gS0aK7CsjHm954CuB7HExXyGp/HxDHGzYF9nWIvSNpQ4l/ouqkFUE
   A==;
X-CSE-ConnectionGUID: HQAMw+KAT82slhAm1q9seQ==
X-CSE-MsgGUID: Ion4XhyORGWt7MPrRAotqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105800285"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="105800285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:09:24 -0700
X-CSE-ConnectionGUID: p+JDzm4tTDqwHtJFUSvMpw==
X-CSE-MsgGUID: bhExKVqQQuqS0gNm/nC4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="271677615"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:09:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5670311F817;
	Fri, 28 Aug 2026 15:09:17 +0300 (EEST)
Date: Fri, 28 Aug 2026 15:09:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov7670: Propagate clock enable failures
Message-ID: <apF6beHoCHi8TXMJ@kekkonen.localdomain>
References: <20260828091506.6732-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828091506.6732-1-pengpeng@iscas.ac.cn>

Hi Pengpeng,

Thanks for the patch.

On Fri, Aug 28, 2026 at 05:15:06PM +0800, Pengpeng Hou wrote:
> ov7670_power_on() ignores clk_prepare_enable() and proceeds to toggle
> GPIOs and set info->on.  A failed clock enable can therefore be reported
> as a powered sensor and later be paired with an unbalanced clock
> disable.
> 
> Return the clock error before changing GPIO or software state, and
> propagate it from the subdevice power operation and probe.
> 
> The issue was identified via static analysis and manually reviewed.
> 
> Fixes: 030f9f682e66 ("media: ov7670: control clock along with power")
> 

Please remove extra newline here.

> Assisted-by: LLM

Which one?

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/media/i2c/ov7670.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
> index 4d040e9feeac..9c5bb391202d 100644
> --- a/drivers/media/i2c/ov7670.c
> +++ b/drivers/media/i2c/ov7670.c
> @@ -1647,14 +1647,17 @@ static int ov7670_s_register(struct v4l2_subdev *sd, const struct v4l2_dbg_regis
>  }
>  #endif
>  
> -static void ov7670_power_on(struct v4l2_subdev *sd)
> +static int ov7670_power_on(struct v4l2_subdev *sd)
>  {
>  	struct ov7670_info *info = to_state(sd);
> +	int ret;
>  
>  	if (info->on)

That's also unnecessary. No need to change this for a bugfix though.

It'd be also nice to convert the driver to use Runtime PM but that is
obviously out of scope of this patch.

> -		return;
> +		return 0;
>  
> -	clk_prepare_enable(info->clk);
> +	ret = clk_prepare_enable(info->clk);
> +	if (ret)
> +		return ret;
>  
>  	if (info->pwdn_gpio)
>  		gpiod_set_value(info->pwdn_gpio, 0);
> @@ -1667,6 +1670,8 @@ static void ov7670_power_on(struct v4l2_subdev *sd)
>  		usleep_range(3000, 5000);
>  
>  	info->on = true;
> +
> +	return 0;
>  }
>  
>  static void ov7670_power_off(struct v4l2_subdev *sd)
> @@ -1687,12 +1692,15 @@ static void ov7670_power_off(struct v4l2_subdev *sd)
>  static int ov7670_s_power(struct v4l2_subdev *sd, int on)
>  {
>  	struct ov7670_info *info = to_state(sd);
> +	int ret;
>  
>  	if (info->on == on)
>  		return 0;
>  
>  	if (on) {
> -		ov7670_power_on(sd);

You can also declare ret here.

> +		ret = ov7670_power_on(sd);
> +		if (ret)
> +			return ret;
>  		ov7670_init(sd, 0);
>  		ov7670_apply_fmt(sd);
>  		ov7675_apply_framerate(sd);
> @@ -1872,7 +1880,9 @@ static int ov7670_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>  
> -	ov7670_power_on(sd);
> +	ret = ov7670_power_on(sd);
> +	if (ret)
> +		return ret;
>  
>  	if (info->clk) {
>  		info->clock_speed = clk_get_rate(info->clk) / 1000000;

-- 
Regards,

Sakari Ailus
