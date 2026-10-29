Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296539;
	b=SZqyEKlrNCCEWfcMAxpsJxoYb6Wq80gzm5Vp9trd06DzPNOv9BzPKwFQqxvh24KHl3FW
	 Eu/W8Lv2cJNlSyBDhzVyU6HxlHfaRVbO+c6kL3k8dVYzLXtWRXBGL7opJlnO7sEu00L6g
	 typfXiIqvsGPEUjwLXHNLbZmhvhUcPFZ3iBmB81ZtxjdMhAy3un5dhjh5jvXjnMslwXzn
	 5izHmrdPMR+YuZ+VAnH/riqhkUEfrvRl1ym59DEPb9485xupU/BkXU1DhJLarTf5xj+M/
	 NZHwVVoDSNztwR1GJRkAvjMMz/xDXXSgSVMMnvQj6En/gJL1uF9JDuZr7A82c9pSCFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=W3HdUc2svh2jzPREwBXmGjOMOZkB12N8HCTpy3OSw+g=;
	b=IMuiJOfRojx7TOVqFvtbX+BkhJnlH+iIdc5p9Z3qTwXvGahIg/uCnkjGJi9w45zcjFxG
	 ur2djFFBVNrf5+iuBCvm6chV4vm3/FRW6DJQaXuSavHkm+OKyUVhNRuWlJTj17yJ4QUVp
	 NEqNeZWV7MVzoqerSWDiH0Xc+se0LMNIaaenCQ3lFJVVFKG7D9RTV4VT6PxomQlCfwrEt
	 6qrZv+Fm54VfqJdsqr0zWCmwm2UUbKq9ppq/KH0IiUq2uZO1oMIOs3GJEsdfsjdysLDzb
	 lRyo+ceeP3W48QiHpspQQh9bh+pJayCMhUZGye587D9JisJuQyydvp1a39CTtGxgtdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=Y3L2EI6X;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F58606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=Y3L2EI6X
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-823e4047037so1722838a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793296536; x=1793901336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3HdUc2svh2jzPREwBXmGjOMOZkB12N8HCTpy3OSw+g=;
        b=Y3L2EI6XCTJlfv6Um30k1lylo5s5ob0sd1SCNIKTegObqMf0wEvS4A9IGz4HNMAkb8
         FXjRUmOvEYTY5V9fgH75wQ+nqsG6VdEY+XNmbN0/79f1QSutJa9rAqLEnxGfYUSZkWnx
         uHO0/wi0l48alNRz5c7BkH5cB2k1cNbPvsuI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296536; x=1793901336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3HdUc2svh2jzPREwBXmGjOMOZkB12N8HCTpy3OSw+g=;
        b=n/E37xaH5rqgvLVQPxV52sUUxK4dFs+Lxap4qXvA5ol3tF1ALnpZlChUSg2t3R6eLJ
         yCMIOSG9bI6JF7C/N8slK2vMBz2WgJ1G2PL0uezeN3ibs9is/JO0EqWfX5HlKK+zntvv
         RtJ1K6b2vM4lXwwnPFsx6saWAGDE3fh0K81W/yKPMDQIsb0ZUg0m1wZ9AE9LbB7jo3Ih
         qpkwR+Xn2jCXg6qw4F0M4Jd/6HHG5OnTDnO7BgV6Ht1REI1/8KV/gyPIby70SRXLJmat
         1kLH281XIzCxMfLS+vNiyCzK2ow55n40T3ossERBaS5zoQVMPZRlahgwhK4Xjj//ayLl
         kCrg==
X-Forwarded-Encrypted: i=1; AKwUvBwFbbuUOTT7idL9Q/K1NIWbEY8MO7mUPZXRbK2pYQe2uRwBCc9FGIB7FXbVo4TS3SiuEibQyKENHCs54ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwZ3SAIGYYzB/02YxreglVzzew7N/qyAROlwaEMU9M4mgj/enz
	zeNzCZFicheduUj5p1zgCHw3tmrbl7JQp/iAgLKh0uXJBlVZLn1BmR21WGWra4+dwg==
