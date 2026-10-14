Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4AA563295
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003441; cv=none; b=Ye9nimHRmtpdFX/SXm27AmsvPT1+kL/hvyQ8pAGNOT1vjlmUOtgx5T+i0LdCwamlM2k+/dp07daIynp4cOLy6wgm4xn13KqOaCBksCEsVHXdD4Jy/Mqbzj/ZWNnuJVmrSljJiV4XtKR3zzmVgvzbEH7nvtgXB6CQSomWyPKmjO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003441; c=relaxed/simple;
	bh=rhN7Xl4ybJ3ao2Kh2JnV93hRcaxyi4kvyKN7Qa8ymsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onIlJvpgWvNLlPhqfWE/z9kdgaxB5DIWKKskG9YhR4boJPxZ6pzAScicJyZOElMke8OQXOK4llAcq3q/2ppOvqNsJ30vNXY3N3OWTWJVhAN8Ik4Ur0jAguFse6IlVLl5hS5k71G/0My+zQDlpeXZUF74Yb+fy6UrarVFlHO8PjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGFyLVa0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5Ycg7Lq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGFyLVa0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5Ycg7Lq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EHRYjx842288
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EmwDMSDSCYwo1aTKvjCAdkeUPmARfw0p8QoK+uQ71J4=; b=FGFyLVa09le7+NYn
	2alEpnq6AVdRo+RypaWc0mNhCk1flZVe61wK9wxV5OzLf7Ai6c9/NhHZ/GvYegsW
	kApOxPMwEDrxuhcrxuWvRWQjkLH99Nix90ft6gtJujIPl4DQQwnt1VOWLqjFmgIb
	P4YB+sTmuPD+cJAXNR1FxrXmTS6LLVkKSjexZq7emY4TJWtNQz4aF2GytS0KmdTJ
	TYizFXensV8IOVq+pmLXoUU5k2syqnhM+1rrZQYFN8GkKXQ00gO2XMyOtpHWv4LC
	sAlZsSIN3zDYc7icJyGmBJNdlGTOpl6ax62IoEEeFqdMS1eyG8b6lmmaOzZTkINp
	1pWU5A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wraas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:43:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1905598eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792003438; x=1792608238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmwDMSDSCYwo1aTKvjCAdkeUPmARfw0p8QoK+uQ71J4=;
        b=J5Ycg7Lq+lttPOi2g6wz1L1/+11himW+aap3Af8z1IXJiB5QMq4urR6nDka3KSQ0pS
         vVEDAJf3Q9HYYN6rPrhmnWotoS69oAAR7C/+iFXeLrd16bwqyclDRugjnXF9Xy5FVhnT
         e0XhWPpUq0mlx568jV4H6EEE5k8j7fhNYn9x0HBc782RXDfLS6wQWd+PqhuM5tFxMCgw
         HxjivhC/A+r8yP4xpkSZAcdysQenmWHXgrNeB00SQ71RBsZG1KWLzYh6vbAjdTuUt2UB
         e3hQyZeMsFtTYEYrH48y9Xg2mizQibP8DgrtGPmpbCVlzw4vzDX/WdnVsoS+yUHbnt5Y
         TYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792003438; x=1792608238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmwDMSDSCYwo1aTKvjCAdkeUPmARfw0p8QoK+uQ71J4=;
        b=IQa29W9T6lZ3Vc/Hxe14L3HwI2s+oiPzQhM0poRZA4NaBR1amnWE7vX7PNuhEPtYa8
         +AxO2mL2eCKHbi/RePW6XFxlLlDDUrjGvyg6nXyuCDgi1b1kQkrZfBR+JnPPDfp4aG3C
         XIVOk1T/N9CM1VGvl05DOgtl3FAVqehdn1hxfOyl5lPkVlZKg7CFvaNL5aH8fNhrYKwl
         SDmS7/wExToEbFRF24SUoGkgn3sbqoQNq9Z3U2KLcIwgHlWfjlk60e7n4KSThvIuF2Qi
         dc3iZUIqffReQVP+zcbVHwNDXDvy4/iXOnfIdM1wH8QoBJq+pckD4R+D4iNTrhX/Z37e
         V0bQ==
