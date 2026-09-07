Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B049364E;
	Mon,  7 Sep 2026 11:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780839; cv=none; b=usrLTHK3xeypJrjwXStkZghmmVMZ8X5x/+SV8cY/DQrKPh8tafAmGjHvbUZut6IJ6kaKK1kv5qUAywK610Fv2Jf/bAtA+j1ISzMcKz+GG5t//WBct2AqVEU6J3e3m2gd8Rt9KMKLHUALYt8wsA6Bbk6FIzplzpJKHpmC0zLxAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780839; c=relaxed/simple;
	bh=MFSADkHIgAWbdCtIajGRbb8UiCalTZvGSXtcDayJojc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGw8VoLoXSzDlvQfNVJxpg2rCzxm4UVrSNDyFSPAlVs2KfTHp9HNk6peH/UglrXHqRjvWj37j/T0TvtREUjdutLEfwLC9qU+Nxtpy7G3ro1+qvL5MTzi/frhgRqS4AlXjRiBTR0LN2ZyktjU6YsN7rPGAlP730wOLAoZ+v8a59o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=xPhxU1sz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=yEOcuNvV; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="xPhxU1sz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="yEOcuNvV"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7A2947A0132;
	Mon,  7 Sep 2026 07:33:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 07 Sep 2026 07:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788780835;
	 x=1788867235; bh=3Z8MfzRlSpUsInSPkXji8CTceN1tZCQHg/j/P8bSnLo=; b=
	xPhxU1szpOVs2N1bIp9HiIQFydO+AVPAP3MmVT8PwhMerJd5UK+cpMTgJPnt5HrF
	CrGN3a2QaO/SkWh7s4WCeMCOUMTpFgnhF6wvQE/SKA5DpQrzgaXirRXQArkCqnHx
	qUcfDHE/M85IQ+JZ5Y7A3y41qhwXczziNvi7/g6vjoiQX6Z/XBz+D3WY7km9avbx
	6bwsiKfHTxZQy5tr63f2tjno1S7e5nhW1z6/WG8yAB6Kd5SRI0OfM7KbkgCXBIkM
	XuVuZ+EkTDJwpJiZlzBEoImC0aJmJ2RN2Qnx61CgfH9+7JT2cd85JtLBm+UYXqpu
	EDsABSchNiXJPcMJq8RZuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788780835; x=
	1788867235; bh=3Z8MfzRlSpUsInSPkXji8CTceN1tZCQHg/j/P8bSnLo=; b=y
	EOcuNvVUIABRavCK7CnE0orZ1tDnlKvK2q5ZfIyR6lV3Uyg4yi7/8CXCrtjazxKS
	6MnE5krgQnPzEtUhL8+hyuPgApbzYr7C9rACFDk+DaunD7fQ+Yp4ovpgYyasXdmW
	jdxoOvgWVDBPK6zIePd+XtATdrmDlMsw4qQQGRdRQ12yPlzYbigA7XzngqKXg7To
	FffoDzeZVi0Hv3um8lXz+CGkfzJT+does7t92OzAd+gi4p95i5FbshJ7U3iXpIJ0
	yw/Cd4AFNhkShF9qpY1x/6XIXwnTtVG7lOseq0T+tMv4xMauD8mj/NPZbfDTk/kV
	tIKMABA246LNldZPrWUgQ==
X-ME-Sender: <xms:I6GeajoewUmD1mm8SPN3kEEAupiTlAgJqBjoLwK0aKR3i_LuEfXRLg>
    <xme:I6GeaqPhpYkISfMmtHPfcMuukEGcRcQHSJtjYAMxm4wPGl7FjHrN_nB-LSuNsq8xv
    7Ne-SYvJpC6WjvgoFgYXLUJsJAXKI5gbBxgPut6eb297KfG0p1gpWQ>
X-ME-Received: <xmr:I6Geakq9Q3RxIXOrYx42LgcimJOUgHEEvia9UO_D-TdSjjB_cU52SXum_KqRbl5Tpf5U45gtHsqqDvHebbYczCrCYU5nY8w>
X-ME-Proxy-Cause: dmFkZTGZj49KH42gEqMkg9nTcqBxcq2KIGNbNkcSFqI/QNRfwUOkC5TlL8FLJQs3r//SvY
    QKAT7qAEoCla3x9i6rSGJbDj1TA3N0/RhEsDTg9boSBpF1x4RjJeGH2QdBzmGEn1XmOFIz
    IU6gnrypeYypvPVnB3TZPkY0/PTRha7f0O3o9RPtADE7xf33b0ZM8XWeErxevVCO5LaZ7I
    rGsqWVKg4xG26bPLKEhzXIG/z2lLmfkWntMTGGLw4ngC/FFJ7McTIBCgHYx+dNV3fDQFA6
    pZCSTDVg1I21zG7JRs+WJlBYJljjU53z8+KmO14Gx5pf0YfN7Dra+CZdJCSZjWpB2nafJ+
    dcmck5fnFEgPb5Hz1NW8nqiY8c/rMBBSHNTRqYGgcLMo/d8PptCy6darTPxSMQ2IMk3a8K
    RQMYeVmKINpSyws36KeyAHBNTFZFZAbKtlTyixn8SjIot3oTRS1IYtfTmB29L1MZ4IRIsa
    tr5r9evOlQ3SjSAfP+IuPd0/ty7+ovOWNCJ6M75L/u/Pzd2PcjCy9x9g5xmhcHJHxBcF66
    HzCxz3OvgBz4N46Cwtg/OKNTaDivqZb7r0icP5m/gOIfx1flBOa4x/rLQ/ealgxYl0Ldni
    E/qyfjQd2nLWxkSNoYnA+jZ7qLB5jDrNnHZ2g4RE/QxbF/9nO74VUPNtc/xA
