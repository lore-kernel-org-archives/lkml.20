Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556A494A18
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396826; cv=none; b=mcc1uoJLmE1+TaCf94tJck3CoSMNXqGGAw4FWCLH4IaYfQYF/rTVeW55xJqXdDbAFukc9WLaQcIrLRkIUZfh184w9IBSPL1SEn3k4qWzKf1S2Pj4tQWs2kkT8LgXFM+KUOBzJdC2A14xVTLWk/rca1/1VZLrLJlsT5SxSrfsAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396826; c=relaxed/simple;
	bh=msZW9f/jTlmrT4gzYX+DPbhIe1g8MIVmS5xN5hkw15U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fTLype2YFLIKdg5Php2X3tlGx2X2h0Ex7QImk1SZwn/wBwdSkn7lhH9TDyvkBliPw+HqceR1rkV4CLN2+NM41mBz6sFmA5MKib/MJwA+2RU+tKyT+CargF2XheScJdeaS7A40gO/SOgKlnGcUYgvnuuAo7ze55g+y8xBHU/5Lxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTkmbAtY; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTkmbAtY"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso982707e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396822; x=1793001622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVmqZUzzZqNIZ2w74l6JRmuy1eAY1xL0LoXMR258IHU=;
        b=PTkmbAtYVzJV1hOUhB6a10if18ahQ5U/FJ7DXWP7eVZRwoPK0l8+Uci6utq+WoJeGZ
         9ucU2PSJlSifqAqJLcU1siu6D9uaGgFsQDFsPMLAbhlb1aLTVA7vcH7mUiUGfqYp5Mso
         h/sqY3YIBG9SQ60ZNEsdXCZRsUwicfRvCdj3dvukzWDJN6JgwJpCN40TnKBdHkbMR3As
         nGAQn3hpL1RFj58/s2sTGMY/KzGLPx2zjlwfbRpMsxvJiQzKBS8csge4es8ZLkigDGln
         YtVN/bDSyKAbM0RMC6K3E1HHe2BzQ7RxjXukJ0Oi/RnOYe6zkBz0cqXIZhL76T9zeMwh
         pNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396822; x=1793001622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVmqZUzzZqNIZ2w74l6JRmuy1eAY1xL0LoXMR258IHU=;
        b=JK+qP3jto25INqHzqyD8z3H7vFzymiUqpOur69CgWpSEs5IX2NwDbhAsBxEZcDb0ww
         zK/Ku9rYawIj+6goVdBxEYpkh5cWROVc5Ri2/VOXBh54G9Ve75tjQdBoPpAxwqr/el2F
         iT4A9hTO1X3EpB8tH6W0CNUehSLZ4GpCYaPEW6fJ6iyr5e6zyBQDoPIhaqHr+OORFlaL
         kpuR7grO1w3wBi/pgoSEMkUBoZuQo9TyxtNKLNhpEvBjBlStJLe/eKaWcOljxkojniHz
         TzPi+0hZHoV+p1oeRJDMA4LQ7YFxDlGdO/RPWg+3IHqDz7nVzIMOgyFaKYnsMlZZI7tq
         8WAA==
X-Forwarded-Encrypted: i=1; AKwUvBw2BmlILrHqyKDzEusB/fwDvGDlsxwF7UHXnbZoLDyjCWbfXCPs55NyxUOH817c64i+RPCYXpS4Ayor2x8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUZGEqpJH7O22gLtUtY6vpsIEiMIBADUdMSfZUKh50mvlhqapG
	Fpyz7pLPV/OhhGOyBwxVGwvbRiqtfDqTpwjDYsj4BluBcZ3Dv2B5pmRq
X-Gm-Gg: AYBFou2MNQ4+Ldqf7bRxDEjwHqzAJVdwRkhDyGoAaRr+e+9drj9DWxrGcZRgxHEJZ3w
	5/WJzXfto2TUePJtm8YJ66CF4otiBcyuXMK8qnrHOWqWfjN3Go3AX7pxuYctwFDK9DtF8bRs0Gw
	Xp392WjfqIE8TWZ2CNgSqeMQPRcYEe22yj/XQtQCQSl9/AYeOWD/nrQsheRt1c2cYRImeUNRy9I
	2pVcqoRF49nUwBKuocHg4jg1xRR0zwKWLAFJw6g+nVy6WRlGxLxpCGFCjEthYjD8cLP0dnyz4lF
	Xi1PRG0swF6kMT/jM/K5rfDC4pSS8AgG6J+S9eE4cuKFQ/JObpqZLYTjC2calgEDTrxsPVbyqUg
	0mD3p17wX41JdeWGd+xbfzElDDrEZkx2o0Jw+ckcPGy1luna1DwNVKrbyw4U9av9y42N3wMa5A0
	LXvSpM9S5udpIgJEVjRGncy7TNf1cuEVJhGVSwjxpYySq2t4yPJNllYj6z3HNifvr/Eha6f8YCW
	39zkk1ZobsuRND0P1D7JE8T2qlMgRtaq9r/Hot3C1zhF86L4jUCE7YxSpsnoXIbeg==
X-Received: by 2002:a05:6512:158b:b0:5be:4c78:e711 with SMTP id 2adb3069b0e04-5be50a0948emr2001102e87.2.1792396821088;
        Mon, 19 Oct 2026 01:00:21 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a64462esm1879113e87.83.2026.10.19.01.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:00:20 -0700 (PDT)
