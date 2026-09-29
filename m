Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B7352E054
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690832; cv=pass; b=enOTq3vf+hGPXe7TKSXtuYzqpbVnBzIlkzYsqoUZPD/ZbffzchGnA297jKRQSmHtRdbI3kpGyiyOrsMVwpKYzsp1vUeKGVP7pAF15Vj9nErdkYxmyorbnJiCqm9abz45RlOGwi3tV/rgB8v5HLdMp/PGCZlmT/jN5pf7KyrvmTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690832; c=relaxed/simple;
	bh=/saj/+V8MHAkl39Mum9liJsxtMUx2G639TaMKrFW7k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdhwmpL3p1JmsExDFMgnnxxTIDHhkiEvgPT3rZ+18fCxFKmOymsW16Z23AqU5mTReaHnkfUgCl7AGKgzvgnYrEMMBt+7d4GFIDSQW5EpjepPRneiwv0PBTI92TcY1ikshEEF2YMyzRrqdmijPijw1W08Sfsi9/BUU/6mSwszKMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gQSOUuXN; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gQSOUuXN"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a9b9so2756325fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790690828; cv=none;
        d=google.com; s=arc-20260327;
        b=FyxM/7grfRa9vClLPF6VCzMnZy2C89+59ENIG1JzAU4qriM7zLhZehhmV16vjPEBfo
         flh/CS6OjjEHaXAPfPyAzxxCJge+DgqxlK0MbuWGu0t+wt5u0sNqRDda7z3sJErES25Z
         J/1AKRWnRyr0ymmBV7r6aq+jzEHQPkZCaKnM6bK6wicvJXHu+GYuw/CzY4mbdZv8qq1C
         hGrA7gcY1oaSEeFSTaK/JD6T5QZbF7Z6BrjbGzmJ62h8l/RKhMG0o2Pnr7JCtOYp+uem
         G2DRElwXN457IYtAOxrcYoxjbPoGaeUceu1+rKTBQs12G2ITFuTcf2/umuTCJhSbCz6J
         ij3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dTLyCqQ7WwfTK5C8c/TV/luJZ1l7pOnefZ2LabbNeYQ=;
        fh=LCskssAWgQykDEpGoj04VuwisM8QSRR0ut5pmuIjhbg=;
        b=fdHW5yOxhogiPIMhMiUK1cfGjNx2KCoFSV95Urnwm0kc2jZIQZchONu0K4TN7rG1Zy
         jVlfuKMbKw5XN0tgDqtYc0/zX/HsofJWWVK1jU42W6Oza+y4P3fB9GNM6zmQY76JbYBv
         CUYgOBg8u75Mkr6pBKTcQgh+6QTYWMz9cQ7Z1GDAhIIQI3VLxZJtazJ8TM9jL5rzspiH
         x6TwFfZP458q9XmNQmzjmoP8ZgIVt1Rv0Fj+SNSI90KTdyLYkKeSV7fEHe/9UkN/HzJJ
         K36osOFNq2jegeI3XrgC0ynXrydedoPGfKiW/YdC8JMHuWiBhLEcKTwO5atKmgOC7W/p
         iLpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790690828; x=1791295628; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTLyCqQ7WwfTK5C8c/TV/luJZ1l7pOnefZ2LabbNeYQ=;
        b=gQSOUuXNh2zlw8vzI8eJKVCfcuDaVAqZchv0avu7VqDWT2Nvm95ppwUC0k2KB3AXxj
         d7fkq9GESDHVJOXeeeMS0DGWZ2dv5MEiC8SI4HPipc5f5glPljch0tg8xK/u3PS+BOnG
         imcijVuLUcC7qfN50B1xdggxWYO7jtNAHgpQHr+PDHnCPFd6PMeKfoSc0/hVdJPurIdE
         IQ7GnM2RATHBcFYNNREe2Aeutbzjotrr3ZtQm3ZqfJCHzWJO8NuiDtG3g19lKL2JXIab
         /u7o4mV6+mX0GSWrv8MpCZM99Df06zGpS0touglyOF5tyOf0RHtHGysL3QnhxiaWBLx5
         xs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690828; x=1791295628;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dTLyCqQ7WwfTK5C8c/TV/luJZ1l7pOnefZ2LabbNeYQ=;
        b=ps4q4wCtqW3MEdkPchYAvqB+Z7uiyZdRjMu1itVgWZeJAfzit2RBa7LTFopbYGnISE
         zbvfRMryXBrDk9/8MyQvFwLZItAFK2Sp9deqimxzkfKDd+qysqIDtPo/Q9+QvNv561fm
         +xiaKtn/TOqYMADjGETrjq0oUXBOoeKYbkr8x8e/NJuJss0vDJf9GjWzzYDtmwBDZgoy
         7e1B32w6GnyeLWz/nmU7etx79gcU0Q6Ibot9Xanpd+wITgQRFQDws58rlYZHP2e12dyr
         SvhHoSpGusevzLJrpnxmKssjvudtFZIAVVs714ZgH4lcHEKqeBjr3lspcq9u06P+dvrm
         9x/A==
