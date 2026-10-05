Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DA54AF9E9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211622; cv=none; b=R5/rHRBZl+CuPFccQODEKpiKobn6NaCSY2wY2+PwGsdgw5D+zSkfojt6Aj16jVGnKwTkoc4qDJ18pwQ8aNPcjjuLzLwsAEsXcCUNcjpcXmcJ1uy2NwbqLnbp+DWdjawDJz0i6QIkWXzytRxiPD7s2vjxviJydLGF38FE/sNhjbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211622; c=relaxed/simple;
	bh=j7Fabh1ipsvJpw4nlYqUplEE8dTCxplH8Wq6kmUOg1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLE9Aa978X7Z02QNdJxM23+jCVX5hlOeQz5UjOGm43rTgd1Gvlj6YttiaD2i/vE06BRs7l5Zz1Y/VL/KKdevfJQp6eH6Tz1rec9BpF/NrzItO1z/kfO4GIX97XxuK6eETpjkelbXrokf53tIsLdyWehy3inzS8PzEUsjz35d8Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OmYOgKur; arc=none smtp.client-ip=95.215.58.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OmYOgKur"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j7Fabh1ipsvJpw4nlYqUplEE8dTCxplH8Wq6kmUOg1o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791211615; v=1; x=1791816415;
 b=OmYOgKur8w7x5rzhbqdrCU9HtpKwXYr7KChRkdPfZPhBqTJAKtfGnAB3w1jcEAykKiChwdlS
 QkRzmKxSn3a+MxAGEX0KxarthK5n/nnpqTiPgKU8etMY0thMcOUDm2xFE/mpIMw9lIcZF1wKiag
 gdO9Oi6YJHvD0CHgioq5zT0A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 83017cc526c8b5ba;
	Mon, 05 Oct 2026 14:46:55 +0000
X-Mizu-Trace-ID: 83017cc526c8b5ba
X-Migadu-Flow: FLOW_OUT
Date: Mon, 5 Oct 2026 16:46:50 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Martina Krasteva <martinax.krasteva@intel.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] media: i2c: ov9282: fix flash duration control
 range
Message-ID: <asO1sIZC8rOyhSnu@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev>
 <CAPY8ntAk1z-BuftZufd-qPwP9fDf9NQ0nwJn8XMV6pGKLfrFKA@mail.gmail.com>
 <arpyD2CjxOqwQvx8@bombadil>
 <CAPY8ntAMUwemmB+LLOS=WGozvBSyXoYrpWDdyGeyjHQ6Y6sh0Q@mail.gmail.com>
 <arrVt-0ctw1cXkkW@bombadil>
 <CAPY8ntC1SEr3seqcAWchZ8A9nSqWp-FZow7v=o-oL8CcQgMaNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntC1SEr3seqcAWchZ8A9nSqWp-FZow7v=o-oL8CcQgMaNQ@mail.gmail.com>

