Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13EE4189C5;
	Tue, 22 Sep 2026 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065447; cv=none; b=KR2phcuTvqgcIVNiO8TotQZV8vwcVEhOtTwbco6O1pvCJ6hxV7IzfayhYXiJWJROvQmQqm/vcEj/thL1kG0/6HO4B3sjPHOIZ1O3uehkbcJlCWQG4AYgjyM47dt6opxqB4XYrVoUJFeMEOL119scsYMn4jg9sVAPTDWC71bFFe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065447; c=relaxed/simple;
	bh=cNNOgTAthgt3Csn3WIBXnELfcBHnpnhjnkYVhKlVgUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEhITBa9Lxy/55Ap8+LQNX/dUKjLksiaHrE14DpQmGBm29ziEhi1vAtlJhvSSkFNq0EprRyAjLfd9xP5plFgBYQwIc5XpoD/FuCAzJifNcsoxWqP5NM0xVxc/exG5e48pvU+iXKvrBda2RJ0QRYcg1m8WIIzTOunoR9KmY6ALeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcP7M6it; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcP7M6it"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790065444; x=1821601444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cNNOgTAthgt3Csn3WIBXnELfcBHnpnhjnkYVhKlVgUA=;
  b=PcP7M6itNLyLe76us72I9+kTSiHTaxNBtM5stPvSLMR7ugHj1mMjdcdY
   ptOmgrTaw6VS+uzpWcIoV2rsy2+8HOQGbWJ7l1xaBIFiDfn1shojvnjSc
   nXOl4rdSCYXxuPf/0dY9i5EaCVhn3g5NcJQvqcjc80YFsTqaTcJQC3ufw
   NSq9GyvRGe5F2WeIGo1B5L6nw4wva+8uGkAdboZVTzf96VHv0+e8WgAXK
   PWAS5pQQIB0zbhuFgh9H5s2aTCja+lsYKyTat0le69CbIPrDFpyOqsbsV
   TOnnlOEUTB4abLpMQGFRp+l+EdBbTkI/3rNtZQMvInn8c5S1+ntv4HU4p
   Q==;
X-CSE-ConnectionGUID: eVXbC1FjQtee9t62keZfzg==
X-CSE-MsgGUID: xlRE0L5jSayy2DORuGgJGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90514251"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90514251"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:24:02 -0700
X-CSE-ConnectionGUID: 8UxtX1PSRs2InYC/0XvSqg==
X-CSE-MsgGUID: mA9k9lbNSMm8dH02reIhdg==
X-ExtLoop1: 1
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:24:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5B89D121B9F;
	Tue, 22 Sep 2026 11:24:00 +0300 (EEST)
Date: Tue, 22 Sep 2026 11:24:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, david@ixit.cz,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: imx355: reuse existing CCS defines
Message-ID: <arI7IHsQUyFliVVu@kekkonen.localdomain>
References: <20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz>
 <178847463591.4073535.11299899376239571707@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178847463591.4073535.11299899376239571707@ping.linuxembedded.co.uk>

Hi Kieran, David,

On Thu, Sep 03, 2026 at 11:30:35PM +0100, Kieran Bingham wrote:
> Quoting David Heidelberg via B4 Relay (2026-08-27 10:26:53)
> > From: David Heidelberg <david@ixit.cz>
> > 
> > The driver may not be MIPI CCS compliant, but does use same address and
> > often set same values as compliant drivers. Do not redefine registers we
> > already know and are standard.
> > 
> > No functional changes.
> 
> I kind of like the idea of this. I suspect it would help show which
> sensors have overlap and where helpers could be built up.
> 
> I worry if it makes it harder to see what registers are being modified
> though, but I think the common definitions are parseable by tools and
> add an improvement to human readability because now we see they are from
> the common set, and not some arbitrary possibly similarly named register
> ?
> 
> > 
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> > Changes in v2:
> > - Replaced all occurences with CCS ones.
> > - Link to v1: https://patch.msgid.link/20260819-imx355-ccsify-v1-1-0b6cef77e340@ixit.cz
> > ---
> >  drivers/media/i2c/imx355.c | 84 ++++++++++++++--------------------------------
> >  1 file changed, 25 insertions(+), 59 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index 8eb8588cb71bb..2c845b7b3df4f 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -14,89 +14,55 @@
> >  #include <linux/unaligned.h>
> >  
> >  #include <media/v4l2-cci.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-fwnode.h>
> >  
> > -#define IMX355_REG_MODE_SELECT         CCI_REG8(0x0100)
> > -#define IMX355_MODE_STANDBY            0x00
> > -#define IMX355_MODE_STREAMING          0x01
> > +#include "ccs/ccs-regs.h"
> >  
> > -/* Chip ID */
> > -#define IMX355_REG_CHIP_ID             CCI_REG16(0x0016)
> >  #define IMX355_CHIP_ID                 0x0355
> >  
> > -#define IMX355_REG_LANE_SEL            CCI_REG8(0x0114)
> > -
> >  /* PLL registers that depend on the external clock frequency */
> > -#define IMX355_REG_EXTCLK_FREQ         CCI_REG16(0x0136)
> >  #define IMX355_REG_PLL_OP_PREDIV       CCI_REG8(0x030d)
> > -#define IMX355_REG_PLL_OP_MUL          CCI_REG16(0x030e)
> 
> I'm surprised that two registers have equivalents, but the other
> adjacent registers do not ? I haven't checked the spec through yet
> though. Is the gap because ccs-regs.h doesn't have the definition, or
> because this sensor has a different function / purpose for say 0x030d ?