X-Gm-Gg: AYBFou2V61UfcbSkh3CWAljjXTepgfT1VtZ2PPf7FX1XVWbBcIC2drD3uB5MDGTmNvM
	8CN6l4wYNur54gA1OtFZVfWus4Iqp7g78/zJfJIcYYZcL+hOJb4QVwiG6dgcWIA27tIX8Ta2XKQ
	T2FSt5vfcM7tt5MoSWvnC5gyD9zUqEAHrJTb4C7rJ91Xkatd/4mKRFGeqriFxAlooVAJhc25MfM
	GocL0r+99XrXot5vCWqiT0qhviQDNjggX1BNgVR/n4/fYLkLeVrtgoGd18IHZMesSTl8qExnW9t
	XtLTcwdE2VhgslSXj+dp/2wfIjmrFUVhc5+xaCGL6HUopty0/EkLlq6vYCiCAG4HoPfAonbYgbb
	h/O38mH78h8OB4lqaBQI4knvcLi6LFVi1KyrIPZc/Pa8NQ6kFMF1YyKVf6nJZCeltQls9tEwOQX
	V/A0JWz6Xo+EBvNDhwl5yM719gpo0/mktdIDrQnH73urR+skZwReoWD/DfTMatyyTCs5NFi5unN
	WxxmnwqnPKOKi/i+hC6CwgIi9CXvN/X2nSVjjW9ATUGZU7mvwrdQ9b1515gPhhol7bGR+NSY/5h
	/qlumA3DQNF+xqdpTGfqrJ5M
X-Received: by 2002:a05:6808:1694:b0:4f4:3790:6615 with SMTP id 5614622812f47-563a205d732mr3898135b6e.11.1793296536211;
        Thu, 29 Oct 2026 10:55:36 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-563c5437a58sm4414879b6e.5.2026.10.29.10.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:55:35 -0700 (PDT)
Message-ID: <9879e94a-6fbe-4158-a21e-64b147a580bc@ieee.org>
Date: Thu, 29 Oct 2026 12:55:33 -0500
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
Subject: Re: [PATCH net,v2] net: ipa: Fix double free of the interrupt
 structure on config error
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:QCOM IPA DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261029082100.17722-2-fourier.thomas@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261029082100.17722-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 3:20 AM, Thomas Fourier wrote:
> Since ipa_interrupt_init() allocates struct ipa_interrupt in ipa_probe(),
> the structure is owned by ipa_probe() and released with
> ipa_interrupt_exit() on its error paths and in ipa_remove().  The error
> path of ipa_interrupt_config() still frees it with kfree().  If
> ipa_interrupt_config() fails (called from ipa_config() via ipa_setup()),
> ipa_probe() unwinds through err_interrupt_exit, which frees the same
> structure again.
> 
> Drop the kfree() from ipa_interrupt_config(); it should only undo what it
> set up itself. Drop the leftover initialization and cleanup of
> ipa->interrupt now managed in ipa_proble() and ipa_remove() of ipa_main.c.
> 
> Fixes: ad1be80d7582 ("net: ipa: introduce ipa_interrupt_init()")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

You should respond to the netdev-bot message asking for a better
explanation of how this was found and whether it was observed or
just found by inspection.

However I think this version does look good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v1->v2:
>    - Drop ipa->interrupt initialization and cleanup.
> 
>   drivers/net/ipa/ipa_interrupt.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
> index 131b9cc94201..766b094eb069 100644
> --- a/drivers/net/ipa/ipa_interrupt.c
> +++ b/drivers/net/ipa/ipa_interrupt.c
> @@ -260,10 +260,8 @@ int ipa_interrupt_config(struct ipa *ipa)
>   	interrupt->enabled = 0;
>   	interrupt->suspend_enabled = bitmap_zalloc(ipa->endpoint_count,
>   						   GFP_KERNEL);
> -	if (!interrupt->suspend_enabled) {
> -		ret = -ENOMEM;
> -		goto err_kfree;
> -	}
> +	if (!interrupt->suspend_enabled)
> +		return -ENOMEM;
>   
>   	/* Disable IPA interrupt types */
>   	reg = ipa_reg(ipa, IPA_IRQ_EN);
> @@ -289,8 +287,6 @@ int ipa_interrupt_config(struct ipa *ipa)
>   		goto err_disable_wakeup;
>   	}
>   
> -	ipa->interrupt = interrupt;
> -
>   	return 0;
>   
>   err_disable_wakeup:
> @@ -299,8 +295,6 @@ int ipa_interrupt_config(struct ipa *ipa)
>   	free_irq(interrupt->irq, interrupt);
>   err_free_bitmap:
>   	bitmap_free(interrupt->suspend_enabled);
> -err_kfree:
> -	kfree(interrupt);
>   
>   	return ret;
>   }
> @@ -311,8 +305,6 @@ void ipa_interrupt_deconfig(struct ipa *ipa)
>   	struct ipa_interrupt *interrupt = ipa->interrupt;
>   	struct device *dev = ipa->dev;
>   
> -	ipa->interrupt = NULL;
> -
>   	dev_pm_clear_wake_irq(dev);
>   	(void)device_init_wakeup(dev, false);
>   	free_irq(interrupt->irq, interrupt);

