Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A315FA81;
	Mon,  7 Sep 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772610; cv=none; b=LvbyatdlIcuJi6H0VHopQI8SnooJ6Ob8/Oef5gSU9wAKh8vTWebJokJK893ojt7r3Ttpq3HkUwMKKI6pojVPiT6f/lBYkNc/EAlqXZ9d2v0yYkliIOiik+++xYbxfsu0nISNBKgAgDfp/8lMjQ+nujEgUolDpRVtWCzuWoQNqAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772610; c=relaxed/simple;
	bh=PQLfqa7veDPeFKxq6zor8/Q2FT3lLuiYQUP2bbBuYsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nz3WXIf7MGmGNXUPjr/1HNC63SXs3eajv9XCBPqiMIG4T0dOJv8/G6gvEIgbxu8/ZwMJDjUPLQvyvqvQfIZ8aGwL5hgBF0Ej8HTQr96Z614qSA+MCgcSVhm+DGvwjrele4Z/QC6/s+5Eq8hDTO6ZgFD0fbAOBYaALz4cAwjeJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jGEJKBni; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jGEJKBni"
Received: from ideasonboard.com (mob-109-113-65-131.net.vodafone.it [109.113.65.131])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBA82981;
	Mon,  7 Sep 2026 11:15:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788772511;
	bh=PQLfqa7veDPeFKxq6zor8/Q2FT3lLuiYQUP2bbBuYsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGEJKBniHgxJtjVK7R+tpH9sggpGwczbbP1bYrvUiN1I/0ND64hm860jzwDl1KgSV
	 axuBrz6FmP7AJd8v0TmOSW1C4r9okx1HlbKAfFpMBouL5Cp1oIa1OQeXx5SwAW0qey
	 DmeysCynyvHhGzEI65gn837rJ4UVNryLftn6OYiE=
Date: Mon, 7 Sep 2026 11:16:41 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ap6ALNC8Q0M-Oo51@zed>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
 <20260904-mira016-v2-2-1dcf7b3a807e@ideasonboard.com>
 <ap3M0h2S6EFpuC2T@kekkonen.localdomain>
 <ap5n7OyZrI0KzzN-@zed>
 <ap561H8xYJvjZsRa@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ap561H8xYJvjZsRa@kekkonen.localdomain>

Hi Sakari

