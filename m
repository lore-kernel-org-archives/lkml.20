Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409343CEDD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501415; cv=none; b=sngFMTytaz/j7Tlp7iCnIbidjELLTVTUWaY4a/zCKoXA3JPQmvbJBHatET6I7AE0zol/VcgK0+PX5oqa+Rg/M6urbUqDhzp0BLN3OTB/aJ1encFb7PlmKbKjvjfL/GOGWJHjaOwnyXw326tOzBYFrCdG/xzm0Lhq6EwsuapPnWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501415; c=relaxed/simple;
	bh=kqtv/2VwyzcGajyJF4+6+waY4Kr0pfKWR/tdU0S+w7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYcH44EsLlMay7TdkLC+I2HE84M8AN2sy/rcmAv1pk5OnkGMknex4SQVF3gXowxiRKuQWVwzBNbfT+9uIJ4M9dYEZ0W9ZB/WyuEUgWNsoHu7d3YiVyvYY5E706Ny4KXNMHePNJlm6R38TbmzLNEjEQj/o5aUdnX0XH1sz3uGnoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HMeAoDdh; arc=none smtp.client-ip=91.218.175.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HMeAoDdh"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kqtv/2VwyzcGajyJF4+6+waY4Kr0pfKWR/tdU0S+w7o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789501410; v=1; x=1790106210;
 b=HMeAoDdh7OKRIW8IL6MV3DsAi9DZuQpfHITqkcnrVTJmmMie+Jxn7ye3jSmE7ucQOZPFHV8U
 fpdYjtQBB2/kBUpfG7fjk4JFeCqe4auAeexWuvy/bpChE/dXtpf4Q0n94NCHQjZqBJVzlLUFidH
 9wfeG+ZBwAMJb7x/pMaKauVg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 18a50799a8a562de;
	Tue, 15 Sep 2026 19:43:30 +0000
X-Mizu-Trace-ID: 18a50799a8a562de
X-Migadu-Flow: FLOW_OUT
Date: Tue, 15 Sep 2026 21:43:24 +0200
From: Richard Leitner <richard.leitner@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] media: i2c: ov9282: clamp flash_duration default
 to its maximum
Message-ID: <aqmfvIyVMxLdAaQw@bombadil>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
 <20260914-ov9282-fixes-v1-10-f520af59df1b@linux.dev>
 <CAPY8ntDWF53Zv1yspiYH29TWEUODW1PPU4dcBig-ssa-e15jPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntDWF53Zv1yspiYH29TWEUODW1PPU4dcBig-ssa-e15jPw@mail.gmail.com>

Hi Dave,

thanks for your feedback!

On Tue, Sep 15, 2026 at 04:09:13PM +0100, Dave Stevenson wrote:
> "media: i2c: ov9282: clamp flash_duration default to its maximum"
> took me a moment to parse as to be the control maximum, not the default maximum.
> "clamp flash_duration default to valid range"?

Sure. That makes sense. I will adapt the patch title accordingly in v2.

regards;rl

> 
> On Mon, 14 Sept 2026 at 20:21, Richard Leitner
> <richard.leitner@linux.dev> wrote:
> >
> > Currently the OV9282_STROBE_FRAME_SPAN_DEFAULT is always passed as default
> > to the flash_duration v4l2 control, where the maximum is dynamically
> > changed. This may lead to situations where the default is above the
> > maximum.
> >
> > Fix this by setting the maximum value as default when
> > OV9282_STROBE_FRAME_SPAN_DEFAULT is above the maximum value.
> >
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> 
> With or without that changed:
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> > ---
> >  drivers/media/i2c/ov9282.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index be38ecfad8c82..1c5bed85781ce 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/math.h>
> >  #include <linux/math64.h>
> > +#include <linux/minmax.h>
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> > @@ -556,12 +557,15 @@ static int ov9282_update_ctrl_range_flash_duration(struct ov9282 *ov9282)
> >         u32 exposure_us = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> >         u32 fd_max = ov9282_us_to_flash_duration(ov9282, exposure_us);
> >         u32 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max);
> > +       u32 fd_default;
> >
> >         if (fd_max_us < exposure_us)
> >                 fd_max_us = ov9282_flash_duration_to_us(ov9282, fd_max + 1);
> >
> > +       fd_default = min_t(u32, OV9282_STROBE_FRAME_SPAN_DEFAULT, fd_max_us);
> > +
> >         return __v4l2_ctrl_modify_range(ov9282->flash_duration, 0, fd_max_us,
> > -                                       1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
> > +                                       1, fd_default);
> >  }
> >
> >  /**
> >
> > --
> > 2.53.0
> >
> >
