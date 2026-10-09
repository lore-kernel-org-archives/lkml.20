Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C5C17A2E8;
	Fri,  9 Oct 2026 02:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512234; cv=none; b=c3XU71IDppsDSk4/8gETzrcyYvxjDYHydr8Hru/6425GZjjYAP/x00lcrbY6DqVGlIyIOe1uWpVGTSFx6I7lWysatjVWzboPYEB9+PW64L0L5PTqQRBK+MBqI2F5U+gqgyHc1knFTPf43gQBQLABekwVureUZiMRjokZmJ9fHzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512234; c=relaxed/simple;
	bh=jfsbdW7/pTOvhkKRZ6rmQMqtnSuojdpoKiXoAOqJTc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWyv14GLt9WMqmrpyv9RpJNQU97V+yxME/vH98xbvfAuRXbCrmr4804+DjXyEeELF+SjSIIWfQA85yjUdKqXYwcb3D3Uoa24iMOI3x91fDFjCMFkEzG20v6E4zyAjjtazwnVvvCbXdgONiwOQ25PNOZFskzWWDNt0/AZjdX5bbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UC4aXYb9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UC4aXYb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F641F00898;
	Fri,  9 Oct 2026 02:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791512232;
	bh=zGiPqQSb8vENMlB+2sJF4qgl6aNktUhyvgbWBRokrjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UC4aXYb9mAzllJl2Dpu2wdAKPfsWBvhZI0OGl5aexY7iO2gS3qjj9znqIuWbSBrqJ
	 n7aFrjhCX27+XsjzuG/GAPj95bfSI5/GVldi78HbAb2j9W/aE7qWwGyttgA+Pno2vp
	 NucvCmjZqbnaeZtSN7g2sh8fJ4gHwc3eTDs9/P6l5mJirAYWEtUq5fJt+bJhjKLDH9
	 rkBkTDwCjk/pmijoK1zpBlHugJYqT7mGmmFfKvm8GjvFCLfS/p8UEs27aVOpRBOlz3
	 6DXZZhlh0eg7t1WWDzEXUXizvLOWycoS7Rog+jmVlIxiWOz9i56FVbNLzwMOMdC8Ct
	 0MYeSruZrdFDg==
Date: Thu, 8 Oct 2026 19:17:11 -0700
From: "Peter Chen (Qualcomm)" <peter.chen@kernel.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: report endpoint reset timeout
Message-ID: <ashOp1L9Jq-tcdTN@hu-petche-lv.qualcomm.com>
References: <20261003081152.433499-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003081152.433499-1-yaojiale02@163.com>

On 26-10-03 16:11:52, Jiale Yao wrote:
> cdns3_gadget_ep_disable() discards the endpoint reset poll result and
> then tests ret, which is still zero. A reset timeout is therefore
> neither reported nor returned to the caller.
> 
> Store the poll result in ret so the existing diagnostic and return path
> expose the timeout.
> 
> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Add: Cc: stable@vger.kernel.org, otherwise:

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/cdns3/cdns3-gadget.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index 42311c1bfada..53cc535309c5 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -2530,9 +2530,9 @@ static int cdns3_gadget_ep_disable(struct usb_ep *ep)
>  				  !(val & EP_STS_DBUSY), 1, 10);
>  	writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
>  
> -	readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> -				  !(val & (EP_CMD_CSTALL | EP_CMD_EPRST)),
> -				  1, 1000);
> +	ret = readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
> +					!(val & (EP_CMD_CSTALL | EP_CMD_EPRST)),
> +					1, 1000);
>  	if (unlikely(ret))
>  		dev_err(priv_dev->dev, "Timeout: %s resetting failed.\n",
>  			priv_ep->name);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
