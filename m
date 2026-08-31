Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754EF3DDB0A;
	Mon, 31 Aug 2026 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169115; cv=none; b=bXyp1VFWsbsOvPM63ZqLv+GS4letlYTyKRFwJaAEdb2CDKgyWdAxn4pf9F+lo8cAxzQ+zzdaIyG4X9tG5phwrE1pPkU/io3bhhOXQzy+xg3DVm+h/M74AFEKk8RXTW8baJ6OZydngRDs4sQ390owtrNVBIfP9HElsBAnVy/wdKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169115; c=relaxed/simple;
	bh=UX0cTnp/7eBM7a7SaTtkUnd+VLDmCj+L4RlAfCiCw/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ij3x4haY81MJLTKlH75Lz27rcxjKniEH1+hqgUSWo8DuLJZ+axtqLYWY6/Q1I7jXWAD5/8+rlWnb5mh9wJVJ8lX5qlSI7XJIB1wGcLQOgvUPWfcPuKpVxoQ369KbQKXsGDfpH6eisrvEkkFUXxHJLOfH0BlHcQWaGSuip9398h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVoY2V0O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVoY2V0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169114; x=1819705114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UX0cTnp/7eBM7a7SaTtkUnd+VLDmCj+L4RlAfCiCw/U=;
  b=ZVoY2V0OuxKR0PP+CBnaCEPPz9qpEmvs+29meycGOijHNJdunyoIHNvh
   +JTL3FpOsCdDX+epnhz3kJbeTARSNLp8GidXXz0H6J+JCXCH+Gcti/9OC
   9JixOtXq4DWA+4AcbSZjEd0Bca6AG/2KaQL1laYY0kp5kAo/KmoehLb0w
   t2XbicMK+yJc5E2Sn5WeCt6Egw7vlppuq5Qh+wgESxBcoW5KRX7NynMnK
   x6s07pqcQ4c4Ok+pZdCW/Hfu0V/lty1KKpnNcK58fFQCtPyI8k3/6sPbw
   a6DyIvhxjWhCJGdMaJrVg4St1RnfMTw5MbtfJHhfxOIKYb6y/Ohtx6v4/
   Q==;
X-CSE-ConnectionGUID: TZAKT3WJQ36/AkwybZtgww==
X-CSE-MsgGUID: Yn54/7XaR9iZcJphiBwrWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="98908795"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="98908795"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:38:34 -0700
X-CSE-ConnectionGUID: oDeBqC2LQp254eXNNDlxVw==
X-CSE-MsgGUID: nNVW0wOtQeW3vgTfIRmThg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292251749"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:38:30 -0700
Date: Mon, 31 Aug 2026 12:38:27 +0300
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
Subject: Re: [PATCH v4 02/15] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <apVLky0JxI2nyQAo@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <017d1719d7fe132273f818cf7e20d93ce3e2c9c9.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <017d1719d7fe132273f818cf7e20d93ce3e2c9c9.1787933456.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 28, 2026 at 06:14:44PM +0200, Maurizio Casciano wrote:
> The Yoga Book drives its OV8858 from a 19.2 MHz platform clock, while
> the existing mode tables program the sensor PLL for 24 MHz. Reusing
> those settings produces incorrect internal and CSI-2 clocks.
> 
> Accept both input rates and use the actual rate for the reset delay. For
> 19.2 MHz, apply the Cherry Trail MRD PLL and black-level settings after
> the generic mode table.
> 
> The 19.2 MHz platform uses the per-channel manual white-balance
> registers for digital gain. Program registers 0x5032, 0x5034 and 0x5036
> and expose their 1x-to-4x range, while retaining the existing
> long-exposure gain block for 24 MHz systems.
> 
> The manual white-balance register definitions and programming follow
> the GPL-2.0 Intel OV5670 driver, so retain its 2017 Intel copyright
> notice in this file. No proprietary source or tuning binary is included.
> 
> Tested on the Lenovo Yoga Book YB1-X91L OV8858 with full-range test bars
> and real 10-bit Bayer frames.

...

> -#define OV8858_LINK_FREQ		360000000U
> -#define OV8858_XVCLK_FREQ		24000000
> +#define OV8858_LINK_FREQ		(360 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_19_2MHZ	(192 * HZ_PER_MHZ / 10)
> +#define OV8858_XVCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)

I believe the idea was not to touch these. Again I haven't seen the reply on
why both comments (Sakari's and mine) were ignored.

...

> -	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
> +	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
> +			    long_gain, NULL);

Stray change.

...

I stopped here, Please, give a full reply to *each* of the comments you
disagree with.

-- 
With Best Regards,
Andy Shevchenko


