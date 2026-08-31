Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A33B8D75
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168548; cv=none; b=XqfsP0FBA0AwRPUl0sc5jbaRq8TQEzEX+oZUAQodsFna5riWth+kWSb/gENIvZu8JWpqDovZ4FKna5SbmeWvawVhTInaIFme4MW8f88aVE3aUggvj3BZURqJ2DqPj0U/3nOxVRaEMZIPJlweWfsdk/bVIsqTSox8P4LdWZikYDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168548; c=relaxed/simple;
	bh=FdOsuuMQ08/G9pXB8nkYFXb7pPmT73+2R7WY6hsx0Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i48YX2YjAKsaGtlV7xhwzwvb5oKrTcgw65IzlPHyDhGjfHdXv0FcF0fX+omlB2CcxIvjNAqRHqbndxidWZqLyy5crlC2ZNJAyyYBDNcQq2kLS8Hi0Cw1w6OkItPRrSbid781G9HnlbgzI8Siwru7/YB2skrcw5gW5g96tJyqs3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUHZI5oq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUHZI5oq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168546; x=1819704546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FdOsuuMQ08/G9pXB8nkYFXb7pPmT73+2R7WY6hsx0Zc=;
  b=JUHZI5oqHnf5U5wzkelWG9A287HMTzDhNH1cePd6sUUmCeonQVPCPZIb
   q3urh0f6fEmC+hpA58WjmXW2q1H+WvYWtw5hzpkHxk9PkNULZoMsyFell
   GBWXHHifH+g/pxUdRVr6hozAzuDuXqdQwWvHuA/WHcrvuGAbRaHIkJjnu
   3RBEhL9/gcSltIlpAzYricbNuneJ55cH13c8u3ZhFTtlDYjq9mvbUuvGG
   Szt94GmtZJW/zjfNHpWbvpHkxLRuakHN8bOwfvLuLXu1+x+i/gtD/7bvU
   lVA9XTUEQYm28RrAmWA5zeQBg5QNN+55DvP3MEWX3EFHrWuvZ6SMMrjr8
   g==;
X-CSE-ConnectionGUID: +JLwGTGHQU2rejaIpQZA8Q==
X-CSE-MsgGUID: uxrUISvDTzGbt0vjjsH70g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92436209"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92436209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:29:04 -0700
X-CSE-ConnectionGUID: OQWO11sZQJOifualVqBTfw==
X-CSE-MsgGUID: f7NVot26Tq6z4+1jIoLmWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="270673686"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:29:02 -0700
Date: Mon, 31 Aug 2026 12:28:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/3] phy: core: Add phy bulk data helper functions
Message-ID: <apVJW6H8_y0uiVtj@ashevche-desk.local>
References: <20260831025319.94886-1-inochiama@gmail.com>
 <20260831025506.95548-1-inochiama@gmail.com>
 <20260831025506.95548-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831025506.95548-3-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 10:55:05AM +0800, Inochi Amaoto wrote:
> Add several helper functions that allow drivers to get several phy
> consumers in one operation. If any of the phy cannot be acquired then
> any phys that were got will be put before returning to the caller.
> 
> This can relieve the driver owners' life who needs to handle many phys,
> as well as each phy error reporting.

...

> +/**
> + * of_phy_get_parent_count() - Get the number of phys of a device node
> + * @np: device_node for which to get the phy
> + *
> + * Return: the phy count if successful, 0 if no phy handle is found,
> + * negative error value if error occurs.

Just for the reference, here is the correct format of the kernel-doc!

> + */
> +static int of_phy_get_parent_count(const struct device_node *np)
> +{
> +	int count;
> +
> +	count = of_count_phandle_with_args(np, "phys", "#phy-cells");

> +	if (count == -ENOENT)
> +		return 0;

Why? And if so, the function perhaps needs to return unsigned type. Also
kernel-doc says about negative error codes.

> +	return count;
> +}

...

