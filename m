Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D85A3E168C;
	Mon, 12 Oct 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799314; cv=none; b=TI/JmBJyHzu5Fm/2iEXcmhng1i1yINVHSP+FsOWVQhLl6/GXaoG0WOBe5bV2imzDJoHmDl9EEdkM60Je68ukLJCYs7TFBdkwTg0B16/mNUbrlMp/cmWdKtsMMI+DmaZ6lEfl16nuPr+8yE3xRwNBhuOTJ6XsyOi7iZKAMaS5j+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799314; c=relaxed/simple;
	bh=mpuYQsI6xWk3hX2nX9RHy3ytd04GSKnCGPLAttYUXx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfcc0eE+Qtmk+IbLrP0IMTn8IDEsc91IJmFM944Y5tiSFJwZW7cFijZZNNrXNQXxbskZODd/mUkj5FxnxbXdXFFhYSNoyYyPCN/flTmt6TrC8tpRYXVtmVDCS69oAPj5GrwFsQZrzhw2z5VqSsjGcIJG9fjD3Ts2fhD/fJWW8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgHLz8zQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgHLz8zQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791799312; x=1823335312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mpuYQsI6xWk3hX2nX9RHy3ytd04GSKnCGPLAttYUXx4=;
  b=SgHLz8zQXbWeUJcpQcVqVf6YF/CxbN9ZiPZexpEQZ+zywrIb0o+c6L4Y
   7ewOV7H7U4A5JVjxFd1AF/8vwW6IAqYGydv1jdK9P4DkoltQ2gl/98OOo
   k7Ra/LdAUWm/D/cWQe9FSiclhEM8gseqBC1jDlTARF3ub5WLrZ8QT4ywQ
   GPSRIR6smRw9/DKOFWeOlF1hk3YnSdB9B/fl0f54wufFl25IYc3SZaFuL
   wtKVo2SKII0b9///kot8QcJ7ED5HvNsWcXY59i4tQQxxbSif86LsxK9Sk
   AiTDazfnpmEu8MZ9Xm4j8YvbOwLdh8EM+qf2UvBfZN3suRp8+wsERD9Uf
   Q==;
X-CSE-ConnectionGUID: c7O2ngFaR2Gy8lNRJufXnw==
X-CSE-MsgGUID: efrerJCtSVyHKDqbHKPoVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="528029"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="528029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:01:46 -0700
X-CSE-ConnectionGUID: m/KwgN84SPaRxWl5T2UkcA==
X-CSE-MsgGUID: wRRGoWXGRlG3wnM+ClWRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1163697"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:01:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 522AB121B9E;
	Mon, 12 Oct 2026 13:01:46 +0300 (EEST)
Date: Mon, 12 Oct 2026 13:01:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: max.bretschneider@leica-geosystems.com
Cc: Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov08d10: add get_selection support
Message-ID: <asywCh3X0yJVcxRd@kekkonen.localdomain>
References: <20261011-ov08d10-get-selection-v1-1-5debe6436765@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011-ov08d10-get-selection-v1-1-5debe6436765@leica-geosystems.com>

Hi Max,

Thank you for the patch.

On Sun, Oct 11, 2026 at 09:55:23PM +0200, Max Bretschneider via B4 Relay wrote:
> From: Max Bretschneider <max.bretschneider@leica-geosystems.com>
> 
> The driver does not implement .get_selection, so it never reports the
> analogue crop rectangle of the active mode. Userspace has no way to
> learn which region of the pixel array a given mode reads out, and
> cannot assume a fixed one, because the modes differ: the full mode
> reads 3280x2460 at offset (4,8), while the 3264x2448 and the 2x2
> binned 1632x1224 modes read 3264x2448 at offset (12,16).
> 
> Consumers that derive the sensor scale from the analogue crop and the
> output size therefore compute a wrong result for the cropped and
> binned modes, and may reject those configurations.
> 
> Track the analogue crop rectangle per mode, store it in the subdev
> state when the format is set, and report it through .get_selection.
> Also report V4L2_SEL_TGT_CROP_DEFAULT, V4L2_SEL_TGT_CROP_BOUNDS and
> V4L2_SEL_TGT_NATIVE_SIZE from the pixel array geometry. Implement
> .init_state so a newly allocated state holds a valid format and crop,
> and add the v4l2_subdev_init_finalize() and v4l2_subdev_cleanup()
> calls required to use the subdev active state.
> 
> The pixel array geometry and the per-mode offsets are taken from the
> sensor datasheet and the recommended reference register sets.
> 
> Signed-off-by: Max Bretschneider <max.bretschneider@leica-geosystems.com>
> ---
> Tested on a Hexagon/Leica CS50 (i.MX8MP, rkisp1) running 6.16.12 with the
> equivalent of this patch applied, where it fixes configuration of the 2x2
> binned 1632x1224 mode with libcamera's rkisp1 CAC algorithm enabled.
> Compile-tested against media/next.