X-Forwarded-Encrypted: i=1; AKwUvByA3UubdzXQwZoFQdBf6h2aWBioyYJ+Neu9zLjLbgPklfjzrCuwLxL3TW2gOFWOcUSW1YVKY4YWdf/NVxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3MTZ0ZOoxUgSEC62EwmaGOrqGPVNtQjDcqyCqytVsVhUFZIjI
	1L5+02+yj/2W37JW4YTzUkX3yTjrfCvIlYjUDDB347q9CZP9Oft1v8Zlmdey5sHaeDsP73gFLFs
	1sTrhxFCApcyVgsMB0ZobFFjPdQs/+Y9WiHh1+/o4O/ZDPfXAECDiIFTaG1YV9TFhLdU=
X-Gm-Gg: AYBFou249is8QjhoXNGJoOuhncwhcXPV9iatadGKWxjotR/oA4XnBGoHnPp4SP4+1wU
	/bCdW06qP4MeLKgWW8T+ju7ZNBZTPOdTncYW3qxgSRofiokJPnVEsAe4uKzSII8kCMNOjfD48Kk
	RQublu6kkoXg2MhsCZZGPJqXqzYZzJHodkXSd342F2UwA8FRgkR1yRJd9Jmoybw/pmvMNCHIgYx
	iN4BtbZdQzRvcKljVs1fiMzOWZ1p8fi4KL2h+bgJ5iabuP6fbGHb9zgBNqJyajVucTFXUBoKk3x
	T6ha/s2I+A5hW/CLnnKMR11xeZx4SWTPc09Oszz5XCgiCbKpcPxkbUzrxPQRZEKGuDQ482CxZRX
	A+BD6OwIJyZ2nHHJPr1R0T+y7
X-Received: by 2002:a05:7300:de48:b0:353:82b2:205f with SMTP id 5a478bee46e88-35382b220a7mr20525265eec.16.1792003437555;
        Wed, 14 Oct 2026 11:43:57 -0700 (PDT)
X-Received: by 2002:a05:7300:de48:b0:353:82b2:205f with SMTP id 5a478bee46e88-35382b220a7mr20525220eec.16.1792003436865;
        Wed, 14 Oct 2026 11:43:56 -0700 (PDT)
