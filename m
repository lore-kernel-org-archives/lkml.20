Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381342;
	b=jzUsQSnPtg7KZ1CNWZ0Nrm3wYEQ5UCxRPM4ctOSdT6ORTYIiMUOvf7kVdVfK00ULp32f
	 SQ3I5RK7bYEYKQ7Rsxf/6tBoJsl7/D0J3go8XC/nSi9XWOBqpPIJSmwgbYqRWnl1J/TUh
	 31lbFhpwM3ei4Ov8wV9s4p5PyyAPxjFKtdsXT2asdO24zLRWxwxuwHIGXEghR4DsYOT38
	 BWXJ8H8RQQrnN+2Q3fkB69cEnpqn88TsvH+vL1Fs1ysZIxcnekqSEnG+YYlhFuPWaCaXU
	 KKjhtZ1UD4QhSeG4Bfj1ePiw4NZWKNZev/G9onU2sagKr+vduNqum4vQYGq4Je19kiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381342;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BKB9YU9G4hYp/Q9/iLpzesM8JvO0PHOtL0Jo4MQjYbA=;
	b=zyCN2ClbZAfihjyfOxY+OwXTcfnmtz0NyYNgjlqVTcpE41/zlXmPHP456dyRAM+Kxgo1
	 IDQnjdChCt76G3ql5KguOpJvKMCMy6WmtlDcwUGIHNEgYxyeJMvb5Jw/gQ5IknDGasFfS
	 NgQV7VXqQCeVI3pK+jIR2V4ESqMd59oxSk6usxRENSWcVgHS6zTBjFq0EkyPJIrt/TGqz
	 UGlH3TUYK+SysmjHNt7jlo6YCpbdLSETYNRvjSssCPJpmT7mpZpQWpAkucU6NfAhj9Arg
	 fNcaRBXB6ZiQ3qFLYuueJxxUJmGCZmO9sANXx/iiwUo0Sp4MDkdHsFGNMJYOCSI/rjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OvYvZJQ3;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67995606A320;
	Wed, 11 Nov 2026 07:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67995606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OvYvZJQ3
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DB69BE;
	Wed, 11 Nov 2026 08:13:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794381196;
	bh=EOOOdZn6ZuJOJZmkzIxD+ZiRU1z3rhPSZ6gEaHREQqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvYvZJQ36wbEqBaoCTqk/AT+dQKmJxFV+LBJ0YlnttVGAFcwDA8DUaUpVvnpanuig
	 NdHbS5DEzwQBgoQ1HzVSsQGmHxH0W5BvVq3VgD0vOj5rjmZANVMFho9Lzx6iDiClbd
	 lxrOuITt57HN0vI3xc370AdDQamlxjrP874sU0CQ=
Date: Wed, 11 Nov 2026 09:15:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <20261111071538.GD86558@killaraus.ideasonboard.com>
References: <20261111022822.67474-1-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111022822.67474-1-rosenp@gmail.com>

Please see my comments on v1.

On Tue, Nov 10, 2026 at 06:28:22PM -0800, Rosen Penev wrote:
> Use a flexible array member to combine allocations.
> 
> It looks like pipes never gets freed anywhere. Meaning this effectively
> fixes a memory leak.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v3: use devm_kzalloc_flex
>  v2: add fixes tag, fix typo, and move pdata assignment to original
>  place.
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 10 ++++------
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 2005584a1215..dcf6c25d7faa 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -473,24 +473,22 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
>  
>  static int mxc_isi_probe(struct platform_device *pdev)
>  {
> +	const struct mxc_isi_plat_data *pdata;
>  	struct device *dev = &pdev->dev;
>  	struct mxc_isi_dev *isi;
>  	unsigned int dma_size;
>  	unsigned int i;
>  	int ret = 0;
>  
> -	isi = devm_kzalloc_obj(dev, *isi);
> +	pdata = of_device_get_match_data(dev);
> +	isi = devm_kzalloc_flex(dev, *isi, pipes, pdata->num_channels);
>  	if (!isi)
>  		return -ENOMEM;
>  
>  	isi->dev = dev;
>  	platform_set_drvdata(pdev, isi);
>  
> -	isi->pdata = of_device_get_match_data(dev);
> -
> -	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
> -	if (!isi->pipes)
> -		return -ENOMEM;
> +	isi->pdata = pdata;
>  
>  	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
>  	if (isi->num_clks < 0)
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 58b47335afc7..3165a65391c1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -297,7 +297,6 @@ struct mxc_isi_dev {
>  	struct regmap			*gasket;
>  
>  	struct mxc_isi_crossbar		crossbar;
> -	struct mxc_isi_pipe		*pipes;
>  	struct mxc_isi_m2m		m2m;
>  
>  	struct media_device		media_dev;
> @@ -305,6 +304,8 @@ struct mxc_isi_dev {
>  	struct v4l2_async_notifier	notifier;
>  
>  	struct dentry			*debugfs_root;
> +
> +	struct mxc_isi_pipe		pipes[];
>  };
>  
>  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;

-- 
Regards,

Laurent Pinchart
