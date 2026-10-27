Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116196;
	b=vuyXVG4hRWjh6li99moTHkT874b9YOGfj3Q1bou6N5pSeb2aTVUXeGZt3fufKfGJLzDW
	 mAbwWoWRHwVCI6i0lE2atxqZRWWooOjzQO2Nt8jM0Bv/7Mo8GMPMMQh6Z3yU9NSSfmb2i
	 V4aAqHISxzr5/8ugWsk5qG9GA89dMFWEG3YKDWQfq1KSL+/b6Mg/QGu1DuwpKbwZ9g2l+
	 zoQX6UGbLxhSE1vv5d20DP6cKfGO2TYhp36qG84WhTL9Cwjvj8PVb8+ufqcj33UQLArKq
	 aQUK+n1XDfaOCIVuwndNqzFLlZ4AZaZASHeHTYfkJscgygY/fVdj7iFL5/uyzCcktmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116196;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WoqCYBexORE7nP+aEXtbjekSu1wzpa5okHklf2BV5tM=;
	b=yBshkfvKiMjAZ+wMPJcIP8C7xfYUhCgkWfUlBj7WUdvXcdusoe5Nh1DkHe4+KfsBFZD+
	 pk9zpXeQwbv+ulcv5tizxXMtIw9C5y51OcGAgwFWx3YV8Fvm1wZ2yEICRJWlHzITqXgAo
	 6usmAvwjcgzLbanNPb6XNVTBOsSBIPf7TbWBPB/q+0FMwNedSzTYFyO4BBZhV7+z/ShTf
	 +5ExNiHEW9UoaKWtr4lDXE0T2aYiNxEqSZ56gL/tlbBd4/s/KNnjrt3BNNT4F9oSon8bS
	 XTWYTsXi/Jz0SV4hjgP5buRN5cBohK0PM1XG6j2DR8M8NqrbtPaK8j/gu5hwmOfEj+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=u79pquXk;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5616D606A31B;
	Tue, 27 Oct 2026 15:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5616D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=u79pquXk
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29D6A4BB;
	Tue, 27 Oct 2026 16:47:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793116061;
	bh=kVIDKOKWnn0D+PkqDZRbQOGtvfJNbSOpFr6LbKR5XrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u79pquXkYsvOWqVODlZAAwqbfRssa13Pla8iz5akeOAa/q1xaOcBJzQ9s390e/ykd
	 fv3uINCBNiEYHh/nGp26dSEMchIukf8q1BX+48cEA0iiHleN+6+8xioWXruUrptVSO
	 b5eu6G7npWClPPlv23MkTK6xMaAXmeGaVHavfVtw=
Message-ID: <ff527b5c-b1cb-42a5-9b8d-f039b7a7f7f6@ideasonboard.com>
Date: Tue, 27 Oct 2026 15:49:49 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov5693: Use sub-device active state
To: Simon Kruse <simon0x+git@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fernando Rimoli <fernandorimoli11@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261027074933.21921-1-simon0x+git@proton.me>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261027074933.21921-1-simon0x+git@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Simon - thanks for the patch

