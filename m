Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883433AB496
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792384486; cv=none; b=QKfVOAOOpaLy6nQuScpcEVe6ugvtRsZLSC9f3XQlkou/wc2hgWSqzyl7WVKNxOp5MK7Ng2EFt9bqetlxbRdXvItt9AlPdQZNeeaZvReYk20d8WiZR0yc/rry01NUv/AVa7Y9lRzrFK0lqCKszgNE1oSfpmTAFK1DfB6mNRGPypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792384486; c=relaxed/simple;
	bh=mHhqrgsAoLJr5sWC8AoEBXHRf3BoJJXAUS79JWBs8AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWu6+unMX/aKakBU6KwDuicv2VbBzb/Szw8r699NPskbWyxF+lD5dier/Yo5/Gpduu+a2V/u1jIIDqgf7jLc9Ja2T7jVxLxFSkh8wlF/PsCs9wE7ERQ9O7lcqKCXeIgnapIwggF5/wTVzkgjL/BzDsMnDTyNlDbmV90AB21cZNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZT2KO2d; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZT2KO2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792384481; x=1823920481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mHhqrgsAoLJr5sWC8AoEBXHRf3BoJJXAUS79JWBs8AU=;
  b=jZT2KO2dqqbaVNlg9ocCNhBYW/bnvzwCzOq7kn1u7w7KHdbOTzae+fxT
   MfkT3oK9mMQedp2JPWPUzacCKWVZH3s0PVY/TzqYJljqMyHlJReR8A8Wk
   tXC4rqFVVj3ptWEE1Je4T2CvIeVTw7bnetBM4dWdFkVZMnvTi9TiYv1VB
   3ToHK6otcHCaB2H5sVIx5O6w7YvlkJV+jH+DFSzrvCBkEVmLisqCMVSKn
   /pKCGfZxqWAGz+gzX5QkoZeo1NsGBJcs9z/2Yk68/GO2LisRQuX81V9ru
   Xyq274GRlax0s5RQDecQM/hIDo/NMQk4Q6r5LN3Ff1asJr/EsK0cuFZzQ
   Q==;
X-CSE-ConnectionGUID: /+zs7boQQXC9DwAILRRqvA==
X-CSE-MsgGUID: zmQF4JN2REmo8ERsjmfmfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1069594"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1069594"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 21:34:40 -0700
X-CSE-ConnectionGUID: ODvNpmOmSFG17sEOfufQRw==
X-CSE-MsgGUID: Sp7PrqLKSo+Eoxq4ZN4GFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2495021"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 21:34:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4375C99; Mon, 19 Oct 2026 06:34:37 +0200 (CEST)
Date: Mon, 19 Oct 2026 06:34:37 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Navon John Lukose <navonjohnlukose@gmail.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mfd: intel-lpss: Set d3hot_delay to 0
Message-ID: <20261019043437.GY176164@black.igk.intel.com>
References: <20261016114347.23633-1-navonjohnlukose@gmail.com>
 <atIjpJn1Y0GPmQbP@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atIjpJn1Y0GPmQbP@ashevche-desk.local>

Hi,

On Fri, Oct 16, 2026 at 04:16:20PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 16, 2026 at 05:13:47PM +0530, Navon John Lukose wrote:
> > intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
> > LPSS controller still sleeps the default 10 ms d3hot_delay in
> > pci_power_up().
> > 
> > On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the delay costs 8-16 ms per
> > resume of the touchpad's I2C controller, which lands on the first
> > touchpad report after each 1 s autosuspend. With d3hot_delay set to 0 the
> > power-up takes 64-256 us and the I2C transfers that follow complete
> > without errors.
> 
> So, do you state that this patch fixes some bad touchpad behaviour? If so,
> please, provide some logs.
> 
> > Commit 815b4448198f ("i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel
> > controllers") does the same for the Intel I3C controllers.
> 
> Okay, it means they were tested.
> 
> ...
> 
> > Notes:
> >     RFC because I could only test Arrow Lake-H, and this applies to every LPSS
> >     generation the driver handles, back to Sunrise Point. Andy, do any of the
> >     older ones need the D3hot->D0 delay? If so I can limit it to newer IDs
> >     through the driver data.
> 
> AFAIK 10 ms for D3hot delay is in accordance with PCI specification.
> Yes, we use quirk_remove_d3hot_delay() for very old Intel Atom SoCs,
> but I have no idea about Skylake line of products.
> 
> Mika, Ilpo, do you have any ideas or comments on this?

Like you say it's requirement of the PCI spec. However, since these are
really not PCI connected devices the delay likely is not needed as seen
here. No objections from my side.
