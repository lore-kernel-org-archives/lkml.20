Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C9751814C;
	Tue, 29 Sep 2026 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685267; cv=none; b=jS1ybcHH48n/QsNp/h+8ujWg6AFtCmtgmdpISn8MbUC4mGA5eykY7AL63YEdknQPRM/+oJzLBcAyUM75RQQMfTrAPEkL6uFsHj5Ae9A5TN2nkQI8tggk9FfVgA5FnahuOcAr7bvYWbBm/7rnlOkm2/wOQvTvt60OTNPPukvTTJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685267; c=relaxed/simple;
	bh=fCKWi2QDPT1h5kFh3IYMBx7BAmHDa64Q4UYl1zBfbDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRN8Nr48lXUYMh5T5tZLX9i462Vqs1QXXOH1KTnp3CBNusCQznvBbwD7bny9pNXnaOCW1PgC7geq68iPvyf+kq+YJXcbxnBUhgWHOuNPAxvGgWOrXueEGfZfScW0EkXfgmCqoS1aNECr0SwYLvLY/I6sJ69JOxt7XIu+8asd6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=awCNgN7n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="awCNgN7n"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E17B3C3D;
	Tue, 29 Sep 2026 14:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790685153;
	bh=fCKWi2QDPT1h5kFh3IYMBx7BAmHDa64Q4UYl1zBfbDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awCNgN7nTzR3LJ2HGhsVUMy8Ntxl0V50Y76shdD1n8gEPrBVsd9E/vGX11pP4Roxn
	 A6ILWGewEAvVHb/nQ2iJbwJZ/gLJmMr4JjUAiAZmwUG8DWjohTaJLkoq8kBhtd73kQ
	 tQ+yHlo9M248mvcNp6Qj5bAq7JtovmL1N4Zxtu8U=
Date: Tue, 29 Sep 2026 15:34:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] media: uvcvideo: report AUTO_UPDATE controls as
 volatile
Message-ID: <20260929123422.GA349401@killaraus.ideasonboard.com>
References: <20260928215021.819064-1-jordan.mymail@gmail.com>
 <20260928215021.819064-2-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928215021.819064-2-jordan.mymail@gmail.com>

On Mon, Sep 28, 2026 at 05:50:18PM -0400, Michael Jordan wrote:
> AUTO_UPDATE controls can change on their own, and the driver already
> re-reads them from the device. Tell userspace by setting
> V4L2_CTRL_FLAG_VOLATILE, plus EXECUTE_ON_WRITE for writable controls
> so that writes are not ignored.

Writes are not ignored by the driver regardless of whether or not
V4L2_CTRL_FLAG_EXECUTE_ON_WRITE is reported to userspace.

> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Assisted-by: LLM
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83f1d..aceb263103e9 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1840,6 +1840,17 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>  	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX) &&
>  	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
>  		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;

A blank line here would be nice.

> +	if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE) {
> +		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +		/*
> +		 * Writes to a volatile control are documented to be ignored
> +		 * unless EXECUTE_ON_WRITE is also reported. The driver sends
> +		 * every write of a writable control to the device, so report
> +		 * the flag accordingly.
> +		 */
> +		if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
> +			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +	}

The V4L2 documentation also states

  Setting a new value for a volatile control will never trigger a
  V4L2_EVENT_CTRL_CH_VALUE event.

This patch seems to break that as we unconditionally send
V4L2_EVENT_CTRL_CH_VALUE events on control write for controls that don't
have UVC_CTRL_FLAG_ASYNCHRONOUS set.

>  
>  	if (mapping->master_id)
>  		__uvc_find_control(ctrl->entity, mapping->master_id,

-- 
Regards,

Laurent Pinchart
