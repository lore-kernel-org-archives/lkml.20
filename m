Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=31.31.198.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541819;
	b=4gP6PEXjEFPAgBItDTzS/5oD2BTMOxDhwyUB62jwNWd1vhXduv2ShH10Lr/5ZgvGk72Y
	 ofAXdFcl3fsdkw14lC1PZFJvpAhVo/HRE/Xdh8GSRoiyICBA1ZrlmPiemcxfNVHzrYbX2
	 FXjPcVaeWxfSCi1fm72tAFy3FvwQocQn9w+l2dJMbqpPq8ORb34/yuk9d5uJgR65Nr1uK
	 ROHDBUAp3MowuZWftImwiY2llaVMZ28ER/+1Ux+2h4z5RGE19R6IMOSzM0N4Sg7uF9Rzk
	 UIFg3a1YifKi/wCWsArCPw9lUC9YJq9MHv8tye4LW274bPjQ1LwoYEXDgm+dvne5dCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541819;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lMdQIiIkk0TkrTOjfGcf0XDpdmUjXKfpMYJ8odQqD50=;
	b=PzX+ULkwp9ROv83AdsXSKA5Qcakj2tKD6Z5/mdJXP4GL0iKJg8xYFUvFVpD64drcg9OG
	 JQkk0YahYLVivCNSIPpGJIiuVJJcxh1KpUznxFvEuxsNKuDQZvJqMkmP9qHptSJ+EJwOb
	 VL998DizgD/fJwdC4FJm4jb3+mEd/oRmFDibnQudwOxsqOWaDBZoB1Y3fD3IKzIJz5Ik/
	 8qlJ0Bqh+gIhM0qNSCmp96qUjU56UDIUU2Ibm3W7+UO/t6xP0sW/ytRPHSIJGKUNz7Gno
	 S7SDEtfuoBLpi29E13rEFY7pK/ZLkIGMU16lqI8a1kgNo3MHQr7Fa1/S36QTP3hZOcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=minlexx.ru;
	spf=none smtp.mailfrom=minlexx.ru;
	dkim=pass header.d=minlexx.ru header.i=@minlexx.ru header.a=rsa-sha256 header.s=dkim header.b=GZ9afh1O;
	arc=none smtp.remote-ip=31.31.198.150
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92019606A324;
	Sun,  1 Nov 2026 14:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92019606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=minlexx.ru header.i=@minlexx.ru header.a=rsa-sha256 header.s=dkim header.b=GZ9afh1O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lMdQIiIkk0TkrTOjfGcf0XDpdmUjXKfpMYJ8odQqD50=; b=GZ9afh1OjLVWhw1FYnm9AB5BRA
	4dSd9SXZrzpPXbz7WKxuww0fe0FzoOnRbJcn4DtLT1cl/u9viXRy3SUaIDEQ6/9EKmKVkuf2KVAXN
	6ocaRPTdvjCDHKOTTqEbWNIsJoqs9gmaMxaUzkwoCRsNZomV+SZIpV3+y+0peQOd9nVU=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xNW9b-0000000BG97-0Quz;
	Sun, 01 Nov 2026 17:03:23 +0300
Message-ID: <995af7df-35dd-4169-911d-e9aed81f18d3@minlexx.ru>
Date: Sun, 1 Nov 2026 17:03:22 +0300
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
Subject: Re: [PATCH] drm/msm/a5xx: Write CP_RB_WPTR under the ring's
 preempt_lock
To: fabricioakio@gmail.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261031-a5xx-wptr-lock-v1-1-fa7d7b9a7fbe@gmail.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <20261031-a5xx-wptr-lock-v1-1-fa7d7b9a7fbe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.11.2026 05:30, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> CP_RB_WPTR tells the CP how far the ring has been filled. Two functions
> write it: a5xx_flush(), after a submit is added to the ring, and
> update_wptr(), which a5xx_preempt_trigger() calls from the IRQ handler
> each time a submit completes, whenever there is more than one ring,
> even when no ring switch follows. Both read the ring's wptr holding
> ring->preempt_lock, but write the register after releasing it, so the
> two writes can land in the wrong order:
> 
>    CPU A, IRQ:   update_wptr() reads wptr N
>    CPU B, flush: a5xx_flush() reads wptr N+1, writes N+1
>    CPU A, IRQ:   update_wptr() writes N
> 
> CP_RB_WPTR then points behind the last submit. If the CP has already
> read past N, it treats the ring as nearly full and executes the
> commands left over from its previous pass through the ring. This shows
> up as CP opcode errors, and the old submits write old fences, so the
> fence in memptrs goes backwards. Recovery then finds no submit to
> blame and does not reset the GPU, which stays hung until reboot.
> 
> Write the register before releasing the lock in both places, so the
> last value written is always the newest, as a6xx_flush() does.
> 
> Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on A508 (SDM630), with piglit's texelfetch tests run in
> parallel: CP opcode errors in each of seven one-minute runs, the
> seventh ending in a hang that never recovers; with this, none in 25.
> 
> The downstream driver writes the register holding the ring's
> preempt_lock in both of its places:
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/adreno_ringbuffer.c#L104
> https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/drivers/gpu/msm/adreno_a5xx_preempt.c#L25
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 10 +++++++---
>   drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  3 +--
>   2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 16c7335c4b1f..63b313328979 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -53,14 +53,18 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   	/* Make sure to wrap wptr if we need to */
>   	wptr = get_wptr(ring);
>   
> -	spin_unlock_irqrestore(&ring->preempt_lock, flags);
> -
>   	/* Make sure everything is posted before making a decision */
>   	mb();
>   
> -	/* Update HW if this is the current ring and we are not in preempt */
> +	/*
> +	 * Update HW if this is the current ring and we are not in preempt.
> +	 * Under the lock, so that update_wptr() cannot write an older wptr
> +	 * after this one.
> +	 */
>   	if (a5xx_gpu->cur_ring == ring && !a5xx_in_preempt(a5xx_gpu))
>   		gpu_write(gpu, REG_A5XX_CP_RB_WPTR, wptr);
> +
> +	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>   }
>   
>   static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> index e4924b5e1c48..0deac58bc22e 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> @@ -47,9 +47,8 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>   
>   	spin_lock_irqsave(&ring->preempt_lock, flags);
>   	wptr = get_wptr(ring);
> -	spin_unlock_irqrestore(&ring->preempt_lock, flags);
> -
>   	gpu_write(gpu, REG_A5XX_CP_RB_WPTR, wptr);
> +	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>   }
>   
>   /* Return the highest priority ringbuffer with something in it */
> 
> ---
> base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
> change-id: 20261031-a5xx-wptr-lock-55b151332fcf
> 
> Best regards,
> --
> Fabricio Akio <fabricioakio@gmail.com>

I've been using this patch for a few days on various sdm630/636/660
devices with a508/509/512 and so far haven't seen any GPU hangs.

It's hard to prove definitively that hangs are gone, due to the
random nature of the hang, but at least it didn't make anything
worse.

Tested-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

--
Regards,
Alexey Minnekhanov
