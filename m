Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712462;
	b=b/sOqPCGTTOq/A++gQAFvil7lwXwFy5oX3Fz50GDzx7GtemkGhAnzOpVVyHzRGBJBX8E
	 CVpwLoZOIF70pFkEGDFRPi6HLS33KYL+6BFK5jkwH978rx6oxyglFh7PAwK2g0z2gafNw
	 R7MMmwevQllDHLorqp0+KH/249pjXc3pRwKg4wVkAu2z9HD/JFHUNx8AJz1H6lp7pjrDS
	 Gvquhv8ir9PTJYvGnMtg+R+rGx+CNp08+wJjEXegvOQ+6xNIkn6cv+MrcppE3slo4QytT
	 nqBSWiKmpuZLrSlhocNiLHh50ktLTqXzTL9FvRTq61NZcMNMuXZ72sJkEHsiHl2329A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xRUzoMUosdglIXL7NO1Kr4njcuwduorg+AuPTQxBoIM=;
	b=tEnTZXfnLq8sFpTbZH/vsFoOdnzG0V77PV1hiqY7jeKf9acT4pGdl3zlpi/qfKDHTq5J
	 CrTnz14rwpAlzhPtMOND4iMpEWn0Fqe5PT9GqjLpYkfUlyg6IWbB9AkIvoJur3eoj6tE1
	 fnz5AI7PCvcgduuLsNfLJmBJu/bpuD+KVsKptEmZTnlI/rEfKVLpf5he/TBJTkB971O4U
	 SSdAYoFhzv8D3+jElvYmHDYtXy9s30qmpMcbJKpEweccq2sWKmm5/vQKpoAQzsQ8l9iuU
	 kv3NTeFENeG/Iic2vX8j4L2fHRkG7zPm8i93lzIQqvK1TL89M/5J2GfG57CnBzR7ycQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNIK1R4T;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F169606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F169606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNIK1R4T
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4550d8ab15so503913266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712461; x=1794317261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRUzoMUosdglIXL7NO1Kr4njcuwduorg+AuPTQxBoIM=;
        b=KNIK1R4TpC9twbF4BS7SuWvJSUuNrPx9iNsyETuyAuhGzECkUJLXcUlFxAIsrPrBHR
         P4zGRRB7PTCwU3QLPfzOmoLrA9OYtqelwcNNRzIItr4CJUoXSnfUvykAWpB3GHfa8xjV
         quuOYUXxTXhuFLQOS6BCHETjDMrXSNuQ5zeg0TipkGS709Nzbmjfkl2TF0KDisqtDwZv
         Qti+3JPEIKgggsxJjUDBzeNakf4Z1O6Z94sWbwAn1gPkuPTtRjg3ihHmyuGrQhs9gGOj
         bwZHjU1oVo03W3Y9aUaXo9B8zGyPSuOgwhDigNuCZtRp0pshfnB8q/0C6mrs0MXKu6cf
         vSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712461; x=1794317261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRUzoMUosdglIXL7NO1Kr4njcuwduorg+AuPTQxBoIM=;
        b=kewsTnRmzwAj4DLvG55OuOWDXc7wsgBTV9t9/PYh7jfpfX3vXMDSPYhtinzkVB5kJT
         XtDsSoMeLSqxgSjSZf1I1dC2FwkQ8N4TGLu0nU5w/BsCYrZiM/kxVNX7pAOGnMZvtYUf
         q+jkEg9hSvDUd2M2g1m7O7TBmdvkN/k+uOvnoTD+D7aRD/mpBb19KkazyAo9mnVKxZp1
         FWCuETOoUIo37dF0evStS/JJrAfyQM74S/PjrS5YfX+yTFasseI7970xRSBy+ljKXLV0
         9QjFfN+NUv5piQbBjHG66H89qohEn3lkE0lOQ5bYrY3+JJC2uOAL/OEfzJcZ6KrZ+zzW
         B7jw==
X-Forwarded-Encrypted: i=1; AKwUvBwjdCtdvU9I/jH5VtOkTN43N+eYjaM2Cos+u8PNloti2TqHlqj51i8omJDl29JcAm6SC5iY21XjWTsYbRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZQxSiKcFJR577pb0TiFPpfu/5DTBhtks6IC+GFj1SxM4MictG
	w47/+2U9OftrRrPByHpq57NNfsxtY1SrdWsb+yZ26W3vm7FuPTjHawA=
X-Gm-Gg: AYBFou1VqobEhB+ZpI+D9V9VmNaE1rPKCjYc57MvxMHrXoVTFnxRVJV+Zu+elPVRzp9
	RADAQ7QM454zQzGpMgJXLiVgWDW3ftnjb85H6m+98yEqtnh8JKCMDqf1vMwbjCH2G8dLqZ0t6FD
	JVV1Qv+a5d0FV2lLeJI2yauk2njmyEoJR8ize7V3bnuuK96Lfgy8joifbgjJp4zWiWQf/PPXQxb
	tj6h7BtXHpHaHT88ojm0xKf/h3BvxmFmf+scXKE08ne+Ta3LvYwTTmTlEXo3+sLIjzU7R9zpZdP
	Sf4qH9o0DlLkx/LKZ5x+TWl4IWpOSQ1ZAGICm8F9g02GQ+v9I1zdyplsjgw0zocWVdLnwXlklTx
	lh6iGp4LE7n8hHqjNB5fE6/fqFj0Rskuz6PV4JsQaIOLJcNVgi3i4NrRNwNSlPQ5/shiewWoZmd
	uI1CHTYekxUL4+F9RC9ltPPbIQNaDZEHMXsVpGd6vTDHkTmqXnrCCK7T/+S40QL9B/t58UTpPVP
	KsNAEb6ouGLqZ7DzMR63UAzXevY0i85ABR+fjhDv7MAic7A+MAcsq1enAr0He5M3/SHK8lp208n
	IG2kb64CV6fVmY6Xv1TSu0t94I/5I2oFzTb8Qb2nyn8WlkAF3aq1nfZmPLJ34Ma6qXYnExkcU9e
	UckUAlFCZ
X-Received: by 2002:a17:907:3e9b:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c4ca7a887c7mr1045052766b.21.1793712460530;
        Tue, 03 Nov 2026 05:27:40 -0800 (PST)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e7a1d9d71sm19668686f8f.48.2026.11.03.05.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:27:39 -0800 (PST)
Message-ID: <951eab35-75d5-49b2-8f82-984aa4864c71@gmail.com>
Date: Tue, 3 Nov 2026 14:27:37 +0100
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
Subject: Re: [PATCH v2 4/4] drm/msm: Inhibit IFPC for state snapshot
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <20261102190010.720443-5-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 8:00 PM, Rob Clark wrote:
> We need the GPU to stay awake for this.
>
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index aa59b28a3392..29209c23fcfa 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
>   		return -ENOMEM;
>   
>   	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> +		guard(ifpc_disable)(gpu);
> +
>   		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
>   			msm_gpu_hw_init(gpu);
>   			show_priv->state = gpu->funcs->gpu_state_get(gpu);

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

