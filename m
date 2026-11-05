Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909940;
	b=dTM0psKyZlCKqIaoMROEU/Ez3tgXs20idwdVT3oZ8KmaLuzNJRGwNKseECQtXsM1TM4Z
	 DjJIe652qrCBAitXKUQoLUMy316749ftCRnv+TMD+E/wKA4VwnB42f3w9Bq+tv7tUDY6g
	 9W+d7X3utGouAJzAdCV4lU4Ysumsslr67cgNRVI287zBBZgS8Y5GB2dno5fzij03UITIj
	 Tj1eQePWyqw5AscBsthNIwmlolXw7yC6ba2Z+oiyAE4V9sMUZ3b9oVNUa1Qakbk2GNJJ+
	 JLuEUaMma892RE/xUhCsLUDpYJOSbX84Om/9rraefA6O/xN3VjKR1ZdHvTnUYapEFIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lxXTwSAlvx9lt6rkuQmRiJRYp7ZZFMogLLhtoRNClYA=;
	b=bejmOD2+tPMNiMkoBPwLfBOvhjeWf8dDSvZ7SQOf6OzmaUj2mYbnZizOFvsrY7FmPpmz
	 2IkYXIMd/SsmKFRLC2QqwfF0NiMIODMOxBmLPPLu356G3DuQBYvu19dRTTzOJYjD/OrnC
	 Wr2/IutmoE91ucOhwwqy0TI0xORXLRwz8KWEZwLFGoZPBmKNkcED310CwOP1c9Wjy3bxZ
	 WMo7PjzDZR3yTDp9QeZaL/5ygZYXqmLPvkFootyLek9XEX8HahP+WGnndzz6wf3k870us
	 R678KFg9uBt+A3/v5/lkvvwftLvxnLL0XsExh1FdX2fh8CYJU957Uxd2ShIwAYwVl6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzL9Mq9k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWVy7ss2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E849606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E849606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzL9Mq9k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWVy7ss2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeChe1474560
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxXTwSAlvx9lt6rkuQmRiJRYp7ZZFMogLLhtoRNClYA=; b=PzL9Mq9krBZg4xSS
	eu1nGVNKLj8C5vTi9rWUqken8D1xApgsIglnoN/FAbWGJLT2d9LQw25WMaGOkDtk
	d5Xe/tXxud64iI4K44vOSS1nATdsHWnWmv4B8lWWTtxvjFma5nYUUtKXpzB3WUEr
	Gck0EaikC3YBi13ciQ5qOM5SKyim3V3hpoEe1c8ZaNia4rOLQ6S4PICQjlrTAFg1
	4hFMhdeIw860knXw9BexW1U4WrwUfgihNoj0MuuD5uy7iGxKzOrzqidCwYhb8cZC
	rEUDP6Up29wVeNEhitRhZ4fM2aDCUkjsNDN5FDl5qeyYStzChTldOLfxdrie3Wyt
	1z4pDA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdbmmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:18:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso4382734eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793909938; x=1794514738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxXTwSAlvx9lt6rkuQmRiJRYp7ZZFMogLLhtoRNClYA=;
        b=BWVy7ss2OVqSXFBD9OlwmnAB2hKdlnBukI9E2P+kd1htE5jNwYcQABsQO1OFTwNJJL
         cWJQaa8jL/sjpoeadR6jyX4I3Uq99tiIPsl9rotD2sXoZvEjycw2IDn+nJROPNnaK/Si
         VaImlUUEZ7XalNuDqfC2XtZATo4oJ7nGPXjXCriipj/BqtJ6LpmNroZQTMoO2eXFzac8
         hone+BSU7fN87fYGLyx68M8BafHAKjc73YABHnfoehHXReRVGIN55V9yRns0d0yujpm1
         KWFTcHqFQq0Z8HjDrfckPmPqiV2GMUdvSj96BYSbqPefg6w+amm7w0eg6YU52+zHVo5B
         IwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909938; x=1794514738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxXTwSAlvx9lt6rkuQmRiJRYp7ZZFMogLLhtoRNClYA=;
        b=DwXBei71A0ecJFV6/ewwVDDoYaU1bclGbuyUHmbxSxwvCHxzJBlGhQyP78quev8ZD6
         kSG5XZnIZNbksgGijTd0x/k9EHtnhQEPYcZ9siVlfKFdovywtR+QvHjSY1lFGpmAAyg4
         gk8Yc0wEDiU0YdiWjLGpXjs5uDbYH/Y3aTeE6lKEdi675scynu46wj2F4qidLQzjIBDy
         YArTogI1QO+tgzP0MDp0itL8v8/CU7DShYazg5DUdRrbhCzQGNSASdpes97/WcMtahaQ
         s94EvZH2alkeJd1bJoJxwEnPINZIhpBFsV8bBBk8mR2993pDxWJRqE8VeNIaGcZsRqGf
         CxZg==
