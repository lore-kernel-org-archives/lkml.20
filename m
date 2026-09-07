Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5624A5EBE;
	Mon,  7 Sep 2026 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785217; cv=none; b=GVGjodfYt+iA/hMVw19PRRNugbO0c4NGph3p3tyM5tKStBnjEJjhzd5+AScLYoJt/bSC6qHGyLc4tKpZ0Pvq21ak9IqGZtQkl1C/kVIOlD/vvCT89tYsDJr4RxmgjFc0MtcWGCmT/xSOuWxlK8JLlJAQcBuQtzgPB0Vw0rZXc2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785217; c=relaxed/simple;
	bh=ZHBYu4NA4jTSS67ZFGnGnW5O02amxGoEeI/zjoE8Np4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXrB7Ma5BbP25JCZ8owL6cmmEr5DBD90et8Wmp8dmcFkLK5z+yOPA/g3l7FNj9Gz+uBsI3YDwyj0K+ZH/BlrX6j8K4rAALw9AU0RvxSYS8+TLeq9ZZnULguFQGoKLddJTyRPxqb1QcD7gqvfQ6G6yCOvBJeJS9xwQQctLu8CDzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CMyxJNvE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ptLgpssn; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CMyxJNvE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ptLgpssn"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A56B8EC0086;
	Mon,  7 Sep 2026 08:46:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 07 Sep 2026 08:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788785214;
	 x=1788871614; bh=yM4tizvGcpwigoPLzGPjmCypPj40X/w/9gV6G0nASgM=; b=
	CMyxJNvEP09faGWM6K2zSzRQWHqmJckaMawnXYYs023tm1nCGaNPrMozfmsTnjXF
	4ATsKKLh5oZ32WB8sgzth3mPWv2G0mBbUW1A7kLtBfsmN/q0YMM0SKTrwChixv2k
	ZybFLbfa3WPiprp/VBJZsM/CVE8mYDZvw9EgfcaDc3J0pCrKA6Jkz1uefW5i/qvG
	vspy5AFxp0ovXo7HBoDFefQUfKqmHk2zPUFHzDpSxk0XmakWptOACzL+d6DW0n+X
	C/+seY+tCRW5vnXuul8ac3FCM4r52qS3zDikmQJ/mydzNsDh8UG+9otUtstSbacw
	Jo+dmh/16HEdb2nBJLCiag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788785214; x=
	1788871614; bh=yM4tizvGcpwigoPLzGPjmCypPj40X/w/9gV6G0nASgM=; b=p
	tLgpssnpjMtbhzpe5JbSOVmD6bBnvkzp4aW+9VPjYiI09VoSBAsh05l6j83Sgkib
	EjWNvz89umpIaKRB4t64h7hLMbL5pQEVtdsOe0x/PgelBrXrbcsfLhjDa2sg5NDy
	0jdpyvB361N0DfpvnPtJK3UVu36g9roxdI7S20q9v4PpVKPl9EkvfOd7ogE+VN1u
	k9XsK1NSir8rzenl3WmO8lcFcdRErtOgnvAhM8dS8487c2alDDcdUeFtZcZ7dX1H
	GUNQzWNFkBSgT+8wK5MhWYVWizqx8QbKbLgxbcFyK50ha3ZVV95Rv3gDMZEHEX/o
	itT3EmbRceF+fk34ERD1A==
X-ME-Sender: <xms:PrKeaqCV3kQBlg3jMvyOqwFPxNWDt5nmrCsfz6Na_0bTzpF-_BsNIQ>
    <xme:PrKeahFcf3SSBjzp3D1bVUebmmCCIjzDy5i_hF40EUF9R6um1T_lmrWBaaR5JGZHE
    Of-ZKFpKUIw-Gl25Llce1FigKE2J2EyjMGBgdEoHAiwMBYCIgmwE_RW>
