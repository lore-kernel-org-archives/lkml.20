Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585574;
	b=xVU6KlDFxfCAJWLvTN26CPYIWusktIUxmvV4rqHS+dO7ijlFe+hLzh3BklpgORpZAsW3
	 svHNKugxhAAntTYW1DIRiW/H1MEbvUJF+Q9o9q/g8Zna/jPPHSQO1MSWQ047OOZ6Q0dFQ
	 mqAJxM9gpNQiQpAnXfWVdHsMNV7M+TwlmTKC43a6dCAApufI8L+kiKRYVSYIFSJLlEvDH
	 q1IOIHUH8w39cCP+AjWTFfUMaYhn/NRmpNMml3Z5VqNqCBZsrjg91A+LX8Lq6fbPBnRVT
	 qpAGFer3DfSYpJxAVfa+PCzV34DSxRLyaoGExZlsXbJqA4DDdjrXCpvfZw/kWMoakgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585574;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=QtJHtGxiuuSplMT1l/sJwhZELXk+QFrGXQ7/NQ9Eg1U=;
	b=kZZNM15Vy/wt5DXDfT9A4Mn4VGtbmFl+WKfJk7Nf0RSFNDFUlXZu3x7RC5yurevKfgxb
	 z4+eq2C3Bh20d7fP9pjzTc61JNhhZeCfKrSSlQbaH37FBrJR5u91im4gvdfo9OYMtEQpU
	 b/SRfpQPdqDEDo3v1YbV4ItRmjBkm34CckaADSXaMMj5qXh+Pp2qIXUuUs2feSdgNXQoM
	 2bXJl3d6sGIdrXkMl1V4kMj+wVCB4+iq+tH7OV9/giamqWHq6nsa9P78TCUdcEravu3QV
	 frrsgGhjjljKYwGzQVqiXcxXGcku6EGUIXKBX1Rg13EO3ImuTuCs2rUy0rw/OSTiGFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YEa9g4ey;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6304F606A31A;
	Wed, 21 Oct 2026 12:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6304F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YEa9g4ey
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D451E9A4;
	Wed, 21 Oct 2026 14:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792585443;
	bh=K8FmbkbS46sNxyeC4kNTb2kAx+1z7zpuf/3raYlLZQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEa9g4ey3hYS2N0fi9A8UzcAuaVQt2h++jIczHGb63QyZGAi2KFzOLmFibVCYsKrM
	 60Ia+6ODk6o331ZyWiZLJ2IRnnKcCj/T5sxM8Z/K6NCzXhE5WNj9kYmk4gKYkAKBjb
	 INZoQnABnMMgnunWcQ8R/QpWvrofa4jXIqE/oP9Y=
Date: Wed, 21 Oct 2026 14:26:08 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	"jai.luthra" <jai.luthra@ideasonboard.com>, Philippe Baetens <philippebaetens@gmail.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <atiuUGeAL45qkLEX@zed>
References: <20261015-mira016-v7-0-828c931c5550@ideasonboard.com>
 <20261015-mira016-v7-2-828c931c5550@ideasonboard.com>
 <PN3P287MB182974880896B859770FEDDA8B9B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PN3P287MB182974880896B859770FEDDA8B9B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang

On Fri, Oct 16, 2026 at 10:29:51AM +0000, Tarang Raval wrote:
> Hi Jacopo,
>
> Sorry, I overlooked one point in my previous review.
>
> > Add driver for the ams OSRAM Mira016 sensor.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   12 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/mira016.c | 2358 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 2372 insertions(+)
>
> ...
>
> > +       struct {
> > +               u8 n;
> > +               u8 m;
> > +               u8 cp_div;
> > +               u8 otp_gran;
> > +               u8 gran_tg;
> > +               u8 lut_del;
> > +               u32 esc_h;
> > +               u32 esc_l;
> > +               u32 esc_period;
> > +               u32 byte_period;
>
> nit: pll.esc_period and pll.byte_period are never used, so you
> can drop them.

They are anyway calculated based on the PLL configuration and will be
required to support multiple link frequencies.

I wouldn't remove them if nobody really insist.

>
> > +               u32 data_rate_mbps;
> > +       } pll;
> > +
>
> ...
>
> > +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct mira016 *mira016 =
> > +               container_of(ctrl->handler, struct mira016, ctrl_handler);
> > +       struct v4l2_subdev_state *state;
> > +       struct v4l2_rect *crop;
> > +       int ret = 0;
> > +
> > +       state = v4l2_subdev_get_locked_active_state(&mira016->sd);
> > +       crop = v4l2_subdev_state_get_crop(state, 0);
> > +
> > +       if (ctrl->id == V4L2_CID_VBLANK) {
> > +               s32 exposure_max = crop->height + ctrl->val
> > +                                - MIRA016_FRAME_INTEGRATION_DIFF;
> > +               s32 exposure_def = min(exposure_max,
> > +                                      mira016->exposure->val);
> > +
> > +               ret = __v4l2_ctrl_modify_range(mira016->exposure,
> > +                                              mira016->exposure->minimum,
>
> exposure->minimum isn't updated when a format change alters row_length.

I don't think the min exposure time changes with row_length

It's actually computed as

	mira016->timings.min_exposure_time = (151 + mira016->pll.lut_del)
					   * mira016->pll.gran_tg
					   * mira016->timings.seq_time_base
					   / HZ_PER_KHZ;

And all the parameters used in the computation depend solely on the
output data rate which can't change at run time

	gran_tg = DIV_ROUND_DOWN_ULL(data_rate_mbps * KHZ_PER_MHZ, 1500);
	mira016->pll.gran_tg = DIV_ROUND_UP_ULL(gran_tg * 50, KHZ_PER_MHZ);

	mira016->pll.lut_del = DIV_ROUND_UP_ULL(7000, mira016->pll.gran_tg) - 140;

	mira016->timings.seq_time_base = 8 * HZ_PER_MHZ
				       / mira016->pll.data_rate_mbps;

>
> Other than this, the driver looks good to me.
>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>

Thank you!

>
> Best regards,
> Tarang
