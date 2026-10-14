Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9C9282F14;
	Wed, 14 Oct 2026 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989257; cv=none; b=IoDYtkyhNw6S15NGjOlpgdqn3Zsce51X4QRc3q0HsH65njhEkwN+cXaUNkc/wzRw62bg3cIc1PKGYxe6t//C1QrdPaFKwZkgvH8NZGtVQikhsTNDChBpD9YKnWDMxqoPQM/OKQS2fRHLpoyUIpEqtwk5rxcOevYThW6z+Yny7ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989257; c=relaxed/simple;
	bh=upeD6fUrQMtbrY+ESvSkqKgRSiS+U38urfmzfPe7b0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGrp3sHADLn8j6ZXQyyqRPHEfZNxSAq1R97Pz02x8BQMspr7WqxBsXRmjOuM3dyltZYOVRH4uqmfWXRETh5olX2O3s04eNT9GHAq5FVAus6nK8739ITULFgf5kd1CdM+bvBCdOT4LsAJ/qPAUwx864Cnj8wQoTSnVHw4pR3tUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=s335Ao7X; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="s335Ao7X"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5032148FDFB;
	Wed, 14 Oct 2026 16:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1791988746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=o4aBxesv+vBtVvSxWhefHeqzqJtPvappSmoCf4blYE0=;
	b=s335Ao7XbUWldgKyMzh7twRWMfboqYdP5YUN75P/riJ/gatq/juIoGx5fRSOkdKgsQVHWP
	m5L5cV0J3k0Ou80A/58TPlpKx+ILfZVMJWiyMjS9XfItgcfenhyWZoUPheSVVPtuswQm4a
	aDITQ55NfAkuXZmge3K+KVniUXDGdXwpwLNTHB8rgoFqu3n2LAjXQ1Wgwdu3Wqf975ctya
	s1DyIGkFwirgJz0hzTNWvWHOgnM9x8sc8fHWKzksxHWyRfVU9lAhABvXcMh8ZiFPndntqC
	RuyBH+g8ggh/swxROklZtU6IAY50kQFg7DKw33POQrXgmSoCGqEtgW3bl9+yXQ==
Date: Wed, 14 Oct 2026 16:38:34 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-atmel: Use dev_dbg() for debug messages
Message-ID: <20261014-smugness-lather-c65cb20cf37e@thorsis.com>
Mail-Followup-To: Mihai Sain <mihai.sain@microchip.com>,
	stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261014121656.1634-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014121656.1634-1-mihai.sain@microchip.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Mihai,

Am Wed, Oct 14, 2026 at 03:16:56PM +0300 schrieb Mihai Sain:
> Use dev_dbg() instead of pr_debug() in the probe function
> to provide a more specific device message.
> This ensures the log message is properly associated with
> the corresponding platform device instance.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>  drivers/usb/host/ehci-atmel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 65747270fd88..b6ba7005be69 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -99,7 +99,7 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
>  	if (usb_disabled())
>  		return -ENODEV;
>  
> -	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
> +	dev_dbg(&pdev->dev, "Initializing Atmel-SoC USB Host Controller\n");
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

