Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6563B8405
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460178; cv=none; b=VA5phor/QyLvAAuUZQdf1cXYpC48GStrz70cIZnOIT1s20E/TGF5wg0AoWByGS8XpZh6kwCXRXZQk8dw9Elut57/mI+OoovOKju+k1n+4tMhREFXgTvgGPvjeWxo+61OQRNV0WEhjFF+NEZ14Il0yT/RV45XcEzMIdvHuxzrozg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460178; c=relaxed/simple;
	bh=QjfKCloivmSOZFcGW1K8mgdOTYz7B4lmOP3pqpGXp54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSY5bJE9qDuVojhspDM4FgboPwU12pELO5mcEGilJxIYLe3HDddkQ42FTiy3l0BYaDAZvnDyWLxkUpp72zOay353b40K9LPwwO2X/0Yh9+VTd9dbCeBGh24Fm3J53Q9Ii28oP3Fb3eXMSOn4QrAdU/U7h5Lwj5WVDxiWeDbJnok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U58+4EAz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U58+4EAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789460177; x=1820996177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QjfKCloivmSOZFcGW1K8mgdOTYz7B4lmOP3pqpGXp54=;
  b=U58+4EAznC4kbcNHZS/uIS50ykeDHP3mk0IAgVxzE5nxDKwxH3KQhqPD
   SBXiGRy6kIgtOv2BKHxnlm0mHvz++F1/6QkIeJtdhUAu2qwQ1pVaeR8ye
   u+MDITBm3/nckJkk16kMr2OC21NgLJTmijLqMs9OUDsEwu/xrq/2nF1lK
   T49BxIJNq2uSCzAXeecha8a9OoRop2EblURQNVqH4olbQQmTN6ZkszyeL
   SIYIeLLt9df5e+9ohw9gLbGeJM3xxD5oqe+dnFluy8CJzWWwnJUSD7rX5
   Y8zBMcO2COzQwDbdFXHk1jLMY2iO28PAnNmrqrEejnHhosIcHtrXCdfbR
   g==;
X-CSE-ConnectionGUID: QcyvOtHGRd+YoCSNQz+jRQ==
X-CSE-MsgGUID: w4mldrH4SNSOPA56layuWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93640096"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93640096"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:16:16 -0700
X-CSE-ConnectionGUID: CJh6SlllT1O5pa22VkT8DA==
X-CSE-MsgGUID: EmWw3GV+QWmCRIiBCh3Yfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="266666702"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.203])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:16:14 -0700
Date: Tue, 15 Sep 2026 11:16:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2] mfd: intel_soc_pmic_crc: Balance IRQ wake enable
Message-ID: <aqj-zOf7VhWlGqg3@ashevche-desk.local>
References: <CAGEsz8F1hk5UpR0tJ6LjnbTKTyfKAxu6E9=7TLM_ABgodF9TdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEsz8F1hk5UpR0tJ6LjnbTKTyfKAxu6E9=7TLM_ABgodF9TdQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 14, 2026 at 03:18:51PM -0700, Myeonghun Pak wrote:
> The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
> after registering its regmap IRQ chip.  When that succeeds, a later
> mfd_add_devices() failure or driver removal leaves the wake enable
> unbalanced.  Shutdown only disables IRQ handling, leaving IRQ wake enabled.
> 
> Register a managed action only after enable_irq_wake() succeeds.  Since
> the action is registered after the managed regmap IRQ chip, reverse devres
> order disables IRQ wake before tearing down the IRQ chip.  Keep warning and
> continuing when enable_irq_wake() itself fails.

> Shutdown does not release managed resources, so explicitly release the
> wake-disable action there if it was registered.  This also removes the
> action, preventing a second disable during subsequent managed cleanup.

Why? If it goes to shutdown, cleaning resources makes a little sense, no?

> This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
> variants using the INT33FD ACPI ID.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.

...

> static void crystal_cove_shutdown(struct i2c_client *i2c)
>  {
>  	struct intel_soc_pmic *pmic = i2c_get_clientdata(i2c);
> 
> +	if (devm_is_action_added(&i2c->dev, crystal_cove_disable_irq_wake, pmic))
> +		devm_release_action(&i2c->dev, crystal_cove_disable_irq_wake, pmic);

Is it legit to call devm at this point? When is .shutdown() called and what are
the assumptions before and after for a certain device?

>  	disable_irq(pmic->irq);

This looks a bit ugly. Can we start with no-devm? This will solve the above
question as well.

-- 
With Best Regards,
Andy Shevchenko


