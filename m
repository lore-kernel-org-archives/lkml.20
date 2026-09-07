Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050DE484241;
	Mon,  7 Sep 2026 19:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808913; cv=none; b=tZrtEbmQjtzeoIkvQ9R0IYRvorCcnCg+mygUKoC/FAZ/QGcpIGW+VgOxiicsR8+qT6JWE787hQZHqzGmkjXaOk5LXgGGodbY0WqJb0YxPX2QC6ysqTA065aPCW5iGIRCLHsyN2kT4mFH1AXjEgAWCopsnWkeMcER+G+VLvebpp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808913; c=relaxed/simple;
	bh=PbbEUcE+6GCVABk36zJQXf0AVFyLDx7XjpxqjRVaFtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/ce2jfY/o5fcUJwMCD/hGmpp+eHgJwWvBEidX7YRH8khBQZrbYfO1/19VoI1We5B1QogTrbnShfootraT3cXI40BVkk1MLmiuphoMcE6ww2UNswAu4k+2ceF+M8usVvXXPdgad9LVVkSrPiTtMmexg2nJYka97RYdAZlE73x3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=l7qFf2gD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=akAZtc/v; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="l7qFf2gD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="akAZtc/v"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id EE8201D0008B;
	Mon,  7 Sep 2026 15:21:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 07 Sep 2026 15:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788808909;
	 x=1788895309; bh=KWGPDpvLzt/lPzCpzu69ioBpSMhnFg2FMUN3bQDlSvc=; b=
	l7qFf2gDnuTRBK2sCLMv+O8WYOAsYWd6/oExbSxl+RhAG5Y3D+54m4nq3CMzBW8v
	2uyxrlNGlEgT/dnHdQCPY345ucRM6aYgXkB4Ywnq4lo1188h8nUy9BAgAbUOLNxN
	ojbjKHvFAFTHc3/lG+TAqpvNFGUEKclvjuXKdspN722azXmHChkUJsomYDwy6rVE
	/sZhqgWw2ekHSJrZ5yRiT2BzfOXghjBWAPl1HaNoh2CDmSSH4CRep20cKRwiH/3k
	EDrSsgRAtIWstEVFe5Fu9KTUMA6HkjUdq2TI2zE6XDjCTG9UD7TPGBeQLK9LP3vI
	JL8SRXslYwIIP3LMs1Onvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788808909; x=
	1788895309; bh=KWGPDpvLzt/lPzCpzu69ioBpSMhnFg2FMUN3bQDlSvc=; b=a
	kAZtc/vaMN+zCkjTU3sdq3l542CRyDPGORfzIUaMtfcznF+QelGBOGvkBWan124v
	dHoeE70Isc4jm6aaHYkOINcdl7oHcnCvottoU0KJ1INb9AgvzZ9o+QRG7CL3HyVa
	2zOs0sNUz3+kJSilRd8hcqRLNT8/FzRWV2U7GSBUwbX4HYS1lgHKjCK8nNLZFg5o
	o1MZzZ5ETjHVb/8AH3+o58LxgQvWMsRcWMozrFhXhoIF4AV451ADEWsa+i/ovvwh
	BhWfY2bPqfwwbtwfuDs6eB1uJQUudQM1ymqrIOpHDt5IBzVzh0EKkNXMPKSLWgID
	v9qiKs/q+OfIMP/+KLgMA==
X-ME-Sender: <xms:zQ6farRf_gpYe-Seoa01ZrhX79rCZNbbDKSqo_kiJfJ2rGCg10F7Xg>
    <xme:zQ6fapVeBgJ_SDrs1rkpRfAWC8E704RbGM7Chvn_pVSKu1OGOE8u-ZVdkLrn11hNC
    651knIkF-eClMSBR_39Nx9AyrJjzxSUuoj_X7rupQjRna-wdOBvhzA>
