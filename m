Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345342;
	b=XZ+YTkT97rlqWFXW1aGmE/ZE7IixhkYt6doEZKdsWama1E/2z2BMxCn3o+rQBE34fjGf
	 z9DVo//OiHJEQLpZyAMQek/zQuNQq5QcEeR+lTfAzVVA8MJFC3yqgqwP/obW1piixbmKV
	 sAehiJenMx9NXvnNXnCmyWXFsjfuosQ/pIXwDdUExuEWGRTyanBR5Yxtv18NLajLCStXU
	 RIbGTZS1V4qT7+UMqZW1uzBeyVcc6NwrbMC1rkCZhPp0dK9lnk5j0f4S223yfxevovXKq
	 0VI9yCnVqoKgOcmUnUH5cgEyIkfYH3W1evl3SyPuwS/m6wPSiFRXed4VXuEm06iJWAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OPELBkmgWuDcQIUl+1C2gUiqdih6G+ZfnSfUpv7B6os=;
	b=MCb8jTxjhnPE3KhfEDP1AUNeLjYqVzXwvChfA8KTgPT/M2MNz8fn0libn/7DybcSI099
	 zbVGc8ObJ9L7TkLEbMCVRm4J8tDxvPQBpj026mrdwqD4zCbYwl2v2xLsTPXZH44AGDwED
	 lUeYm+DNQZpBaTrU3/hg4A5BfB5EQhM6uYK0vTMOp7QG+TsJ2CONNUsJqc8h3ZxaOYo6a
	 K3ZqMFKqU5k2z1NnxIu8kDAgXq7Dew239IqHW1cfTI1reYmrctjcUnnG8sNGCrBYAQa6z
	 FsVJynfi84xbh9FAOJc5pv8RjAj1ZHVrks4uT+MqTETXwyBzKD43AhCxxySq0u1DU3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=LUTsHQn5;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63149606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63149606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=LUTsHQn5
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53ec2cc397aso1339730b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1794345340; x=1794950140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPELBkmgWuDcQIUl+1C2gUiqdih6G+ZfnSfUpv7B6os=;
        b=LUTsHQn5ZJW8mYZW5YfwlOg7lEaXPFJhF1fj1LiLj2ZFzlW3nDis0Q1Tq9El9EWe+y
         OSqB9dXc91gk/BRCUg4mONoadinDdNRHzVJkErEfq4x3gEQR60Ykmvqt8lKVk4h/JtZ7
         Hg17odOVxyiE9w1c1tdfC+nLgHnnpSKZ+xBOK4XcDK9+RaQrhqhaRioOvyoDAOUuh8ZC
         HyFLlwZhg00EOZm7NYVPzxpIgEGhOTb1l5E2JBJzN2uJOoiFmSYdAkT5hMSiMAtMODVa
         oAPsQuw64G40MY1gPEbC6fw6NulPHzpfdv7TjQ0oQ7/BVptrMUdp1jArriJC3eGG6jxN
         NFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345340; x=1794950140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPELBkmgWuDcQIUl+1C2gUiqdih6G+ZfnSfUpv7B6os=;
        b=d43cjgkym4r27saJN0dpp47ObeNwR0OVTbpk2eevEqv3HDfAOXDR4AVrmsl70fVWH/
         +46CeH/nLupPJJyFpPvR+Yhha/0Z9xYAM4B+hqZ0by2iXaQeuums0pNsGe8JW+WfUaVI
         Vz9zH+hAeCUWbzsaSF3zSeyouj6Ih5EeoCC63U0Fzk2jQjWKQkAvVbZsMK3gWH5iePp+
         E3UBbt0DdGQslsYGipxji5gvqwvmDggP72aCkdPFlXIelCTt2iDgTG8WK9IQ26krZA0m
         61inRonBv90Npc1hYf0JD9+MfMo1bIWrZNWCOtEw/KNcI7Uu2w3iVRNH9BBwYbqt1HDB
         O/GA==
X-Forwarded-Encrypted: i=1; AL+hErH0TYpl8R7wfx+HzGFfQ00id82l6Phhskwpmk1lYXjo0jQ2ziKcwB69Qz8aUXPPJAmXFd7OgzcgJrh/VoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WAXOwGw/tEa2zT+ojA/VcwENCrJ0dmk4mOTO/j+/5ObxpZCm/
	OoiLI1V6/TmCJ5YJwhWaVqvrpAFG6vZp4DptTaJs7Ljf24jnT50w5dRD7JtKOmnL5BBb09lzq8k
	9yt29HfuSlw==
X-Gm-Gg: AYBFou3TjMsvb5TD3zdCzzPFVglvJ9oqQTx1Ns7bZNdVgJJ0tBJNHHbNtS6NtEKGEqC
	UjPKSxkXrwLQsVmpHb63fmVZh0Pg4Qy2yDOFppD0kgh7zjc93mGJQaGIhedWD/Pqy715bOSRfj+
	J6C+4Zg5u3w9NW1f4QNli2a6RAn9eMOHqQILWMHb3hjrCvZwBTm2EQj5UzTM8E7VQ5qVrlVQsoi
	cxZWRqGaOkR0m9vlgWdsm+A2GB6QFVC2efdFGbbXK4JOGpKGbv8HRV+1JTq5z8hs1bAGe5BsAB1
	YHMRtekY8N+LA2ynGYoMBam/u7Lf+hLjkpY7N80ui8jVEDHQSPskwOU/JXC6x1jl9RcqT8V4GBn
	QlSHUTSuXl/oVHWVt9E9OAl/yZU4tQmf0hoOUPznTLNord3VoNP2RAHpN6V/1hdN7Iq5XxnTrSn
	L6mSk7b6Gb0M4romO8dLlpTEmsZq74Tl7jkpLLjGI5tyKIYpD5unkwzrb+RwwEtrh6LSKRIEW9O
	3/KiI7HrnxGdu6ieSrGYi07H1zzTrQpkPQ1v1q7vejpZ7Is7RTqDwMYe9YzQPNakrtaFUStU9O7
	uZBuivDiCrxJnWp/yvcbfpGKEyWXjA==
X-Received: by 2002:a05:6808:c226:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-56b96ad0741mr201899b6e.18.1794345340222;
        Tue, 10 Nov 2026 13:15:40 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690573604fsm3142441b6e.9.2026.11.10.13.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 13:15:39 -0800 (PST)
Message-ID: <be330e7a-f37d-4347-b815-22bba165defd@riscstar.com>
Date: Tue, 10 Nov 2026 15:15:38 -0600
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
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in
 atomic context
To: Anand Moon <linux.amoon@gmail.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 12:14 AM, Anand Moon wrote:
> The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> to wait after triggering a bus reset request. However, this function can
> be invoked during atomic I2C transfers (such as power-off or restart
> handlers running in atomic notifier chains), where sleeping is illegal.
> 
> Replace the sleep operation with the driver's internal helper,
> spacemit_i2c_delay(), which conditionally uses udelay() when running in
> an atomic context, avoiding "scheduling while atomic" bugs.
> 
> Assisted-by: LLM
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Alex Elder <elder@riscstar.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/i2c/busses/i2c-k1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index ff32876e24d3..f4b21d7efaaf 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -332,7 +332,7 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>   		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
>   		       i2c->base + SPACEMIT_IRCR);
>   		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
> -		usleep_range(20, 30);
> +		spacemit_i2c_delay(i2c, 20);
>   	}
>   
>   	/* check sda again here */
> 
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9

The use_pio flag is set for atomic transfers, so spacemit_i2c_delay()
will use udelay() regardless of the delay period.

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>
