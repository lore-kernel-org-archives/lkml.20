Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AE13D25AD;
	Mon, 31 Aug 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169591; cv=none; b=Xrc85IcTHRyoWiG60eixiBTyT5LTjrh2hDltiJhS0vOHrsKl8bpztlSwihK+vsAy+JGn9IhAHPT9LSq8YgxQoTlvy61PrSE/q+mz81+krIRvv/HKEC5tvdT6SRBltH5wsZko+ml9LbmSTYQTJIQl33XcldM2FuxjqaTz95yJPdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169591; c=relaxed/simple;
	bh=TvHkuxziIlkIEZgml2qBZ5w6hyqDgps6IcgwGN5emuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFnrsVLcjtRF0Clb3CEH5+Abgf8bJG3UVL2U8v6MGcCSaosSj55BUg0Bm/+x7rJo1CIqni4nntYSIsrOI263SaYeP0w3RKPOUWZn/FiCBMxpm4rzfPe4OOdHMf2D5yG36ryxfnupw6sp8jO7gh8T/RF2Ko6I8qOyjfdxcn3gl/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mspiw7/G; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mspiw7/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169589; x=1819705589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TvHkuxziIlkIEZgml2qBZ5w6hyqDgps6IcgwGN5emuI=;
  b=mspiw7/G1Q4JFo3GjZlaDD8sZpE/a+d38WuN3iKqXEcRehqXDHoy4n9Z
   l+PvH8OeCRVFZ/EDL/DAmv7DiFKa/h7dcHnC8xoG9j7nqihdezZQCsWj+
   jRwoAAsfSnHm3y+7hqjM4dCYY54Wykf7d3E3tM20XBoS+DXx4Y1WZ5pDv
   8QV9pHnxsqfPUXYp81rg7gpBTYmCTZO4AtCBcXha9I9kleBsE5Jq54C3e
   w0/KmxxkdJKZyt1Kp2IvOxjxFZg/53KIlSEhlY6FEXqG0PXs3YM6lkuIh
   eKlzMzTwX713GFPBjMCvqIb6JJj1amNP9neGZ0xI8FJjhhJkRFpScq1Sj
   A==;
X-CSE-ConnectionGUID: w7tVGyaRSJW1+aFkD1YFeg==
X-CSE-MsgGUID: do3NQXZESc+Y9jXBMdUogg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99923754"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99923754"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:46:28 -0700
X-CSE-ConnectionGUID: 7xvSSdM8SMS+z/cDXkLxoA==
X-CSE-MsgGUID: zFaOJQY9S9eahXGUxGWLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272943470"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:46:25 -0700
Date: Mon, 31 Aug 2026 12:46:22 +0300
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
Subject: Re: [PATCH v4 00/15] media: Add Lenovo Yoga Book YB1-X91 camera
 support
Message-ID: <apVNbiZyIr-wE3yW@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:42PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91L exposes an OV2740 front sensor and an
> OV8858 rear sensor through the Cherry Trail AtomISP. Its firmware does
> not provide enough information for the existing sensor and IPU bridge
> drivers to construct the complete camera links.
> 
> Add the ACPI IDs and bridge data, describe both AtomISP camera links,
> support the Yoga Book sensor clocks and modes, expose raw Bayer capture,
> add per-channel white-balance controls, and add the WV517S rear-camera
> lens actuator.
> 
> Raw capture is selected through the normal V4L2 raw pixel formats. There
> is no module parameter or separate private ABI. Raw formats expose the
> complete sensor transport frame required by the ISP2401 copy pipeline;
> selecting a smaller crop remains a userspace decision.

Please, try to avoid using AI blindly. Think about the code it generates.
Sometimes it's a puke.

-- 
With Best Regards,
Andy Shevchenko