X-ME-Proxy: <xmx:I6GeatsVlTlyTUeMV2CyMCJYchyx2bzMCTOUYuPNt5shLIdu0oESsg>
    <xmx:I6Geaj3oHuKeJIkQ0q9ZmJ4VhK6OYVgUpa62nr2iQMxSlSFVS-jHEA>
    <xmx:I6GeaoEnDuNebU-yinjASn6opNkwUvf8gbWyeUCnOgB9QZFOeCpYaw>
    <xmx:I6GeausgMUGrlJOmrhyIHxcYXvVFK4MxLPN4scT8UGWAuDDEQSprgQ>
    <xmx:I6GeamnWfnvYrPRo_he3Lg-Qq3MEUnVklNkUGU05QVXhCjJ8aXgwTUba>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 07:33:54 -0400 (EDT)
Date: Mon, 7 Sep 2026 13:33:52 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v6 04/11] media: rcar-csi2: Move
 {enable|disable}_streams() calls
Message-ID: <20260907113352.GE3497753@ragnatech.se>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
 <20260617-rcar-streams-v6-4-1260eb72dff7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617-rcar-streams-v6-4-1260eb72dff7@ideasonboard.com>

Hi Tomi,

Thanks for your work.

On 2026-06-17 14:54:57 +0300, Tomi Valkeinen wrote:
> With multiple streams the operation to enable the CSI-2 hardware and to
> call {enable|disable}_streams() on upstream subdev will need to be
> handled separately.
> 
> Prepare for that by moving {enable|disable}_streams() calls out from
> rcsi2_start() and rcsi2_stop().
> 
> As the error recovery in rcsi2_irq_thread() relies on rcsi2_start() and
> rcsi2_stop(), we need to modify rcsi2_irq_thread() accordingly.
> 
> On Gen3, a side effect of this change is that if the sink side devices
> call .enable_streams() on rcar-csi2 multiple times, the second call will
> fail. This is because we always use stream ID 0, so the second call
> would attempt to enable the same stream again, leading to an error. In
> other words, a normal single-stream setup continues to work, but trying
> to use the current driver's custom VC based routing will fail.
> 
> On Gen4, this doesn't matter as the rcar-isp behaves in a similar way as
> described above, and thus rcar-csi2 will only get a single
> .enable_streams() call.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 59 ++++++++++++++++++++++++------
>  1 file changed, 47 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 7305cc4a04cb..f5d8b06dff51 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1822,20 +1822,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
>  		return ret;
>  	}
>  
> -	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> -					 BIT_ULL(0));
> -	if (ret) {
> -		rcsi2_enter_standby(priv);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
>  
>  static void rcsi2_stop(struct rcar_csi2 *priv)
>  {
>  	rcsi2_enter_standby(priv);
> -	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
>  }
>  
>  static int rcsi2_enable_streams(struct v4l2_subdev *sd,
> @@ -1857,6 +1849,14 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>  			return ret;
>  	}
>  
> +	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> +					 BIT_ULL(0));
> +	if (ret) {
> +		if (priv->stream_count == 0)
> +			rcsi2_stop(priv);
> +		return ret;
> +	}
> +
>  	priv->stream_count += 1;
>  
>  	return ret;
> @@ -1867,7 +1867,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>  				 u32 source_pad, u64 source_streams_mask)
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> -	int ret = 0;
> +	int ret;
>  
>  	if (source_streams_mask != 1)
>  		return -EINVAL;
> @@ -1878,9 +1878,14 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>  	if (priv->stream_count == 1)
>  		rcsi2_stop(priv);
>  
> +	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
> +					  BIT_ULL(0));
> +	if (ret)
> +		return ret;
> +
>  	priv->stream_count -= 1;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> @@ -1971,14 +1976,44 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
>  {
>  	struct v4l2_subdev_state *state;
>  	struct rcar_csi2 *priv = data;
> +	int ret;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
>  
> +	if (priv->stream_count == 0)
> +		goto out;
> +
>  	rcsi2_stop(priv);
> +
> +	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
> +					  BIT_ULL(0));
> +	if (ret) {
> +		dev_warn(priv->dev,
> +			 "Error recovery: failed to disable streams: %d\n",
> +			 ret);
> +		goto out;
> +	}
> +
>  	usleep_range(1000, 2000);
> -	if (rcsi2_start(priv, state))
> -		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
>  
> +	ret = rcsi2_start(priv, state);
> +	if (ret) {
> +		dev_warn(priv->dev,
> +			 "Error recovery: failed to start CSI-2 receiver: %d\n",
> +			 ret);
> +		goto out;
> +	}
> +
> +	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> +					 BIT_ULL(0));
> +	if (ret) {
> +		dev_warn(priv->dev,
> +			 "Error recovery: failed to start streams: %d\n",
> +			 ret);
> +		goto out;
> +	}
> +
> +out:
>  	v4l2_subdev_unlock_state(state);
>  
>  	return IRQ_HANDLED;
> 
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
