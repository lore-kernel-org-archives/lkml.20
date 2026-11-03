Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712429;
	b=yQV1Jh20+bysUu24aqk7hhpiilgygfYDv/Vmnzp9bZSnHX+ZaJjEK7sf9PwYyK3cGVLo
	 mNbBDIp7zhA3/jcSg98P4XNA3Oiq9pzK1tJ4D94fFm5yWaDh/TggVeziKHgP53Fl/nYVC
	 AiSm6yQaZhDdGY5uouMVF8YMGv3K4qzQC4DDAzk1jCi4nV98B3kSKsemyWURJXHkVHM3E
	 SXUECpipoKxch+S9Iv+WCZnYj2k118BbK7v6iH2nGx75PZ38EewFdOlcC5r7HKW6Gowqg
	 4KF5IWkUh4yNfPEuGwHDEY4OAZ4/7gL5/jWInM1al1UJvnIkNjQFX1MbM9ktUDuhzqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ta7vqfu43+eJdwILEtJUiCIzSZFnqUgMnY49Wv68/Ms=;
	b=CRO2kNJsyydHbRiY0xz6T2tJfCrSVk4C57pNklMR1L9sMbycWv5fJ1tNOuNEvdAnP+Vv
	 cgNc8TS/AoWI8CfZXbPXyBd5G7sWRqknl5Vgz5bp0S8Mn/bTa1M+AMtAGy239rEgMWJsB
	 1ZHEzNCrq+DZtIK8z2+LBaF4aIOg8Djdgyy1n7sdK+2IIVr8a9B3NPKHrlctfjk9LQqTy
	 ekNGJp97Ke38/2pPNGYlFa6hjJBbOWTziHgLmhy0llGq0GCfP6Oa180z8gi1u3Wx3RR9m
	 fOQXshM5jEz39Msw1+7AOD0/Mv7pUNDuF9z0rytVaG0xXZ8+1lpCNiTqDFYCwoq+9ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFRyNSk3;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5C66083629
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5C66083629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFRyNSk3
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so42476815e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712427; x=1794317227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ta7vqfu43+eJdwILEtJUiCIzSZFnqUgMnY49Wv68/Ms=;
        b=QFRyNSk3MIGPcPGWWiMdc8sLrAkZyrmXyBSaJ4G2CZv2ajMG3p/eDD5KRL79rX23Jw
         gGjN0UgPiE/T4N8DlOTIaNbnX4CTHrANgdoHCor34RoKg3bUYSL4x7BQ+dXaUbU48weE
         HlDdpHouawugcAymcWBAH6jTgRb1VtoZ5Y0ArCo3l2OgbVYIeaLRmu8SA3BNSg7DxNwQ
         nn3d7q5zNzLqOrmrMEpP84DhtxiBfko7gfUlYgnFXmYfT+IIXCbOprRm71JUMNPCXmis
         VTMyllKDZWgYPA0USFYGAXEiwE+9aQb4iItSkr35CedLAbP5uFmkKuC1iCDWdEnveWAp
         M8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712427; x=1794317227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ta7vqfu43+eJdwILEtJUiCIzSZFnqUgMnY49Wv68/Ms=;
        b=1Dmp3Zjx637NBnstzO27NC/MLKTfn/Nh4CCBXI55raaDxkAMqPKA1Nm5m3iQYClhep
         OZnzccWv0LJ3bG+qXCfTiM9+RZ84gJ3VMbSFAAnQxQX/bLugTKLZvRxOX91tvca4GBnm
         967vipH+QtWkoVnUqkMNQ2qfN6KeP6OoNQmjHNMagC+iLvRmhzpYeTsIsE2TOQbDy15Q
         o1pl/KKFiwfp+MrsMDQ3UiTHFVj8uTbU+idQq54VjKzgTjCt/MHxGuA7qTkm9n3XeNze
         7kcesnrzE7yHo4sgh8hSyxZ0bLuCd3m4QniTBWM8T7CAcvanFRJsBY7Su0FhArZDbZK6
         bdrg==
