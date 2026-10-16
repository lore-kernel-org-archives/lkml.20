Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEED4D9F83;
	Fri, 16 Oct 2026 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166100; cv=none; b=MwbOy3w/NFGRDS0VEqb7m+/p+px2+IvIWKnd8tNeJx9g+2zrJaIaBUJWpkDhk1BCWrMUIolcBL0F6hDaJzP9LbYJci9ZfTq6fOHSKkLkfBXI8kJVhW8qhDuYPaEtCnBiIvw2Rbkj5Jo4DUJefaMLrRPM5t1Lr0usSrqdbvPeU0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166100; c=relaxed/simple;
	bh=Xdei+vcdqaJ8HgjkkCIgbya3PESJtw5kHCArCvDBoIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shBZI1Tk3lf4xoVDbLm95VstLrDrIJ9LRvm2WY6tvL5iRXfOsDcxNFP8UY8EVSVJllzMGAI8Sf2jd0xbSvJhBcmwnz6yXRlSZhZ9pD5XqXX5tJ96KNQaxiWo6jptY4C2+o6Q42csYCRIh9g25tlX20SDpPdpeHXHGpxGtjIoMag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6rjFwHX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6rjFwHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62571F000C4;
	Fri, 16 Oct 2026 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792166098;
	bh=3CcBDr1EUEcBxKSEh3/DqlDcV4BFLnycNszQvEf+Xck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=g6rjFwHXo4AT5T3atnm0595kVKnNlxPZTVjD64BBuYWAae+OkUbRPaa9F9FNoGW8l
	 zTHk7g0coatmdjZBCf0zEiupZvFnzInql4dWLfNm1CpizKDESBPS4SqJiD0ZzqW1Kj
	 G6i3YZHAvU1TOPUerfu5Sv+/1hefoX68Sq04odeg4ztGvzG1oAARZ1bFuwZ23wQetk
	 OGKEhpkUj7eVG3Zzq+gDpCwoq0rk0j1XuycvR7Tou6aAff+0Lh6hgTX/uEXMR6NGdi
	 7/3aEfAVkRwgRatMyFZlfu324PouU7IPYzWIP+KA+hejQgPDhwTbd8k2OeT/f8NtSE
	 O9JFJ/b8zU7Jg==
Message-ID: <11f1a19d-7d57-497f-826e-901f9f88b99b@kernel.org>
Date: Fri, 16 Oct 2026 16:54:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] media: i2c: imx681: Add C-PHY support
To: geocausa@gmail.com, Sergey Lebedev <lsa.uz@pm.me>,
 Andre Gilerson <andre.gilerson@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com>
 <2fcZAV3RJkKbTtYsFAPl3PHcutPs1Q0cRRgC_h5T3wGYGsXdn1HJHZ2D-pWGjaunwr2NkMKED9Nw-yELQkYTfg==@protonmail.internalid>
 <20261015-imx681-x1e-v1-2-fd22f5f3b0c5@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261015-imx681-x1e-v1-2-fd22f5f3b0c5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2026 22:25, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The IMX681 also drives MIPI C-PHY. On the Surface Pro 11 with a
> Snapdragon X Elite it reaches the CAMSS CSIPHY over one C-PHY trio,
> which Windows runs at 2.4 Gsym/s.

How do we know that ?

> Only the signalling, the lane count and the output PLL differ from the
> two-lane D-PHY set-up of the Intel model. The read-out window and the
> pixel array PLL stay as they are, and so does the pixel rate: Windows on
> the Snapdragon model programs the same video timing PLL, and its line and
> frame lengths give 720 MHz at 30 fps too.

How do we know what windows does on the Snapdragon ? Has the file been 
analysed ?

Are we inferring what Windows does or asserting what it does ?

  Describe each bus by those
> three values and its link frequency, pick the one the endpoint asks for,
> and write them after the register list:
> 
> - CSI_SIGNALING_MODE: 2 for D-PHY, 3 for C-PHY, as CCS numbers them;
> - CSI_LANE_MODE: the number of lanes or trios, minus one;
> - OP_PLL_MULTIPLIER: 303 for D-PHY as before, 375 for C-PHY, so
>    19.2 MHz / 3 * 375 = 2400 Msym/s, a 1.2 GHz link frequency by the V4L2
>    convention for C-PHY (half the symbol rate).
> 
> CSI_LANE_MODE was not written before. It is now written for D-PHY too,
> with the value two lanes need.
> 
> Tested on the Surface Pro 11 (X1E80100), with the endpoint on one C-PHY
> trio at 1.2 GHz and CAMSS capturing raw frames over CSIPHY2, CSID1 and an
> RDI interface: 3844x2640 at 29.99 fps, the colour-bar test pattern
> arrives intact, a scene captures, and VBLANK still sets the frame rate
> (8.19 fps at 9000 lines). The D-PHY path is not tested here.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   drivers/media/i2c/imx681.c | 95 +++++++++++++++++++++++++++++++++-------------
>   1 file changed, 69 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> index 6c8e4b3..c660f06 100644
> --- a/drivers/media/i2c/imx681.c
> +++ b/drivers/media/i2c/imx681.c
> @@ -77,6 +77,9 @@
>   #define IMX681_REG_LINE_LENGTH		CCI_REG16(0x0342)
>   #define IMX681_REG_ORIENTATION		CCI_REG8(0x0101)
>   #define IMX681_REG_CSI_SIGNALING_MODE	CCI_REG8(0x0111)
> +#define IMX681_CSI_SIGNALING_DPHY	0x02
> +#define IMX681_CSI_SIGNALING_CPHY	0x03

