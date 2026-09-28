Received: from mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD33847F76D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585801; cv=none; b=CcU0Hvj4wCdExxypmyM0YfzRgaEwFsLsrqwepi0ZDgYWGWL0sOBQEPTYsq4BKhTM5MB/2250q37FCLex0Jp0a1JEe4tldYMHNm0kIOvfnmPgFcj0ApI/GVK8pVwGP2aJ+GM28CABNyR9ITpA7Ri1Nq/GVegDzYX6PRhxXoasCbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585801; c=relaxed/simple;
	bh=blYRBATe5OLMMPPnDBP8RVp9MnZuuZr7DVaMOXLfCOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrtQeWHRIRX7y0fE3xXNE/v7GA4ArA2T3qvr3qjOgb/L6zEZWYYVvRD0P58VzQMXNfeIkEIMhXXRODBUufWkJWr+Hn1mQLbIVbtEW8UilP/QGFhWuROInUDknhe0kixoKqFwfmzWDf/hpWTyy9ByNne6mchZLUZZzZrns7l0a8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o03E5lYB; arc=none smtp.client-ip=95.215.58.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o03E5lYB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=blYRBATe5OLMMPPnDBP8RVp9MnZuuZr7DVaMOXLfCOg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790585797; v=1; x=1791190597;
 b=o03E5lYBXzk39nECo1YLzIkDQIFZEbQfuJWYVbKtoTgYYYFqupfuTqCt/wZnyi31RNDOho/B
 4tFVXx/afcs5xmrZkTx6kW+4fkdtMKpBEahUWhWleXWeFcUSqYQHfFsDnzPKPccvgmKdX7OCuYv
 StWTmXJIQHL3KDHPBnji9S6M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id add109b2092b6c53;
	Mon, 28 Sep 2026 08:56:37 +0000
X-Mizu-Trace-ID: add109b2092b6c53
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 10:56:35 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] media: i2c: ov9282: fix line time and exposure
 time calculation
Message-ID: <aronEaoCLJo0h2Ni@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-2-f520af59df1b@linux.dev>
 <CAPY8ntBUtZ3zkJrekAuXamMH-M+4gcS9vEid3DFrLgrwg2jQmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntBUtZ3zkJrekAuXamMH-M+4gcS9vEid3DFrLgrwg2jQmw@mail.gmail.com>

Hi Dave,

thanks for your feedback!

On Wed, Sep 23, 2026 at 03:16:27PM +0100, Dave Stevenson wrote:
> Hi Richard
> 
> On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> <richard.leitner@linux.dev> wrote:
> >
> > ov9282_exposure_to_us() divided the line length by the pixel rate control,
> > which is the MIPI rate and not the clock HTS is counted in.
> 
> It really shouldn't be. PIXEL_RATE is the pixel array and LINK_FREQ is
> the MIPI rate. Many drivers do conflate the two.
> 
> However I did notice a couple of weeks back that pixel_rate is
> incorrect for 8bit readout on ov9282 [1]. (It's correct for 10bit
> readout).
> 
> <quote> Actually I see the problem. In the hardware the pixel rate for 8 bit
> is scaled by the change of PLL2 multiplier from 0x50 to 0x60 = x1.2.
> The pixel rate control is scaled from /10 to /8 or x1.25. 1.2/1.25 =
> 0.96, so my 96% of speed would be spot on. The use of link frequency
> in computing pixel rate is totally bogus as they are on independent
> PLLs </quote>

So I guess I should also get rid of the pixel rate pre-processor
calculation which depends on the link frequency?

Is it OK with you to just hard-code them?

#define OV9282_PIXEL_RATE_10BIT   160000000
#define OV9282_PIXEL_RATE_8BIT    192000000

AFAICT it should be possible to calculate the PLL1 pix clk from the input
clock (inclk or XVCLK in the datasheet) provided in the dts. But tbh I
would prefer to not add this to this series. If it's desired and possible
from your point of view, I can tackle this in a future series.

> 
> If you correct OV9282_PIXEL_RATE_8BIT to being 192000000 (instead of
> the current 200000000), does that solve your problem without
> recomputing things?

