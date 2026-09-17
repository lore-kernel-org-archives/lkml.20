Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456C74DAF8C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647476; cv=none; b=FF/2ZvF3MTF0lhfrRSz7L8DOHJeGQDtOO+0ZfljdyzGQJLOz3CXech+mlVCuKObdBvc5vRNhVRGva1zoKoLoFHAMecMxGQOKuLfGgFJeUt2uR86VoXgj/aAay5T9vLgkunOXxvUN/hxFVzyBixcg+2AKNYgkkQiHoMC3Ad6SN64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647476; c=relaxed/simple;
	bh=jxxrLK1RVTIembjFJi4fT/dtsvhHsrbPFHD5t5ovx+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVQWOfGPpgO1GVICOFP24Lba5SkAxp7CBFKBEgYna0TWSFhJmtRgwIOtuEp5/tfDi6UUxvcarvexmBgVZKOmswwMguSN317Grmr9YumVBX4ODPHUNuDI4Rs6UAVu7X6rak2oFb9T58ZuUOkDXt/NDDFucNWfSEDbhTPXsE8pPeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=brwS8Gzi; arc=none smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="brwS8Gzi"
Received: by mail-oi2-f41.google.com with SMTP id 46e09a7af769-805cc8b4231so494999a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1789647461; x=1790252261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/CnLftEvKl62DKetab2YvCs3DqAzBULF24/3TZ0i+E=;
        b=brwS8GziG2zICsy+/ioB/6JStxIhgk1QG8R9AIZ4BT6wcDuuef725e5/d0dRyWzPyr
         4hFoyHKX6D7QwoIL0ItSrgbWcOElOZDFKteQP9tHT69O/KceU2klTdpttHHvmCm9z2qV
         4tCUo9oTUyOTvmwNtsCVuMwdDpzGrWosoOZUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647461; x=1790252261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/CnLftEvKl62DKetab2YvCs3DqAzBULF24/3TZ0i+E=;
        b=KzQ4svVOeaXnfYmXGKdyxRaG0LZepvJeiP5oXriXWeLrnLVw2qA6LYzbKuJ2rt2cg0
         HSWePNusmCSQ8LYdrXHJZ8HzNPTNcN9SbEVYIP+THQeBoJtuOgnzHZFJNxxA1MwBvJyz
         DPL4QacvJj6F35hQjP8U6nGcZnxZYJLdhRz3A/QXzQ9HjX8uX1TTNJx8IJE5XI9UCP9I
         aBAq3pJwhdyTxDXv3shAABgtLCmN/EWe/QzHQhTzDzgV7mNDt+XxYITTT88l+NsfLMq6
         p33p66Bz81LfxYrh/JK5Bd/pg7YZRKwpKYyakAfDMtUrTl68DkpzfzZvDgLKspzlhsCK
         u1dg==
X-Forwarded-Encrypted: i=1; AKwUvBz7MRx78Tv8FDp8EzCcNS7m52jKGvYt8bwqhzuP6tGzUXZsXaOGLcOoqD9ctzzFNgjQ/tI15H65zI9FW6M=@vger.kernel.org
X-Gm-Message-State: AFuF++mxAbfIfexnT3nQ+i5a68MG7dXUaBLp8HGJCiqXUfmy2mwBrWvc
	jryzRMMLPJGK/5v6Zt0hoFry714mfkq3/RtIT//ylhDeDbixvIajDr8SIaVTnl6/5Q==
X-Gm-Gg: AYBFou0lxjHck++Zs2UCd8n0XFLTZsUd/FjX3Gt+UxiboC9lJtK1DyzD1zmvg/rnCqw
	Xd2t8sUavry4xGal9pWhxfzCJWMB2LSQ9aqDoT7c2A4VshNo0Aqmwwb58Kt+iY0vuTRCXzILQ84
	cqUFA7XFI5pkueifsiKlxADRy+EinH0e+o7828BBRZrgXR44FnCa6SS1sfX8VtoA0vMkwAn29nJ
	f6OXY8uE8L1jUPHsMupbpF4qJUcuMMHwhQnD3yw6sVLdBPIE8J6iR9FvDtbMUAYRFrcVsQaj3wN
	m7KWwscNgXtJsfMm5brNelTdhgNMCwckg/1HUBKaOqU1Ykzm7P6W492dVFMaaw0LO9/kki7ER5P
	1UDToXLee6FGi5PCN/1d9+4E/if/yS+pVNwhsQKug+YsHrUWYTW/YC+nDd/kjZVuBXG6byjSMaL
	3wWrr87s1TPw3g1ybUShKGh2NLfuSoCc/Pgw+VaijRU4RPKMueWlB2HMrwdkOH/mKOuhtddLbB4
	iVJ
X-Received: by 2002:a05:6830:83b2:b0:7fa:ac4f:785 with SMTP id 46e09a7af769-80b2dc1d7d8mr6835533a34.17.1789647461009;
        Thu, 17 Sep 2026 05:17:41 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-80c46cb6675sm2805680a34.16.2026.09.17.05.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:17:40 -0700 (PDT)
Message-ID: <692ed9ca-fac1-42cd-a514-517f6903f8d8@ieee.org>
Date: Thu, 17 Sep 2026 07:17:38 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ipa: Fix enabled_state leak in ipa_smp2p_init()
To: Wentao Liang <vulab@iscas.ac.cn>, andrew+netdev@lunn.ch
Cc: davem@davemloft.net, edumazet@google.com, elder@kernel.org,
 kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 pabeni@redhat.com, stable@vger.kernel.org
References: <20260917115216.2149867-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260917115216.2149867-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 6:52 AM, Wentao Liang wrote:
> qcom_smem_state_get() takes a reference on the state, but
> ipa_smp2p_init() returns without releasing the "ipa-clock-enabled" state
> when the bit number is out of range, when the smp2p structure cannot be
> allocated, and on the error paths that free the structure. Release the
> reference on all of these paths.

Where did you get the code used in this patch?  It doesn't
match what is currently present in Linux v7.2.

This issue was reported and already fixed:
   96ca1e658ae45 net: ipa: fix SMEM state handle leaks in SMP2P init

					-Alex

> Fixes: 530f9216a953 ("soc: qcom: ipa: AP/modem communications")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/net/ipa/ipa_smp2p.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
> index 2f0ccdd937cc..78f6df2cad76 100644
> --- a/drivers/net/ipa/ipa_smp2p.c
> +++ b/drivers/net/ipa/ipa_smp2p.c
> @@ -239,12 +239,16 @@ ipa_smp2p_init(struct ipa *ipa, struct platform_device *pdev, bool modem_init)
>   					    &enabled_bit);
>   	if (IS_ERR(enabled_state))
>   		return PTR_ERR(enabled_state);
> -	if (enabled_bit >= 32)		/* BITS_PER_U32 */
> +	if (enabled_bit >= 32) {	/* BITS_PER_U32 */
> +		qcom_smem_state_put(enabled_state);
>   		return -EINVAL;
> +	}
>   
>   	smp2p = kzalloc_obj(*smp2p);
> -	if (!smp2p)
> +	if (!smp2p) {
> +		qcom_smem_state_put(enabled_state);
>   		return -ENOMEM;
> +	}
>   
>   	smp2p->ipa = ipa;
>   
> @@ -288,6 +292,7 @@ ipa_smp2p_init(struct ipa *ipa, struct platform_device *pdev, bool modem_init)
>   err_null_smp2p:
>   	ipa->smp2p = NULL;
>   	mutex_destroy(&smp2p->mutex);
> +	qcom_smem_state_put(enabled_state);
>   	kfree(smp2p);
>   
>   	return ret;

