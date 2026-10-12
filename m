Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC374D7D3D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830333; cv=none; b=AU5IWNheM4dfkzCL7b1C1C4JSwMF0Sm3z3QIFx6CC8yQlUpHm1CVVSNPqp8EnQA2lKw91VbIi52Vd4YuNgr2tuZTKNLyoLL8avbMg2VFUVKCGtNgXi0vW50hNvYWqYsK3K0MW49pnTEdO8T8ygvqWsBV9T9l7fpBloJazbIOn8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830333; c=relaxed/simple;
	bh=LTPnzO4a0gSf8u3gAhmWKv052eh1Qnd6JhIEqHAl4Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+KSCT1Q3zPBMKx4wo+ox9Jl0fBytiWaLcWJDgj3ok/HtHtfy0YA5xmwaCt5mg/AksnGurmQF1zOOMXjgza6fwzXMnx7YXauj+FQBLDlBp3+ICTED2XTiZJjaXjHTN1FpbP2qh4EFy99bnp8oATUp4V+uLQOXZnjGlbcfoO7FCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtVMSz83; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EzXgsktx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtVMSz83";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EzXgsktx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHuiDQ2022731
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bgRYUW+Bei3Q21MTzmcxk2sT/AX/LHG8dFab1oytdc4=; b=KtVMSz83dFKaiUsR
	UAw/ofTyd9VTRnwAh3AExIWWC99HSrL0W2itiMZCy/ULzSNm8RgUihnUuZ2bKpLl
	9dQQHK9x4i1qB+SCXEYvMU1t+EMsM0bXAfC2dqLCK4Hubl5YAHKuWz7XZrZwESzd
	KdE7FMTNBCO52IPsP+3JslbEDDqktXq6Laxf1mW8YZCr2mEft12uORHZl3I2ZP5T
	IzVZpNJKDxMf1+aLWaMbULYXQpLZsfhfCZokQdkiQFZW5G4quuqZgDW7STL0fDjE
	u5pgVoeaWHhg03jaV59H69YviEzgEs7AvppX+fFTO85ux8pZDgKSJ/eyInjj1qPJ
	6M7XQQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aerh8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:38:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14fed306427so8993917c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791830328; x=1792435128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgRYUW+Bei3Q21MTzmcxk2sT/AX/LHG8dFab1oytdc4=;
        b=EzXgsktxhIM4APLkzo7QiO+fTck230/CAt5b0cC6lwZSPYjWKzwKlMVHwlL06FZufM
         o0sqJ5b+OXf9MuK5XumsNA/eeEcIJE6qgMdFF3RxBriHf3nphvMnYMGl0mJGqbGu2Pi3
         CkOJvV4gQrRuTFpnDKjJZ5FXDn1Xl/ON0gC5d1IWdTJAYwuB1ob6rFKsZFOtUSfJVG3V
         ByhP91x/3JKpGz34YyWjB33eIFBEg4OFyFGWwIC386rnhppkYBhaLG+A0tM0DQo51/hF
         4RYEJo+IhH+c68Fet5AYMA1jfGYptdT+j1vvji2ZRyKbSb9lV1cAreAReCbv4Gu9o2Ep
         iA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830328; x=1792435128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bgRYUW+Bei3Q21MTzmcxk2sT/AX/LHG8dFab1oytdc4=;
        b=1JatydDc7YIItiEMv047ls010Cz2y3HszCLkqXxJ3vuQ1rPU8R+5/QclfcJHQ8NALh
         HG8BvCNHJbz9ETSETzonTfjv084DhBhXwI8GwrdtADIpIBnFGhWwDH90hHOHsQ25NL8Z
         W9+DYnuYHX1ynxgPKQ2+EOT3qVZzoJnbMq7vZmLgI24wfYhJ7HLZ2DdbWc7FDlJ6GPfi
         JxGL+lTnm5X2T5vu0fkwynd2vYn0NP/TXYbFas4ahCWBPvWIlmMQpOzD1l2Zt9KQ8r+2
         ew7gUx7eCh3Fj+DQXF3qrXb3i1wNlMXPACeIGBJLw0Qu2rVwrfFyW3ofkaLp3iWvpBKt
         /T8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0xXlanUswapD8+gGY8KmYvMXuBXAZf5rJYONCPVVIT8S2tv/QuEHDRV3vSta/gcxb0PBjv0aNxi38oBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTh+91WljpBhvfOt1LaXpeDgVpCqEGEJeTOi00qk/+gkp0Jkbs
	45Baag3xisAoqyLbJMyMsu7wSGiRN2C6UNawTwY/Ea5a1AYbdNc0Hc5+NIYFP8kwzJErUH4OB2b
	UPlwPMI6MziuXTAhaqBRcY7vuvqLKyMnSe6p7nLbkOsueqrxgty8UUOLEsUJrwFe0D/0=
