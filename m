Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B6E37E5C0;
	Mon, 28 Sep 2026 18:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619837; cv=none; b=LZNsdpip0dNH533c2zhysUOeto880Pu00uDwO7aBhhvaVh4q5p6k3upTwRTl6MwBUFvbQbZ5fzV3aSPqCcfnwrGMnnPgc0q6DvjLC+gMcp3T1X6dtlcd6EfTm4uPFhmGW4AOJrvZZnEC/xq2ap5T+UZF4fDggiyn65qHmU+Vxqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619837; c=relaxed/simple;
	bh=keCE06j/EEKbwX3sMF0CRRD1R2FuaYVDAnj8Z8FVjrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXSpb23jb5D734tuMGQssKMCj3KF/qAx7O3Ml6CbL1V0m1a2x1W55c+A4BR9C7z0xK5n3zLhwX+NvBtjImgpJHxPLLWO+OfH55HOJ+IipSXzQnVbC7DL0KRBHm396ohS1q1PT8A27FYHKhgVw9nIE0oZfcA81HQWtxdAc0kWs7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dgTzoOW/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dgTzoOW/"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBE17C24;
	Mon, 28 Sep 2026 20:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790619723;
	bh=keCE06j/EEKbwX3sMF0CRRD1R2FuaYVDAnj8Z8FVjrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgTzoOW/nzeEfUPbuFSDT6SLW8PTM3B5sf++fOcCPHH/bE0lrhShJuMmYN382hkoq
	 fR6b1tbrmrINfeFk+WUtT/46nOia0v+FOlSrxCSqhxyGBd5Tq/K5xi5SN1GTLU1MKB
	 ayX52zZStpj86/O6lGDwR7LSi54BmcIRo4t3QyDY=
Date: Mon, 28 Sep 2026 21:23:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5670: fix double runtime-suspend on remove
Message-ID: <20260928182351.GD210522@killaraus.ideasonboard.com>
References: <20260928141045.2436838-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928141045.2436838-1-congnt264@gmail.com>

On Mon, Sep 28, 2026 at 09:10:45PM +0700, Cong Nguyen wrote:
> ov5670_remove() calls ov5670_runtime_suspend() unconditionally, and
> that function has no internal "already off" guard -- it always
> asserts the reset/powerdown gpios, disables the regulators, and
> disables/unprepares the clock.
> 
> probe() ends with pm_runtime_idle(), which drives an immediate
> synchronous self-suspend (already calling ov5670_runtime_suspend()
> once) whenever nothing is streaming. That's the common case, so
> remove()'s unconditional second call clk_disable_unprepare()s an
> already-unprepared clock -- hitting the same underflow WARN() fixed
> elsewhere in this tree -- and disables already-disabled regulators,
> on every normal removal, not just an edge case.
> 
> Guard it with pm_runtime_status_suspended(), same as sibling
> imx412.c's remove().
> 
> Fixes: 62ab1e325978 ("media: i2c: ov5670: Add runtime_pm operations")
> Assisted-by: LLM
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

How have you tested this ?

> ---
>  drivers/media/i2c/ov5670.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 01fa892de079..a08bb4e9bfca 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2784,7 +2784,8 @@ static void ov5670_remove(struct i2c_client *client)
>  	mutex_destroy(&ov5670->mutex);
>  
>  	pm_runtime_disable(ov5670->dev);
> -	ov5670_runtime_suspend(ov5670->dev);
> +	if (!pm_runtime_status_suspended(ov5670->dev))
> +		ov5670_runtime_suspend(ov5670->dev);
>  
>  	v4l2_fwnode_endpoint_free(&ov5670->endpoint);
>  }

-- 
Regards,

Laurent Pinchart