On Tue, Sep 29, 2026 at 03:06:51PM +0100, Dave Stevenson wrote:
> On Mon, 28 Sept 2026 at 22:08, Richard Leitner
> <richard.leitner@linux.dev> wrote:
> >
> > On Mon, Sep 28, 2026 at 03:40:21PM +0100, Dave Stevenson wrote:
> > > On Mon, 28 Sept 2026 at 15:23, Richard Leitner
> > > <richard.leitner@linux.dev> wrote:
> > > >
> > > > Hi Dave,
> > > >
> > > > thanks for your feedback! Greatly appreciated!
> > > >
> > > > On Mon, Sep 28, 2026 at 02:47:36PM +0100, Dave Stevenson wrote:
> > > > > Hi Richard
> > > > >
> > > > > On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> > > > > <richard.leitner@linux.dev> wrote:
> > > > > >
> > > > > > When updating the flash_duration range ensure the ceiling is at least as
> > > > > > long as the exposure time is. This may cause the calculated
> > > > > > flash_duration register value to be rounded up.
> > > > > >
> > > > > > This is done by introducing a new
> > > > > > ov9282_update_ctrl_range_flash_duration() function and using them
> > > > > > wherever possible.
> > > > > >
> > > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > > ---
> > > > > >  drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++-------------------
> > > > > >  1 file changed, 28 insertions(+), 19 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > > > index f728709fcf0a6..be38ecfad8c82 100644
> > > > > > --- a/drivers/media/i2c/ov9282.c
> > > > > > +++ b/drivers/media/i2c/ov9282.c
> > > > > > @@ -541,6 +541,29 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> > > > > >                                 NSEC_PER_USEC);
> > > > > >  }
> > > > > >
> > > > > > +/**
> > > > > > + * ov9282_update_ctrl_range_flash_duration() - Update flash_duration control range
> > > > > > + * @ov9282: pointer to ov9282 device
> > > > > > + *
> > > > > > + * This may round up the ceiling to the microseconds representation of the
> > > > > > + * next flash_duration register value to make sure one can illuminate the whole
> > > > > > + * exposure time long.
> > > > > > + *
> > > > > > + * Return: 0 if successful, error code otherwise.
> > > > > > + */
> > > > > > +static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
> > > > > > +{
> > > > > > +       u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > > > > > +       u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
> > > > > > +       u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> > > > > > +
> > > > > > +       if (fd_max_us < exposure_us)
> > > > > > +               fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
> > > > >
> > > > > Reading the driver for how it handles flash duration, it all gets a
> > > > > bit convoluted. I see part of it comes from the units being usecs
> > > > > whilst natively it is in lines, but we've got this slightly odd calc
> > > > > and adding 1, and rounding in try_ctrl to get closest to the absolute
> > > > > value.
> > > >
> > > > That's true. I'm also not happy with this back-and-forth conversion between
> > > > u/n-secs and lines. From a V4l2 API user perspective I'd love to have
> > > > all "timing related" controls in the same unit (likely usecs). I was
> > > > already playing around with that approach, but as this would break the
> > > > current exporsure property I have not sent those patches...
> > > >
> > > > If you have any "mainline-acceptable" idea on how to do that I would
> > > > definitely love to hear it ;-)
> > >
> > > Sadly I think that there is a need for some of the back and forth in
> > > conversions :-(
> > >
> > > > > Seeing as this is the max flash_duration, is it actually limited by
> > > > > the exposure, or by the frame duration? The difference between those
> > > > > is a minimum of 25 lines (OV9282_EXPOSURE_OFFSET), which I think gives
> > > > > you up to another 9usecs to play with. That covers any of this
> > > > > rounding stuff. You can afford to always round that one down and never
> > > > > clip the range below the exposure time.
> > > >
> > > > From a hardware perspective this isn't limited at all AFAICT. But from a
> > > > "use-case" perspective a flash_duration (with a flash offset=0, which is
> > > > the hard-coded default case in this driver currently) longer than the
> > > > exposure time makes no sense, as it does not have any effect on the image.
> > > >
> > > > With this patch I want to make sure to be able to illuminate the frame
> > > > during the complete exposure time, but keep the maximum as short as
> > > > possible. So I was comparing/aiming this at the exposure time, not the
> > > > frame duration.
> > > >
> > > > As the frame duration is OV9282_EXPOSURE_OFFSET longer than the exposure
> > > > time: Would a "turned-on flash" during those 25 lines have any impact on
> > > > the frames brightness in your opinion?
> > > > I haven't explicitely tested/measured this with hardware, but I guess
> > > > this does not have any impact?
> > >
> > > No, as this is a global shutter sensor I wouldn't expect the flash to
> > > impact the image if a connected flash was on for more lines than the
> > > exposure.
> > >
> > > > Or do you mean when calculating against the frame duration the +/-1
> > > > stuff can be dropped and the code would be easier to read?
> > >
> > > Yes, I'm suggesting the driver handles the range of values that the
> > > hardware can support correctly. Whether that helps for your image
> > > quality requirements is a different question.
> > > The driver can pass the buck with at least some of the rounding issues
> > > to userspace, which potentially has use-case specific knowledge. And
> > > it simplifies the driver in the process.
> >
> > Talking about "range of values that the hardware can support": AFAICT
> > the strobe duration is (from a sensor hardware point of view) not
> > limited by the frame duration. At least I found nothing on this in the
> > datasheet and a quick test on hardware also showed no correlation.
> 
> Interesting. So if you set it to a 1 second strobe pulse when
> streaming at 60fps, what behaviour do you get?

I haven't tested the 1 second strobe explicitely. But the strobe in my
case is always on for the configured time. No matter if it exceeds the
frame time/trigger. After the configured strobe_duration passed it goes
low until the next trigger happens.

Maybe the following visualization helps:


strobe duration < frame time:
                  __         __         __         __      
                 |  |       |  |       |  |       |  |     
strobe signal   _|  |_______|  |_______|  |_______|  |_____
strobe trigger   ^          ^          ^          ^


frame time < strobe duration < 2x frame time:
                  _____________         _____________ 
                 |             |       |             |
strobe signal   _|             |_______|             |_____
strobe trigger   ^          ^          ^          ^


2x frame time < strobe duration < 3x frame time:
                  ________________________         ________
                 |                        |       |        
strobe signal   _|                        |_______|        
strobe trigger   ^          ^          ^          ^

Therefore I would strongly suggest to set the maximum strobe duration to
be in every case shorter than the "frame time".

For the reasons discussed earlier it the maximum strobe duration should
be the same or longer than the actual exposure time.

What's your take on this Dave? Or Sakari?

thanks & regards;rl

> It triggers at the relevant point on one (random) frame, holds the
> strobe line active for the 1sec, deasserts the strobe line, and then
> waits for the relevant trigger point of the next frame to repeat the
> cycle?
> 
> > So IMHO the real maximum flash duration range the sensor can support is
> > the maximum strobe_frame_span register value.
> >
> > I'm not saying this makes any sense from a use-case perspective, but if
> > we require the driver to support the hardware's maximum values wouldn't
> > that be the correct approach?
> 
> I don't believe there are any defined *requirements* for how a driver
> should behave with regard to flash timings beyond that in the control
> docs [1], and that doesn't list any constraints.
> If this sensor does behave all the way up to the maximum
> strobe_frame_span register value, then I probably would go for that.
> Other than having to convert into usecs on mode change based on pixel
> rate, it at least saves recomputing it as any other controls change.
> 
> Sakari - what's your view?
> 
>   Dave
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html
> 
> > Or am I misunderstanding something?
> >
> > regards;rl
> >
> > >
> > > > Sorry If misunderstood your feedback somehow.
> > > >
> > > > >
> > > > > There is reference in the docs to a different behaviour if "the
> > > > > vertical blanking period is long", but with a bit to set to give
> > > > > stable behaviour (0x3017 bit 1).
> > > >
> > > > I've read that paragraph in the datasheet, yes. But as this was not
> > > > affecting my use-case I haven't included this in this series or my
> > > > downstream kernel. Do you think it's worth adding support for this? Do
> > > > you know of any reports complaining about this power saving feature?
> > >
> > > It only matters if you allow flash duration to be significantly
> > > greater than the exposure time, which I was effectively proposing.
> > >
> > >   Dave
> > >
> >
> > [... snip ...]
