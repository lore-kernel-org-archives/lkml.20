Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764441;
	b=SxYiH4Ij28SjkIaW2hjIksFJgS03cdgkI2JxMnEHVKWV71Ky1d2GIDdoE7/swiUMXxnJ
	 o/k79ZXlK+Nad3yqJRtk15UH5WcKNSTglVWhSgr4jD6Pll4Na1AE6dIjpIOesZY3rnne5
	 hue2ka5mU6Y7QzSxxjRuTlxjHh7OtTHkNBPhJdrUd8gfJuwc9BpO3PAk3szo3pAIc6EQY
	 JqFWnXL8wEar2yXUcCzBiGRSGITLaLNHuRfEF7it2RGQswKmaWmCy014JWGk6C7E/SxJT
	 IVDLXrzz0hLGCqMF3M6yVv7i1TudR8T+YIL5VWkEuKShJmcBYXWdzsOJvMSpLVBj5BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HjNlJvrpXlnAC6x8kLspVEYpzuPQTChgZH754Hl21gE=;
	b=aeDVG+9Z8IY390C6h3NQm/YhdgPGq9K81A6Pm4/9QCHoRW0dqQivg0etEURaUdIHnZ9+
	 5EtPNh10UdyrHlgp3gW+gwPOTxWrYbcFcn0C0nlAqIT3AgRCtB8ZxmTNW14hbUZOYj/g2
	 g07/SQNcHrgDj/H70lnEK4TdRvidO0xp38pVymWuau9r4wN2ubOZIVUGpMwFpJX/JcjyR
	 KrP+/EviugwjRYuiNTi2vNmGMin5Hh0N855kfGmA/BHyky2ml0VUOk7hMlAeV0h5YkLzL
	 Sy1XcgJ2LSQLe2NcKcapVOsvHC8h9cROVyorqDPJbsjUx9VJK/+rFma2BADIX3kjZUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=FxfFM28P;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E66606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E66606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=FxfFM28P
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6aa9606ddadso636885eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792764439; x=1793369239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjNlJvrpXlnAC6x8kLspVEYpzuPQTChgZH754Hl21gE=;
        b=FxfFM28PLvv7i0dZ+W+/f+laZfzks+9edtCljOpXQLuWpsfGc27SldFnmShl1lSvBX
         2HaSIG+5zB2F4ECr445tKyco6iuYa8DOpgMwCI8xav9zkCeR7S0xklIXgpv4Vn3jJFny
         57y1/0Aq87oGGOkmnigg4FkxvCRz3807cQ/rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764439; x=1793369239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjNlJvrpXlnAC6x8kLspVEYpzuPQTChgZH754Hl21gE=;
        b=h9oggqE52j3QPuWNg0tmZleAimpqwODkXpwNlGE3R81PNTsN1HnfWi6PpbwUy7qaKX
         LJFglTnS3K7GIA78mwip9tn62V9ETyKPggwFe24MDQ70ez9qA4HkIQsCBlIB66LkvE8Y
         lTP5Sev/mOLfVQhhmnXYezD34JOYCDC/kmb5pb0D8XU4yVSpo/zyHfhIycYOOy7QlI+v
         eILQ221mhgJ0OcR3wILCFRENktkLY6NjdVIEBB5Jn0miKJkYe/u4KQ+r87civEAdGP0I
         gZXJNxKurDGSZMvkLKRGcVSSwwuC54CMorGW6O/jDX5qFPJBUnGi9eFmd6HYe8gn6xXY
         f5fA==
X-Forwarded-Encrypted: i=1; AKwUvBwEkBbIXy5uYI8sy/lyavEfSQA+2Nk/yTeGOyjjbv6C96wGw8aB3mo9tcnSzsOUoMeJd8MVUdQOdQgDlYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBgD9R10updU9XMLgJ0ACMMunc2wlsiY1Idgel5j3v6gDV4pr0
	Lb2w+hGexyLEBHghuapAsB5RGNElpFMO/UgiFxtwuBv6jFYacDMRS6rCpFEKvDs3hA==
X-Gm-Gg: AYBFou0BR0VWjtfAUAZqWGXyS4zVnOZBS2VzbLnJl3bpg9M7ZF3+7aame2v7jJ+UL5K
	DGhALq/TCok9yxPnioIWnJFP+VEiLEkd5sLx8oMcEFt93cEAIwA6HC95DXOGZ3UMpEhuEK/z9fv
	+1gUcea54+0wBDa8KbIGJ9o08UZYk7gZtz9QAL29wWBeZF4EMQfkaLCHJxqydBCAzRmWPflGygI
	8Vft40+e9c2llTdahOcGznH/Y0tSZvdONE+gS8ue4DXjc28NhSc5wvCvPc7plI0aZkCepFyNHEH
	LwfML3UpgfiQFQ6Z0IG9AZ+30fOjgzJl5r5MmIZMmnHJRnUv3jgs082v83w8ZYJMgh1m1eoZQwK
	ywg3Rh2P3+GUeZ6dnuW+fO7se5pIupk0pwp/r4RfLAPN3vrbYZ2HcW/dZnGcpxdGadx/1AfzAwk
	2gijBjEm/8+arYQaJxwvj0HpPqtQPd/BDw7YmdsVPACa7qRPk+wL+MFyyh9LjSQsTHn5u/L7z+x
	QAf//DMmJfgNfeV+FC5kA9clpIsr4Hiap+gK3HX6fxMgMLiajE=
X-Received: by 2002:a05:6820:824:b0:6f7:9b00:9c54 with SMTP id 006d021491bc7-70b889f75e3mr1649158eaf.34.1792764439178;
        Fri, 23 Oct 2026 07:07:19 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-70b9ad1c706sm155065eaf.1.2026.10.23.07.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:07:18 -0700 (PDT)
Message-ID: <0f4649ba-f731-4f19-ad3e-2d82b641c0a3@ieee.org>
Date: Fri, 23 Oct 2026 09:07:17 -0500
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
Subject: Re: [PATCH] staging: greybus: Use GFP_KERNEL for audio manager
 allocation
To: Torra Sowmya <sowmyatorra@gmail.com>, outreachy@lists.linux.dev
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261023134046.9678-1-sowmyatorra@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261023134046.9678-1-sowmyatorra@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 8:40 AM, Torra Sowmya wrote:
> The audio manager module is created in a context that permits
> sleeping. Its caller, gb_audio_manager_add(), already uses
> GFP_KERNEL through ida_alloc(), and module creation subsequently
> calls kobject_init_and_add().
> 
> GFP_ATOMIC is unnecessary in this context and restricts memory
> reclaim. Remove the explicit flag to use the default GFP_KERNEL
> allocation.
> 
> Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
>   drivers/staging/greybus/audio_manager_module.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index dc90cc2d2308..8a9f7e7d1766 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -187,7 +187,7 @@ int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
>   	int err;
>   	struct gb_audio_manager_module *m;
>   
> -	m = kzalloc_obj(*m, GFP_ATOMIC);
> +	m = kzalloc_obj(*m);
>   	if (!m)
>   		return -ENOMEM;
>   

