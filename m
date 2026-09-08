Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BDF3ACF1B;
	Tue,  8 Sep 2026 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854811; cv=none; b=ItZ5Rx/bt5yvnXYPTHKrlPd83pisDAZVRK6MZjOTb/LpRnEH3Tszjom6jJlmbk6AqdZrOwkErkzjtBg+2rz5RpUC5xp+SgVQcfpPXQ8uAxjdlsWcuDq6f9n51e+IcdtgKMuBxtKtWWbcrqcpVpSsz9FEq0qRxOiAQyomyZKI6n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854811; c=relaxed/simple;
	bh=V7qngNLl8fRUNU7ztjn13DlzUTXz1GN3YWYqXvAqes8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+OBPDjP8AqGaDquurpC1g95pjjSCDf7ULzsyFZM6CTbiAtajw7uwkfeKrOax6DchrtvEPex3oSfoYo6zbbAehBfB5fC/MACTXCX6HJCBhRSu59k85q4Pra/D54OeDK9GbCvpAWT8HtX5Z/xrpbZxD2nnlBPhzUXvSKnCIS8QFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4P11s0k; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4P11s0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788854810; x=1820390810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V7qngNLl8fRUNU7ztjn13DlzUTXz1GN3YWYqXvAqes8=;
  b=j4P11s0k5ORinCd3cTPnnm8KZJvn5s1Mosx13oHFgs7qv2LxlkBNKLJv
   o+NCidQS60VJIZHnEJ1Xb08xAR6Egp77JL90jQ9GEBNC1ekkVMSIOtpuS
   RI+om/ioWMg9h5FUOoI4+hvI+gtgF04eLM6QRuCnstNuKG2PzXpXpOwGy
   JAt7GlIqtiPsT6dmcRVeMQ0gF3UmxPZC0yzLXK25xCK6aj9GSQJ/e4WC4
   Gm/GUJdp0fRa24ha32R95EZzKM/kjOWsNNqyEf/HCmG3UfeL/btdQBMFx
   M9RFzULrfyjlVQ2nxTxn/F7c0sbvbR4D+kggQhqeTLCbh4zLzYoO/KGjH
   Q==;
X-CSE-ConnectionGUID: Tz0ijKfgSJ+KkDArgbctZw==
X-CSE-MsgGUID: hVJnqtBGTzy7AUkZjKauvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100771036"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100771036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:06:49 -0700
X-CSE-ConnectionGUID: EJIyr3yOTZy4VlJwVYBbFQ==
X-CSE-MsgGUID: jx4PoUVrTjiVNWjvndkyDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="266577524"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:06:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2300611FA3A;
	Tue, 08 Sep 2026 11:06:49 +0300 (EEST)
Date: Tue, 8 Sep 2026 11:06:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Felipe Calliari <calliarifelipe@gmail.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: ov02c10: Accept a 26 MHz external clock
Message-ID: <ap_CGQTdNFysTLot@kekkonen.localdomain>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <20260905030732.39196-3-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905030732.39196-3-calliarifelipe@gmail.com>

Hi Felipe,

On Sat, Sep 05, 2026 at 12:07:32AM -0300, Felipe Calliari wrote:
> Several Meteor Lake / Lunar Lake designs (e.g. the Samsung Galaxy Book3/4
> series) wire the OV02C10 to a 26 MHz external clock instead of the
> 19.2 MHz assumed so far. The IPU6 ipu-bridge forwards the rate from the
> ACPI SSDB verbatim as the "clock-frequency" property, so probe() just
> rejects it today:
> 
>   ov02c10 i2c-OVTI02C1:00: external clock 26000000 is not supported
> 
> Rename OV02C10_MCLK to OV02C10_MCLK_19_2MHZ, add OV02C10_MCLK_26MHZ and
> accept both.
> 
> The PLL register tables are the 19.2 MHz ones; OmniVision's 26 MHz PLL
> programming is not publicly available. With a 26 MHz input the same
> dividers make every internal clock, and therefore the MIPI link, run
> 26/19.2 = 1.3542x faster: a ~541.7 MHz link and ~40 fps instead of the
> nominal 400 MHz / 30 fps. Rather than leave link-frequency and
> pixel-rate describing the 19.2 MHz case, add a second
> V4L2_CID_LINK_FREQ menu entry (400 MHz * 26 / 19.2) and select it when
> the external clock is 26 MHz. pixel-rate is derived from the link
> frequency and scales with it, so the frame rate and exposure times
> reported to userspace match the hardware, and the IPU6 CSI-2 receiver
> programs its D-PHY high-speed frequency range and bandwidth budget for
> the rate the sensor actually transmits.
> 
> The ipu-bridge fwnode only lists the nominal 400 MHz link frequency
> (keyed by ACPI HID, not by clock rate), so v4l2_link_freq_to_bitmap()
> still matches on the 400 MHz entry and the 541.7 MHz index is selected
> explicitly for the 26 MHz case.

Please don't use a hard-coded value here. Instead, calculate the pixel
rate.

Registers 0x0304 and 0x0315 (both 16-bit) control the PLL multipliers for
OP and VT PLLs, respectively. You could also change the multipliers to
arrive in a frequency close to the previous configuration. The values would
be 0x28a and 0x1b1, respectively. I don't have the sensor so I can't test
this. The pixel rate would be a bit off, 400,307929 MHz, assuming the
previous value was exactly 400 MHz. This would also require adding the
frequency to the IPU bridge.

Either the pixel rate or the link frequency exported by the driver is
probably wrong.

-- 
Regards,

Sakari Ailus
