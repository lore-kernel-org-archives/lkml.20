Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD46A3AE1BC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479133; cv=none; b=uBreXAFvWqCksOK6FSbRvVLHkLpxLQzOMxWrgWXXZ2Ur1HV/gTM54q04ViXGf3Nq7K696utOG+Dw+YsDEDJBaCJ0kKIRdIpCwjjXwDd/37q4QxfasStvRu/505IZF4ZCZFU1Pg13/o9THnkwXEvVBVgz8umIPJWwIWMpvGGhhYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479133; c=relaxed/simple;
	bh=x5HiqYFKHRuwy2OEv3uAUh5ZieUJ005qiTjbTzehe0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyLROW02V5ro3hM0XmyiiPcSUnWWJFgFt3b7PGEBw0Tpd198NGmJwbDCdCfMIr7jXZM3h1gnjdz0ARITo7SKWYQ28MrV9AUalMTYLmWgeSkGbnH4AOaCur6hQnEA83Xx/X/sFFr/2lEDTxhOnES0BCFoEs9AuEm9t5LQbz1gEG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FED0R6us; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FED0R6us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789479133; x=1821015133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5HiqYFKHRuwy2OEv3uAUh5ZieUJ005qiTjbTzehe0M=;
  b=FED0R6usk83MRrFeH3+g1SZOPxWaO9eiWTP01dKrKIUokJYtIIdHMS6t
   6io7fU40AO1x510AQpzOb+70A+rd2DRTa+sLbNH2HyoR/1FYe7PBLmhFP
   UyKeFMCVBwBhvKvcPswxaga+XCbiB2gbOFiNo5ynspglFVq9Bljv9GTEk
   FTp4MbGrYT8++MuhzXnnTeUB4I6NrVBad4TnUGF5ZvlhfekPA2ufOi/gb
   vUrTw3h7h55tCyTOhIe+YkAN3GLz2h65hxsEmJV2d/XPbkRIH+eB+PZv7
   tGVEFKdIFcaJh1Qu66teM06GRC9EP9eUWzHb5UPH/71SvbAc3n8ii4Gl1
   A==;
X-CSE-ConnectionGUID: VWj1T+ieR3aNYWZdU/wV7A==
X-CSE-MsgGUID: uecelx3SR6W4MKEZTCCMGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89684318"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89684318"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:32:13 -0700
X-CSE-ConnectionGUID: PmsPTjqBTfihcvQvl5XfoQ==
X-CSE-MsgGUID: Pn0bhtKBSoiccnMNVL9iFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278275809"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:32:11 -0700
Date: Tue, 15 Sep 2026 16:32:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: sekoohaka.sarisan@gmail.com, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mfd: intel-lpss: Fix DebugFS initialization
Message-ID: <aqlI2HgMCVyF1Xci@ashevche-desk.local>
References: <20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com>
 <20260915110222.GA11487@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915110222.GA11487@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 12:02:22PM +0100, Lee Jones wrote:
> On Sun, 13 Sep 2026, Maria Lisina via B4 Relay wrote:

...

> >  static int __init intel_lpss_init(void)
> >  {
> >  	intel_lpss_debugfs = debugfs_create_dir("intel_lpss", NULL);
> 
> Why not move this and everything else debugfs related to
> intel_lpss_debugfs_add()?  Then we can get rid of the awful global
> variable, have everything nicely compartmentalised and ensure that we
> handle each fault gracefully?

This creates a directory under the root of the debugfs, so if you want to have
that not at the driver level, but at the device, it must be a singleton op.
We may achieve this by doing DO_ONCE_SLEEPABLE() from once.h.

Also note, this won't give us the possibility to kill the global variable, as
that one is per-driver, not per-device.

> > +	/* Ensure intel_lpss_debugfs stays NULL on error,
> > +	 * so intel_lpss_debugfs_add() exits properly.
> > +	 */
> > +	if (IS_ERR(intel_lpss_debugfs))
> > +		intel_lpss_debugfs = NULL;
> > +
> >  	return 0;
> >  }
> >  module_init(intel_lpss_init);

In any case it's orthogonal to the purpose of this patch AFAICS.
If you still think we definitely need to use probe (which I think
doesn't buy us anything but troubles with singleton), I can do it
later on.

-- 
With Best Regards,
Andy Shevchenko


