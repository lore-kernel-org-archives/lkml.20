Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452D3C09F5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167640; cv=none; b=Z3fDxEOT6+dAsvgHcoQswXEGecnFgTlA2mCM4rki/dXBy4vdwNNbiNcE+R9o6KWnepQqTpvaw1XNhV7XavI+h1foiUyVsWLNjGZN/ssPviM1XR7myBf3XjJszRM/DGZ8pM7iw6elSujsi3vm3oCLy/pZaMOlGGwJSoKMftrJpXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167640; c=relaxed/simple;
	bh=/fQ2DT1irxSlo114J6VEqNQTdDnJ0Nlh0JTEno87vNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9sijtb92XoT+Ga19Depwet3dATbDPKVLcA+P+hS7//f/x/4by5TmUKfU1e5I5IFMBbZB7MAYtke3vUIJA/AbaDlG4D3PPWYr78oJpP2aQ88EJq5Hf+bgAndF3jyp1fBBEv7+ujbqYYFwPo+3dmEwikIAuOziXMCMpKSoxsJoDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyJcV0TQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyJcV0TQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788167639; x=1819703639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/fQ2DT1irxSlo114J6VEqNQTdDnJ0Nlh0JTEno87vNA=;
  b=DyJcV0TQzlqCbUOxelsvKvYfT8SYDUzF1sej50WTRErSy3Xmh09aHOUd
   KCPRUcPDzdOsc+ooduKh5XUmAhXojVI5sr3rzKtNGNqRALdYViEDRL1pp
   vYHHa2eQkJx78wU5NeD2tGbXl+r+qwkLqhNtOkpkNvWVKX3dX91/3k3K9
   +h91/ZoG9/s+8baH+Zh/tX5HEHuPwvRodHsmMTeTD1KpncnfYl6pK+TX/
   MN0ycABFAfOoVl8IrCR1vDoDNygMSMZesmRUx1eRXsjVOFfWCTPyjTpo1
   6uD7WQ5JI83zcRp9Y8U6l3y2swGUfszEPgE9zZMuTtptRoWg+HOm0xov+
   w==;
X-CSE-ConnectionGUID: 8lPM0RJEQJ+u6IW2Qn7LOg==
X-CSE-MsgGUID: ISG7y0RUS6aGiAvfcE6sjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88446254"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88446254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:13:58 -0700
X-CSE-ConnectionGUID: cVMnim6aQ9i/39wPQ9wAZg==
X-CSE-MsgGUID: YAsZTuWtTJqGOdtzaUrhTg==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:13:56 -0700
Date: Mon, 31 Aug 2026 12:13:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] phy: core: Add common helper for get phy phandle by
 index
Message-ID: <apVF0kdgA1f_MdgB@ashevche-desk.local>
References: <20260831025319.94886-1-inochiama@gmail.com>
 <20260831025506.95548-1-inochiama@gmail.com>
 <20260831025506.95548-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831025506.95548-2-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 10:55:04AM +0800, Inochi Amaoto wrote:
> Several phy helper use index to get phy phandle of a device node,
> add a common function for the future reuse.

...

> +/**
> + * of_phy_get_by_index() - lookup and obtain a reference to a phy using a
> + * device_node by index.
> + * @np: device_node for which to get the phy
> + * @index: index of the phy from device's point of view

> + * Returns the phy driver, after getting a refcount to it; or
> + * -ENODEV if there is no such phy. The caller is responsible for
> + * calling of_phy_put() to release that count.

Use proper syntax for Return: section, with the above kernel-doc will warn.

> + */

-- 
With Best Regards,
Andy Shevchenko


