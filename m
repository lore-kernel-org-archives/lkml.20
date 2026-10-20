Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488897;
	b=PqIq4OuA4KG3avKorPgenQIA1f5zTQVnYC6ctoHs8U8vHBCKFWWORNXVpyIPrQJKEhR7
	 4goCF0WDzjJWnNewpU28D0MBlPY9zgc65A87MjwnMperaF/NJValEcoESNp+GsRF1GVk6
	 kVXQue4vWiO912NISn8wJH1rRVOH4KP7zJDlx59Mhbrf1NJJRHC8ZUwex9r3OVA5On934
	 2H0HRfG9d87Hi/9p5h37yNcuZIhOl9iGjaFkAJNPC384aSiBcYzPKOq18LKj7B3MhXUv1
	 uzRxaqkhXdoIDW/v+W6uqtrI3SxJUG8Dm7AQ/KHJq5qEbEXq0u4HTiepcLjv4+Z/Rag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488897;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gg9KwglONhl4sqEoN/pFEHX2rkVtFXs9qTr/refZzNA=;
	b=xdsftq+BpLgiBRhtIVnOT6noRBznDWseOTrhmJcu3iD3vbgYJRL867soEKJI0Z2LFWcU
	 OtCtq7vP6XThEy1ePYEpzZ9RzO6d8kH1ex/O5MlMWoHEL2yh3V+5Oc7m1ZPzj8C9a4GNa
	 5r3kW3sO0r0eUje9HXel1+H97hs/5kfia9QCeGwptiXGGewEwJwlU4VOIstdJPpVL01Ay
	 d00TZziwIL+PxE0GjbycporuqwfWvbqfEIqP+mGc9lxFMleBM4HmJH66SIukA0e2qErOo
	 Vag8Nw27MnKl0bHk8b/QMqwndfc2L3RD0HjZmus6SeBiFyQ01Q8KJdJqJwT3WNTC4uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GuEML4Cr;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD008606A31A;
	Tue, 20 Oct 2026 09:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD008606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GuEML4Cr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792488896; x=1824024896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MlXj0tm1hJfphNGpiZM+PQ5hWEm7FJiyBORI2ugegUA=;
  b=GuEML4CrO8gg+9Drvj4iB5zpBM6XDi48k0K13B6BwC8kmrXhAU0tWKWT
   HguJ/u2S0bLSlvbIOEycPLGDScQXtQfLkDE/WEgQgzUXrnfcPSP/YQOSv
   abow+NWMzDcL7skZqinFr6vzsXKpViKyomn+ojoaAEks3ao2+A+PlZGhG
   ItWs633uJc9x2SygQ5zO79s/z7H/ghuvZvC+TmiBAzjzR7i6SbKLIxW+4
   u/H6GT0+e5coVFIGseqMMxAavfrCgtC2wGvGAyDs4oWi4ybzU+D1BmIjo
   OqigrKqY2soQ26Toez0sQCeXAzX9Ibg+6bEKsWOehoBxyacZzbW8P0eIR
   w==;
X-CSE-ConnectionGUID: S5ggO3DTR9+H/xkldTBUSw==
X-CSE-MsgGUID: MA87Zf6MQrWSa6obgjlz2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1179729"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1179729"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:34:56 -0700
X-CSE-ConnectionGUID: bbLMYpTqTMeclBZQrT++sA==
X-CSE-MsgGUID: gEPC5h/2T9CLAP5ehbMbEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2664115"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 02:34:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6A9BC11F7E8;
	Tue, 20 Oct 2026 12:34:50 +0300 (EEST)
Date: Tue, 20 Oct 2026 12:34:50 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 04/16] media: sony-starvis2: Parameterise the
 configuration to allow for other models
Message-ID: <atc1us1fj6MN6UfF@kekkonen.localdomain>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-4-75fcdb4163f3@raspberrypi.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-media-starvis2-v4-4-75fcdb4163f3@raspberrypi.com>