X-ME-Received: <xmr:PrKeaiCyQxhphpPcspB-rbm-AyE2MBZb_2PDAStbav5KrW0ghJRXwRzAzbSdkG1FZb0SNI-BX2mLUn0usOB8CdHMz7k_YOE>
X-ME-Proxy-Cause: dmFkZTF+AFS8ha7CNYlD2/FRJ+VnA/zonfFUFG/x+99K5I8w79277dn1PvZ5U15NBAYtnw
    mQwHrjgKA3PTxdWvo5lrC0uHXsssBi4hyDUa5jjTF5ROxNHYBlwR5VUkMuh4TQVKcbflN/
    0yBuPcpL1gOKR8QuyAFHRJfwJSXGQi6r/KcQHo2zlwqe5XUWpphb6v3RlKDe225dycQ+gE
    UxvL03+zAEUT6SO4KP19QmOcZewr1eyio3eOHYuSxBrXsJa5HqHLSM2qYaoyFq76Dldp6y
    z5pYaUnBguEceoSFPj8ZwJ9l3xS0rKcoMMQpWISZIuSjfvPMyd0VAEZX5nruU1VWCGfGqx
    s2K48l4gQMnpwyQUUlV6SoArBIPLgrfHwpAtcKHjd3JygHasahscfyp+k2KXybr78J1eOd
    /bCLYWARIF5SScnlz4HuXMcFiS8x0TRrUQdoMKPozfpiX/ig6V6EncAoWGRjYVo2TYAbmh
    QDYQQlhQhPdq+Qj75ePiTXWnFDL4BnY9tO4TjiEQiJXd+w8XWDVt1WAXx8F23z6Q1syUfQ
    lGOuRJjEzFXTwhlbhyVDbr+dSKkpGfX6e4Wplt8RS75lu736ur09XMjWDFIUP9EFa8SKCA
    YzUUkHOhqBV+/8EM+S/zaclRYOy/CmbuTcVJwpFtz+tpvEOLsY7DOsHwlxbg
X-ME-Proxy: <xmx:PrKeavmY0ExcbTdymxO_8fU-i7Jq5gl87dnE4tMXUEfHtn3rs_0rxQ>
    <xmx:PrKeagOw6m0hWDfobb0Prh_lc5gS3w-aq837kd5zz-wVXCNbOsz7qA>
    <xmx:PrKeas8a1lxc4umMfASsZigcYs-VdlOP05RFvFCPPe2ZpwWSPENGAA>
    <xmx:PrKeaiHN06_bG5_G1gHMRnF6m4gDw_sDScX9t3Z2Nt1xBf91jeLHFg>
    <xmx:PrKeahdHAxacaypGXu7bmaHqK_4FHeHkBrWCgT4x9496Aww87DUoNg9o>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 08:46:53 -0400 (EDT)
Date: Mon, 7 Sep 2026 14:46:52 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v6 09/11] media: rcar-csi2: Call get_frame_desc to find
 out VC & DT (Gen3)