X-Forwarded-Encrypted: i=1; AKwUvBy5NK7YpCG76l3a2QF9n2CQFr9avH+Zxe+Xr30iwC/0S88SS0CD0a3WbLt4ExNOnVPLMrujwD83QDpOei4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kxsuDcWfQWnNE6FAbQoqEjzWQovVokFRJn2qnzzuhPM6nmi2R
	jVQWbfKeAHaf2dbT6nasrG87NsNyDB1/S0lbaVw5rKhWUH8DVZ4fq5A=
X-Gm-Gg: AYBFou3wS/Gcqiv365T5l1RZVXJpXJ4gtmAwo+G7dRvPx6TYyPTb0SGV/a5Ps8bQ5VX
	VNF0eoP8yu4zQ32p91UdDKnyPOY3Bl2C0fc+y/yroZ7fMkouSrDspynhUQccdeU/7rIJOTZPxRV
	NBXM4FMpp3KyIR+pXKFh6NciVCG5Wueq+JGJW2le2jUWHnYJ4Q6jy6IlyI3j1fInrqHaBNRvajF
	RPTui+YQkEQbS2ICZsQyNxHHBHeF/I/RVFtcxmeXlvd8sUnaWLK0VGBgSIZs5ZTazuyyyfFtdML
	NhyD7cL7pvm0LqF6R9pqRu1zz/uCU3ho5MpADYNiSakRkYNVdeFICCdCQOI/z6iJEUcvCkyR1ek
	OHZ1vMN+S0wFegZJSNfj7r70xHqEw4tYxSnCzlYAwX8NrSANEGWb1dyiZmdaQwrhuWb1279epow
	fVgfbjYvmOloR7huRwLC7osNq8d5oA0URK38oYCGHyXAPLYm6tleMJL7g3dpMg+ft5+B3VcfhCY
	XtX3pyFuAVESV0PxCzta0P4WP/VSDdcCCtQsdCIFY+m3zkMd8UpuXcsXc9/ULOhbWOCvOW1N5U9
	P0pIv+j8PV3c1dfRBAqm+8jZpy23iNzmpx0uatw9ytg78Zp1m3L+pJs8tjEUuywquyE2FJjrUOg
	CeC22JEfi
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr316952755e9.9.1793712427364;
        Tue, 03 Nov 2026 05:27:07 -0800 (PST)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa38bb4asm57032565e9.6.2026.11.03.05.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:27:04 -0800 (PST)
Message-ID: <a3da6619-b40e-4118-ad52-bcbe319cd601@gmail.com>
Date: Tue, 3 Nov 2026 14:27:03 +0100
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
Subject: Re: [PATCH v2 2/4] drm/msm: Add cleanup help for disabling IFPC
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 8:00 PM, Rob Clark wrote:
> Simplify error path cleanup for IFPC-disable critical sections.
>
> Note that this moves where we re-enable IFPC until after the
> wake_up_all(), but that is harmless.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_gpu.h      | 4 ++++
>   drivers/gpu/drm/msm/msm_perfcntr.c | 5 +----
>   2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0334a0f604ac..e7912d2180a5 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -399,6 +399,10 @@ msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
>   		gpu->funcs->ifpc_update(gpu);
>   }
>   
> +DEFINE_GUARD(ifpc_disable, struct msm_gpu *,
> +	     msm_gpu_disable_ifpc_get(_T),
> +	     msm_gpu_disable_ifpc_put(_T))
> +
>   /*
>    * The number of priority levels provided by drm gpu scheduler.  The
>    * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
> diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
> index 867dd476ed88..995857273aca 100644
> --- a/drivers/gpu/drm/msm/msm_perfcntr.c
> +++ b/drivers/gpu/drm/msm/msm_perfcntr.c
> @@ -259,7 +259,7 @@ sample_worker(struct kthread_work *work)
>   	}
>   
>   	/* Inhibit IFPC while accessing registers: */
> -	msm_gpu_disable_ifpc_get(gpu);
> +	guard(ifpc_disable)(gpu);
>   
>   	if (gpu->funcs->perfcntr_flush)
>   		gpu->funcs->perfcntr_flush(gpu);
> @@ -295,9 +295,6 @@ sample_worker(struct kthread_work *work)
>   		}
>   	}
>   
> -	/* Re-enable IFPC: */
> -	msm_gpu_disable_ifpc_put(gpu);
> -
>   	smp_store_release(&stream->fifo.head, head);
>   	wake_up_all(&stream->poll_wq);
>   }

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