X-Forwarded-Encrypted: i=1; AKwUvBzLTRlpl1QZUtbnKdTEqj+maJTWKtxtK/rk7Gelx8Vo8yj1CPB8XGo1xQPGnO0O2AOTKZO/4N5rZVUdjO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH4+xMLtGT2PRILa7aiFC8h7yvm+zApLLkr3OwA1jqQx7KY1jj
	UikBkh9Zl3qNV9CztqJymezJGxXZ5GfRAGmDXqe8nP91pSbiOatG8vJO4M91gG7sqCAPHXOQMjq
	VBAJ9CIbkqAiF9z6dY9ztHTIT+Nj5eM9U1DwoYj76IA==
X-Gm-Gg: AYBFou3/V+akm+nynqo2Nu01vwVSYNeM0Yi7c0tvoVUszygF7sgQIF3rv02pFbidhgX
	rN6hTqhEp6OaiHupUGpk7lqni+oakpYUP+yRnrKPUosbhIMSlTQhdt+erosqBvYK+VeiqH+3RNi
	2O1EOWa8XEkmPnd48S8nUMQU99UIhpkb/9v25Zruto95NzCxjnVr7wqgptGiV44VK+H5lxbfPxO
	h1WncCStnLHJaAeUDfWPqVfVkPsAHMlktoirefReDXWy+1FksnpmyUc5iPOBAXVdHd0/4yRfOWq
	k+JJPltE+Ce15rCGOvzqyi7EHkcueSPBuBZKqKG8kWurt2XhJlRAxS3fwn3SOAsPTeYIIj/PQmq
	mPRi+7GAi3qp0/zCW/+JWDOB4NXb+DwPdR6xApxdmBTAjGpkHOu4GwthC2R0k9nxsio0dIQtz
X-Received: by 2002:a05:6870:5b8c:b0:475:e235:907 with SMTP id
 586e51a60fabf-491e6df2ca6mr14181395fac.37.1790690828150; Tue, 29 Sep 2026
 07:07:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-9-f520af59df1b@linux.dev> <CAPY8ntAk1z-BuftZufd-qPwP9fDf9NQ0nwJn8XMV6pGKLfrFKA@mail.gmail.com>
 <arpyD2CjxOqwQvx8@bombadil> <CAPY8ntAMUwemmB+LLOS=WGozvBSyXoYrpWDdyGeyjHQ6Y6sh0Q@mail.gmail.com>
 <arrVt-0ctw1cXkkW@bombadil>
