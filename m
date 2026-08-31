Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2332933D4E5;
	Mon, 31 Aug 2026 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176465; cv=none; b=rmWtjQYJ3T0owMAfUBAGPSPQ41m/vc0D6ykghqZRGt7ExAc/JYeNmfB7Ovw0b9NIAHGirdif50S7V+Ts64i4ZM8gJZFbB6YVHUePqhGCcJhhrREYmAo7wVG7KLLUtuU8ZGD9dLhcpeUqao1elnxk6AhbeN/rYXxzAbuZDdIREWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176465; c=relaxed/simple;
	bh=ZeT20xbb5bL7TplofppYhDK79ecsWSJb+W4FXpiOsvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlJAtJmRn7kp/Xh4CBTj6ZLmZThlk8ZDzSkizsAKes6gobriOPACjatqCaOY0R/aYj/r+lamNYs6rULDPXeKvLigqPymsSBxzMIy4xcSD0puGHq96jZNTqPK4zPVlaLEqtPKGCbfbJjOfg+r84+fohZZY6aEGgYVD1qb2+e+/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjZDrx3Z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjZDrx3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788176464; x=1819712464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZeT20xbb5bL7TplofppYhDK79ecsWSJb+W4FXpiOsvc=;
  b=DjZDrx3ZaFAELPejL/sD+wKzeRX243K1NLZh0GuJ8YLS+w6l+TWycWkA
   zUNYThyGxJUiEL+nz3ud2yDjXSe5RnIOi5NkigKbetqzV3PZ8JhOmTqH5
   n0GIw6EZfGTThUNDwe2bSxXCpoxwfbCX9D4D0wUhrYnDV0AdLEuV9xomc
   vuGaDti+ax1zVZBGSc5q17fokJbwdDbZc0MduPbfiODM18d3V1gsn5p/I
   Sj6zX6oTyjfZ76aSyIko7k8U4jJVtsK9egQ+63ySJnsihYzmKaEFl3T32
   pOXlEkiDQ+qSohYpZxTgyQB2MEo+2LBgbFN3uxFdnZH+26DhnqqdJJEWR
   Q==;
X-CSE-ConnectionGUID: wgSQpUvIRhmyhlvfg58YZQ==
X-CSE-MsgGUID: /rmGub+VTTyWAuRZpRZ9KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99932561"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99932561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:41:03 -0700
X-CSE-ConnectionGUID: dshwJhBGRMqUMnjTrHn9oA==
X-CSE-MsgGUID: iu7uMzrXSxq2MSQJmu5VMg==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:41:00 -0700
Date: Mon, 31 Aug 2026 14:40:57 +0300
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
Subject: Re: [PATCH v4 14/15] media: atomisp: allow raw Bayer capture
Message-ID: <apVoSXcirnD2A7-d@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <749f33adb08c4b311aec241c0bdcc455fcdc0a3c.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <749f33adb08c4b311aec241c0bdcc455fcdc0a3c.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:56PM +0200, Maurizio Casciano wrote:
> AtomISP currently rejects all raw formats and silently substitutes
> YUV420. This prevents userspace camera processing stacks from obtaining
> unprocessed sensor frames.
> 
> Enumerate only the raw format matching the sensor media-bus code and
> reconcile raw requests with the code selected by the sensor. Userspace
> opts in by selecting that raw V4L2 pixel format with VIDIOC_S_FMT.
> 
> Raw formats expose the full sensor transport frame so ISP2401 can use
> its copy pipeline. Processed formats retain the existing global padding
> behavior; selecting a smaller receiver crop remains a userspace pipeline
> decision.

...

> Link: https://lore.kernel.org/linux-media/apCc_pt5dDxGJrei@ashevche-desk.local/
> Link: https://lore.kernel.org/linux-media/apF0Cds9fnqQ7XRg@kekkonen.localdomain/

Drop these.

...

> void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,

>  	u32 min_pad_w = ISP2400_MIN_PAD_W;
>  	u32 min_pad_h = ISP2400_MIN_PAD_H;
>  	struct v4l2_mbus_framefmt *sink;
> -
>  	if (!input->crop_support) {
>  		pad->width = pad_w;
>  		pad->height = pad_h;

Stray change.

...

> -	size.width = f->width;
> -	size.height = f->height;
> -	atomisp_get_padding(isp, size, &padding);
> +	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
> +		padding = (struct v4l2_area) { };
> +	} else {
> +		size.width = f->width;
> +		size.height = f->height;
> +		atomisp_get_padding(isp, size, &padding);
> +	}

Compound literal is not needed here. With the previous suggestions this becomes

	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
		padding = {};
	else
		atomisp_get_padding(isp, f, &padding);

...

>  			ffmt.code);
>  		return -EINVAL;
>  	}

Not enough context, but I assume a blank line is good to have here.

> +	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
> +	    fmt->mbus_code != snr_fmt->mbus_code) {
> +		fmt = snr_fmt;
> +		f->pixelformat = fmt->pixelformat;
> +	}

...

> +	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
> +		padding = (struct v4l2_area) { };

		padding = {};

should suffice.

-- 
With Best Regards,
Andy Shevchenko