This is:

#define CCS_R_OP_PRE_PLL_CLK_DIV				CCI_REG16(0x030c)

so in CCS there's a 16-bit register there. Writes to undefined registers
are generally nop, so this is also compliant with CCS. Sony simply hasn't
needed 16 bits and has defined a 8-bit register instead. (In some cases
there could be something else there because the sensor isn't fully
compliant so one needs to be careful.) Up to you whether you want to use it
or not. Otherwise this patch seems good as-is.

> 
> >  #define IMX355_REG_PLL_IVT_PCK_DIV     CCI_REG8(0x0301)
> >  #define IMX355_REG_PLL_IVT_SYSCK_DIV   CCI_REG8(0x0303)
> >  #define IMX355_PLL_OP_PREDIV           2
> >  #define IMX355_PLL_IVT_PCK_DIV         5
> >  
> >  /* V_TIMING internal */
> > -#define IMX355_REG_FLL                 CCI_REG16(0x0340)
> >  #define IMX355_FLL_MAX                 0xffff
> >  #define IMX355_VBLANK_MIN              20
> 
> Where there are limits, I believe CCS has registers to read the limits.
> That's where I wonder if there could be ccs helpers, to support parsing
> of blanking. But I also am weary that breaking parts into lots of small
> helpers could just become unreadable, so I wouldn't push for that at the
> moment. I'd be curious to know 'how common' this is to CCS though.
> 
> 
> >  
> > -#define IMX355_REG_LLP                 CCI_REG16(0x0342)
> >  #define IMX355_LLP_MAX                 0xffff
> >  
> > -#define IMX355_REG_X_ADD_START         CCI_REG16(0x0344)
> > -#define IMX355_REG_Y_ADD_START         CCI_REG16(0x0346)
> > -#define IMX355_REG_X_ADD_END           CCI_REG16(0x0348)
> > -#define IMX355_REG_Y_ADD_END           CCI_REG16(0x034a)
> > -#define IMX355_REG_X_OUT_SIZE          CCI_REG16(0x034c)
> > -#define IMX355_REG_Y_OUT_SIZE          CCI_REG16(0x034e)
> > -
> 
> But when a whole block comes out like this - that makes me think perhaps
> the crop control or fmts might just be a common function ?
> 
> >  /* Exposure control */
> > -#define IMX355_REG_EXPOSURE            CCI_REG16(0x0202)
> >  #define IMX355_EXPOSURE_MIN            1
> >  #define IMX355_EXPOSURE_STEP           1
> >  #define IMX355_EXPOSURE_DEFAULT                0x0282
> >  #define IMX355_EXPOSURE_OFFSET         10
> >  
> >  /* Analog gain control */
> > -#define IMX355_REG_ANALOG_GAIN         CCI_REG16(0x0204)
> >  #define IMX355_ANA_GAIN_MIN            0
> >  #define IMX355_ANA_GAIN_MAX            960
> >  #define IMX355_ANA_GAIN_STEP           1
> >  #define IMX355_ANA_GAIN_DEFAULT                0
> >  
> >  /* Digital gain control */
> >  #define IMX355_REG_DPGA_USE_GLOBAL_GAIN        CCI_REG8(0x3070)
> > -#define IMX355_REG_DIG_GAIN_GLOBAL     CCI_REG16(0x020e)
> >  #define IMX355_DGTL_GAIN_MIN           256
> >  #define IMX355_DGTL_GAIN_MAX           4095
> >  #define IMX355_DGTL_GAIN_STEP          1
> >  #define IMX355_DGTL_GAIN_DEFAULT       256
> 
> I'd be curious if all of those limits could be read from registers, in
> case future helpers might do that instead .... But hardcoding known
> values in this specific driver is probably better than adding the
> complexity of trying to read them at runtime just to obtain the values
> above.

The limit and capability registers are typically where most of the errors
are. Also, this is a sensor specific driver so even if you could read
something from a register, I think it's just as good to have it hardcoded
in the driver.

> 
> I'm not sure I've gone through this enough to warrant a tag of some
> form, but I found the patch concept interesting enough to want to jump
> in to the conversation ;-)
> 
> Interested to see what happens anyway!

-- 
Regards,

Sakari Ailus
