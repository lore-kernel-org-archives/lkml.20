Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993B53921D8;
	Mon, 14 Sep 2026 23:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429711; cv=none; b=HTMLDQDfWtgSHdl4nYuY5y2+G6fKyHuOhasPoQu9KQcfUcRlLYTcjXP9hllELhUunMYUlgyTJ5PEKYghwC5TUuRchZvTsX2R4BRLDrO7USN1UOq5XReha3ElCfJgFXr3bPNelffPBSJio6CY4+w3gfYsrWKM9rGKVyLJ7gFv8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429711; c=relaxed/simple;
	bh=tULWwH62VQMESKfBVhG2CV6lqkdVfbuPf1NEtG0VYdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLCX14Fz7M72sOajBAsG8TnXxLX3q/zGTRnijFj5T3xeC7HivomzjFdaE3aoLOmU5IvAiohYPZEqREtJU2PTTUHfkJos76oJn4s4OkMeclAQIDiCzYRh8fbM4mKFcAImeT6cyBVT6ql/wpNYEQo6QN1Qx6OQosM5TIafzB8lbjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pj96U3pX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pj96U3pX"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C06D447;
	Tue, 15 Sep 2026 01:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789429606;
	bh=tULWwH62VQMESKfBVhG2CV6lqkdVfbuPf1NEtG0VYdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj96U3pX/+W6GwchjLwZPO+Fx2cGKnYC2ZTcIgcjIammj/C8i5GZOTmO2GG1WoueV
	 5IPdszO+1egDGAP7IktJY4f/IdIXNQR0lEwx1XW6XrhvGj3teNuNaq4nja2ZoI3A89
	 bot6RDCJhWliXHqRUNd9SDU+ctgb3AWyP+FN11zc=
Date: Tue, 15 Sep 2026 02:48:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: imx8-isi: Reorder mxc_imx95_data to follow
 mxc_imx93_data
Message-ID: <20260914234825.GB2796257@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-1-fafdb4b446d4@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-1-fafdb4b446d4@oss.nxp.com>

On Mon, Aug 31, 2026 at 11:36:56AM +0800, Guoniu Zhou wrote:
> Move mxc_imx95_data definition after mxc_imx93_data to match the
> order defined in the of_match array.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 0ae5f35e017c..f2a8eb82fbfd 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -314,18 +314,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>  
> -static const struct mxc_isi_plat_data mxc_imx95_data = {
> -	.model			= MXC_ISI_IMX95,
> -	.num_ports		= 4,
> -	.num_channels		= 8,
> -	.num_vc			= 8,
> -	.reg_offset		= 0x10000,
> -	.ier_reg		= &mxc_imx8_isi_ier_v2,
> -	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.buf_active_reverse	= true,
> -	.has_36bit_dma		= true,
> -};
> -
>  static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
> @@ -384,6 +372,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx95_data = {
> +	.model			= MXC_ISI_IMX95,
> +	.num_ports		= 4,
> +	.num_channels		= 8,
> +	.num_vc			= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= true,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */

-- 
Regards,

Laurent Pinchart
