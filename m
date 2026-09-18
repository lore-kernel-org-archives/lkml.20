Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30282D8DD0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715794; cv=none; b=lwDf7Q5aM03zP8sQvA2TmNU+s8QmCvsFoCaO6b3IzXN7TMXD3imz1W/ilHMBxCGKRY6YnJHf4ecqY+oIcchP9hGoxNRYFt12lJGtY5v03GI4RodQ4oAL3aFfjr8C8l6WqHm/8Rvw8hvjiiAWjtnMcnl7FYvAKb0ZoF0AhWH1jf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715794; c=relaxed/simple;
	bh=fA7/UnaYykb1NNCMAnNibkhBBnsqLfyGWvbdfXT2bdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZN9QqgF+Izf0kCOkYLcLH4jZlAmTpQ+/fAhdxId5ArzJMPQM9bWOMSnhV/eBnbI6ucMA2YdF2ZO9DntIo7ciKkIndlqsfBZNEucuqqX1oVMUn5OP7rBrAGMLjaHmHb3OkWsNsVBbHC4Jm26Goo7dzYI8Dhkl8n4hNlIP3iE0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8RcDJVk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8RcDJVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789715791; x=1821251791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fA7/UnaYykb1NNCMAnNibkhBBnsqLfyGWvbdfXT2bdI=;
  b=U8RcDJVkqPetxpPGO93CIkdl1WSZoYRKs+Uc4qH/TuynjcEkEDmtPqEd
   6b9wMPkMUC5IpMeFknMpbbEVzlXKAjsO+PhCjPbXzQswR+mpxL54Ibajh
   rRqS+OSG04N6Ke3qZNab17CnIBg3GhbD5+Y4UW/WLKPBSXtg4NzmBqbOF
   TLy0Haj1vuNPFGT/lWAOU8CBSlj5XH3YrviyggSkBk3lK9kEE35jkZLoT
   Ov0d9qP707mY15QFuHFpt6pXLYNh3fIWtPuEtstLlGpDFvaJXCklQh68j
   qWVWgeZbdvtd9jrVbLHdmmQs4pukvg6MelEKqEwTFiV01TmrMG9sIfu65
   w==;
X-CSE-ConnectionGUID: 6A4a7KV6SNOzvWNUDigihQ==
X-CSE-MsgGUID: KNHUDGFZSyW993HQwr2nYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92712717"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92712717"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:16:29 -0700
X-CSE-ConnectionGUID: 6oed3UO/SEGyBQJ/nUa00g==
X-CSE-MsgGUID: Y7eNRWi0Q5uM79fpfqC0Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="299360210"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:16:27 -0700
Date: Fri, 18 Sep 2026 10:16:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v3] mfd: intel_soc_pmic_crc: Balance IRQ wake enable
Message-ID: <aqzlSd5moyLIhLbG@ashevche-desk.local>
References: <CAGEsz8GN7XObjqzMZ1KcghAKH8anMsYSU30PUJ_YXY-zDsvcpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEsz8GN7XObjqzMZ1KcghAKH8anMsYSU30PUJ_YXY-zDsvcpA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 01:36:25PM -0500, Myeonghun Pak wrote:
> The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
> after registering its regmap IRQ chip. When that succeeds, a later
> mfd_add_devices() failure or driver removal leaves the wake enable
> unbalanced.
> 
> Record whether enable_irq_wake() succeeded and disable IRQ wake on a
> subsequent mfd_add_devices() failure or driver removal. On removal, do
> this after removing the MFD children and before the managed regmap IRQ
> chip is released. Keep warning and continuing when enable_irq_wake()
> itself fails, without attempting to disable wake in that case.
> 
> This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
> variants using the INT33FD ACPI ID.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.

...

>  	ret = enable_irq_wake(pmic->irq);
>  	if (ret)
>  		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);

> +	else
> +		pmic->irq_wake_enabled = true;

No need. Hint: we have irqd_is_wakeup_set().

...

>  			      config->n_cell_devs, NULL, 0,
>  			      regmap_irq_get_domain(pmic->irq_chip_data));
> -	if (ret)
> +	if (ret) {
>  		pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
> +		if (pmic->irq_wake_enabled)
> +			disable_irq_wake(pmic->irq);
> +	}
> 
>  	return ret;
>  }
> 
>  static void crystal_cove_i2c_remove(struct i2c_client *i2c)
>  {
> +	struct intel_soc_pmic *pmic = i2c_get_clientdata(i2c);
> +
>  	/* remove crc-pwm lookup table */
>  	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
> 
>  	mfd_remove_devices(&i2c->dev);
> +	if (pmic->irq_wake_enabled)
> +		disable_irq_wake(pmic->irq);

Hmm... This looks like another possible bug as we remove table before removing
the MFD devices. Not sure if this is okay. Can you check that as well? Perhaps
we would need another fix-patch.

>  }

-- 
With Best Regards,
Andy Shevchenko


