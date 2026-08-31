Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4937025228D;
	Mon, 31 Aug 2026 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175804; cv=none; b=HNRxfAE41QuQvFRH8UHxpZ/bsRpdBCnaXBWMoab/vTbrDYS81fq0A39a3Y+U/kSFETjVghTKM6xD56phUN0INRZ6SpDPERTt52l2ALiOnU9nUcCWD4axp9cBH81wpJVKCI5LmjXiRI9Ot/Uqio5pbeqwxemkPpF5ITdVksWVNP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175804; c=relaxed/simple;
	bh=lKasAdRtT2HAE+aSbcSr7+wbukXKX1+x7ACJ76E/IHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSPXhvu0R6oUdUCLx9ieR/2jgTlWg/r8kMXfCY51B3RqdFU/AkYOGFw7NyvzLRmpoFJ15sJ68S7pWS69lJRKghyFhRyXtf8z7/NkbpVdyal8O+S0RR3Mxo67rvJ8RuU4h5xyZoX2vFLQTDelVFNJFKDhVRE/UpTGOCamPoi+4Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/bJf19F; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/bJf19F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788175802; x=1819711802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lKasAdRtT2HAE+aSbcSr7+wbukXKX1+x7ACJ76E/IHo=;
  b=m/bJf19F6VQdZlAfuZfrmXfNYXkqKQ/snO1gavdIotjxcqMvzlX68enc
   2z9xzvHWvazwCt3gWdqbNNu28mzkNNiMDQ0Y1ZAgHcREovpK2a6Hkv0bR
   7wzIB7P0oTFvW62kS4sLXaQ0icEdx2KwKe6F4TPEuhmzi9q29O+PUzQdJ
   Qm6RX5q7sKjWAnwRjXUbpX8KY+Sw0HN9IjPBqDptB8DwM5CtdX6XgwRCE
   7RHHKrsLu0RZB7UE4sH9XOgCiamsgnZAZAVRivPKHjLARr9nvgJveZmc2
   TPMa6o4py2dbiMv7ydRZMfggmiOaXCUpd657YdxyPh6RaIQOrzatV0yx3
   g==;
X-CSE-ConnectionGUID: /B1iQIxTQEuyw3hdC9Gv8w==
X-CSE-MsgGUID: SKhqF8NQRpSFl7LJEOhfnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88705554"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88705554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:27:31 -0700
X-CSE-ConnectionGUID: /CNjfDa/QXGZfymwy3T0qg==
X-CSE-MsgGUID: 1nv0Y78sSxWvTks0hqyGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="307008091"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:27:28 -0700
Date: Mon, 31 Aug 2026 14:27:25 +0300
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
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/15] media: atomisp: Use struct v4l2_area for padding
Message-ID: <apVlHeS6OWlhkkPE@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <d75701c5a72daf6b36305297a44e925e5ed6b935.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d75701c5a72daf6b36305297a44e925e5ed6b935.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:55PM +0200, Maurizio Casciano wrote:
> The padding helper passes width and height as four separate scalar
> arguments even though they form two logical dimensions.
> 
> Pass the requested size and returned padding as struct v4l2_area values.
> This makes the dimensions explicit and simplifies all three callers.

> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>

This is fine...

> Link: https://lore.kernel.org/linux-media/apCc_pt5dDxGJrei@ashevche-desk.local/

...but drop this one. No need to have it in the commit message even if
there is an accompanying Suggested-by tag.

...

> int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,

>  	const struct atomisp_format_bridge *fmt, *snr_fmt;
>  	struct atomisp_sub_device *asd = &isp->asd;
>  	struct v4l2_mbus_framefmt ffmt = { };
> -	u32 padding_w, padding_h;
> +	struct v4l2_area padding;
> +	struct v4l2_area size;
>  	int ret;
>  
>  	fmt = atomisp_get_format_bridge(f->pixelformat);

>  	 * resolution + padding. Add padding here and remove it again after
>  	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
>  	 */
> -	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
> +	size.width = f->width;
> +	size.height = f->height;
> +	atomisp_get_padding(isp, size, &padding);
>  	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
> -	ffmt.width += padding_w;
> -	ffmt.height += padding_h;
> +	ffmt.width += padding.width;
> +	ffmt.height += padding.height;

Add a wrapper that takes struct v4l2_pix_format

static inline void atomisp_get_pix_padding(struct atomisp_device *isp,
					   struct v4l2_pix_format *f,
					   struct v4l2_area *pad)
{
	struct v4l2_area size = { .width = f->width, .height = f->height };

	atomisp_get_padding(isp, size, pad);
}

So it will become here as

	atomisp_get_pix_padding(isp, f, &padding);

...

>  	if (atomisp_subdev_format_conversion(asd)) {
> -		atomisp_get_padding(isp, f->fmt.pix.width, f->fmt.pix.height,
> -				    &asd->sink_pad_padding_w, &asd->sink_pad_padding_h);
> +		size.width = f->fmt.pix.width;
> +		size.height = f->fmt.pix.height;
> +		atomisp_get_padding(isp, size, &padding);
> +		asd->sink_pad_padding_w = padding.width;
> +		asd->sink_pad_padding_h = padding.height;

And respectively here

		atomisp_get_pix_padding(isp, &f->fmt.pix, &padding);

>  	} else {
>  		asd->sink_pad_padding_w = 0;
>  		asd->sink_pad_padding_h = 0;

Looking at this, I would also replace these two in asd to be struct v4l2_area.
There are only three users.

With that this becomes

	if (atomisp_subdev_format_conversion(asd))
		atomisp_get_pix_padding(isp, &f->fmt.pix, &asd->sink_pad_padding);
	else
		asd->sink_pad_padding = {};


...

> static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,

>  		{  800,  600 },
>  		{  640,  480 },
>  	};
> -	u32 padding_w, padding_h;
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
> -		atomisp_get_padding(isp, frame_sizes[i].width, frame_sizes[i].height,
> -				    &padding_w, &padding_h);
> +		struct v4l2_area size = {
> +			.width = frame_sizes[i].width,
> +			.height = frame_sizes[i].height,
> +		};

Just convert frame_sizes to be of struct v4l2_area type.

> +		struct v4l2_area padding;
>  
> -		if ((frame_sizes[i].width + padding_w) > native->width ||
> -		    (frame_sizes[i].height + padding_h) > native->height)
> +		atomisp_get_padding(isp, size, &padding);
> +
> +		if ((frame_sizes[i].width + padding.width) > native->width ||
> +		    (frame_sizes[i].height + padding.height) > native->height)
>  			continue;


Then only fsize->discrete = frame_sizes[i]; will require the member-to-member
assignment.

-- 
With Best Regards,
Andy Shevchenko


