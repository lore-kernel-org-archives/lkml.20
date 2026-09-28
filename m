Received: from mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572C34A688A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595091; cv=none; b=AtUSGGCG7oBQMT1GZwuN+EsveqfWi7kHC5d7tDn5oKKqkMsFKRDCHOeSTFchkj6BXsbN3wFlwnNY6o30mXgZiZcwrV1c/1IBxOCcx3Crc8Y3i1U1NWsOUAMMy+8nhyY0B9caDgQZcmZ0bdUVjpvc7YiP+H1cR/4YX9FPExprf8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595091; c=relaxed/simple;
	bh=dgWvWDnPIovk5yEYvXqTRrko64Qc5sxoiB5saCqC1gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0/D3t2dAAJp2l3L6yIdI0W05ade67idsATBr14kaEHCxpSi+X2d0FeslY+L0j3TrHTUJKcNdIOHHhSr5EN51tm75tPQntGjQdoii3joy0AQyOdH2sWeSke5idSKo+pSB9tNuyq+d7RU08LnBxG9m81F8IWjDckF3fnOizHA3sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mMhMEVx7; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mMhMEVx7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dgWvWDnPIovk5yEYvXqTRrko64Qc5sxoiB5saCqC1gE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790595087; v=1; x=1791199887;
 b=mMhMEVx7X8MH/zTr6zYMjBeojVp7GSNlBjtZyY+tffCJR/cZWDjif1pHy6Hpc2R0qpqIQfu2
 nwTFmRXLy0VOjfRuoJQ7p2wNef4h5QaDVbi8hf9mL4Wudswp4PafSPcrT6q/4OQ/pAdD4wh3QQ3
 UTndXxHwY8U8SjXaCvTnACJw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id abb5d200b0d51ee6;
	Mon, 28 Sep 2026 11:31:26 +0000
X-Mizu-Trace-ID: abb5d200b0d51ee6
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 13:31:24 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] media: i2c: ov9282: fix flash duration to/from
 microseconds conversion
Message-ID: <arpPIsMh08fEYHTx@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-3-f520af59df1b@linux.dev>
 <CAPY8ntBrN-GHT6+Nd+wu6Np2CEbsT5PGG-RjVcB2H3+8wSNoKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntBrN-GHT6+Nd+wu6Np2CEbsT5PGG-RjVcB2H3+8wSNoKg@mail.gmail.com>

On Mon, Sep 28, 2026 at 12:07:13PM +0100, Dave Stevenson wrote:
> Hi Richard
> 
> On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> <richard.leitner@linux.dev> wrote:
> >
> > Currently the flash duration is converted to/from microseconds using a
> > fixed OV9282_STROBE_SPAN_FACTOR constant. This is inaccurate as it was
> > found that the "step width of shift and span" (which is not documented
> > further in the datasheet) scales with the line, so the span is counted
> > in lines.
> >
> > Fix the conversion by dropping the constant factor and using the
> > previously introduced ov9282_line_time_ns() helper instead.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 66 +++++++++++++++++++++++++---------------------
> >  1 file changed, 36 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 3f83a6cf338d8..90a0fe542ce4a 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -133,8 +133,6 @@
> >  #define OV9282_REG_MIN         0x00
> >  #define OV9282_REG_MAX         0xfffff
> >
> > -#define OV9282_STROBE_SPAN_FACTOR      192
> > -
> 
> I'd been scratching my head over this one of where this magic number
> had come from previously. I've now just clocked that it's the
> (corrected) 8bit pixel rate.
> Using the updated version of ov9282_line_time_ns we've discussed in
> 2/10, this should therefore give the correct numbers.

This was literally introduced by me as I had no clue how to correctly
calculate those values back then. The value was basically the result of my
scope measurements for my specific use case. It was the best
approximation I could find back then ;-)

https://lore.kernel.org/lkml/20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev/

> 
> I'll hold off on giving an R-b until I can see it in-situ with the
> other updates, but it looks like it should be correct.

Sure. Makes sense!

thanks!

regards;rl

> 
>   Dave
> 
> >  static const char * const ov9282_supply_names[] = {
> >         "avdd",         /* Analog power */
> >         "dovdd",        /* Digital I/O power */
> > @@ -509,6 +507,42 @@ static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> >                        NSEC_PER_USEC);
> >  }
> >
> > +/**
> > + * ov9282_us_to_flash_duration() - Convert µs to flash duration register value
> > + * @ov9282: pointer to ov9282 device
> > + * @value: microseconds value to convert
> > + *
> > + * Calculate "strobe_frame_span" increments from a given value (µs). According
> > + * to the datasheet "The step width of shift and span is programmable under
> > + * system clock domain.", but this is not documented further. Nonetheless the
> > + * step width was found empirically to scale with the line length, so the span
> > + * is counted in lines.
> > + *
> > + * Return: flash duration register value
> > + */
> > +static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
> > +{
> > +       return div_u64((u64)value * NSEC_PER_USEC, ov9282_line_time_ns(ov9282));
> > +}
> > +
> > +/**
> > + * ov9282_flash_duration_to_us() - Convert flash duration register value to µs
> > + * @ov9282: pointer to ov9282 device
> > + * @value: flash duration register value to convert
> > + *
> > + * Convert a given "strobe_frame_span" increment value to microseconds. For an
> > + * explanation regarding conversion factor see the documentation of
> > + * ov9282_us_to_flash_duration. As the calculation there uses an integer
> > + * division round up here.
> > + *
> > + * Return: microseconds
> > + */
> > +static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> > +{
> > +       return DIV_ROUND_UP_ULL((u64)value * ov9282_line_time_ns(ov9282),
> > +                               NSEC_PER_USEC);
> > +}
> > +
> >  /**
> >   * ov9282_update_controls() - Update control ranges based on streaming mode
> >   * @ov9282: pointer to ov9282 device
> > @@ -585,34 +619,6 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >         return ret ? ret : ret_hold;
> >  }
> >
> > -static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
> > -{
> > -       /*
> > -        * Calculate "strobe_frame_span" increments from a given value (µs).
> > -        * This is quite tricky as "The step width of shift and span is
> > -        * programmable under system clock domain.", but it's not documented
> > -        * how to program this step width (at least in the datasheet available
> > -        * to the author at time of writing).
> > -        * The formula below is interpolated from different modes/framerates
> > -        * and should work quite well for most settings.
> > -        */
> > -       u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > -
> > -       return value * OV9282_STROBE_SPAN_FACTOR / frame_width;
> > -}
> > -
> > -static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> > -{
> > -       /*
> > -        * Calculate back to microseconds from "strobe_frame_span" increments.
> > -        * As the calculation in ov9282_us_to_flash_duration uses an integer
> > -        * divison round up here.
> > -        */
> > -       u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> > -
> > -       return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
> > -}
> > -
> >  static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >         struct ov9282 *ov9282 =
> >
> > --
> > 2.53.0
> >
> >
