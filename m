Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A34F4FD78A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791427; cv=none; b=UDR6mkn9X6T1w1WmxGo2SqLNh28gHI9NGgEI7N63NGrOsRV/8Of+WDXcLG2VA6hVTrcThyqDkAOjq/OuFb/sm6zJr6S2/3KIffWhdHa+IgHUvBpVWQRGHyuEG6JmkSOZUhkSJqeK7MRlRP0aXVOl6Aeb7QuXnEaPKRWToonvN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791427; c=relaxed/simple;
	bh=YBSleO+qUBV0CGp3vnKdPgJjrEZ+GFiqw10+pvoc42A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvSf7995kOh5A8iYYltYPsItO5m8LfBuneLIed3hSIVWo2opxh73xC9x394ajA4TQjVUjJg1Z3B+Z1NphElD6fnX6vPd6A8cgJOPx/OmTiCGGMyqakF7DogUGznxWbjuP+8uWrOweL4d81tAA1npQ4m5UbqaDtFMjl1tMVbD6es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVUxBIiK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVUxBIiK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso52594965e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790791423; x=1791396223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0n18LIH1tvBWGAP/420toHKsoVmCmgfsuDIdW5uR/Hg=;
        b=RVUxBIiKzyuq076xm1UXwHb3zhH851Kk/IbBOgshLKzV7bqWFTQfNO1d+4hud0wIXG
         xMVuFXZx7G9ZpNfMKur7Jr9JQJnzEWYG1MfHRrlQ7gg4vZJLcatL5lwXooYV/ZAYv+hA
         GGZtrtzDS5QHHi9Eyhc9BJudwWNvaVsywMsGt+5G5UKOtnP48oRlfqIy/VtzOOnjYkUz
         n+dsugs0CfXOFfBRH/8X/+fYIdVEstlL7YlEEFoWfrz0O6vemqE3z3y4tXIunW3vXoMM
         rKhe4DLO/3tIqJktpm5ucfNh5aY70pJQBuhPqKFXWBkM8ZOuEq9qgZZEWNPlbUd1Vp/g
         bLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791423; x=1791396223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n18LIH1tvBWGAP/420toHKsoVmCmgfsuDIdW5uR/Hg=;
        b=Ntj2YZmRBBvCOQ6jX8v9XtNW4/1SKzZkiYRoe0ASBxnNSYQsqog6PA7cqWkvXbD+Yq
         lFaB90jEuS6LVdEUnw4DDppl1ycdEkNdS3oECgEZgBj+HJ292TaUDm5MDRlIiySuVItz
         GbuL8mJzzf1RITDJpL4ATKTYL8UVFpExdk446FQK2RuOvrg8SX+cAr2tgrY2pbbP+8fO
         Y0f0zpDZcQncvqfiZxo0xL+ySV5sc3Fkr2peKJYQ6hWam00NJlQzRCGKFxKBDZe167BU
         1s2/dIyBzgQQpUICKEYNJLzIo5ifTpd4Qf7UOIgs5aa2rGH5nycpGZUjV98py9DNx+kO
         7rRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJZ+S1uUxheNmd/13H/nvUZC2Nppyx5GmPRpANw6C+MNrHkUzDRxtpBEsSulsAtqDJ1l8Y8PoQ4zKkyQM=@vger.kernel.org
X-Gm-Message-State: AFuF++naKo3mA1SIH3cRW1AHEHraYBGSv6hFdoOsA+qshJBXrc2pxAyF
	huJDYdN4o4E1afCTMocKU+jcRFvbeGjIjAv3ZG6flBGSx7+KeautbWNXM+19cw==