On 27/10/2026 07:50, Simon Kruse wrote:
> Store the active format and crop rectangle in the sub-device state
> instead of the driver's own ov5693_mode structure, and use the control
> handler's lock as the state lock in place of the driver mutex.
> 
> The sensor mode registers are now programmed from the active state when
> streaming starts, rather than from runtime resume. Binning and the
> subsampling increments are derived from the format and crop rectangle
> at that point, and the default vertical timing is computed where it is
> needed.
> 
> get_fmt is replaced by v4l2_subdev_get_fmt(), which also makes
> VIDIOC_SUBDEV_G_FMT return the try format for V4L2_SUBDEV_FORMAT_TRY
> instead of the active one.
> 
> As v4l2_subdev_init_finalize() sets V4L2_SUBDEV_FL_HAS_EVENTS for
> sub-devices with a control handler, control events are now supported,
> fixing the v4l2-compliance failure:
> 
>    fail: v4l2-test-controls.cpp(1128): subscribe event for control 'User Controls' failed
>    test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Kruse <simon0x+git@proton.me>
> ---
> This replaces "[PATCH] media: i2c: ov5693: Support control events",
> following Sakari's review:
> https://lore.kernel.org/all/20261010142042.23253-1-simon0x+git@proton.me/
> 
> Fernando, your Tested-by was for that patch and does not carry over to
> this rewrite. Could you test this one on your Surface Pro 9 as well?
> 
> Tested on a Microsoft Surface Pro 9 (Intel Alder Lake, IPU6, OVTI5693)
> with media-committers next at d7e7bca71 and CONFIG_PROVE_LOCKING=y:
> - v4l2-compliance 1.32.0 on the sensor subdev node: 46/46
> - raw captures at 2592x1944 and 1296x972, with flips, with a crop set
>    via set_selection, and right after runtime resume: same results as
>    without the patch
> - libcamera 0.7 cam: 28.6 fps
> - no lockdep reports from ov5693. Lockdep does warn on every stream
>    start at ipu6-isys-queue.c:203 (ipu6_isys_buffer_list_get() called
>    from ipu6_isys_csi2_enable_streams() without stream->mutex). That is
>    in the IPU6 driver, not in ov5693, and I will report it separately.
> 
>   drivers/media/i2c/ov5693.c | 236 +++++++++++++++----------------------
>   1 file changed, 95 insertions(+), 141 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 56599f9ca..b1cbe2a2f 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -141,9 +141,6 @@ struct ov5693_device {
>   	struct device *dev;
>   	struct regmap *regmap;
>   
> -	/* Protect against concurrent changes to controls */
> -	struct mutex lock;

This patch does quite a lot in one go, it would be better if it could be broken down into a number 
of smaller logical changes. You're removing here the lock from the driver and instead using the 
default one from v4l2_ctrl_handler. That might be a fine idea, but I don't think it's necessary to 
switch the driver to use the subdev active state right? Could it be broken out?

> -
>   	struct gpio_desc *reset;
>   	struct gpio_desc *powerdown;
>   	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
> @@ -152,16 +149,6 @@ struct ov5693_device {
>   	/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
>   	bool clock_ncont;
>   
> -	struct ov5693_mode {
> -		struct v4l2_rect crop;
> -		struct v4l2_mbus_framefmt format;
> -		bool binning_x;
> -		bool binning_y;
> -		unsigned int inc_x_odd;
> -		unsigned int inc_y_odd;
> -		unsigned int vts;
> -	} mode;
> -
>   	struct v4l2_subdev sd;
>   	struct media_pad pad;
>   
> @@ -459,9 +446,10 @@ static int ov5693_analog_gain_configure(struct ov5693_device *ov5693, u32 gain)
>   	return ret;
>   }
>   
> -static int ov5693_vts_configure(struct ov5693_device *ov5693, u32 vblank)
> +static int ov5693_vts_configure(struct ov5693_device *ov5693, u32 height,
> +				u32 vblank)
>   {
> -	u16 vts = ov5693->mode.format.height + vblank;
> +	u16 vts = height + vblank;
>   	int ret = 0;
>   
>   	cci_write(ov5693->regmap, OV5693_TIMING_VTS_REG, vts, &ret);
> @@ -483,13 +471,18 @@ static int ov5693_s_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct ov5693_device *ov5693 =
>   	    container_of(ctrl->handler, struct ov5693_device, ctrls.handler);
> +	const struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
>   	int ret = 0;
>   
> +	state = v4l2_subdev_get_locked_active_state(&ov5693->sd);
> +	format = v4l2_subdev_state_get_format(state, 0);
> +
>   	/* If VBLANK is altered we need to update exposure to compensate */
>   	if (ctrl->id == V4L2_CID_VBLANK) {
>   		int exposure_max;
>   
> -		exposure_max = ov5693->mode.format.height + ctrl->val -
> +		exposure_max = format->height + ctrl->val -
>   			       OV5693_INTEGRATION_TIME_MARGIN;
>   		__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
>   					 ov5693->ctrls.exposure->minimum,
> @@ -520,7 +513,7 @@ static int ov5693_s_ctrl(struct v4l2_ctrl *ctrl)
>   		ret = ov5693_flip_vert_configure(ov5693, !!ctrl->val);
>   		break;
>   	case V4L2_CID_VBLANK:
> -		ret = ov5693_vts_configure(ov5693, ctrl->val);
> +		ret = ov5693_vts_configure(ov5693, format->height, ctrl->val);
>   		break;
>   	case V4L2_CID_TEST_PATTERN:
>   		ret = ov5693_test_pattern_configure(ov5693, ctrl->val);
> @@ -557,60 +550,70 @@ static const struct v4l2_ctrl_ops ov5693_ctrl_ops = {
>   
>   /* System Control Functions */
>   
> -static int ov5693_mode_configure(struct ov5693_device *ov5693)
> +static int ov5693_mode_configure(struct ov5693_device *ov5693,
> +				 struct v4l2_subdev_state *state)
>   {
> -	const struct ov5693_mode *mode = &ov5693->mode;
> +	const struct v4l2_mbus_framefmt *format;
> +	const struct v4l2_rect *crop;
> +	unsigned int inc_x_odd, inc_y_odd;
> +	bool binning_x, binning_y;
>   	int ret = 0;
>   
> +	format = v4l2_subdev_state_get_format(state, 0);
> +	crop = v4l2_subdev_state_get_crop(state, 0);
> +
> +	binning_x = format->width < crop->width;
> +	binning_y = format->height < crop->height;

This logic has changed from ov5693_set_fmt(), but it looks like it still does the right thing.

> +	inc_x_odd = binning_x ? 3 : 1;
> +	inc_y_odd = binning_y ? 3 : 1;
> +
>   	/* Crop Start X */
> -	cci_write(ov5693->regmap, OV5693_CROP_START_X_REG, mode->crop.left,
> -		  &ret);
> +	cci_write(ov5693->regmap, OV5693_CROP_START_X_REG, crop->left, &ret);
>   
>   	/* Offset X */
>   	cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, 0, &ret);
>   
>   	/* Output Size X */
> -	cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_X_REG, mode->format.width,
> +	cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_X_REG, format->width,
>   		  &ret);
>   
>   	/* Crop End X */
>   	cci_write(ov5693->regmap, OV5693_CROP_END_X_REG,
> -		  mode->crop.left + mode->crop.width, &ret);
> +		  crop->left + crop->width, &ret);
>   
>   	/* Horizontal Total Size */
>   	cci_write(ov5693->regmap, OV5693_TIMING_HTS_REG, OV5693_FIXED_PPL,
>   		  &ret);
>   
>   	/* Crop Start Y */
> -	cci_write(ov5693->regmap, OV5693_CROP_START_Y_REG, mode->crop.top,
> -		  &ret);
> +	cci_write(ov5693->regmap, OV5693_CROP_START_Y_REG, crop->top, &ret);
>   
>   	/* Offset Y */
>   	cci_write(ov5693->regmap, OV5693_OFFSET_START_Y_REG, 0, &ret);
>   
>   	/* Output Size Y */
> -	cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_Y_REG, mode->format.height,
> +	cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_Y_REG, format->height,
>   		  &ret);
>   
>   	/* Crop End Y */
>   	cci_write(ov5693->regmap, OV5693_CROP_END_Y_REG,
> -		  mode->crop.top + mode->crop.height, &ret);
> +		  crop->top + crop->height, &ret);
>   
>   	/* Subsample X increase */
>   	cci_write(ov5693->regmap, OV5693_SUB_INC_X_REG,
> -		  ((mode->inc_x_odd << 4) & 0xf0) | 0x01, &ret);
> +		  ((inc_x_odd << 4) & 0xf0) | 0x01, &ret);
>   	/* Subsample Y increase */
>   	cci_write(ov5693->regmap, OV5693_SUB_INC_Y_REG,
> -		  ((mode->inc_y_odd << 4) & 0xf0) | 0x01, &ret);
> +		  ((inc_y_odd << 4) & 0xf0) | 0x01, &ret);
>   
>   	/* Binning */
>   	cci_update_bits(ov5693->regmap, OV5693_FORMAT1_REG,
>   			OV5693_FORMAT1_VBIN_EN,
> -			mode->binning_y ? OV5693_FORMAT1_VBIN_EN : 0, &ret);
> +			binning_y ? OV5693_FORMAT1_VBIN_EN : 0, &ret);
>   
>   	cci_update_bits(ov5693->regmap, OV5693_FORMAT2_REG,
>   			OV5693_FORMAT2_HBIN_EN,
> -			mode->binning_x ? OV5693_FORMAT2_HBIN_EN : 0, &ret);
> +			binning_x ? OV5693_FORMAT2_HBIN_EN : 0, &ret);
>   
>   	return ret;
>   }
> @@ -663,11 +666,6 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
>   		return dev_err_probe(ov5693->dev, ret,
>   				     "global settings error\n");
>   
> -	ret = ov5693_mode_configure(ov5693);
> -	if (ret)
> -		return dev_err_probe(ov5693->dev, ret,
> -				     "mode configure error\n");
> -

