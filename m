Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881731A556;
	Wed, 30 Sep 2026 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756560; cv=none; b=EugacCv+FKX5mgNKqKlhq72RLuIYCgxNFTP72XBzDWr7IdEzEI1lQk0W4JH+q4sRYAFeLIJ6y2ZhWhXYvf6pofaA4+Wj00P6kCkOlsYBQC1dh5QG67WRp6WVBra9bwhFjflsZAoVwdDH2yFOilYhaIpNv3QGn0gW4nKG7d3rc4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756560; c=relaxed/simple;
	bh=o4gTPctULW30OzZW+mqa9A666j84wqZq3CbG0iIigpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hfvz7yIoTjYNFZ/tHfsoP7ARQ/nvI1/JYi5xNdobGgD/qeyv4+TwV1i4pHJJEXpHOp4ftQ1eGWRJPNSnYVh/nJIIHpaRwexeYqTZBlfVAs8qKq9U5gKPP5I3nYo55dU1yH/UIF4EYdE0/sTzKckXd9K9F9/taNsHIBNE5jX7iXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DP+l0v8D; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DP+l0v8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790756559; x=1822292559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o4gTPctULW30OzZW+mqa9A666j84wqZq3CbG0iIigpQ=;
  b=DP+l0v8DvoxCqiEK+vX3sSMAB2n3p62n5CcG+UU5NCJcMaUmqSxg9Iye
   rSxdAzYqJP5omMnynz0NAxG2MyPa9R9/Y9zV1C+dMtif+/PRYVElvOjxc
   Cwf/fonrglxTpWy7j3Tc4SZRBjm8AhSNZ12aSV8pDVeXoYtVR3rm0KDdE
   7+vqcIcZVNyOw32+CZ99O7OqYiE8U/3H4MhsOQbrjkqKbSxQi8aZalXvc
   A9UnB98JC+tePoX+hAH5BAfVgRKvjQ403ghNNoCW4naecLVoqiIpWUp0v
   OQO3mlQ0hOyL5lW8yK+ZwcqIpQQkl5Px1BY/2AFN+K0G8ViNtt1Hb71ip
   g==;
X-CSE-ConnectionGUID: YtMcAY/HTj2TL9XZhmN2Hw==
X-CSE-MsgGUID: 9ksdOp63QAyQo/21N1N1dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91508212"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="91508212"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:22:38 -0700
X-CSE-ConnectionGUID: CFK0LhMsQL6mR7FHfLN22w==
X-CSE-MsgGUID: wT7fPAKNRT6OULzQo4/XiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="313567473"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:22:35 -0700
Date: Wed, 30 Sep 2026 11:22:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 3/5] phy: core: Add phy bulk data helper functions
Message-ID: <arzGyL8gGrxeZoN7@ashevche-desk.local>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-4-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929085235.469515-4-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 29, 2026 at 04:52:33PM +0800, Inochi Amaoto wrote:
> Add several helper functions that allow drivers to get several phy
> consumers in one operation. If any of the phy cannot be acquired then
> any phys that were got will be put before returning to the caller.
> 
> This can relieve the driver owners' life who needs to handle many phys,
> as well as each phy error reporting.

...

> +/**
> + * of_phy_get_count() - Get the number of phys of a device node
> + * @np: device_node for which to get the phy
> + *
> + * Return: the phy count if successful, %0 if no phy handle is found,
> + * negative error value if error occurs.
> + */
> +static int of_phy_get_count(const struct device_node *np)
> +{
> +	int count;
> +
> +	count = of_count_phandle_with_args(np, "phys", "#phy-cells");

> +

I would drop this blank line.

> +	if (count == -ENOENT)
> +		return 0;

I'm not sure about usefulness of this kind of trick in the _count API.

> +	return count;
> +}

...

> +static void phy_bulk_put(struct device *dev, unsigned int num_phys,
> +			 struct phy_bulk_data *phys)
> +{
> +	while (num_phys--) {

> +		if (!IS_ERR_OR_NULL(phys[num_phys].phy))

This should be part of phy_put(). In general many kernel resource release APIs
are NULL and/or error pointer aware. This is a slow path and it makes user's life
easier

> +			phy_put(dev, phys[num_phys].phy);
> +		phys[num_phys].phy = NULL;
> +	}
> +}

...

> +static void of_phy_bulk_put(unsigned int num_phys, struct phy_bulk_data *phys)
> +{
> +	while (num_phys--) {
> +		of_phy_put(phys[num_phys].phy);

> +		phys[num_phys].phy = NULL;

Is NULLification mandatory?

> +	}
> +}

...

> +static int of_phy_bulk_get_by_index(struct device_node *np,
> +				    unsigned int num_phys,
> +				    struct phy_bulk_data *phys)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < num_phys; i++) {
> +		phys[i].id = NULL;
> +		phys[i].phy = NULL;
> +	}

But why? The below does the assognments.

> +	for (i = 0; i < num_phys; i++) {
> +		of_property_read_string_index(np, "phy-names", i, &phys[i].id);

> +		phys[i].phy = of_phy_get_by_index(np, i);
> +
> +		ret = PTR_ERR_OR_ZERO(phys[i].phy);
> +		if (ret) {
> +			phys[i].phy = NULL;

Same Q: do we need a NULLification in this case? Perhaps the respective APIs
should be error pointer aware?

> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	of_phy_bulk_put(i, phys);
> +
> +	return ret;
> +}

...

> +/**
> + * phy_bulk_exit() - exit multiple PHYs
> + * @num_phys: number of entries in the phys array
> + * @phys: array of struct phy_bulk_data to exit
> + *
> + * Exits the PHYs in reverse array order. All PHYs are processed even if an
> + * error occurs.
> + *
> + * Return: %0 if successful, the first negative error code otherwise
> + */
> +int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys)
> +{
> +	int ret = 0;
> +	int err;
> +
> +	while (num_phys--) {
> +		err = phy_exit(phys[num_phys].phy);
> +		if (err && !ret)
> +			ret = err;
> +	}
> +
> +	return ret;

So, we return an arbitrary error and inconsistent state of the phys[] array.
What can caller do about all this? Any type of recovery? TL;DR:
I put in doubt the function prototype and the implementation (error handling).

> +}

-- 
With Best Regards,
Andy Shevchenko


