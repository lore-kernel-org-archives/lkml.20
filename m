Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321768;
	b=raK3O+T597MKsMe/2MgXQcSPmqs6RvPLVFeDCOyWGEahgcNpmPNfurO+aXfTJYtTShEj
	 MCzQsywWEAcZPQW++DNyd4DTz7kdm8rFVRTEIfIfTirq26Fg+7901uiEa/YmSTTRz29Z1
	 oxjbTsAcMG4LUhuGyLklO5Z0ZIPVf4JFfMprXDlTGkOcAAUvSSl0pVhFEkRLlqgm1YYU/
	 yMH6QUscD2HhEJenymgQekaSSE+CT0sXCq0SSmu2tX4zZwLCmMJQQjHScYf7Wg/5AUryt
	 pVuXITKk5mEW2tH10cXcjySUzuC9U4ODdbg5QW89NBapW1qRDPhGd1X7nGGXq8J9+wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iU+EzkbKMFrOZFFUWDUX+jv1j+DUirQeUzUM2Odhqp0=;
	b=K1f5NIV/YtLv+oBG52D7GrXhHVEFSzmegR9Um//gjS+G23GJTZjRh/WdFuhm7GM1xlNI
	 Sa65YqBBZNEMzFFNs7JTr1pthg8x4R9dKAQ89+zPGVUVlCXvbzzNjmcAo2G+Hqtyq686m
	 0MlXqbIDoOnQsTv1q3n5FE5hPA9bqjHfIFTImUV8n7AGGcVsA09L/CDLHCrorubXXW2hP
	 TMlOSx88ByQiDONCo+8aBCmnNSX0ruNS8e/pirFjFQRk48INBkKvghRAIBfaCW5SwUUvI
	 mGOAJlaoKSGWifAITaC4hcl2Vdv9TuzPLTS94ESeV8a2t4j3iKDxgPf6HHll0ETCGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zpSlcvgK;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4274660A260C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4274660A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zpSlcvgK
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4322d310e7so314454166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794321767; x=1794926567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iU+EzkbKMFrOZFFUWDUX+jv1j+DUirQeUzUM2Odhqp0=;
        b=zpSlcvgKQl4GAF+LAEWwXo102Dk6lRikWqRJTDbMVSdWsHj7c3FRe/SdIx4D6DmgCj
         +TeNDxHm/XD7kdkMGcaXqBUFnkHMTqxgb9NhSUWUm7n1o/xzOd3YbjcZlRGl1Ly+rrf9
         Ip8WihiP4WCqVbJBKydkH0HRz1sRDBFGoQ8HJafvhSQrODlgYoCpcZcg0U2HLEX1IRF3
         4TaDSGjDgXx/pU4U9x5GiQxlFjtGhUHXnDwhjtMPqnXHwRsp4vMms1LgHbg0+/67vCjZ
         /doYZIydqNjewM46rQvM56F8F/poFKOb5HpYtovpd5bT3je56+Rn4ScuTIg2GqUDPHrn
         zTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321767; x=1794926567;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iU+EzkbKMFrOZFFUWDUX+jv1j+DUirQeUzUM2Odhqp0=;
        b=v98mBFBiteu8BL/VKkzr14dZVddE73AL8BcSfl27apB1PErI45oPCLNZIQegj5XatH
         KpO6Xhf0jVZLGvSSjUS91++PChtX0ZzjdREuK3WuinTwLdO9ZcBafHvm+hv/kIiXdUXj
         Y+aVmP2nYEX5MKqjoDg7UzPNISA/r5XKPsJN3JTFHqJS4x5y/iXWyrU7ES7kuF93tvub
         20PP45Zvj/obI7kqxa+6GiOeVHNi3SIrPzCabXrqTgnXoo8Lis3LLumkEQw1wkHaLHTh
         5a89Y5d798zyYT56JqtOWglOvIFMxourznnuMgspaWMELakq+es6vvdD8it+YUWR/xbz
         jepA==
X-Forwarded-Encrypted: i=1; AL+hErGSGNnzT10w0T+Rjb9EimP4mDwZzNFONyN4qAfjVjnHwV3yX6D6ESPxxlV3GMAfDZNrlawOz/7MU5NWYpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SJhnabBA8B+VM73tW+KfzTNod6aCa3PYzhZXdPKnFD73r79zd
	r4OFv0Bi5pntzJ5TfRHlNOw7NLw32LnPtNM9CPoax31qP/vpqGXY6qprehrhDD5p7Jc=
X-Gm-Gg: AYBFou2jNxVy0RxI/bP3B81OWedxebahsFDNRhqMsAnSIqqE2TE1acsKg0SACzGBRjh
	9fwVPdPn8gzG0ZaexUg76gryOBRCqv1swXZPAGiRWFzDlqPwzTAJ/39kZClM+7FZzG/DCSnrAhh
	ynJyPARl3zK3+d0NnzMiPVVO3eSReMyDrrGcZ9ZvpFZmjOjhTGE1YFGo1z5Fp2wN3o0lKGI+p6g
	J5aIOOO2Xx8jYw5nXtGV3ZRP0ydfeEpFHSAcyzO69ROhcoaiA7I+5ROlFIX4HsUHY2AtSp7Xsbd
	zv4mpdrLvc4s+sfE3EuV+LZjrrEaG3B76P6i7eCNxFbrcQU1zo6maOBQxOEe6x1+bu80Y+IKAsk
	1kZUCjT2I1KUQDfrx0bYuNE9uTHj5A/iB1akuNzWcmGZGZjNyHBs+Pk9H24p/H1z8TMw2s/UdqF
	GXeFX5NRtR+s/4HLXGyy/I8PYDscSa/+fYxvDrxCYjzYMnlVvkOw6mHW72x8W4r8F4YCRfbfzYE
	FaI77sUrAm96LwqnGnEuXSI1LBhXnx2BqiDrT8mKSL/OoVNM0JgUdLW7aOEfuJWERM54GUMJFKX
	NJmkXQLzctWR3i8pQOgPjWUmsxWR98QK8ZNijjaQ3Pg=
