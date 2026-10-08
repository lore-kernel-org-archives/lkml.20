Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A43B6379
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439821; cv=none; b=pj7+rnXmsR98LnOepwN2lGRL5Zq+s9bujCHpsH19j+M0z9xoyCPRI74aRCnbRPgDMFzj9eqcAdCCOU9UH5atrM3n2n3eAV3nzRk71bifxQxAICtrBJUHGdVoGWkXjNb1xQ4M3zhjPvgLXRcsDQWyz5thJUQzrhRJ+vZSYISThIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439821; c=relaxed/simple;
	bh=wNxN2LCMggRd7CtA2517GaI9Bsm/oZeFDoCQ3qU/flk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7yhKNdiLbehPafZixrdW1hg9Pnw2Li4hSKO9oLm6bkUUJFgzLSLUCXc/hFcaPEEjCYhb/96QizGeojz7txtxP1PBlViwm9DZDD1AV4WoFRfGorRayL+nZULEZviJsvY/zo3dDmc6oDwZ8CRvbbkWzXxUprv6V1UHkOkz5YLyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFki8Ecj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kge/4DMx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFki8Ecj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kge/4DMx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BhB2928691
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7NbTCcDpDJabqAVoHlppEnBCQ8nO+uP1Rh4RdDIQfw=; b=SFki8EcjVh/hhnd+
	hw8bOPLPve/wMYu5Pt5d6YEqlWe8W48EV/ZQWOJGOfUH63ayf31w0+k/L21HI5jV
	M31wBYEWWj6jiNTuSS0cpXKCdo+6GFOBdLVvYBrxj8DxBrkKmV0Yuh/rpHueK/KM
	XCb/EFmOeEJbyxhEI72XHSdVdQ0bX7qwMYS4im4xGPbg+914JQvurSasgtIOHy2G
	zB3SnqRE4uYkhDEN0X79Hf4W3ONUHN4uevChk1ESE8hw4V7rUW59G/AoWJHpLPEb
	g7E/PUwCx4WmznWl4vOV/kHqAdWcZ3uNIC78n7Tf3hbCBsI+ctRv9DA+iaSOf4Ia
	yXWrZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sd32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:10:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so965042185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439817; x=1792044617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7NbTCcDpDJabqAVoHlppEnBCQ8nO+uP1Rh4RdDIQfw=;
        b=kge/4DMx0Rjp9MYw8VZzdYuCNyFI+7kE/yOxEtLCRULZqfbdhOHpXnAFIYMaj+rM6P
         FNRk5b4aEfuGNNRDdbF0BuoLJAFehiGg/6oCdsMsuuU7I2GZpELU6Ee4oUQBPbDc3B+/
         cx9urhG6Fg1GjjBcSg+O1Xw8P/Qhq+o5amEN5Et1dBop4to7f3X/pUZqF4BVB8rp1R5W
         i9lp2RZM5PqslvMMt+UJx2dEyIYkQL6YHnWOaKICX5ge/F1+jW0O5NCnxRKRT5Jr8Qm3
         0DedbRemFeDvp1w6ut6WFa/YA9BBvh8hqYZbU/ErkPZ454nS0hJ5zjuvzaSJ8liaL9QG
         +gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439817; x=1792044617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7NbTCcDpDJabqAVoHlppEnBCQ8nO+uP1Rh4RdDIQfw=;
        b=XWjCiIS98UxObkYBb2CuhK+EMGuaFwVwRM9Ck3728Vx01XWi01RSIhgGmkixI0RRkU
         TX2zeiG01aMhBTyIxRwgfrMETur90Of8VJge+VDfWk2UowNVYQ67rJBXoB8Rvk4NYZ4W
         PUixAi8uNOlwaob060h+omlQdJKzVa0TPydl+INDa+hG+Mm/UE6vB+X01rE+sOtAsJHs
         LBxzfGvjUYRdxYGp7d/cK1HUlaDDQxETaIfm//Iq9lcOgXNkaROuoFlYxulQvYKzTFpO
         EUAdiJtF1gvPtXxAXmFmwqIfH2dGpZYlzxE7N987MMSRROGL6iREVR+iZS8xU7UDz/Cj
         Phtg==
X-Forwarded-Encrypted: i=1; AKwUvBzkZ9/d779RglArmCxmuGeAh3uBKCat8ar+aj/tB0M3onSpBopLMG+VuW+svIwjdWl/xrLm420OE+aPJe4=@vger.kernel.org
X-Gm-Message-State: AFuF++lUKwuaUwrHJJwkCxirGvIaMaJ+cpYTGRz/Hp+W4aj6fduZGHfp
	t+D+VTzFJ+gm/G6IVtKizMjLlxhVgmtGCxb6wL4+L02vgXNf0hG1/AMVXAB3cvro+58gSLqbq6b
	dI/MAKN3wC3fUKVGs7ui8uSOLx8tdKiF10YDzLWnKMbyMuJcZlmyomLKO52o6ps7GHA8=
