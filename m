Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518559;
	b=KN5o3tjljLzcYR6FxG+3gfbnD0neUfc+Z7ZhcC+7YetrSAxrN3vMepNb3box8IYBUanP
	 Xz801Hku9r+MooD77O8LDtUtXIL+vbZXo0PlStEx8gEMq6GdgeSq07yq8H1p5KPHCGNUs
	 zXJLMdb10zNlaRA4G7CmNc/ZUCZLz8m/kGULQZH/wXqeqMICxtGhO6JnvWf/b+vkFqypN
	 1rKns42bhnyleLMa6NnKcbIAWx/d+pjrE+nuEp4vW9JqQfHcSwCfFCYsESF+1QDwPJPOC
	 nhdIKSXM1zIuiAvQjS2DUNvqqUJQVHiBqCrcd8ovTj3Hc1/NdyB88vfUtjG3s40WYmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518559;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FCHlfMLJv0OVnWJY24M8C/dZeTJJZGHh2Ym6qwOwf+U=;
	b=VWhqELtaIY4XncRt98JrqeSSWEbL50PeQpBcoja/3YAqy5U5s3xWiF3k8Dq5kSc/hZTt
	 7VzT54EUKBYc5wjysfkH9zWs7X+FgnuFUTMav9cblXhPb+YiBzUsGjL9dLvN7OIspacBu
	 vxitMUVIl3IjTZPd7k4MW++MgDNLBECl0GMtMP7wkD6Arb1XOUwRIj0PXySPF0sR+VewJ
	 VLZjaOWAnGAmJXdoMSkibqT2grgwR4OW/GWe7hf25hwcSkyHASyJYvXb1e6ffnA61Rl90
	 NK7/nk2SYi5rggQz1ZY9WKX3Me/EIwcR4TX30H8kf/qWfpkLSWxmi9nFBu8KD3lwJ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=aWbB0nl5;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A00C606A88A;
	Thu, 12 Nov 2026 21:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A00C606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=aWbB0nl5
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FD5C802;
	Thu, 12 Nov 2026 22:20:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794518411;
	bh=hHFH2yQOn6t+JECkzDPZA9e+f8r/7Mp0znlhjRg/6c0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWbB0nl58WTGeiGdAoqmDdDQydfE03JD+3q7dNsVmJpxnhIwYNz6DR8XIZinquy27
	 dFTqS0qRTwFJko7vy9tNp2iGgv5+05I5DX+bV2mnvr2K7/ulQAa6h4S9P1yFbmdVLo
	 9Nuwg8hinP9hOdK5Hf8/W3BsxpKbE22k5rcWckgM=
Date: Thu, 12 Nov 2026 23:22:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mauriziocasciano7@gmail.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 02/15] media: ov8858: support 19.2 MHz clock and
 manual white balance
Message-ID: <20261112212234.GA699509@killaraus.ideasonboard.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
 <20261002-submission-media-yogabook-v10-b4-final-v10-2-817ec765b257@gmail.com>
 <avYp7y9Vvh2Oo5c6@valkosipuli.retiisi.eu>
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
In-Reply-To: <avYp7y9Vvh2Oo5c6@valkosipuli.retiisi.eu>

On Thu, Nov 12, 2026 at 11:04:47PM +0200, Sakari Ailus wrote:
> On Fri, Oct 02, 2026 at 10:57:40AM +0200, Maurizio Casciano via B4 Relay wrote:
> > From: Maurizio Casciano <mauriziocasciano7@gmail.com>
> > 
> > Support both 19.2 MHz and 24 MHz input clocks. Move the PLL and
> > global-timing registers out of the common mode tables and select register
> > settings for the detected revision, lane count, input clock and 360 MHz
> > link frequency when starting the stream. Use the actual input-clock rate
> > when calculating the reset delay.
> > 
> > Add standard red and blue balance controls for the sensor's manual white
> > balance registers. V4L2 defines red and blue balance relative to green but
> > does not define a standard green-balance control, so keep green at unity.
> > Accumulate errors while programming all three channels.
> > 
> > The manual white-balance register definitions and programming follow
> > Intel's GPL-2.0 OV5670 driver, so retain its 2017 Intel copyright notice.
> 
> Any others notices that should be added?
> 
> > 
> > Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> > Assisted-by: LLM sparse
> 
> The Assisted-by: tags are no longer used, please remove them.
> 
> > ---
> >  drivers/media/i2c/ov8858.c | 183 ++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 147 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> > index 2a0e2b08b9aa..64532237e8b5 100644
> > --- a/drivers/media/i2c/ov8858.c
> > +++ b/drivers/media/i2c/ov8858.c
> 
> ...
> 
> > @@ -1541,6 +1606,23 @@ static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
> >  	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
> >  }
> >  
> > +static int ov8858_set_mwb_gains(struct ov8858 *ov8858)
> > +{
> > +	int ret = 0;
> > +
> > +	ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN,
> > +		     ov8858->red_balance->val, &ret);
> > +	/*
> > +	 * Green is the unity reference for the red and blue balance controls.
> > +	 */
> 
> UAPI-wise this doesn't look great. There's a digital gain control, too, so
> you can still control the entire digital gain. But the hardware has
> per-component gains and in this case the (likely analogue TV inspired?)
> UAPI limits this. A few other sensor drivers appear to be doing the same.
> 
> Cc Laurent, too.

That's indeed not a good UAPI.