Received: from [192.168.1.2] ([223.230.7.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm57116786eec.26.2026.10.14.11.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 11:43:56 -0700 (PDT)
Message-ID: <a6332273-045b-4a72-a6c4-a0c6d584532d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 00:13:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] ASoC: rt5677: restore safe state after resume
 errors
To: Pengpeng Hou <hppiscas@163.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Charles Keepax
 <ckeepax@opensource.cirrus.com>,
        ajay.nandam@oss.qualcomm.com
References: <20261014032452.13456-1-hppiscas@163.com>
 <20261014032452.13456-10-hppiscas@163.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261014032452.13456-10-hppiscas@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NCBTYWx0ZWRfX0NG/xxifsM9b
 wJnBTtNlq6wMcwLgSFX8T9cZ11+4dYC4doKczvk/M+E8rjKTB38aNN9mAt/XwqivdsFmdw9GQoy
 0+NCyMf3AMjVK8Fggt4/YIG1RoHZEMw=
X-Proofpoint-ORIG-GUID: _NG9xYhZiy_uWPxH3sHsHWagSWmSTNDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NCBTYWx0ZWRfX/D5of9WLuHck
 qOOUtyxH1C83XLSu368s7AfLOcgY728YDK6+USE8d11deA/o8jFiKQfBHHRCPKgx+F3VXTLVwqr
 adRy/Gid8xfx4ULpzRpo0/32skxLS2kbkG+lcRjtmrs/s405hUIpCAYGuvaDUDmMbAbbCSV9MDX
 /Z9SiRPEMwgiTC8cDEMxtjMgqLzCjy1GQIlGBNWqV0PZoBYGKtTv423Snin2uJ2D7MVWEzvZ27V
 pfFYAZLOrO1gz/HMH7LcYAOShb2xdpVpFPOlY735fYsIMBIf8+9dkRFUMTuM8fdyRZ67EXAbMRk
 O55mI8gGqGJGJKd1zHMkLRWKQojlK+rq8Av89pPNxyQ4/JpiLczBD+g7LoxBvcXjMrnVr7ZWU1F
 SxgOQko6PkzxXkeyUAfhbrZxRE1QLl//yUbwtOBAgMeU4qJmNPrH/FRpT9kZm5KP1nG81jzcNYa
 GxPenm507xY/yhYVtzA==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6acfcd6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=yZS14lHB/DhrxgecvCV8gA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=6hps2vrPUYSZ6LOJPQgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _NG9xYhZiy_uWPxH3sHsHWagSWmSTNDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140074



On 10/14/2026 8:54 AM, Pengpeng Hou wrote:
> rt5677_resume() ignores regcache_sync() failure before continuing
> dependent resume operations. Restore cache-only mode, leave the cache
> dirty, and return the replay error before those operations.
> 
> First return physical regmap write errors from the normal-mode write
> wrapper, which currently discards them, so cache replay can observe bus
> failures. Restore reset and the optional LDO GPIO on replay failure.
> Remember that cache restoration is still pending independently of the
> requested DSP VAD mode: DAPM or controls can change that mode after
> failed resume. Suppress DSP work while restoration is pending and
> require replay on the next resume even if VAD has since been requested.
> After successful replay, preserve the existing MCLK settling delay
> before restarting requested DSP work. The already-running, retained VAD
> path and DSP-mode transport are unchanged.
> 
> ASoC still marks the component resumed when the callback reports failure.
> Track the suspend-owned IRQ disable so another suspend does not increment
> the disable depth again after a failed resume. A later successful resume
> releases that one disable reference. This does not add automatic retry or
> change the framework's best-effort card resume policy.
> 
> The issue was found by our static-analysis tool and manually reviewed.
> 
> Fixes: 0e826e867264 ("ASoC: add RT5677 CODEC driver")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
> Changes since v1:
> - restore cache-only mode and dirty state on replay failure
> - keep suspend-owned IRQ disables balanced across failed resume cycles
> - propagate the normal-mode transport write result to cache replay
> - preserve pending cache restoration across changes to the VAD request
> - keep DSP work paused until replay succeeds, retaining the MCLK delay
> - send as one correctly threaded series, as Mark requested
> 
> Previous series:
> https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/
> 
>   sound/soc/codecs/rt5677.c |   37 ++++++++++++++++++++++++++++++++-----
>   sound/soc/codecs/rt5677.h |    2 ++
>   2 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
> index 7b80922236e5818e846d9ecc6e23793e6ae40714..fd1f840d6794ea95b47d803ba4977fdb81e184a9 100644
> --- a/sound/soc/codecs/rt5677.c
> +++ b/sound/soc/codecs/rt5677.c
> @@ -885,6 +885,9 @@ static void rt5677_dsp_work(struct work_struct *work)
>   	bool enable = rt5677->dsp_vad_en;
>   	int i, val;
>   
> +	/* DAPM may request VAD even after component resume has failed. */
> +	if (READ_ONCE(rt5677->cache_restore_pending))
> +		return;
>   
>   	dev_info(rt5677->component->dev, "DSP VAD: enable=%d, activity=%d\n",
>   			enable, activity);
> @@ -4939,10 +4942,14 @@ static int rt5677_suspend(struct snd_soc_component *component)
>   
>   	if (rt5677->irq) {
>   		cancel_delayed_work_sync(&rt5677->resume_irq_check);
> -		disable_irq(rt5677->irq);
> +		if (!rt5677->suspend_irq_disabled) {
> +			disable_irq(rt5677->irq);
> +			rt5677->suspend_irq_disabled = true;
> +		}

Similar to the nau8825 case, should this new suspend_irq_disabled 
tracking be based on whether the IRQ was successfully requested?

rt5677_init_irq() still sets rt5677->irq = i2c->irq even when
devm_request_threaded_irq() fails, and probe continues after only 
logging that error.

Thanks
Ajay Kumar Nandam

>   	}
>   
>   	if (!rt5677->dsp_vad_en) {
> +		WRITE_ONCE(rt5677->cache_restore_pending, true);
>   		regcache_cache_only(rt5677->regmap, true);
>   		regcache_mark_dirty(rt5677->regmap);
>   
> @@ -4956,8 +4963,11 @@ static int rt5677_suspend(struct snd_soc_component *component)
>   static int rt5677_resume(struct snd_soc_component *component)
>   {
>   	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
> +	bool restore_cache = !rt5677->dsp_vad_en ||
> +			     READ_ONCE(rt5677->cache_restore_pending);
> +	int ret;
>   
> -	if (!rt5677->dsp_vad_en) {
> +	if (restore_cache) {
>   		rt5677->pll_src = 0;
>   		rt5677->pll_in = 0;
>   		rt5677->pll_out = 0;
> @@ -4967,11 +4977,28 @@ static int rt5677_resume(struct snd_soc_component *component)
>   			msleep(10);
>   
>   		regcache_cache_only(rt5677->regmap, false);
> -		regcache_sync(rt5677->regmap);
> +		ret = regcache_sync(rt5677->regmap);
> +		if (ret) {
> +			WRITE_ONCE(rt5677->cache_restore_pending, true);
> +			regcache_cache_only(rt5677->regmap, true);
> +			regcache_mark_dirty(rt5677->regmap);
> +			gpiod_set_value_cansleep(rt5677->reset_pin, 1);
> +			gpiod_set_value_cansleep(rt5677->pow_ldo2, 0);
> +			return ret;
> +		}
> +		WRITE_ONCE(rt5677->cache_restore_pending, false);
> +		if (rt5677->dsp_vad_en) {
> +			/* Allow MCLK to settle, as when leaving bias OFF. */
> +			schedule_delayed_work(&rt5677->dsp_work,
> +					     msecs_to_jiffies(1000));
> +		}
>   	}
>   
>   	if (rt5677->irq) {
> -		enable_irq(rt5677->irq);
> +		if (rt5677->suspend_irq_disabled) {
> +			rt5677->suspend_irq_disabled = false;
> +			enable_irq(rt5677->irq);
> +		}
>   		schedule_delayed_work(&rt5677->resume_irq_check, 0);
>   	}
>   
> @@ -5021,7 +5048,7 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
>   			rt5677_dsp_mode_i2c_write(rt5677, reg, val);
>   		}
>   	} else {
> -		regmap_write(rt5677->regmap_physical, reg, val);
> +		return regmap_write(rt5677->regmap_physical, reg, val);
>   	}
>   
>   	return 0;
> diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
> index 876f7674015c2c0a5421feb25a8c80313b18310a..e6e915453f2efbe78c9d2dd3e909397d9ad715ca 100644
> --- a/sound/soc/codecs/rt5677.h
> +++ b/sound/soc/codecs/rt5677.h
> @@ -1788,6 +1788,7 @@ struct rt5677_priv {
>   #endif
>   	bool dsp_vad_en_request; /* DSP VAD enable/disable request */
>   	bool dsp_vad_en; /* dsp_work parameter */
> +	bool cache_restore_pending;
>   	bool is_dsp_mode;
>   	bool is_vref_slow;
>   	struct delayed_work dsp_work;
> @@ -1798,6 +1799,7 @@ struct rt5677_priv {
>   	unsigned int irq_en;
>   	struct delayed_work resume_irq_check;
>   	int irq;
> +	bool suspend_irq_disabled;
>   
>   	int (*set_dsp_vad)(struct snd_soc_component *component, bool on);
>   };
> 
> base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6
> 
> 