X-Forwarded-Encrypted: i=1; AKwUvBy5sVJhyCOVwJJr0VK342WkZGf9/3TYi7uoiiXqPbtApiWb9Ldwu9grGnQnInr3PO+7blA2DGNLQID/DWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kGxsqMj7Vrmj9zvGx0JKwAoRzLi9sDON6rY4QqQ+MVlIr+SEg
	kg+Q6QuBR7wN9g/LNaTdk6bAEx0FRJVc0VvzwOSIMrhciszjJ/t3oKXdlDMSvDT35jS7daLqYMt
	fHDLnoUZfR9GzlcjvyU+bH5ugihJt/5YSV9+4Fp2U6Q93JtfNRdURzoQ6Xcor3A4XyOc=
X-Gm-Gg: AYBFou04Su4Ba/OFihTSXeMuMytfCXX2pT/5UMje70PNgNKRHuhdveckZsMUchqxFt0
	KpXroMi/6BRkW9Lsh6sOt4x1eiM/up17tadPbbH7rwnJ211HPM2PgUBQIoYvKKH+viyAIT4o7cF
	99JWJqmRZtiYjsvSTIJ9HKVl8ZzNtJ47NuqajD9X8XF0diTF3lyqXmhbnmf6FgiGd9Eutb8eBJa
	qyeYLSnC2Pnh8UhwbexSojD7fFqnUc4GGWM6jzVRq03ZT5ecKWrHGnkXlJd+c8+O7caC/fpjxcV
	r2yZgGE4ZZe0EFmpdqP46HR9tX4Jn0rUtswt7yJCzundIPLZ57YaNRMUlhORbEtpKW6ZstKK8Zw
	E4x+zVO+6hFI3+UOQvYyv3KD3uJAHzb+h+enpdsTt41wHBW4irHamLCAryHs5zY93EYf8QWE=
X-Received: by 2002:a05:7300:f88f:b0:36e:8e6d:a0c0 with SMTP id 5a478bee46e88-36f76b14213mr327058eec.19.1793909937928;
        Thu, 05 Nov 2026 12:18:57 -0800 (PST)
X-Received: by 2002:a05:7300:f88f:b0:36e:8e6d:a0c0 with SMTP id 5a478bee46e88-36f76b14213mr327010eec.19.1793909937286;
        Thu, 05 Nov 2026 12:18:57 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f722eabb1sm614019eec.20.2026.11.05.12.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:18:56 -0800 (PST)
