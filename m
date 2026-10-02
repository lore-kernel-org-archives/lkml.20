Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D32424649;
	Fri,  2 Oct 2026 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925324; cv=none; b=rJtBZKmAe1uvQJhtRdg4ZdK/DXP3iNmXa0O2eKtFRQcjDhsCESY81pAPHvUtzscod1TlVKmjaLCgGoLmKs3iyfyt3NeJP6NibZNywduZxeYUtRcvvRmqwuiO8OMiLeQqlIxLyW8yrpBbgXk+4zd86dNrxhoyRUoCSSAOGIzq1eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925324; c=relaxed/simple;
	bh=ppE6w9BUMmayZmjImvfyemhQPYvqx5Dy+jg+id4FaEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbmxmfdauX0dUYGn4H72tnxLLzuasiZWC9DucTAEmwZkYqiwOaGGnE8U+0FUc9JS/ZeQSo3fHPfhsxgo1DyXsldfvdjnUBb7lV11A8J6UHvYs76R62lGzpHwfNRxOgED96Mloy0v+K8ssF3SeuVnl2CvpV1KH9y8onxFra8Lylk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eyva8Tjq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eyva8Tjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790925321; x=1822461321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ppE6w9BUMmayZmjImvfyemhQPYvqx5Dy+jg+id4FaEQ=;
  b=Eyva8TjqGG42gJ0xjVyTkYXj36DVHy8SUeqJ2st4AjxaLhdAGYFNoYn1
   iCopDlKFcm1bcNBMKtUaFHpZFJffdvRRo5Uh+TXgNViSYnGYK2MVFqGHK
   nDJWVTQXKv8RWoY7bbrXUIfifJgLBp0uGapREZ3BfatPKMS454osKoh53
   tT0MhvnmlX7iRp8fNexy4gVf3G2HI5ZKSAcgJ+++mwhJ5kAT3/UV77/ax
   FDX6PDhYxPtbdsfmiU9tyzmbTekFZNOaGNE5/gHo5UEiXKYafuuX2bNIh
   v/k2aS+2J5fabja1hozYg/74bSfHTI56u13QZS/s8iRVZWxeXUcr8F5Nr
   w==;
X-CSE-ConnectionGUID: 6jkdYzsBQdCfRy/kUOLCtw==
X-CSE-MsgGUID: r/g3yO2DSaurLudG3JTqig==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="79248611"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="79248611"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:14:34 -0700
X-CSE-ConnectionGUID: Fqi0R5hcREOACToIlmaV5A==
X-CSE-MsgGUID: woheUWvhRSSNnC5IjCVhkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275383044"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:14:32 -0700
Date: Fri, 2 Oct 2026 10:14:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <ar9Z1Zr-deCCQ1nx@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com>
 <ar674__4-cNOGMMy@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar674__4-cNOGMMy@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 01, 2026 at 11:00:35PM +0300, Sakari Ailus wrote:
> On Wed, Sep 02, 2026 at 04:53:31PM +0200, Maurizio Casciano wrote:

...

> > Link: https://lore.kernel.org/linux-media/apf7cJOoXrl_wZfr@kekkonen.localdomain/

Most likely wrong tag. Why is it here? What for?

> > Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> > Assisted-by: LLM [Codex] [Sparse]

Please, find the correct format of this tag in the documentation.
Should be (if I'm not mistaken)

Assisted-by: LLM sparse

...

> > -#define OV8858_LINK_FREQ		360000000U
> > -#define OV8858_XVCLK_FREQ		24000000
> > +#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
> > +#define OV8858_XVCLK_FREQ_24MHZ		24000000
> > +#define OV8858_XVCLK_FREQ_19_2MHZ	19200000
> 
> Why to use HZ_PER_MHZ for LINK_FREQ but not the rest?

Because we do not do floats in the kernel. And hence for the consistency's
sake.

-- 
With Best Regards,
Andy Shevchenko