X-Gm-Gg: AYBFou2rAhOLYj3a48UaWt/qpurz8iZSdQjhytvCQgiAIfPwK8RbvgrTLdRnJItfAoy
	7k5286ad07A8llDLEYnE88WWVygUPuPvooUPLoJjMQpphM8wKXv5Iv/kD6X9zTVx4gk4kW9XM7a
	h06Jn65AkaLnSYtIztcKtoqXYygYaA0sDtQcF6HLOCKTx8TqdOcHgp0aDKXYkNnNOJhtv8I2uf4
	BcauhgUIiS1450VccL3ybCdW6ZzsPE5O15x7WqIJ1+o+qyMIBWYcCwKnG5q0ck1gGhsFzGsxzP5
	HuarCYZ2CvSNPbB4+ULpD55KoLxsguaVLYrjf3r6bdSV5s1k0m6Nm4jvEPucbTR9Bn1nkLfTeSK
	5rpxeTi3wjq7vIKg21zRQNcya2FQbyw==
X-Received: by 2002:a05:701b:450a:10b0:151:bbe4:b6ab with SMTP id a92af1059eb24-16a5ed3d9bcmr13695556c88.17.1791830328062;
        Mon, 12 Oct 2026 11:38:48 -0700 (PDT)
X-Received: by 2002:a05:701b:450a:10b0:151:bbe4:b6ab with SMTP id a92af1059eb24-16a5ed3d9bcmr13695537c88.17.1791830327520;
        Mon, 12 Oct 2026 11:38:47 -0700 (PDT)