> +void phy_bulk_put(struct device *dev, int num_phys, struct phy_bulk_data *phys)
> +{
> +	if (!phys)
> +		return;

> +	while (--num_phys >= 0) {

It's hard to follow.

	while (num_phys--) {

will do the job. Ditto for other similar cases.

> +		if (phys[num_phys].phy)
> +			phy_put(dev, phys[num_phys].phy);
> +		phys[num_phys].phy = NULL;
> +	}
> +}

...

> +static int __phy_bulk_get(struct device *dev, int num_phys,
> +			  struct phy_bulk_data *phys, bool optional)
> +{
> +	int ret;

> +	int i;

Do you expect num_phys to be negative?

static int __phy_bulk_get(struct device *dev, unsigned int num_phys,
...
	unsigned int i;

Same comment to the rest of the similar changes.

> +
> +	for (i = 0; i < num_phys; i++)
> +		phys[i].phy = NULL;
> +
> +	for (i = 0; i < num_phys; i++) {
> +		phys[i].phy = phy_get(dev, phys[i].id);

		ret = PTR_ERR_OR_ZERO(...);

> +		if (IS_ERR(phys[i].phy)) {

		if (ret) {

> +			ret = PTR_ERR(phys[i].phy);
> +			phys[i].phy = NULL;
> +
> +			if (ret == -ENODEV && optional)
> +				continue;
> +
> +			dev_err_probe(dev, ret,
> +				      "Failed to get phy: (%s)\n",

There is room on the previous line.

> +				      phys[i].id);
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	phy_bulk_put(dev, i, phys);
> +
> +	return ret;
> +}

...

> + * Return: %0 if successful, a negative error code otherwise

Note, the reference to 0 is inconsistent with the previous changes.
Make it there [of_phy_get_parent_count()] to follow.

...

> +static int of_phy_bulk_get_by_index(struct device_node *np, int num_phys,
> +				    struct phy_bulk_data *phys)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < num_phys; i++) {
> +		phys[i].id = NULL;
> +		phys[i].phy = NULL;
> +	}
> +
> +	for (i = 0; i < num_phys; i++) {
> +		of_property_read_string_index(np, "phy-names", i,
> +					      &phys[i].id);

The line limit is exactly 80, please fix your editor and double check that you
use as much room as available (with the correction on the logical splits where
it makes sense).

> +
> +		phys[i].phy = of_phy_get_by_index(np, i);

		ret = PTR_ERR_OR_ZERO(...);

?

> +		if (IS_ERR(phys[i].phy)) {
> +			ret = PTR_ERR(phys[i].phy);
> +			phys[i].phy = NULL;
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

> +int of_phy_bulk_get_all(struct device_node *np, struct phy_bulk_data **phys)
> +{
> +	struct phy_bulk_data *phy_bulk;
> +	int num_phys;
> +	int ret;
> +
> +	*phys = NULL;

> +	if (!np)
> +		return 0;

Dup check? The OF APIs are usually NULL-aware.
Same Q to the ress of the code.

> +	num_phys = of_phy_get_parent_count(np);
> +	if (num_phys <= 0)
> +		return num_phys;
> +
> +	phy_bulk = kmalloc_objs(*phy_bulk, num_phys);
> +	if (!phy_bulk)
> +		return -ENOMEM;
> +
> +	ret = of_phy_bulk_get_by_index(np, num_phys, phy_bulk);
> +	if (ret) {
> +		kfree(phy_bulk);
> +		return ret;
> +	}
> +
> +	*phys = phy_bulk;
> +
> +	return num_phys;
> +}

...

> +struct phy_bulk_devres {
> +	struct phy_bulk_data *phys;
> +	int num_phys;

Why signed?

> +	bool free_phys;
> +};

...

I stopped here. It's too many stuff in a single patch. Please, split to two for
a starter:
- non-devm additions
- devm coverage

-- 
With Best Regards,
Andy Shevchenko


