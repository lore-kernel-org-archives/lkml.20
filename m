Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C63F4D2EC2;
	Mon,  7 Sep 2026 14:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792310; cv=none; b=UybcVCljzUSInL+PuYnPFWnwPiEtNNDIlXz0TpiuOLNXdkSUiROnPs3Lz3NTtLNo1dpCqS66/vw4cyfKhzHVD2wMRSBUpmC/9MZmEkhrHC3iv/BMRSEYqohTAb1w1lPFnZvTHBW5cZLyRTkga2hJiUhmBxsbAbsVuoNVQ7zNhQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792310; c=relaxed/simple;
	bh=f4uOChoUDuDluW1I+3irdTBU2DPl8H6042S/SUDz4ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7SFXmxeZM6ZZngEZrXCodXoLy+ZgJY330PEPqAXj94u+Nyjv1DVwCzXbOZjCqLbZZT98rlRrFnBWgPX9UP0Jz/rWNYuN876RPEDX2hqOh/jKxYXkA/dxKeg9ABEu5iEOktG4m4fX/fo2RK9Lr23VnGycwcKPd5FeSV5Gz/EPZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=l+6opFTa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=glaBP5//; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="l+6opFTa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="glaBP5//"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 2D860EC026E;
	Mon,  7 Sep 2026 10:45:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 07 Sep 2026 10:45:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788792307;
	 x=1788878707; bh=xozu++OwezfL4/XTOoolRf1cgWpl3NdyI4S3MfU2F0w=; b=
	l+6opFTag4SLjTta4JnaXKGx3kY3VTeHwp4Sl1D0Q5uY+zniV2ZJiDMfiyGwT56j
	YHIYh2CUUa5z70VLUMDSQZ4Sw8eXe32P8pEBjeCfeff5SwknESOM7SUJIpKlB/c5
	RPjqaJl2DpDZsTCyKEIfzyncU7Hc1nCsbFjusSZVuakMSk5+sCZ0etOZ9F9Rmj2n
	lO1BgbcLhAmykQGj29dW5vLdqAMZER/1NxE/y2uYx3Q+bmGTcv51KY7BvNqXgNYr
	N93zP3Dbg6xr5f922xgXhCUpj4rKL5QKiPCL6yETS1Cr2lrqGzVm7OzfhCLmf4i8
	L2RctUmK4/S2kdUyaS47WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788792307; x=
	1788878707; bh=xozu++OwezfL4/XTOoolRf1cgWpl3NdyI4S3MfU2F0w=; b=g
	laBP5//rZ6rC5o1Z2fO90W9l4U5LRgAAqPAKsJyJ3L7PXw+MhKZzMgp/j/d+sQkT
	PgwwsOI6959j0DPPi99HJe5e5pw+jIamY6thJX5Nxu4FMktt7VpxNuEwbRG11JbK
	scVxqm+FHR5wjKXbX0qsLfiraD4IULSiju2UmE5RAN8t7cR/lHqVuYuUI8UmAW0W
	uX7HcrVqkRCBoQ109dyAe96cpMbuGSSkUgVnA5CzNDczFKVORuBlapyPVCgZwTVc
	tkZNREoPw7IQC5r8q8l8yJqdeGY3FaPgVZ9Je0vNo7Qg7BODmEhOVhTwSpKq//N+
	+/WEzRkAmAEk0cPAUTxsg==
X-ME-Sender: <xms:8s2eamj0_xj94TJmeMBSanuoxm3Jp9tbsWINhRKTdpCyhmo6j0QP7w>
    <xme:8s2eajlnPJJZ2RwTxgSKt9B3NIs9MSE327s5KmqriG5PIyVDG1VKSsYGS1GkvYWqW
    GY8y1pvUFf8aEDtfyNcjuiFa5s6A2zmkAC6ojtfGbmUOKOt3n5k1Yk>
X-ME-Received: <xmr:8s2eaihip5IKW92PtIfytWW5MU1YJkcTpdRSnpCy_soKCh0yjbPm-aVY4YhzThajh7h0O3EAh8FjHcpKrnU5pY04gtAIESc>
X-ME-Proxy-Cause: dmFkZTEtNXSf6aDslJDEF0SPE7pZC3nKoOhYu0ZZeCnKsmaPMBY+sMwlKr6S4buL6kUFn+
    Z+bntRpDGfPLZ8XEDimjukwX8e6e6xl82EDJ5MsaOeKFQhQwvIjePZQ52OnzCvh/oLKKAz
    uhRR9ISC+EeZvNnLDewp2kU9TEJore0g/XZU7U6DJO1hXeR8EIQbSm7rWHHXkV+T6hvC6y
    KWxwjmyRW/9ie7RPdoEtaXePGEH02Rdt/1tBwshIkRVK1V4GO5U/ShZbL6dNPbx74a10fm
    THzYNt3JvgvUk58uT/E9CqXmtI47xg1981ncKr57+9nEEHVZ7HhkygppAVIx7jPW4NVYH/
    urOXbDx87Efr87buDh8UfLoUCjPNuYteWWN9Lq5YhGkHNO6A5BByqEdcNs9eL9t8Mb5HPT
    HnGXPGNIMfzDWKnR3KneG7E40BCXSkZsxpiY5OJbHP41tOC2+gMtX0MP/6BcH43tC+NetB
    rPQ+YvPEZ5LHyvgVtT8cD6KMjSzGcxJYfHkiAR/XohVqK70+etWnS1q5n1FB8KDMsyZrcz
    YWR+m4CliXdJ4E7lxhvmsUKcBZOQw5WYT557nd28E2ZtvIoWERhEcqCJgxucdE51LwRwpo
    RY6FBvw84KGL1IVtqYE2dM7wmRlm44hF9gHWakSdtGbRoKItXVcxxdy20ZCw
