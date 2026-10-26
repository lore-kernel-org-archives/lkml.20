Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055883;
	b=hI7xVFHqmoeLw9SEjNI9rPZc6/d8lsu2yQW01IKiYdMj28ug5xeXxrqTMrcLo09LxJXz
	 y36Ba03JFNBtDq5xO22Lv/ubDX829jv2SmuSweomDFrvPF1XVNN2sOXLFjAcmss7vMV6G
	 AITa1qMml7cYyFpX/ACb/dDRyT4t67mNmbrON6V02VTbxh+Oig8soa10IWBYr8vSS7vsK
	 sEo/FwYkafu7MAKaF9LaG9Uo2Wy/WQoZXzBFccJ0+TQ1SYBeAYkJq3RRfgKAW2zZ0FF4n
	 xm0eWGBJKAsjGN82NK0S5MvcE/i7XrQVmgjPoqsy1HLYgyokL8r+FjiM3Zd9W7Ctfkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055883;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dJNs1RsXHtfK4OCSrdWE9j8SAinVe+8U27y3tQbfrSo=;
	b=i5+EArZE4qASz3AswkMrqtYLWSrgEzNJedutgfvnFs8N5l8o24XlKL4G/YK+Sa8Fjj2K
	 UBVdVRKkCPwknrm1SRTXTZCQ6F9C/TgqwpyxSjq41bK2U9aZTBJGDqbRYUaZMHpUFaUK4
	 LCiqO4JjHKlMeqO5tT9zmO/VlOpvetnjZCZQSaTHIhh6fWVdc3XvkdVw4vPouLxUetOvD
	 jfNaNMFpdNx9zY1wgtg+a0T6voQvkjGQ4+96cQ/8+RPuV+tMe1Fw68sPtv8LGcM1LVkN4
	 i4/ICbUfRekTPRVKwXOvLCrq0VzKPdPCJ9tWvBQ+SLNITF6IkMLovDFKlu4/Z3a3ZZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=j2wqjV78;
	arc=none smtp.remote-ip=91.218.175.98
Received: from mta0.migadu.com (out-98.mta0.migadu.com [91.218.175.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAFC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAFC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=j2wqjV78
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VpHtdEItOfBeyzi/S7o4HPEf4C+PK1AXEFD68qJcQMU=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793055880; v=1; x=1793660680;
 b=j2wqjV788SXMn3EMI1d9VoRkEPsswMQKmBNfnmU/GJMrMXFgLZ/ZWwwm6uaASqpulhEZJIaq
 W5SKHmfjg2vlkFg2HEeyKAvHbzz9ycD4QhnAPKOc9mA9wFioC3jqDCsVExYnUZKxCuLMN5mszAA
 wQNCjQEM0Hs7Jgn7F72vxCrImcdCx7ZbimtALvIe39UNqObL/fh5NI9pf1QfzumNitt+B6y779Q
 Mfyt8NIOPVdBgBVMjD0gCx60TibYS00Pji2p9pXiBNU/+46/v1dJd0PfMHt1VnNMPr10dh0qPKb
 nbcXtvgPLiME4i/fm+J5db9nOBhdRhOyebosEtFfAPIRQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca2d3fc45a918743;
	Mon, 26 Oct 2026 23:04:40 +0000
X-Mizu-Trace-ID: ca2d3fc45a918743
X-Migadu-Flow: FLOW_OUT
Message-ID: <498e2fa8-b707-4a06-9fe7-9e62253786c5@packett.cool>
Date: Mon, 26 Oct 2026 20:04:34 -0300
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
Subject: Re: [PATCH v2 1/6] drm/msm/dpu: reset unassigned resource slots to
 NULL on topology update
To: Xi Zhang <xz.ca.cn@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261026-msm-dpu-res-clean-v2-0-3d864435186e@gmail.com>
 <20261026-msm-dpu-res-clean-v2-1-3d864435186e@gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261026-msm-dpu-res-clean-v2-1-3d864435186e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/26 5:25 PM, Xi Zhang wrote:
> While this is not currently the case, it may be possible that topology
> for cwb and dsc resource requirements change between mode set in the
> future.
>
> e.g. when dsc support is added to DisplayPort, dsc may be optionally
> enabled and disabled between different modes due to
> bandwidth requirements.
>
> Set unassigned resource slots to NULL on topology update to avoid
> issues in the future. It's good practice to do so anyway.
>
> Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0a6be69a3e83..8d2b4d2726f2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1205,9 +1205,13 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   						       ARRAY_SIZE(hw_pp));
>   	}
>   
> -	for (i = 0; i < num_cwb; i++) {
> -		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> -		cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
> +	for (i = 0; i < ARRAY_SIZE(dpu_enc->hw_cwb); i++) {
> +		if (i < num_cwb) {
> +			dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> +			cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
> +		} else {
> +			dpu_enc->hw_cwb[i] = NULL;
> +		}
> [..]

I've mentioned in a reply to v1 that this was indeed affected by the DSC 
changes in radxa's WIP, but missed the more relevant one:

This is already handled by the "drm/msm: fix SMMU fault dumps" series:

https://lore.kernel.org/all/20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com/

Namely patches 5-8 ("drm/msm/dpu: clear the ... blocks ...")

Thanks,
~val