X-Gm-Gg: AYBFou1BAdU0/kW92Dyu9OIh1272YoshPi20/luwgfYRLawxM1//s2/RELhb+XBtHg0
	F4McatjV5VEokemO4a99obTo8x/YFSXBNAAVzCRV2kOQ2G1+LVawOOd+5QNQzVorcbEmApkQa/2
	R4Ytcgow7mh269YU86zeYVjsuubbuOohluiIH6Oj4USVQafrd0Pjzr0KEPgqEtqajNvddogyYA+
	erfnBwZG2dGhjGTvH0DIpPVp1Y+lVsAzRAaeQDbBJsMJAcU0Zd4M4ne2LNHkrNJ7/B7Uw+E2KYi
	5pDgNV+LbVj3wu0FiNDUPTyCFFwJi/yU/By8M/b0YEnqqu8cahkQusuRzVIB2hI75iBn31pkfmu
	fMcfidCKcfAeYADtKKYIj0LYyIVqaUWU0+73Kw1E=
X-Received: by 2002:a05:620a:4555:b0:93e:6c77:6fc7 with SMTP id af79cd13be357-93e9b7add20mr856254085a.42.1791439817490;
        Wed, 07 Oct 2026 23:10:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4555:b0:93e:6c77:6fc7 with SMTP id af79cd13be357-93e9b7add20mr856249685a.42.1791439816988;
        Wed, 07 Oct 2026 23:10:16 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7256434bsm9196324f8f.15.2026.10.07.23.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:10:16 -0700 (PDT)
Message-ID: <035ae11f-0c69-415f-af9a-c7c903df3f14@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:10:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/74] media: qcom: camss: vfe: Add support for updating
 multiple write-masters within an output group
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-31-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-31-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX5pjtTDDtzggR
 +mLwfR7Q91YV7kkIJdGkkqYleyXQEORwmCQzOuRF5CMFkYluTTM1mipc9oSxIWv1JbXN65Zf89y
 tyKr9BNI3hu/vbPI4UjF6EwguD2mNDo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX8/Y8oj0hFIy7
 Vo+u9NdeVVL+ZmSs69jnr2LXuWS8gOli2RuDFXFAKX5IblbQMZlVCY6qGn2/rbWc3RvqXHFrl0Z
 w91w32P0FI9ekg44btdOzQbK+oBTkvepim0eIvb0dVDQfEBcReZfQz3luMLcn9NpDUGGMkxeocY
 CrRct9owSqZ9O9XROrW9QVdzcDBN/kg65CeWkqF4zb4q9CBnbAu6yXzjkqUCE/9SxDRXXyW7UMt
 411TNqf7p5Tw6tp4aobu6EfW0fY+48VZWzTAxOQqWUvpSAMdXeH7DOvXtertlboPEszgnwfKbpU
 p/HaWT7s0PWi5lRpBRFDT2DZV2QbXhghE0VM6EeIMK5n7nb2NIe2wDg3UBtq/YuaSJGlfXnmuab
 NE6cLI3Vi7ZUiwVqJe/yaDCybP8NE+ZG/MTOgHFc8+A0VULVlXepCEHqyy8Xghs4UEasVFlQv6B
 M0Q6Nu6iYandbKfrsPQ==
X-Proofpoint-ORIG-GUID: zdkTQqywZ9jVVR94Ek8u0JlunDeF53kk
X-Proofpoint-GUID: zdkTQqywZ9jVVR94Ek8u0JlunDeF53kk
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac733ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=7O-2GFc335GU3a1fVM4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024

I think that all the changes for new API should come in one patch not sure why are you spiting them,
they will create room of bisect errors.

~Gjorgji

On 10/5/2026 8:14 PM, Bryan O'Donoghue wrote:
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index c078af53b0758..20d8b3e1e4459 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -673,8 +673,11 @@ static int vfe_enable_one_output(struct vfe_line *line, struct vfe_output *outpu
>  		if (!output->buf[i])
>  			break;
>  		output->gen2.active_num++;
> -		ops->vfe_wm_update(vfe, output->wm[0].bus_client,
> -				   output->buf[i]->addr[0], line);
> +		if (ops->vfe_output_update)
> +			ops->vfe_output_update(vfe, output, output->buf[i]);
> +		else
> +			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
> +					   output->buf[i]->addr[0], line);
>  		ops->reg_update(vfe, line->id);
>  	}
>  
> @@ -741,8 +744,11 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
>  	if (output->state == VFE_OUTPUT_ON &&
>  	    output->gen2.active_num < 2) {
>  		output->buf[output->gen2.active_num++] = buf;
> -		ops->vfe_wm_update(vfe, output->wm[0].bus_client,
> -				   buf->addr[0], line);
> +		if (ops->vfe_output_update)
> +			ops->vfe_output_update(vfe, output, buf);
> +		else
> +			ops->vfe_wm_update(vfe, output->wm[0].bus_client,
> +					   buf->addr[0], line);
>  		ops->reg_update(vfe, line->id);
>  	} else {
>  		vfe_buf_add_pending(output, buf);
> 

