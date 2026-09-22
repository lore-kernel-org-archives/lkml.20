Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA183455639
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070476; cv=none; b=o8R+2ORh+tiEMEckgDYjiRbSYOTVosCmGvGnBEgVGX//oe2GgnD5kOj4Qg0d2nVJx8Tt8KJFHtEx9tnZmMBQiyVOjdAFxco0KbIw+Owu3cCCKUTtdXBQY/e3ZDnXCrJnAOMYTRtOlJShfqADiHk/94oMjc97BiyZwdvQFGNOkDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070476; c=relaxed/simple;
	bh=vKmZX7j2+UMDbTs0prpQw63eYE6eWd25yIxQG7e+2sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYTTDTIHCf+/Ch5nIDU5ePB8AKvRCOWrzR0S2HUUuwGGjFvtu1XsHJXcpAN1XY6RdSP48gOzBdti6n1qVGWBgPBJ2xSiVRAyHAASoamNg7lOPQi9vArFYuMx1ZuA0O+blAJgrlb8L4QEtMN9YNz4K8MYIRgKEJe6HJ1P1H38hEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yel9d1Yi; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yel9d1Yi"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a9ac6aa620so984972a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790070472; x=1790675272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFnXezMJTHEfGOyaUx+BGn6Bkr0k5HX/YPJ63ltM7lY=;
        b=Yel9d1YiUWKckQm9siMITV06DzQmcD/aNeLvSHdUjPGvXWzq+kyZTunnQpLKnaGrsT
         qVSzU0HV6IpPXWHTimLAwW5zOLVQhbOUsGrZ+OhgnKvFwh1M2OmdCMmUXTOZbyLy1jO8
         awmbrkjFw5OW+TUapkgRxvaZ0lFclGxbiVTXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070472; x=1790675272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFnXezMJTHEfGOyaUx+BGn6Bkr0k5HX/YPJ63ltM7lY=;
        b=ZVyJcc4CIKd0TLdcJA5lmJ9dEgopUtUvrMHtgDrbTwqfDCgYeHHDk2EQT+Q8Kw1E7A
         X4akQYZAeii8jTtv8hhy1bZ0nNbnLPibAabeDxbs0aykAOSCbmsI4bYq1kS3lPdzTnci
         FeGCj1YYB589E5bCTMut9mhr/RBCGvPDsF8xLjjKTvQJuSEtImwQMJk7WH1NjZHND/0o
         1oJOztFeVOoIOwxvuiLZvTMVhCVIyoII3aFuNLSPzq4jE2WuzCC5XTRuFJ3YNE4G+TCv
         E9FWnAp6tSvFgq3W/jWYArr81jIrqVr1zW9LhkhdMuvpCz31jW+SIC7Y2F6bBhIQw77J
         2N5A==
X-Forwarded-Encrypted: i=1; AKwUvBzjYWlIIhi7HvqPoN6MEZn8O2auPbhjJ7mRLwjmt/T6shBRBcA5qXbS37GbcIc0BZth7FtEUeKZkcJ4+i0=@vger.kernel.org
X-Gm-Message-State: AFuF++npecSAv8cQJVZU0m1QftCRsY+Gv0klrcRaQw2YXxxA5s6LlCEj
	jAlCNT+7UWaBz8LtHH0Ws3ulpaZr+H77bZFE5bM5y1kg9WOz7dbqWCAh3qbiPgr/ngo=
