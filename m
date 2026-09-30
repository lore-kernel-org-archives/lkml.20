Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51444AB91;
	Wed, 30 Sep 2026 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756948; cv=none; b=F2pqCM3u236VTBjT4DcGAJyiABOcKgfou09Z2+xGUMS+0OfFAAgiJZkTc/NNwEmCiz3pOrBukhvAcrz8X9eDNS0oqN0ZNfg7ZfvX+FPgVqbzlYEQMe75vyRoo9MfPc39MLPlfAPhb1c/AsN+yVi8pi2nlx1olBPzSRxUs18LGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756948; c=relaxed/simple;
	bh=Z25ssbYYgPIJRf3a6E0xksOuvmIiLp75bFgZ1UY4UR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYaIGn540/drXICzMWkJ50Y91fvnqq229nqLtWdAiuKUadrKUr5ONLLG0qr/zrV/pn6OstBXVsJBNawEpwQ7JXATHa/82lAuzFIXfhgIE03TJw3kapcw6VlMxOrKD44SCseC1HwyQ9mdMTtQ3W4QErIuKxctQisjjs3tZ4ztbJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMwmfh66; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMwmfh66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790756947; x=1822292947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z25ssbYYgPIJRf3a6E0xksOuvmIiLp75bFgZ1UY4UR8=;
  b=ZMwmfh66IttEywZlQmFnHZK0Ys+zg6Mk16bgGdJuKHbem3z+Sm9LrlNZ
   07dQr6Oh73ob3PWTN0g2rBOk1Z5LRSl1z3IRLBGe78RDrJoHUskW8kxk8
   bBgVTP3trqDXwCQPTey0n3pRV5RCY4mvs8sNi0HGuKLOdV/l+qLPf4TKC
   3Gt953Vtyt2WuR5ilk91Ly6g1F9i7+1r23KcDfQIBOp9AApJ3iB2OtybD
   IF5NyAU2/MSA1ltnuJl76FyHtHvtKl4j+zSyljYltcWdSQhugXgYmLClR
   mN0Lnh5RATjdiFn+wsuDQhA2UZtuzCLPA0HBT3ViZmZ8HpvW26oBPAsvX
   A==;
X-CSE-ConnectionGUID: CYsR9ofnTlyS6bNPw3Ggzg==
X-CSE-MsgGUID: wg8F0zO7T2Ks1FKG7pVDAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91508793"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="91508793"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:29:06 -0700
X-CSE-ConnectionGUID: xui/SqCMRcKIypiANYyu6A==
X-CSE-MsgGUID: jN9DPEBDQL+3nuHkVYXM3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="313568986"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:29:04 -0700
Date: Wed, 30 Sep 2026 11:29:01 +0300
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
Subject: Re: [PATCH v4 4/5] phy: core: Add managed phy bulk data helper
 functions
Message-ID: <arzITUCmgUp3uiRn@ashevche-desk.local>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-5-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929085235.469515-5-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 29, 2026 at 04:52:34PM +0800, Inochi Amaoto wrote:
> Add device managed variants of the phy bulk helper functions. So
> the driver can benefit from automatically managed phy handles.

...

> +int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
> +			     struct phy_bulk_data **phys)
> +{
> +	struct phy_bulk_devres *devres;
> +	int ret;

> +	*phys = NULL;

Why?! In case of error we modify the output, this is usually not the best
approach as in most of the cases the expectation is that whatever user
provide (including a garbage) should be left untouched in case of an error.

> +	if (!np)
> +		return 0;

Same here. On top why do we even care about np like this? Interestingly that
some other APIs consider this as np == dev_of_node(dev) case, and automatically
propagate that.

> +	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
> +			      GFP_KERNEL);
> +	if (!devres)
> +		return -ENOMEM;
> +
> +	ret = of_phy_bulk_get_all(np, &devres->phys);
> +	if (ret > 0) {
> +		for (int i = 0; i < ret; i++)
> +			phy_add_device_link(dev, devres->phys[i].phy);
> +		*phys = devres->phys;
> +		devres->num_phys = ret;
> +		devres_add(dev, devres);
> +	} else {
> +		devres_free(devres);
> +	}
> +
> +	return ret;
> +}

...

> +static inline int devm_of_phy_bulk_get_all(struct device *dev,
> +					   struct device_node *np,
> +					   struct phy_bulk_data **phys)
> +{
> +	if (phys)
> +		*phys = NULL;

Same as per above.

> +	return 0;

Why not an error? I do not see the _optional word in the function name.

> +}

-- 
With Best Regards,
Andy Shevchenko


