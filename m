Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677924734FD;
	Wed, 30 Sep 2026 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759933; cv=none; b=NDQ9OWUmBZX6T1h1uuBs9OsYuWUwedil5ERjHIy6zPe30gkMWXAW9Ujw1GRT7l+Wp/Lqu8cwU3CTo4smMWtZhrRpbztviF+vBjLRLrvjAizQ6AxzGAdEYe0WW0mvKFPMAdw73D5FRYJmw7dl2MOQByyL12HNr0XoIStFZ3e0PU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759933; c=relaxed/simple;
	bh=ur94HM4NCGW1jH1XMX+Z74cc3paQBBqXZ1coP0AVx5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbB0b2MfbMnREjyQTOHTYwVeB21YRDRZ6FcDsNH+GGjsiBQVa/ppAy+a8IYCpzRJGquImuXEAyKD+7eFi0AUcajVNulbnLwys0UkU0CMD7WFs5eLVVCmkjZI4GJNffIQPNr0coqTvUfcAsUVdpuCu+Ksu9FPVON6I9hpRNvInOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjnAG+IJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjnAG+IJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790759931; x=1822295931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ur94HM4NCGW1jH1XMX+Z74cc3paQBBqXZ1coP0AVx5o=;
  b=NjnAG+IJxt42ba0+eBtmZ+A/bfosB0KaF4jtHaJitTb5ZvUXqyOwGICY
   u4yp8m9sfOFSxhmLaB0slfcvKcdNcAO93yZLPYeY2w+RF4OaMU87EmQBF
   yINJaj8KSNZfnr+KjQllDHc7Sl4z2usvIKT0YogNQFO6CmP+D/3FzqBt4
   Zckd9BdFFrq5MR5en7ZwUol5ONUmtQl8RHPLHFAF76QFh50KI1zeRlXW9
   FmqirZw2elV/ZIXFDtGue6Xowj20bPZiqtg2LuwL388OJZpgBIEoKgVlF
   aAmZscpCS77P/AWp6T4dV4ebNxUklOJ7dViCk39sMZBDUeCY0o0OYFMDR
   Q==;
X-CSE-ConnectionGUID: FAglAA75QL25Rtk5MFvpMA==
X-CSE-MsgGUID: 1GmrQQjuQK65CEqhtq8zaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90543384"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90543384"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:18:48 -0700
X-CSE-ConnectionGUID: zloNdDUDRc+dC+Jn4Hqfog==
X-CSE-MsgGUID: CItMX/BwQlaX6UY/zMpfog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="278841742"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:18:46 -0700
Date: Wed, 30 Sep 2026 12:18:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sakari.ailios@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 2/2] staging: media: atomisp: Remove dbg_level and
 dbg_func module parameters
Message-ID: <arzT86qPj-GOFRP-@ashevche-desk.local>
References: <YOUR_ANDY_EMAIL_MESSAGE_ID_HERE>
 <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
 <20260722054615.21492-3-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722054615.21492-3-prajvalchaudhari733@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 22, 2026 at 11:16:15AM +0530, Prajval Chaudhary wrote:
> Remove the 'dbg_level' and 'dbg_func' module parameters to align the
> driver's debug logging with standard Linux kernel printk infrastructure.
> 
> Previously:
> - 'dbg_level' controlled trace verbosity level (default 0, up to 9).
> - 'dbg_func' selected whether CSS trace outputs routed to printk (1)
>   or remained disabled/unrouted (0).
> 
> Since module-level custom parameters duplicate modern dynamic debug and
> printk capabilities, remove them and filter trace messages in
> ia_css_debug_vdtrace() to IA_CSS_DEBUG_WARNING or lower.

...

>  unsigned int ia_css_debug_get_dtrace_level(void)
>  {
> -	return dbg_level;
> +	return 0;
>  }

I believe this changes the flexibility of the tracing. But like I said, the
whole infrastructure should be switched to use trace events and trace points.

-- 
With Best Regards,
Andy Shevchenko


