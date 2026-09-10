Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B598718859B;
	Thu, 10 Sep 2026 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047498; cv=none; b=eMkndScWA3lbh87myc637A+lX/zGaSrDzzJZ1aGbt1jAqD4TZOR0LrQzOfZbbcBO+ezwhL6XaKSKAEx860FeSy9jyb6aVzS2BjFdSnkyO6Lg11Bxc7mqJhGjv7qPJcQCAEyMjVZd6yICYCXcvdEAjwnNSnw5zWq+YyGEv44XeuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047498; c=relaxed/simple;
	bh=KERzQXu4AuOB8o41LGXwQ6MDdb42/46HViF8vTcqx2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tx9YpLeQczu8gPt/u2cZB62TCpohMag+7Iuu1Ub9mWVXGbOBdLT6Dq3KUJQhnhGYVPlQnZUfM4lFFMdl/BgRzVEFfLc6Ti3n57PYVVeiwwyx/hBlNCpnjIZdo6WbzcruelBQ0aRAuxIyruO8QilyvXzs+OybEE3H85ml0/eAQjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xsNrvoCs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xsNrvoCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24CB1F000FF;
	Thu, 10 Sep 2026 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789047496;
	bh=IXBSAOGIh6jCZvCkv9yCum8ZJroML+LqgNj3BgTtpxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xsNrvoCs9Ftw5+cXXa+IjekEtsA6YzktE0MZJSCvJtXliyEzc6/DT/+fV33QVUdc2
	 W7UGTKGoHLg1MucSEEoonFQOfEExOoSj6h4fbOGOzlJG4Ip2WbRgir5VW++FBCcHDG
	 L13Wj+On8GsdLvIp+T7d8A4WHlexX2oUAitBXOmU=
Date: Thu, 10 Sep 2026 15:38:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: phucduc.bui@gmail.com
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
Message-ID: <2026091054-preflight-capacity-e7e2@gregkh>
References: <20260810093112.47807-1-phucduc.bui@gmail.com>
 <20260810093112.47807-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810093112.47807-2-phucduc.bui@gmail.com>

On Mon, Aug 10, 2026 at 04:31:12PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
> was logged with dev_err_probe(), but its return value was ignored and
> probe could continue with a successful return value.
> 
> Store the error returned by dev_err_probe() in ret and jump to the error
> path to propagate the failure.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Link v2: 
> https://lore.kernel.org/all/20260807065619.30604-2-phucduc.bui@gmail.com/
> Changes in v3:
>  - Use the phy_shutdown label instead of err_clk as suggested by 
>    Sashiko's review. 
>  - Add Peter Chen's Acked-by tag.
>  - Add Frank Li's Reviewed-by tag.
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 9e529398c607..edbf9df9b8f2 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -532,8 +532,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> -			goto err_clk;
> +			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			goto phy_shutdown;
>  		}
>  
>  		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> @@ -541,7 +541,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  						IRQF_ONESHOT | IRQF_NO_AUTOEN,
>  						irq_name, data);
>  		if (ret)
> -			goto err_clk;
> +			goto phy_shutdown;
>  	}
>  
>  	ret = imx_usbmisc_init(data->usbmisc_data);
> -- 
> 2.43.0
>

This patch did not apply, please rebase and resend.

thanks,
greg k-h
