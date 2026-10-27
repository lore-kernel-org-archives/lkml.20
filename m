Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119297;
	b=okwek8wDfApStz/WhzGZ2XEg7UPFyFezIH6nFjulhRZ6Zdce7WPCTWuCcttSff9YrIcu
	 mz0egxffnAJ1hQNSOFoP8lvR+4y5uEVzd3lEJX2OOm05Cxkj9ATgwIiJA640HgMByG0wN
	 gp+bOUOuEIp6rOCFjie/3N65WXs/C/RQsEcqr+XfwOdh6uoxvA8nAevCWyxBK+uPE8NNK
	 wy8gU1XFlo8F9ZnerI11OPfsStsXBJ4eFrJIUsCWc8pTZPVEEEUa0UGY91vCA4Rp8PLza
	 cXwiB60Pg/gifOlWBs3VDWyrNTT1YFSjSWgMyPzYC6a/3qwRYpiGE8N7rAKV4tAwJmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119297;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zKpE7siGsGwY7WHlhQgYyjJPvvzVliU2XHzvOc+ASig=;
	b=QlotSCmLbxf6F/B6y2SCrKQvvM2d6UmzoJn/6mo79QLIKNumSPRm2yJrd5h7OFy5D2ds
	 vZ84fGqx94bP5AJISxoqCptrWXmWSyqwMarOHrFqk5w1s9K6b4FGJ2M4K/7hrMWDhoTW6
	 KJUgwrYaX6F8GaWSMoTB+TaxzJYcLBX6EMCmLLq8tMpjBXryuWsx/Bd5vUcz5z+xCY/co
	 n8VSZ8aNnwc+BbAt+Xf0Dnbt1SGVjwWk8XsSYsgFPYJLuivrqNzbzZplt/e5lxW7qYJ2z
	 uQpqbLBMqoAjl0aJL90zRePJAPkqUyRMw1Oh/5O6jCehIIVsrtlqnEBID/NQUhnYm+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsHakQSS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591E9606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsHakQSS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94421F01829;
	Tue, 27 Oct 2026 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793119296;
	bh=zKpE7siGsGwY7WHlhQgYyjJPvvzVliU2XHzvOc+ASig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YsHakQSSLN0xh51U5h4WVqNeIUxFrS59hAt4FdctBEDueRdnyaiCvGPHWgJCU9IWn
	 6UnMITZG1yJUVLtVuAY8dYWZAfZEq7upqYDBov8qWinpHDeOLOMfKK+UEV1tg+69qu
	 GY7HT+UQu6bCQHkuIciNXzkITb1CnAkFpJ+5n26PhfNJ1bvEf8mcYlhf1Jv6pYmepC
	 KK4Aa724HHuf7qDGlBcoCok4K2lWUGxb6phEi0leA21GerafQS25cy1xBeXRfg/wXa
	 ILNOQfgRtPR2ADMSVl3IQjr7lyg3iaQL44gknAz81ANz8GwsadabHD/kw6ONyiAIoK
	 nymFVDYfdeD3g==
Message-ID: <f0ea8b30-681f-47bb-aa37-02945dc77d2b@kernel.org>
Date: Tue, 27 Oct 2026 17:41:33 +0100
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
Subject: Re: [PATCH] virt: vboxguest: send the heartbeat at the interval
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 stable <stable@kernel.org>
References: <2026102758-grime-danger-9fb4@gregkh>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <2026102758-grime-danger-9fb4@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-Oct-26 17:34, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> The host tells the guest how often it expects a heartbeat.
> vbg_heartbeat_timer() re-arms its timer with
> 
>   mod_timer(&gdev->heartbeat_timer, msecs_to_jiffies(interval));
> 
> But the second argument of mod_timer() is a point in time, not a delay.
> An interval, taken as a point in time, lies in the past, so the timer
> expires again on the next tick.  Whatever the host has asked for, the
> guest sends a heartbeat 100 to 1000 times a second, depending on HZ, and
> each of them is a request to the host, that is a VM exit from the timer
> softirq.
> 
> On 32 bit, where jiffies starts five minutes before it wraps around,
> these small values lie in the future at first.  That also goes for the 0
> with which vbg_heartbeat_init() means to start the timer at once: if the
> driver is loaded during boot, the first heartbeat is only sent five
> minutes after boot.
> 
> Add jiffies in both places.  Every VirtualBox guest now sends its
> heartbeat at the interval which the host has asked for.
> 
> Fixes: 0ba002bc4393 ("virt: Add vboxguest driver for Virtual Box Guest integration")
> Cc: stable <stable@kernel.org>
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/virt/vboxguest/vboxguest_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virt/vboxguest/vboxguest_core.c b/drivers/virt/vboxguest/vboxguest_core.c
> index b5dc0d01facd..be6a8cc4e712 100644
> --- a/drivers/virt/vboxguest/vboxguest_core.c
> +++ b/drivers/virt/vboxguest/vboxguest_core.c
> @@ -422,7 +422,7 @@ static void vbg_heartbeat_timer(struct timer_list *t)
>  
>  	vbg_req_perform(gdev, gdev->guest_heartbeat_req);
>  	mod_timer(&gdev->heartbeat_timer,
> -		  msecs_to_jiffies(gdev->heartbeat_interval_ms));
> +		  jiffies + msecs_to_jiffies(gdev->heartbeat_interval_ms));
>  }
>  
>  /**
> @@ -482,7 +482,7 @@ static int vbg_heartbeat_init(struct vbg_dev *gdev)
>  
>  	vbg_info("%s: Setting up heartbeat to trigger every %d milliseconds\n",
>  		 __func__, gdev->heartbeat_interval_ms);
> -	mod_timer(&gdev->heartbeat_timer, 0);
> +	mod_timer(&gdev->heartbeat_timer, jiffies);
>  
>  	return 0;
>  }

