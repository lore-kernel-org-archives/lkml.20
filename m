Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4918B3F1047;
	Thu, 27 Aug 2026 19:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787860023; cv=none; b=nho6Uvq/jxihMz73gDot+MGwFH4Gv1jMpu+za84KISFszd0aHNfc5vLwBOYqPxi09/v/qUUblJb2CxgOzX5zh6zmbr+mk0pIfhHyno9obl6EKWA604FUMtCme3dWKa1JCRvihOq2L6u+b6hdaVLq2VqxmjUnNRXTy3fAosFA3bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787860023; c=relaxed/simple;
	bh=dHBqIy0S05p9VoGRpyxVv8tYE9B+sfMmDxvDJKeLm/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfRISxkicl+Iu1Wa8FNPkX3hkyKEFuXBOHW5etv+FVFM01u43r9cjwp2tMKClf2g23uIpSrdvjRoha7XHLuMdEyr2wWBFYzI0BxGkGkSSwZ2LbLPUgJObwjyHCZaI0aawoWmD6qSOA/W5tDBOoBSm1lAAPLuc2p4+1JLpw82+Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvF0hQwH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvF0hQwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787860022; x=1819396022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dHBqIy0S05p9VoGRpyxVv8tYE9B+sfMmDxvDJKeLm/s=;
  b=dvF0hQwHvSwf8aPszX9fch33g2l2IOBONKTA9Kj4XmTplSy7F5o+QOeN
   Su+gdlSkRkherEigqhDCtoOiipx737SoQuSkxp0QNvUCOu4s3SARG1Dd8
   axenYWjbgLUPd70bwwd89kFMohopnMpGddFJaIRzv+DWRfEW+hZLXvQpK
   0RbK8iferi2EB4Yj01BWYOyVJ+4wupCv5o78yY3/ZxztaN/8FMY5Lp+WH
   fZDxDa7mx6MZSCdDfjvARpTxjfR/nTNGajNxF+KGpWo3vSHVM9j++SHLU
   D7EdR8+4elcU4+Q0yDbzH/jUZSQMydzBtCDddpYcV/nVvLgttCZa6s1d7
   A==;
X-CSE-ConnectionGUID: E+nNDkbLSPGeB4XqvUDTkA==
X-CSE-MsgGUID: BQuJ6mBtS5W/piRLd88JHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88132582"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88132582"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:46:54 -0700
X-CSE-ConnectionGUID: VNWXREs7Sa2Dd7hOlBI8/g==
X-CSE-MsgGUID: p4DVlHxBQCeDEnJH5at+lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="268535780"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:46:50 -0700
Date: Thu, 27 Aug 2026 22:46:48 +0300
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
Subject: Re: [PATCH v2 02/11] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <apCUKIgOZMoeSAP1@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-3-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-3-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 08:17:47PM +0200, Maurizio Casciano wrote:
> The Yoga Book drives its OV8858 from a 19.2 MHz platform clock, while
> the existing mode tables program the sensor PLL for 24 MHz. Reusing
> those settings produces incorrect internal and CSI-2 clocks.
> 
> Accept both input rates and use the actual rate for the reset delay. For
> 19.2 MHz, apply the Cherry Trail MRD PLL and black-level settings after
> the generic mode table.
> 
> The 19.2 MHz platform uses the per-channel manual white-balance
> registers for digital gain. Program registers 0x5032, 0x5034 and 0x5036
> and expose their 1x-to-4x range, while retaining the existing
> long-exposure gain block for 24 MHz systems.
> 
> The manual white-balance register definitions and programming follow
> the GPL-2.0 Intel OV5670 driver, so retain its 2017 Intel copyright
> notice in this file. No proprietary source or tuning binary is included.
> 
> Tested on the Lenovo Yoga Book YB1-X91L OV8858 with full-range test bars
> and real 10-bit Bayer frames.

...

> -#define OV8858_LINK_FREQ		360000000U
> -#define OV8858_XVCLK_FREQ		24000000
> +#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_19_2MHZ	(192 * HZ_PER_MHZ / 10)
> +#define OV8858_XVCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)

Ah, I completely missed that 19.2 has a fractional part in MHz units.
Then this conversion makes a little sense. Sorry for misleading review
comment.

...

>  struct ov8858 {
>  	struct clk		*xvclk;
> +	unsigned long		xvclk_rate;
>  	struct gpio_desc	*reset_gpio;
>  	struct gpio_desc	*pwdn_gpio;
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8858_supply_names)];

>  	unsigned int		num_lanes;
>  };

Have you checked the layouts with `pahole`? Can you provide the summary?

...

> -	/*
> -	 * Digital gain is assembled as:
> -	 * 0x350a[7:0] = dgain[13:6]
> -	 * 0x350b[5:0] = dgain[5:0]
> -	 * Reassemble the control value to write it in one go.
> -	 */

Why is this comment got removed?

> -	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
> -		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
> -		     OV8858_LONG_DIGIGAIN_H_SHIFT);
> +	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ) {
> +		long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
> +			    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
> +			     OV8858_LONG_DIGIGAIN_H_SHIFT);
>  

> +		return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
> +				    long_gain, NULL);
> +	}

Instead it's better to keep the current function as a helper. You might need to
rename it first.

> +	ret = ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN, gain, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov8858_write(ov8858, OV8858_REG_MWB_GREEN_GAIN, gain, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return ov8858_write(ov8858, OV8858_REG_MWB_BLUE_GAIN, gain, NULL);
>  }

-- 
With Best Regards,
Andy Shevchenko


