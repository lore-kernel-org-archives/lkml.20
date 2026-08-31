Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28383CF201;
	Mon, 31 Aug 2026 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170185; cv=none; b=C5ID2a30GwyIxbwJSib7RM+XUEWFnDiCTVpsdg+TkQS5gRC1avNvN3lgiUIARtDWuJR8CdX0dkwgymlGSMxGu0N/Hh9dC3qMS35Co2+clV0FCzzPVeGibi+BvI499qRTt3ckacfZN/UpHPpty3OUd85I8OYLTBDH9J6bSPdJXjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170185; c=relaxed/simple;
	bh=riN1mfSIHtggopg0Yfi4JMvqQVLVRuZQjGXZOOViFTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpOTnWC6jAbY8KKxtEgOkzK/G/TP/DZ8jtQIMrbl+83CjruqP2MxvHL77KU9X7sYBKk/27zFYdFXG8qyZ0N3awlPSY+HveMAHcN7uzjBdrvbP0mVPWA9r1PmDRf6Tdglxwis0zRlhRdEy0ysGSI7KsSle3Qb0jIv4ezhLGXt3Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mv9e5SG4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mv9e5SG4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170184; x=1819706184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=riN1mfSIHtggopg0Yfi4JMvqQVLVRuZQjGXZOOViFTU=;
  b=mv9e5SG41gfZe+Y5jBpeJeoF4fPrs6e1ISK/KEr57SfPbMrMR6c82FKX
   NWu4x6jWdn9uy9CgzYcC6LBW1OjLCHSYbp/q8gt9tXw3JwL++9U/FRcPt
   BA6q9s9KSRdWMHwFC1MdSstrbv0NxTFp2ZVGh8i0806m1JC5Ta14w6SJl
   CGQs/kURGC4+ZELgxn7zBxaBkWDPxHlVtw9puDpF9HZTpg7LtNZI95OVD
   ENv26kkfkprm+S8aJuUL9pkScHTvlcmfplFiDR2K4yAheoKyxwq0/E/PI
   x66wW9iEPStg3jILL5EoVjTNEmuhdecUZO94uH93wQikQYyum61EWLbGj
   w==;
X-CSE-ConnectionGUID: SVlo8wkPSomNWA+48+6mRw==
X-CSE-MsgGUID: ZlqAWf48SUqrekOdJZ65Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106096519"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="106096519"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:56:23 -0700
X-CSE-ConnectionGUID: S6M8l14STWiyriL9VYznyQ==
X-CSE-MsgGUID: j/gjoMoeTvCyGfzl2sVKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292256280"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:56:20 -0700
Date: Mon, 31 Aug 2026 12:56:18 +0300
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
Subject: Re: [PATCH v4 10/15] media: atomisp: derive CSI-2 timing from sensor
 link frequency
Message-ID: <apVPwvACDnWFEvF4@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <bc2f1613db42a53f7c53c97dd98ae86482c9c1f2.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc2f1613db42a53f7c53c97dd98ae86482c9c1f2.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:52PM +0200, Maurizio Casciano wrote:
> The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
> Query it through v4l2_get_link_freq() instead of reading a 32-bit
> control value directly.
> 
> Keep the frequency as s64 throughout the calculation so valid link
> frequencies do not require an arbitrary S32_MAX limit. Fall back to the
> existing default timings when the frequency query fails.

...

> Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/

Drop this.

...

> static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)

>  	int dat_termen;
>  	int dat_settle;
>  
> -	struct v4l2_control ctrl;
>  	struct atomisp_device *isp = asd->isp;
> -	int mipi_freq = 0;
> +	struct v4l2_subdev *sensor;
> +	s64 mipi_freq;

Move it one line below, ...

>  	enum atomisp_camera_port port;

...to here.

>  	int n;

...

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