In-Reply-To: <arrVt-0ctw1cXkkW@bombadil>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 29 Sep 2026 15:06:51 +0100
X-Gm-Features: AclHuK-gui-cmKb2M0DiyVTpVowsm0FxE-fiQgHI28BhjnvZNZKvO0fM-Xkz-xM
Message-ID: <CAPY8ntC1SEr3seqcAWchZ8A9nSqWp-FZow7v=o-oL8CcQgMaNQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] media: i2c: ov9282: fix flash duration control range
To: Richard Leitner <richard.leitner@linux.dev>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 22:08, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> On Mon, Sep 28, 2026 at 03:40:21PM +0100, Dave Stevenson wrote:
> > On Mon, 28 Sept 2026 at 15:23, Richard Leitner
> > <richard.leitner@linux.dev> wrote:
> > >
> > > Hi Dave,
> > >
> > > thanks for your feedback! Greatly appreciated!
> > >
> > > On Mon, Sep 28, 2026 at 02:47:36PM +0100, Dave Stevenson wrote:
> > > > Hi Richard
> > > >
> > > > On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> > > > <richard.leitner@linux.dev> wrote:
> > > > >
> > > > > When updating the flash_duration range ensure the ceiling is at least as
> > > > > long as the exposure time is. This may cause the calculated
> > > > > flash_duration register value to be rounded up.
> > > > >
> > > > > This is done by introducing a new
> > > > > ov9282_update_ctrl_range_flash_duration() function and using them
> > > > > wherever possible.
> > > > >
> > > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > > ---
> > > > >  drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++-------------------
> > > > >  1 file changed, 28 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > > index f728709fcf0a6..be38ecfad8c82 100644
> > > > > --- a/drivers/media/i2c/ov9282.c
> > > > > +++ b/drivers/media/i2c/ov9282.c
> > > > > @@ -541,6 +541,29 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
> > > > >                                 NSEC_PER_USEC);
> > > > >  }
> > > > >
> > > > > +/**
> > > > > + * ov9282_update_ctrl_range_flash_duration() - Update flash_duration control range
> > > > > + * @ov9282: pointer to ov9282 device
> > > > > + *
> > > > > + * This may round up the ceiling to the microseconds representation of the
> > > > > + * next flash_duration register value to make sure one can illuminate the whole
> > > > > + * exposure time long.
> > > > > + *
> > > > > + * Return: 0 if successful, error code otherwise.
> > > > > + */
> > > > > +static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
> > > > > +{
> > > > > +       u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > > > > +       u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
> > > > > +       u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> > > > > +
> > > > > +       if (fd_max_us < exposure_us)
> > > > > +               fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
> > > >
> > > > Reading the driver for how it handles flash duration, it all gets a
> > > > bit convoluted. I see part of it comes from the units being usecs
> > > > whilst natively it is in lines, but we've got this slightly odd calc
> > > > and adding 1, and rounding in try_ctrl to get closest to the absolute
> > > > value.
> > >
> > > That's true. I'm also not happy with this back-and-forth conversion between
> > > u/n-secs and lines. From a V4l2 API user perspective I'd love to have
> > > all "timing related" controls in the same unit (likely usecs). I was
> > > already playing around with that approach, but as this would break the
> > > current exporsure property I have not sent those patches...
> > >
> > > If you have any "mainline-acceptable" idea on how to do that I would
> > > definitely love to hear it ;-)
> >
> > Sadly I think that there is a need for some of the back and forth in
> > conversions :-(
> >
> > > > Seeing as this is the max flash_duration, is it actually limited by
> > > > the exposure, or by the frame duration? The difference between those
> > > > is a minimum of 25 lines (OV9282_EXPOSURE_OFFSET), which I think gives
> > > > you up to another 9usecs to play with. That covers any of this
> > > > rounding stuff. You can afford to always round that one down and never
> > > > clip the range below the exposure time.
> > >
> > > From a hardware perspective this isn't limited at all AFAICT. But from a
> > > "use-case" perspective a flash_duration (with a flash offset=0, which is
> > > the hard-coded default case in this driver currently) longer than the
> > > exposure time makes no sense, as it does not have any effect on the image.
> > >
> > > With this patch I want to make sure to be able to illuminate the frame
> > > during the complete exposure time, but keep the maximum as short as
> > > possible. So I was comparing/aiming this at the exposure time, not the
> > > frame duration.
> > >
> > > As the frame duration is OV9282_EXPOSURE_OFFSET longer than the exposure
> > > time: Would a "turned-on flash" during those 25 lines have any impact on
> > > the frames brightness in your opinion?
> > > I haven't explicitely tested/measured this with hardware, but I guess
> > > this does not have any impact?
> >
> > No, as this is a global shutter sensor I wouldn't expect the flash to
> > impact the image if a connected flash was on for more lines than the
> > exposure.
> >
> > > Or do you mean when calculating against the frame duration the +/-1
> > > stuff can be dropped and the code would be easier to read?
> >
> > Yes, I'm suggesting the driver handles the range of values that the
> > hardware can support correctly. Whether that helps for your image
> > quality requirements is a different question.
> > The driver can pass the buck with at least some of the rounding issues
> > to userspace, which potentially has use-case specific knowledge. And
> > it simplifies the driver in the process.
>
> Talking about "range of values that the hardware can support": AFAICT
> the strobe duration is (from a sensor hardware point of view) not
> limited by the frame duration. At least I found nothing on this in the
> datasheet and a quick test on hardware also showed no correlation.

Interesting. So if you set it to a 1 second strobe pulse when
streaming at 60fps, what behaviour do you get?
It triggers at the relevant point on one (random) frame, holds the
strobe line active for the 1sec, deasserts the strobe line, and then
waits for the relevant trigger point of the next frame to repeat the
cycle?

> So IMHO the real maximum flash duration range the sensor can support is
> the maximum strobe_frame_span register value.
>
> I'm not saying this makes any sense from a use-case perspective, but if
> we require the driver to support the hardware's maximum values wouldn't
> that be the correct approach?

I don't believe there are any defined *requirements* for how a driver
should behave with regard to flash timings beyond that in the control
docs [1], and that doesn't list any constraints.
If this sensor does behave all the way up to the maximum
strobe_frame_span register value, then I probably would go for that.
Other than having to convert into usecs on mode change based on pixel
rate, it at least saves recomputing it as any other controls change.

Sakari - what's your view?

  Dave

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-flash.html

> Or am I misunderstanding something?
>
> regards;rl
>
> >
> > > Sorry If misunderstood your feedback somehow.
> > >
> > > >
> > > > There is reference in the docs to a different behaviour if "the
> > > > vertical blanking period is long", but with a bit to set to give
> > > > stable behaviour (0x3017 bit 1).
> > >
> > > I've read that paragraph in the datasheet, yes. But as this was not
> > > affecting my use-case I haven't included this in this series or my
> > > downstream kernel. Do you think it's worth adding support for this? Do
> > > you know of any reports complaining about this power saving feature?
> >
> > It only matters if you allow flash duration to be significantly
> > greater than the exposure time, which I was effectively proposing.
> >
> >   Dave
> >
>
> [... snip ...]
