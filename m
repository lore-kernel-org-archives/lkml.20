Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1A1412BF8;
	Wed,  7 Oct 2026 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359775; cv=none; b=BgDSCuaQJJMa9D2KXm93e5rvDVrBgnxZA9V1PITB4W22QxMrQxTeOPMBUdQijcas0zuJfsDd/Yqqxy758maTW6Xn8ngdKPBrtYK3T8ohJ/9mLiiXy/uazM+l4hnyDthBGfRfh0b4hiqLtYX7k4RuhZhyLQb27Ya5iAAaM3DifoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359775; c=relaxed/simple;
	bh=qts3BUcoBrp3X9Ode5zNMugIZQ1udfiXbxcuc3sx6Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va3OAfvjOKHMo+eVsE1eGrd3b+rw2wVAkh7XQjFQa7t98PBhs9c1JmEkAl+j09ZWVe8aUu6ztt38Jt8o5U8fZl/eQog7X4lhYbowY56vuZ7vJnl6Mnzd1avrcxOwCbLdhXO7xB3Lenam9vZ/PPXd+sbXbvAMsItq0kPufjtyfUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwtVYmyC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwtVYmyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791359750; x=1822895750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qts3BUcoBrp3X9Ode5zNMugIZQ1udfiXbxcuc3sx6Tk=;
  b=jwtVYmyCR5P/hTqmajnqGCzLzkSzU8A/0RciQ2jh80n6L5kduds131Lb
   kRjGCa9omeplJfCmI3WF1QHC1Uv0Wnwro/BMWJ1Rty2pds5Z6AZcYO2Fo
   hWt9A906RjkDOeakCVD/D3HuZBcSr+0ey0AWAb/U9qnBXImn4Ujgm+bgP
   atm2YvZhyHB4h//YZSt22wVEnY2E30jVkiiOTUre4KeOjGEGRDHOuuUYx
   33NHl4+zqLigPNyzwdU98UrNJc3aD0bRBA/0MbUkvKp4Jf+EBX5D1oFxz
   jNgwYv3k3BKcz3fHTvGRkbs2FB2oiv8uHZ4OCM4j2o+J+hK6MZigEkQeG
   Q==;
X-CSE-ConnectionGUID: gTYN44/wQz250XsrSJBTIg==
X-CSE-MsgGUID: 30dISdjPSdC++XQqzkBE8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="120895"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="120895"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 00:43:00 -0700
X-CSE-ConnectionGUID: WQMyGmzqSvmVvI/tVYbFOw==
X-CSE-MsgGUID: uWPMn2AAQYm3E0RhyQd3Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="277500411"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.216])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 00:42:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6AB6C121B96;
	Wed, 07 Oct 2026 10:42:57 +0300 (EEST)
Date: Wed, 7 Oct 2026 10:42:57 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martina Krasteva <martinax.krasteva@intel.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Gyula Kelemen <gyula.kelemen@advasolutions.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] media: i2c: ov9282: fix flash duration control
 range
Message-ID: <asX4ASoL7nzBkljI@kekkonen.localdomain>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev>
 <CAPY8ntAk1z-BuftZufd-qPwP9fDf9NQ0nwJn8XMV6pGKLfrFKA@mail.gmail.com>
 <arpyD2CjxOqwQvx8@bombadil>
 <CAPY8ntAMUwemmB+LLOS=WGozvBSyXoYrpWDdyGeyjHQ6Y6sh0Q@mail.gmail.com>
 <arrVt-0ctw1cXkkW@bombadil>
 <CAPY8ntC1SEr3seqcAWchZ8A9nSqWp-FZow7v=o-oL8CcQgMaNQ@mail.gmail.com>
 <asO1sIZC8rOyhSnu@bombadil>
 <CAPY8ntC5oO2hdzbKsFpu+SqMetUKLM8HRP_fVc7VBreZYXAz_w@mail.gmail.com>
 <asS0anZZXpbR96oE@bombadil>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asS0anZZXpbR96oE@bombadil>

Hi Richard, Dave,