Can you test on a newer kernel? That being said, there are unlikely to be
issues without that, but it's better to be sure.

> 
> Modelled on imx335.
> ---
>  drivers/media/i2c/ov08d10.c | 74 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
> index 0710d2243cc0..b32a1246df45 100644
> --- a/drivers/media/i2c/ov08d10.c
> +++ b/drivers/media/i2c/ov08d10.c
> @@ -65,6 +65,14 @@
>  #define OV08D10_REG_FLIP_OPT			0x32
>  #define OV08D10_REG_FLIP_MASK			0x3
>  
> +/* OV08D10 native and active pixel array size */
> +#define OV08D10_NATIVE_WIDTH			3288
> +#define OV08D10_NATIVE_HEIGHT			2476
> +#define OV08D10_PIXEL_ARRAY_LEFT		4
> +#define OV08D10_PIXEL_ARRAY_TOP			8
> +#define OV08D10_PIXEL_ARRAY_WIDTH		3280
> +#define OV08D10_PIXEL_ARRAY_HEIGHT		2464
> +
>  #define to_ov08d10(_sd)		container_of(_sd, struct ov08d10, sd)
>  
>  struct ov08d10_reg {
> @@ -110,6 +118,9 @@ struct ov08d10_mode {
>  
>  	/* Number of data lanes */
>  	u8 data_lanes;
> +
> +	/* Analogue crop rectangle, in native sensor coordinates */
> +	struct v4l2_rect crop;
>  };
>  
>  /* 3280x2460, 3264x2448 need 720Mbps/lane, 2 lanes - 19.2 MHz */
> @@ -630,6 +641,7 @@ static const struct ov08d10_lane_cfg lane_cfg_2 = {
>  		},
>  		.link_freq_index = 0,
>  		.data_lanes = 2,
> +		.crop = { .left =  4, .top =  8, .width = 3280, .height = 2460 },
>  	},
>  	{
>  		.width = 3264,
> @@ -643,6 +655,7 @@ static const struct ov08d10_lane_cfg lane_cfg_2 = {
>  		},
>  		.link_freq_index = 0,
>  		.data_lanes = 2,
> +		.crop = { .left = 12, .top = 16, .width = 3264, .height = 2448 },
>  	},
>  	{
>  		.width = 1632,
> @@ -656,6 +669,7 @@ static const struct ov08d10_lane_cfg lane_cfg_2 = {
>  		},
>  		.link_freq_index = 1,
>  		.data_lanes = 2,
> +		.crop = { .left = 12, .top = 16, .width = 3264, .height = 2448 },
>  	}}
>  };
>  
> @@ -955,6 +969,36 @@ static int ov08d10_set_ctrl(struct v4l2_ctrl *ctrl)
>  	return ret;
>  }
>  
> +static int ov08d10_get_selection(struct v4l2_subdev *sd,
> +				 const struct v4l2_subdev_client_info *ci,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
> +		return 0;
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.left = 0;
> +		sel->r.top = 0;
> +		sel->r.width = OV08D10_NATIVE_WIDTH;
> +		sel->r.height = OV08D10_NATIVE_HEIGHT;
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.left = OV08D10_PIXEL_ARRAY_LEFT;
> +		sel->r.top = OV08D10_PIXEL_ARRAY_TOP;
> +		sel->r.width = OV08D10_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = OV08D10_PIXEL_ARRAY_HEIGHT;
> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static const struct v4l2_ctrl_ops ov08d10_ctrl_ops = {
>  	.s_ctrl = ov08d10_set_ctrl,
>  };
> @@ -1194,6 +1238,9 @@ static int ov08d10_set_format(struct v4l2_subdev *sd,
>  
>  	mutex_lock(&ov08d10->mutex);
>  	ov08d10_update_pad_format(ov08d10, mode, &fmt->format);
> +
> +	*v4l2_subdev_state_get_crop(sd_state, fmt->pad) = mode->crop;
> +
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =
>  								fmt->format;
> @@ -1297,6 +1344,19 @@ static int ov08d10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	return 0;
>  }
>  
> +static int ov08d10_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state)
> +{
> +	struct ov08d10 *ov08d10 = to_ov08d10(sd);
> +	const struct ov08d10_mode *mode = &ov08d10->priv_lane->sp_modes[0];
> +
> +	*v4l2_subdev_state_get_crop(sd_state, 0) = mode->crop;
> +	ov08d10_update_pad_format(ov08d10, mode,
> +				  v4l2_subdev_state_get_format(sd_state, 0));
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_video_ops ov08d10_video_ops = {
>  	.s_stream = ov08d10_set_stream,
>  };
> @@ -1306,6 +1366,7 @@ static const struct v4l2_subdev_pad_ops ov08d10_pad_ops = {
>  	.get_fmt = ov08d10_get_format,
>  	.enum_mbus_code = ov08d10_enum_mbus_code,
>  	.enum_frame_size = ov08d10_enum_frame_size,
> +	.get_selection = ov08d10_get_selection,

It'd be nice to have the same ordering as in the driver (and also not place
the get_selection callback in the middle of control handling).

>  };
>  
>  static const struct v4l2_subdev_ops ov08d10_subdev_ops = {
> @@ -1315,6 +1376,7 @@ static const struct v4l2_subdev_ops ov08d10_subdev_ops = {
>  
>  static const struct v4l2_subdev_internal_ops ov08d10_internal_ops = {
>  	.open = ov08d10_open,
> +	.init_state = ov08d10_init_state,
>  };
>  
>  static int ov08d10_power_off(struct device *dev)
> @@ -1470,6 +1532,7 @@ static void ov08d10_remove(struct i2c_client *client)
>  	struct ov08d10 *ov08d10 = to_ov08d10(sd);
>  
>  	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&sd->entity);
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  	pm_runtime_disable(ov08d10->dev);
> @@ -1565,17 +1628,26 @@ static int ov08d10_probe(struct i2c_client *client)
>  	pm_runtime_set_active(ov08d10->dev);
>  	pm_runtime_enable(ov08d10->dev);
>  
> +	ret = v4l2_subdev_init_finalize(&ov08d10->sd);

Can you convert this driver to fully utilise sub-device state, as you're
initialising it here?

There's probably not much to do, but in particular the active format should
be stored in sub-device state and the control handler's lock be used as the
state lock. Also storing the active mode in the context struct would be
nice to avoid. These should constitute a separate patch (that also includes
init_finalize()/cleanup() calls) before this one.

> +	if (ret) {
> +		dev_err(ov08d10->dev, "failed to init subdev state: %d\n", ret);
> +		goto probe_error_media_entity_cleanup;
> +	}
> +
>  	ret = v4l2_async_register_subdev_sensor(&ov08d10->sd);
>  	if (ret < 0) {
>  		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d\n",
>  			ret);
> -		goto probe_error_media_entity_cleanup;
> +		goto probe_error_subdev_cleanup;
>  	}
>  
>  	pm_runtime_idle(ov08d10->dev);
>  
>  	return 0;
>  
> +probe_error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov08d10->sd);
> +
>  probe_error_media_entity_cleanup:
>  	pm_runtime_disable(ov08d10->dev);
>  	pm_runtime_set_suspended(ov08d10->dev);
> 

-- 
Kind regards,

Sakari Ailus
