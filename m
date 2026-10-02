Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F645403AFF;
	Fri,  2 Oct 2026 20:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974012; cv=none; b=BstdJjckF/MpSu2PWt4yMaqVxVZFMd30dbzA/ksD8mgPKkCHnXL1D1n2U010dGHiDDAvoD3QuClr7Emh/1Ve/XRcqV1VtKbkuJVUqiZzJyPhh0lCk/pJaEEefsKS3oukCnxFLGUlEp+GHGHAKHIXBz7fyJtNpQoJCEDJlP5/Yuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974012; c=relaxed/simple;
	bh=NX/4BxXQULqN4P1sxYYtLY/zeRY+5VhdpUBDKVxY/UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXFWsw8dOrTtYPocV+mNG5/3+ZyPgIfWn9b6vy6bd+NwnrbbWI0TtqjFe0vodeKdC4gXSiHrvnGNkGuSgbl89S4GM57uIr+WrMMgHS3CwMHIuAivPJN9+lYBJW8LeT+/rOo2pelDh0i7/271SBAgMfh09SwggJqsgyAyVwZcZGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQfJ6fzP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQfJ6fzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790974006; x=1822510006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NX/4BxXQULqN4P1sxYYtLY/zeRY+5VhdpUBDKVxY/UY=;
  b=jQfJ6fzPnS5/MeDD7ULDO9mgGIZBDiJoOE6EjKsoucsYz1rNTEZgzckv
   NylteXbH+pVBj6q+Ki7HXbIcLx3sJVR157TI/xcuAkj+q7kY8tvg4UGIq
   68JUAjbsb625lfquptXaA/PEi777IGNBknbe7Cf4cfusu3bDCgZEMCcfx
   ZQJEd41Ml+criO0+6dEUWkNy1o2BKai5yKXvIP9pP1SrHDtL83PqJEFhy
   kXIglqsVuIVY3L83CVLmyKsXlGu6U5+B0jcX425XqRSDwjL/9ubmYaQ1t
   va4vfWoiGjYd/zx12RY5ziIbPQMeM1ZKQPXgBhe6sWBY90XpjkppIl0UQ
   Q==;
X-CSE-ConnectionGUID: tmzrHPI+QcaSOyzy7tx1rQ==
X-CSE-MsgGUID: OVeZ8KgQTiOyZd6FHqeWkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90774969"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90774969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 13:46:33 -0700
X-CSE-ConnectionGUID: kCmCiu21TB6KPEYA/aKl2A==
X-CSE-MsgGUID: 2ZOicHAbQkeECdK0UcDALQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="276456377"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.45])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 13:46:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 62091121840;
	Fri, 02 Oct 2026 23:46:27 +0300 (EEST)
Date: Fri, 2 Oct 2026 23:46:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Felipe Calliari <calliarifelipe@gmail.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] media: ov02c10: Split the PLL registers off the
 mode tables
Message-ID: <asAYI3pjBMHAdnTv@kekkonen.localdomain>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923234100.318151-1-calliarifelipe@gmail.com>
 <20260923234100.318151-4-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923234100.318151-4-calliarifelipe@gmail.com>

Hi Felipe,

On Wed, Sep 23, 2026 at 08:40:58PM -0300, Felipe Calliari wrote:
> The PLL is programmed partly by the common mode table and partly by the
> per-lane tables, which override 0x0303 and 0x0305 with the same values
> for either lane count and also set 0x0316.
> 
> Move the 0x03xx PLL registers into a table of their own, keeping only
> the values that end up in the sensor, and write it before the mode
> tables. The PLL settings depend on the external clock rate rather than
> on the mode or the lane count, and this prepares for supporting clock
> rates other than 19.2 MHz.
> 
> No functional change intended.
> 
> Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
> ---
> 
> Notes:
>     Changes in v3:
>     - New patch, as asked by Sakari.
> 
>  drivers/media/i2c/ov02c10.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index cdccbdef3..0e5010303 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -89,12 +89,6 @@ struct ov02c10_mode {
>  };
>  
>  static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
> -	{0x0301, 0x08},
> -	{0x0303, 0x06},

I haven't tried to figure out what this register exatly is, but this patch
changes how this register is programmed. After this patch, the value of
this register is always 5.

> -	{0x0304, 0x01},
> -	{0x0305, 0xe0},
> -	{0x0313, 0x40},
> -	{0x031c, 0x4f},
>  	{0x3020, 0x97},
>  	{0x3022, 0x01},
>  	{0x3026, 0xb4},
> @@ -303,10 +297,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_1lane_setting[] = {
>  	{0x394e, 0x0b},
>  	{0x4800, 0x24},
>  	{0x5000, 0xf5},
> -	/* plls */
> -	{0x0303, 0x05},
> -	{0x0305, 0x90},
> -	{0x0316, 0x90},
>  	{0x3016, 0x12},
>  };
>  
> @@ -330,11 +320,17 @@ static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
>  	{0x4d0d, 0x00},
>  	{0x5000, 0xfd},
>  	{0x481f, 0x30},
> -	/* plls */
> +	{0x3016, 0x32},
> +};
> +
> +static const struct reg_sequence sensor_pll_19_2mhz_setting[] = {

I guess some of these settings are determining link frequency or pixel
rate, so they're not generic to anything using 19,2 MHz external clock.

> +	{0x0301, 0x08},
>  	{0x0303, 0x05},
> +	{0x0304, 0x01},
>  	{0x0305, 0x90},
> +	{0x0313, 0x40},
>  	{0x0316, 0x90},
> -	{0x3016, 0x32},
> +	{0x031c, 0x4f},
>  };
>  
>  static const char * const ov02c10_test_pattern_menu[] = {
> @@ -601,6 +597,14 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		return ret;
>  
> +	ret = regmap_multi_reg_write(ov02c10->regmap,
> +				     sensor_pll_19_2mhz_setting,
> +				     ARRAY_SIZE(sensor_pll_19_2mhz_setting));
> +	if (ret) {
> +		dev_err(ov02c10->dev, "failed to write PLL settings\n");
> +		goto out;
> +	}
> +
>  	reg_sequence = mode->reg_sequence;
>  	sequence_length = mode->sequence_length;
>  	ret = regmap_multi_reg_write(ov02c10->regmap,

-- 
Kind regards,

Sakari Ailus