On Mon, Sep 07, 2026 at 11:50:28AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Sep 07, 2026 at 09:45:16AM +0200, Jacopo Mondi wrote:
> > > > +}
> > > > +
> > > > +static inline u32 mira016_nsec_to_lines(struct mira016 *mira016, u32 nsec)
> > > > +{
> > > > +	return nsec / (mira016_trow_psec(mira016) / HZ_PER_KHZ);
> > > > +}
> > > > +
> > > > +static inline u32 mira016_calc_prate(struct mira016 *mira016, u32 h_tot)
> > > > +{
> > > > +	/*
> > > > +	 * Pixel rate is calculate as the row duration divided by the total line
> > > > +	 * length.
> > > > +	 *
> > > > +	 * pixel time (psec) = t_row(psec) / h_tot
> > > > +	 * pixel rate (mbps) = 10^12 / pixel_time
> > > > +	 *		     = 10^12 * h_tot / t_row
> > > > +	 *		     = h_tot * 10^6 / t_row * 10^6 to avoid overflows
> > > > +	 */
> > > > +	u32 trow_psec = mira016_trow_psec(mira016);
> > > > +
> > > > +	return h_tot * HZ_PER_MHZ / trow_psec * HZ_PER_MHZ;
> > >
> > > Can this overflow?
> > >
> >
> > I don't think so. I chose to multiply by 10^6 two times before and after
> > the division to avoid overflows.
> >
> > Should I re-consider something ?
>
> It was a question. :-) If it can't then it's fine as-is.
>
> >
> >
> > > > +}
> > > > +
> > > > +static inline u32 mira016_calc_min_vblank(struct mira016 *mira016, u32 y_tot)
> > > > +{
> > > > +	/*
> > > > +	 * See 3.15.2 Frame Rate, equation 4.
> > > > +	 *
> > > > +	 * TODO: The minimum frame duration has to be expanded if embedded data
> > > > +	 * are used.
> > > > +	 */
> > > > +	u32 trow_nsec = mira016_trow_psec(mira016) / HZ_PER_KHZ;
> > > > +	u32 min_duration_nsec =  trow_nsec * (y_tot + 35) + 50 * HZ_PER_KHZ;
> > >
> > > What are 35 and 50 here?
> > >
> >
> > No idea, the sensor datasheet doesn't describe those values
>
> Ok.
>
> There's also an extra whitespace there.
>

Oh thanks

> ...
>
> > > > +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > +{
> > > > +	struct mira016 *mira016 =
> > > > +		container_of(ctrl->handler, struct mira016, ctrl_handler);
> > > > +	struct i2c_client *client = v4l2_get_subdevdata(&mira016->sd);
> > > > +	struct v4l2_subdev_state *state;
> > > > +	struct v4l2_rect *crop;
> > > > +	int ret = 0;
> > > > +
> > > > +	state = v4l2_subdev_get_locked_active_state(&mira016->sd);
> > > > +	crop = v4l2_subdev_state_get_crop(state, 0);
> > > > +
> > > > +	if (ctrl->id == V4L2_CID_VBLANK) {
> > > > +		s32 exposure_max = crop->height + ctrl->val
> > > > +				 - MIRA016_FRAME_INTEGRATION_DIFF;
> > > > +		s32 exposure_def = min(exposure_max,
> > > > +				       mira016->exposure->val);
> > > > +
> > > > +		ret = __v4l2_ctrl_modify_range(mira016->exposure,
> > > > +					       mira016->exposure->minimum,
> > > > +					       exposure_max,
> > > > +					       mira016->exposure->step,
> > > > +					       exposure_def);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	if (!pm_runtime_get_if_in_use(&client->dev))
> > > > +		return 0;
> > > > +
> > > > +	switch (ctrl->id) {
> > > > +	case V4L2_CID_EXPOSURE:
> > > > +		ret = mira016_write_exposure_reg(mira016, ctrl->val);
> > > > +		break;
> > > > +	case V4L2_CID_VBLANK:
> > > > +		ret = mira016_write_frame_duration_reg(mira016, state, ctrl->val);
> > > > +		break;
> > >
> > > Is hblank part of the register lists?
> > >
> >
> > These sensors (there will hopefully be more supported by this driver)
> > do not have a real horizontal blanking.
> >
> > Their line length is expressed by a time base multipled by a line
> > length which doesn't directly depend on the pixel width but rather on
> > the ADC and PHY timings.
> >
> > You could expand the line duration by increasing the time base, but I
> > wouldn't go there and use VBLANK only to control the frame duration.
> >
> > As you can see the HBLANK control is registered with  fixed value of
> > 0.
>
> How does control frame rate then? If HBLANK is zero, the frame rate is
> undefined, isn't it?
>

Why do you think so ?

The row_timing is the product of the time base (in usec) multiplied by
the row length expressed in time base cycles (see mira016_trow_psec()
and how seq_time_base and row_length are calculated).

VBLANK is still controllable, and you can vary the frame rate by
changing the vblank.

What have am I missing ?

> > > > +static int mira016_init_controls(struct mira016 *mira016)
> > > > +{
> > > > +	struct i2c_client *client = v4l2_get_subdevdata(&mira016->sd);
> > > > +	struct v4l2_fwnode_device_properties props;
> > > > +	struct v4l2_ctrl_handler *ctrl_hdlr;
> > > > +	struct v4l2_ctrl *link_freq;
> > > > +	struct v4l2_ctrl *hblank;
> > > > +	u32 min_exposure_lines;
> > > > +	u32 def_exposure;
> > > > +	u32 min_vblank;
> > > > +	u32 def_vblank;
> > > > +	u32 pixel_rate;
> > > > +	int ret;
> > > > +
> > > > +	ctrl_hdlr = &mira016->ctrl_handler;
> > > > +	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> > > > +
> > > > +	/* By default, PIXEL_RATE is read only */
> > > > +	pixel_rate = mira016_calc_prate(mira016, MIRA016_PIXEL_ARRAY_WIDTH);
> > > > +	mira016->prate = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_PIXEL_RATE,
> > > > +					   pixel_rate, pixel_rate, 1,
> > > > +					   pixel_rate);
> > > > +
> > > > +	def_vblank = mira016_nsec_to_lines(mira016,
> > > > +					   MIRA016_DEFAULT_DURATION_NSEC);
> > > > +	def_vblank -= MIRA016_PIXEL_ARRAY_HEIGHT;
> > > > +
> > > > +	min_vblank = mira016_calc_min_vblank(mira016,
> > > > +					     MIRA016_PIXEL_ARRAY_HEIGHT);
> > > > +	mira016->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &mira016_ctrl_ops,
> > > > +					    V4L2_CID_VBLANK, min_vblank,
> > > > +					    MIRA016_MAX_VBLANK, 1,
> > > > +					    def_vblank);
> > > > +
> > > > +	/* Fixed 0 horizontal blanking. */
> > > > +	hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK, 0,
> > > > +				   0, 1, 0);
> > > > +
> > > > +	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL, V4L2_CID_LINK_FREQ,
> > > > +					   0, 0, &mira016_link_freqs[0]);
> > > > +
> > > > +	min_exposure_lines = mira016_nsec_to_lines(mira016,
> > > > +						   mira016->timings.min_exposure_time);
> > > > +	def_exposure = mira016_nsec_to_lines(mira016,
> > > > +					     MIRA016_EXPOSURE_DEF_NSEC);
> > > > +	mira016->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &mira016_ctrl_ops,
> > > > +					      V4L2_CID_EXPOSURE,
> > > > +					      min_exposure_lines,
> > > > +					      MIRA016_MAX_EXPOSURE, 1,
> > > > +					      def_exposure);
> > > > +
> > > > +	mira016->gain = v4l2_ctrl_new_std(ctrl_hdlr, &mira016_ctrl_ops,
> > > > +					  V4L2_CID_ANALOGUE_GAIN,
> > > > +					  1, 1, 1, 1);
> > > > +
> > > > +	/*
> > > > +	 * Changing VFLIP requires re-programming the top point, hence we
> > > > +	 * program flips along with the ROI windows at enable_streams time. As
> > > > +	 * we grab the flip controls there, there's no need to handle the two
> > > > +	 * controls while streaming.
> > > > +	 */
> > > > +	mira016->hflip = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> > > > +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> > > > +
> > > > +	mira016->vflip = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> > > > +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> > > > +
> > > > +	v4l2_fwnode_device_parse(&client->dev, &props);
> > >
> > > v4l2_fwnode_device_parse() can return an error and I'd check for it. I'd
> > > however do that before initialising the control handler as it simplifies
> > > error handling.
> >
> > Interesting idea. I still see most drivers calling
> > v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties() in
> > sequence at the end of the controls initialization, but doing the
> > parsing at the beginning of the function is certainly a good idea.
>
> Yes, the ones you've been looking at are old drivers. :-)
>
> > > > +		{ 16, 21 }, { 17, 26 }, { 18, 29 }, { 19, 30 }, { 20, 15 },
> > > > +		{ 21, 23 }, { 22, 27 }, { 23, 13 }, { 24, 22 }, { 25, 11 },
> > > > +		{ 26, 5 }, { 27, 18 }, { 28, 25 }, { 29, 12 },
> > > > +		{ 30, 6 }, { 31, 3 }, { 32, 1 }
> > > > +	};
> > > > +
> > > > +	for (unsigned int i = 0; i < ARRAY_SIZE(pll_n_lut); ++i) {
> > > > +		if (pll_n_lut[i].n != pll_n)
> > > > +			continue;
> > > > +
> > > > +		return pll_n_lut[i].pll_n;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static u8 mira016_m_to_pll_m(u32 pll_m)
> > > > +{
> > > > +	/* Table 12: Lookup table for “M to PLL_DIV_M” mapping */
> > > > +	static const struct pll_m_div {
> > > > +		u8 m_min;
> > > > +		u8 m_max;
> > > > +		u8 pll_m_min;
> > > > +		u8 pll_m_max;
> > > > +	} pll_m_lut[] = {
> > > > +		{ 16, 31, 224, 239 }, { 32, 63, 192, 233 },
> > > > +		{ 64, 127, 128, 191 }, { 128, 255, 0, 127 },
> > > > +	};
> > > > +
> > > > +	for (unsigned int i = 0; i < ARRAY_SIZE(pll_m_lut); ++i) {
> > > > +		const struct pll_m_div *p = &pll_m_lut[i];
> > > > +
> > > > +		if (pll_m > p->m_max)
> > > > +			continue;
> > > > +
> > > > +		return p->pll_m_min + pll_m - p->m_min;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void mira016_pll_calc(struct mira016 *mira016)
> > >
> > > It's nice to have a PLL calculator for this. Thank you! :-)
> > >
> >
> > I also considered using the CCS PLL calculator, but this PLL is so
> > simple it felt like an overkill
>
> If the CCS PLL calculator fits for the job, I'd just use it. If it does a
> little more, it's possible to use the same value for minimum and maximum
> for the relevant parameters.
>
> > > > +static int mira016_parse_endpoint(struct device *dev, struct mira016 *mira016)
> > > > +{
> > > > +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
> > > > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > > > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > > > +	};
> > > > +
> > > > +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > > +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg))
> > > > +		return dev_err_probe(dev, -EINVAL, "Failed to parse endpoint\n");
> > >
> > > Don't mask error codes! Just return the error code returned by
> > > v4l2_fwnode_endpoint_alloc_parse().
> > >
> >
> > With PTR_ERR() I presume
>
> v4l2_fwnode_endpoint_alloc_parse() returns an integer.
>

Yeah I just noticed.

> > > > +static int mira016_probe(struct i2c_client *client)
> > > > +{
> > > > +	struct device *dev = &client->dev;
> > > > +	struct mira016 *mira016;
> > > > +	int ret;
> > > > +
> > > > +	mira016 = devm_kzalloc(&client->dev, sizeof(*mira016), GFP_KERNEL);
> > > > +	if (!mira016)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	mira016->dev = &client->dev;
> > > > +
> > > > +	v4l2_i2c_subdev_init(&mira016->sd, client, &mira016_subdev_ops);
> > > > +
> > > > +	mira016->regmap = devm_cci_regmap_init_i2c(client, 16);
> > > > +	if (IS_ERR(mira016->regmap))
> > > > +		return dev_err_probe(dev, PTR_ERR(mira016->regmap),
> > > > +				     "failed to initialize CCI\n");
> > > > +
> > > > +	mira016->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
> > > > +	if (IS_ERR(mira016->xclk))
> > > > +		return dev_err_probe(dev, PTR_ERR(mira016->xclk),
> > > > +				     "failed to get xclk\n");
> > > > +
> > > > +	mira016->xclk_freq = clk_get_rate(mira016->xclk);
> > > > +	if (mira016_validate_xclk_freq(mira016)) {
> > > > +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > > > +			mira016->xclk_freq);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	ret = mira016_get_regulators(mira016);
> > > > +	if (ret)
> > > > +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> > > > +
> > > > +	mira016->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > > > +						      GPIOD_OUT_HIGH);
> > > > +	if (IS_ERR(mira016->reset_gpio))
> > > > +		return dev_err_probe(dev, PTR_ERR(mira016->reset_gpio),
> > > > +				     "failed to get reset gpio\n");
> > > > +
> > > > +	ret = mira016_parse_endpoint(dev, mira016);
> > > > +	if (ret)
> > > > +		return ret;
> > >
> > > Parsing the endpoint should be done as soon as you can before acquiring
> > > resources related to power management, for instance. -EPROBE_DEFER may well
> > > be returned in some cases.
> > >
> >
> > I can probably do that even before calling v4l2_i2c_subdev_init()
>
> Sounds good.
>
> > > > +static void mira016_remove(struct i2c_client *client)
> > > > +{
> > > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > +	struct mira016 *mira016 = to_mira016(sd);
> > > > +
> > > > +	v4l2_ctrl_handler_free(mira016->sd.ctrl_handler);
> > > > +
> > > > +	v4l2_async_unregister_subdev(sd);
> > > > +	v4l2_subdev_cleanup(&mira016->sd);
> > > > +	media_entity_cleanup(&sd->entity);
> > > > +
> > > > +	pm_runtime_disable(&client->dev);
> > > > +	if (!pm_runtime_status_suspended(&client->dev))
> > > > +		mira016_power_off(&client->dev);
> > > > +	pm_runtime_set_suspended(&client->dev);
> > >
> > > pm_runtime_dont_use_autosuspend()?
> > >
> >
> > Ack
> >
> > Thanks for the review!
>
> You're welcome! :-)
>

Thanks
  j

> --
> Regards,
>
> Sakari Ailus