Message-ID: <20260907124652.GH3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-9-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-9-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2026-06-17 14:55:02 +0300, Tomi Valkeinen wrote:
> Call get_frame_desc to find out VC & DT, for Gen3 platforms, instead of
> hardcoding the VC routing and deducing the DT based on the mbus format.
> 
> If the source subdevice doesn't implement .get_frame_desc, we use a
> fallback case where we assume there's a single stream with VC = 0 and DT
> based on the mbus format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 111 ++++++++++++++++++-----------
>  1 file changed, 71 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 0d9e730fa677..8cd38b4cbc7f 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1069,62 +1069,93 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  				     struct v4l2_subdev_state *state)
>  {
> -	const struct v4l2_subdev_route *route;
> -	const struct rcar_csi2_format *format;
> -	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> -	const struct v4l2_mbus_framefmt *fmt;
> +	u32 phycnt, vcdt = 0, vcdt2 = 0;
> +	u32 fld = FLD_DET_SEL(1);
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_subdev_route *route;
>  	unsigned int lanes;
> -	unsigned int i;
>  	int mbps, ret;
> +	u8 ch = 0;
>  
> -	/* Use the format on the sink pad to compute the receiver config. */
> +	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
> +			       priv->remote_pad, &source_fd);
> +	if (ret && ret != -ENOIOCTLCMD)
> +		return ret;
>  
> -	if (state->routing.num_routes != 1)
> -		return -EINVAL;
> +	if (ret == -ENOIOCTLCMD) {
> +		/* Create a fallback source_fd */
> +		struct v4l2_mbus_frame_desc *fd = &source_fd;
> +		const struct v4l2_subdev_route *route;
> +		const struct rcar_csi2_format *format;
> +		struct v4l2_mbus_framefmt *fmt;
>  
> -	route = &state->routing.routes[0];
> +		if (state->routing.num_routes != 1)
> +			return -EINVAL;
>  
> -	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> -					   route->sink_stream);
> -	if (!fmt)
> -		return -EINVAL;
> +		route = &state->routing.routes[0];
>  
> -	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> -		fmt->width, fmt->height,
> -		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
> +		if (!fmt)
> +			return -EINVAL;
>  
> -	/* Code is validated in set_fmt. */
> -	format = rcsi2_code_to_fmt(fmt->code);
> -	if (!format)
> -		return -EINVAL;
> +		format = rcsi2_code_to_fmt(fmt->code);
> +		if (!format)
> +			return -EINVAL;
>  
> -	/*
> -	 * Enable all supported CSI-2 channels with virtual channel and
> -	 * data type matching.
> -	 *
> -	 * NOTE: It's not possible to get individual datatype for each
> -	 *       source virtual channel. Once this is possible in V4L2
> -	 *       it should be used here.
> -	 */
> -	for (i = 0; i < priv->info->num_channels; i++) {
> +		memset(fd, 0, sizeof(*fd));
> +
> +		fd->num_entries = 1;
> +		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +		fd->entry[0].stream = 0;
> +		fd->entry[0].pixelcode = fmt->code;
> +		fd->entry[0].bus.csi2.vc = 0;
> +		fd->entry[0].bus.csi2.dt = format->datatype;
> +	}
> +
> +	for_each_active_route(&state->routing, route) {
> +		const struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
> +		const struct v4l2_mbus_framefmt *fmt;
> +		unsigned int i;
>  		u32 vcdt_part;
>  
> -		if (priv->channel_vc[i] < 0)
> -			continue;
> +		for (i = 0; i < source_fd.num_entries; i++) {
> +			if (source_fd.entry[i].stream == route->sink_stream) {
> +				source_entry = &source_fd.entry[i];
> +				break;
> +			}
> +		}
>  
> -		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
> -			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
> +		if (!source_entry) {
> +			dev_err(priv->dev,
> +				"Failed to find stream from source frame desc\n");
> +			return -EPIPE;
> +		}
> +
> +		vcdt_part = VCDT_SEL_VC(source_entry->bus.csi2.vc) |
> +			    VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
> +			    VCDT_SEL_DT(source_entry->bus.csi2.dt);
>  
>  		/* Store in correct reg and offset. */
> -		if (i < 2)
> -			vcdt |= vcdt_part << ((i % 2) * 16);
> +		if (ch < 2)
> +			vcdt |= vcdt_part << ((ch % 2) * 16);
>  		else
> -			vcdt2 |= vcdt_part << ((i % 2) * 16);
> -	}
> +			vcdt2 |= vcdt_part << ((ch % 2) * 16);
> +
> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK,
> +						   route->sink_stream);
> +		if (!fmt)
> +			return -EINVAL;
> +
> +		dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> +			fmt->width, fmt->height,
> +			fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
>  
> -	if (fmt->field == V4L2_FIELD_ALTERNATE)
> -		fld = FLD_DET_SEL(1) | FLD_FLD_EN(3) | FLD_FLD_EN(2) |
> -		      FLD_FLD_EN(1) | FLD_FLD_EN(0);
> +		if (fmt->field == V4L2_FIELD_ALTERNATE)
> +			fld |= FLD_FLD_EN(ch);
> +
> +		ch++;
> +	}
>  
>  	/*
>  	 * Get the number of active data lanes inspecting the remote mbus
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
