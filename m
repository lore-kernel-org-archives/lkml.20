Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C517C3DDAFC;
	Mon, 31 Aug 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169382; cv=none; b=FMY2QfZ2Jm2548KsoRJnu3wgNSa1b2wiDdeYTNFiiP0xBTB1z0vMGilQYYMJEk6FlLqNRs2e1kqCNBD7BkYieWw6kt5AbiYmBwebHV14ykNXHgakLaOE9wM7M6mkqM6wab51hiOtWtXQ2M+yeMJNvVsk5qm3jsfwsYN6ciDCvtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169382; c=relaxed/simple;
	bh=3/tXDUdRaV0FDrFDg0aDG4jm0/dqKkyQ2SqvqZilTrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH1viraW9MoxJc6P5Mqo8cS6Gg6WuXygrcq66lr1Adty7TOfyqj0vhg/Uni+NL5RYBXn1wgb82+wZHoWFK0pzp1s1PvJAKCEMfSlbdY9tVA6sTznsRvEKS4gXUadNft31yKB31ZGoihqiDqkGc/tXjmSZ7RTBUYKcSHZdf4o3NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuMGEqtk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuMGEqtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169381; x=1819705381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3/tXDUdRaV0FDrFDg0aDG4jm0/dqKkyQ2SqvqZilTrc=;
  b=QuMGEqtkdjf12B47E/8ozDRBHUqgMbdPlHP/Dl5Bt1RloxZpZc/jjD6D
   EL0bcApLx8ZsC+reJxTil0WvaoHvPwarxr8UG5LtJQutcD4DXX/NTva1N
   hQ3eTM5SsFeFwHbGqp7Xn3MZB8HD2YVOghw6VgHtbyyca4UVWadcqdLqX
   QoaMB3/5bN7NzUjaOI5A+mv+xbDHPGJhJz9YPm1jSY/211LoIzdV6yknB
   V/gBaZbQQDq7sbgpjaFvGXc1vGfuyhIz3mQVMuFeBayUr1d9p/OtXzPQe
   Hqwz8P9U/Nc3IlOXk9GrhwEQGHhrVea8Wv362QwTMwvi8IMFup3j2nr8T
   g==;
X-CSE-ConnectionGUID: ALbkxEEVQwe5lkHBtYVMmg==
X-CSE-MsgGUID: 06beCXfsSdyXfCeVp2pRjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88499133"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88499133"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:43:00 -0700
X-CSE-ConnectionGUID: oPcOQnMLSGeYW0ZjRuWk3A==
X-CSE-MsgGUID: Fcepfy/VQ9GNqrysKzqsDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="268797768"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:42:56 -0700
Date: Mon, 31 Aug 2026 12:42:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/15] media: atomisp: Add Yoga Book camera
 configuration
Message-ID: <apVMnkuA94Zx9r85@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <445158bc6dd99ea11806d68b6d1873a2d0bfdd92.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <445158bc6dd99ea11806d68b6d1873a2d0bfdd92.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:49PM +0200, Maurizio Casciano wrote:
> The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
> both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
> actuator, while the front OVTI2740 firmware reports the wrong lane
> count.
> 
> Add the rear sensor configuration and a DMI-scoped two-lane override
> for OVTI2740:00. Add the front sensor configuration separately once
> its link frequency can be supplied at the same time.

...

> Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/

What is this for?

...

With the stray Link tag dropped you may add my
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


