Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A85444F548
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154712; cv=none; b=c5dtE+gyp5B2bGNf7ufNZH+1dnGALVdDVejqJXk3qtz4zwO0/nexeGWtJGYhThOk1L9WPTBXeJPIh4tvwjAwLHjIDYw6V57+JNgN/tJczuOvWjSaRPdxrz4Dp/QfnU8RMTP4fZuR9JoAl267UTBJ6YvsiJiiMFSlrJSzZ6oqgC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154712; c=relaxed/simple;
	bh=ClIrNXvQzgh1phRsj2WKx2BjwWcdDPaTRIsDT7BHJss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULxWqYdPaCu+QMavudpmQtNcdPRRcRuj7ab0hysHyaFnZq+7c7Sdk4wvyoaqfXG5u37/I4XoWmt8uPjrg45cFeJ1GrociQ7/f/4ZBc5dFH/0/j+C88Iv6yLdDeV58uo3wOl/6lCGcYOnNeWBAVKa0vXe+3n50FyqyArYmVX0BEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wf6NLega; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wf6NLega"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso437164f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790154708; x=1790759508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAoiQGthbdNXddwUID6hWK5ILZRJHIUjDxuRCcm0SGQ=;
        b=Wf6NLegamnVjJcmN+y8oY986P15cb7pxLV1ijB0dWg5AGWOS1vjB4rE6TE7fBSiBC3
         YVWJ5q9qo8WZpzWdx6h6oU4QftrCIUtLc0jrjVyKjQ+CogzCFFTy7ug/HfdK+8eCNgQ0
         2P9gv9WoYEPTm3ykuHAW9/Rpw9ieldD4uz260=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154708; x=1790759508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAoiQGthbdNXddwUID6hWK5ILZRJHIUjDxuRCcm0SGQ=;
        b=2R6wwEAAMJ1ikhLnznUuw6RO6hsQEB0wLDf3TXm+FiQxc71XFCbpBgGSE+zBnCEZbC
         DkhgJHurluwawZq0j04q9iVqF7PFATrajxX6iZbChPoBEnN6vgcAFvkzgdJNCTzGSkxn
         zs2NjBMyI7EBFbDQ3+1DvOImmq2nlneDB9bQyU0mW6EnVJQf8DsqCYmc6PAfn/4fyGBJ
         Pg1wrFd3KoBu9SVibZaSxRu/DyRGi+LmqmPBNsguehfEr3lcYEIPXG3waghhgNNYBMKr
         cBHQVI5gMecG+LduN9YCrW0sAEE51WlhbZu7cVtG2qZH1TGFqNErMhTGdB3g8M0KJiJo
         M6Fg==
X-Forwarded-Encrypted: i=1; AKwUvBy8ggHIanfXf1uZfIrOIXe/KKYXly5nssdjHfujFDHP/68z+9dKA0mnI66+0NzLbH/GTsVw6kO04cS/YDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mSvhMapB/MBAi6KMBRkjIMRxlHBr7gr8OxgFhfQPyyBk9bq3vX
	R7YkYBmiOu6cJczgW84s3r4hbq3MoP5kwLAYP3z5nQrp9RQpI5m8k7CZOcfH5ruMNGY=
X-Gm-Gg: AYBFou29rxgNEvlC+W9E6maKZoQZvD3huUAhfKMccDrxryqawxBMDbrT6yTIHXdcYy+
	dtrvc6LEMYQTIk1O++TwhxYsbSSMxUTPV8+sp7bL+o8HwCTWUu6wkS7k4ae2qNOtkttmDG1LTFe
	q4ovk0qirzaeOxh0Sc8aZsGLoY0I42V8+Nv6/V9NatWGE2HQ6izuDQsh5YHJdUNj3sczINq1jcx
	umLVez2u6LZeHLWMwHg0Aj4yYAi3tQdmV996eX2EdwSE8LtMJIhsAdK+U67JIZlqTZzGN2VG1eS
	7BVGTTkRLvJgmSD5So/cYZHgGHwMxuroRyWwY8VvpSZEQ3uyYN1iCzhDej3sGBulovJmeqCdVGf
	y9bCY8DmEl9o6wJcXLY0gyHhKETY+Ntki5gleIBgQ3BZvWr3P+2yVwOuzwz0yHWLrWipgpYuc5d
	D0SP5l/TlK1azAOd7mzOJ8p/NTLw41RCKiRJkTJ/CSKZ2rdRFdAD1SB4LGWv2mDYgfiTMt9FH+G
	Oy9t3BicvAH4gCk
