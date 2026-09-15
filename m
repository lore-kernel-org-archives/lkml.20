Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4AB2F3C37
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444177; cv=none; b=QOevJuGXgSQA5DmFs4BxQfiFLjDfuc3S2HuwDkDiNAjNv8H6fsqtHon3O9PwEva4RHkUf5E7Gh6N1fDgqaHHBf963hxBuvEJAg6KUBjRdjQBIfSF5llFlnrWz3hIGSymqij8jLKQhJiqf5APuESy5ZN7pOkgI6Dp1zlypC9LjGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444177; c=relaxed/simple;
	bh=u0RxG1o/frbuNKiBAJ43W24jdU6vj1vR2na55l5hTRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKIh/KwrLpVmhxR4hcvxPOlXRgvX3SAyFXQiJ2wg+S7KU71FCby+eHW4xJYHhMtn9cLzbKHDVWJbUGgN+ScxC4rfpDKCmxVr0pozkndY8MF+AjWiYx2ptwcHDe284unALPKiVD22k/qksVjvNDLfC/5cXk/ZnIQX2JSrJz/O5W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qeSF8pbd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeSF8pbd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86265451beeso2627797b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789444175; x=1790048975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dF7qeg6bjb/JK0D+0qkiv2VMJdXAYUryHJ+RVPDRMgI=;
        b=qeSF8pbdBgPZc7REzIPtAksDy3Bh9NnhAqiPz7ljNrxJp97yAeCkHJQNWcGFw2Umu/
         ArAyHXzZXGcAPOkDPXpEKBTI/uthOw9057EtL94g3eptu8tyHw7WERN1sNArmWTxTSuc
         QlkP6dolHzhT9KxwsZV9TKpWYatXeBX2fWZ659+hBR6YFL4krRLb+v1b3GjqlMpzi4dS
         Ohmm8SZEvDVd69y411DySQFQUQ9HS5qSw6tGHitvmLqXdCIT2cgonHpQrbkXmyk0stOQ
         8YboMhe8VpR891hWKnFRSvaHuM5EAHXgVU7bY26v3LBKH/lhCd3iIWjKRkpYxsTqpCRC
         tZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789444175; x=1790048975;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dF7qeg6bjb/JK0D+0qkiv2VMJdXAYUryHJ+RVPDRMgI=;
        b=rRlSZv4pDsbc4Rrg0f2ZgonQg7L/DI5BDQcgUf32qyOiD95vHY6RlmqN2gQMFNW/jj
         WiKGzNZLtYDCxLUQ4q255e53zFQKIKWojzFU7tfj1bKGX4mqkp8DRscg2SvdvWuGpbL6
         IGJScUo1EgAxFhwWqEaE/BpxZLUN0+c7svN+n2YltEy3R0LYFeYjLtVzepB1U0aH8HqE
         rqZNaqC+G0hjE+ZPXII+d9gwYwg6hKmZS9EukBMKtnN/QylU7lY2pf0ZL/6KY9siplwI
         /7pPDnLwgrtuplxpNvjGxkc+LKg/2Hy19rX2n+r28Q0HBinby9NGowhjtAHh6yJQ7EpK
         JNrA==
X-Forwarded-Encrypted: i=1; AKwUvBzLNg5w9tr4XkGMIwlGw8OWgmXy3u6s56CQcA9ZXGblQ+ULlMooqlq73PItbJ0O9egNV2xU0pCZsknWyhs=@vger.kernel.org
X-Gm-Message-State: AFuF++ndVykTSHAbHUmqSIwLQGi83nFeYBqW9LXG24CVT2ZQVLlzNEdk
	EmrqujS2Ywgmu4VcxCmqevdqwvkCslAUCfJa0YnPUPvNaWA1+BvXsK+ZXy7gJahT
X-Gm-Gg: AYBFou2JkbmbG9ET5MSQ7Bma5ihFKc8hXi3yZra5NIUJNjh9X/RCYMcHDTmMYXygdsT
	UfFu/yl4ejNf8uGAZAg4s2R52HHuhm172lBx35G8O1T2JlMziu/4RAnJa0hEDZXcvqXLe9XJ4wm
	zQsYZMNRkkEIBJjl8RoWA80GyQsfgg3A35GalzONOaFn22wtJw0epKPxA0G+WzQsk3jQZYUx5Z+
	WBPDisIlxOGFvyUjrJpN6Yy6BxUfjE3eHP2/bY1bCUmAOxgSHBugXk7xaMe0KdGU6gDDQflOqr7
	6RbUs3cNVMmpgOJFKmz0BEtOrdG9HOuDyTMjcbpKTuIAsGWDGM9WqNws54ak0tfGhWlK5o6urYf
	+QGCLOIx0N2ue0N8DO1ZmXQy1/45hHxRtUP/EWVeqfNgmalRcOWztZGD8mrWATzL03770bm+f/S
	yQ9P7EHjtUlxTD26wmsgQF/NLVPgDqUGR6JadKs4IC4LM6oKEngq2KO3uYIslduc+GSVKU0tvsG
	0oWpbFxX1EQdKwVbPVWqOT/KN6WbYBzxCmjpjKBOT1ya4p2Qn5bwb6lIu4=