Message-ID: <16cf0747-f906-4c6f-af31-c36f0d5a86b5@gmail.com>
Date: Mon, 19 Oct 2026 11:00:19 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: irq: freeze deferred hardware access
 during suspend
To: Jiale Yao <yaojiale02@163.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
References: <20261016100522.2582557-1-yaojiale02@163.com>
 <20261016100522.2582557-3-yaojiale02@163.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261016100522.2582557-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 13:05, Jiale Yao wrote:
> The regulator IRQ helper delays status checks and recovery callbacks on
> non-freezable workqueues. Those callbacks may access regulator hardware
> after the backing bus has been suspended.

I wonder if there has been a real system where the problem has been seen 
or if this is purely a theoretical problem? But yes, I think this can 
happen.
> Use system_freezable_wq for normal-priority callbacks. Allocate a
> freezable high-priority workqueue when requested so the high_prio
> contract is preserved while hardware access is frozen across suspend.
 > > Signed-off-by: Jiale Yao <yaojiale02@163.com>

I don't really know the internals of workqueues well enough to say if 
there are any potential side-effects. Hence my review is a bit of 
superficial. With this remark:
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/regulator/irq_helpers.c | 38 +++++++++++++++++++--------------
>   1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/regulator/irq_helpers.c b/drivers/regulator/irq_helpers.c
> index 5b3cfac28667..cdbd170d2b15 100644
> --- a/drivers/regulator/irq_helpers.c
> +++ b/drivers/regulator/irq_helpers.c
> @@ -15,6 +15,7 @@
>   #include <linux/regmap.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
> +#include <linux/workqueue.h>
>   #include <linux/regulator/driver.h>
>   
>   #include "internal.h"
> @@ -27,6 +28,7 @@ struct regulator_irq {
>   	int irq;
>   	int retry_cnt;
>   	struct delayed_work isr_work;
> +	struct workqueue_struct *wq;
>   };
>   
>   /*
> @@ -145,12 +147,7 @@ static void regulator_notifier_isr_work(struct work_struct *work)
>   	return;
>   
>   reschedule:
> -	if (!d->high_prio)
> -		mod_delayed_work(system_dfl_wq, &h->isr_work,
> -				 msecs_to_jiffies(tmo));
> -	else
> -		mod_delayed_work(system_highpri_wq, &h->isr_work,
> -				 msecs_to_jiffies(tmo));
> +	mod_delayed_work(h->wq, &h->isr_work, msecs_to_jiffies(tmo));

I like the fact that this change removes the if (!d->high_prio) from the 
ISR (below) and this worker, and does the queue selection at the 
initialization time. I suppose this could be done even if workqueue 
types weren't changed. Thanks for this :)

>   }
>   
>   static irqreturn_t regulator_notifier_isr(int irq, void *data)
> @@ -248,13 +245,8 @@ static irqreturn_t regulator_notifier_isr(int irq, void *data)
>   	}
>   
>   	if (d->irq_off_ms) {
> -		if (!d->high_prio)
> -			schedule_delayed_work(&h->isr_work,
> -					      msecs_to_jiffies(d->irq_off_ms));
> -		else
> -			mod_delayed_work(system_highpri_wq,
> -					 &h->isr_work,
> -					 msecs_to_jiffies(d->irq_off_ms));
> +		mod_delayed_work(h->wq, &h->isr_work,
> +				 msecs_to_jiffies(d->irq_off_ms));
>   	}
>   
>   	return IRQ_HANDLED;
> @@ -363,13 +355,25 @@ void *regulator_irq_helper(struct device *dev,
>   
>   	init_rdev_errors(h);
>   
> -	if (h->desc.irq_off_ms)
> +	if (h->desc.irq_off_ms) {
> +		if (h->desc.high_prio) {
> +			h->wq = alloc_workqueue("regulator_irq_highpri",
> +						WQ_FREEZABLE | WQ_HIGHPRI, 0);
> +			if (!h->wq)
> +				return ERR_PTR(-ENOMEM);
> +		} else {
> +			h->wq = system_freezable_wq;
> +		}
> +
>   		INIT_DELAYED_WORK(&h->isr_work, regulator_notifier_isr_work);
> +	}
>   
>   	ret = request_threaded_irq(h->irq, NULL, regulator_notifier_isr,
>   				   IRQF_ONESHOT | irq_flags, h->desc.name, h);
>   	if (ret) {
>   		dev_err(dev, "Failed to request IRQ %d\n", irq);
> +		if (h->desc.irq_off_ms && h->desc.high_prio)
> +			destroy_workqueue(h->wq);
>   
>   		return ERR_PTR(ret);
>   	}
> @@ -393,8 +397,11 @@ void regulator_irq_helper_cancel(void **handle)
>   		struct regulator_irq *h = *handle;
>   
>   		free_irq(h->irq, h);
> -		if (h->desc.irq_off_ms)
> +		if (h->desc.irq_off_ms) {
>   			cancel_delayed_work_sync(&h->isr_work);
> +			if (h->desc.high_prio)
> +				destroy_workqueue(h->wq);
> +		}
>   
>   		h = NULL;
>   	}
> @@ -441,4 +448,3 @@ int regulator_irq_map_event_simple(int irq, struct regulator_irq_data *rid,
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(regulator_irq_map_event_simple);
> -


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
