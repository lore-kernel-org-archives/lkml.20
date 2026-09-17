Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634FD3E40FE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621463; cv=none; b=tCOKjAuBtrtv+UHFqjtglhesEajqJYQI837WFHw8rsjbdH1zrvFbo7ZgOD8HdzDj3F89EtH644ZoDfyzj1HS/qDNZGL7DVArSoUNg+BP4XSvtMd5PWAaTAO054lYKd0VhFXipMbRmTBaF5OTZxgxXow0xRNfptXR/IeKIKyWYxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621463; c=relaxed/simple;
	bh=Fo+sfbiaynX50FZ3e2l/qI3EVG40HYWAxAwO9e8v/T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orRgPvkiyBk/UwslkD38asdazUUX5rbNFLhvUMJMORalS5NmN5xNQOC5BK80rPQ2Gc4GeTGRCLzyQAJwdPEgH/XLdroazpfZAFLaZZ2oH5Gva/ZgHrq3qa+add1LaHIln+uWIkqeT0qqFbFvqfmyIFVxo3NsyWR1wBZ3gxw8+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+tDtQCF; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+tDtQCF"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso378830e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789621454; x=1790226254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVRhUpNhNdTq48LbqzJgmbnOl6QrDZN44ur0P2rl/Qc=;
        b=e+tDtQCFYPyrul2pdnN0dWvTSAizO7lMjAxSytz2iWGgJ50yzuwebCk4uSPWjDilVl
         4QFuyavDqYP8KuybB64wytjVG6iUvCaw9WIERplGTAXf2AKUMZ6Q4H9XH3cJLaqrdunl
         uItqQmge6r0AT4yx8MU5U30WGbbEDrO04mHD7HAcEDBd1Zn808eHTtkPjgZ9/ie2rLnt
         m+nHSXDYsL6gsuYn+6R95ZZq1TG3nHhmx300UqA1UaKykrHl/iWXpfdLO2zUpevcgSGO
         dq+uMoAcVnOoJIZ8z1KjJJ25PHnQd6gIuhwyva7pw1dkXHD7Inukc2kNdzLn7VfCHtJY
         C7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621454; x=1790226254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVRhUpNhNdTq48LbqzJgmbnOl6QrDZN44ur0P2rl/Qc=;
        b=UtzDHmgBGXWWH4DqwAMubLAqyDJ6kRY/7E3uRXVX62RI/4pHK1qm3sS9J1G/01Vx9Y
         xA+JSq3kfNe+4aM+/24y1gGLr4YkHSCHIr/kWK0JSo8aGVc6KfOkw3xVu827dYocC28p
         Sjgy/viBafRE4aBHuBj2xklvBR4N/1BBJmewmKrVQrDl85u/SJUa2AkT2wEyrtA+8Z33
         fwzJtiZkX3QMVIUyZ8T9x3gq2ucBKFOPuvGqp1ND3vWMYG1Z62lp8VzooxOZ3Qcx72vG
         fjGx5rta3odbkX06A5lb4zCWxuy7Uz23EmnQDgM6M8/Vti9VH5H8uvTzNbhd6l9lVS0e
         W9Nw==
X-Forwarded-Encrypted: i=1; AKwUvByvX4+iJfJQLFnndw5zI4NzPmTrugQ51lRp+G9ks1bf6B1wH3GLX80M2JlJrlnmq2A0Fep47uyrPUc+m4s=@vger.kernel.org
X-Gm-Message-State: AFuF++n8bWcZsJNtqVwrOsMT+xgp/WW7Vt3g7vM5Hjeemk30bhOOye11
	9qlmNQelcCK7VG3cBKHQZd8UEE9YVg2SJlKVMcty9B/m1R0DLx/OuX9h
X-Gm-Gg: AYBFou0Y5t6ImU1+mHATtlCEEPvzhx+1xikrY4w6QiDzxhN9RnVrLqfDR78MmKAkUiq
	3DMY76MInFQMm5B9lxAksHIzt7enY48mb63k15g9U7K4l+j0Utp/p3BMXz6c0JPZf0w3SMD01MT
	IaSSCzx4tGKdTUM97tcJ88k72DRA8OBFd4G3eTZXsJWEd1dtHn58SaSejFnEmXv5yLc5f4i7MWp
	KJvnbE8pyfdDhlum9pOFNTSTFP2KYaPFNZuPMvcWhD7yKnMKEptf0NUmB4ocP19X612j4hrApa3
	s2RqUkytlFsQU3+ADUL8sF50QI9oXh/N8W1hDaSFZ8TJAkRDgV5bVXossVPcIiUz7mYS7hAV8uh
	0nPPhXkilEUpEwXzjr2yVYGx+UyZq3TnQmL6w0jx/6/uI6Q12nv1f9eV9qiO8hiN2prdVdOs8tw
	WOUkzVT/RA40+npLoobmKoLdtLUiKEYrI43rMa98ePjPsXNPeHIVYgL2PU0Cv5a2ZtcA9wiG1mG
	4Ix9R0HLV65K0q4MiaxKkSZ4L1rdGCGOySOIHeQFtTRj9rWK61bcWc=
X-Received: by 2002:a05:6512:31ca:b0:5b5:e0dd:1c6c with SMTP id 2adb3069b0e04-5b8b66123bbmr1555083e87.4.1789621453651;
        Wed, 16 Sep 2026 22:04:13 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e7e3esm1452052e87.75.2026.09.16.22.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 22:04:13 -0700 (PDT)
Message-ID: <43bdf1d5-bd82-496b-8408-871646fe59d4@gmail.com>
Date: Thu, 17 Sep 2026 08:04:12 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: accel: kxcjk-1013: disable autosuspend on remove
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Siratul Islam <email@sirat.me>,
 Danilo Krummrich <dakr@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260914112053.1686061-1-lgs201920130244@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260914112053.1686061-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:20, Guangshuo Li wrote:
> kxcjk1013_probe() enables runtime PM autosuspend with
> pm_runtime_use_autosuspend(). The probe error path correctly undoes
> this setting with pm_runtime_dont_use_autosuspend(), but the normal
> remove path only disables runtime PM.
> 
> The runtime PM API requires pm_runtime_use_autosuspend() to be undone
> with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
> was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
> set therefore leaves the runtime PM state incompletely cleaned up after
> the driver is unbound.
> 
> Add the missing pm_runtime_dont_use_autosuspend() call to the remove
> path.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 124e1b1d0924 ("iio: accel: kxcjk-1013: support runtime pm")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>   drivers/iio/accel/kxcjk-1013.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
> index 166fb786425f..c6b030f64be1 100644
> --- a/drivers/iio/accel/kxcjk-1013.c
> +++ b/drivers/iio/accel/kxcjk-1013.c
> @@ -1547,6 +1547,7 @@ static void kxcjk1013_remove(struct i2c_client *client)
>   
>   	iio_device_unregister(indio_dev);
>   
> +	pm_runtime_dont_use_autosuspend(&client->dev);
>   	pm_runtime_disable(&client->dev);
>   	pm_runtime_set_suspended(&client->dev);
>   

I am not sure if it matters, but it bugs me a bit to see that the 
clean-up path for PM here, and clean-up path at probe error, do still 
not have same steps. As far as I see the probe error path omits the 
pm_runtime_set_suspended(). Do you think this should/could be fixed?

Oh, and if it is fine as it is - I would really appreciate education as 
to why :)

Other than that:

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

(I know I am late with the tag as Jonathan applied this already - I 
suppose it's still Ok to say I am "Ok" with the fix :] )

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
