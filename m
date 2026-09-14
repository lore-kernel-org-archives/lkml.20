Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B674B40DB47
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374775; cv=none; b=MbQyxV2en8CP+vRsu6gyxJQlvwZQOgX6Gnyk7BCMOc8BBzQf6W/deh3kOq/eC+7iwesd3l4XWEwqJpnJx5xqfEG0hw8IJmB2QcWuPoMyFeYV/g2/GNVBjW8ug3kG6wpTvmVbmBBjh0o1SyrPkZiv7733GzU8/pGGPpbwN7GfrxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374775; c=relaxed/simple;
	bh=yYxEKBXvBD1ee5grZtppYox0uuKGFenCIwPJj3HT3Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARty/9Jw62m8FbAn0lUi1CKioEHJz4kw7OYcOdtBsTUgRyfMGuOH/eBvxs3uA5sfaQ7Qet3WKcXQBVobeGnTiXEzqQ5Me1WBdr4y7PiTYf4h8lfrGaJObFscQesp4bRZ+0aI/SSHSRrosSRYNZjKAqo2BY78dg34e0tKEuX4CaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6wH+8o/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6wH+8o/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789374774; x=1820910774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yYxEKBXvBD1ee5grZtppYox0uuKGFenCIwPJj3HT3Vc=;
  b=B6wH+8o/GWPlaPp9EAhEkPdo9mJOgCPt/0BHXQem7DWkFPYhiP5VDUt7
   tF11gAYGvyNt+GWRS/z0AVYRrk6t17GWsXGANaOiN2rJoBHkzimW9Iayx
   71duedZGnD27lQ79xkJFuwBoiwo1ac0bEX5bR59iVecS1EUHPN0TMBtlK
   IjSVCa1qTpq8o0WQcNn618+U0Qc6OWEVR/BYuSzsDxVElc605s2vR3fDt
   sFg78oMWsS3hUonBbUT2imCRFYTPkjdHQWsqkgtee9zYB3906xfgi9hBK
   vuIEebQbpHPoFrtgPOVsx3AEMPbDCmK98D6xNHrTXz6ZaYz016D9nQGQT
   g==;
X-CSE-ConnectionGUID: Ytcq6tX5T6egGZlwXolB1g==
X-CSE-MsgGUID: U2AgHsgjSZeADDPSbRf0Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89659437"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89659437"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:32:53 -0700
X-CSE-ConnectionGUID: NMBQt1ZtRGiP4G04W+vaGA==
X-CSE-MsgGUID: tuNUeGHNQKiHZA6Nc+MzEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270781690"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:32:51 -0700
Date: Mon, 14 Sep 2026 11:32:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] mfd: intel_soc_pmic_crc: balance IRQ wake enable
Message-ID: <aqexMdHnHHq_l0Y3@ashevche-desk.local>
References: <20260913013615.22615-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913013615.22615-1-mhun512@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Sep 12, 2026 at 09:36:15PM -0400, Myeonghun Pak wrote:
> The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
> after registering its regmap IRQ chip.  When that succeeds, a later
> mfd_add_devices() failure or driver removal leaves the wake enable
> unbalanced.
> 
> Register a managed action only after enable_irq_wake() succeeds.  Since
> the action is registered after the managed regmap IRQ chip, reverse devres
> order disables IRQ wake before tearing down the IRQ chip.  Keep warning and
> continuing when enable_irq_wake() itself fails.
> 
> This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
> variants using the INT33FD ACPI ID.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.

...

> Assisted-by: OpenAI:GPT-5.6

Assisted-by: LLM

...

>  	ret = enable_irq_wake(pmic->irq);
> -	if (ret)
> +	if (ret) {
>  		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
> +	} else {
> +		ret = devm_add_action_or_reset(dev,
> +					       crystal_cove_disable_irq_wake, pmic);

Make it a single line.

> +		if (ret)
> +			return ret;
> +	}


Shouldn't disable_irq_wake() be called at .shutdown() as well?

-- 
With Best Regards,
Andy Shevchenko


