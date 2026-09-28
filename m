Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B41463B87
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583361; cv=none; b=gTEtEp/ot0QiRXavG5i5GF3MQiURYS4hWzhR3oPuvQfa3RZ8C7xrKFsrPefDzhDZWftSM7a68k5JqBkEqLJIkr4a041aaojpHNIYoJRHd6rIuo6I74BNgpXFajMWQvsCF8KENifGKtKceyAFX87BeJ/72NyuO40wu9HWRHKwlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583361; c=relaxed/simple;
	bh=1+1pzpa0q6S/v+kHZbTelj4mj9dMK2c/dk7EmtAq5Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNv/vJsLAjLnb2RnEX1Q6nmLsa2+wSEZsO7mWu7clVYqARs27u9mBg79DkXjlXayOrb+ntULOU1xmk89yVEpWDPMw2UIt0TiUzHGsPGt3eyCU3nTPeRNOA/uZBZzxQ/WolFTnlMXDqPmOkeWAS6OG5kEXh65iIsRIQAuxYR5lUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FRv7Te/u; arc=none smtp.client-ip=91.218.175.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FRv7Te/u"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1+1pzpa0q6S/v+kHZbTelj4mj9dMK2c/dk7EmtAq5Ps=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790583357; v=1; x=1791188157;
 b=FRv7Te/u7WeJJHwXvpy/9qbq0pMfH7gUvlj+F0p8xpp9hTj2dOu6ArS27NgsP/XZ0svZGfCI
 sNQMdxOMcqZhV6YWcrZyN7tbhtozVODyTDwBjFuG7pOugOTyNtjCmo63LrmH9kvjqOzk4pHdKM6
 NFy484NbOLhk9zSDZ2kGHUN0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c054dc8d3abe4858;
	Mon, 28 Sep 2026 08:15:55 +0000
X-Mizu-Trace-ID: c054dc8d3abe4858
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 10:15:49 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] media: i2c: ov9282: refresh flash_duration range
 on an HBLANK write
Message-ID: <arog6lbEoA5qjqNG@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-6-f520af59df1b@linux.dev>
 <CAPY8ntCaRiA8MjVUU1V1KxGYRhA-oZsefM9rw0i5Us1ybVHWDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCaRiA8MjVUU1V1KxGYRhA-oZsefM9rw0i5Us1ybVHWDQ@mail.gmail.com>

Hi Dave,

thanks for your feedback!

On Wed, Sep 23, 2026 at 04:09:25PM +0100, Dave Stevenson wrote:
> Hi Richard
> 
> On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> <richard.leitner@linux.dev> wrote:
> >
> > The strobe ceiling is the exposure time in microseconds, so it follows
> > the line time, and the line length sets the line time. Writing HBLANK moves
> > it and nothing recomputes the flash_duration ceiling.
> >
> > Therefore add the missing flash_duration range update when HBLANK is set.
> >
> > The exposure range is counted in lines, so it is unaffected and does not
> > need refreshing here.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index e64d8343c18e9..632184e76b9bd 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -674,6 +674,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >                 if (ret)
> >                         return ret;
> >                 break;
> > +       case V4L2_CID_HBLANK:
> > +               /*
> > +                * HBLANK affects the line time, which then affects the flash
> > +                * duration. Therefore recalculate the flash duration range
> > +                * here.
> > +                */
> 
> Except for the comment, this clause is identical to that for
> V4L2_CID_EXPOSURE that you added in patch 4. No need for the
> duplication.

That's true. I will merge the two switch arms to get rid of the
duplicated code. Thanks!

regards;rl

> 
>   Dave
> 
> > +               exposure = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> > +               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> > +                                              exposure, 1,
> > +                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > +               if (ret)
> > +                       return ret;
> > +               break;
> >         }
> >
> >         /* Set controls only if sensor is in power on state */
> >
> > --
> > 2.53.0
> >
> >