X-Received: by 2002:a05:6000:98c:b0:487:40d:af29 with SMTP id ffacd0b85a97d-488670a3566mr3640483f8f.36.1790154708510;
        Wed, 23 Sep 2026 02:11:48 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848636asm5096242f8f.6.2026.09.23.02.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:11:47 -0700 (PDT)
Message-ID: <f1c55b79-4487-40db-b2fc-342b2dc33c1f@linuxfoundation.org>
Date: Wed, 23 Sep 2026 03:11:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: vudc: Prevent transfer timer rearm during
 teardown
To: Myeonghun Pak <mhun512@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ijae Kim <ae878000@gmail.com>,
 Michael Bommarito <michael.bommarito@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260923022033.957777-1-mhun512@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260923022033.957777-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 20:20, Myeonghun Pak wrote:
> Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
> vudc_remove due to race condition") deletes the transfer timer before
> vudc_remove() frees the vudc, but the receive thread keeps running
> until usb_del_gadget_udc().  v_kick_timer() calls mod_timer() for
> CMD_SUBMIT and CMD_UNLINK even in VUDC_TR_STOPPED, so a packet after
> timer_delete_sync() rearms the timer and v_timer() uses the freed
> vudc.
> 
> Use timer_shutdown_sync(), which ignores later arming.  The transfer
> state is freed with the timer.  Annotate v_start_timer() and
> v_kick_timer() with __must_hold(&udc->lock).

Can you explain why __must_hold(&udc->lock) necessary?

> 
> A KASAN and DEBUG_OBJECTS x86_64 QEMU guest reproduced the free-active
> timer warning and the use-after-free in v_timer().  The same harness
> completed 4000 iterations with this change.__must_hold(&udc->lock)

What does the harness do? You mentioned it in a response, but I would
like to see this in the change log.

> 
> Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remove due to race condition")
> Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@163.com/
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v2:
> - Drop the lock-held comment and mark v_start_timer() and
>    v_kick_timer() with __must_hold(&udc->lock), on the prototypes and
>    the definitions (Greg Kroah-Hartman).
> 
>   drivers/usb/usbip/vudc.h          | 6 ++++--
>   drivers/usb/usbip/vudc_transfer.c | 8 +++-----
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
> index 5ef0e7d9b23a..c129f4c56e8a 100644
> --- a/drivers/usb/usbip/vudc.h
> +++ b/drivers/usb/usbip/vudc.h
> @@ -157,8 +157,10 @@ int v_rx_loop(void *data);
>   /* vudc_transfer.c */
>   
>   void v_init_timer(struct vudc *udc);
> -void v_start_timer(struct vudc *udc);
> -void v_kick_timer(struct vudc *udc, unsigned long time);
> +void v_start_timer(struct vudc *udc)
> +	__must_hold(&udc->lock);
> +void v_kick_timer(struct vudc *udc, unsigned long time)
> +	__must_hold(&udc->lock);
>   void v_stop_timer(struct vudc *udc);
>   
>   /* vudc_dev.c */
> diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
> index d4ce85c4c6a2..ba625622975e 100644
> --- a/drivers/usb/usbip/vudc_transfer.c
> +++ b/drivers/usb/usbip/vudc_transfer.c
> @@ -441,8 +441,6 @@ static void v_timer(struct timer_list *t)
>   	spin_unlock_irqrestore(&udc->lock, flags);
>   }
>   
> -/* All timer functions are run with udc->lock held */
> -
>   void v_init_timer(struct vudc *udc)
>   {
>   	struct transfer_timer *t = &udc->tr_timer;
> @@ -452,6 +450,7 @@ void v_init_timer(struct vudc *udc)
>   }
>   
>   void v_start_timer(struct vudc *udc)
> +	__must_hold(&udc->lock)
>   {
>   	struct transfer_timer *t = &udc->tr_timer;
>   
> @@ -470,6 +469,7 @@ void v_start_timer(struct vudc *udc)
>   }
>   
>   void v_kick_timer(struct vudc *udc, unsigned long time)
> +	__must_hold(&udc->lock)
>   {
>   	struct transfer_timer *t = &udc->tr_timer;
>   
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

Have you tested this with real devices bound to a host and exported
to a client?

thanks,
-- Shuah

