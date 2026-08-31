Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48589279907;
	Mon, 31 Aug 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170328; cv=none; b=sJMf0g/RDF5EM5W0B6AtwZ0aDDmxiVw+NRTxo7LPK+9ww0kyy1IKTvFdZ37k0Oc7gvr/zsNBkWQWHaB+yOAWt9F2m2GYLBTW84WYgxPAaINQmLgjK41/fFzSRLTKfkwAwr6Pkuox0xcRpxK7FkDXdjUxI+ijhbXVTTPt5QoizxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170328; c=relaxed/simple;
	bh=ERLUsNx6Q1FMreXCX1MQDURu2DTczcZn+4cVQN7mkUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuUWBXvasB5KMNFuPN8gUmVrvmA1OtXBlmk0l2ZOKKSXyELusAd53d1QDaGs2AONt4FsGNs+e2H3Pqp1rcE//I7xg/DJ4XJC7LbcasV6e1IKR8aCapzV7X3vkpeiNA506dfob2D6m80pFaswCoK9Y7lDxVUy3+QOG9UyTY5rdFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVd5SYEP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVd5SYEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170327; x=1819706327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ERLUsNx6Q1FMreXCX1MQDURu2DTczcZn+4cVQN7mkUs=;
  b=DVd5SYEPXuhSr4reCaFJxcewxbFKUU7GjusEpocmBljbDT0JX/Pe0DdN
   2OAuzcrtSVqXkmU7Iz1CBa4pTJvevIKBvZwSulMEQGnMFwIpZaNlORHUc
   mt70OohWXGDyYv9bvtuxX4Ou6M/8Slh68GQsQfY0mk8fdYn4qMfA6h5Uu
   e/1kBQigsC1i+0WpNlk/SQYms1/xgz4zD+llQ8HP8pZ/+Me9vV5ftZV+M
   dWBIeT9ZXRI2c+2dhegAa1RHIMAjDs6nleo0UwPIhZkC3zL9daqPoqYj0
   7pfTGC3UgjZJtBZYuMVUs1IW/eJ5Aax4kcz0nuRduLc3pynUp9evMjptU
   w==;
X-CSE-ConnectionGUID: 0238SDk3RMKwIKFRGbeBPw==
X-CSE-MsgGUID: 1lIhE8GaSQ2UdhfYV1Br5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88778798"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88778798"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:58:46 -0700
X-CSE-ConnectionGUID: Miztatd9SKyYS5IC+uJZbQ==
X-CSE-MsgGUID: fSwHSU8XQXKlHCX0+1OSPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266949074"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:58:43 -0700
Date: Mon, 31 Aug 2026 12:58:39 +0300
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
Subject: Re: [PATCH v4 11/15] media: atomisp: provide Yoga Book OV2740 link
 frequency
Message-ID: <apVQT9_LnBo5k8c9@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <286ec3ad5ea72a769b5a30a086a4ca8b35268700.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <286ec3ad5ea72a769b5a30a086a4ca8b35268700.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:53PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91 firmware does not describe the front
> OV2740 link frequency. Extend the AtomISP sensor configuration with an
> optional frequency and assign the 288 MHz Yoga Book value while adding
> its ACPI ID.
> 
> Pass the value through the IPU bridge per-sensor endpoint data so the
> OV2740 driver selects its matching mode and the AtomISP CSI-2 receiver
> derives the correct D-PHY timing.

...

> Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/

Drop this.

...

Otherwise, if we are okay with this data to be attached here, it looks good.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


