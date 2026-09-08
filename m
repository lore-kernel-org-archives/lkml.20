Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31952D2BF;
	Tue,  8 Sep 2026 11:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866402; cv=none; b=ijrBQunM6MRkT6k5Mf3o0B+I/DneiFdzASwG6fUKTXSksnVT87NDr1rSYCb1WdVIqOjevh5gR1oHf0r/xHqM34AjdAKXszj/Wc1yMdsu1KOvoreP7SPgzZX0m15yC1deZRHr6cj29gl+CbuQ0vULEhZEvt+/irV/+yyWF0bJp+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866402; c=relaxed/simple;
	bh=CA2pUeeXWQxmiqxG/tx5kbgyGmFzFGQQSPekBGYlIvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R64xJJcuwcMJ8h8XL5vLxdzz3or2ewvPQ3wBuxK3XVDGppzIP9j4QJnf2jF2aCLii+zcGsMeCD0uUXE3hI/I0ArtFRTFMLFeP2KsIxRDhFsYkxDIUkrVEfRmJc5P1tYj9o3Ej9ieNo5ecXV5mFdDQTIpjsh1vZFLcdTMqYCYtoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+IK4sLn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+IK4sLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788866394; x=1820402394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CA2pUeeXWQxmiqxG/tx5kbgyGmFzFGQQSPekBGYlIvY=;
  b=a+IK4sLn+39VVTRcDM3bsVk0EuHa/4ol/k0gaUESEdMWGPqEK3Xijxc0
   LTZS5UUZRoqVORn8zSbfub7b+Bm10riVi22JeE+IV9LttkegkkWzdJekg
   vBCGtoGr5a468jkJH/MO2XCnTVVz521QcF0E/ebbjnyh8jrIa8YU+gTcu
   n9rsI31WTVqCA1GGjZivvUcf0Lz7dvSBI8qep9QrcKIT+Ej2kNPsHNuQT
   hLNieicbjJu8kmuw8JV9E/BolPBSaTdJHuITzu/+4R1BNUidTvUkgO60o
   HQ1edtHbXyppIjYIuA6zhUY86TikrXZ6xZx7Guloktj90iOd37sTp4s5/
   Q==;
X-CSE-ConnectionGUID: F3r4kbs/QjGHj4X1p6C/Rw==
X-CSE-MsgGUID: fd5ZbtOySM2U3sKAvMtegQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91776557"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="91776557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:19:49 -0700
X-CSE-ConnectionGUID: xTlFOYfxSmSWRGYZd+eU3w==
X-CSE-MsgGUID: 9WkqdnbgQWaEzWcs1sv8YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270482056"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:19:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2825211F7F5;
	Tue, 08 Sep 2026 14:19:49 +0300 (EEST)
Date: Tue, 8 Sep 2026 14:19:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/4] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
Message-ID: <ap_vVZ_Z7tJNcAYY@kekkonen.localdomain>
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
 <20260901-og0va1b-v6-4-a05b2d04c892@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-og0va1b-v6-4-a05b2d04c892@oss.qualcomm.com>

Hi Wenmeng,

On Tue, Sep 01, 2026 at 03:40:07PM +0800, Wenmeng Liu wrote:
> The OmniVision OG0VA1B is a monochrome image sensor closely related to
> the OG0VE1B. It shares the SCCB control interface, power supplies and
> the single-lane MIPI D-PHY description, and differs in its chip id, the
> test pattern register, the register programming and the output format
> (10-bit RAW instead of 8-bit).
> 
> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
> its 640x480 60fps register sequence.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org> # og0ve1b
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  drivers/media/i2c/og0ve1b.c | 278 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 266 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index f560d5d90fda94abf4bc622c5e4f861b078b811f..7b8555a833c255652204d5f4c87c8d701c3008e6 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -15,10 +15,14 @@
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
>  
> +#define OG0VA1B_LINK_FREQ_480MHZ	(480 * HZ_PER_MHZ)
> +#define OG0VA1B_MCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)
> +
>  #define OG0VE1B_LINK_FREQ_500MHZ	(500 * HZ_PER_MHZ)
>  #define OG0VE1B_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
>  
> -#define OG0VE1B_REG_CHIP_ID		CCI_REG24(0x300a)
> +#define OG0V_REG_CHIP_ID		CCI_REG24(0x300a)
> +#define OG0VA1B_CHIP_ID			0xc75641
>  #define OG0VE1B_CHIP_ID			0xc75645
>  
>  #define OG0VE1B_REG_MODE_SELECT		CCI_REG8(0x0100)
> @@ -46,12 +50,18 @@
>  #define OG0VE1B_REG_VTS			CCI_REG16(0x380e)

