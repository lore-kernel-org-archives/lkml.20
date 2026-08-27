Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D63955CA;
	Thu, 27 Aug 2026 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841797; cv=none; b=Nb1wlHXtvmY7cbiaFo/WbBQc2dQCsuXCdFknqMErhoqVYQw36iz7wok6f4TGFz081C2t0ejDW1Q9PKS28tBJsZTsudw5A42I9Il4V3msnELSEG05Dw7JEAukSdYmLPYoA4h0v2xLBqxUTqe04m2HMdzDr5/22LyditnkPI4wsAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841797; c=relaxed/simple;
	bh=85lSA4egJYDDfc9Gc1dIksNdWPK6UdxCiBDoQ/skJR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCypf/k4i7WLQdT5ZhLPTvpb094vBFOzYnUDcMwvKvYlVR88YM3YMABXjUc5lPalL5AECRYZmeZ2wBZYu37FAZXEK3B2LUBUagpNUTMt1N0ZAdZOp0doVb2w4IwkV9iDMCCFkW6fRDNAwpgyZXi0U6rtzXCxIrh93CSrD2Aj4kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBhQnVyh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBhQnVyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787841795; x=1819377795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=85lSA4egJYDDfc9Gc1dIksNdWPK6UdxCiBDoQ/skJR4=;
  b=IBhQnVyhgyl2zfqLf9NPr9VjJD9MDisW/oqLCQ0qmtSkc30S2dED/qQ/
   /TJ+KSIqlH1JllSaQ75MfHE2FBs+t7GajEDRl0nuNI19mwfCre1jcivle
   dxFxvNg5ETcEkqM6cmGLax+ng8xejLafDQ3KP4QBVA0Yc6dVCQ9h8ec0Y
   uXBsvrs1dfUZl1wjDJy1Qw6SzJCUVr6hAj4kICLx+nG6ZcxZL+q7RfOjA
   ilXznxqIROZ/GCj3cxI38WtRcu6VCIPNis9+TZbSyzRdwyxyZu+4K3c+V
   u4r5WzI1tpkflqjL89XHAqdt2GcQ0otgs38Bzwjm6UFrDHbks/VBS493H
   A==;
X-CSE-ConnectionGUID: 09h/TtcmTa6y4iUKAcyyWw==
X-CSE-MsgGUID: DlmiwTGqQf+2kqu4rjuBLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99861134"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="99861134"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:43:15 -0700
X-CSE-ConnectionGUID: zqbfjTjlRiaVGnjSMwgsJw==
X-CSE-MsgGUID: Ard5BamOQXaxnW8f2ZI3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="291389341"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:43:11 -0700
Date: Thu, 27 Aug 2026 17:43:08 +0300
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
Subject: Re: [PATCH 7/8] media: atomisp: allow opt-in raw Bayer capture
Message-ID: <apBM_BTkHcTgM8m_@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-8-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132256.3343451-8-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 03:22:55PM +0200, Maurizio Casciano wrote:
> AtomISP currently rejects all raw formats and silently substitutes
> YUV420. This prevents userspace camera processing stacks from obtaining
> unprocessed sensor frames.
> 
> Add an allow_raw_output module parameter, disabled by default. When it is
> enabled, enumerate only the raw format matching the sensor media-bus code
> and reconcile raw format requests with the code selected by the sensor.
> 
> Also apply the per-sensor padding discovered by the CSI-2 bridge when
> enumerating and negotiating frame sizes. Existing systems retain the
> global padding and raw-output defaults.
> 
> Tested on a Lenovo Yoga Book YB1-X91L with raw capture from its OV2740
> and OV8858 sensors.

...

>  	u32 min_pad_w = ISP2400_MIN_PAD_W;
>  	u32 min_pad_h = ISP2400_MIN_PAD_H;
>  	struct v4l2_mbus_framefmt *sink;
> +	u32 input_padding_w = input->padding_override ?
> +			      input->padding_w : pad_w;
> +	u32 input_padding_h = input->padding_override ?
> +			      input->padding_h : pad_h;

It's the same condition, split to if-else.

	if (input->padding_override) {
		input_padding_w = input->padding_w;
		input_padding_h = input->padding_h;
	} else {
		input_padding_w = pad_w;
		input_padding_h = pad_h;
	}

>  	if (!input->crop_support) {
> -		*padding_w = pad_w;
> -		*padding_h = pad_h;
> +		*padding_w = input_padding_w;
> +		*padding_h = input_padding_h;
>  		return;
>  	}

Or maybe you can update pad_w and pad_h instead and leave this and might be
other code alone?

...

> +++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h

>  #define ATOMISP_CSS_SUPPORT_YUVPP     1
>  
>  #define ATOMISP_CSS_OUTPUT_SECOND_INDEX     1
> +
> +extern bool atomisp_allow_raw_output;
> +

Location of this doesn't look right. Find a better one.

>  #define ATOMISP_CSS_OUTPUT_DEFAULT_INDEX    0

...

>  struct atomisp_input_subdev {

>  	enum atomisp_camera_port port;
>  	u32 code; /* MEDIA_BUS_FMT_* */

> +	u32 padding_w;
> +	u32 padding_h;

Why not struct v4l2_area?

> +	bool padding_override;
>  	bool binning_support;
>  	bool crop_support;
>  	bool sensor_on;

...

> -		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
> -			continue;
> +		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
> +			if (!atomisp_allow_raw_output ||
> +			    format->mbus_code != code.code)
> +				continue;
> +		}

  if (a) { if (b) { ... }} is equivalent to if (a && b) { ... }.

...

> +bool atomisp_allow_raw_output;
> +module_param_named(allow_raw_output, atomisp_allow_raw_output, bool, 0644);
> +MODULE_PARM_DESC(allow_raw_output,
> +		 "allow experimental raw Bayer output (default:false)");

Why do we need this? Can it be enabled a run-time via IOCTL or other means
of ABI?

...

> +	input->padding_override =
> +		atomisp_csi2_get_sensor_padding(input->sensor->dev,
> +						&input->padding_w,
> +						&input->padding_h);

Make a pointer to a struct v4l2_area to be filled by this function.

-- 
With Best Regards,
Andy Shevchenko