Hi Dave,

On Thu, Oct 15, 2026 at 04:57:30PM +0100, Dave Stevenson wrote:
> Several of the Sony Starvis 2 sensors are identical in the
> majority of their programming, but differ largely only in the
> size of pixel array and some timing parameters.
> 
> Parameterise those parameters in preparation for supporting other
> variants.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/sony-starvis2.c | 170 ++++++++++++++++++++++++--------------
>  1 file changed, 109 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
> index c4f590c489d9..189caac78066 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c
> @@ -51,17 +51,9 @@
>  /* Lane Count */
>  #define STARVIS2_REG_LANEMODE             CCI_REG8(0x3040)
>  
> -/*
> - * The internal readout clock runs at 74.25 MHz. In one cycle the AD reads 8
> - * pixels, thus giving us a rate of 74.25 * 8 = 594 MPix/s
> - */
> -#define IMX678_PIXEL_RATE		594000000
> -#define IMX678_PIX_PER_CLK		8
> -
>  /* VMAX - Frame Length in Lines */
>  #define STARVIS2_REG_VMAX                 CCI_REG24_LE(0x3028)
>  #define STARVIS2_VMAX_MAX                 0xfffff
> -#define IMX678_VMAX_DEFAULT             2250
>  
>  /* HMAX - Line Length in Cycles (8 Pixels) */
>  #define STARVIS2_REG_HMAX                 CCI_REG16_LE(0x302c)
> @@ -102,8 +94,6 @@
>  /* Sensor Identification */
>  #define STARVIS2_REG_MONOCHROME		CCI_REG8(0x4d18)
>  #define STARVIS2_TYPE			BIT(0)
> -#define IMX678_REG_MODULE_ID		CCI_REG16_LE(0x4d1c)
> -#define IMX678_ID			0x02a6
>  #define STARVIS2_MODULE_ID_DELAY	80000
>  
>  /* Common configuration registers */
> @@ -153,32 +143,11 @@
>  /* Subdev pads */
>  #define STARVIS2_SOURCE_PAD		0
>  
> -/* IMX678 native and active pixel array size. */
> -static const struct v4l2_rect imx678_native_area = {
> -	.top = 0,
> -	.left = 0,
> -	.width = 3857,
> -	.height = 2201,
> -};
> -
> -static const struct v4l2_rect imx678_active_area = {
> -	.top = 20,
> -	.left = 0,
> -	.width = 3856,
> -	.height = 2180,
> -};
> -
>  enum starvis2_type {
>  	STARVIS2_COLOR = 0,
>  	STARVIS2_MONOCHROME = 1,
>  };
>  
> -struct starvis2_model_info {
> -	enum starvis2_type type;
> -	const u32 *codes;
> -	unsigned int num_codes;
> -};
> -
>  enum starvis2_lanemode {
>  	STARVIS2_LANEMODE_2L = 1,
>  	STARVIS2_LANEMODE_4L = 3,
> @@ -207,7 +176,7 @@ static const u64 link_freqs[] = {
>  	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
>  };
>  
> -static const u16 min_hmax_4lane[] = {
> +static const u16 imx678_min_hmax_4lane[] = {
>  	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
>  	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
>  	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
> @@ -267,7 +236,7 @@ static const int starvis2_tpg_val[] = {
>  };
>  
>  /* Common configuration */
> -static const struct cci_reg_sequence common_regs[] = {
> +static const struct cci_reg_sequence imx678_common_regs[] = {
>  	{ STARVIS2_REG_THIN_V_EN, 0x00 },
>  	{ STARVIS2_REG_VCMODE, 0x01 },
>  	{ CCI_REG8(0x306b), 0x00 },
> @@ -650,16 +619,74 @@ static const u32 codes_monochrome[] = {
>  	MEDIA_BUS_FMT_Y12_1X12,
>  };
>  
> +struct starvis2_variant {
> +	const char *name;
> +	u32 id_reg;
> +	u32 id_mask;
> +	u32 id_value;
> +	struct v4l2_rect native_area;
> +	struct v4l2_rect active_area;
> +	u64 pixel_rate;
> +	unsigned int pix_per_clk;
> +	const struct cci_reg_sequence *common_regs;
> +	unsigned int num_common_regs;
> +	unsigned int vmax_default;
> +	const u16 *hmax_min;
> +};
> +
> +static const struct starvis2_variant imx678_variant_def = {
> +	.name = "imx678",
> +	.id_reg = CCI_REG16_LE(0x4d1c),
> +	.id_mask = 0x3ff,
> +	.id_value = 0x2a6,
> +	.native_area = {
> +		.top = 0,
> +		.left = 0,
> +		.width = 3857,
> +		.height = 2201,
> +	},
> +	.active_area = {
> +		.top = 20,
> +		.left = 0,
> +		.width = 3856,
> +		.height = 2180,
> +	},
> +	.pixel_rate = 594000000,
> +	.pix_per_clk = 8,
> +	.common_regs = imx678_common_regs,
> +	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
> +	.vmax_default = 2250,
> +	.hmax_min = imx678_min_hmax_4lane,
> +};
> +
> +struct starvis2_model_info {
> +	enum starvis2_type type;
> +	const u32 *codes;
> +	unsigned int num_codes;
> +	const struct starvis2_variant *variant;
> +
> +	const struct starvis2_model_info *auto_detect_colour;
> +	const struct starvis2_model_info *auto_detect_mono;
> +};
> +
>  static const struct starvis2_model_info imx678_aaqr_info = {
>  	.type = STARVIS2_COLOR,
>  	.codes = codes_bayer,
>  	.num_codes = ARRAY_SIZE(codes_bayer),
> +	.variant = &imx678_variant_def,
>  };
>  
>  static const struct starvis2_model_info imx678_aamr_info = {
>  	.type = STARVIS2_MONOCHROME,
>  	.codes = codes_monochrome,
>  	.num_codes = ARRAY_SIZE(codes_monochrome),
> +	.variant = &imx678_variant_def,
> +};
> +
> +static const struct starvis2_model_info imx678_autodetect_info = {
> +	.variant = &imx678_variant_def,
> +	.auto_detect_colour = &imx678_aaqr_info,
> +	.auto_detect_mono = &imx678_aamr_info,
>  };
>  
>  static const char * const starvis2_supply_name[] = {
> @@ -674,6 +701,7 @@ struct starvis2 {
>  	struct regmap *cci;
>  
>  	const struct starvis2_model_info *info;
> +	const struct starvis2_variant *variant;
>  
>  	struct clk *xclk;
>  	u32 xclk_freq;
> @@ -770,7 +798,8 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
>  		cci_write(starvis2->cci, STARVIS2_REG_GAIN, ctrl->val, &ret);
>  		break;
>  	case V4L2_CID_HBLANK: {
> -		u32 hmax = (format->width + ctrl->val) / IMX678_PIX_PER_CLK;
> +		u32 hmax = (format->width + ctrl->val) /
> +						starvis2->variant->pix_per_clk;

This seems to be a pre-existing bug but it'd be nice to fix (and backport)
this before this set -- the control value is divided here by 8 but the
control's step is still 1. The step should reflect the granularity here.

>  
>  		cci_write(starvis2->cci, STARVIS2_REG_HMAX, hmax, &ret);
>  		break;
> @@ -851,18 +880,20 @@ static int starvis2_get_selection(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_selection *sel)
>  {
> +	struct starvis2 *starvis2 = to_starvis2(sd);
> +
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP:
>  		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
>  		return 0;
>  
>  	case V4L2_SEL_TGT_NATIVE_SIZE:
> -		sel->r = imx678_native_area;
> +		sel->r = starvis2->variant->native_area;
>  		return 0;
>  
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
> -		sel->r = imx678_active_area;
> +		sel->r = starvis2->variant->active_area;
>  		return 0;
>  	}
>  
> @@ -877,12 +908,12 @@ static int starvis2_init_state(struct v4l2_subdev *sd,
>  	struct v4l2_rect *crop;
>  
>  	crop = v4l2_subdev_state_get_crop(state, STARVIS2_SOURCE_PAD);
> -	*crop = imx678_active_area;
> +	*crop = starvis2->variant->active_area;
>  
>  	format = v4l2_subdev_state_get_format(state, STARVIS2_SOURCE_PAD);
>  	format->code = starvis2_default_mbus_code(starvis2);
> -	format->width = imx678_active_area.width;
> -	format->height = imx678_active_area.height;
> +	format->width = starvis2->variant->active_area.width;
> +	format->height = starvis2->variant->active_area.height;
>  	format->field = V4L2_FIELD_NONE;
>  	format->colorspace = V4L2_COLORSPACE_RAW;
>  	format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> @@ -896,8 +927,12 @@ static int starvis2_write_common(struct starvis2 *starvis2)
>  {
>  	int ret = 0;
>  
> -	cci_multi_reg_write(starvis2->cci, common_regs, ARRAY_SIZE(common_regs),
> -			    &ret);
> +	if (!starvis2->variant)
> +		/* Powered on during probe to do detection. Variant unknown. */
> +		return 0;
> +
> +	cci_multi_reg_write(starvis2->cci, starvis2->variant->common_regs,
> +			    starvis2->variant->num_common_regs, &ret);
>  
>  	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
>  		  &ret);
> @@ -923,10 +958,10 @@ static int starvis2_program_window(struct starvis2 *starvis2,
>  	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
>  	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
>  	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
> -		  crop->left - imx678_active_area.left, &ret);
> +		  crop->left - starvis2->variant->active_area.left, &ret);
>  	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);
>  	cci_write(starvis2->cci, STARVIS2_REG_PIX_VST,
> -		  crop->top - imx678_active_area.top, &ret);
> +		  crop->top - starvis2->variant->active_area.top, &ret);
>  	cci_write(starvis2->cci, STARVIS2_REG_PIX_VWIDTH, crop->height, &ret);
>  	cci_write(starvis2->cci, STARVIS2_REG_ADBIT, 0x01, &ret);
>  
> @@ -1080,11 +1115,16 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
>  	const struct starvis2_model_info *info;
> +	const struct starvis2_variant *variant;
>  	enum starvis2_type detected;
>  	int ret = 0;
>  	u64 val = 0;
>  
>  	info = device_get_match_data(&client->dev);
> +	if (!info)
> +		return -EINVAL;
> +
> +	variant = info->variant;
>  
>  	/*
>  	 * This sensor's ID registers become accessible 80ms after coming out
> @@ -1093,7 +1133,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
>  	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
>  	fsleep(STARVIS2_MODULE_ID_DELAY);
>  
> -	cci_read(starvis2->cci, IMX678_REG_MODULE_ID, &val, &ret);
> +	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
>  
>  	if (ret) {
>  		dev_err(&client->dev,
> @@ -1101,9 +1141,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
>  		return ret;
>  	}
>  
> -	if (val != IMX678_ID) {
> -		dev_err(&client->dev,
> -			"Chip ID mismatch: %x!=%llx\n", IMX678_ID, val);
> +	val &= variant->id_mask;
> +	if (val != variant->id_value) {
> +		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
> +			variant->id_value, val);
>  		return -ENXIO;
>  	}
>  
> @@ -1118,7 +1159,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
>  	detected = val & STARVIS2_TYPE;
>  
>  	/* Prefer to use sensor type specified in device tree */
> -	if (info) {
> +	if (info->codes) {
>  		starvis2->info = info;
>  		if (detected != info->type)
>  			dev_err(&client->dev,
> @@ -1127,11 +1168,12 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
>  				info->type == STARVIS2_COLOR ? "color" : "mono");
>  	} else {
>  		starvis2->info = detected == STARVIS2_MONOCHROME ?
> -			       &imx678_aamr_info : &imx678_aaqr_info;
> +			    info->auto_detect_mono : info->auto_detect_colour;
>  		dev_info(&client->dev,
>  			 "sensor type missing in DT; detected %s sensor\n",
>  			 detected == STARVIS2_MONOCHROME ? "mono" : "color");
>  	}
> +	starvis2->variant = starvis2->info->variant;
>  
>  	return 0;
>  }
> @@ -1162,7 +1204,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
>  {
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
>  	const u32 hmax_4lane =
> -			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
> +		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
>  	const u32 lane_scale =
>  			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
>  	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
> @@ -1181,13 +1223,14 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
>  	if (ret)
>  		return ret;
>  
> -	starvis2->vmax = IMX678_VMAX_DEFAULT;
> +	starvis2->vmax = starvis2->variant->vmax_default;
>  	hmax = hmax_4lane * lane_scale;
>  
>  	/* PIXEL_RATE is fixed and read-only */
>  	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
> -			  IMX678_PIXEL_RATE, IMX678_PIXEL_RATE, 1,
> -			  IMX678_PIXEL_RATE);
> +			  starvis2->variant->pixel_rate,
> +			  starvis2->variant->pixel_rate, 1,
> +			  starvis2->variant->pixel_rate);
>  
>  	/* LINK_FREQ is also read only */
>  	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
> @@ -1199,23 +1242,25 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
>  	if (link_freq)
>  		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> -	vblank = starvis2->vmax - imx678_active_area.height;
> -	max_vblank = STARVIS2_VMAX_MAX - imx678_active_area.height;
> +	vblank = starvis2->vmax - starvis2->variant->active_area.height;
> +	max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
>  	starvis2->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
>  					     V4L2_CID_VBLANK, vblank, max_vblank,
>  					     2, vblank);
>  
> -	hblank = hmax * IMX678_PIX_PER_CLK - imx678_active_area.width;
> -	max_hblank = STARVIS2_HMAX_MAX * IMX678_PIX_PER_CLK -
> -		     imx678_active_area.width;
> +	hblank = hmax * starvis2->variant->pix_per_clk -
> +					starvis2->variant->active_area.width;
> +	max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -
> +		     starvis2->variant->active_area.width;
>  	starvis2->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
>  					     V4L2_CID_HBLANK, hblank, max_hblank,
> -					     IMX678_PIX_PER_CLK, hblank);
> +					     starvis2->variant->pix_per_clk,
> +					     hblank);
>  
>  	starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
>  					       V4L2_CID_EXPOSURE,
>  					       STARVIS2_EXPOSURE_MIN,
> -					       IMX678_VMAX_DEFAULT -
> +					       starvis2->variant->vmax_default -
>  					       STARVIS2_SHR_MIN,
>  					       STARVIS2_EXPOSURE_STEP,
>  					       STARVIS2_EXPOSURE_DEFAULT);
> @@ -1356,6 +1401,9 @@ static int starvis2_probe(struct i2c_client *client)
>  	if (ret)
>  		goto error_power_off;
>  
> +	v4l2_i2c_subdev_set_name(&starvis2->sd, client, starvis2->variant->name,
> +				 NULL);
> +
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>  
> @@ -1436,7 +1484,7 @@ static const struct of_device_id starvis2_of_match[] = {
>  	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
>  	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
>  	/* for non-conforming DTs that rely on runtime check */
> -	{ .compatible = "sony,imx678" },
> +	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
>  	{ /* sentinel */ }
>  };
>  
> 

-- 
Kind regards,

Sakari Ailus
