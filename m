Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FB13B83E0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573511; cv=none; b=fW99+FqYYq19xKD6DXi1R2PDJDnMWqLKumLDFr58xfWsqJJk4I2bIh6NioxREaV/YUrwZKs6bJvvAP4d7TQBZtY6S5Rsi4z9BzCoqkhU6VtNkxh6HvD1JLe4oBei9xiEseOYCkBexZdITduiaqo5RYIaYC0cnWB+NMogDdPtHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573511; c=relaxed/simple;
	bh=a68Tjcp6c4S+VS1zxe7C/2+j42yeWstBctWArNqFvQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGmRqTiRaBZdV72gBwLp8fogTephIEi06/KU18UvDPmAeifkMWQdueyp8yMsdVZj5mWUz8YPibRZYhaI1dFV+XDgpuoLkcD3EE7w6BVoIGTRX5bccPepb7sZCg+Li8pXncFUN71cBAu3A8KWK6Hw1yMROmCtjTcyeKv5s8zCpYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ea2pV3zQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ea2pV3zQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789573504; x=1821109504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a68Tjcp6c4S+VS1zxe7C/2+j42yeWstBctWArNqFvQY=;
  b=Ea2pV3zQVAgWU78/IAnCCwILJXm4f37Zlx6uVltLw0U3A2FlOAyY3TMu
   zqGl+mrMAZsrWG+bjGwVTPyFwD/y69r45TVIsG2qWftZrnrDgS0wFoNA0
   htRcTGLESzH8GLzjhSHZ3gfMP+uOr8LbYcIAU4vPwUW2j1FzH4mOhbuWd
   81m6xHS5UFOyDIM4/VLxQ4qIWYo5bAvCQFI802xgUkXl0zygItvEId35e
   Tlnb6BEhWX/SbGIin880xtuPMgkuNXwPue2fAuoWMWi19GwLW2o60WkhU
   GJTX0z0fHXftqdboydhMng3XvRSvW1QwMB5OfhegddAiG2U4J9/fSvs1i
   w==;
X-CSE-ConnectionGUID: yIMi+uQtRqKWrIj46/89Ng==
X-CSE-MsgGUID: VBuGmzX1TCCbHG2x+9eJrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89975154"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89975154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:44:59 -0700
X-CSE-ConnectionGUID: LCjW/1nTRQ6pEhRezuXN+Q==
X-CSE-MsgGUID: BR/Qql4DTqWIKXkkerDHzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275331322"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:44:58 -0700
Date: Wed, 16 Sep 2026 18:44:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Message-ID: <aqq5d5ESVulYfOnK@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
 <20260916-intel-lpss-debugfs-v6-3-5c118ac430ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-intel-lpss-debugfs-v6-3-5c118ac430ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 07:36:41PM +0500, Maria Lisina wrote:
> There is no point to keep the variable dir just to assing
> lpss->debugfs to it later, just use lpss->debugfs directly.

...

>  static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
>  {
> -	struct dentry *dir;
> -
> -	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
> +	lpss->debugfs = debugfs_create_dir(dev_name(lpss->dev),
> +					   intel_lpss_debugfs);

As Lee pointed out, we are fine with 100 limit, so one line here and below.

>  	/* Cache the values into lpss structure */
>  	intel_lpss_cache_ltr(lpss);
>  
> -	debugfs_create_x32("capabilities", 0444, dir, &lpss->caps);
> -	debugfs_create_x32("active_ltr", 0444, dir, &lpss->active_ltr);
> -	debugfs_create_x32("idle_ltr", 0444, dir, &lpss->idle_ltr);
> -
> -	lpss->debugfs = dir;
> +	debugfs_create_x32("capabilities", 0444,
> +			   lpss->debugfs, &lpss->caps);
> +	debugfs_create_x32("active_ltr", 0444,
> +			   lpss->debugfs, &lpss->active_ltr);
> +	debugfs_create_x32("idle_ltr", 0444,
> +			   lpss->debugfs, &lpss->idle_ltr);
>  }

-- 
With Best Regards,
Andy Shevchenko


