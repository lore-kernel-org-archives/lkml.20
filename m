Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2C429036
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324581; cv=none; b=btlnWvoOsox+vtCEHv7spZtoBBHjcBH4/oHjOlMPM20bHaRujZANx3YWmEpXLj7XImOyvX4SXcE6dG+LDauDFm/w7W/RX46/QA5NYMk8keUFzJWIa8uOjvymUQJZs+dFf6iIYJoG1QR3QEjMDYYr+e5BE7K8N1IbfE1Gb5xypx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324581; c=relaxed/simple;
	bh=I/fv3RGnze7s+N5FxFvRXiB+6C/5+ZaAufwlU5W7NRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ylq3uqsccAfF6j6HGJKmVVGkrBtmiIlbC1wrZ0lcwqIwpyVQwBH1k4hKdMwfg1Yq3d6MX9sITUEwKpYXUVgFjg9C7+vkRc6xALmOOBvLGJkut1BValNCReFKVwn+w4N+ma7mCutlvB54LQqNzSIdFzQX8ic9ocmRBomt5D1Niqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRAPVPHT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDZidfdt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRAPVPHT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDZidfdt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JWa9602052
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=; b=nRAPVPHTcorj6cMq
	U2oLcplr9EuNFl8IICoQr+bhsIFWpbeG1gGLNj0KvzUOZ1M6VutX4MTp6RVEfgYY
	u/BEmpItk0yqDxab/KvpdIkSwaw7pSaWCSPXThuSGlNmuS1IHHrI1D1nlOlR8wxc
	cVwDDJeGrNG697LAxJLGvoxZkwbO2IRveT/TX0GAwN54aR5hUSXMWVmZrYJm0tY/
	P9tiYsvBo6zksLWWvNA8/VvjPtqwLSC2MAF+4gEPQL3ivDFe/sLvx6t+9SwzBfrM
	H2TyVAVdK+6dsOQFbdbQguEBhbJY8rSsn87r1XSA22JZncBCRQVFf8Fzg7W+8Vto
	jq/UVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrgx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:22:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a183a0e93so133462285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324578; x=1790929378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=;
        b=dDZidfdtD5IFI4CqSLAQ6xTv1NYbx+Wa6mm8u0KVI5lfRzx6jyM9ddMTn1GuMvxhhm
         lFKeq/5rKcTO6DVpg3hPuvNtvR+afjBHJRcWDegYS6u+298JzonTow+rIee1qxUCsc+9
         xRWm3zGFrqUB7/RCAcwPuS/4Eq56hxenZRUjeWfxRdGR31AUuuLJ+c/3XtApuiNwhWYj
         35h+73epziJbVFuIN0BuSgxFxzyfTpUh6fzWqfx8NvHJOTaouNSkxxbaKxQZHoIDP7QH
         iRCR3mPPKQO5nfOmsPZVN9ujpD68d9/V/EbICi3HivqPXfIgorVcC5Ea3EowCTQnVkCS
         J8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324578; x=1790929378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=;
        b=u1vspXUHlFrLB/hhxnkTLxdBQA7J/60dVtWrzb8DXeAeyFJx8Wl0A7BR7ACQm6wNR4
         3bEMdfPd+hEfKLnQzi83WhhAvtxlvo+q6RVgw17Iaw06ttZpSTGb0Fa7aMBDtU9VaDVH
         f22ZM/astQfHiKny6hQVA/s+PeqObU86xByuDZzHJbfcjAqWf/O1AhJAgpvY1lpaep80
         WPwWRFfXu3sDivSOV1EyotCHZQCxVEYRlgQwYh0TYQb9OwO/yrAI8t3z+17MU38KbXFA
         ulWTQOteBYioGcv7Ri91CzfskNs3thIEw4grAjiXVkAlQjz8iX2LJBFP2xywWjXeunmG
         jEKA==
X-Forwarded-Encrypted: i=1; AKwUvBxEEc/eax1gRTepck6Orc6m0Qcqb9qV8po+eZEhwHOQsUBPvvA4JK6H19arbDsLCfujOrLWnhxzo7BRnvk=@vger.kernel.org
X-Gm-Message-State: AFuF++l9X1fKfatSOEQBRlRrfNVNhqLkwsWteV6B/0xH3zPd/ZqcJyVJ
	tYvba+0mDK42xldKohz1w7MTujHQj3Vy2oO2lRdareuwB273dlfEJ1ZwlbIX4qbcDe074/SLqKs
	StKlZaUz0JRD3S+QRDaR/C0MndAz9pEy89B6vHOBwufEWb2/h1xidW+gZ3W42mhvIBx/BFArKko
	4=
