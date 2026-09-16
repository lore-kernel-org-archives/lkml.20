Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB644C2241
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573608; cv=none; b=jeZ8koaQXRuwjId1V014mNmZMb0OliK1IBacpRWl7d0tJW19OENWEHK9zl4aKF496/69M8qQnmN3uDrdPPzpZdyY0CCnxQUVdnXulBTqDOM1EPSPjOMG68X9BXYMVB1CBDNFLFP2gOM21klBiGNCpSxPu6IUgdaQC+5pipp8iE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573608; c=relaxed/simple;
	bh=8YfAChzzYynEpIoUqa09cY7ERZlGsWOpbfK6mHcU1vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB+e2FPIX9/wcK/L/X6YZ62x72Jd2GTJmg841knFGHogOVNMPhDMFwBssS9+CoEa5paB8gZe2GWXc8cgj3jSeu1X7Vc7mXLaP7+6pokDpH1XUK0EjnPTS60rAlX4tKP+psmUPNM5uR9fibSj/yLLEi4UDpI0I7DEBl2UuXrUpAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeoLY8Pa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeoLY8Pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789573606; x=1821109606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8YfAChzzYynEpIoUqa09cY7ERZlGsWOpbfK6mHcU1vc=;
  b=EeoLY8PaGHyzkpk2M8eJPXc6K7bNjAYOdiQQGiXPqY3FoWLjFJZRPFbK
   T1Nr78AUlT7p+3ffMA+Gin7GHzLTK6jqEiBhhiFQ9quhdHoRoe8e8jxLK
   KJfekSKttQ3usiBBWsqGogsaHVj5iW4ffd+9v/EIqbAiGdNhxU9KJ9/g/
   RUHzujX4ArJQ0Ip2yONCn0nhYUz4JjRPqOkz8TmmJaFdfcrK3+Q/XBk4H
   VrNpvElK205fOvvfaxPrXnGO77E0O7goigo4LrMAXAVTFt01aVG7GtbWg
   B+4HMhO7kw+BNp5jno+L8uJ3TB/ih4WsGgILksQy8uZ7wYM88kCHwAGam
   Q==;
X-CSE-ConnectionGUID: qhmkIFV4SZa3zVw8BSLyvQ==
X-CSE-MsgGUID: MBfGLzVdTE68xduBHjx5ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93777926"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93777926"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:46:46 -0700
X-CSE-ConnectionGUID: LtWiRUl3Q0GXr6Gcdhm9Nw==
X-CSE-MsgGUID: vlsygdZNSPCeetIajPi6NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269669156"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:46:44 -0700
Date: Wed, 16 Sep 2026 18:46:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Message-ID: <aqq54onvzmXbMH8L@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
 <20260916-intel-lpss-debugfs-v6-3-5c118ac430ed@gmail.com>
 <aqq5d5ESVulYfOnK@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqq5d5ESVulYfOnK@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 06:44:59PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 16, 2026 at 07:36:41PM +0500, Maria Lisina wrote:

...

> >  static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
> >  {
> > -	struct dentry *dir;
> > -
> > -	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
> > +	lpss->debugfs = debugfs_create_dir(dev_name(lpss->dev),
> > +					   intel_lpss_debugfs);
> 
> As Lee pointed out, we are fine with 100 limit, so one line here and below.

After addressing this feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> >  	/* Cache the values into lpss structure */
> >  	intel_lpss_cache_ltr(lpss);
> >  
> > -	debugfs_create_x32("capabilities", 0444, dir, &lpss->caps);
> > -	debugfs_create_x32("active_ltr", 0444, dir, &lpss->active_ltr);
> > -	debugfs_create_x32("idle_ltr", 0444, dir, &lpss->idle_ltr);
> > -
> > -	lpss->debugfs = dir;
> > +	debugfs_create_x32("capabilities", 0444,
> > +			   lpss->debugfs, &lpss->caps);
> > +	debugfs_create_x32("active_ltr", 0444,
> > +			   lpss->debugfs, &lpss->active_ltr);
> > +	debugfs_create_x32("idle_ltr", 0444,
> > +			   lpss->debugfs, &lpss->idle_ltr);
> >  }

-- 
With Best Regards,
Andy Shevchenko