X-ME-Proxy: <xmx:8s2eamG8yTA_5ffvNa9F3RnEjsdyoIVU4CFqSXM1jiKcJ78fAUi5Fw>
    <xmx:8s2eakszrih9ta8cCpPZgDistY-38eNQ1gtnZlfUHMTaCIBBGp_5UQ>
    <xmx:8s2eanewZwAU3Qnd0w2ISJGgFOuzjQrG3JZH6jBtiXdmLB9kjQ_VCw>
    <xmx:8s2eaql1Jch-1YKxVB3gKyNF1Pdh2XJWbEKTE1l4k6lzbUQBC5_oCQ>
    <xmx:882eaj8d3ggiMtHWHo11Y5VovjdVmwICmNWwxtgLt_vYZQyqo6j2uZF6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 10:45:05 -0400 (EDT)
Date: Mon, 7 Sep 2026 16:45:03 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v6 08/11] media: rcar-isp: Call get_frame_desc to find
 out VC & DT
Message-ID: <20260907144503.GK3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-8-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-8-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2026-06-17 14:55:01 +0300, Tomi Valkeinen wrote:
> Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
> routing and deducing the DT based on the mbus format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 110 ++++++++++++++++--------
>  1 file changed, 74 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 8ac45516aa39..42ee6c19801a 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -42,6 +42,9 @@
>  #define ISPCS_DT_CODE03_EN0				BIT(7)
>  #define ISPCS_DT_CODE03_DT0(dt)				((dt) & 0x3f)
>  
> +/* ISP has 12 channels, of which channels 4 to 11 are connected to VINs */
> +#define ISPCS_NUM_CHANNELS	12
> +
>  struct rcar_isp_format {
>  	u32 code;
>  	unsigned int datatype;
> @@ -225,31 +228,82 @@ static void risp_power_off(struct rcar_isp *isp)
>  	pm_runtime_put(isp->dev);
>  }
>  
> -static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
> +static int risp_configure_routing(struct rcar_isp *isp,
> +				  struct v4l2_subdev_state *state)
>  {
> -	const struct v4l2_subdev_route *route;
> -	const struct v4l2_mbus_framefmt *fmt;
> -	const struct rcar_isp_format *format;
> -	unsigned int vc;
> -	u32 sel_csi = 0;
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_subdev_route *route;
>  	int ret;
>  
> -	if (state->routing.num_routes != 1)
> -		return -EINVAL;
> +	ret = v4l2_subdev_call(isp->remote, pad, get_frame_desc,
> +			       isp->remote_pad, &source_fd);
> +	if (ret)
> +		return ret;
>  
> -	route = &state->routing.routes[0];
> +	/* Clear the channel registers */
> +	for (unsigned int ch = 0; ch < ISPCS_NUM_CHANNELS; ++ch) {
> +		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
> +		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
> +	}
>  
> -	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> -					   route->sink_stream);
> -	if (!fmt)
> -		return -EINVAL;
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
> +		const struct rcar_isp_format *format;
> +		const struct v4l2_mbus_framefmt *fmt;
> +		unsigned int i;
> +		u8 vc, dt, ch;
> +		u32 v;
> +
> +		for (i = 0; i < source_fd.num_entries; i++) {
> +			if (source_fd.entry[i].stream == route->sink_stream) {
> +				source_entry = &source_fd.entry[i];
> +				break;
> +			}
> +		}
> +
> +		if (!source_entry) {
> +			dev_err(isp->dev,
> +				"Failed to find source frame desc entry for stream\n");
> +			return -EPIPE;
> +		}
> +
> +		vc = source_entry->bus.csi2.vc;
> +		dt = source_entry->bus.csi2.dt;
> +		/* Channels 4 - 11 go to VIN */
> +		ch = route->source_pad - 1 + 4;
> +
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
> +		if (!fmt)
> +			return -EINVAL;
> +
> +		format = risp_code_to_fmt(fmt->code);
> +		if (!format) {
> +			dev_err(isp->dev, "Unsupported bus format\n");
> +			return -EINVAL;
> +		}
> +
> +		/* VC Filtering */
> +		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
>  
> -	format = risp_code_to_fmt(fmt->code);
> -	if (!format) {
> -		dev_err(isp->dev, "Unsupported bus format\n");
> -		return -EINVAL;
> +		/* DT Filtering */
> +		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
> +			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
> +
> +		/* Proc mode */
> +		v = risp_read_cs(isp, ISPPROCMODE_DT_REG(dt));
> +		v |= ISPPROCMODE_DT_PROC_MODE_VCn(vc, format->procmode);
> +		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), v);
>  	}
>  
> +	return 0;
> +}
> +
> +static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
> +{
> +	u32 sel_csi = 0;
> +	int ret;
> +
>  	ret = risp_power_on(isp);
>  	if (ret) {
>  		dev_err(isp->dev, "Failed to power on ISP\n");
> @@ -263,25 +317,9 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  	risp_write_cs(isp, ISPINPUTSEL0_REG,
>  		      risp_read_cs(isp, ISPINPUTSEL0_REG) | sel_csi);
>  
> -	/* Configure Channel Selector. */
> -	for (vc = 0; vc < 4; vc++) {
> -		u8 ch = vc + 4;
> -		u8 dt = format->datatype;
> -
> -		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
> -		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
> -			      ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
> -			      ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
> -			      ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
> -			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
> -	}
> -
> -	/* Setup processing method. */
> -	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
> +	ret = risp_configure_routing(isp, state);
> +	if (ret)
> +		return ret;
>  
>  	/* Start ISP. */
>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