Message-ID: <4d591c0a-8488-4293-b2f2-fb77d87a5d5b@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 01:48:49 +0530
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
Subject: Re: [PATCH RFC] drm/msm/a6xx: Reset the GMU state when restoring from
 hibernation
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261103-b4-drm-msm-a6xx-rsc-restore-hibernation-v1-1-3250fd8eefb6@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261103-b4-drm-msm-a6xx-rsc-restore-hibernation-v1-1-3250fd8eefb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aece4b3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VSE_0_8NIXlJEWB0Zz0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: JSTFmPhGErKiM75APJkjCrJainGeS5Mp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX9xrZ7MO28V84
 OjRXjQyLwIc+J3LcGdG5LBfA5rwvQXD7Q8k9GVGJxsYSgTuyxyT4WbxBmUFmRYBicKT0KHFZKBG
 alH0I8fnqhj6Cml/gXGBmMkvIEK/n4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX7kCCJ/KcmdH/
 O6q6l6FNwCyfGu7l5Sm6ub1nAfoGr4jhKTO+R1ALE3mAuZZvaXzvUAjWgkgITfpBK6QZVmUs6pe
 J0hb5rzPVoAco2C/0T1snUTf592MuDuTjHZoKCR1kJdtgyL6Hw+yywOceg30zI8iuHshGiQF+7l
 DKHrWKYpaN10GQHtSHWoAztFD3NkgExzZDhUU3c1aErLf7uLWpxBwFDIib2h9SCdIDx1w8gKPOa
 GkmfyijJ1FOq3K4DweyLdV1wQSxe9rkqZvHrvVS4D6rsTC9QgEx9fr9e0xLz5H/H//AmZm5hBsW
 zDf+zK8+cXfZCad3rxXL7U/rVqR0a02siLl4UySmDI67tE/+A6Vxkt0HY50dFncMwSGhdkq7MCj
 xm7FxWEphgwseQ/xj28EuUbM/G2k0JwdD17nBaQChpdvhkeZQ+stPT0m2o9f+EDfQqZ0JNFV7Lf
 nRXNh9sLWDxSTO6jmog==
X-Proofpoint-ORIG-GUID: JSTFmPhGErKiM75APJkjCrJainGeS5Mp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050080



