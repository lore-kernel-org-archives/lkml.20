Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83189361967;
	Thu, 27 Aug 2026 20:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862278; cv=none; b=YHYeLr/CPH09/l2H855vOwgk+dEsPf78gIRB7qLgrZroDLKJM2ePLpJk88cQ3R3Cziadjo6XEllZ0mDfC/u9F3+KtnBL6djg0xA63LC7YlAXCSV5CDNvyIHbICUWdhoDuupVFckL10qBgBsjjCFv7jLXgFhwK2ans/aS1jtJzgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862278; c=relaxed/simple;
	bh=rwYx4iGuA+AYEgOnBiV5EMxjkn2QP4XTiAUMpbktcKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRb8xl7nfbtbGWCtUJqEgSfoZlJHSRuffqsBY9IwilBwaCzU3YkAnSU8/tUATzXW6bSVFsjcz8R7zJKjBO/3YdDjNk5M+UXdxdxi2y2k9PIotsf1JsBEu7eV051Pe7O3y31/VOdMw3keWXr5a5Pdt3/qFk5YleBCCcSm4ps/SNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYolWQzG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYolWQzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787862276; x=1819398276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rwYx4iGuA+AYEgOnBiV5EMxjkn2QP4XTiAUMpbktcKo=;
  b=IYolWQzG6MT0srqLYX3tkGbiAZICAWmHjBiiZ9sRBbrY4LoxlQqt13P5
   aRY6ecbBUnePU2QXHTNgUMA9O37/RrZBKguu/g4/4bGlwGzcYVJbph3BJ
   nmRgj0rdLVyNmQawRKXaKUqGRT7pPV8IEiPbyPhgUNwtsqzxwdaMXOD60
   rL2iTDW02k5bD+NoEQ/xP1SRKG+jeI6JN+0eu/BbHOdDKtXPBjPbgdYRl
   sYmBKSigVe/40YTMx2DMwKXcjsU0TLpgX22NvaJLQkcQMDDXpwDzVlRGz
   Y3Zlo+RwtpHa4ZYhkD6HqNg/W1KbwvZTQMNWcJudwtf6TTLM9Mwwm59sV
   Q==;
X-CSE-ConnectionGUID: k80oyI5xQzSdbL9i/CB4Rw==
X-CSE-MsgGUID: bQZ7Q9xkR16wpH8qrJNkaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88389373"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88389373"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:24:35 -0700
X-CSE-ConnectionGUID: Es5gAM1fQJ6xNf/kW+xLhA==
X-CSE-MsgGUID: j2kE5TLsQOmRXE2OYiTFNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="272190768"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:24:32 -0700
Date: Thu, 27 Aug 2026 23:24:30 +0300
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
Subject: Re: [PATCH v2 10/11] media: atomisp: allow raw Bayer capture
Message-ID: <apCc_pt5dDxGJrei@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-11-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-11-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 08:17:55PM +0200, Maurizio Casciano wrote:
> AtomISP currently rejects all raw formats and silently substitutes
> YUV420. This prevents userspace camera processing stacks from obtaining
> unprocessed sensor frames.
> 
> Enumerate only the raw format matching the sensor media-bus code and
> reconcile raw format requests with the code selected by the sensor.
> Userspace explicitly opts into raw capture by selecting that raw V4L2
> pixel format with VIDIOC_S_FMT; no separate module parameter is needed.
> 
> Also apply the per-sensor padding discovered by the CSI-2 bridge when
> enumerating and negotiating processed frame sizes. Raw formats expose
> the full sensor transport frame so ISP2401 can use its copy pipeline.
> Existing systems retain the global padding defaults.
> 
> Tested on a Lenovo Yoga Book YB1-X91L with raw capture from its OV2740
> and OV8858 sensors.

...

> void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,

>  	u32 min_pad_w = ISP2400_MIN_PAD_W;
>  	u32 min_pad_h = ISP2400_MIN_PAD_H;
>  	struct v4l2_mbus_framefmt *sink;
> +	u32 input_padding_w = pad_w;
> +	u32 input_padding_h = pad_h;

There are only three callers of this function. Can we have a preparatory patch
that converts this function from

void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
			 u32 *padding_w, u32 *padding_h);

to

void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
			 struct v4l2_area *pad);


(with the respective changes in the implementation of the function)?

...

> -	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
> +	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
> +		padding_w = 0;
> +		padding_h = 0;

Define it as

	struct v4l2_area padding;

> +	} else {
> +		atomisp_get_padding(isp, f->width, f->height,
> +				    &padding_w, &padding_h);
> +	}

...

>  	if (!input->sensor)
>  		return -EINVAL;

+ blank line.

> +	format = atomisp_get_format_bridge(fsize->pixel_format);
> +	if (!format)
> +		return -EINVAL;
>  
>  	if (input->crop_support)
>  		return atomisp_enum_framesizes_crop(isp, fsize);

-- 
With Best Regards,
Andy Shevchenko


