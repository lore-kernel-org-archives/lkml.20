Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92D393DEB;
	Mon, 14 Sep 2026 23:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429868; cv=none; b=cfDlfJ6eZWkHi9QJw1+HsyDRyFmb8uvhweE5uRCCFMSqM6lz403RtJXlJq3dCFMyqkSrGBFJt3/NC6KVVuxzAtpfZTGCV/30x8w83LWOu+B709bDD/86SCCRegChzJUg5Sy/Dl+yIT5vCp2Rey713i/aawmr+7Px/sqOw4BzPt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429868; c=relaxed/simple;
	bh=sU/PO7Z5sXrjnUmj9i4QwpdDF5i8z7u6FxVpK59VV1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDFckhtPevC63LjLxheQ3Gpli08WsLkjp74fluKW+zrLfIlOvL8JH+qqeDcxY/rYpKEfVtSYQYnFnxwMx2F6Du85iW+kR36mCSt2Sx7gyI6J5MTUL3RNIsiKD+DnJxMOZy5jDKw67TF2kVtmtnweRZuhIcB6Lsp35SA/mVr4wCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qGfE91vu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qGfE91vu"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E909D447;
	Tue, 15 Sep 2026 01:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789429765;
	bh=sU/PO7Z5sXrjnUmj9i4QwpdDF5i8z7u6FxVpK59VV1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGfE91vuLn74KbNCwBjGzl/Z7GD3xOOfYm8AVjEX5DmfvWQjb4s7zLrMiT2VU94UX
	 xH6EU+4Sp1mdfDj3t8tQjet/rLJJ9YtKLTANrLnIvXlGp22HYpN1iiby6ejO0bhW80
	 AdaljZPcYv02P/3F2lblPsYx4VBT9smMW8Qwdi1c=
Date: Tue, 15 Sep 2026 02:51:03 +0300
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
Subject: Re: [PATCH v2 3/6] media: imx8-isi: Remove unused model field from
 platform data
Message-ID: <20260914235103.GA2804748@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-3-fafdb4b446d4@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-3-fafdb4b446d4@oss.nxp.com>

On Mon, Aug 31, 2026 at 11:36:58AM +0800, Guoniu Zhou wrote:
> The model field in struct mxc_isi_plat_data and the corresponding
> enum model are never referenced in any driver logic. Remove them
> to simplify the platform data structures.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

The idea behind this field was to enable model-specific code paths in
the driver. That may still be useful later, but we can always
reintroduce the model field then. I'm fine dropping it for now.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - New added in v2 (Frank)
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c |  8 --------
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 12 ------------
>  2 files changed, 20 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c1c16dbc1539..e627054bbc8e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -291,7 +291,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> -	.model			= MXC_ISI_IMX8MN,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0,
> @@ -304,7 +303,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8mp_data = {
> -	.model			= MXC_ISI_IMX8MP,
>  	.num_ports		= 2,
>  	.num_channels		= 2,
>  	.reg_offset		= 0x2000,
> @@ -317,7 +315,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> -	.model			= MXC_ISI_IMX8QM,
>  	.num_ports		= 5,
>  	.num_channels		= 8,
>  	.num_vc			= 4,
> @@ -330,7 +327,6 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> -	.model			= MXC_ISI_IMX8QXP,
>  	.num_ports		= 5,
>  	.num_channels		= 6,
>  	.num_vc			= 4,
> @@ -343,7 +339,6 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> -	.model			= MXC_ISI_IMX8ULP,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0x0,
> @@ -355,7 +350,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx91_data = {
> -	.model			= MXC_ISI_IMX91,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0,
> @@ -367,7 +361,6 @@ static const struct mxc_isi_plat_data mxc_imx91_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx93_data = {
> -	.model			= MXC_ISI_IMX93,
>  	.num_ports		= 1,
>  	.num_channels		= 1,
>  	.reg_offset		= 0,
> @@ -380,7 +373,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  };
>  
>  static const struct mxc_isi_plat_data mxc_imx95_data = {
> -	.model			= MXC_ISI_IMX95,
>  	.num_ports		= 4,
>  	.num_channels		= 8,
>  	.num_vc			= 8,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 05c21c448b93..73f6ea7b0ea1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -155,19 +155,7 @@ struct mxc_gasket_ops {
>  	void (*disable)(struct mxc_isi_dev *isi, const unsigned int port);
>  };
>  
> -enum model {
> -	MXC_ISI_IMX8MN,
> -	MXC_ISI_IMX8MP,
> -	MXC_ISI_IMX8QM,
> -	MXC_ISI_IMX8QXP,
> -	MXC_ISI_IMX8ULP,
> -	MXC_ISI_IMX91,
> -	MXC_ISI_IMX93,
> -	MXC_ISI_IMX95,
> -};
> -
>  struct mxc_isi_plat_data {
> -	enum model model;
>  	unsigned int num_ports;
>  	unsigned int num_channels;
>  	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */

-- 
Regards,

Laurent Pinchart
