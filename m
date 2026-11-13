Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531345;
	b=dNyL+jPfslZm30swjvfLRWD2HGAohNislGihkes1HA01/kEvCyUqYXtpufEJV+PFz5Do
	 DaDsGl/N8HsIM8A0rsGwMAAttQGsHlkttXim1BeKyukjjdNCxoBOonGnQYdoqtJom4T2u
	 qjK+qM6ZnGVG/GnCmiWYH2qsm1kQvq3WocOVc+9sP0KF8IocVCKEaif0Mh0IRK4dhgXtl
	 ZJg+DbzY2MLuGmiHiXASMuT1vVGHutBA7XaYXWq9MpTUTJoABw2Wks3g1UsmaXEnxxp8d
	 JM7F35rGSEbhxqEQiDHWlxlgKuzz38iZ9uSdGnUd7oBtXthlMo/2qRJI1C0Li54vC8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0tUZ/r90AwSeslzGso6dCb5vC4FbswESQba0fvf+Foo=;
	b=0CGdvZ8RY2Wel8tPkxaooi8Pj/a5QId+uGhApyS+Rek+AaPVYsnfe0JUWz5GOwoRf6fV
	 bhFQ42R5vY25lYXjm1mC7AkN4I/hVj9Sy2x7cZ82jenInaLfCrrUNwDUBmvS80kf4nBPb
	 9SAIUzpOPFUmNDJPMmz5YS1t3OTXhTOywd+thlSp5mONWqDrk9GRQWop7AV8PuLk01JyP
	 o/Y7YfHLHd0+guUJXGMSlFpP/x6DA8udnkxNIrqP8LPHfq7UBRuau4aZ+ggL/MAHBPaVL
	 kZZUOAkBlcJULtNXpqUIomjVLkOyC2IDVMNUSts3pV4Yqthb38SbpX19nm4TL8nOQDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lPKSbQ+v;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5C3606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5C3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lPKSbQ+v
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso862524f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794531344; x=1795136144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tUZ/r90AwSeslzGso6dCb5vC4FbswESQba0fvf+Foo=;
        b=lPKSbQ+v6cn0qckNZ2HObZqsWk1yflt0gbSiGlrodWsODQWWsX8iNNAe/NiVO7iZ7K
         pxsKAgVOAe01/xg1mq2bEoXzeKmqT3eiHSQW0hUIspOlUMg5aOoNqKoBSQopIKlrxgA4
         5upzWRZcqdU74/2IGFFH+DYcZ7RXy45EEvY/nIwEVwWM8pzaNyptVAlRvgc0xagJ5uTS
         KB3XF3mEz8jm04ufGZclHmxIaSvhwbmRdNlox3Hi3gZ9m/lwj+w5XtEyuEsjsZkMuPTd
         ByppVfwoDb5r6hyYUseRFotpWidghcACbYAHKRmQ0y6P252Rn4VeYz6tjgxivGAZq9Fy
         npbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531344; x=1795136144;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tUZ/r90AwSeslzGso6dCb5vC4FbswESQba0fvf+Foo=;
        b=GnydfZqzehHIwJnCjq2jhQWpWFNScaWcIPBa/NxnhpLG5NFfIRNsvXsPrPAS6sDo+B
         +bBikpN4bthaLG8N/reqxBRDCyNoUCogPLFQwINL22THz8h5HAdtp7bK9Sj10Db14aIH
         Blry7JuBvG/HI+WL01PBYz+4sBV1z03TLRLI1yKOtsCUboFXITRQp7zGwpDqA5899XO9
         y74eyIuv0z/UNpjP0iicnYEsMdUC6nLp5tRNAYMxwdKKQBTWZEN7u4Am4cdGdihvFqz9
         mW3+Ys99RqZFRja9ImniiCsYeRblFIlhd5l/m/7jZripDbC3A6aTKMz6IXgNY1aq2xPG
         HZnA==
X-Forwarded-Encrypted: i=1; AL+hErFHuDM6ZjjtH5xE15WwjF2VdOhXersj75ZiCNOCqflJDEuGQR5+rFOkmhwWvO/u/kiMjNyUq/e7RdPIZLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QYOjKlQOw+jn4Br50If4ZoWIQkvLW2/nCwedHeehGBZKdwW1N
	dhOrMekJAivgoRFwPFmwPtDoDZOclUG0Xt1SA9WSxWK3GZiq0M+YPfPYPvLo+T73PY4=
X-Gm-Gg: AYBFou3QS3twLapr6/xTi9wvgY0ZSlskqnexnIJv1KoEQDN50ZO6rpsN9n2tjinCA77
	nmS+RbAX3BnKd+fo2xDDuLogUXIiabu1n9u9ogkXvH6QofyfidmzIN79F5uEJumbwX9/e7U2dr1
	sKZ9dDfXfwnE5u4lr3iHXDRzwPBC0cwMREBJrv1CbVI2HLvUc/Ig6W6BJ3PE3fF8ZYa01xSL8oj
	nI+BUOOKVr7T5zC8SHnwuznTInszS8jyQnPer/damVKUx6iavOKeicQU9rdkeC+pGG17WVT4qpI
	yCu2mMbbj184MLO6BGDJ+yOUQqpcxVXiGG1Heda5HnJbHpUGVNnAn1l7yYbCgmJlU8MMqq6fPSx
	/2/dR/Rwren98y7fRud+W1eB9hh7SEpqHkzqPlUBU0tnl5DOZdfUXM6rN0zUhI3ijDCXskwQB1s
	wwnIOr6rFh+R94LfDdYeD8nsrlEpmrZRQ6AYshka9xZaCqpHUYvutvO/zr7aJtDKYQ87keO+xOa
	Mydhl8Hp5nL6lMttAFVraLsOy7wxrljIvCbCZxzkTTSGidW6EdJTQNx0WD6amcwic1gDYsJvIi/
	enaBDiAaB+vfe2Q2/5NcwKDEBuvFz7JqEhbIT10Lgxw=
X-Received: by 2002:a05:6000:47ca:b0:488:8347:a110 with SMTP id ffacd0b85a97d-49c6f5e9818mr1560854f8f.7.1794531343598;
        Thu, 12 Nov 2026 16:55:43 -0800 (PST)
Received: from [192.168.0.167] ([109.78.26.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm2106178f8f.59.2026.11.12.16.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 16:55:42 -0800 (PST)
Message-ID: <39881cfa-6f44-41fb-aade-041d9cdf2f9e@linaro.org>
Date: Fri, 13 Nov 2026 00:55:39 +0000
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
Subject: Re: [PATCH v2 1/3] Revert "media: qcom: iris: use disable_irq()
 during power-off"
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 09:05, Vishnu Reddy wrote:
> iris_vpu_power_off() is always called with core->lock held.

This statement is not true : int iris_hfi_pm_suspend(struct iris_core *core)

And TBH as I look at the code I wonder if it should have a lockdep 
assert if that lock is a requirement...

  The threaded
> IRQ handler also requires core->lock to proceed. If the handler is woken
> and queued around the same time power-off is entered, it cannot acquire
> core->lock because it is held by the power-off caller. disable_irq() waits
> for the handler to complete, resulting in a deadlock.
> 
> Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 243bd845349f..1e183fc4e58c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
>   	iris_unset_icc_bw(core);
>   
>   	if (!iris_vpu_watchdog(core, core->intr_status))
> -		disable_irq(core->irq);
> +		disable_irq_nosync(core->irq);
>   }
>   
>   int iris_vpu_power_on_controller(struct iris_core *core)
> 

Looking at the next patch I'm fully recoiling.
