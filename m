Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712412;
	b=KuUlerFLr0MWCrsewwtnJ/sErGMooER23uzoyMVFB17xRE6+XZ57rLzt9cFvSy1RgMiJ
	 NaoSio/5XC7wgOPfJ0oLxn7JMUmyCLXvhOt3WED9QQdvp8wDPYBB9mX1Sx0Gq/Zg9TbIm
	 URoH1ODPM5u1YMQTUjC960FnbSuux3PMhC0aiW2PLHQdxqAyQSkcAgemUPel61FRgDdex
	 pX+PNH2v5Xwm/wdbVGeoaCFjPQ1k/BuLOb7lYMJ/W+CWhLl+IP8Zpbl7I9ncJPkanIbAs
	 qCk8YtX4H+zLkJF++Q/AO95drl9q9b8i/qtVQ9584KZpexvMHivzwTpsxZfJVVQPImw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L77FF2aWzZ913b54dk9ZT61wHg8HgCGCsNMqmepmddI=;
	b=lOdgPx2hNYyjlUEs0Tq9gsrWSW9+/+MPm/CWZ7zGLjeEhgR1ZdHUyodsVp0MrPw7V4ta
	 u6kpCdcOd+mFBT5kLYWsT+29P72S0oYzYbk1d4rZywixgy6zqQogzA8vmgaabQqMND9WU
	 h/2y34IAUgYqdp0I+AfwLF8AoS5BCkMhQoHbWBpURq6auPkmhL40kzeMZwbAASnMxJJcJ
	 +N7z55DHrBV2w4X1eyzun7B+1Xo0NUa1WYAN8PzhufGyN9ROZBOCH7RyDPMfZ8lv1a+m0
	 YPjqv8R1uLW6WpLK7HzMuZ0ktqvVgSh3lh1tklL5OH/S6pYbtEcpDUB6kKro5Z8p3kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OFk5a2jO;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14B26083600
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F14B26083600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OFk5a2jO
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7131215e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712410; x=1794317210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L77FF2aWzZ913b54dk9ZT61wHg8HgCGCsNMqmepmddI=;
        b=OFk5a2jO6Tb/GcuhfBDvw57lSgIzl3jVRnNzStUTk9vkR7yBYtARVBT1hUIpAPBpf3
         Iq3sRkIXTdV/5qkmHVelr4LX+6I+gE1ZQxVNwh352AU/GNLyF85bIwr5EsJlG8PDPM7y
         SRr+kCgtQOldiboTfy+vzmsJ4aUSSlTo6qbQvSLTm50V5nVLqiZXnkepXx58mQYKIkt9
         9U2V+Fri7ayow7Gd324IxNQO2/tzJnSkp7b0BQlXzKjWb+8CDdgFFVr3B1UKr2bVpn2O
         WnD5pq2CElvEVW+dU+qmO6vdz8NxExncsG6MH5hnRzd+iWqB0QIf97pvzLL3DPASeQX9
         yT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712410; x=1794317210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L77FF2aWzZ913b54dk9ZT61wHg8HgCGCsNMqmepmddI=;
        b=ft7NBToPpX5LLjOWmwYzxXaXb3k3sMA91ngiEWUGmQsFCnE6G7FUu92lgaZ6LibMLt
         muAFcIZO4B/IUNBElyASEwcrZReyunV/TfzAvqouJl8NX5TFSZkaJ25f/KIex/ZJMkYm
         VK0STJCm/8H2jARJvQVwUUIhLvAmJ/Gf0LGV07q2c/XZaOpBhREf9AOodEsm4qx7Hfbx
         z2HMIDzu8TIscGc0MTUvkBJ2/SHb5etqPicsvXSDAdlvZM5B8HTS7yZcmSx//GZmNNjt
         ifuq9rdzMG1egnaRDZhIXZzFjU69/MJ3VROsML7FckboLKQKG254d3jy7PAbDfyIaaal
         Rj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwiu4/DXZ5MLuqL5tW6HY6yYpoAC/RXoCgXJgtMgBI0uZYVbymLhQ8LFaR73ohbbxDQjCGVXOPdYOZ1gvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D9iItOOivW30U6EAtGtTYoVX3ukzXrWbE1p7tEJRUWwMRN0KQ
	JMfLquwiU6k2iDmdIPfnqK83CsyvgJG+lvwXE8Gi+7c8MCmZyDO4vBI=