On Tue, Oct 06, 2026 at 10:57:04AM +0200, Richard Leitner wrote:
> On Mon, Oct 05, 2026 at 05:05:54PM +0100, Dave Stevenson wrote:
> > Hi Richard
> > 
> > On Mon, 5 Oct 2026 at 15:46, Richard Leitner <richard.leitner@linux.dev> wrote:
> > >
> > > On Tue, Sep 29, 2026 at 03:06:51PM +0100, Dave Stevenson wrote:
> > > > On Mon, 28 Sept 2026 at 22:08, Richard Leitner
> > > > <richard.leitner@linux.dev> wrote:
> > > > >
> > > > > On Mon, Sep 28, 2026 at 03:40:21PM +0100, Dave Stevenson wrote:
> > > > > > On Mon, 28 Sept 2026 at 15:23, Richard Leitner
> > > > > > <richard.leitner@linux.dev> wrote:
> > > > > > >
> > > > > > > Hi Dave,
> > > > > > >
> > > > > > > thanks for your feedback! Greatly appreciated!
> > > > > > >
> > > > > > > On Mon, Sep 28, 2026 at 02:47:36PM +0100, Dave Stevenson wrote:
> > > > > > > > Hi Richard
> > > > > > > >
> > > > > > > > On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> > > > > > > > <richard.leitner@linux.dev> wrote:
> > > > > > > > >
> > > > > > > > > When updating the flash_duration range ensure the ceiling is at least as
> > > > > > > > > long as the exposure time is. This may cause the calculated
> > > > > > > > > flash_duration register value to be rounded up.
> > > > > > > > >
> > > > > > > > > This is done by introducing a new
> > > > > > > > > ov9282_update_ctrl_range_flash_duration() function and using them
> > > > > > > > > wherever possible.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > > > > > ---
> > > > > > > > >  drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++-------------------
> > > > > > > > >  1 file changed, 28 insertions(+), 19 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > > > > > > index f728709fcf0a6..be38ecfad8c82 100644
> > > > > > > > > --- a/drivers/media/i2c/ov9282.c
> > > > > > > > > +++ b/drivers/media/i2c/ov9282.c
> > > > > > > > > @@ -541,6 +541,29 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> > > > > > > > >                                 NSEC_PER_USEC);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +/**
> > > > > > > > > + * ov9282_update_ctrl_range_flash_duration() - Update flash_duration control range
> > > > > > > > > + * @ov9282: pointer to ov9282 device
> > > > > > > > > + *
> > > > > > > > > + * This may round up the ceiling to the microseconds representation of the
> > > > > > > > > + * next flash_duration register value to make sure one can illuminate the whole
> > > > > > > > > + * exposure time long.
> > > > > > > > > + *
> > > > > > > > > + * Return: 0 if successful, error code otherwise.
> > > > > > > > > + */
> > > > > > > > > +static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
> > > > > > > > > +{
> > > > > > > > > +       u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > > > > > > > > +       u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
> > > > > > > > > +       u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> > > > > > > > > +
> > > > > > > > > +       if (fd_max_us < exposure_us)
> > > > > > > > > +               fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
> > > > > > > >
> > > > > > > > Reading the driver for how it handles flash duration, it all gets a
> > > > > > > > bit convoluted. I see part of it comes from the units being usecs
> > > > > > > > whilst natively it is in lines, but we've got this slightly odd calc
> > > > > > > > and adding 1, and rounding in try_ctrl to get closest to the absolute
> > > > > > > > value.
> > > > > > >
> > > > > > > That's true. I'm also not happy with this back-and-forth conversion between
> > > > > > > u/n-secs and lines. From a V4l2 API user perspective I'd love to have
> > > > > > > all "timing related" controls in the same unit (likely usecs). I was
> > > > > > > already playing around with that approach, but as this would break the
> > > > > > > current exporsure property I have not sent those patches...
> > > > > > >
> > > > > > > If you have any "mainline-acceptable" idea on how to do that I would
> > > > > > > definitely love to hear it ;-)
> > > > > >
> > > > > > Sadly I think that there is a need for some of the back and forth in
> > > > > > conversions :-(
> > > > > >
> > > > > > > > Seeing as this is the max flash_duration, is it actually limited by
> > > > > > > > the exposure, or by the frame duration? The difference between those
> > > > > > > > is a minimum of 25 lines (OV9282_EXPOSURE_OFFSET), which I think gives
> > > > > > > > you up to another 9usecs to play with. That covers any of this
> > > > > > > > rounding stuff. You can afford to always round that one down and never
> > > > > > > > clip the range below the exposure time.
> > > > > > >
> > > > > > > From a hardware perspective this isn't limited at all AFAICT. But from a
> > > > > > > "use-case" perspective a flash_duration (with a flash offset=0, which is
> > > > > > > the hard-coded default case in this driver currently) longer than the
> > > > > > > exposure time makes no sense, as it does not have any effect on the image.
> > > > > > >
> > > > > > > With this patch I want to make sure to be able to illuminate the frame
> > > > > > > during the complete exposure time, but keep the maximum as short as
> > > > > > > possible. So I was comparing/aiming this at the exposure time, not the
> > > > > > > frame duration.
> > > > > > >
> > > > > > > As the frame duration is OV9282_EXPOSURE_OFFSET longer than the exposure
> > > > > > > time: Would a "turned-on flash" during those 25 lines have any impact on
> > > > > > > the frames brightness in your opinion?
> > > > > > > I haven't explicitely tested/measured this with hardware, but I guess
> > > > > > > this does not have any impact?
> > > > > >
> > > > > > No, as this is a global shutter sensor I wouldn't expect the flash to
> > > > > > impact the image if a connected flash was on for more lines than the
> > > > > > exposure.
> > > > > >
> > > > > > > Or do you mean when calculating against the frame duration the +/-1
> > > > > > > stuff can be dropped and the code would be easier to read?
> > > > > >
> > > > > > Yes, I'm suggesting the driver handles the range of values that the
> > > > > > hardware can support correctly. Whether that helps for your image
> > > > > > quality requirements is a different question.
> > > > > > The driver can pass the buck with at least some of the rounding issues
> > > > > > to userspace, which potentially has use-case specific knowledge. And
> > > > > > it simplifies the driver in the process.
> > > > >
> > > > > Talking about "range of values that the hardware can support": AFAICT
> > > > > the strobe duration is (from a sensor hardware point of view) not
> > > > > limited by the frame duration. At least I found nothing on this in the
> > > > > datasheet and a quick test on hardware also showed no correlation.
> > > >
> > > > Interesting. So if you set it to a 1 second strobe pulse when
> > > > streaming at 60fps, what behaviour do you get?
> > >
> > > I haven't tested the 1 second strobe explicitely. But the strobe in my
> > > case is always on for the configured time. No matter if it exceeds the
> > > frame time/trigger. After the configured strobe_duration passed it goes
> > > low until the next trigger happens.
> > >
> > > Maybe the following visualization helps:
> > >
> > >
> > > strobe duration < frame time:
> > >                   __         __         __         __
> > >                  |  |       |  |       |  |       |  |
> > > strobe signal   _|  |_______|  |_______|  |_______|  |_____
> > > strobe trigger   ^          ^          ^          ^
> > >
> > >
> > > frame time < strobe duration < 2x frame time:
> > >                   _____________         _____________
> > >                  |             |       |             |
> > > strobe signal   _|             |_______|             |_____
> > > strobe trigger   ^          ^          ^          ^
> > >
> > >
> > > 2x frame time < strobe duration < 3x frame time:
> > >                   ________________________         ________
> > >                  |                        |       |
> > > strobe signal   _|                        |_______|
> > > strobe trigger   ^          ^          ^          ^
> > >
> > > Therefore I would strongly suggest to set the maximum strobe duration to
> > > be in every case shorter than the "frame time".
> > >
> > > For the reasons discussed earlier it the maximum strobe duration should
> > > be the same or longer than the actual exposure time.
> > >
> > > What's your take on this Dave? Or Sakari?
> > 
> > Seeing as the behaviour is logical, personally I'd go with allowing
> > whatever strobe period (up to the register max), and leave it up to
> > userspace to keep the period below the exposure time if that is what
> > is desired for the use case.
> 
> Fair approach. But if we do so it will become a pain in the ass to
> calculate between the expsoure time (which is based on the line time)
> and the strobe duration (which is currently microseconds) IMHO.. As we
> don't have a "reasonable upper limit" easily available...
> 
> The problem I'm talking about is that it would be quite "easy" then to
> mess up the units and configure a strobe duration longer than the frame
> time, which then show up as "strangely illuminated frames" in the stream.
> 
> Do you see any chance to get the exposure time and strobe duration on
> the same unit? Or is this basically impossible as we would "break"
> userpace with this? If so, would a new "strobe_duration in line time" be
> a possible approach?

I'd really like to see such conversion to take place in userspace. The
flash driver doesn't have a concept of a line either.

A single implementation in libcamera sounds much better than a driver
implementation, or multiple driver implementations. Also, doing this in
floating point could be more practical as well.

-- 
Regards,

Sakari Ailus
