Received: from mta1.migadu.com (out-26.mta1.migadu.com [95.215.58.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C71A4DBD75
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605437; cv=none; b=TKbfuyFpjn0HhksO7hIXOSmashDdV1slbYu7oX0S/ITgKwyE//U91e+8k4rqoLIxO61fxUUYbrXqGe/rVEW8HcJ43/K5qLYUkD8frXr8KbI/oLlX2Cm3ACmM9CdMBZz5+I/Rx0wLgZW6RazOmeHDlhFcjst4AanJQGR/MJtsaAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605437; c=relaxed/simple;
	bh=1Pt5c0ewlbxs35Qenv4TwVyYegBMJMSsO1N36lie138=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmnRBgAml0dk5kaIUi/irSTHV25IyjKEuvyTG5cdl5Ns1mrCqrsYXErUlmzOCf1a4y7zFACscVmcIFYsGjNZoyYeJsMWC3liUjGb1i4K/3D5xRAWzPhMhkt3PRxKlFoZ++wDgm43wwcjNWLKVxgsfwmdu72tDCFC7p9PXLg3Wcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TTbQt+ME; arc=none smtp.client-ip=95.215.58.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TTbQt+ME"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1Pt5c0ewlbxs35Qenv4TwVyYegBMJMSsO1N36lie138=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790605430; v=1; x=1791210230;
 b=TTbQt+ME2K8PxCLCOmpoW5JqKs4ryiFwi0mHnJxOJO1XzsxjzoTRinLfYOwx2SEbVDyAZTtj
 O55Cmeivj9IA8AL3CD5hAknmeLiCvMAfVSj75YyaC+BBGDuPJtsN6OJxeLlEsDs0uFSWTQgHmQA
 tRdgor9s9niz+3WOM4KgIIH4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 39d7e5e62d16e8e6;
	Mon, 28 Sep 2026 14:23:50 +0000
X-Mizu-Trace-ID: 39d7e5e62d16e8e6
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 16:23:46 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] media: i2c: ov9282: fix flash duration control
 range
Message-ID: <arpyD2CjxOqwQvx8@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev>
 <CAPY8ntAk1z-BuftZufd-qPwP9fDf9NQ0nwJn8XMV6pGKLfrFKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAk1z-BuftZufd-qPwP9fDf9NQ0nwJn8XMV6pGKLfrFKA@mail.gmail.com>

Hi Dave,

thanks for your feedback! Greatly appreciated!

On Mon, Sep 28, 2026 at 02:47:36PM +0100, Dave Stevenson wrote:
> Hi Richard
> 
> On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> <richard.leitner@linux.dev> wrote:
> >
> > When updating the flash_duration range ensure the ceiling is at least as
> > long as the exposure time is. This may cause the calculated
> > flash_duration register value to be rounded up.
> >
> > This is done by introducing a new
> > ov9282_update_ctrl_range_flash_duration() function and using them
> > wherever possible.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++-------------------
> >  1 file changed, 28 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index f728709fcf0a6..be38ecfad8c82 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -541,6 +541,29 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> >                                 NSEC_PER_USEC);
> >  }
> >
> > +/**
> > + * ov9282_update_ctrl_range_flash_duration() - Update flash_duration control range
> > + * @ov9282: pointer to ov9282 device
> > + *
> > + * This may round up the ceiling to the microseconds representation of the
> > + * next flash_duration register value to make sure one can illuminate the whole
> > + * exposure time long.
> > + *
> > + * Return: 0 if successful, error code otherwise.
> > + */
> > +static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
> > +{
> > +       u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > +       u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
> > +       u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> > +
> > +       if (fd_max_us < exposure_us)
> > +               fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
> 
> Reading the driver for how it handles flash duration, it all gets a
> bit convoluted. I see part of it comes from the units being usecs
> whilst natively it is in lines, but we've got this slightly odd calc
> and adding 1, and rounding in try_ctrl to get closest to the absolute
> value.

That's true. I'm also not happy with this back-and-forth conversion between
u/n-secs and lines. From a V4l2 API user perspective I'd love to have
all "timing related" controls in the same unit (likely usecs). I was
already playing around with that approach, but as this would break the
current exporsure property I have not sent those patches...

If you have any "mainline-acceptable" idea on how to do that I would
definitely love to hear it ;-)