X-Gm-Gg: AYBFou2kyvFBaKaG5/i9bsmV0ANXu/iF12o5eyusF/XNXQFFY/5hq1ObFhcSlVuzyca
	FKp48WPKhaGFUE1iUUi89OAI2E9pFtC+wyHm3V7lf/cj21WMlnawCRS9UyqU1UAqPjNRaDpKEcK
	tg1ub27gSLlPzwAcHdOTRxmLxp8wZCp3R3bjas+Pvt4uZRuCkgTr9CAO5CsbVM1YhIL0eh7Y0sL
	0CQ2IT9Dflh4h2ykGW25XErQcEdlTSyMs0Sxlg8kDhQm3mcO14g7CV8xPEIPOoOKKM6XzyC/Glp
	Gu2v9THHigsv3KHesMh7+xfAs7YP7E89cTcPF1/G1O3Q672aWDjjihckMtEwpLDRtP1M0CMxpqG
	vQerWeiLmV34eYiAEpLSEICklgA4XD0Ygb9kDIjm5fxLv+t34CoD5OL+1uFNyN8jwh3bzYk5MW5
	i4FBSTmvIBCraapjXYxkTdRaU+kvUg0mdvKiRcfJRJhwuV1HVeUFlqh9VwqwerahooSvQTf+tW6
	rylBgDaVqZWm735nebQFiIteVMPohuB1Blc8GWF4VrkvwIYH3oggv6oGI7u0jO1Zmcw8sTLj4Bw
	c/GDTFklAIToiwOsj5Gv2WVL+7jCrICZDTXACeadqRVlDhigk4vr/kbH5vV2TyfrRrIZa1LQcbc
	arf/WYuKi
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr305983945e9.6.1793712410096;
        Tue, 03 Nov 2026 05:26:50 -0800 (PST)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm54532585e9.5.2026.11.03.05.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:26:49 -0800 (PST)
Message-ID: <364b570f-e433-4e9f-8d69-d87f057a7b9d@gmail.com>
Date: Tue, 3 Nov 2026 14:26:47 +0100
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
Subject: Re: [PATCH v2 1/4] drm/msm: Rework IFPC disable
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
 <20261102190010.720443-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <20261102190010.720443-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 8:00 PM, Rob Clark wrote:
