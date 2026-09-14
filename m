Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAEC481236
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390152; cv=none; b=MxTNakIGnvqW3sklf9EzVuimlHNPShKtb35zf+rxMoUr4hDZYGlG9Dg2ohZizA/1L60b33CxJXUH7Yn9ibp0bGv7847NyIFT1azsAtNx3qTnFldAiAQRT8qJMjnBiSD8FsSVsFwAqhijeMFCrGI2W9gltnHeg4OiYbQYHtdW+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390152; c=relaxed/simple;
	bh=Va6TxsOvVU0H8fPHx+7CmH5OtXBpMCgkGRTK5de67gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z98vTKNsm7+U6ejbfWKK82TiJ8+8drBDYwU88gwEepQSQtUMS2s1HC2UzKIo0qOQ0KQmr1A8/FiIWazUslAODFI6pTofcS9AsYEoyPAO1LFIAWUdDW4Iq+44K/YLXzkML7jfKuwN9vOsv/AU69z8jZAGICphAnESNLrGBsKbKXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuY7h/ck; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuY7h/ck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789390151; x=1820926151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Va6TxsOvVU0H8fPHx+7CmH5OtXBpMCgkGRTK5de67gE=;
  b=SuY7h/ckqB78GLYoIfWIX8yG/6wQ2m//RPIaI1fxY519XYa64iSaXfOQ
   kSzenSW18+prRlKQYa2c7vTYfWFk74pJwuQtlpxKOnkTEk19XN402Ixwt
   OjW9UpYZVFrvZ6Mi7QL1unj/DXO3TLdssF55KKroww/ng8arrfcZskS+S
   klDhmGDGKHFCoAzNVJG5p6Wtw8AkCxDV/cnELGbbRAAMKMnjb/3q+aK9W
   0QyOcYg2363Rjq/rdOXKIxgeQyWN0j1EqIIpM963vIJQ0CS1CU5+3omps
   8YRH6dEtDfQcqKWfB9dckg7/h1qKL6yagGiyfyl/cQqDaf3GoHabO6lnb
   w==;
X-CSE-ConnectionGUID: FQJ3JFv5TrG7vhW3ZAaL7g==
X-CSE-MsgGUID: p0pv08ebTdmJtOs3D+qCdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="250073"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="250073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 05:49:10 -0700
X-CSE-ConnectionGUID: dAeJPzQwS2ecvsZBrjFKXg==
X-CSE-MsgGUID: YUlVYx26SzuJLkLcYX8WDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="272127418"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 05:49:08 -0700
Date: Mon, 14 Sep 2026 15:49:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sekoohaka.sarisan@gmail.com
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mfd: intel-lpss: Prevent DebugFS messages if it is
 not initialized
Message-ID: <aqftQrjT5RtIn-Ax@ashevche-desk.local>
References: <20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 14, 2026 at 04:21:31PM +0500, Maria Lisina via B4 Relay wrote:

> The original code expects DebugFS to be always initialized which
> causes unwanted warnings when DebugFS is simply disabled.
> 
> Therefore it spams dmesg with these messages:
> 
>   intel-lpss 0000:00:15.0: Failed to create debugfs entries
>   intel-lpss 0000:00:15.3: Failed to create debugfs entries
>   intel-lpss 0000:00:1e.0: Failed to create debugfs entries
>   intel-lpss 0000:00:1e.2: Failed to create debugfs entries

In previous review I pointed out that one of such a message is enough,
no need to repeat it for each LPSS device in the system.

> This patch adds proper check to intel_lpss_init() and
> intel_lpss_debugfs_add() functions to prevent writing to
> uninitialized DebugFS.

...

> Changes in v4:
> - Keep the dmesg messages, instead check whether DebugFS is initialized
> - Link to v3: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com

I mentioned that switching to the debug (or info) level is fine,
I'm a bit puzzled what this version is trying to achieve. Strictly
speaking the debugfs is designed in the way that no checks are
required at all. In this case we want the user be informed about
this as debugfs carries the LTR values.

So, I expect to see dev_warn() --> dev_dbg() or dev_info() in one-liner.

-- 
With Best Regards,
Andy Shevchenko