> > +	ov8858_write(ov8858, OV8858_REG_MWB_GREEN_GAIN,
> > +		     OV8858_MWB_GAIN_DEFAULT, &ret);
> > +	ov8858_write(ov8858, OV8858_REG_MWB_BLUE_GAIN,
> > +		     ov8858->blue_balance->val, &ret);
> > +
> > +	return ret;
> > +}
> > +
> >  static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >  	struct ov8858 *ov8858 = container_of(ctrl->handler,
> > @@ -1589,6 +1671,10 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_DIGITAL_GAIN:
> >  		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
> >  		break;
> > +	case V4L2_CID_RED_BALANCE:
> > +	case V4L2_CID_BLUE_BALANCE:
> > +		ret = ov8858_set_mwb_gains(ov8858);
> > +		break;
> >  	case V4L2_CID_VBLANK:
> >  		ret = ov8858_write(ov8858, OV8858_REG_VTS,
> >  				   ctrl->val + format->height, NULL);
> > @@ -1623,9 +1709,6 @@ static int ov8858_power_on(struct ov8858 *ov8858)
> >  	unsigned long delay_us;
> >  	int ret;
> >  
> > -	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
> > -		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
> > -
> >  	ret = clk_prepare_enable(ov8858->xvclk);
> >  	if (ret < 0) {
> >  		dev_err(dev, "Failed to enable xvclk\n");
> > @@ -1644,7 +1727,7 @@ static int ov8858_power_on(struct ov8858 *ov8858)
> >  	 * transaction, but a double sleep between the release of gpios
> >  	 * helps with sporadic failures observed at probe time.
> >  	 */
> > -	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
> > +	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / HZ_PER_MHZ);
> >  
> >  	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
> >  	fsleep(delay_us);
> > @@ -1710,7 +1793,7 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
> >  	u32 h_blank;
> >  	int ret;
> >  
> > -	ret = v4l2_ctrl_handler_init(handler, 10);
> > +	ret = v4l2_ctrl_handler_init(handler, 12);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -1752,6 +1835,19 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
> >  			  OV8858_LONG_DIGIGAIN_STEP,
> >  			  OV8858_LONG_DIGIGAIN_DEFAULT);
> >  
> > +	ov8858->red_balance =
> > +		v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> > +				  V4L2_CID_RED_BALANCE,
> > +				  OV8858_MWB_GAIN_MIN, OV8858_MWB_GAIN_MAX,
> > +				  OV8858_MWB_GAIN_STEP,
> > +				  OV8858_MWB_GAIN_DEFAULT);
> > +	ov8858->blue_balance =
> > +		v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> > +				  V4L2_CID_BLUE_BALANCE,
> > +				  OV8858_MWB_GAIN_MIN, OV8858_MWB_GAIN_MAX,
> > +				  OV8858_MWB_GAIN_STEP,
> > +				  OV8858_MWB_GAIN_DEFAULT);
> > +
> >  	v4l2_ctrl_new_std_menu_items(handler, &ov8858_ctrl_ops,
> >  				     V4L2_CID_TEST_PATTERN,
> >  				     ARRAY_SIZE(ov8858_test_pattern_menu) - 1,
> > @@ -1805,15 +1901,20 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)
> >  
> >  	if (id == OV8858_R2A) {
> >  		/* R2A supports 2 and 4 lanes modes. */
> > -		ov8858->global_regs = ov8858->num_lanes == 4
> > -				    ? ov8858_global_regs_r2a_4lane
> > -				    : ov8858_global_regs_r2a_2lane;
> > +		if (ov8858->num_lanes == 4) {
> > +			ov8858->global_regs = ov8858_global_regs_r2a_4lane;
> > +			ov8858->xvclk_regs = ov8858_24mhz_360mhz_r2a_4lane;
> > +		} else {
> > +			ov8858->global_regs = ov8858_global_regs_r2a_2lane;
> > +			ov8858->xvclk_regs = ov8858_24mhz_360mhz_r2a_2lane;
> > +		}
> >  	} else if (ov8858->num_lanes == 2) {
> >  		/*
> >  		 * R1A only supports 2 lanes mode and it's only partially
> >  		 * supported.
> >  		 */
> >  		ov8858->global_regs = ov8858_global_regs_r1a;
> > +		ov8858->xvclk_regs = ov8858_24mhz_360mhz_r1a_2lane;
> >  		dev_warn(&client->dev, "R1A may not work well!\n");
> >  	} else {
> >  		dev_err(&client->dev,
> > @@ -1821,6 +1922,9 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)
> >  		return -EINVAL;
> >  	}
> >  
> > +	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ)
> > +		ov8858->xvclk_regs = ov8858_19_2mhz_360mhz;
> 
> The 24 MHz configurations are lane number (and variant) dependent. Isn't
> that applying to 19,2 MHz? If not, why?
> 
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1888,6 +1992,13 @@ static int ov8858_probe(struct i2c_client *client)
> >  		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
> >  				     "Failed to get xvclk\n");
> >  
> > +	ov8858->xvclk_rate = clk_get_rate(ov8858->xvclk);
> > +	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ &&
> > +	    ov8858->xvclk_rate != OV8858_XVCLK_FREQ_24MHZ)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "Unsupported xvclk rate %lu Hz\n",
> > +				     ov8858->xvclk_rate);
> > +
> >  	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> >  						     GPIOD_OUT_HIGH);
> >  	if (IS_ERR(ov8858->reset_gpio))

-- 
Regards,

Laurent Pinchart