On 11/3/2026 4:15 PM, Abel Vesa wrote:
> The GMU puts the RSC to sleep when the GPU is suspended, and remembers
> that it has to request the RSC to wake up again on the next resume. A
> hibernation image is restored after a power cycle though, and the RSC
> then starts from scratch, in a state where it does not answer that
> request:
> 
>   adreno_gmu 3d6c000.gmu: [drm:a6xx_gmu_resume [msm]] *ERROR* Unable to power on the GPU RSC
>   adreno_gmu 3d6c000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 44070041: hangcheck detected gpu lockup rb 0!
> 
> The first job submitted after the resume hangs, and the compositor is
> left with nothing to show.
> 
> The GMU secure init has the same problem: it is done once, but the
> registers it has the secure world program are reset by the power cycle
> as well, so the restored kernel only gets them set up if the kernel
> that loaded the image happened to initialize the GPU.
> 
> Forget about both when restoring, so that the resume starts the GMU
> like after probe.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Sent as an RFC, as this only resets the GMU state the driver keeps
> track of. That is enough on the Glymur CRD (A8xx), where the AOP
> configures the RSC and PDC. On A6xx and A7xx, a6xx_gmu_rpmh_init()
> programs the RSCC sequence, and on older parts the PDC, only at probe,
> so after a restore they are only set up if the kernel that loaded the
> image probed the GPU.
> 
> The zap shader has a similar problem: it is loaded once per boot (the
> static "loaded" in a6xx_zap_shader_init()), while the secure world and
> the zap memory region start out empty after the power cycle.
> 
> Would a full GMU re-initialization on restore be preferred over
> resetting the status bits?
> 
> Tested on the Glymur CRD over 9 hibernation and restore cycles, with
> msm in the initramfs of the kernel that loads the image. The GPU renders
> after each restore, with no RSC, OOB or hangcheck errors.
> 
> Prepared with help from an LLM-based assistant.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 10 ++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  1 +
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 22 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  2 ++
>  5 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 662f09bec9d5..1e6e47b635f0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1319,6 +1319,16 @@ static int a6xx_gmu_gxpd_put(struct a6xx_gmu *gmu)
>  	return 0;
>  }
>  
> +/*
> + * After a power cycle the RSC does not expect a wakeup request and the GMU
> + * secure init is gone, so start the GMU like after probe.
> + */
> +void a6xx_gmu_power_cycled(struct a6xx_gpu *a6xx_gpu)
> +{

Need a check to skip this on gmu_wrapper.
> +	clear_bit(GMU_STATUS_PDC_SLEEP, &a6xx_gpu->gmu.status);
> +	clear_bit(GMU_STATUS_SECURE_INIT, &a6xx_gpu->gmu.status);
> +}
> +
>  int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 92e8c8abb86d..962b497868da 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2796,6 +2796,11 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	return gpu;
>  }
>  
> +static void a6xx_gpu_power_cycled(struct adreno_gpu *adreno_gpu)
> +{

This wrapper is unnecessary.

> +	a6xx_gmu_power_cycled(to_a6xx_gpu(adreno_gpu));
> +}
> +
>  const struct adreno_gpu_funcs a6xx_gpu_funcs = {
>  	.base = {
>  		.get_param = adreno_get_param,
> @@ -2831,6 +2836,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
>  	.bus_halt = a6xx_bus_clear_pending_transactions,
>  	.mmu_fault_handler = a6xx_fault_handler,
>  	.gx_is_on = a6xx_gmu_gx_is_on,
> +	.power_cycled = a6xx_gpu_power_cycled,
>  };
>  
>  const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
> @@ -2903,6 +2909,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
>  	.mmu_fault_handler = a6xx_fault_handler,
>  	.gx_is_on = a7xx_gmu_gx_is_on,
>  	.aqe_is_enabled = a6xx_aqe_is_enabled,
> +	.power_cycled = a6xx_gpu_power_cycled,
>  };
>  
>  const struct adreno_gpu_funcs a8xx_gpu_funcs = {
> @@ -2935,4 +2942,5 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
>  	.mmu_fault_handler = a8xx_fault_handler,
>  	.gx_is_on = a8xx_gmu_gx_is_on,
>  	.aqe_is_enabled = a6xx_aqe_is_enabled,
> +	.power_cycled = a6xx_gpu_power_cycled,
>  };
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 79912a33e17c..37266d64427c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -286,6 +286,7 @@ static inline void a6xx_cx_misc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 va
>  		((_ring)->id * sizeof(uint32_t)))
>  
>  int a6xx_gmu_resume(struct a6xx_gpu *gpu);
> +void a6xx_gmu_power_cycled(struct a6xx_gpu *gpu);
>  int a6xx_gmu_stop(struct a6xx_gpu *gpu);
>  
>  int a6xx_gmu_wait_for_idle(struct a6xx_gmu *gmu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 7108d4aa59b5..b91b32e61fab 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -402,8 +402,28 @@ static int adreno_system_resume(struct device *dev)
>  	return pm_runtime_force_resume(dev);
>  }
>  
> +static int adreno_system_restore(struct device *dev)
> +{
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
> +	struct adreno_gpu *adreno_gpu;
> +
> +	if (!gpu)
> +		return 0;
> +
> +	adreno_gpu = to_adreno_gpu(gpu);
> +	if (adreno_gpu->funcs->power_cycled)
> +		adreno_gpu->funcs->power_cycled(adreno_gpu);
> +

Can we please reset the zap loaded state here even though Glymur doesn't
require it at the moment?

Also, please ensure all registers are reloaded on the smmu driver side.
for eg: PRR configuration.

-Akhil.

> +	return adreno_system_resume(dev);
> +}
> +
>  static const struct dev_pm_ops adreno_pm_ops = {
> -	SYSTEM_SLEEP_PM_OPS(adreno_system_suspend, adreno_system_resume)
> +	.suspend = pm_sleep_ptr(adreno_system_suspend),
> +	.resume = pm_sleep_ptr(adreno_system_resume),
> +	.freeze = pm_sleep_ptr(adreno_system_suspend),
> +	.thaw = pm_sleep_ptr(adreno_system_resume),
> +	.poweroff = pm_sleep_ptr(adreno_system_suspend),
> +	.restore = pm_sleep_ptr(adreno_system_restore),
>  	RUNTIME_PM_OPS(adreno_runtime_suspend, adreno_runtime_resume, NULL)
>  };
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 4b2156825bdf..7ad8cbcfede4 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -81,6 +81,8 @@ struct adreno_gpu_funcs {
>  	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
>  	bool (*gx_is_on)(struct adreno_gpu *adreno_gpu);
>  	bool (*aqe_is_enabled)(struct adreno_gpu *adreno_gpu);
> +	/* Called on restore from hibernation, after the hardware lost its state */
> +	void (*power_cycled)(struct adreno_gpu *adreno_gpu);
>  };
>  
>  struct adreno_reglist {
> 
> ---
> base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
> change-id: 20261023-b4-drm-msm-a6xx-rsc-restore-hibernation-912730e2de2d
> 
> Best regards,
> --  
> 
> Abel