X-ME-Received: <xmr:zQ6falRcsnAnR3T2d-Jd0Z6Cvq4F3caEnwcEWnbwEOW3pvibd-vWcvt7KtpvkwflFJf_ylh-J75HGW16KQfXJQIjPQA8MmM>
X-ME-Proxy-Cause: dmFkZTENkO/YL74h4/edgCigBQJR3TA/sOa0NgsuuPvxtJWU5mtoDEcH8wgOrctxxq+kcE
    cgssW/zRjywDwId0ZH4Tuyl5XpPkfsxySmASJR/6PPej+t+/TXeq2r7asXf0qA/zZryK6S
    gnXleJ9TAtZOwP0HLWV9h6tuyyyIBMNS8dVp+4kqSSaHsfrI1fm2fkPJU6IPwn/64saf3a
    2pGjrMM8LOH5ismbKIUIFgZ7ynILPCQHaaGsOZZw/UfWP6YSploGoZCwi6NCd4XwECNe8r
    LdDw+/kHsCi8TPacSWXEfuejn2LPRhWakNlEy57RW6+A3I5p6OCJ0AKn9Iqs6q84fIQXsx
    JLi+cG0heJuOo+GFb4MRGT+HHjpUm5bcR+uFatua4/Bx58fE0th79MdsJM/ZSne3B299+Y
    9YCOa3Yp1w701Bj9Ibdl7yExONf21H9NEpcHFAbijAN5JM0kE/z+5mO7C95TWtR3D7Yknb
    a6YOPBBkCzz9LR8go5IrmmgDEYEpveo/lCEFo2aXD0FKKuJJ1pL4eIaNSg+A/gBr27xUGc
    Tke/9TdK/EdKHdksgsQCGLPYZRYOwjHirMtMIDANmMlnqGZIYEZGk1GJPhxnrnL5eXtVSd
    jPcOcBqQnxeEUjKHnZ4ICWwKjCqf5mONl5H3DZ63wkERyfzNzQO2YwDHSHjA
X-ME-Proxy: <xmx:zQ6fah3JyWCdfeHwfjaagsAjc7F8Pi5tUuddk1-SKGOcYk3_wZD28g>
    <xmx:zQ6faleHdGlJuFluscp18NaJUthIOp5FJhYxnR2ITLTf7j5n-9n_lg>
    <xmx:zQ6fapNBbKcAfbP9jWZh253ESdZFGBA91LEJskRgHk1cn3G48ULRQQ>
    <xmx:zQ6fapVmRg35JnRuzwAn5kJ_Tup2YDyHBhNlABBRIh60S22NeyQzjg>
    <xmx:zQ6fahuxcH9BlneVCbvQSPyrXeQfsPPAWwKb45xG_xl4Y_XIgvwo4IKu>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 15:21:48 -0400 (EDT)
Date: Mon, 7 Sep 2026 21:21:46 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v6 11/11] media: rcar-isp: Add full streams support
Message-ID: <20260907192146.GL3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-11-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-11-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2026-06-17 14:55:04 +0300, Tomi Valkeinen wrote:
> Add the missing pieces to enable full streams support:
> 
> - Add set_routing
> - Drop the explicit uses of a single stream, and instead use the streams
>   mask.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 39 +++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 42ee6c19801a..2e1bc8fbd432 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -340,6 +340,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>  			       u64 source_streams_mask)
>  {
>  	struct rcar_isp *isp = sd_to_isp(sd);
> +	u64 sink_streams;
>  	int ret;
>  
>  	if (source_streams_mask != 1)
> @@ -354,8 +355,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>  			return ret;
>  	}
>  
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       source_pad,
> +						       RCAR_ISP_SINK,
> +						       &source_streams_mask);
> +
>  	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
> -					 BIT_ULL(0));
> +					 sink_streams);
>  	if (ret) {
>  		if (isp->stream_count == 0)
>  			risp_stop(isp);
> @@ -372,6 +378,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>  				u64 source_streams_mask)
>  {
>  	struct rcar_isp *isp = sd_to_isp(sd);
> +	u64 sink_streams;
>  	int ret;
>  
>  	if (source_streams_mask != 1)
> @@ -380,8 +387,12 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>  	if (!isp->remote)
>  		return -ENODEV;
>  
> -	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
> -					  BIT_ULL(0));
> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> +						       source_pad,
> +						       RCAR_ISP_SINK,
> +						       &source_streams_mask);
> +
> +	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, sink_streams);
>  	if (ret)
>  		return ret;
>  
> @@ -423,12 +434,34 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int risp_set_routing(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    enum v4l2_subdev_format_whence which,
> +			    struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +					       &risp_default_fmt);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_pad_ops risp_pad_ops = {
>  	.enable_streams = risp_enable_streams,
>  	.disable_streams = risp_disable_streams,
>  	.set_fmt = risp_set_pad_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.link_validate = v4l2_subdev_link_validate_default,
> +	.set_routing = risp_set_routing,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