X-Gm-Gg: AYBFou3lzvOLivdM4KQFpUWEVCiy1eL73R3wyDoGzMclL+Q++AG6mRzZX5wlMTieihA
	fXsoNt+PmcPgx1SeKpwnDUDITzwaa9ec0bF8p/5fIpPEq2bQECg+xL03yWAunnNKGS7oDh7nhBH
	4+HEtL6WGNFeU53bgJgu6mlXqj+lNQYa+RxRLmzcnutemelq0ZaQ1TkL8Ca9S/Dkdi+WvxmczQE
	wKJBDRmzNbHztVS6eDj2NQsyB3QG+pz3NOsNv3Mjf7qaEQgLvtVHeMZt6gdqxoAnRlnEyHPBVQM
	ZJs7N1Z/6YIstlPx5kaubFvIVwgoBWQC03KAlsDLiUk17e2JlivbTsQzPLPXbGc3buvNIvjfuQt
	ba8CDEXjX6V4keKOgobTbH41HSw==
X-Received: by 2002:a05:620a:2b8f:b0:914:afc1:c66d with SMTP id af79cd13be357-93c43b836dcmr301327185a.11.1790324578538;
        Fri, 25 Sep 2026 01:22:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8f:b0:914:afc1:c66d with SMTP id af79cd13be357-93c43b836dcmr301322885a.11.1790324577924;
        Fri, 25 Sep 2026 01:22:57 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2ae757b50fsm77289566b.32.2026.09.25.01.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:22:57 -0700 (PDT)
Message-ID: <348b88f8-4708-4d6d-ac01-3af0f40c23f3@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:22:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: qcom: sdm845: use DSP_A format for TDM codec
 DAIs
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-2-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-2-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g_F4fwCfgWI7VNTaapYv3gZ0L6T3EU6Z
X-Proofpoint-ORIG-GUID: g_F4fwCfgWI7VNTaapYv3gZ0L6T3EU6Z
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab62f63 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sm5W5dfhhG054gMKQQIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX9WB6GJkiGt3H
 5SLNlv8ce5ZpUGKZsxOj/4zUv1rJoziO+eIsgMiLwXTyIqLWYzSWNtpbM9Gr+h5lz0ROYd6c79x
 EpZJlP7r32HvizHvFPSnbD0OWCJv9Do=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX2mv1LS84sfrB
 j78lsWkf0uPmOEA8c0R0OL0QKOe/GBz+VX0of6UY+EdUSTqPgJl5aavmQ3TDXjttmAuDf69fPtA
 tWyYqOXKT5XWdaRFTQP8Mcko5Cw7yJKSphf1BnK9cogbaMyfBsZkYVn3wAyzw7phQDtCXWe/0hX
 reJM8raKzukxo2Qxx2GCTSRc8BwJLHgwZiWn81+h8lIcPPY0FCWqAxqEEVSI4K9mcgQUyISxOLu
 ZPJW5lLCI2hNMUsQkh54TBFEuHjIgVPindGiJBI9+DdV0TQJ3oOY79H8EWoY0yixipQkHVCFVvG
 T0sD1n/IlpWmDZ97R37IqwmrNlmn/Yq7zbDoWETvPzV8gIS3tmIsMwiER42NckD5jSkHAGPyiaA
 KKekf1bSP0lsflsk8Nmy3FFQ5IsEjgU7yHFgYBPp/RUyIotqA8KyecqxDG/s/YtWdzV/yLowlKo
 J0IcVc9c/Lh+T6UwSVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250033

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Before the DSP_B only worked because the only close-to-mainline consumer
> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
> Use the right codec (DSP_A) which works as expected.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sdm845.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 0ce8265ab1c1f..d1cc825fc5cdc 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -382,17 +382,17 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
>  	case QUATERNARY_TDM_RX_0:
>  	case QUATERNARY_TDM_TX_0:
>  		if (++(data->quat_tdm_clk_count) == 1) {
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		}
>  
> -		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_A;
>  
>  		for_each_rtd_codec_dais(rtd, j, codec_dai) {
>  
>  			if (!strcmp(codec_dai->component->name_prefix,
>  				    "Left")) {
>  				ret = snd_soc_dai_set_fmt(
>  						codec_dai, codec_dai_fmt);
>  				if (ret < 0) {
> 

