Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1BB34E744;
	Mon,  7 Sep 2026 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780615; cv=none; b=J1NmC5fdF0Xn0FZJsOEz2G7exxPFvNS2lis+tkiaNfx06p2aN/Nv4PnJBvqFpW8XUoSRB3jjqFx4gBGr9GEI4InO77TCRmcdzascjQhMdDwxQnls7C0oYIgUdub5T7bi/AfJs/wPB1jEfXSRcaLauB8dKPzF5/ArHaDk9T3jib4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780615; c=relaxed/simple;
	bh=eZhUhfWsLbDnY56BWBTI6cap4zWRVMDBou881Te2ewg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxDSqr7cUrEQdFc6Ow/5F4edBeA1esY0+UQvYciG47E2ZBWxUSpM6mVUDtByRvJGVnQ4cFUwyPwKHjQlW/tG6HwoT+jwGXAZ6PVoNUTeg4CVj7gDZWW++5ylHtV0PBgpan3x95eHuhML0cxeRqxm6dI9owk44LykZ+vtDD6PdNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Yu6lWQCe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ImmUyU1m; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Yu6lWQCe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ImmUyU1m"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9E66E7A0132;
	Mon,  7 Sep 2026 07:30:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 07 Sep 2026 07:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788780612;
	 x=1788867012; bh=122b8Ry6Jct1LCshXnI+vK/p+wciTiScOcvQV/dej6M=; b=
	Yu6lWQCeGB9FKOBQ3NjDn99BKWnq+8Q0TOsRqd3csJzU1TXw/zIobSjstKp35Q43
	KavB6+u5HdzCoT+7iJFHMO2XUrR9yq3fbhTHfz8/lPyHJ3OPxWVUxdeaJPnQxddt
	qoU9HdRxmZumCcFU51CUjdYh4RpzXkkAScX2/8Y+yEaULhxsbrn/eogqm9JM82+J
	jYlkhD3W0Hc8d0nigGmDnQyQC6fImcmbrLMAdCzqmJSAKRlJIxynunaX1igudgId
	8Npv4WGXqvu0/Xicc7OB3aJQy26Aiz3dj/KlwkbjJLJFxN350Bb/U0xLxpRXIHID
	thASxw66+yNO3T/vMn3YRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788780612; x=
	1788867012; bh=122b8Ry6Jct1LCshXnI+vK/p+wciTiScOcvQV/dej6M=; b=I
	mmUyU1mjomytnZuH5tXu+drRUhKflQMhoPEqru/85wZZwIJKamZLLNsikLgMaqAs
	Y42JCfDftzjKZ1TozyO4zpEA3ZgSI55crP+Baf1qz+7yK2NGcSLN6dBUyvfhrHl+
	X0dNQSwxucIIFuvlCOV/wMIXMfTD8fCenSlQI1aK2iY5lB4mfO+l681sxFjjpmZG
	z4QqP3cet52u0yCu4VurdQOpYG2CznmYExNNun3n5Sp+O5LeRgCo0GJvQ9QCFdB0
	nfhf4Z/dUxbNan/pd/cc6eSIoVAqs5y8MnqHrNe+fK2Pg1jfrRFJoQeAJgctbmJ9
	Yp9sRVN2MYtU0R4NhpRVg==
X-ME-Sender: <xms:RKCeahfPG4frMnd9Atz3UkPgGg1reiddBByrKx2BiiVMTb5J3c_vZQ>
    <xme:RKCeanbniyA3l4mAgijwDodVurdD3rCDQPMMCUmjTlfWHjdnQwxNsbHEMjS5si5Iy
    Mn9GdWB62YR7ScYsqFjuReOTwf6cGdFEzzrW77KqmenY1qnARrYxIA>