How do we know 0x03 means CPHY ? Could it bit 0x01 for example ?

The commit log needs to elucidate that information - I guess, I tested, 
the LLM told me so, reverse engineered the windows driver binaries - 
whatever.

I'm not concerned about the provenance of the information more its 
correctness.

> +#define IMX681_REG_CSI_LANE_MODE	CCI_REG8(0x0114)

Same here. I _suspect_ the answer is opening the sensor init files on 
the windows partition, matching the patterns and inferring the missing 
register but, lets document that process somewhere.

>   #define IMX681_REG_EXTCLK_FREQ_MHZ	CCI_REG16(0x0136)
>   #define IMX681_REG_PLL_MULTIPLIER	CCI_REG16(0x0306)
>   #define IMX681_REG_OP_PRE_PLL_CLK_DIV	CCI_REG16(0x030c)
> @@ -93,7 +96,6 @@
>   /* PLL, as the Windows traces configure it and the part reads back. */
>   #define IMX681_PLL_MULTIPLIER		225
>   #define IMX681_OP_PRE_PLL_CLK_DIV	3
> -#define IMX681_OP_PLL_MULTIPLIER	303
> 
>   /*
>    * Where the read-out window sits in the pixel array, and how much array
> @@ -119,16 +121,44 @@
>   #define IMX681_FRAME_LENGTH_LINES	3177	/* 0x0C69 */
>   #define IMX681_FRAME_LENGTH_MAX		0xFFFF	/* 24-bit reg, limit to 16-bit */
> 
> -/* MIPI lanes */
> -#define IMX681_NUM_LANES		2
> -
>   /*
> - * Link frequency derived from PLL settings in Windows trace:
> - * EXCK=19.2MHz, PLL2_MUL=303, PLL2_PRE_DIV=3
> - * OP output = 19.2 * 303 / 3 = 1939.2 MHz (MIPI bit rate)
> - * Link freq = 1939.2 / 2 (DDR) = 969.6 MHz
> + * The part drives either bus. Only the signalling, the lane count and the
> + * output PLL differ between them: the pixel array, its PLL and the read-out
> + * window stay as they are, so the pixel rate below holds for both.
>    */
> -#define IMX681_LINK_FREQ		969600000LL
> +struct imx681_bus {
> +	enum v4l2_mbus_type type;
> +	unsigned int lanes;
> +	u8 signaling_mode;
> +	u16 op_pll_multiplier;
> +	s64 link_freq;
> +};
> +
> +static const struct imx681_bus imx681_buses[] = {
> +	/*
> +	 * D-PHY, two lanes, as on the Surface Pro 11 for Business (Intel):
> +	 * 19.2 MHz / 3 * 303 = 1939.2 Mbps per lane, so a 969.6 MHz link.
> +	 */
> +	{
> +		.type = V4L2_MBUS_CSI2_DPHY,
> +		.lanes = 2,
> +		.signaling_mode = IMX681_CSI_SIGNALING_DPHY,
> +		.op_pll_multiplier = 303,
> +		.link_freq = 969600000,
> +	},
> +	/*
> +	 * C-PHY, one trio, as on the Surface Pro 11 (Snapdragon X Elite):
> +	 * 19.2 MHz / 3 * 375 = 2400 Msym/s, and a C-PHY link frequency is half
> +	 * the symbol rate.
> +	 */
> +	{
> +		.type = V4L2_MBUS_CSI2_CPHY,
> +		.lanes = 1,
> +		.signaling_mode = IMX681_CSI_SIGNALING_CPHY,
> +		.op_pll_multiplier = 375,
> +		.link_freq = 1200000000,
> +	},
> +};
> 
>   /*
>    * The pixel rate cannot be derived from the CSI-2 link: this part runs two
> @@ -154,21 +184,15 @@
> 
>   #define IMAGE_PAD			0
> 
> -static const s64 imx681_link_frequencies[] = {
> -	IMX681_LINK_FREQ,
> -};
> -
>   /*
>    * Sensor init register sequence, captured from Windows I2C traces.
>    * This configures the sensor for 3844x2640 RAW10 output at ~30fps
> - * with 2-lane MIPI CSI-2, 19.2MHz input clock.
> + * from a 19.2MHz input clock; imx681_start_streaming() adds the bus.
>    */
>   static const struct cci_reg_sequence imx681_init_regs[] = {
>   	{ IMX681_REG_EXTCLK_FREQ_MHZ, IMX681_XCLK_FREQ_ENC },
>   	/* Vendor specific configuration */
>   	{ CCI_REG16(0x002C), 0x0505 },
> -	/* 0x02 is D-PHY, which is the only mode this part offers. */
> -	{ IMX681_REG_CSI_SIGNALING_MODE, 0x02 },
>   	/* Vendor access unlock sequence */
>   	{ CCI_REG8(0x30EB),  0x05 },
>   	{ CCI_REG8(0x30EB),  0x0C },
> @@ -197,11 +221,10 @@ static const struct cci_reg_sequence imx681_init_regs[] = {
>   	 * low byte of PLL_MULTIPLIER and 0x030d the low byte of
>   	 * OP_PRE_PLL_CLK_DIV, and each was right only while its high byte
>   	 * held the reset value. Written whole, and the part reads back
> -	 * 225, 3 and 303 at the operating point either way.
> +	 * 225 and 3 at the operating point either way.
>   	 */
>   	{ IMX681_REG_PLL_MULTIPLIER, IMX681_PLL_MULTIPLIER },
>   	{ IMX681_REG_OP_PRE_PLL_CLK_DIV, IMX681_OP_PRE_PLL_CLK_DIV },
> -	{ IMX681_REG_OP_PLL_MULTIPLIER, IMX681_OP_PLL_MULTIPLIER },
>   	/* Vendor specific registers */
>   	{ CCI_REG8(0x7E9B),  0x02 },
>   	{ CCI_REG8(0x0368),  0x00 },
> @@ -259,6 +282,7 @@ struct imx681 {
>   	struct v4l2_ctrl *hflip;
>   	struct v4l2_ctrl *vflip;
> 
> +	const struct imx681_bus *bus;
>   	unsigned long link_freq_bitmap;
>   };
> 
> @@ -508,6 +532,17 @@ static int imx681_start_streaming(struct imx681 *imx681)
>   		return ret;
>   	}
> 
> +	cci_write(imx681->cci, IMX681_REG_CSI_SIGNALING_MODE,
> +		  imx681->bus->signaling_mode, &ret);
> +	cci_write(imx681->cci, IMX681_REG_CSI_LANE_MODE,
> +		  imx681->bus->lanes - 1, &ret);
> +	cci_write(imx681->cci, IMX681_REG_OP_PLL_MULTIPLIER,
> +		  imx681->bus->op_pll_multiplier, &ret);
> +	if (ret) {
> +		dev_err(imx681->dev, "failed to configure the bus: %d\n", ret);
> +		return ret;
> +	}
> +
>   	/* Wait for sensor to stabilise after configuration */
>   	usleep_range(IMX681_INIT_DELAY_US, IMX681_INIT_DELAY_US + 1000);
> 
> @@ -711,7 +746,7 @@ static int imx681_init_controls(struct imx681 *imx681)
>   					   V4L2_CID_LINK_FREQ,
>   					   __fls(imx681->link_freq_bitmap),
>   					   __ffs(imx681->link_freq_bitmap),
> -					   imx681_link_frequencies);
> +					   &imx681->bus->link_freq);
>   	if (link_freq)
>   		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> @@ -814,9 +849,10 @@ static int imx681_parse_endpoint(struct imx681 *imx681)
>   {
>   	struct fwnode_handle *fwnode = dev_fwnode(imx681->dev);
>   	struct v4l2_fwnode_endpoint bus_cfg = {
> -		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +		.bus_type = V4L2_MBUS_UNKNOWN,
>   	};
>   	struct fwnode_handle *ep;
> +	unsigned int lanes;
>   	int ret;
> 
>   	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> @@ -827,19 +863,26 @@ static int imx681_parse_endpoint(struct imx681 *imx681)
>   		return dev_err_probe(imx681->dev, ret,
>   				     "failed to parse endpoint\n");
> 
> -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX681_NUM_LANES) {
> +	/* Without a bus-type, an endpoint with data-lanes parses as D-PHY. */
> +	lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> +	for (unsigned int i = 0; i < ARRAY_SIZE(imx681_buses); i++) {
> +		if (imx681_buses[i].type == bus_cfg.bus_type &&
> +		    imx681_buses[i].lanes == lanes)
> +			imx681->bus = &imx681_buses[i];
> +	}
> +
> +	if (!imx681->bus) {
>   		ret = dev_err_probe(imx681->dev, -EINVAL,
> -				    "expected %d data lanes, got %d\n",
> -				    IMX681_NUM_LANES,
> -				    bus_cfg.bus.mipi_csi2.num_data_lanes);
> +				    "unsupported bus: %s with %u lanes\n",
> +				    bus_cfg.bus_type == V4L2_MBUS_CSI2_CPHY ?
> +				    "C-PHY" : "D-PHY", lanes);
>   		goto done;
>   	}
> 
>   	ret = v4l2_link_freq_to_bitmap(imx681->dev,
>   				       bus_cfg.link_frequencies,
>   				       bus_cfg.nr_of_link_frequencies,
> -				       imx681_link_frequencies,
> -				       ARRAY_SIZE(imx681_link_frequencies),
> +				       &imx681->bus->link_freq, 1,
>   				       &imx681->link_freq_bitmap);
>   	if (ret)
>   		ret = dev_err_probe(imx681->dev, ret,
> 
> --
> 2.53.0