X-Received: by 2002:a17:907:e849:b0:c49:9383:a28 with SMTP id a640c23a62f3a-c50495ef6d1mr244854866b.35.1794321766382;
        Tue, 10 Nov 2026 06:42:46 -0800 (PST)
Received: from [192.168.0.167] ([109.78.220.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a65f267sm112205666b.71.2026.11.10.06.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:42:45 -0800 (PST)
Message-ID: <ee2aedde-6688-4cfd-9f92-3703b081247d@linaro.org>
Date: Tue, 10 Nov 2026 14:42:44 +0000
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
Subject: Re: [PATCH v2 3/5] media: iris: Fix use-after-free on unbind with
 open sessions
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
 stable@vger.kernel.org
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
 <20261110-iris-handle-unbind-v2-3-86d5f6f1dea8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261110-iris-handle-unbind-v2-3-86d5f6f1dea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2026 14:09, Vishnu Reddy wrote:
> The driver can be unbound through sysfs while a client has a video
> session open. The core is devm allocated and freed when remove()
> returns, so the open sessions then use freed memory.
> 
> Only the core structure needs to outlive remove(), because it is the
> only thing the file operations of an open session still use. Allocate
> it with kzalloc and tie it to the reference count of its v4l2_device,
> which every registered video device holds. It is freed when the last
> file descriptor is closed. The other devm resources (register mapping,
> response packet, clocks, power domains, interconnects) are only used by
> the power on/off sequence, the clock and bandwidth votes and the
> interrupt handler. All of them are released with the unbind, after the
> core is shut down.
> 
> To make sure nothing uses them afterwards, set a removing flag at the
> start of iris_remove(). It makes core init, new sessions, command
> writes and the clock and interconnect votes fail with -ENODEV, so a
> client still holding a file descriptor cannot power the hardware on or
> vote for resources that are gone. A client waiting for the firmware
> only times out and returns an error without touching them. Runtime PM
> is also disabled explicitly in iris_remove() instead of with devm,
> because its callbacks use the core.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260926064921.976721F000FF@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c      | 10 +++++-
>   drivers/media/platform/qcom/iris/iris_core.h      |  2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 15 +++++++-
>   drivers/media/platform/qcom/iris/iris_power.c     | 13 +++++++
>   drivers/media/platform/qcom/iris/iris_probe.c     | 44 ++++++++++++++++++-----
>   drivers/media/platform/qcom/iris/iris_vidc.c      |  3 ++
>   6 files changed, 76 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index d558475986ff0..bdac6b8c98e44 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -43,7 +43,10 @@ static int iris_wait_for_system_response(struct iris_core *core)
>   	ret = wait_for_completion_timeout(&core->core_init_done,
>   					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>   	if (!ret) {
> -		core->state = IRIS_CORE_ERROR;
> +		mutex_lock(&core->lock);
> +		if (!core->removing)
> +			core->state = IRIS_CORE_ERROR;
> +		mutex_unlock(&core->lock);
>   		return -ETIMEDOUT;
>   	}
>   
> @@ -56,6 +59,11 @@ int iris_core_init(struct iris_core *core)
>   	int ret;
>   
>   	mutex_lock(&core->lock);
> +	if (core->removing) {
> +		ret = -ENODEV;
> +		goto exit;
> +	}
> +
>   	if (core->state == IRIS_CORE_INIT) {
>   		ret = 0;
>   		goto exit;
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 3e4cf652bf39a..379f0666a42cb 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -62,6 +62,7 @@ struct qcom_ubwc_cfg_data;
>    * @iris_firmware_desc: a pointer to the firmware-specific descriptive data
>    * @ubwc_cfg: UBWC configuration for the platform
>    * @state: current state of core
> + * @removing: set when driver removal starts, blocks core init and resource votes
>    * @iface_q_table_daddr: device address for interface queue table memory
>    * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
>    * @iface_q_table_vaddr: virtual address for interface queue table memory
> @@ -108,6 +109,7 @@ struct iris_core {
>   	const struct iris_firmware_desc		*iris_firmware_desc;
>   	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>   	enum iris_core_state			state;
> +	bool					removing;
>   	dma_addr_t				iface_q_table_daddr;
>   	dma_addr_t				sfr_daddr;
>   	void					*iface_q_table_vaddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index 545bbe75e1740..e0cfa5107d1d9 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -128,13 +128,26 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_s
>   
>   int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
>   {
> -	int ret;
> +	int ret = 0;
> +
> +	mutex_lock(&core->lock);
> +	if (core->removing)
> +		ret = -ENODEV;
> +	mutex_unlock(&core->lock);
> +	if (ret)
> +		return ret;
>   
>   	ret = pm_runtime_resume_and_get(core->dev);
>   	if (ret < 0)
>   		return ret;
>   
>   	mutex_lock(&core->lock);
> +	if (core->removing) {
> +		mutex_unlock(&core->lock);
> +		ret = -ENODEV;
> +		goto exit;
> +	}
> +

This locking scheme is looks racy, what's the point of this granularity ?

---
bod
