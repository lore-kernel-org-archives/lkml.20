Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101374BFE9E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156586; cv=none; b=KSuOPKCG01wL4gs2QrgHRBidFBfTpDqhThZCgxFUCO5ejcXk61TBZovkJAUK8S7Zo7GPN+UE67Q/WGsaGLi3xWhDPcRbOauTPFh5DpZmzZ8J+DzK1eEDM11ob4uFhV1Ss3yHv6ci5CCN61Rgzzchh4/kSie2GDVZkKvO8uyVZ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156586; c=relaxed/simple;
	bh=+Kn129w0gmug+NGjkG6FdvsaM9KLyoC8XLvmdxilZx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTmgrtYdEnMAbuDwuGWlh/VqCmoFWVIkmx4+FgLFGEEQM1P5uRT/M6DF7IMfqwZDf5TpSgCyWHMzrfbmknJPmLEIQGX6eW8T3L3Bjnz5iEsVDsP6Aob5dsFnz05xuT4BhCm7OqQvzYlpoTOWJgFFJBiYx1EvN/KlSHpull37umc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFqb+wHH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFqb+wHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792156585; x=1823692585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Kn129w0gmug+NGjkG6FdvsaM9KLyoC8XLvmdxilZx0=;
  b=JFqb+wHHF41rgKDw2DY6DG2IzqaJdKVJ0KG4L9H7I4gDsoinMLSuR1Tv
   TJEZP+zoDucK+SLeOHOwQsXn+BDLKb/7mgiapUOX0W/rmT2b9QRH2c57P
   41qBamkCZkOuf6SKUKIgLJNjet5skrDyLq7rEs0MpPaSfsUtXPRZxMGe+
   ZldaFI6mdCPqBZ3gmOeeJfdZpUBMZywNpu6R0TIngS3k8NjXPmrQESm3s
   I35vbQuk5fT+eiiMI2y39CtwKXHpJwx3R2OkWAaH4wSSikL0BiMSFvoTe
   +wrkdb6bCh9fm3Cy0fByJicbg30tSBrWrgwKrDZM3OpueoLnbKt3cpz0F
   g==;
X-CSE-ConnectionGUID: 47+OeOa4SHycydnhTKbHdg==
X-CSE-MsgGUID: z5Y6UUZtRB2JnPTVNeKZRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="935474"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="935474"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:16:25 -0700
X-CSE-ConnectionGUID: NjexObzuRUCICpXasVX4gw==
X-CSE-MsgGUID: ds7mVd5QQ3GEKxBw4FvQ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1844290"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:16:23 -0700
Date: Fri, 16 Oct 2026 16:16:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Navon John Lukose <navonjohnlukose@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mfd: intel-lpss: Set d3hot_delay to 0
Message-ID: <atIjpJn1Y0GPmQbP@ashevche-desk.local>
References: <20261016114347.23633-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016114347.23633-1-navonjohnlukose@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 16, 2026 at 05:13:47PM +0530, Navon John Lukose wrote:
> intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
> LPSS controller still sleeps the default 10 ms d3hot_delay in
> pci_power_up().
> 
> On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the delay costs 8-16 ms per
> resume of the touchpad's I2C controller, which lands on the first
> touchpad report after each 1 s autosuspend. With d3hot_delay set to 0 the
> power-up takes 64-256 us and the I2C transfers that follow complete
> without errors.

So, do you state that this patch fixes some bad touchpad behaviour? If so,
please, provide some logs.

> Commit 815b4448198f ("i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel
> controllers") does the same for the Intel I3C controllers.

Okay, it means they were tested.

...

> Notes:
>     RFC because I could only test Arrow Lake-H, and this applies to every LPSS
>     generation the driver handles, back to Sunrise Point. Andy, do any of the
>     older ones need the D3hot->D0 delay? If so I can limit it to newer IDs
>     through the driver data.

AFAIK 10 ms for D3hot delay is in accordance with PCI specification.
Yes, we use quirk_remove_d3hot_delay() for very old Intel Atom SoCs,
but I have no idea about Skylake line of products.

Mika, Ilpo, do you have any ideas or comments on this?

-- 
With Best Regards,
Andy Shevchenko


