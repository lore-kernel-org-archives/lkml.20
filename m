Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F93B38BF;
	Mon, 31 Aug 2026 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166557; cv=none; b=dodVyMvmdYnLApYBVfYsn7L1QL8S56VfI5uBEAaSI7oAd6BAcVW56nvTc3Ywwkq2VA1WMU4qHluPlp7hXH2Q0EofE1y06HCIleZ8x0Pa0UkHLKzw5SHSfp3XjkvzBWjmtEPBTUw6BQKzIn0K9JAfdhUgxKekPpO4BStoW+aluGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166557; c=relaxed/simple;
	bh=O9kLkeXsxXvGPMErhk2+GTZViMNOPLUOJF1XdfOCyWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sD/BlvjOH3JbbVgAg+UM3eeQAHfF9wI8BebQCg6q2JkilZHdZD6J795+kkuQ7t+FcxLsom/1/gmMXU2i6LA0h7LNT/cVmJRmp/KW9mip+of10np9Csv8DS2Eb4rEzK+pHRERt4WIAdOasFuHsJHX+HG584C7PrrYiT/IQRyf9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VA93GIOt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VA93GIOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788166556; x=1819702556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9kLkeXsxXvGPMErhk2+GTZViMNOPLUOJF1XdfOCyWY=;
  b=VA93GIOtJtnaIOkGJcSW2ky9RFKuZTYl0KrdCYCpvir5WsQsYjCulHjj
   OuofKnfGF04xDETRXAPNNtTxI1Zww18Q/uPL5BwfmpQSGapjA9Vh5KPlC
   vVStoQXPzea+ZTW3UKWULoO2cVKarJ8bCS0+Q2ar7JigJ39LCZz2qprn3
   es5jNIE4eDwLLYZGf3ZqTU52EEjJigKL9RwTrDbI0AjbdLpUlRTLNfQrd
   JnoG9ugxv4Pd/TGpIys7Dz929JPkvCUPwyrYl3x9cPeJXKg0XbWjQPbYB
   JsCl5u+7nQfkQq7rpj3Ly422DAYjYKEjmxIqIeKcvQV8BFLh0rkCx3k8k
   w==;
X-CSE-ConnectionGUID: hGle0cnSQF6tGTFzxVEgtw==
X-CSE-MsgGUID: +8urBKlWRMeDWExwHGJAoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92379363"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92379363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:55:55 -0700
X-CSE-ConnectionGUID: CtDiUuQUSwSsNsnfT3xRYQ==
X-CSE-MsgGUID: UVHv2V6BT+ylmrt4/XNo2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="274011859"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:55:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4026D11F894;
	Mon, 31 Aug 2026 11:55:50 +0300 (EEST)
Date: Mon, 31 Aug 2026 11:55:50 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Christian Murphy <christian@themurphys.eu>
Cc: linux-media@vger.kernel.org, hpa@redhat.com, mchehab@kernel.org,
	tarang.raval@siliconsignals.io, jai.luthra@ideasonboard.com,
	linux-kernel@vger.kernel.org, antti.laakso@linux.intel.com
Subject: Re: [PATCH] media: i2c: imx471: Fix pixel rate and line length
Message-ID: <apVBljHkHhjcodTX@kekkonen.localdomain>
References: <20260830173345.15886-1-christian@themurphys.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830173345.15886-1-christian@themurphys.eu>

Hi Christian,

Thanks for the patch.

On Sun, Aug 30, 2026 at 06:33:45PM +0100, Christian Murphy wrote:
> The pixel rate is derived from the CSI-2 link frequency, 200 MHz * 2 *
> 4 lanes / 10 bits = 160 MHz, and the line length is the binned array
> width, 2328. Neither describes the pixel array.
> 
> The VT PLL gives 19.2 MHz / PREPLLCK_VT_DIV 2 * PLL_VT_MPY 121 /
> VTPXCK_DIV 6 = 193.6 MHz and the array reads two pixels per clock, so
> the pixel rate is 387.2 MHz. LINE_LENGTH_PCK is never written and its
> power-on default reads back 5120. Timing frames at several written
> line lengths confirms 387.2 MHz at every value.
> 
> With the declared values the line duration comes out 14.55 us instead
> of 13.22 us and exposure is overstated by 10%: libcamera reports a
> maximum ExposureTime longer than the frame.
> 
> Set the pixel rate to 387.2 MHz and the line length to 5120, which
> changes HBLANK from 400 to 3192. No register write is added.
> 
> Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor driver")
> Link: https://lore.kernel.org/linux-media/20260728042013.23707-1-hpa@redhat.com/
> Assisted-by: Claude-Code:claude-fable-5
> Signed-off-by: Christian Murphy <christian@themurphys.eu>
> ---
> 
> Notes:
>     LINE_LENGTH_PCK reads back 0x1400 (5120) from the streaming sensor.

Interestingly, 2328 would appear to be a seemigly valid value.

Cc Antti.

>     Written to 5632, 6144, 5008 and 5120 in one stream, the line period is
>     llp / 387.2 MHz at every value (14.5457, 15.8680, 12.9341, 13.2234 us).
>     
>     Tested on a ThinkPad X1 Carbon Gen 14 (Debian linux 7.1.8-2, libcamera
>     0.7.2): controls read back 387200000 / 3192, 17.296 ms frames, maximum
>     ExposureTime 17.057 ms. v4l2-compliance 46/46; W=1 and sparse clean.
>     The driver is in no release (7.3 merge window), so no Cc: stable.
> 
>  drivers/media/i2c/imx471.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 4053aed84340..7a1335873270 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -282,7 +282,7 @@ static const struct imx471_mode imx471_modes[] = {
>  		.height = 1088,
>  		.fll_def = 1308,
>  		.fll_min = 1308,
> -		.llp = 2328,
> +		.llp = 5120,
>  		.default_mode_regs = mode_1928x1088_regs,
>  		.default_mode_regs_length = ARRAY_SIZE(mode_1928x1088_regs),
>  	},
> @@ -691,8 +691,8 @@ static int imx471_init_controls(struct imx471 *sensor)
>  					   0,
>  					   link_freq_menu_items);
>  
> -	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> -	pixel_rate = div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
> +	/* pixel_rate = 2 * vt_pix_clk, with vt_pix_clk = 19.2 MHz / 2 * 121 / 6 */
> +	pixel_rate = 387200000;

Can you calculate the value instead, please?

>  
>  	v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
>  			  V4L2_CID_PIXEL_RATE, pixel_rate,
> 

-- 
Kind regards,

Sakari Ailus
