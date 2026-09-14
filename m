Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E0932B989
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789360201; cv=none; b=HKIr18oBZr7r2RJ7RLYb7eALaI/1CdO/jqplkCUweOWR7WDFMQSBo9YRwKwkJXBJpmoI4eyTt6ZolzEtNhSnCXxyzelga1UE7mpz+rMC9LgZnbfL9RztsXLqQjEiS1rmVot99YLd29rsVsZ8EAuaGs/z7kNQeEDws44rT7LVi+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789360201; c=relaxed/simple;
	bh=zuFdopvoJZIg4s5BdB8/GnhIh0rcX0tuW5HGxwYz5eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2z8Ry/4pvYf8JvNXenomi+4BMZDrAU+5TpqrCMb4XMF7nZfslr1NVW1Bh9Y4wWWHdW3sZeXNIp97WUm6qiq6fbNHxB0ZfjJuSeKd8MP90MPLWWIO49MIdxd0IonA2PubuLUn1iyPUoB9Cpz1K1Sj3/7CuCUtYGj18W4HZBhqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsFvEgg7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsFvEgg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789360199; x=1820896199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zuFdopvoJZIg4s5BdB8/GnhIh0rcX0tuW5HGxwYz5eU=;
  b=fsFvEgg7dnxGognl7KKaWgzbScWFYLar85PrukV6TYA+ugsh1kW7oRJV
   CJaTicxWhisO5dFkiHEj9DABY3emUwzuZx/l581KyYHkOiTZ3AdfVujNx
   e7Uy+szo+vPG/gCWXeDJ/2Mj1YMYWi6XH2+va58DY8fUis4Rn1Yi3JTNP
   XTjouvOfNjbolhWGOr3/I6xvisQ3kRfFHXHb2LS1RV4hA7ekARycP48xx
   1611KEL4Kks85dvS0Q00TuYtPU6YKUN5yP6EranQE1+GW+ioqRO8uR1Fh
   tfJn2oz1fYNOW509V2sJ7HzC98PPSpDIKIkIV1eUcJdKPqwb1bTVAbDLm
   A==;
X-CSE-ConnectionGUID: bAk8Y5qOQl2TwkOGE0mHig==
X-CSE-MsgGUID: f+3aVvIsSBW5j81fIRS3yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="92222710"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="92222710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 21:29:59 -0700
X-CSE-ConnectionGUID: /kiGRS6SQwqR8ySwwkepVQ==
X-CSE-MsgGUID: /xxfBCbaTTqxkGfULcugdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="268241738"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 21:29:57 -0700
Date: Mon, 14 Sep 2026 07:29:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sekoohaka.sarisan@gmail.com
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mfd: intel-lpss: Fix DebugFS initialization
Message-ID: <aqd4Q2xYQjChX5tD@ashevche-desk.local>
References: <20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Sep 13, 2026 at 05:53:53PM +0500, Maria Lisina via B4 Relay wrote:

This is a fair report and patch, but three versions over a night?!
Please, slow down! Even with this kind of patch you have to wait
at least 24h between versions.

> The original code defers DebugFS check with unnecessary warning message
> which also appears when DebugFS is simply disabled.
> 
> Therefore it spams dmesg with these messages:
> 
>   intel-lpss 0000:00:15.0: Failed to create debugfs entries
>   intel-lpss 0000:00:15.3: Failed to create debugfs entries
>   intel-lpss 0000:00:1e.0: Failed to create debugfs entries
>   intel-lpss 0000:00:1e.2: Failed to create debugfs entries

One message is enough as an example.

> This patch adds proper checks to intel_lpss_init() and
> intel_lpss_debugfs_add() functions and removes warning message.

...

> -	ret = intel_lpss_debugfs_add(lpss);
> -	if (ret)
> -		dev_warn(dev, "Failed to create debugfs entries\n");
> +	intel_lpss_debugfs_add(lpss);

Obviously this message is added here deliberately. If you are annoyed by it,
we may consider dropping the level.

...

> +	/* Ensure intel_lpss_debugfs stays NULL on error,
> +	 * so intel_lpss_debugfs_add() exits properly.
> +	 */

/*
 * Wrong comment style for multi-line
 * comments.
 */

...

TL;DR: moving from warn to info or debug level  would be a good compromise.

-- 
With Best Regards,
Andy Shevchenko


