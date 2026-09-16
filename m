Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF73C4418E4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543420; cv=none; b=FGO80h9TDXk5Y4pJbTs/Sih1gaqPo+T0WUYSRczNXOOkgmjLFVL2y7UgvQwHk3C1iGG1/wIbBkIBLCKvQ0TFrTorzA76li9grkQV1h6toC6tF+6AHaPFCJkuJuJBA6jz6zMHX7xS683DLUUHddU87SqJMkeJWdN57B1aq2BRfoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543420; c=relaxed/simple;
	bh=dRoAeA74q2QI4UIwipkW3XzvOQdsImwmZhpmB+2UJgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyTwveaaYEIcaapFJSVhqPipuUFqKcdQ/LRhrgN31NQsBvg+56CW8nmf2yEUbM0KQxd3JLEoHUDaOUFYc7nIc8WFcdwEABgnOdZTYpaoKjI7GbKuObSD5TnivBw0R8u6rboA2mjzt+U2JRu7cwoRHHjTb+W2BLmntCaaJ0bgH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTg72EQC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTg72EQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789543405; x=1821079405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dRoAeA74q2QI4UIwipkW3XzvOQdsImwmZhpmB+2UJgU=;
  b=iTg72EQCl2kYxG7Ns5WD82y2oiPQF9nvtxbKrTc7E/hwlwHi8WdCNcQI
   LGyWh6UTasVqULeZlcZFAm/1Yftgtckt4zZ3VanHPNyaPQq3hdE4u7Boa
   k6hlSF/0eSZLJd6JxGnPmAt9a5aX7SsFOtAytC+VPpAf0xFqC5X9sS0m/
   znKK5IY1lk/lfXtGYhjLuWX1d7JrvVMRw4U9ctKroXXUha4rCoCV4SoS/
   OorG2wH72IFkF7h8+JfYqk3SMNo13CJ3W7X2VOWYYxIeVNuKLMeP05bGl
   QN7L8mfO8T7yClm7yHCN92ienRWNHCoZEnRGAST6OZde3trdkhHYikWNX
   g==;
X-CSE-ConnectionGUID: h7gUq5khQ3yyBSKSTrwm/g==
X-CSE-MsgGUID: mFHfthfRTMKGeXzoMWRCRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89670553"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89670553"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:23:19 -0700
X-CSE-ConnectionGUID: pR30zu/vQpGrFrujS6ypPA==
X-CSE-MsgGUID: U9kF4cAXSzmZHNUIWdHP7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277376952"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:23:17 -0700
Date: Wed, 16 Sep 2026 10:23:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mfd: intel-lpss: Clean up and modernize DebugFS usage
Message-ID: <aqpD4q6jMw2FdArD@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 03:13:35AM +0500, Maria Lisina wrote:

Thank you for the update, my comments below.

> The DebugFS API is designed to handle errors gracefully.
> Any explicit checking on return values is considered an anti-pattern.
> 
> This patch removes unnecessary error checking and converts
> intel_lpss_debugfs_add() into a void function.

Yep, these two paragraphs are good!

> While at it, this patch also clean ups legacy and deprecated usage
> of S_IRUGO macro and debugfs_remove_recursive() function.

No, this should be a separate patch.

...

> -static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
> +static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
>  {

> -	struct dentry *dir;
> -
> -	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);

> +	lpss->debugfs =
> +		debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);

> -	lpss->debugfs = dir;

This is unneeded churn. Yes, I understand that dir won't be used, but if you
really want to refactor do it in a separate change.

>  }

...

>  static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
>  {
> -	debugfs_remove_recursive(lpss->debugfs);
> +	debugfs_remove(lpss->debugfs);

Hmm... Why?

>  }

...

So, if you really want a refactoring, split this to up to three patches:
1) drop debugfs checks along with the warn message (as your initial goal);
2) replace macros by plain octal values for the permissions (optional);
3) assign debugfs directory directly (optional).

-- 
With Best Regards,
Andy Shevchenko