> Previously this was coupled to SYSPROF level, which made sense at the
> time.  But there are other places that we need to inhibit IFPC.  So
> decouple it from the sysprof refcount.
>
> Now it has it's own refcount, so multiple threads can vote to inhibit
> IFPC safely.  The renamed gpu->ifpc_update() simply applies the new
> state by setting or clearing an OOB request.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 32 +++++++++++++++------------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  3 ++-
>   drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  6 +----
>   drivers/gpu/drm/msm/msm_gpu.c         |  1 +
>   drivers/gpu/drm/msm/msm_gpu.h         | 26 ++++++++++++++++++----
>   drivers/gpu/drm/msm/msm_perfcntr.c    |  6 ++---
>   drivers/gpu/drm/msm/msm_submitqueue.c | 10 +++++----
>   8 files changed, 56 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 662f09bec9d5..bba5468db42e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -2128,29 +2128,33 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
>   	return irq;
>   }
>   
> -void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
> +void a6xx_gmu_ifpc_update_locked(struct msm_gpu *gpu)
>   {
> -	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu) || force_on;
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>   	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	bool force_on = refcount_read(&gpu->ifpc_disable) > 1;
>   
> -	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
> -	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
> -		return;
> -
> -	mutex_lock(&gmu->lock);
> +	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>   
> -	/*
> -	 * 'Perfcounter select' register values are lost during IFPC collapse. To avoid that,
> -	 * use the currently unused perfcounter oob vote to block IFPC when sysprof is active
> -	 */
> -	if (sysprof && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
> +	if (force_on && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
>   		a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
> -	else if (!sysprof && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
> +	else if (!force_on && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
>   		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
> +}
>   
> -	mutex_unlock(&gmu->lock);
> +void a6xx_gmu_ifpc_update(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +
> +	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
> +	if (pm_runtime_get_if_active(&gpu->pdev->dev) <= 0)
> +		return;
> +
> +	scoped_guard (mutex, &gmu->lock)
> +		a6xx_gmu_ifpc_update_locked(gpu);
>   
>   	pm_runtime_put(&gpu->pdev->dev);
>   }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 09d76cdf059f..bf71129e33a9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1565,11 +1565,7 @@ static int hw_init(struct msm_gpu *gpu)
>   		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
>   	}
>   
> -	if (!ret && msm_gpu_sysprof_no_ifpc(gpu)) {
> -		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
> -		if (!ret)
> -			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
> -	}
> +	a6xx_gmu_ifpc_update_locked(gpu);
>   
>   	return ret;
>   }
> @@ -2851,7 +2847,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
>   		.create_private_vm = a6xx_create_private_vm,
>   		.get_rptr = a6xx_get_rptr,
>   		.progress = a6xx_progress,
> -		.sysprof_setup = a6xx_gmu_sysprof_setup,
> +		.ifpc_update = a6xx_gmu_ifpc_update,
>   		.perfcntr_configure = a6xx_perfcntr_configure,
>   	},
>   	.init = a6xx_gpu_init,
> @@ -2922,7 +2918,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
>   		.create_private_vm = a6xx_create_private_vm,
>   		.get_rptr = a6xx_get_rptr,
>   		.progress = a6xx_progress,
> -		.sysprof_setup = a6xx_gmu_sysprof_setup,
> +		.ifpc_update = a6xx_gmu_ifpc_update,
>   		.perfcntr_configure = a6xx_perfcntr_configure,
>   	},
>   	.init = a6xx_gpu_init,
> @@ -2953,7 +2949,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
>   		.create_private_vm = a6xx_create_private_vm,
>   		.get_rptr = a6xx_get_rptr,
>   		.progress = a8xx_progress,
> -		.sysprof_setup = a6xx_gmu_sysprof_setup,
> +		.ifpc_update = a6xx_gmu_ifpc_update,
>   		.perfcntr_configure = a6xx_perfcntr_configure,
>   		.perfcntr_flush = a8xx_perfcntr_flush,
>   	},
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 81d21acccea1..cb0ac27dacba 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -298,7 +298,8 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>   int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>   int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>   void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
> -void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
> +void a6xx_gmu_ifpc_update_locked(struct msm_gpu *gpu);
> +void a6xx_gmu_ifpc_update(struct msm_gpu *gpu);
>   
>   void a6xx_preempt_init(struct msm_gpu *gpu);
>   void a6xx_preempt_hw_init(struct msm_gpu *gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index e7d04c865968..ecf15a8f68de 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -846,11 +846,7 @@ static int hw_init(struct msm_gpu *gpu)
>   	 */
>   	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>   
> -	if (!ret && msm_gpu_sysprof_no_perfcntr_zap(gpu)) {
> -		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
> -		if (!ret)
> -			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
> -	}
> +	a6xx_gmu_ifpc_update_locked(gpu);
>   
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index fb07803f5aba..37f9e93daa43 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -1012,6 +1012,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   	gpu->nr_rings = nr_rings;
>   
>   	refcount_set(&gpu->sysprof_active, 1);
> +	refcount_set(&gpu->ifpc_disable, 1);
>   
>   	mutex_init(&gpu->perfcntr_lock);
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index d27d54bdb7a7..0334a0f604ac 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -93,7 +93,7 @@ struct msm_gpu_funcs {
>   	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
>   	 */
>   	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
> -	void (*sysprof_setup)(struct msm_gpu *gpu, bool force_on);
> +	void (*ifpc_update)(struct msm_gpu *gpu);
>   
>   	/* Configure perfcntr SELect regs: */
>   	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> @@ -186,6 +186,14 @@ struct msm_gpu {
>   	 */
>   	refcount_t sysprof_active;
>   
> +	/**
> +	 * ifpc_disable:
> +	 *
> +	 * Count of votes to disable IFPC (1-based, values above 1 mean IFPC
> +	 * is disabled).
> +	 */
> +	refcount_t ifpc_disable;
> +
>   	/**
>   	 * lock:
>   	 *
> @@ -375,10 +383,20 @@ msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
>   		(gpu->perfcntrs && READ_ONCE(gpu->perfcntrs->stream));
>   }
>   
> -static inline bool
> -msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
> +static inline void
> +msm_gpu_disable_ifpc_get(struct msm_gpu *gpu)
> +{
> +	refcount_inc(&gpu->ifpc_disable);
> +	if (gpu->funcs->ifpc_update)
> +		gpu->funcs->ifpc_update(gpu);
> +}
> +
> +static inline void
> +msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
>   {
> -	return refcount_read(&gpu->sysprof_active) > 1;
> +	refcount_dec(&gpu->ifpc_disable);
> +	if (gpu->funcs->ifpc_update)
> +		gpu->funcs->ifpc_update(gpu);
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
> index ce65b1160955..867dd476ed88 100644
> --- a/drivers/gpu/drm/msm/msm_perfcntr.c
> +++ b/drivers/gpu/drm/msm/msm_perfcntr.c
> @@ -259,8 +259,7 @@ sample_worker(struct kthread_work *work)
>   	}
>   
>   	/* Inhibit IFPC while accessing registers: */
> -	if (gpu->funcs->sysprof_setup)
> -		gpu->funcs->sysprof_setup(gpu, true);
> +	msm_gpu_disable_ifpc_get(gpu);
>   
>   	if (gpu->funcs->perfcntr_flush)
>   		gpu->funcs->perfcntr_flush(gpu);
> @@ -297,8 +296,7 @@ sample_worker(struct kthread_work *work)
>   	}
>   
>   	/* Re-enable IFPC: */
> -	if (gpu->funcs->sysprof_setup)
> -		gpu->funcs->sysprof_setup(gpu, false);
> +	msm_gpu_disable_ifpc_put(gpu);
>   
>   	smp_store_release(&stream->fifo.head, head);
>   	wake_up_all(&stream->poll_wq);
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index d307cdd17d90..8434a09319bc 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -24,7 +24,10 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
>   		pm_runtime_get_sync(&gpu->pdev->dev);
>   		fallthrough;
>   	case 1:
> +		/* Disable zapping perfcntrs on context switch: */
>   		refcount_inc(&gpu->sysprof_active);
> +		/* Disable IFPC: */
> +		msm_gpu_disable_ifpc_get(gpu);
>   		fallthrough;
>   	case 0:
>   		break;
> @@ -36,16 +39,15 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
>   		pm_runtime_put_autosuspend(&gpu->pdev->dev);
>   		fallthrough;
>   	case 1:
> +		/* Drop our vote for inhibiting IFPC: */
> +		msm_gpu_disable_ifpc_put(gpu);
> +		/* Drop our vote for disabling perfcntr zapping: */
>   		refcount_dec(&gpu->sysprof_active);
>   		fallthrough;
>   	case 0:
>   		break;
>   	}
>   
> -	/* Some gpu families require additional setup for sysprof */
> -	if (gpu->funcs->sysprof_setup)
> -		gpu->funcs->sysprof_setup(gpu, false);
> -
>   	ctx->sysprof = sysprof;
>   
>   	return 0;

Thanks this will help with my hangcheck series.

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