X-ME-Received: <xmr:RKCeamFTyMtXHOlNS0SSZVg_BgokIReduTlxp7C9dAZM5M4Uxu8Ednv_YcLasvvA33aeTBuzx0s0E2QPO-uxwzY5dP_0484>
X-ME-Proxy-Cause: dmFkZTFC6ZM7BkdgkWJWwmXUbjmbNtOUSSeupSlKC0IMBgCfrkd8S3qw7oECQ3Yw1rwuAP
    EBKvOiGQuQ8kcxOIA+gthJ/wzgl72tlnr9zwUyLPOIS8tAAObYMGb63A/XfDcksSksNeeD
    bin1S5XzEbjUG3LV3X8a8NwQaGim1LbsI5KWYc6gagZIfRugRgpxnGtPaHW+NvDbr+AQ3a
    qRNU3M7UyCIH7wj2/pmAkMM3RG8TUlxaZT8dfkQczZHFsE0DXRlkt6TOnhxZx5OpWmEW4U
    gK+Pm2kN1gCdbE8bIbntmXrtmzuX8ZpnLv/ypINSboskKoyVKxspjputoqLk56+rE36RoP
    XmvmL4cWUbPcVw9cYLq7WzmxfyYR3mgln9f1wn9GHuav4frERcGhyoitlRdL47R9T31hXK
    3ZH8XFR99PNLZ8ZZyXnMs8WI3ShwvfYdbwsr9XaZ+eYq8Gve4E1xk+6um7+bDNhI71LXfA
    +03mHwnvwVaKZiXDufJb1ss3vCyfrOA/z87+KIjfb5I9rZiC2gahDOL/E3HabgcZYoxK8W
    heIbfQAFYFnx9+4oCmowyjjZosCWHW5YzxIg3lGJLMth/eFxttLW02cKtO9MebnG5T3yHA
    K2Ht9X68I9kPulrW88TadL/UlgWChmJDOjrLQFjzpeyTh+MRt+MCR7js2G3g
X-ME-Proxy: <xmx:RKCealksGR1BuVG-J6f9MDQ1NOh3CAntG63n9a0yHNwhKqY9fzQQ3g>
    <xmx:RKCeapcb6gjsyaQAK_e6R7oxDQtV6IR3YePTlIjLuYnyBmP4NeFJrQ>
    <xmx:RKCeajE8kHgEv9Z6l6wBaH-YkPO0c9YE915sGqBsLFcLjoGXafHwXA>
    <xmx:RKCeavjBdLbuXkF5H8T8wpOqchsuxBB2D5ivx5n1kVCXInt2QcaN_w>
    <xmx:RKCeajQ_aKM4v_KFzwkONQbyO5KLKpus5pXnaXIqJKzfSTPmXRpqCjwR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 07:30:11 -0400 (EDT)
Date: Mon, 7 Sep 2026 13:30:09 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v6 03/11] media: rcar-isp: Move
 {enable|disable}_streams() calls
Message-ID: <20260907113009.GD3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-3-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-3-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your patch.

On 2026-06-17 14:54:56 +0300, Tomi Valkeinen wrote:
> With multiple streams the operation to enable the ISP hardware and to
> call {enable|disable}_streams() on upstream subdev will need to be
> handled separately.
> 
> Prepare for that by moving {enable|disable}_streams() calls out from
> risp_start() and risp_stop().
> 
> On Gen4, a side effect of this change is that if the sink side devices
> call .enable_streams() on rcar-isp multiple times, the second call will
> fail. This is because we always use stream ID 0, so the second call
> would attempt to enable the same stream again, leading to an error. In
> other words, a normal single-stream setup continues to work, but trying
> to use the current driver's custom VC based routing will fail.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 27 ++++++++++++++++---------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 8fb2cc3b5650..58a9a3bd9f75 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  	/* Start ISP. */
>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
>  
> -	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
> -					 BIT_ULL(0));
> -	if (ret)
> -		risp_power_off(isp);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static void risp_stop(struct rcar_isp *isp)
>  {
> -	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
> -
>  	/* Stop ISP. */
>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
>  
> @@ -291,7 +284,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>  			       u64 source_streams_mask)
>  {
>  	struct rcar_isp *isp = sd_to_isp(sd);
> -	int ret = 0;
> +	int ret;
>  
>  	if (source_streams_mask != 1)
>  		return -EINVAL;
> @@ -305,9 +298,17 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>  			return ret;
>  	}
>  
> +	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
> +					 BIT_ULL(0));
> +	if (ret) {
> +		if (isp->stream_count == 0)
> +			risp_stop(isp);
> +		return ret;
> +	}
> +
>  	isp->stream_count += 1;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int risp_disable_streams(struct v4l2_subdev *sd,
> @@ -315,6 +316,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>  				u64 source_streams_mask)
>  {
>  	struct rcar_isp *isp = sd_to_isp(sd);
> +	int ret;
>  
>  	if (source_streams_mask != 1)
>  		return -EINVAL;
> @@ -322,6 +324,11 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>  	if (!isp->remote)
>  		return -ENODEV;
>  
> +	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
> +					  BIT_ULL(0));
> +	if (ret)
> +		return ret;
> +
>  	if (isp->stream_count == 1)
>  		risp_stop(isp);
>  
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