What about this register? Is it the same for both? If so, shouldn't you
rename this one as well?

>  #define OG0VE1B_VTS_MAX			0xffff
>  
> -/* Test pattern */
> +/* Test pattern - OG0VA1B uses 0x5100, OG0VE1B uses 0x5e00 */
> +#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
> +#define OG0VA1B_TEST_PATTERN_BAR_SHIFT	2
>  #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
>  #define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
>  
>  #define to_og0ve1b(_sd)			container_of(_sd, struct og0ve1b, sd)
>  
> +static const s64 og0va1b_link_freq_menu[] = {
> +	OG0VA1B_LINK_FREQ_480MHZ,
> +};
> +
>  static const s64 og0ve1b_link_freq_menu[] = {
>  	OG0VE1B_LINK_FREQ_500MHZ,
>  };
> @@ -74,15 +84,31 @@ struct og0ve1b_mode {
>  struct og0ve1b;
>  
>  struct og0ve1b_sensor_data {
> +	const char *name;
>  	u64 chip_id;
>  	unsigned long mclk_freq;
>  	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
> +	const char * const *test_pattern_menu;
> +	int num_test_patterns;
> +	bool cache_test_pattern_reg;
> +	/* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole lines (0). */
> +	unsigned int exposure_shift;
> +	/* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B keeps 1. */
> +	unsigned int pixel_rate_mul;
>  	const s64 *link_freq_menu;
>  	int num_link_freqs;

Rearranging these (in a previous patch probably) would save some memory.

>  	const struct og0ve1b_mode *modes;
>  	int num_modes;
>  };
>  
> +static const char * const og0va1b_test_pattern_menu[] = {
> +	"Disabled",
> +	"Standard Test Bar",
> +	"Top-Bottom Darker Test Bar",
> +	"Right-Left Darker Test Bar",
> +	"Bottom-Top Darker Test Bar",
> +};
> +
>  static const char * const og0ve1b_test_pattern_menu[] = {
>  	"Disabled",
>  	"Standard Test Bar",
> @@ -116,6 +142,196 @@ struct og0ve1b {
>  	const struct og0ve1b_sensor_data *data;
>  };
>  
> +static const struct cci_reg_sequence og0va1b_640x480_60fps_mode[] = {
> +	{ CCI_REG8(0x0302), 0x31 },
> +	{ CCI_REG8(0x0303), 0x02 },
> +	{ CCI_REG8(0x0304), 0x01 },
> +	{ CCI_REG8(0x0305), 0x90 },
> +	{ CCI_REG8(0x0306), 0x00 },
> +	{ CCI_REG8(0x0323), 0x02 },
> +	{ CCI_REG8(0x0325), 0x68 },
> +	{ CCI_REG8(0x0326), 0xd8 },
> +	{ CCI_REG8(0x3006), 0x0e },
> +	{ CCI_REG8(0x300d), 0x08 },
> +	{ CCI_REG8(0x3018), 0xf0 },
> +	{ CCI_REG8(0x301c), 0xf0 },
> +	{ CCI_REG8(0x3020), 0x20 },
> +	{ CCI_REG8(0x3040), 0x0f },
> +	{ CCI_REG8(0x3022), 0x01 },
> +	{ CCI_REG8(0x3107), 0x40 },
> +	{ CCI_REG8(0x3216), 0x01 },
> +	{ CCI_REG8(0x3217), 0x00 },
> +	{ CCI_REG8(0x3218), 0xc0 },
> +	{ CCI_REG8(0x3219), 0x55 },
> +	{ CCI_REG8(0x3506), 0x01 },
> +	{ CCI_REG8(0x3507), 0x50 },
> +	{ CCI_REG8(0x3508), 0x01 },
> +	{ CCI_REG8(0x3509), 0x00 },
> +	{ CCI_REG8(0x350a), 0x01 },
> +	{ CCI_REG8(0x350b), 0x00 },
> +	{ CCI_REG8(0x350c), 0x00 },
> +	{ CCI_REG8(0x3541), 0x00 },
> +	{ CCI_REG8(0x3542), 0x40 },
> +	{ CCI_REG8(0x3605), 0x90 },
> +	{ CCI_REG8(0x3606), 0x41 },
> +	{ CCI_REG8(0x3612), 0x00 },
> +	{ CCI_REG8(0x3620), 0x08 },
> +	{ CCI_REG8(0x3630), 0x17 },
> +	{ CCI_REG8(0x3631), 0x99 },
> +	{ CCI_REG8(0x3639), 0x88 },
> +	{ CCI_REG8(0x3668), 0x00 },
> +	{ CCI_REG8(0x3674), 0x00 },
> +	{ CCI_REG8(0x3677), 0x3f },
> +	{ CCI_REG8(0x368f), 0x06 },
> +	{ CCI_REG8(0x36a2), 0x19 },
> +	{ CCI_REG8(0x36a4), 0xf1 },
> +	{ CCI_REG8(0x36a5), 0x2d },
> +	{ CCI_REG8(0x3706), 0x30 },
> +	{ CCI_REG8(0x370d), 0x72 },
> +	{ CCI_REG8(0x3713), 0x86 },
> +	{ CCI_REG8(0x3715), 0x03 },
> +	{ CCI_REG8(0x3716), 0x00 },
> +	{ CCI_REG8(0x376d), 0x24 },
> +	{ CCI_REG8(0x3770), 0x3a },
> +	{ CCI_REG8(0x3778), 0x00 },
> +	{ CCI_REG8(0x37a8), 0x03 },
> +	{ CCI_REG8(0x37a9), 0x00 },
> +	{ CCI_REG8(0x37df), 0x7d },
> +	{ CCI_REG8(0x3800), 0x00 },
> +	{ CCI_REG8(0x3801), 0x00 },
> +	{ CCI_REG8(0x3802), 0x00 },
> +	{ CCI_REG8(0x3803), 0x00 },
> +	{ CCI_REG8(0x3804), 0x02 },
> +	{ CCI_REG8(0x3805), 0x8f },
> +	{ CCI_REG8(0x3806), 0x01 },
> +	{ CCI_REG8(0x3807), 0xef },
> +	{ CCI_REG8(0x3808), 0x02 },
> +	{ CCI_REG8(0x3809), 0x80 },
> +	{ CCI_REG8(0x380a), 0x01 },
> +	{ CCI_REG8(0x380b), 0xe0 },
> +	{ CCI_REG8(0x380c), 0x01 },
> +	{ CCI_REG8(0x380d), 0x78 },
> +	{ CCI_REG8(0x380e), 0x08 },
> +	{ CCI_REG8(0x380f), 0x30 },
> +	{ CCI_REG8(0x3810), 0x00 },
> +	{ CCI_REG8(0x3811), 0x08 },
> +	{ CCI_REG8(0x3812), 0x00 },
> +	{ CCI_REG8(0x3813), 0x08 },
> +	{ CCI_REG8(0x3814), 0x11 },
> +	{ CCI_REG8(0x3815), 0x11 },
> +	{ CCI_REG8(0x3816), 0x00 },
> +	{ CCI_REG8(0x3817), 0x01 },
> +	{ CCI_REG8(0x3818), 0x00 },
> +	{ CCI_REG8(0x3819), 0x05 },
> +	{ CCI_REG8(0x3820), 0x40 },
> +	{ CCI_REG8(0x3821), 0x04 },
> +	{ CCI_REG8(0x3823), 0x00 },
> +	{ CCI_REG8(0x3826), 0x00 },
> +	{ CCI_REG8(0x3827), 0x00 },
> +	{ CCI_REG8(0x382b), 0x52 },
> +	{ CCI_REG8(0x384a), 0xa2 },
> +	{ CCI_REG8(0x3858), 0x00 },
> +	{ CCI_REG8(0x3859), 0x00 },
> +	{ CCI_REG8(0x3860), 0x00 },
> +	{ CCI_REG8(0x3861), 0x00 },
> +	{ CCI_REG8(0x3866), 0x0c },
> +	{ CCI_REG8(0x3867), 0x07 },
> +	{ CCI_REG8(0x3884), 0x00 },
> +	{ CCI_REG8(0x3885), 0x08 },
> +	{ CCI_REG8(0x3888), 0x50 },
> +	{ CCI_REG8(0x3893), 0x6c },
> +	{ CCI_REG8(0x3898), 0x00 },
> +	{ CCI_REG8(0x389a), 0x04 },
> +	{ CCI_REG8(0x389b), 0x01 },
> +	{ CCI_REG8(0x389c), 0x0b },
> +	{ CCI_REG8(0x389d), 0xdc },
> +	{ CCI_REG8(0x38b1), 0x04 },
> +	{ CCI_REG8(0x38b2), 0x00 },
> +	{ CCI_REG8(0x38b3), 0x08 },
> +	{ CCI_REG8(0x38c1), 0x46 },
> +	{ CCI_REG8(0x38c9), 0x02 },
> +	{ CCI_REG8(0x38d4), 0x06 },
> +	{ CCI_REG8(0x38d5), 0x5a },
> +	{ CCI_REG8(0x38d6), 0x08 },
> +	{ CCI_REG8(0x38d7), 0x3a },
> +	{ CCI_REG8(0x391f), 0x00 },
> +	{ CCI_REG8(0x3920), 0xaa },
> +	{ CCI_REG8(0x3921), 0x00 },
> +	{ CCI_REG8(0x3922), 0x00 },
> +	{ CCI_REG8(0x3923), 0x00 },
> +	{ CCI_REG8(0x3924), 0x00 },
> +	{ CCI_REG8(0x3925), 0x00 },
> +	{ CCI_REG8(0x3926), 0x00 },
> +	{ CCI_REG8(0x3927), 0x00 },
> +	{ CCI_REG8(0x3928), 0x10 },
> +	{ CCI_REG8(0x3929), 0x01 },
> +	{ CCI_REG8(0x392a), 0xb4 },
> +	{ CCI_REG8(0x392b), 0x00 },
> +	{ CCI_REG8(0x392c), 0x10 },
> +	{ CCI_REG8(0x392d), 0x01 },
> +	{ CCI_REG8(0x392e), 0x78 },
> +	{ CCI_REG8(0x392f), 0x4a },
> +	{ CCI_REG8(0x391e), 0x01 },
> +	{ CCI_REG8(0x389f), 0x08 },
> +	{ CCI_REG8(0x38a0), 0x00 },
> +	{ CCI_REG8(0x38a1), 0x00 },
> +	{ CCI_REG8(0x3a06), 0x06 },
> +	{ CCI_REG8(0x3a07), 0x78 },
> +	{ CCI_REG8(0x3a08), 0x08 },
> +	{ CCI_REG8(0x3a09), 0x80 },
> +	{ CCI_REG8(0x3a52), 0x00 },
> +	{ CCI_REG8(0x3a53), 0x01 },
> +	{ CCI_REG8(0x3a54), 0x0c },
> +	{ CCI_REG8(0x3a55), 0x04 },
> +	{ CCI_REG8(0x3a58), 0x0c },
> +	{ CCI_REG8(0x3a59), 0x04 },
> +	{ CCI_REG8(0x4000), 0xcf },
> +	{ CCI_REG8(0x4003), 0x40 },
> +	{ CCI_REG8(0x4008), 0x04 },
> +	{ CCI_REG8(0x4009), 0x13 },
> +	{ CCI_REG8(0x400a), 0x02 },
> +	{ CCI_REG8(0x400b), 0x34 },
> +	{ CCI_REG8(0x4010), 0x71 },
> +	{ CCI_REG8(0x4042), 0xc3 },
> +	{ CCI_REG8(0x4306), 0x04 },
> +	{ CCI_REG8(0x4307), 0x12 },
> +	{ CCI_REG8(0x4500), 0x70 },
> +	{ CCI_REG8(0x4509), 0x00 },
> +	{ CCI_REG8(0x450b), 0x83 },
> +	{ CCI_REG8(0x4604), 0x68 },
> +	{ CCI_REG8(0x481b), 0x44 },
> +	{ CCI_REG8(0x481f), 0x30 },
> +	{ CCI_REG8(0x4823), 0x44 },
> +	{ CCI_REG8(0x4825), 0x35 },
> +	{ CCI_REG8(0x4837), 0x11 },
> +	{ CCI_REG8(0x4f00), 0x04 },
> +	{ CCI_REG8(0x4f10), 0x04 },
> +	{ CCI_REG8(0x4f21), 0x01 },
> +	{ CCI_REG8(0x4f22), 0x00 },
> +	{ CCI_REG8(0x4f23), 0x54 },
> +	{ CCI_REG8(0x4f24), 0x51 },
> +	{ CCI_REG8(0x4f25), 0x41 },
> +	{ CCI_REG8(0x5000), 0x3f },
> +	{ CCI_REG8(0x5001), 0x80 },
> +	{ CCI_REG8(0x500a), 0x00 },
> +	{ CCI_REG8(0x5100), 0x00 },
> +	{ CCI_REG8(0x5111), 0x20 },
> +};
> +
> +static const struct og0ve1b_mode og0va1b_supported_modes[] = {
> +	{
> +		.width = 640,
> +		.height = 480,
> +		.hts = 752,
> +		.vts = 2096,
> +		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.reg_list = {
> +			.regs = og0va1b_640x480_60fps_mode,
> +			.num_regs = ARRAY_SIZE(og0va1b_640x480_60fps_mode),
> +		},
> +	},
> +};
> +
>  static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
>  	{ CCI_REG8(0x30a0), 0x02 },
>  	{ CCI_REG8(0x30a1), 0x00 },
> @@ -276,6 +492,17 @@ static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
>  	},
>  };
>  
> +static int og0va1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
> +{
> +	u64 val = 0;
> +
> +	if (pattern)
> +		val = ((pattern - 1) << OG0VA1B_TEST_PATTERN_BAR_SHIFT) |
> +		      OG0VE1B_TEST_PATTERN_ENABLE;
> +
> +	return cci_write(og0ve1b->regmap, OG0VA1B_REG_TEST_PATTERN, val, NULL);
> +}
> +
>  static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
>  {
>  	u64 val = og0ve1b->pre_isp;
> @@ -288,10 +515,31 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
>  	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
>  }
>  
> +static const struct og0ve1b_sensor_data og0va1b_data = {
> +	.name = "og0va1b",
> +	.chip_id = OG0VA1B_CHIP_ID,
> +	.mclk_freq = OG0VA1B_MCLK_FREQ_19_2MHZ,
> +	.enable_test_pattern = og0va1b_enable_test_pattern,
> +	.test_pattern_menu = og0va1b_test_pattern_menu,
> +	.num_test_patterns = ARRAY_SIZE(og0va1b_test_pattern_menu),
> +	.exposure_shift = 0,
> +	.pixel_rate_mul = 2,
> +	.link_freq_menu = og0va1b_link_freq_menu,
> +	.num_link_freqs = ARRAY_SIZE(og0va1b_link_freq_menu),
> +	.modes = og0va1b_supported_modes,
> +	.num_modes = ARRAY_SIZE(og0va1b_supported_modes),
> +};
> +
>  static const struct og0ve1b_sensor_data og0ve1b_data = {
> +	.name = "og0ve1b",
>  	.chip_id = OG0VE1B_CHIP_ID,
>  	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
>  	.enable_test_pattern = og0ve1b_enable_test_pattern,
> +	.test_pattern_menu = og0ve1b_test_pattern_menu,
> +	.num_test_patterns = ARRAY_SIZE(og0ve1b_test_pattern_menu),
> +	.cache_test_pattern_reg = true,
> +	.exposure_shift = 4,
> +	.pixel_rate_mul = 1,
>  	.link_freq_menu = og0ve1b_link_freq_menu,
>  	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
>  	.modes = og0ve1b_supported_modes,
> @@ -332,7 +580,8 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_EXPOSURE:
>  		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
> -				ctrl->val << 4, NULL);
> +				ctrl->val << og0ve1b->data->exposure_shift,
> +				NULL);
>  		break;
>  	case V4L2_CID_VBLANK:
>  		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
> @@ -360,7 +609,7 @@ static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
>  	const struct og0ve1b_mode *mode = &data->modes[0];
>  	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
>  
> -	return div_u64(data->link_freq_menu[0], bpp);
> +	return div_u64(data->link_freq_menu[0] * data->pixel_rate_mul, bpp);
>  }
>  
>  static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
> @@ -413,8 +662,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>  
>  	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &og0ve1b_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
> -				     ARRAY_SIZE(og0ve1b_test_pattern_menu) - 1,
> -				     0, 0, og0ve1b_test_pattern_menu);
> +				     data->num_test_patterns - 1,
> +				     0, 0, data->test_pattern_menu);
>  
>  	if (ctrl_hdlr->error)
>  		return ctrl_hdlr->error;
> @@ -621,7 +870,7 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
>  	u64 val;
>  	int ret;
>  
> -	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_CHIP_ID, &val, NULL);
> +	ret = cci_read(og0ve1b->regmap, OG0V_REG_CHIP_ID, &val, NULL);
>  	if (ret) {
>  		dev_err(og0ve1b->dev, "failed to read chip id: %d\n", ret);
>  		return ret;
> @@ -633,10 +882,12 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
>  		return -ENODEV;
>  	}
>  
> -	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
> -		       &og0ve1b->pre_isp, NULL);
> -	if (ret)
> -		dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
> +	if (og0ve1b->data->cache_test_pattern_reg) {
> +		ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
> +			       &og0ve1b->pre_isp, NULL);
> +		if (ret)
> +			dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
> +	}
>  
>  	return ret;
>  }
> @@ -732,6 +983,8 @@ static int og0ve1b_probe(struct i2c_client *client)
>  		return -ENODEV;
>  
>  	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
> +	v4l2_i2c_subdev_set_name(&og0ve1b->sd, client,
> +				 og0ve1b->data->name, NULL);
>  
>  	og0ve1b->regmap = devm_cci_regmap_init_i2c(client, 16);
>  	if (IS_ERR(og0ve1b->regmap))
> @@ -863,6 +1116,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>  };
>  
>  static const struct of_device_id og0ve1b_of_match[] = {
> +	{ .compatible = "ovti,og0va1b", .data = &og0va1b_data },
>  	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
>  	{ /* sentinel */ }
>  };
> @@ -881,5 +1135,5 @@ static struct i2c_driver og0ve1b_i2c_driver = {
>  module_i2c_driver(og0ve1b_i2c_driver);
>  
>  MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
> -MODULE_DESCRIPTION("OmniVision OG0VE1B sensor driver");
> +MODULE_DESCRIPTION("OmniVision OG0VE1B/OG0VA1B sensor driver");
>  MODULE_LICENSE("GPL");
> 

-- 
Regards,

Sakari Ailus
