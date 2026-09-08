Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07444A842C;
	Tue,  8 Sep 2026 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860515; cv=none; b=Vblcm+ZfSgUyy4SnEVo4p7nSI3fbrHT1nlHrbWpx2OuCZGflLtj5l0su5VNmVKDUUM6GkPAvfL+36mDBXAr+p5pfFnvS5Re110nXVXIppCs84iCzqjYmUI2TcHsfV+OznVbWjpQLZCWnAXDOcI6z0hZcgiitnq6erCgnf54dX1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860515; c=relaxed/simple;
	bh=+m65zNBh/xk54jRWaQkuw+vtqEzuPrf35l33B0vwYJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j26lgOm8IUMFUSs2/6XkY26BA1ODPOr8Jd/Rv6GUjgeOnekVtCI4pUeoRZ8YiAzyYSx9b8TTsR+zh06C139qcmidWtzUvHwBXm07X2DXNL48N4eoZF5/fjOcoT4ms0IhITbaURnUe4AVzwmQ7LnxR38l+RKmBk0FiJxcIjJIXm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUN9NQmW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUN9NQmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788860513; x=1820396513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+m65zNBh/xk54jRWaQkuw+vtqEzuPrf35l33B0vwYJ0=;
  b=YUN9NQmW7ypGy3xSNlJuhYz9ExV3oC461lNxbgALOnIro1V6KkVzpa7V
   1vGNs1OBsrHE62CWuGu4Gp/3vtbMFLMnNSQKLjvZi2Z4V0ysODvnp18fO
   6UWQ8iWwWVhZQ0+qj8EQT57txE/EVIsMYbDI5MDFgxQvE2Nk4dRl+be3D
   FOUhHiddTfuD//VAwYReNora0LJaNu/weg/SNmDqwHCY8MdimUwWGuFtN
   T4uYRjd+7xhtxwODYr5giEJMsLySu5DZJzn2TjmbQ/SvBhVeOWjiME4Fx
   0d/0J3CjegHGhacWL5Aa82CEqWiAYNz5p1A1VZIOcRsCezBpTfP19zX8O
   g==;
X-CSE-ConnectionGUID: VIAmEFvrSQCvF0NQrdpAqg==
X-CSE-MsgGUID: AyZ+Zry9SxmAMZFAjGFGaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89300617"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89300617"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:41:52 -0700
X-CSE-ConnectionGUID: czHXw0VcQAODiQgbvaajBA==
X-CSE-MsgGUID: 2VTpvaWDTrGiXj0MxDaxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="272879054"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:41:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1E5A4121BC8;
	Tue, 08 Sep 2026 12:41:52 +0300 (EEST)
Date: Tue, 8 Sep 2026 12:41:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pierre Pinon <pierre@pinon1.fr>
Cc: Jason Chen <jason.z.chen@intel.com>, Jimmy Su <jimmy.su@intel.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org,
	"Vadillo, Miguel" <miguel.vadillo@intel.com>,
	qingwu.zhang@intel.com
Subject: Re: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken
 1928x1088 binned mode
Message-ID: <ap_YYNDTG7Va4MD8@kekkonen.localdomain>
References: <20260904134604.595685-1-pierre@pinon1.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904134604.595685-1-pierre@pinon1.fr>

Hi Pierre,

On Fri, Sep 04, 2026 at 03:46:00PM +0200, Pierre Pinon wrote:
> On IPU7 platforms the 1928x1088 2x2-binned mode does not deliver usable
> frames: the sensor emits only the first and the last line of each frame,
> and the rest of the capture buffer is never written.
> 
> Measured on a Dell Pro 14 Premium PA14260 (IPU7 + Intel CVS, 2 MIPI
> lanes at 1500 Mbps) by instrumenting libcamera's software ISP to count,
> for each line of the incoming buffer, how many samples were left at
> 0xffff:
> 
>   3856x2176 mode : 2177 of 2177 lines carry data
>   1928x1088 mode :    2 of 1089 lines carry data (the first and the last)

Did you use upstream kernel to test this? There are some hints the CVS
could be the culprit.

What USB and I²C devices can be found in the system?

Cc Miguel and Qingwu as well. Qingwu: any idea if the binned mode was ever
tested and if CVS was involved?

Removing a presumably otherwise working (?) mode seems a bit drastic.

> 
> The raw samples confirm it. In the working mode they sit in the expected
> 10-bit range; in the binned mode everything outside those two lines is
> 0xffff:
> 
>   3856x2176 : min=59  max=81
>   1928x1088 : min=261 max=65535
> 
> The consequence is not cosmetic. libcamera's simple pipeline handler
> selects the smallest sensor mode that can satisfy the requested output,
> so every capture at or below 1928x1088 -- which includes every resolution
> a browser asks for over WebRTC -- is routed to this mode and produces a
> uniformly saturated image. Requests above that size use the 3856x2176
> mode and work correctly.
> 
> I could not determine whether the fault lies in the mode's register list
> or in how the IPU7 CSI-2 receiver handles it; the register programming is
> unchanged since before commit ff1f5010a96a ("media: ov08x40: Remove
> common register settings from resolution-specific table"), which I
> verified does not drop or alter any register for this mode. The 4-lane
> binned mode (1928x1208) could not be exercised on this hardware.
> 
> Until the cause is understood, stop advertising the mode so that
> userspace falls back to the full resolution mode, which works. With this
> change a 640x480 capture on the affected machine goes from a uniform
> saturated frame to a correctly exposed image.
> 
> Signed-off-by: Pierre Pinon <pierre@pinon1.fr>
> ---
>  drivers/media/i2c/ov08x40.c | 28 +++++++---------------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index 3de06e19803c..7b10780f25eb 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -1318,27 +1318,13 @@ static const struct ov08x40_mode supported_modes[] = {
>  		.exposure_shift = 1,
>  		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
>  	},
> -	{
> -		.width = 1928,
> -		.height = 1088,
> -		.vts_def = OV08X40_VTS_BIN_30FPS,
> -		.vts_min = OV08X40_VTS_BIN_30FPS,
> -		.llp = 0x960,
> -		.lanes = 2,
> -		.reg_list = {
> -			.num_of_regs = ARRAY_SIZE(mode_1928x1088_regs_1500mbps),
> -			.regs = mode_1928x1088_regs_1500mbps,
> -		},
> -		.crop = {
> -			.left = 0,
> -			.top = 120,
> -			.width = 3872,
> -			.height = 2192,
> -		},
> -		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
> -		.exposure_shift = 0,
> -		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
> -	},
> +	/*
> +	 * The 1928x1088 binned mode is not exposed: on IPU7 platforms the
> +	 * sensor delivers only the first and last line of each frame in
> +	 * this mode, the rest of the buffer is never written. Measured on a
> +	 * Dell Pro 14 Premium PA14260: 2 valid lines out of 1088, against
> +	 * 2176/2176 in the 3856x2176 mode.
> +	 */
>  };
>  
>  static const char * const ov08x40_supply_names[] = {

-- 
Regards,

Sakari Ailus