X-Gm-Gg: AYBFou0fHJ/hWRbjZ7NZdrh2ln95v/EmujphBcFnWC0JqSQmRmeCSWH+AoIz5xtyxK0
	XmNNydxL6bu/ZpcFaiNlCxaz3FjQYBgB56TdfVDhnDsx/0XxqQbik1hz4hQjsG6+hbOS7SRZyue
	5/Ow9CN3uyN45/kQ955NbPAVR2JmMJyW+jrTzVhwkC6uDZ8bXziIeNwF8sFkHE8U2/RWDM0+8jq
	zH0I6NlUxh5iCepzKCOLb2g8Oc18SoYbmBjn4WGZngm93Odq2EBf2rx/PINjD3XvdW8GbTTH5uw
	TECXCq0urN/8d7Rjy2kfs9fKnHBggi3Bo1ZuQ9vIMicaJUM+ujACtSf0QJ1QWEWeiwdSSE/Cag2
	AuPsBjIxPRnaddkwq3lahM24Mia4KGc6/tP8GpAKdq1cy7hJF03zkSyWhCekYXoAMwAcr+8xxKi
	ExmjcMleEI94EjmJjLSMC162390njO0nocWoKMhKbSkI0cjcZxx13GEh6osmyuxd3XyafBoGFjm
	tHs68GulSAA
X-Received: by 2002:a17:907:3fa0:b0:c25:f7dc:2d8 with SMTP id a640c23a62f3a-c2a8d762753mr200948966b.25.1790070472034;
        Tue, 22 Sep 2026 02:47:52 -0700 (PDT)
Received: from [10.214.128.75] ([38.97.137.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5ec614sm55899666b.45.2026.09.22.02.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:47:51 -0700 (PDT)
Message-ID: <e66371e0-5e8b-4e31-b8ad-223ef399b056@linuxfoundation.org>
Date: Tue, 22 Sep 2026 03:47:45 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: vudc: Prevent transfer timer rearm during teardown
To: Myeonghun Pak <mhun512@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ijae Kim <ae878000@gmail.com>,
 Michael Bommarito <michael.bommarito@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260921224130.492681-1-mhun512@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260921224130.492681-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 16:41, Myeonghun Pak wrote:
> Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
> vudc_remove due to race condition") made v_stop_timer() delete the
> transfer timer synchronously before vudc_remove() frees its containing
> struct vudc.
> 
> That does not close the race with the receive thread, which is stopped
> later through usb_del_gadget_udc() and vudc_shutdown().  The thread
> calls v_kick_timer() for CMD_SUBMIT and CMD_UNLINK packets, and
> v_kick_timer() deliberately calls mod_timer() when the transfer state is
> VUDC_TR_STOPPED.  A packet received after v_stop_timer() returns can
> therefore enqueue the timer again before the vudc is freed.
> 
> timer_delete_sync() only drains the current timer instance and cannot
> prevent such a rearm.  Use timer_shutdown_sync(), which makes subsequent
> attempts to arm the timer no-ops.  The transfer state no longer needs to
> be updated, as it is freed along with the timer.
> 
> On a KASAN and DEBUG_OBJECTS enabled x86_64 QEMU guest, repeatedly
> binding the device, submitting a request and unbinding it produced a
> "free active timer_list" warning followed by a slab-use-after-free in
> v_timer().  With this change the same harness completed 4000 iterations
> cleanly.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.

Were you able to reproduce this problem to test and verify that this patch
fixes it?

> 
> Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remove due to race condition")
> Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@163.com/
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>   drivers/usb/usbip/vudc_transfer.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
> index d4ce85c4c6a2..4146b746a320 100644
> --- a/drivers/usb/usbip/vudc_transfer.c
> +++ b/drivers/usb/usbip/vudc_transfer.c
> @@ -441,7 +441,7 @@ static void v_timer(struct timer_list *t)
>   	spin_unlock_irqrestore(&udc->lock, flags);
>   }
>   
> -/* All timer functions are run with udc->lock held */
> +/* v_start_timer() and v_kick_timer() are called with udc->lock held. */
>   
>   void v_init_timer(struct vudc *udc)
>   {
> @@ -490,8 +490,6 @@ void v_stop_timer(struct vudc *udc)
>   {
>   	struct transfer_timer *t = &udc->tr_timer;
>   
> -	/* Delete the timer synchronously before teardown frees udc. */
>   	dev_dbg(&udc->pdev->dev, "timer stop");
> -	timer_delete_sync(&t->timer);
> -	t->state = VUDC_TR_STOPPED;
> +	timer_shutdown_sync(&t->timer);
>   }
> 
> base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5

thanks,
-- Shuah

