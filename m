Received: from smtp121.ord1d.emailsrvr.com (smtp121.ord1d.emailsrvr.com [184.106.54.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2BF38F951
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=184.106.54.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164013; cv=none; b=aKzX/eptDwbYpVGloZtWKhJU5wCmGaIAlFUgTiaPoVK8f6iA5i+V+nPJWM7kE13DpZ7jhPBkyjwcZsIqL1W+sSQTqAUwEnwmMMYBWt5uK1JDAcVEhAmx1BjrgtqmY5APHuO2+Pz/0MCl+XtWCSVArPeeUfQvr+1vkwDCJy+8Cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164013; c=relaxed/simple;
	bh=L0bMv4UJ9vjb8qQwnMIFCVtKf0POIkiBdhlQPRZ/1Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpHJbKBb7zwhkiFCVefWp9cjaNs9CX1Fd5WSFewP/QBq34wMAkSivXBogPl7pavhIQeXfL+hqmTCYp/TQ6ZhNngc1OdvmucFzK9q0+v1m8cyuupD9JUY34QqZrBGYrmdoZWlJcT3ZXpoErnX116JxQM46qSsTxUd8MwsnWz9Rcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=g001.emailsrvr.com header.i=@g001.emailsrvr.com header.b=g8L8YQ7c; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=R2g/Ts/7; arc=none smtp.client-ip=184.106.54.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=g001.emailsrvr.com header.i=@g001.emailsrvr.com header.b="g8L8YQ7c";
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="R2g/Ts/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
	s=feedback; t=1790155037;
	bh=L0bMv4UJ9vjb8qQwnMIFCVtKf0POIkiBdhlQPRZ/1Bk=;
	h=Date:Subject:To:From:From;
	b=g8L8YQ7cMjsmtMbjKKc8RQrUjB0ZldvwWW8oAWJwF7LKoeAtEgWN4Zzm9owu/GjwO
	 Jl4aa9avLe1zJ3xvQYQS8CdVU2X2Sbtmgjvva48qKIXob7Qg6qoOtE7TY3vUjZ4X2O
	 AV/BEqnIXxDg31XTrOKTqqzzwWAFyd3cUDGqIjBA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1790155037;
	bh=L0bMv4UJ9vjb8qQwnMIFCVtKf0POIkiBdhlQPRZ/1Bk=;
	h=Date:Subject:To:From:From;
	b=R2g/Ts/7ipO9RulkN/OOaExOxD3mbyCefd8qQwTEVH2QXt5LrypwJxcVPZ+VwOMAD
	 M+TYyFiftXcHvDbAoxODnh1nDTLOCUMsEMQDKeexFo9ubBrVTQbo3a0sdkO9m53K7h
	 pVkp85dC1Kbjq5Z88NVmB0XRIfmx7kyjC80DF6hs=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp16.relay.ord1d.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id DF260401FD;
	Wed, 23 Sep 2026 05:17:16 -0400 (EDT)
Message-ID: <aea83784-5f20-4108-9df9-9e3898f126fb@mev.co.uk>
Date: Wed, 23 Sep 2026 10:17:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] comedi: dt2811: fix shift-out-of-bounds in
 dt2811_attach()
To: Rohinthan P <rokinthanp03@gmail.com>,
 H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: linux-kernel@vger.kernel.org,
 syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
References: <20260923060859.15694-1-rokinthanp03@gmail.com>
Content-Language: en-US
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <20260923060859.15694-1-rokinthanp03@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: 7b568c10-7d54-4053-a279-f5ff754e4921-1-1

On 2026-09-23 07:08, Rohinthan P wrote:
> In dt2811_attach(), the driver checks whether the user-supplied IRQ in
> it->options[1] is valid for async command support using:
> 
>      if (it->options[1] <= 7 && (BIT(it->options[1]) & 0xac))
> 
> Because it->options[1] is a signed integer, passing a negative value
> (such as -251) satisfies it->options[1] <= 7 and causes the BIT()
> macro to evaluate a negative shift exponent (1UL << -251), resulting in
> undefined behavior and triggering a UBSAN shift-out-of-bounds warning:
> 
>      UBSAN: shift-out-of-bounds in drivers/comedi/drivers/dt2811.c
>      shift exponent -251 is negative
>      CPU: 0 UID: 0 PID: 5925 Comm: syz.0.17 Not tainted
>      Call Trace:
>       dt2811_attach.cold+0x19/0x1e drivers/comedi/drivers/dt2811.c:570
>       comedi_device_attach+0x40e/0x6b0 drivers/comedi/drivers.c:1101
>       do_devconfig_ioctl+0x1b3/0x6d0 drivers/comedi/comedi_fops.c:930
> 
> Only IRQs 2, 3, 5, and 7 are valid on the DT2811. Add a check that
> it->options[1] >= 2 before evaluating BIT(it->options[1]) to avoid
> negative shift values.
> 
> Fixes: 8ffdff6a8cfb ("staging: comedi: move out of staging directory")
> Reported-by: syzbot+a4cedab706d0a8a3f988@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a4cedab706d0a8a3f988
> Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
> ---
>   drivers/comedi/drivers/dt2811.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/comedi/drivers/dt2811.c b/drivers/comedi/drivers/dt2811.c
> index bcc4b5e..813b1aa 100644
> --- a/drivers/comedi/drivers/dt2811.c
> +++ b/drivers/comedi/drivers/dt2811.c
> @@ -564,7 +564,8 @@ static int dt2811_attach(struct comedi_device *dev, struct comedi_devconfig *it)
>   	dt2811_reset(dev);
>   
>   	/* IRQ's 2,3,5,7 are valid for async command support */
> -	if (it->options[1] <= 7  && (BIT(it->options[1]) & 0xac)) {
> +	if (it->options[1] >= 2 && it->options[1] <= 7 &&
> +	    (BIT(it->options[1]) & 0xac)) {
>   		ret = request_irq(it->options[1], dt2811_interrupt, 0,
>   				  dev->board_name, dev);
>   		if (ret == 0)

Thanks for the fix.  Your patch looks fine, but there was another patch 
posted recently that fixes the same bug in a similar way (it used >= 0 
instead of >= 2) :

https://lore.kernel.org/lkml/20260922091939.GKvofurpBYesWLI8gPcW8CiW4eRuvtPwH7-hn1IVL8o@z/

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