Why's this move?

>   	ret = ov5693_enable_streaming(ov5693, false);
>   	if (ret)
>   		dev_err(ov5693->dev, "stop streaming error\n");
> @@ -732,24 +730,16 @@ static int __maybe_unused ov5693_sensor_resume(struct device *dev)
>   	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>   	int ret;
>   
> -	mutex_lock(&ov5693->lock);
> -
>   	ret = ov5693_sensor_powerup(ov5693);
>   	if (ret)
> -		goto out_unlock;
> +		return ret;
>   
>   	ret = ov5693_sensor_init(ov5693);
>   	if (ret) {
>   		dev_err(dev, "ov5693 sensor init failure\n");
> -		goto err_power;
> +		ov5693_sensor_powerdown(ov5693);
>   	}
>   
> -	goto out_unlock;
> -
> -err_power:
> -	ov5693_sensor_powerdown(ov5693);
> -out_unlock:
> -	mutex_unlock(&ov5693->lock);
>   	return ret;
>   }

This churn in ov5693_sensor_resume() can be avoided in this patch if the lock isn't dropped.>
> @@ -786,47 +776,6 @@ static unsigned int __ov5693_calc_vts(u32 height)
>   	return ALIGN_DOWN(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / tgt_fps, 2);
>   }
>   
> -static struct v4l2_mbus_framefmt *
> -__ov5693_get_pad_format(struct ov5693_device *ov5693,
> -			struct v4l2_subdev_state *state,
> -			unsigned int pad, enum v4l2_subdev_format_whence which)
> -{
> -	switch (which) {
> -	case V4L2_SUBDEV_FORMAT_TRY:
> -		return v4l2_subdev_state_get_format(state, pad);
> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> -		return &ov5693->mode.format;
> -	default:
> -		return NULL;
> -	}
> -}
> -
> -static struct v4l2_rect *
> -__ov5693_get_pad_crop(struct ov5693_device *ov5693,
> -		      struct v4l2_subdev_state *state,
> -		      unsigned int pad, enum v4l2_subdev_format_whence which)
> -{
> -	switch (which) {
> -	case V4L2_SUBDEV_FORMAT_TRY:
> -		return v4l2_subdev_state_get_crop(state, pad);
> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> -		return &ov5693->mode.crop;
> -	}
> -
> -	return NULL;
> -}
> -
> -static int ov5693_get_fmt(struct v4l2_subdev *sd,
> -			  struct v4l2_subdev_state *state,
> -			  struct v4l2_subdev_format *format)
> -{
> -	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
> -
> -	format->format = ov5693->mode.format;
> -
> -	return 0;
> -}
> -
>   static int ov5693_set_fmt(struct v4l2_subdev *sd,
>   			  const struct v4l2_subdev_client_info *ci,
>   			  struct v4l2_subdev_state *state,
> @@ -838,9 +787,10 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
>   	unsigned int hratio, vratio;
>   	unsigned int width, height;
>   	unsigned int hblank;
> +	unsigned int vts;
>   	int exposure_max;
>   
> -	crop = __ov5693_get_pad_crop(ov5693, state, format->pad, format->which);
> +	crop = v4l2_subdev_state_get_crop(state, format->pad);
>   
>   	/*
>   	 * Align to two to simplify the binning calculations below, and clamp
> @@ -860,8 +810,7 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
>   	vratio = clamp_t(unsigned int,
>   			 DIV_ROUND_CLOSEST(crop->height, height), 1, 2);
>   
> -	fmt = __ov5693_get_pad_format(ov5693, state, format->pad,
> -				      format->which);
> +	fmt = v4l2_subdev_state_get_format(state, format->pad);
>   
>   	fmt->width = crop->width / hratio;
>   	fmt->height = crop->height / vratio;
> @@ -872,34 +821,25 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
>   	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>   		return 0;
>   
> -	mutex_lock(&ov5693->lock);
> -
> -	ov5693->mode.binning_x = hratio > 1;
> -	ov5693->mode.inc_x_odd = hratio > 1 ? 3 : 1;
> -	ov5693->mode.binning_y = vratio > 1;
> -	ov5693->mode.inc_y_odd = vratio > 1 ? 3 : 1;
> -
> -	ov5693->mode.vts = __ov5693_calc_vts(fmt->height);
> +	vts = __ov5693_calc_vts(fmt->height);
>   
>   	__v4l2_ctrl_modify_range(ov5693->ctrls.vblank,
>   				 OV5693_TIMING_MIN_VTS,
>   				 OV5693_TIMING_MAX_VTS - fmt->height,
> -				 1, ov5693->mode.vts - fmt->height);
> -	__v4l2_ctrl_s_ctrl(ov5693->ctrls.vblank,
> -			   ov5693->mode.vts - fmt->height);
> +				 1, vts - fmt->height);
> +	__v4l2_ctrl_s_ctrl(ov5693->ctrls.vblank, vts - fmt->height);
>   
>   	hblank = OV5693_FIXED_PPL - fmt->width;
>   	__v4l2_ctrl_modify_range(ov5693->ctrls.hblank, hblank, hblank, 1,
>   				 hblank);
>   
> -	exposure_max = ov5693->mode.vts - OV5693_INTEGRATION_TIME_MARGIN;
> +	exposure_max = vts - OV5693_INTEGRATION_TIME_MARGIN;
>   	__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
>   				 ov5693->ctrls.exposure->minimum, exposure_max,
>   				 ov5693->ctrls.exposure->step,
>   				 min(ov5693->ctrls.exposure->val,
>   				     exposure_max));
>   
> -	mutex_unlock(&ov5693->lock);
>   	return 0;
>   }
>   
> @@ -908,14 +848,9 @@ static int ov5693_get_selection(struct v4l2_subdev *sd,
>   				struct v4l2_subdev_state *state,
>   				struct v4l2_subdev_selection *sel)
>   {
> -	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
> -
>   	switch (sel->target) {
>   	case V4L2_SEL_TGT_CROP:
> -		mutex_lock(&ov5693->lock);
> -		sel->r = *__ov5693_get_pad_crop(ov5693, state, sel->pad,
> -						sel->which);
> -		mutex_unlock(&ov5693->lock);
> +		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
>   		break;
>   	case V4L2_SEL_TGT_NATIVE_SIZE:
>   		sel->r.top = 0;
> @@ -942,7 +877,6 @@ static int ov5693_set_selection(struct v4l2_subdev *sd,
>   				struct v4l2_subdev_state *state,
>   				struct v4l2_subdev_selection *sel)
>   {
> -	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>   	struct v4l2_mbus_framefmt *format;
>   	struct v4l2_rect *__crop;
>   	struct v4l2_rect rect;
> @@ -970,15 +904,14 @@ static int ov5693_set_selection(struct v4l2_subdev *sd,
>   	rect.height = min_t(unsigned int, rect.height,
>   			    OV5693_NATIVE_HEIGHT - rect.top);
>   
> -	__crop = __ov5693_get_pad_crop(ov5693, state, sel->pad, sel->which);
> +	__crop = v4l2_subdev_state_get_crop(state, sel->pad);
>   
>   	if (rect.width != __crop->width || rect.height != __crop->height) {
>   		/*
>   		 * Reset the output image size if the crop rectangle size has
>   		 * been modified.
>   		 */
> -		format = __ov5693_get_pad_format(ov5693, state, sel->pad,
> -						 sel->which);
> +		format = v4l2_subdev_state_get_format(state, sel->pad);
>   		format->width = rect.width;
>   		format->height = rect.height;
>   	}
> @@ -992,26 +925,27 @@ static int ov5693_set_selection(struct v4l2_subdev *sd,
>   static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>   {
>   	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
> +	struct v4l2_subdev_state *state;
>   	int ret;
>   
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
>   	if (enable) {
>   		ret = pm_runtime_resume_and_get(ov5693->dev);
>   		if (ret)
> -			return ret;
> +			goto unlock;
> +
> +		ret = ov5693_mode_configure(ov5693, state);
> +		if (ret)
> +			goto err_power_down;

Why did this function call move to here from ov5693_sensor_init()?>
> -		mutex_lock(&ov5693->lock);
>   		ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
> -		if (ret) {
> -			mutex_unlock(&ov5693->lock);
> +		if (ret)
>   			goto err_power_down;
> -		}
>   
>   		ret = ov5693_enable_streaming(ov5693, true);
> -		mutex_unlock(&ov5693->lock);
>   	} else {
> -		mutex_lock(&ov5693->lock);
>   		ret = ov5693_enable_streaming(ov5693, false);
> -		mutex_unlock(&ov5693->lock);
>   	}
>   	if (ret)
>   		goto err_power_down;
> @@ -1019,9 +953,13 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>   	if (!enable)
>   		pm_runtime_put(ov5693->dev);
>   
> +	v4l2_subdev_unlock_state(state);
> +
>   	return 0;
>   err_power_down:
>   	pm_runtime_put_noidle(ov5693->dev);
> +unlock:
> +	v4l2_subdev_unlock_state(state);
>   	return ret;
>   }
>   
> @@ -1030,7 +968,9 @@ static int ov5693_get_frame_interval(struct v4l2_subdev *sd,
>   				     struct v4l2_subdev_frame_interval *interval)
>   {
>   	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
> -	unsigned int framesize = OV5693_FIXED_PPL * (ov5693->mode.format.height +
> +	const struct v4l2_mbus_framefmt *format =
> +		v4l2_subdev_state_get_format(sd_state, 0);
> +	unsigned int framesize = OV5693_FIXED_PPL * (format->height +
>   				 ov5693->ctrls.vblank->val);
>   	unsigned int fps = DIV_ROUND_CLOSEST(OV5693_PIXEL_RATE, framesize);

There's a FIXME in this function that now no longer applies and can be removed.
> @@ -1063,15 +1003,12 @@ static int ov5693_enum_frame_size(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *state,
>   				  struct v4l2_subdev_frame_size_enum *fse)
>   {
> -	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>   	struct v4l2_rect *__crop;
>   
>   	if (fse->index > 1 || fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
>   		return -EINVAL;
>   
> -	__crop = __ov5693_get_pad_crop(ov5693, state, fse->pad, fse->which);
> -	if (!__crop)
> -		return -EINVAL;
> +	__crop = v4l2_subdev_state_get_crop(state, fse->pad);
>   
>   	fse->min_width = __crop->width / (fse->index + 1);
>   	fse->min_height = __crop->height / (fse->index + 1);
> @@ -1088,7 +1025,7 @@ static const struct v4l2_subdev_video_ops ov5693_video_ops = {
>   static const struct v4l2_subdev_pad_ops ov5693_pad_ops = {
>   	.enum_mbus_code = ov5693_enum_mbus_code,
>   	.enum_frame_size = ov5693_enum_frame_size,
> -	.get_fmt = ov5693_get_fmt,
> +	.get_fmt = v4l2_subdev_get_fmt,
>   	.set_fmt = ov5693_set_fmt,
>   	.get_selection = ov5693_get_selection,
>   	.set_selection = ov5693_set_selection,
> @@ -1100,6 +1037,19 @@ static const struct v4l2_subdev_ops ov5693_ops = {
>   	.pad = &ov5693_pad_ops,
>   };
>   
> +static int ov5693_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state)
> +{
> +	*v4l2_subdev_state_get_crop(state, 0) = ov5693_default_crop;
> +	*v4l2_subdev_state_get_format(state, 0) = ov5693_default_fmt;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops ov5693_internal_ops = {
> +	.init_state = ov5693_init_state,
> +};
> +
>   /* Sensor and Driver Configuration Functions */
>   
>   static int ov5693_init_controls(struct ov5693_device *ov5693)
> @@ -1107,11 +1057,15 @@ static int ov5693_init_controls(struct ov5693_device *ov5693)
>   	const struct v4l2_ctrl_ops *ops = &ov5693_ctrl_ops;
>   	struct ov5693_v4l2_ctrls *ctrls = &ov5693->ctrls;
>   	struct v4l2_fwnode_device_properties props;
> +	const struct v4l2_mbus_framefmt *format = &ov5693_default_fmt;

Descending order of line length please.

Thanks
Dan

>   	int vblank_max, vblank_def;
>   	int exposure_max;
> +	unsigned int vts;
>   	int hblank;
>   	int ret;
>   
> +	vts = __ov5693_calc_vts(format->height);
> +
>   	ret = v4l2_ctrl_handler_init(&ctrls->handler, 12);
>   	if (ret)
>   		return ret;
> @@ -1130,7 +1084,7 @@ static int ov5693_init_controls(struct ov5693_device *ov5693)
>   					      OV5693_PIXEL_RATE);
>   
>   	/* Exposure */
> -	exposure_max = ov5693->mode.vts - OV5693_INTEGRATION_TIME_MARGIN;
> +	exposure_max = vts - OV5693_INTEGRATION_TIME_MARGIN;
>   	ctrls->exposure = v4l2_ctrl_new_std(&ctrls->handler, ops,
>   					    V4L2_CID_EXPOSURE,
>   					    OV5693_EXPOSURE_MIN, exposure_max,
> @@ -1158,7 +1112,7 @@ static int ov5693_init_controls(struct ov5693_device *ov5693)
>   	ctrls->vflip = v4l2_ctrl_new_std(&ctrls->handler, ops,
>   					 V4L2_CID_VFLIP, 0, 1, 1, 0);
>   
> -	hblank = OV5693_FIXED_PPL - ov5693->mode.format.width;
> +	hblank = OV5693_FIXED_PPL - format->width;
>   	ctrls->hblank = v4l2_ctrl_new_std(&ctrls->handler, ops,
>   					  V4L2_CID_HBLANK, hblank,
>   					  hblank, 1, hblank);
> @@ -1166,8 +1120,8 @@ static int ov5693_init_controls(struct ov5693_device *ov5693)
>   	if (ctrls->hblank)
>   		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   
> -	vblank_max = OV5693_TIMING_MAX_VTS - ov5693->mode.format.height;
> -	vblank_def = ov5693->mode.vts - ov5693->mode.format.height;
> +	vblank_max = OV5693_TIMING_MAX_VTS - format->height;
> +	vblank_def = vts - format->height;
>   	ctrls->vblank = v4l2_ctrl_new_std(&ctrls->handler, ops,
>   					  V4L2_CID_VBLANK,
>   					  OV5693_TIMING_MIN_VTS,
> @@ -1195,8 +1149,6 @@ static int ov5693_init_controls(struct ov5693_device *ov5693)
>   	if (ret)
>   		goto err_free_handler;
>   
> -	/* Use same lock for controls as for everything else. */
> -	ctrls->handler.lock = &ov5693->lock;
>   	ov5693->sd.ctrl_handler = &ctrls->handler;
>   
>   	return 0;
> @@ -1312,9 +1264,8 @@ static int ov5693_probe(struct i2c_client *client)
>   	if (ret)
>   		return ret;
>   
> -	mutex_init(&ov5693->lock);
> -
>   	v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
> +	ov5693->sd.internal_ops = &ov5693_internal_ops;
>   
>   	ov5693->xvclk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
>   	if (IS_ERR(ov5693->xvclk))
> @@ -1340,10 +1291,6 @@ static int ov5693_probe(struct i2c_client *client)
>   	ov5693->pad.flags = MEDIA_PAD_FL_SOURCE;
>   	ov5693->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>   
> -	ov5693->mode.crop = ov5693_default_crop;
> -	ov5693->mode.format = ov5693_default_fmt;
> -	ov5693->mode.vts = __ov5693_calc_vts(ov5693->mode.format.height);
> -
>   	ret = ov5693_init_controls(ov5693);
>   	if (ret)
>   		return ret;
> @@ -1352,6 +1299,11 @@ static int ov5693_probe(struct i2c_client *client)
>   	if (ret)
>   		goto err_ctrl_handler_free;
>   
> +	ov5693->sd.state_lock = ov5693->ctrls.handler.lock;
> +	ret = v4l2_subdev_init_finalize(&ov5693->sd);
> +	if (ret)
> +		goto err_media_entity_cleanup;
> +
>   	/*
>   	 * We need the driver to work in the event that pm runtime is disable in
>   	 * the kernel, so power up and verify the chip now. In the event that
> @@ -1361,7 +1313,7 @@ static int ov5693_probe(struct i2c_client *client)
>   
>   	ret = ov5693_sensor_powerup(ov5693);
>   	if (ret)
> -		goto err_media_entity_cleanup;
> +		goto err_subdev_cleanup;
>   
>   	ret = ov5693_detect(ov5693);
>   	if (ret)
> @@ -1389,6 +1341,8 @@ static int ov5693_probe(struct i2c_client *client)
>   	pm_runtime_put_noidle(&client->dev);
>   err_powerdown:
>   	ov5693_sensor_powerdown(ov5693);
> +err_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov5693->sd);
>   err_media_entity_cleanup:
>   	media_entity_cleanup(&ov5693->sd.entity);
>   err_ctrl_handler_free:
> @@ -1403,9 +1357,9 @@ static void ov5693_remove(struct i2c_client *client)
>   	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>   
>   	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
>   	media_entity_cleanup(&ov5693->sd.entity);
>   	v4l2_ctrl_handler_free(&ov5693->ctrls.handler);
> -	mutex_destroy(&ov5693->lock);
>   
>   	/*
>   	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
> 
> base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8

