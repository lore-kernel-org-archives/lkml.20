Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846364;
	b=OZyfQJ5r7lXsvP67clxYQpjOvm7s5xaiDdPgwKGM38vzqtj8+dKjnKDARo4bkCHw19Cf
	 nI4+B3Lm2RNVIfysHEjbgKArmx1oYtxlwIqa93U7KwcWpRKl7M5XwbNcWqFRp2ePrTMdi
	 fZjGyv+zDDRKcODuHXoDWZ6Tctx5SSDQ9HXsWUoMt9sm1NzYZ/LQa11ZoDBU0K0AyTUPR
	 XZkkMVdvGpxsCWGUl69bJOnMUSZKDthdb+um3p/OYMvTnDXIxFYqHGVSYFQI1OZj+RNOK
	 hlh7L4358IiG/zpvC+aZ7qCG9rCTC+wNCrJG6AAziQBQmDlAIWJnEQPJIeGz5ppJX0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846364;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gRpvS0aFH/hkqbf+HmxoBDmX4y1Qy+G8n/ahrpnwi8c=;
	b=YuYh6gRzeG84gMNH+l5QKtw4xIieHw+9UeME9GqOrt9kR1DjalcS0zrhrF6goitROBAN
	 Lkwm+fBGYPCPL5Z5b5o1XcjAFR8ayu5y0ZYLiEIfI0t1aS7KYQDkU1xfrreAI5YOdFUGu
	 M/YE9SM5d0De5l0qIpDRn21hLjIqZCvY1+nGDTieCe7KwUIqaGmSUB4PC5OX5I7aaE+28
	 swVBUYX6aYvz8pd1GBGccV6X5r8XrJL92w+9b3dRO9GqB/LtykNFrPTMeKwojQDVJcjQn
	 vtVooIRRanoYfKCylnOfNtaBIpAmd0c3xhpU+yCaPH7nlrNIbOG06FNsTdz1mWZ6OUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fDhmh7NK;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E276D606A323;
	Mon, 16 Nov 2026 16:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E276D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fDhmh7NK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794846363; x=1826382363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=besSWkv2lgjjgJhS0YJxeUkJug4DOd6erC79ptELE0k=;
  b=fDhmh7NKnIxUcbpUOMthKtfQdpY5BWv7X5GnuZgT1BUWnfKFY013AgmI
   5E/FxlCSZ4osMh0Nm6eyOjU4A0Y254jiI77UphQp4FlF2XSIF0Gt4r5jC
   hBZ9H51oaptXERWKxnlgV//NQgMp4SNVDhWXjknX/TvdtK7OG22DsUTAS
   aCKmHPnjNosBvcoWo5O5nX0K09PLpcZf68Ed+WvIBOr6iv6WodBRQ2dag
   7sVd1l8qKoAR+6vbF/SgXVDX7JUWBNkT2PPWq6Gg5a1bNt15J+rmXt8VI
   yIDY/LwLQMF2NLsL4CzOVw2eiC4xYSkyn3BDqgfnc1Ak9lz2FLapMIQF2
   g==;
X-CSE-ConnectionGUID: cvWIDb8MRXSVSmtCC0T26A==
X-CSE-MsgGUID: QcUijvklSP6rX2BRvyAFCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3577881"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3577881"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 08:26:02 -0800
X-CSE-ConnectionGUID: SDP/YCk5SwGJiowYb7qt6w==
X-CSE-MsgGUID: k+Hn71nVQtGxQ9G/P02lqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9575553"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 08:26:00 -0800
Date: Mon, 16 Nov 2026 17:25:52 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] media: rockchip: rkcif: fix the MIPI stop path
 locking
Message-ID: <avstwwwxx0KrGe23@mdjait-mobl>
References: <cover.1793702189.git.daniel@makrotopia.org>
 <744eeec346f96d580a9215c657951f5a737e734e.1793702189.git.daniel@makrotopia.org>
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
In-Reply-To: <744eeec346f96d580a9215c657951f5a737e734e.1793702189.git.daniel@makrotopia.org>

Hello Daniel,

Thank you for the patch!