Received: from [192.168.29.225] ([49.37.144.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3581f594a41sm26956693eec.23.2026.10.12.11.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:38:46 -0700 (PDT)
Message-ID: <a91f5f24-7371-4d65-8409-e9fa9a4eb2cb@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 00:08:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <20261008-lm_fixes_final-v4-3-fa986071c3c1@oss.qualcomm.com>
 <2mut637ssnnyf7spywezdkx5fpoc4virkr3zuqzj3klwd3ijfr@xk46zya3hgak>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <2mut637ssnnyf7spywezdkx5fpoc4virkr3zuqzj3klwd3ijfr@xk46zya3hgak>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iOXvvIWuPWvs1RB6o39z-yu1pa6JcUkP
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acd2939 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=20alU+YIu2uqf8Hyrg49Cw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=k6m01o0hih_xGdVfLsEA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3NCBTYWx0ZWRfX5oHQs10TpDTD
 HlHugUGhQr3o8dk3oeNf4V0UBKWlNSuJmVVrmMSrfusFeLer0gO9oMEI5oyT211NFLtowLS7+om
 E0mhDxVqtCZ9oN2mluJiIpNlCFdbBMc=
X-Proofpoint-ORIG-GUID: iOXvvIWuPWvs1RB6o39z-yu1pa6JcUkP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3NCBTYWx0ZWRfX9lfrK8WcfR55
 XUIRwlq1ZyVeRJmgmYys6KkORw50/51tHs15aUGwvEmSKuFaL35jg3nQg7lKz6Q8drsTjH39Ia/
 7MaYs5MCxrjR8AJd1NEoph7ofdQUzTZRTEfDFNYBzscbnCtuHmwyf41P6KcF+0VOr9CzCj320bh
 kxz3ZK5jG/tVzcnmfpTqzdf9bTOoAgy42gyAOkSm8evr+QYIRveFGaCDnWvkkAv3Gva4ytifwuN
 qr7M5nYIHlxpg78Q0wvdDzvd63vCG86QYRwn3SDQCseitj240LzXYGWK4rbo/+AMvlvA8au2YFd
 d0NW98kwl6ulHgCuKyUnyfyjhwCuZfcvDNm+eFU8XYjy/pQucZWrFa6MJhalekvKV8+p2U0JaSN
 zpK6kJewEQNuTos/YU3ivjLSQCUW8Or+ii9Z0VFlp8DWkiBDnHMnUaYXgMaAsQZf8XORmgAI+bU
 Q7jeIKObRnaxd5Fwl6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120074


On 10/12/2026 5:44 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 08, 2026 at 10:53:49PM +0530, Mahadevan P wrote:
>> From: Jessica Zhang <jesszhan0024@gmail.com>
>>
>> LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
>> encoders). As such, don't use ephemeral max_mixer_width and
>> MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
>> buffer widths.
>>
>> While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
>> there is some additional logic that needs to be added to the resource
>> manager to specifically try and reserve PINGPONG_0 for modes that are
>> greater than 5k.
>>
>> The layer-mixer count for a merge-capable, non-DSC mode is chosen by
>> dpu_crtc_num_lm_for_mode(); feed the PINGPONG/DSC derived width to it as
>> the split threshold in place of the removed MAX_HDISPLAY_SPLIT, so the
>> pixel-rate floor added earlier keeps high-refresh modes that now fit
>> within a single PINGPONG buffer split across two mixers.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
>> [DB: reworked to drop catalog changes, updated commit message]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> [MP: rebased on msm-next; fed PINGPONG/DSC width into
>>   dpu_crtc_num_lm_for_mode() instead of open-coding the width test]
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 54 +++++++++++++++++++++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  7 ++++
>>   2 files changed, 51 insertions(+), 10 deletions(-)
>>
>> @@ -765,13 +781,14 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>>   	struct drm_display_mode *adj_mode = &state->adjusted_mode;
>>   	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
>>   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>> +	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
>>   	int i;
>>   
>>   	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
>>   	 * before even checking the width after the split
>>   	 */
>>   	if (!dpu_kms->catalog->caps->has_3d_merge &&
>> -	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>> +	    adj_mode->hdisplay > max_pingpong_width)
>>   		return -E2BIG;
> I guess Sashiko is correct here, we need to check DSC width.
Agreed, the PINGPONG bounds check alone does not enforce the DSC encoder 
width. The next revision validates the width per selected DSC encoder 
before resource reservation.
>
>>   
>>   	for (i = 0; i < cstate->num_mixers; i++) {
>> @@ -783,7 +800,7 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>>   
>>   		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
>>   
>> -		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
>> +		if (drm_rect_width(r) > max_pingpong_width)
>>   			return -E2BIG;
>>   	}
>>   
>> @@ -1374,17 +1391,17 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
>>   }
>>   
>>   #define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
>> -#define MAX_HDISPLAY_SPLIT 1080
>>   
>>   static u32 dpu_crtc_num_lm_for_mode(struct dpu_kms *dpu_kms,
>> -				    const struct drm_display_mode *mode)
>> +				    const struct drm_display_mode *mode,
>> +				    u32 max_hdisplay_split)
>>   {
>>   	u64 mode_clk;
>>   
>>   	if (!dpu_kms->catalog->caps->has_3d_merge)
>>   		return 1;
>>   
>> -	if (mode->hdisplay > MAX_HDISPLAY_SPLIT)
>> +	if (mode->hdisplay > max_hdisplay_split)
>>   		return 2;
>>   
>>   	mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
>> @@ -1403,6 +1420,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>>   	struct msm_display_topology topology = {0};
>>   	struct drm_encoder *drm_enc;
>> +	u32 max_hdisplay_split;
>>   
>>   	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
>>   		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>> @@ -1410,6 +1428,19 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   
>>   	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
>>   
>> +	max_hdisplay_split = msm_display_get_max_pingpong_width(dpu_kms);
>> +
>> +	if (topology.num_dsc > 0) {
>> +		u32 max_dsc_encoder_width;
>> +
>> +		if (dpu_kms->catalog->mdss_ver->core_major_ver < 6)
>> +			max_dsc_encoder_width = DPU_1_x_MAX_DSC_ENCODER_WIDTH;
>> +		else
>> +			max_dsc_encoder_width = DPU_8_x_MAX_DSC_ENCODER_WIDTH;
>> +
>> +		max_hdisplay_split = min(max_hdisplay_split, max_dsc_encoder_width);
> Should this be min() rather than max()?
The code already uses min() here, as the width must fit both the 
PINGPONG and DSC encoder limits. If the variable name is unclear, I can 
rename it to "single_lm_width".
>
>> +	}
>> +
>>   	/*
>>   	 * Datapath topology selection
>>   	 *
Thanks,
Mahadevan
