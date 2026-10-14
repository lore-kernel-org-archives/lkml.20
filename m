Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4930341442D;
	Wed, 14 Oct 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014971; cv=none; b=TNMtmDs9hn58Vpi0Qmiek4dp2kBcns92646RWUDXObIe2eabhABOdgxCICLAoV3/ReOkf58pdQApMP+fPhXMK7/mTrIXBZVrICt77SwS5lynVlzb7n0N3MtgElJovs97GrZ6ljL0Gq74C4aTVe0oWBlPsgjjvOb5B0wFly1emc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014971; c=relaxed/simple;
	bh=7uB7pWYKGkJ0kAF2Aw86BM8RV0dxWrCfnl6W2JEIN6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uayeev4HVIvmv8IcYfXd3KY/OOgE6kOBe7DO+ncwS13tj1Uafyg5WmsoTs6Ly470WtX88qIEnJhnyttcQaGjcP9dKr/4yFZtFKbOiSi2n9S7fA6h6MxevwnG6fCNgOCjar62icoWnkkSSFKExGyduR/nJWCulp+OFvy80qAgFj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wTGgkj5P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wTGgkj5P"
Received: from killaraus.ideasonboard.com (unknown [80.155.15.37])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9315BC;
	Wed, 14 Oct 2026 23:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792014844;
	bh=7uB7pWYKGkJ0kAF2Aw86BM8RV0dxWrCfnl6W2JEIN6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wTGgkj5PBvgb9lbmG/k+vWjnOOQZfx0fifY2n9Ijxa25iE3w+SRFGs9paNrdWdGFh
	 T0ygxjOr2Mr09vZ/EuS3/MfpXZcqeabDEWT4OV/P9HnjRzkr0R91b7hM/XwNZpU65R
	 nCmPkFuYzDSzuD5q4vkJrmD700UyWdrKBNEvD+io=
Date: Wed, 14 Oct 2026 23:56:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Message-ID: <20261014215606.GB283442@killaraus.ideasonboard.com>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>

Hello Guoniu,

Thank you for the patch.

On Fri, Oct 09, 2026 at 06:58:41PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.
> 
> The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
> parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
> component ordering. Supporting YUYV allows sensors and bridge devices
> that output YUYV formatted YUV422 data to be used with the i.MX MIPI
> CSIS driver without requiring format conversion.

What sensor(s) do you have in mind ? CSI-2 does not support other
component orderings, the YUV4222_8B data type specifies the ordering on
the bus as [U1, Y1, V1, Y2], and V4L2 maps that to
MEDIA_BUS_FMT_UYVY8_1X16.

> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 5f9691d76434..14a00b9fcedf 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -382,6 +382,11 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  		.output = MEDIA_BUS_FMT_UYVY8_1X16,
>  		.data_type = MIPI_CSI2_DT_YUV422_8B,
>  		.width = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.output = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.data_type = MIPI_CSI2_DT_YUV422_8B,
> +		.width = 16,
>  	},
>  	/* RGB formats. */
>  	{
> 
> ---
> base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
> change-id: 20261009-csis_sam-c5c10ed12322

-- 
Regards,

Laurent Pinchart