On Tue, Nov 03, 2026 at 10:45:29AM +0000, Daniel Golle wrote:
> rkcif_mipi_stop_streaming() takes the subdev state mutex, and the
> interrupt handler calls it at the frame end that completes a stop. A
> mutex taken in hard interrupt context sleeps when it is contended, and
> CONFIG_DEBUG_ATOMIC_SLEEP reports the call on every stream stop. The
> state itself is not read on either path; the lock serialises the
> read-modify-write of the interrupt enable and status registers, which
> the streams of a MIPI block share.
> 
> Guard those registers with a spinlock per interface, taken with
> interrupts disabled, so that the handler and the process context paths
> exclude each other, and leave the subdev state alone.
> 
> Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
> Assisted-by: LLM
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../rockchip/rkcif/rkcif-capture-mipi.c       | 24 +++++++------------
>  .../platform/rockchip/rkcif/rkcif-common.h    |  3 +++
>  2 files changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index 686b995525b9b..53cfd37bf02bd 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -721,17 +721,14 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>  	struct rkcif_interface *interface = stream->interface;
>  	const struct rkcif_output_fmt *active_out_fmt;
>  	const struct rkcif_mipi_match_data *match_data;
> -	struct v4l2_subdev_state *state;
>  	u32 ctrl0 = 0, ctrl1 = 0, int_temp = 0, int_mask = 0, vlw = 0;
> +	unsigned long flags;
>  	u16 height, width;
> -	int ret = -EINVAL;
> -
> -	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
>  
>  	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
>  						      stream->pix.pixelformat);
>  	if (!active_out_fmt)
> -		goto out;
> +		return -EINVAL;
>  
>  	height = stream->pix.height;
>  	width = stream->pix.width;
> @@ -746,6 +743,7 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>  	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
>  	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
>  
> +	spin_lock_irqsave(&interface->irq_lock, flags);
>  	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
>  	int_temp |= int_mask;
>  	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
> @@ -753,6 +751,7 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>  	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
>  	int_temp &= ~int_mask;
>  	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
> +	spin_unlock_irqrestore(&interface->irq_lock, flags);
>  
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_Y, vlw);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_Y, vlw);
> @@ -769,26 +768,21 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>  	 */
>  	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RK3588_MIPI_CTRL_CAP_EN);
>  
> -	ret = 0;
> -
> -out:
> -	v4l2_subdev_unlock_state(state);
> -	return ret;
> +	return 0;
>  }
>  
>  static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
>  {
>  	struct rkcif_interface *interface = stream->interface;
> -	struct v4l2_subdev_state *state;
>  	u32 int_temp = 0, int_mask = 0;
> -
> -	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
> +	unsigned long flags;
>  
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, 0);
>  
>  	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
>  	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
>  
> +	spin_lock_irqsave(&interface->irq_lock, flags);
>  	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
>  	int_temp &= ~int_mask;
>  	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
> @@ -796,10 +790,9 @@ static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
>  	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
>  	int_temp &= ~int_mask;
>  	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
> +	spin_unlock_irqrestore(&interface->irq_lock, flags);
>  
>  	stream->stopping = false;
> -
> -	v4l2_subdev_unlock_state(state);
>  }
>  
>  static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
> @@ -881,6 +874,7 @@ int rkcif_mipi_register(struct rkcif_device *rkcif)
>  		interface->in_fmts_num = ARRAY_SIZE(mipi_in_fmts);
>  		interface->set_crop = rkcif_mipi_set_crop;
>  		interface->streams_num = 0;
> +		spin_lock_init(&interface->irq_lock);
>  		ret = rkcif_interface_register(rkcif, interface);
>  		if (ret)
>  			continue;
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> index 4d9211ba9bda8..16a5ecb25c2fb 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -198,6 +198,9 @@ struct rkcif_interface {
>  		struct rkcif_dvp dvp;
>  	};
>  
> +	/* interrupt enable and status are shared by the streams of a block */
> +	spinlock_t irq_lock;
> +
>  	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
>  };

Could you please add this to this patch to fix the timeout issue when
stopping the stream: I sent a patch series to fix some issues on the
rkcif driver.

I fixed also the stop stream timeout issue and then I saw
that it is quite similar to your patch.

You can give this a test and tell me how it goes:

$ git diff
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 66726f654674..c72e22e0d726 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -308,10 +308,6 @@ static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
        u64 mask;
        int ret;
 
-       mask = BIT_ULL(stream->id);
-       v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
-                                   mask);
-
        stream->stopping = true;
        ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
                                 msecs_to_jiffies(1000));
@@ -319,6 +315,10 @@ static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
        if (!ret && stream->stop_streaming)
                stream->stop_streaming(stream);
 
+       mask = BIT_ULL(stream->id);
+       v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
+                                   mask);
+
        pm_runtime_put(rkcif->dev);
 
        rkcif_stream_return_all_buffers(stream, VB2_BUF_STATE_ERROR);

--
Kind Regards
Mehdi Djait