> Seeing as this is the max flash_duration, is it actually limited by
> the exposure, or by the frame duration? The difference between those
> is a minimum of 25 lines (OV9282_EXPOSURE_OFFSET), which I think gives
> you up to another 9usecs to play with. That covers any of this
> rounding stuff. You can afford to always round that one down and never
> clip the range below the exposure time.

From a hardware perspective this isn't limited at all AFAICT. But from a
"use-case" perspective a flash_duration (with a flash offset=0, which is
the hard-coded default case in this driver currently) longer than the
exposure time makes no sense, as it does not have any effect on the image.

With this patch I want to make sure to be able to illuminate the frame
during the complete exposure time, but keep the maximum as short as
possible. So I was comparing/aiming this at the exposure time, not the
frame duration.

As the frame duration is OV9282_EXPOSURE_OFFSET longer than the exposure
time: Would a "turned-on flash" during those 25 lines have any impact on
the frames brightness in your opinion?
I haven't explicitely tested/measured this with hardware, but I guess
this does not have any impact?

Or do you mean when calculating against the frame duration the +/-1
stuff can be dropped and the code would be easier to read?

Sorry If misunderstood your feedback somehow.

> 
> There is reference in the docs to a different behaviour if "the
> vertical blanking period is long", but with a bit to set to give
> stable behaviour (0x3017 bit 1).

I've read that paragraph in the datasheet, yes. But as this was not
affecting my use-case I haven't included this in this series or my
downstream kernel. Do you think it's worth adding support for this? Do
you know of any reports complaining about this power saving feature?

thanks!

regards;rl

> 
> You've far more experience with how this sensor handles the strobe
> outputs though.
> 
>   Dave
> 
> > +
> > +       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, fd_max_us,
> > +                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > +}
> > +
> >  /**
> >   * ov9282_update_controls() - Update control ranges based on streaming mode
> >   * @ov9282: pointer to ov9282 device
> > @@ -555,7 +578,6 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >  {
> >         u32 hblank_min;
> >         s64 pixel_rate;
> > -       u32 exposure_us;
> >         u32 lpfr;
> >         int ret;
> >
> > @@ -590,9 +612,7 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >         if (ret)
> >                 return ret;
> >
> > -       exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > -       return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, exposure_us,
> > -                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > +       return ov9282_update_ctrl_range_flash_duration(ov9282);
> >  }
> >
> >  /**
> > @@ -605,11 +625,9 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
> >   */
> >  static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >  {
> > -       u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
> >         int ret, ret_hold;
> >
> > -       dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
> > -               exposure, exposure_us, gain);
> > +       dev_dbg(ov9282->dev, "Set exp %u, analog gain %u", exposure, gain);
> >
> >         ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
> >         if (ret)
> > @@ -623,9 +641,7 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >         if (ret)
> >                 goto error_release_group_hold;
> >
> > -       ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> > -                                      0, exposure_us, 1,
> > -                                      OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > +       ret = ov9282_update_ctrl_range_flash_duration(ov9282);
> >
> >  error_release_group_hold:
> >         ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
> > @@ -660,11 +676,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >                  * Ensure the flash duration range is also updated on powered
> >                  * down sensors.
> >                  */
> > -               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> > -                                              ov9282_exposure_to_us(ov9282,
> > -                                                                    ctrl->val),
> > -                                              1,
> > -                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > +               ret = ov9282_update_ctrl_range_flash_duration(ov9282);
> >                 if (ret)
> >                         return ret;
> >                 break;
> > @@ -674,10 +686,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >                  * duration. Therefore recalculate the flash duration range
> >                  * here.
> >                  */
> > -               exposure = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > -               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> > -                                              exposure, 1,
> > -                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > +               ret = ov9282_update_ctrl_range_flash_duration(ov9282);
> >                 if (ret)
> >                         return ret;
> >                 break;
> >
> > --
> > 2.53.0
> >
> >
