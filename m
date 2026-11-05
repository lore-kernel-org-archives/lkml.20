Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.155.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868775;
	b=exhJg2Nx1hnRz4YEmY3dUrYI8xz5/UbTNIfjK6/Z3y4jqSLbkHQMY0x/Pz/D6nypICxh
	 v49c1Rh5XXOkjB5Ol1gAELyrfZL7Ema0DKA/Mz1YoHOatDUYqxnWerYva6NsHm0oe34VH
	 M5XoJcC1Tjli5bC5DszHWR8AwGiu0fOMKPXdBvkONmL7Srj7lGznixs64wmlMBWM1Lx/q
	 X9108M1ABqimFmBx/ZcuXZ9dNfLvUzdReafKwR5iwxvllY2qpNSt8rUjKv5FVisEZRE9d
	 Sqk7jurTjvjTkwnYZ8Sm5HZXHQYo4lm2ijZFs4sKdEC028FYpTTTAhH+ltylJEx0ofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868775;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=AMLcD+hGM2YOapN/sUnfnykNRt6o0ap1kwwr8NVUnQg=;
	b=ZcF2WwI/E+ZVaodF3D0xcaYf+luXst9Y9YKweWlpbprRxBWrC1sIbysIcp3977sM+jzP
	 Z/YtWUFsuR2HxgE+Km3fB4uAD0EFR02JDRqrOgJCNxCji+ACXVTg1OjGcE+95Gni+KFFJ
	 IFPmnU4QBWKv3UzeIPMa0MwtATpOGxvxPuYqIjJ5gZdBHu2YG4RfTbGoSkUOYoVwvdXUK
	 sTV9dwvEb6C4ZEZJHvKkRMdqDOvrLW16Ih8Vjre7V6somZbekmZ7DbGkb5vXlqWJNG8ox
	 XhT9xIwkddWhWr7YZ4F+sQumAJTd44Dry2AkVfCfSXJbO7P8V3oXKpomiKXPCjaRdcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=enneenne.com;
	spf=pass smtp.mailfrom=enneenne.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=PmAjAabQ;
	arc=none smtp.remote-ip=62.149.155.132
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E807606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E807606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=PmAjAabQ
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id OtDAx2STqgnmROtDAxllGL; Thu, 05 Nov 2026 09:52:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1793868765; bh=dqeyyXqzyoH8AV7yuk+9uMwG31IpZYucUyBKTQ2/Chs=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=PmAjAabQkdbU5EmCkYAcu7O6V2HGxLLgyTWBCoU0JNRDhVPFPckwPbc0arUS06fga
	 bp2XbiAwjmm61nZVZojSS3DVGWlX+gekvjOWII6HwbpFFvzR+hAjq4n8ZoQK3SLY3I
	 /Ze7l2LXwmw/PWDArpDxJN8oVk0sZi13dIqtd/qMvlw068ZXtoqMf8V6x7NwW2Ck9L
	 NQ55wDx36SJquXC0opiYKBS7eXgVB2pzwwJsqr/Zfb/YhlnyNxuJieW2nkuf/iaMWc
	 wFp/W4kJcmm6jaVKnLXbA8h0XHahSk8JD8JKa+6WJiPHsOu/3nohK+YcTL4HuFU9ta
	 KKszeNhrH+Kdg==
Message-ID: <15a9c1ef-3ab7-40fb-995a-f94300939597@enneenne.com>
Date: Thu, 5 Nov 2026 09:52:43 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pps: parport: release port claim before unregistering PPS
Content-Language: en-US
To: Yaohan Li <shunsheng1218@gmail.com>, akpm@linux-foundation.org
Cc: akpm@linux-foundation.org, lasaine@lvk.cs.msu.su,
 linux-kernel@vger.kernel.org
References: <179378570450.72941.3525412815403628312@gmail.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <179378570450.72941.3525412815403628312@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOztcoRMpgOcEurCiulDS+62tGgWWL3do3wThWJrGnqJNzW5Vz2c3y5D1oIj259QSDUqj2jDE/iXL8SVmUI6+Ea4DE4dmOGNe79UcREw957rchAl5Hkn
 NrZ//xoMOVzC+8W/c0bnbClwPXru2tZch6coJAa3CnmqLUXn4s0u3FXALBlz+RRoBm7eTJ1nB0d/JAKY6WSKV9BNyVkh8l4vKg59MZt+0GVW2ieHGptbfW0M
 knTCtktD5PBnTB+ma2bp/jxvxS2hXkMmQpiN54DzrKDggy3x32xuQyZHYb43lWXJ1uQg/B9ntN4V0wxioE8NUQ==

> parport_detach() unregisters the PPS source before releasing the
> parallel-port claim. Disabling interrupts does not necessarily drain
> an interrupt handler already in progress, and the handler can still
> reference the PPS source after it has been released.
>
> Release the parport claim first. parport_release() synchronizes with
> interrupt handlers using the parport claim lock, so the PPS source
> remains valid until the existing handler has completed. Unregister
> the PPS source only after the claim has been released.
>
> A KASAN test using the actual pps_parport detach and interrupt paths
> reproduced the use-after-free before the change and did not report
> it under the same injected interleaving after the change.
>
> Fixes: a10203c691eac ("pps: add parallel port PPS client")
> Assisted-by: ZCode:GLM-4
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> ---
>  drivers/pps/clients/pps_parport.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pps/clients/pps_parport.c b/drivers/pps/clients/pps_parport.c
> index f5af18bc2971a..8031446db8ada 100644
> --- a/drivers/pps/clients/pps_parport.c
> +++ b/drivers/pps/clients/pps_parport.c
> @@ -209,8 +209,16 @@ static void parport_detach(struct parport *port)
>  	device = pardev->private;
>
>  	port->ops->disable_irq(port);
> -	pps_unregister_source(device->pps);
> +	/*
> +	 * Release the port claim before unregistering the PPS source:
> +	 * parport_release() takes cad_lock for writing, which drains any
> +	 * in-flight interrupt handler (parport_generic_irq() calls our
> +	 * irq_func under cad_lock for reading, touching device->pps).
> +	 * With the old order the handler could still run after
> +	 * pps_unregister_source() had freed the pps_device.
> +	 */

Just a nit, only if you need to respin: IMHO the last two lines of
this comment could go, since they describe the old code rather than
this one, and the commit message already says it.

>  	parport_release(pardev);
> +	pps_unregister_source(device->pps);
>  	parport_unregister_device(pardev);
>  	ida_free(&pps_client_index, device->index);
>  	kfree(device);

Acked-by: Rodolfo Giometti <giometti@enneenne.com>

Thanks,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming
