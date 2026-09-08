Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A3347BD9;
	Tue,  8 Sep 2026 10:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863766; cv=none; b=rZ1YJGyVBSimBa5IxvYnm7kfRUKgZn5+ApbSb0yGVcwmm+Rcot+S8vLQJs4oMwm83F+IXqd0a3QV0/Jwd7Z9eZkpwFa1pEFoC/vdMdZ1TIeE9X+UOHv1rYNTqPjoyraSwhndjzcEtRBTvnKCFVTyDQhONrhlcc25ejFAeb5ZICw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863766; c=relaxed/simple;
	bh=gIqJ+r0/JTqKMlIxO4T7rjLwha3sIS4wwumLA9Fjz0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4FYfS7QjrWfkKKp7cDaaeJ0Fqc1HKsWVKBnvLZ6SC+pBAjYMksinCsfyPR94u3X0r8YMWDvAw0p1Op/Mk/BG5yEmU5H+BPRsrIRhDQU5jm8iRzKkqCjjrt7wF6/4xStdwKFiGOtfE0pCAwGZv+HEH3cv5I3iznTns2yVJnGAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dFYdSanN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dFYdSanN"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14C83C13;
	Tue,  8 Sep 2026 12:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788863667;
	bh=gIqJ+r0/JTqKMlIxO4T7rjLwha3sIS4wwumLA9Fjz0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFYdSanNszm4WP3+cZc5f5+demQxtvyYYtDs623mv2WRLZduMim31Tvm4aCJ0htIm
	 QJJtnhXo4tUwcGzy3ahx+E7SdFh6Jwpu2odowiYqhg611TmE+OnqtQnwICWwv9aSm5
	 xl7eCrdupQs5VhWsx/NOC9fPJGEFc8yNlWLr/7jo=
Date: Tue, 8 Sep 2026 13:36:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>, hverkuil+cisco@kernel.org,
	mehdi.djait@linux.intel.com, u.kleine-koenig@baylibre.com,
	jacopo@jmondi.org, p.zabel@pengutronix.de,
	ezequiel@vanguardiasur.com.ar, mchehab+samsung@kernel.org,
	festevam@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: Fix CSI-2 CRC errors on RK3576 after
 init sequence
Message-ID: <20260908103600.GF1672293@killaraus.ideasonboard.com>
References: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
 <ap_gCH1AnciFIEoa@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ap_gCH1AnciFIEoa@kekkonen.localdomain>

On Tue, Sep 08, 2026 at 01:14:32PM +0300, Sakari Ailus wrote:
> On Wed, Aug 26, 2026 at 08:54:32AM +0000, Xiaolei Wang wrote:
> > On the RK3576 platform, after ov5645_global_init_setting completes and
> > before stream on, the CSI host reports a high rate of CRC errors:
> > 
> >   MIPI_CSI2 ERR1:0x1000000 (crc,vc: 0)
> > 
> > These errors occur exclusively in the window between init completion and
> > stream on. Once preview starts and the sensor outputs valid HS data, no
> > further CRC errors are observed.
> > 
> > Commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") reworked
> > the power sequence to properly enter LP-11 during power-up. As part of
> > this change, the SYSTEM_CTRL0_STOP (0x42) write in s_power() was replaced
> > with usleep_range(500, 1000), leaving the sensor in wake state (0x3008 =
> > 0x02) from init through to s_stream. Reverting this commit resolves the
> > CRC errors, confirming it as the triggering change.
> > 
> > Restore the power-down state after init by appending { 0x3008, 0x42 } to
> > the end of ov5645_global_init_setting[]. This powers down the sensor core
> > after MIPI configuration is complete, while keeping the MIPI PHY active in
> > LP-11. The sensor is then woken up only at s_stream time.
> > 
> > This preserves all LP-11 compliance improvements from
> > commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") while
> > eliminating the CRC errors on RK3576.
> > 
> > Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
> > Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
> > ---
> >  drivers/media/i2c/ov5645.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index c772ef6e51d2..be85e0155b81 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -351,7 +351,8 @@ static const struct reg_value ov5645_global_init_setting[] = {
> >  	{ 0x3008, 0x02 },
> >  	{ OV5645_IO_MIPI_CTRL00, 0x40 },
> >  	{ OV5645_MIPI_CTRL00, 0x24 },
> > -	{ OV5645_PAD_OUTPUT00, 0x70 }
> > +	{ OV5645_PAD_OUTPUT00, 0x70 },
> > +	{ 0x3008, 0x42 }

While at it, please use the register macro.

> Is the earlier write of 0x3008 still appropriate?

There are four earlier writes of register 0x3008. The whole
initialization sequence likely needs a cleanup. It's not clear why
software suspend needs to be disabled briefly during initialization.

> >  };
> >  
> >  static const struct reg_value ov5645_setting_sxga[] = {

-- 
Regards,

Laurent Pinchart