X-Received: by 2002:a05:6a00:f86:b0:869:9298:ba50 with SMTP id d2e1a72fcca58-86f804d0661mr11571247b3a.0.1789444174696;
        Mon, 14 Sep 2026 20:49:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c49d2sm5581925b3a.10.2026.09.14.20.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 20:49:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <13cec7fc-8b8d-4b43-867b-a88d67d32118@roeck-us.net>
Date: Mon, 14 Sep 2026 20:49:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: starfive-wdt: fix PM reference leak in probe
 error path
To: Ivy Lopez <skunkolee@gmail.com>, xingyu.wu@starfivetech.com,
 ziv.xu@starfivetech.com, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914165022.169877-1-skunkolee@gmail.com>
 <20260915032032.222665-1-skunkolee@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260915032032.222665-1-skunkolee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 20:20, Ivy Lopez wrote:
> pm_runtime_resume_and_get() increments the runtime PM usage counter
> and, via starfive_wdt_runtime_resume(), enables the clocks. If a
> later step in probe() fails (reset_init, clock rate check,
> watchdog_start, or watchdog_register_device), control reaches
> err_exit, which calls pm_runtime_disable() but never balances the
> earlier get, leaking the PM usage count.
> 
> Track whether a PM reference is currently held (pm_ref_held) and
> whether the clocks are currently enabled (clocks_on), and use them
> in err_exit to release exactly what was acquired:
> 
>   - if a PM reference is held, put it via pm_runtime_put_sync();
>     only fall back to a manual clock disable if the resulting
>     suspend transition did not actually run (put failure), since
>     the runtime_suspend callback already disables the clocks on a
>     successful put and a redundant call would double-disable them
>     and underflow the clock enable count.
>   - if no PM reference is held but the clocks were enabled directly
>     (runtime PM disabled case), disable them manually.
> 
> Also propagate this accounting to the existing pm_runtime_put_sync()
> call at the end of a successful probe: its usage-count decrement
> happens regardless of the call's return value, so pm_ref_held must
> be cleared immediately after calling it to avoid a second,
> unbalanced put_sync() call if a later step in that path fails and
> falls through to err_exit.
> 
> Fixes: db728ea9c7be ("drivers: watchdog: Add StarFive Watchdog driver")
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---
> v2:
>   - Fix double clock-disable / clock-enable-count underflow when a
>     PM reference was already released via a successful
>     pm_runtime_put_sync() in err_exit
>   - Fix double pm_runtime_put_sync() / usage-count underflow when
>     falling through from the tail put failure to err_unregister_wdt
> 
>   drivers/watchdog/starfive-wdt.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
> index af55adc4a3c6..4ad587732bda 100644
> --- a/drivers/watchdog/starfive-wdt.c
> +++ b/drivers/watchdog/starfive-wdt.c
> @@ -429,6 +429,8 @@ static int starfive_wdt_probe(struct platform_device *pdev)
>   {
>   	struct starfive_wdt *wdt;
>   	int ret;
> +	bool pm_ref_held = false;
> +	bool clocks_on = false;
>   
>   	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
>   	if (!wdt)
> @@ -449,11 +451,14 @@ static int starfive_wdt_probe(struct platform_device *pdev)
>   		ret = pm_runtime_resume_and_get(&pdev->dev);
>   		if (ret < 0)
>   			return ret;
> +		pm_ref_held = true;
> +		clocks_on = true;
>   	} else {
>   		/* runtime PM is disabled but clocks need to be enabled */
>   		ret = starfive_wdt_enable_clock(wdt);
>   		if (ret)
>   			return ret;
> +		clocks_on = true;
>   	}
>   
>   	ret = starfive_wdt_reset_init(&pdev->dev);
> @@ -499,6 +504,9 @@ static int starfive_wdt_probe(struct platform_device *pdev)
>   	if (!early_enable) {
>   		if (pm_runtime_enabled(&pdev->dev)) {
>   			ret = pm_runtime_put_sync(&pdev->dev);
> +			pm_ref_held = false;
> +			if (ret == 0)
> +				clocks_on = false;
>   			if (ret)
>   				goto err_unregister_wdt;
>   		}
> @@ -509,7 +517,12 @@ static int starfive_wdt_probe(struct platform_device *pdev)
>   err_unregister_wdt:
>   	watchdog_unregister_device(&wdt->wdd);
>   err_exit:
> -	starfive_wdt_disable_clock(wdt);
> +	if (pm_ref_held) {
> +		if (pm_runtime_put_sync(&pdev->dev))

The return value from pm_runtime_put_sync() is almost never checked.
I wonder if checking it creates more trouble than it is worth.

Guenter

> +			starfive_wdt_disable_clock(wdt);
> +	} else if (clocks_on) {
> +		starfive_wdt_disable_clock(wdt);
> +	}
>   	pm_runtime_disable(&pdev->dev);
>   
>   	return ret;

