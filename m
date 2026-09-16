Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670574AFE14
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556516; cv=none; b=J/Mq0lktFDG55dohndsYdEmSCLU3xZGkcl1ULAUkBWjMbQojzH/P0q9uuRLjxE/xmP7hale4mRFEoZFqWz16oVuqjcdvOYcf2/W87uwGR2DcV8sgjTjAQF8Ab8Fu0ALTOcHiymVrbuIQLcYqWSXmMVpAC7mmZUuhZYOGp9GxVHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556516; c=relaxed/simple;
	bh=ZgHhEaRahJwkbaHFYWSN4ZGdYIdpQi0S6GSbhcaGKLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnB43+6pp53+rbc3sNA5lAeTkwvwJK51JXtL+A0WZTKIQQtUnFCIgK87SJuPjG/u2UeWL33fcfa8vxdCgWDdtSFT9ClI6aIgOp3+FEmjd4fQFWVRZjj1ekfaLLdmskUi6RP/mrJI6Ht7tg6YlKzgNqjhrIWWMQt7BJ1vLcBIYLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMoBZ32u; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMoBZ32u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789556506; x=1821092506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZgHhEaRahJwkbaHFYWSN4ZGdYIdpQi0S6GSbhcaGKLQ=;
  b=lMoBZ32ud1H1Kg04FdBBb9cGvfgShZj7NWKgD1pUmX7c/ysULnXuAA3+
   DXqnPPjzMEOMf7nzwm6jStRp03vhvntjNS3DZ3JOwOcmjd76FQwhKsZdw
   3TpQRaUX80blhpPE3tzjF0cqTo20Sk6O3xoi0wzxxX1DF7iFoTh+aDT7E
   t49NDbNKoIeQTiQ5LJmybBcJIjqf/un8sNtkzdwWXDHz7X3R8UXJrmuk2
   EmYoYDjQyBrDWKzEe1KvPDMFnMx7VyxWff/dXFy/Vtslnfz/+IsbrOMgI
   ldDrPpmVE1D5nTUi3+3fmIuDmDUNQEtR2isRaZgAmw/wDnUrV2RWC6qRt
   A==;
X-CSE-ConnectionGUID: pAfEShn2QsKsvvmG0NrIZA==
X-CSE-MsgGUID: I3vzi7FBSACRKyh7+W4FSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89685110"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89685110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:01:44 -0700
X-CSE-ConnectionGUID: xNBFxqqmSLGHbHlQEmX23A==
X-CSE-MsgGUID: +Mm8Fq7hTqmIU2PoHWqeuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269040543"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:01:43 -0700
Date: Wed, 16 Sep 2026 14:01:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Maria Lisina <sekoohaka.sarisan@gmail.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mfd: intel-lpss: Clean up and modernize DebugFS usage
Message-ID: <aqp3FMncWrzR1adT@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
 <20260916102732.GJ11487@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916102732.GJ11487@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 11:27:32AM +0100, Lee Jones wrote:
> On Wed, 16 Sep 2026, Maria Lisina wrote:
> 
> > The DebugFS API is designed to handle errors gracefully.
> > Any explicit checking on return values is considered an anti-pattern.
> > 
> > This patch removes unnecessary error checking and converts
> > intel_lpss_debugfs_add() into a void function.
> > 
> > While at it, this patch also clean ups legacy and deprecated usage
> > of S_IRUGO macro and debugfs_remove_recursive() function.

...

> Why continue if this returns an error?

Because we don't care.

> > +	debugfs_create_x32("capabilities", 0444, lpss->debugfs,
> 
> Does this accept a NULL pointer or an error in parameter 3?

Yes, debugfs is designed to be used without checks.

> > +					   &lpss->caps);

-- 
With Best Regards,
Andy Shevchenko