Thanks for the explanation above. I guess you're right, the link freq/mipi
rate should not be in there. I've just ran a quick test and it should be
fine with that change.

As i would like to keep the ov9282_line_time_ns() function, what's your
take on the following implementation? Would that be OK for a v2?

static u32 ov9282_line_time_ns(struct ov9282 *ov9282)
{
	u64 hts = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
	return div_u64(hts * NSEC_PER_SEC, ov9282->pixel_rate->val);
}

thanks!

regards;rl

> 
>   Dave
> 
> [1] https://lore.kernel.org/linux-media/CAPY8ntBaSHjztuSLTOtv9KYvEbmcbinSMJ78ZDg+0sZg-1fz3Q@mail.gmail.com/
> The original reporter did come back to me and acknowledge he was using
> the downstream Rockchip driver which is doing the wrong thing.
> 
> > The right
> > clock is PLL2's system clock. With the PLL2 dividers left at their reset
> > values the chain
> >
> > SYS_CLK = XVCLK  / pre_div0 / pre_div * loop_div / sys_pre_div / sys_div
> >         =    24  /    1     /    3    * loop_div /     4       /    2
> >
> > collapses to SYS_CLK = loop_div MHz.
> >
> > Fix this by introducing a new static function to calculate the current
> > line time and use it in ov9282_exposure_to_us().
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 46 +++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 37 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index c10b2e205834e..3f83a6cf338d8 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -10,10 +10,12 @@
> >  #include <linux/delay.h>
> >  #include <linux/i2c.h>
> >  #include <linux/math.h>
> > +#include <linux/math64.h>
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/time64.h>
> >
> >  #include <media/v4l2-cci.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -472,6 +474,41 @@ static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
> >         return container_of(subdev, struct ov9282, sd);
> >  }
> >
> > +/**
> > + * ov9282_line_time_ns() - Calculate duration of one sensor line.
> > + * @ov9282: pointer to ov9282 device
> > + *
> > + * The line time and therefore OV9282_REG_TIMING_HTS and the strobe frame span
> > + * are counted in PLL2's system clock. We assume the PLL2 dividers are at their
> > + * reset values, so the formula reduces to SYS_CLK = loop_div MHz.
> > + *
> > + * Return: line time in nanoseconds.
> > + */
> > +static u32 ov9282_line_time_ns(struct ov9282 *ov9282)
> > +{
> > +       u32 hts = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > +       u32 sclk_rate_mhz = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ?
> > +               OV9282_PLL_CTRL_0D_RAW10 : OV9282_PLL_CTRL_0D_RAW8;
> > +
> > +       /*
> > +        * OV9282_REG_TIMING_HTS counts 2-pixel units
> > +        */
> > +       return DIV_ROUND_CLOSEST(hts * (u32)NSEC_PER_USEC, 2 * sclk_rate_mhz);
> > +}
> > +
> > +/**
> > + * ov9282_exposure_to_us() - Convert an exposure register value to microseconds
> > + * @ov9282: pointer to ov9282 device
> > + * @exposure: exposure register value to convert
> > + *
> > + * Return: microsecond represenation of the given exposure register value.
> > + */
> > +static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> > +{
> > +       return div_u64((u64)exposure * ov9282_line_time_ns(ov9282),
> > +                      NSEC_PER_USEC);
> > +}
> > +
> >  /**
> >   * ov9282_update_controls() - Update control ranges based on streaming mode
> >   * @ov9282: pointer to ov9282 device
> > @@ -510,15 +547,6 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >                                         mode->vblank_max, 1, mode->vblank);
> >  }
> >
> > -static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> > -{
> > -       /* calculate exposure time in µs */
> > -       u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > -       u32 trow_us = frame_width / (ov9282->pixel_rate->val / 1000000UL);
> > -
> > -       return exposure * trow_us;
> > -}
> > -
> >  /**
> >   * ov9282_update_exp_gain() - Set updated exposure and gain
> >   * @ov9282: pointer to ov9282 device
> >
> > --
> > 2.53.0
> >
> >
