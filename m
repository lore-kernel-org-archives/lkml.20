Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712449;
	b=hvPZUXflehyn120GFuh+BSuB0H369EhlG8gTiqHa8DCB8XixX/yzu1CzNwvyp0HKbEa0
	 1bSNz82o1FvAaLvI06PAejza3KYJVbsuvQgKQlzycFvHwHmAPtBk6vdqs7DgYRFlF0vTk
	 unG4fPgZNAjD0joGW5cZIQNBi1RAjuxQ8WSvrXuWwNHF+ZJBS7DKBimQtyc55JBXDP2kk
	 gfXvP2/oJYYZSeCOvC3ZRRSerqWvlD7sU9pdPrb2c9rzeP+OQlzJMxp/T6meDq+CAxVlK
	 KIKHEeQ+XijLMpIDwB8j5DD/h5z1780hCFVHEXwogQZwGVpsFzStcf6rtZZ8H5nblZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=o7EFRwU3C9t44EpOq54u2QVurE4/iG5MM90/J7UPCIk=;
	b=UqS+1MVkKxFYDCPOVW0YlLwB+E39oEtDyICYM8ow666AxUivN50EYFw0r+ox6jgKc/p3
	 sajMftrAgdiAWgMPCKzm1v9FmofH4rrSn9kKbmZJ+l7PpHw9uENUq+cbdHgrmICimVNAK
	 /PqSYmQA2cEJtCTbWY5HQvl1HHG3UE2KQJVYKvQ+fvAev9eTAzLqSacKFdSzpSH1qyhoW
	 +38wi9UsjTTVaug59O9rOjhMT4LjXmeeLIdkOrG2bKBvDeXqh2RieDJnY9DSCGKEkPjur
	 El945RfQb92a9YcJnAFSD6OC/fv4kzAS9S5ALsLLVAGZEKz89ZisjEr/zMoebOonW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flzvY8jw;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E2606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961E2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flzvY8jw
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4342905e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712447; x=1794317247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7EFRwU3C9t44EpOq54u2QVurE4/iG5MM90/J7UPCIk=;
        b=flzvY8jwVF2xozGbYU1fU/xiTUrC7dkQSeNvZXZEk/eGMzEJ+FklvJA1qgP9P+IYO6
         xm6dtC32I7L9+7t8OvQmWF6Sf5iK1t1b/juX9DXkmr5tk7C6gTRcGiQlQOk2+C+q9Anq
         rC15T5v9zFr4KqZTzb5YOCaxzsAZ0XQ10KbpNO8sFdjVhPFskjT7QvIhZDz2i114tMzv
         2NQSwZiz5UeVC0k4VorWpChWDQGrhLqUEK0c0XhbXW9fRJAIoj54izIvziD8ZseUy7/s
         OPtv1id7vn0Rzpb7TG6nzsJsuDc9IIzHehtMpkdzocLycLmd7m4x6V1FbOmt2okPONWq
         w7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712447; x=1794317247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7EFRwU3C9t44EpOq54u2QVurE4/iG5MM90/J7UPCIk=;
        b=onZ9nFwqKUyw081cjIi9V524nsQfQD//xYb9XEjxpkKaieOMoIdsfSGcQwE6b+EtKX
         gmJ8omMA7UPvK3DF3aYPXxi2sAzKdG3Sybv4UjZc/ziDMSfs+2dKVemmxKt6wku+bm66
         giUHxE5+un9wgaBhQBC4Fi1kZ3dJMHYN3dmkiFNsHcv9MAzWGFFDI6EfRJnoEMVXDQx5
         In+8pSh+2h7juo35eycCdSk4FHz2cswYwcaRmotgyQrMaCOGJ2l7hdc+PyKuOPEj7mng
         PF55u5ukD8PTDEQyMRd2snOLsJ1oNgsrjPcj2wpUNPDxEcwGCLEz4cllmA67ujEYTpKU
         BnWA==
X-Forwarded-Encrypted: i=1; AKwUvByE1olfP2XSFbqU92nB6C1yECHrIAD4fNgto2+QcUpnUb7BCWMKso9lpxUOGHA7E8teBnrGgIyKMLJHEAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hXdYHPy5c0hMPBaRopffBHvPFDMwg39DFgQ8rGyQEx6hvnK9v
	3nvVPnby9QKtcnvUZEpTqaONu+8Rf8a1EKsSWSpHNmGtwwf09+hJVVk=
