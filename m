Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DB4D5A1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454776; cv=none; b=OrpRax7bXb7NL1OiJ8A8YBZd9LxZikSuWVMld8C7vxGQMoL7MiU/7LlYlphEEVqfQv4BAFXbLYURmXCw00GqEd7glxw+QF7G2FZGjfTEE/ifWgWmQUl7o9YBl3JIW7+eAgQM9f/1XWgy5ZJcolP8Muq5/Zok7ypYeZwStET/f84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454776; c=relaxed/simple;
	bh=1cxC1xyc7rLN0Cq0Lvl3Awdci4A7vuFx75SfdtBOgqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkfmQGmSJfWy4dtwLG4caa8ig98HKLzeiAhuowuv6aIPnX0OdmEKoxWRCFMlFzttfr0rwtYkJZQzIaZ7Lh12IiGu6myf8cmF6XceeTqBY35TQxJdR4kpqP+buVVx05BIvB46bwTbGdTGx6X5QgzhZB2HKpotZu/PLHz3gSTp2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjXPPFDM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjXPPFDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789454775; x=1820990775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1cxC1xyc7rLN0Cq0Lvl3Awdci4A7vuFx75SfdtBOgqg=;
  b=EjXPPFDMl4sGwGBjZUlhFf+qvkeC9GcE4Yv/Lg24Fxfdxrk1WcdkGVxh
   xJb0lKCIt+eNdh8pz/IHjOqN2lsBxSKo0ISEvnXsu79NaJ2PeODpFHndc
   Rx9ongjaq4wAZQzMVWD/cypQx//mHJ7Cr4RKsYa4E0ElDvJAKvYfs1E5b
   Lsy5ZGBuwffgJJkQHyzUwAOGID8Ad0JL45Yk8hHVZ2D3Ex86Kmn8F++zr
   aCaiAp8TzWC7vHoH4QXTDeErGUziR0hOxYi9+hp+Mmhcnlg+GsNKgKWoJ
   cBTV1vJW3M/CTbI8Rb1eQcmGsJiHQvmVXmbVGl5cCz+phJagLev032Eum
   g==;
X-CSE-ConnectionGUID: vgswAteaQ725RWW0GmFdig==
X-CSE-MsgGUID: 1atxMGtiQiuK0E0EVmYODw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88748604"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88748604"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 23:46:15 -0700
X-CSE-ConnectionGUID: PgySGGHzSLO9P3sHAPYFxw==
X-CSE-MsgGUID: FsG6xCqLRNqBx2W2Emb2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311138702"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.203])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 23:46:13 -0700
Date: Tue, 15 Sep 2026 09:46:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v4] mfd: intel-lpss: Prevent DebugFS messages if it is
 not initialized
Message-ID: <aqjpsq0OzZjkl0eo@ashevche-desk.local>
References: <aqftQrjT5RtIn-Ax@ashevche-desk.local>
 <20260914142737.603133-1-sekoohaka.sarisan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914142737.603133-1-sekoohaka.sarisan@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 14, 2026 at 07:27:37PM +0500, Maria Lisina wrote:
> I'm sorry, I didn't notice the part about commit description.
> 
> Also I don't really get it how is this dmesg message mandatory
> when DebugFS is completely disabled. It makes no sense to me.
> If user needs these LTR values for debugging purposes they should
> know about DebugFS. In other cases when DebugFS is disabled these
> messages shouldn't even appear as these LTR values stored in DebugFS
> don't do anything, at least if I remember correctly they aren't used
> for any purpose other than debugging while being exposed in DebugFS.

This is fair point, but the patch does something else.

In lieu of the above you can propose a change that moves
the intel_lpss_debugfs_add() function to return void and
drop the message completely justifying it as you put it
here.

Something like this (but in mangled form)

-static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
+static void intel_lpss_debugfs_add(struct intel_lpss *lpss)

-        if (IS_ERR(dir))
-                return PTR_ERR(dir);

-        return 0;

-        ret = intel_lpss_debugfs_add(lpss);
+        intel_lpss_debugfs_add(lpss);
-        if (ret)
-               dev_warn(dev, "Failed to create debugfs entries\n");

Would it work for you?

-- 
With Best Regards,
Andy Shevchenko


