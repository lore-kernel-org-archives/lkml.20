Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A89346E51;
	Thu, 27 Aug 2026 19:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787860676; cv=none; b=hWJMTUIfFxuN4ZxtVe0yhR1WySO+RMol80291SpM99zv3jHHQ4SRQLQGakWjt/HRxexYdrwHOFl6EfxuC/vSNK6FdAJGOPxTtjUKA211kyNrXsnlyk65FvMqyIbRw7EBZ5bvULo5xIzw3ielN9ZtPvdJei1sL3Gj8bCRoLfBFm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787860676; c=relaxed/simple;
	bh=ajAxoWIobwgQscpuArJ/krQ3ZLgy0OXSTtD4fo/i3Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLutj+HAwMLCCedHTwHUakJNmKZOJHYctzYeZ9XYzWdyyNc9ekL4sQapyXHWMgHJFrX3PcMK8pXa/UVqg3maeyoZ5W6ww+3al6Hl0u3rLAPDgZWGbpjfQzZlHh1SZ+CH5ME8lQ32FMGM37fD+V0UxlIi+UMUpQRizx4tBIEBsQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8KhKgXw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8KhKgXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787860675; x=1819396675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ajAxoWIobwgQscpuArJ/krQ3ZLgy0OXSTtD4fo/i3Ko=;
  b=f8KhKgXweHqAXAamYW5MrdB2Q6ICtnNF0PSFbo0OEUq8QSwJu3L0JLTu
   k+c1H6hps3IVy9J/tYFP6DTqKK2NsMI4GTCJES909BNXcjCUUd97DPlU4
   /6UPOHtkoXT6QJ+GF/oj4Y2Gt4xhB8ZyS90YO8stCEc7ZsrEV8u3AH9PC
   UEzdfzJN6VNG4h4ENHLEYZVXMBrdKgunXC1n1AbB4nfnCCjPNcV3wpFQ2
   msd7OxXqS1EfwAoMnV2vXHsVo2pcvhlHCfiZNnP/gdGfGo5WxWv6POVfE
   dpL6JJ6GRV+sL+ssMvBpep187tBnpYyRxivS0/nN888t4BfUFvjZLTmV0
   g==;
X-CSE-ConnectionGUID: ObybTForR/W1U0VgTtIHdw==
X-CSE-MsgGUID: r+ipKFAQQGGrUyW4y6h4Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87503982"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="87503982"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:57:54 -0700
X-CSE-ConnectionGUID: +qBX4yjbQQGU16efcUNBWw==
X-CSE-MsgGUID: B2ZQmp6AS4K+fcOn1sb+MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="261825373"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:57:50 -0700
Date: Thu, 27 Aug 2026 22:57:48 +0300
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
Subject: Re: [PATCH v2 08/11] media: atomisp: support the Yoga Book OV2740
 link
Message-ID: <apCWvGDbr8KxrqMw@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-9-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827181756.2430054-9-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 08:17:53PM +0200, Maurizio Casciano wrote:
> The YB1-X91L firmware does not describe the complete camera link. Its
> front OV2740 uses two CSI-2 lanes at a 288 MHz link frequency and sends
> a 1932x1092 BGGR transport frame with 12 pixels of horizontal and
> vertical padding around the 1920x1080 image.
> 
> Allow the AtomISP bridge to provide per-sensor link frequencies and
> padding, add the matching OV2740 mode, and derive ISP2401 D-PHY timing
> from the sensor link-frequency control.
> 
> The register values are hardware configuration facts checked against
> the Lenovo YB1-X91L configuration and physical captures; no proprietary
> driver code or tuning binary is included.
> 
> Tested on a Lenovo Yoga Book YB1-X91L with continuous front-camera raw
> capture.

...

> +bool atomisp_csi2_get_sensor_padding(struct device *dev,
> +				     struct v4l2_area *padding)
> +{
> +	struct acpi_device *adev;
> +
> +	padding->width = pad_w;
> +	padding->height = pad_h;
> +
> +	adev = ACPI_COMPANION(dev);
> +	if (!adev)
> +		return false;

> +	padding->width = atomisp_csi2_get_padding_value(adev,
> +							"CsiPaddingWidth", pad_w);

	padding->width =
		atomisp_csi2_get_padding_value(adev, "CsiPaddingWidth", pad_w);


> +	padding->height = atomisp_csi2_get_padding_value(adev,
> +							 "CsiPaddingHeight", pad_h);

In the similar way.

> +	return padding->width != pad_w || padding->height != pad_h;
> +}

...

> -	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
> -	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),	/* OV8858 */
> -	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false),	/* OV2740 */
> +	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false, 0),	/* OV5693 */
> +	ATOMISP_SENSOR_CONFIG("INT3477", 4, true, 0),	/* OV8858 */
> +	/* OV2740 */
> +	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false, 288 * HZ_PER_MHZ),

It's better to keep style

	/* OV5693 */
	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false, 0),
	/* OV8858 */
	ATOMISP_SENSOR_CONFIG("INT3477", 4, true, 0),
	/* OV2740 */
	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false, 288 * HZ_PER_MHZ),

Check if that can be done in the previous patch(es) already.

-- 
With Best Regards,
Andy Shevchenko