X-Gm-Gg: AYBFou1LI7R22rfL276XurI4hFeND8/gAsK1EgnK5qAC0vBUNH/2ycJO7f57iT5QVBV
	1yeByjAptWpwNj1N312WluQe9X50IILaOJ1pI+kGv/2j/WNCsd4q2gShaYAicnTTeA556Z5pMjB
	aI680uoV3B2q52FSQLK9Wz76FphLzJ+OLiDbqQh+Vba4YufPLXuecladPRwCrmITZ9cnj8roIaL
	klRxZMyCUBeHmRaTTQ7Eg7vgpc14vddD73O3huhx4oXWO2+SSxVw1ONDNAK00no2//5YtxTHL11
	+zfSo7/DKgKwjCrnAl9Zni3tuRHjEcEGD7Fbhaz9vB0BF0Ouu9R5+vUNG/TcjrLOcAVkbaWktU2
	lIPrPFt9sBxp/A1oqXYdHoKjRynqdeKcb9zeE1DL7P8OhRZAlBYUyJgGj+Cls4F7vStiyJFUUK+
	Ln1RAMjvIwZBxH+nBjb5ym0eZo5VnQcfiyMyfG0W+uT10gQMEdOLj3G0aOAVAGbeWAbrH/T0KKt
	WouCEunYr8LsMD1WZWeqfZwr0EFU49Q5aIK2UtTG87JSw9nY9Up5I9dikaQqWO5pnPlrGYZINSS
	GiGBRLLz3SBObOSmprv6Q/dLhVFa2TY9gWICEsAgOSKhoEGDcTQ/kLxRMaUl3lGYiF4WwaP6JV4
	bfuOWh6Bf7g==
X-Received: by 2002:a05:600c:5246:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4ac16acd947mr312817415e9.4.1793712446545;
        Tue, 03 Nov 2026 05:27:26 -0800 (PST)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm81672285e9.13.2026.11.03.05.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:27:24 -0800 (PST)
Message-ID: <40178c7a-8a2f-45e0-9afc-a54732082abd@gmail.com>
Date: Tue, 3 Nov 2026 14:27:22 +0100
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
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 8:00 PM, Rob Clark wrote:
> We need to move the gpu lock around a bit for the next patch.  Use
> scoped_guard/etc so we don't have to make the error path handling more
> complicated.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
>   1 file changed, 12 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index f12701e286ec..aa59b28a3392 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
>   	struct drm_device *dev = inode->i_private;
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_gpu *gpu = priv->gpu;
> -	struct msm_gpu_show_priv *show_priv;
>   	int ret;
>   
>   	if (!gpu || !gpu->funcs->gpu_state_get)
>   		return -ENODEV;
>   
> -	show_priv = kmalloc_obj(*show_priv);
> +	struct msm_gpu_show_priv *show_priv __free(kfree)
> +		= kmalloc_obj(*show_priv);
>   	if (!show_priv)
>   		return -ENOMEM;
>   
> -	ret = mutex_lock_interruptible(&gpu->lock);
> -	if (ret)
> -		goto free_priv;
> -
> -	pm_runtime_get_sync(&gpu->pdev->dev);
> -	msm_gpu_hw_init(gpu);
> -	show_priv->state = gpu->funcs->gpu_state_get(gpu);
> -	pm_runtime_put_sync(&gpu->pdev->dev);
> -
> -	mutex_unlock(&gpu->lock);
> +	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> +		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
> +			msm_gpu_hw_init(gpu);
> +			show_priv->state = gpu->funcs->gpu_state_get(gpu);
> +		}
> +	}
>   
>   	if (IS_ERR(show_priv->state)) {
> -		ret = PTR_ERR(show_priv->state);
> -		goto free_priv;
> +		return PTR_ERR(show_priv->state);
>   	}
>   
>   	show_priv->dev = dev;
>   
>   	ret = single_open(file, msm_gpu_show, show_priv);
>   	if (ret)
> -		goto free_priv;
> +		return ret;
>   
> -	return 0;
> +	retain_and_null_ptr(show_priv);
>   
> -free_priv:
> -	kfree(show_priv);
> -	return ret;
> +	return 0;
>   }
>   
>   static const struct file_operations msm_gpu_fops = {

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

