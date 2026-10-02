Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F553254A9;
	Fri,  2 Oct 2026 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905605; cv=none; b=MFBM+ARPCKOFSRy0fvwhdpN4/kwgNZZjN/9tFBo2AfFA+3vORHiYaPnTdnyixI7wMQW8iJ3mmIkh+MHGkVNp+byxOSkbN6otB+Ryn1MerX5GyenA2g5Ph+L1awFEfwYHqc0b4O02lNQ7M8ZrxwU4MbJCOz6/wtCsWIu7QMQ/BWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905605; c=relaxed/simple;
	bh=oICVcHOz2Wfgzqh7GpipejxF0d1OizMTX25Z+t8idAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tV0W6/bVXZIJJz9IqCBR5eVDmp4S78qoKKBao2QWEoYMttVa+VX+THtdE5gCEYzAgIyLRTMsPvR1pA2B7refZdB1EM61CpiAEXXxhpefXa9sZXoBtbA3vkAgcQm3sZrsuRFl6rQ3Kg8vS517EwBdoCvfWfGu2DGpFiO6P7Es7dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DL47LK26; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DL47LK26"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4333227;
	Fri,  2 Oct 2026 03:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790905489;
	bh=oICVcHOz2Wfgzqh7GpipejxF0d1OizMTX25Z+t8idAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DL47LK26zxYWCGEwmH0pFphMpQcdDa446j4BIEW/6z2jrfgx1u/HPvf5LspF0B4qm
	 e6PUuZGYTLC1VVDdFuuXDusl9pBhG9xklqDGgx/8Sj4OayueF0WmZ/r+0sa/0dNgYP
	 l4McKnsWX9Tt+e/LWL/mGqJ/C9wK+61dNMGhnAiI=
Date: Fri, 2 Oct 2026 04:46:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jacob Chen <jacob-chen@iotwrt.com>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: rkisp1: Switch to modern PM_OPS
Message-ID: <20261002014640.GB101842@killaraus.ideasonboard.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
 <20261001173610.158931-4-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001173610.158931-4-diederik@cknow-tech.com>

On Thu, Oct 01, 2026 at 07:34:53PM +0200, Diederik de Haas wrote:
> A new set of modern PM_OPS macros got defined in commit
> 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")
> 
> Switch to those new macros so that the PM callbacks are always seen by the
> compiler, but discarded if not used. This lets us drop the __maybe_unused
> annotation from the callback functions.
> 
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

As the three patches in this series are independent from each other,
I've taken this in my tree.

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index f90e01301943..e619a949dbc9 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -305,7 +305,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>   * Power
>   */
>  
> -static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
> +static int rkisp1_runtime_suspend(struct device *dev)
>  {
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>  
> @@ -331,7 +331,7 @@ static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
>  	return pinctrl_pm_select_sleep_state(dev);
>  }
>  
> -static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
> +static int rkisp1_runtime_resume(struct device *dev)
>  {
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>  	int ret;
> @@ -351,9 +351,8 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops rkisp1_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> -	SET_RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +	RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
>  };
>  
>  /* ----------------------------------------------------------------------------
> @@ -815,7 +814,7 @@ static struct platform_driver rkisp1_drv = {
>  	.driver = {
>  		.name = RKISP1_DRIVER_NAME,
>  		.of_match_table = of_match_ptr(rkisp1_of_match),
> -		.pm = &rkisp1_pm_ops,
> +		.pm = pm_ptr(&rkisp1_pm_ops),
>  	},
>  	.probe = rkisp1_probe,
>  	.remove = rkisp1_remove,

-- 
Regards,

Laurent Pinchart
