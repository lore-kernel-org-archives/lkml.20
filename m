Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026F3AB286;
	Sat, 26 Sep 2026 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434516; cv=none; b=jkhOF6WGgsMYfzJt0Ut0d99d6CrFPDhXraIkhcl8UEdio0FMEIbc72favdZCDnJ1gT9pK06DAYRY0RCVxIdeDoEGM274hyXeJjwDG9T5e7jQsoN9T6rno/N1myY7wMexL/5w+R7PEr+AGvJVZnZ1+KDwxyL4KyaIv7760Q2pY2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434516; c=relaxed/simple;
	bh=1xewGzcPzu1zkc5GgR1aR/d+w28PQT84GqRxGO77PuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iopj0GdZI/G9qhYrfhGE2YxSO0zv/rVzfHWmCi1+y1Qe2VvzD69Gc3BUKfQqxB1AKDClDKSGV0V6jeiQ+konDldQvKd9cjfH1XtWWjbw1xvBQuMy9vjNVfnNaBykPc7ZSbSLeGWe3ZbUCmLMxGdXlzzhbSMb8LPdcUA3iRZ3tCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=puYh4aYf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="puYh4aYf"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37E65B5;
	Sat, 26 Sep 2026 16:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790434404;
	bh=1xewGzcPzu1zkc5GgR1aR/d+w28PQT84GqRxGO77PuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puYh4aYf+/598T9+F5R5xyDS0Z95c94B/xaOwVM8aXuWSrB1Pq8JnKqKJY7SSPEEP
	 ax8X7ztdelje6/0VUY1g5EksIuWiZ7+jGW+8kFwqgouLPZFHPFftXudkcJdyZBpI5G
	 1dn6BWqCidXPqADsSUhAlXHfG7DkMIt8KblaCYOI=
Date: Sat, 26 Sep 2026 17:55:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, sakari.ailus@linux.intel.com,
	mripard@kernel.org, jai.luthra@linux.dev,
	jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 8/8] arm64: defconfig: Enable OV2312
Message-ID: <20260926145511.GE764757@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-9-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925133001.2780868-9-r-donadkar@ti.com>

On Fri, Sep 25, 2026 at 07:00:01PM +0530, Rishikesh Donadkar wrote:
> Enable Omnivison OV2312 RGB+Ir based sensor

Why is this needed in the defconfig ?

> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6ec8d3a69c98..f00b8eee15f3 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -954,6 +954,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
>  CONFIG_VIDEO_HANTRO=m
>  CONFIG_VIDEO_IMX219=m
>  CONFIG_VIDEO_IMX412=m
> +CONFIG_VIDEO_OV2312=m
>  CONFIG_VIDEO_OV5640=m
>  CONFIG_VIDEO_OV5645=m
>  CONFIG_VIDEO_S5KJN1=m

-- 
Regards,

Laurent Pinchart
