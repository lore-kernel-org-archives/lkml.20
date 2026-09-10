Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9493D88F0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036109; cv=none; b=SGuBe/mBEDLF+vEbO46bL/AO0x97PMb3zpwo5lh2OeWZk8XDSPw6CQLyAHc68GnoTs8WCxk915LyaaOHguAaB0HZGI5/O/RbNEmRTud4V8N3IA3KIF5QCWzgcZ+NFgcM3tqtminPEIR5FwMShe3ffJxRMF284uboCaS5BDnqzmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036109; c=relaxed/simple;
	bh=Kwg0jRhI4AL52qrVXNsJrV+EGSUWuM2aS1H343i+kdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gsW4hGxISetvzXSHyYy+fBSpK7DeQCQy2SkwPT7Q2v9y4GsH1KDAGCqaMAFVyT9vttN6ByNaa7lz1HhRZcgPmP5BIKeX2w1iDVCT96z2Zz/pQZS/e7ohgMLU55YKaAzjGIXS0rwXFjNPWLeu1DI3T4uaXxSfLaxOtNN3u/DZoGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvnI50Zk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvnI50Zk"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b7a9882e19so1667276e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789036105; x=1789640905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNjN2MCvI+l2IUk5fOZ8Pe9I5UOq5joh0GqvRN5Xis0=;
        b=qvnI50Zkt0pjkEU9aF59fBFZaTUOS/S5SQFkLcwooks1q4XdfJuohsRh7RZipHN3j0
         26aAbc6CDsHj5BjzjgQi8g0I+ocUvUMN58/qS32/1L316/Nyug4cpwZURpXw1UL7ryYt
         JUBso1tUNgC0gcVQPhQ4Hg23LZZSn/HoSWu/xfkGUfzBt9l2yjT5bmmyyS9+M7rOg5HB
         QSFcND0NMJxGO12nL1Aj3ZKJrx86MFLVP8Yko+/qJ8QV2FS2z8iPn56YpPG//rJKmOYP
         I69VTegKVQKfD+tnfO0MtO36Yee4HSbNAljHv8hYKgIpjIzWeHjBN+QpLVifzrmMuLV7
         Hr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036105; x=1789640905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNjN2MCvI+l2IUk5fOZ8Pe9I5UOq5joh0GqvRN5Xis0=;
        b=rM6bu50wsBKKrbGjwXHaAyRDlL/xyqwNJ/o6HrjuQJe132MxliEtcL3vhExmCpzNLV
         CJoVUVl8l9wNOjiUGYuNV2dAp1KJ3oQthYT1SYfFwWDm3zrdtTLCaSzuV3+S3mjI+cLl
         UqvoR/uNSc5rsO/vIcsco+ytvp1lMgkSw9m68ttE3yLX04ZvJECC5+HZDAj5cIHCzAcz
         9ngzkty14fHLFim/76q/G+osYlfQ8aRhmNw0gogTKG+ACVrOILXJOjDCZ2Nl6yjv9VT8
         m6hiPeCCAGmgWInASjnWYydCymRd/3nTl3PaYZghI8K3dmK7zn+EKCyTHX1nTtZOOt2A
         lMrw==
X-Forwarded-Encrypted: i=1; AKwUvBxrsHM2v5tPa8jxzRV+5OhqT4K6+cwO+h9DO1pL0IsmpoTbgabCfFr5xQVifH7eKIjaOzsjuOWXXHXc1l4=@vger.kernel.org
X-Gm-Message-State: AFuF++lDgEP0PvA1oDL81AW6KmZ3KLVv1Xgo+lMMFA6g4KGmYnZHmGJi
	F00aKeUiIbrwRyDGUjPqFZul5mI0mv8q5+/FeyFvePm5IZuVJ5jw34rfMcIQDezL
X-Gm-Gg: AYBFou3/p3S0osBEEH+AU09LKe9s1Ui9xml60MEO5Th9o5G7ES5rblLMVFRTVZ2lWSx
	P0J0zsyFwYwlUbeu+ysn690WbVI98OKpxZmW6TgqgyeIhY4s5Wa8XL1wtpZ7Nfh1x9rtlKWwkz4
	MDqI0AWQtjp/ssuBCywMsi8xYDkfjc5GPFVjk5OL5DYhyt/TnsFNIrUfkK5gDB59R2u1EbXMx0u
	IWU++TkMKuTasZ+7dVkEOiTswQmAuJ2+RMXoPjsxI437h5pm/Fv3vG/kRGqn05wtwO/Q5Da+Eyz
	bfnZ7OsiRYa7+GU7Y3zzn8E5daubEShWdZxX2mAdSEcU9dSe3Q6ho62y/tv3lk7tVb1Rf+vcmW1
	yr/RJXW+kI+rKw9Ux5bEQ87wKigd+n8YnXPMcGfzklj2aUx/g8dxtFq18U6u4gW+d1qTEMzeIgS
	squIaaP1lRxefIaPEpjx3dMQH50RZHovtnFaVaPpmh/9aA//TjT925VTwwRqTgekrJetv9P/KWj
	zWjlXQtB4OUseD71tFxIbl+tVIAxnSKGt0yGkHMiybPTCPt/409Lz8=
X-Received: by 2002:a05:6512:3daa:b0:5b7:b242:52 with SMTP id 2adb3069b0e04-5b7b24201e7mr1755659e87.46.1789036104567;
        Thu, 10 Sep 2026 03:28:24 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe6cbsm4355052e87.49.2026.09.10.03.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:28:23 -0700 (PDT)
Message-ID: <af4854a4-d626-4896-af62-312b49b94f71@gmail.com>
Date: Thu, 10 Sep 2026 13:28:23 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: bd70528: properly enable wakeup
To: Andreas Kemnade <andreas@kemnade.info>, alexandre.belloni@bootlin.com,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910092558.1008998-1-andreas@kemnade.info>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260910092558.1008998-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2026 12:25, Andreas Kemnade wrote:
> Wakeup on RTC alarm now only accidentially works when wakeup for the power
> button connected to the same PMIC is also enabled. Fix that by properly
> specifying the wakeup irq.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

By the way, I am not 100% sure all of the PMICs using this driver even 
have a power button input. I suspect some doesn't (maybe bd71815). I 
wouldn't be against Fixes -tag :)

> ---
>   drivers/rtc/rtc-bd70528.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index 482810b61495d..dc86882562abd 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -11,6 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
>   #include <linux/regmap.h>
>   #include <linux/rtc.h>
>   
> @@ -320,6 +321,7 @@ static int bd70528_probe(struct platform_device *pdev)
>   
>   	device_set_wakeup_capable(&pdev->dev, true);
>   	device_wakeup_enable(&pdev->dev);
> +	devm_pm_set_wake_irq(&pdev->dev, irq);
>   
>   	rtc = devm_rtc_allocate_device(&pdev->dev);
>   	if (IS_ERR(rtc)) {


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