X-Gm-Gg: AYBFou1WQ01At1kQHj0H24L7pnHLfim7qwbnvo9NoO41ytfeQkOk9Y+jQfB9PJb1Uzn
	gVs/clZ4i9MlYK4zZqKgzRULTHDtB2iftyhivqdUO8G9zq/NHtAPQVvre+5goQOjJEHIj9tmJEN
	7rjhe5//fR67U2mWY3RPgPHP8tfECKcwHDlFhXNP6WTQC8q29IWBp2BrJHUTDYv2iKAuxqUFejK
	LyjsTC4G1KiAPBXBfnj9JeUliqzNyteHwKyo3OCoLtcVDs21g192T//nVjWxfC7C3lME52VYoP0
	JM1PNWSWQkugw4h0ZicD3s3Iw2I5nukoZApaGKqQrQWf0KysIfCR9i+IZ7Ittmgaz/+IV371aJ5
	yU61s7Foebvyt7WffNyJTIeXhpeK16Tfh0f+YHEgu5xsjEYcf1zP1VMDcV+JKmEt8aaO3YYcKlz
	44vwY/ANgLmRrPbVrbCQzgz6TYwP0unA8bL0IIJuSC6tvJ392pVIcMEHHbHIXhiSaV2nDZJs6fe
	8gITA==
X-Received: by 2002:a05:600c:8b88:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a01ad98373mr38023785e9.4.1790791423386;
        Wed, 30 Sep 2026 11:03:43 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm165395e9.2.2026.09.30.11.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 11:03:42 -0700 (PDT)
Message-ID: <d398a8dd-a182-4e69-8f5e-12a820594093@gmail.com>
Date: Wed, 30 Sep 2026 21:03:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 rtw-next 2/7] wifi: rtw88: assign the RCR per chip in
 rtw_core_init
To: Luka Gejak <luka.gejak@linux.dev>, Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Straube <straube.linux@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>
References: <20260930091604.52891-1-luka.gejak@linux.dev>
 <20260930091604.52891-3-luka.gejak@linux.dev>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20260930091604.52891-3-luka.gejak@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/09/2026 12:15, Luka Gejak wrote:
> The receive control word is the same for every chip today. The generic
> default is written in rtw_core_init(), so a chip that needs a different
> value has to overwrite it afterwards, in its own init path, far away
> from where the default is decided.

I still don't understand why RTL8723B(S) would need a different value.

> 
> Add an rcr field to struct rtw_chip_info and assign hal.rcr from it in
> rtw_core_init(). Chips that do not set one keep the generic default, so
> the field is optional and no existing chip changes behaviour.
> 
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
>  drivers/net/wireless/realtek/rtw88/main.c | 10 ++++++----
>  drivers/net/wireless/realtek/rtw88/main.h |  1 +
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> index 0f23498b5c96..53d8552c0d35 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c
> @@ -2191,10 +2191,12 @@ int rtw_core_init(struct rtw_dev *rtwdev)
>  
>  	rtw_stats_init(rtwdev);
>  
> -	/* default rx filter setting */
> -	rtwdev->hal.rcr = BIT_APP_FCS | BIT_APP_MIC | BIT_APP_ICV |
> -			  BIT_PKTCTL_DLEN | BIT_HTC_LOC_CTRL | BIT_APP_PHYSTS |
> -			  BIT_AB | BIT_AM | BIT_APM;
> +	/* default rx filter setting, or the chip's own value if it has one */
> +	rtwdev->hal.rcr = chip->rcr;
> +	if (!chip->rcr)
> +		rtwdev->hal.rcr = BIT_APP_FCS | BIT_APP_MIC | BIT_APP_ICV |
> +				  BIT_PKTCTL_DLEN | BIT_HTC_LOC_CTRL |
> +				  BIT_APP_PHYSTS | BIT_AB | BIT_AM | BIT_APM;
>  
>  	ret = rtw_load_firmware(rtwdev, RTW_NORMAL_FW);
>  	if (ret) {
> diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
> index d59f6e323adf..e0f389040089 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.h
> +++ b/drivers/net/wireless/realtek/rtw88/main.h
> @@ -1253,6 +1253,7 @@ struct rtw_chip_info {
>  
>  	/* init values */
>  	u8 sys_func_en;
> +	u32 rcr;
>  	const struct rtw_pwr_seq_cmd * const *pwr_on_seq;
>  	const struct rtw_pwr_seq_cmd * const *pwr_off_seq;
>  	const struct rtw_rqpn *rqpn_table;

