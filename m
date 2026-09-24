Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628844078F9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245979; cv=none; b=mc4DFsaBi0VEO2/dr8bOt+gM4dckMvXBC3C5OF7WWVp29KoK2OuA2Mu1ZkW0YjuNO8mwuqaJ2T9uG0ZypMv0SRRPnai9xP9sv1SPsQnOrysMhTzGt+ziliOQujLQmQ071y0GRtB2LSAtopz6p0yl4wN0sKbE5VZP8xmPjuh1+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245979; c=relaxed/simple;
	bh=7zwTmehAKssK3FDdkKixE6p0T3SMJhlXr4OxhLaCzT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nD3/7Q4VAx1EZwa/CET1LI1jJIDIVbfHEe4wWVi4Wzya4OpIAJ+hr4exfa7vBFkR/ECmVwnxsjA+CGBNB7Lznm7XBGPYVCygZnB4F7/Ql98yaMo/G6i3YFNuZ7S8FiYTgrq5zJW2HcVR5NaRfPaY/UhxrTGSvSvfE7TyMYRl528=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkxisI+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNzXJFl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkxisI+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNzXJFl4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PgXF1270209
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WXg6dqUWJExGXR8prNtrYiyQGTXd5oj5ngmptCv+11A=; b=VkxisI+YzShJEnnF
	ow4m60Uh0zvZE6FuBB2KnVj8dhkhItWm8D/XxGnFt4cP5lf+AEC8TK9lvb+Dyl2g
	+l52UE32hRvbXffzjrqK9Ey/zhHrhrKyKjdLLrz7XLRGmNhUpDnjFfNSf0uOkJOt
	rpLfFyEnBWwL0zg7fGLm9ArHD5bQWxzrtHXiC8OXXXKVmTLFsYhyapnvGgY9tri9
	fNcgiZGNfWNcPijpzVdfxa/nzNdvUclw+wlqXwn+C2hqTkpg6C3ieFTxtViEnbxA
	L7VeO1WKgkF86wc8BguxbsqUux7jGMWOK6IbnRexRMjOkqbhshvPC7ghVRFWnXlR
	sJHnfg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ahx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:32:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3212638eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790245977; x=1790850777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXg6dqUWJExGXR8prNtrYiyQGTXd5oj5ngmptCv+11A=;
        b=VNzXJFl4SdX9cH80sEqorvFG38lRdwljEj9FPuvY/2diCpkSi6yD/inRwpDRxUAdRN
         VEzWw1b588VtwKPgXOOd9vutJveN9VGCQ66tzeJtJ4gfNZwkqSq5x3ztuI9veksj9k3D
         qQUyVu/ufBa94yOkyfV8DzRpB8vVvjYMhyMroeQ78zHm7Jod4Myku+D4FB8MeZfbjcia
         DpbYXWfOc40P81XYjl0V3coxAfYSZcL0t3eYl8KZ7EFVyEQyEkBBSPxieglYiS0ZjLbQ
         2Oq0e6FzNkHdyECtg2bTi3bwXMwlyBvg49/7yuXxGNV+tClAfZHm39hKtl9C1bjHlVpK
         IBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245977; x=1790850777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WXg6dqUWJExGXR8prNtrYiyQGTXd5oj5ngmptCv+11A=;
        b=LDqbBu9GXBcIqRiKFVl5wnrLrUEpwSNFEL56QiY9Fu4AiRvU9l7XX4shcoxHhi3bQw
         wPPyGRj6eNCmpChg+KaubZbg1zR6ww6bVg3NlDe6jHmUtI2S0Goyf7PTPH29QvczUI0R
         RfM2YYxLfysrDvDI6l2WWfYnUXjYm5oAwwKOG9Mej5agptIdO5lHqxblSATUxePdiwm9
         Jkjqs5Urjjcie5UVVEsCXPfwDoVhzNoXTKPK+UvhS5HYD63o0b9vbCz+NESgv5rxFoAm
         sn9v6GB4now+9DQG9yV1G5U5b7zCtH9jcuP9PimR4biyTBHnPmFU0aMnP0B7taFmFoCs
         ZSug==
X-Forwarded-Encrypted: i=1; AKwUvByx6tfHZbn4Ol+cYUbLyvNclLQjS/NUhzjYZYJCXaSTWamC+Vk7HlrTnkZqhkGSqx57RA61dluwhEcTzvI=@vger.kernel.org
X-Gm-Message-State: AFuF++mvR/UKwgOPofqrZdCAJeNntGWUJ5FN7IJdnnBHAQly5YBCUQTF
	CY/XMtIxEe9R+V3VrZufLIxDR7RFVdqm1C7WH7ysS+GvK5HeFGct2a34O1WvpgviVq4lc/BEtpN
	LdksHWYqZGfFgIWIbzOA+8zOz54ncNJzVFTNWo9KrHeullotL5QBf6FLJy1iRbyiNfbs=
X-Gm-Gg: AYBFou2eLIgNB0haWHac5qcExF5F0wYgITLf3N5Q0/7pqkB8EWRo2YvQhhXqEyzAyXd
	l707bZrCIH38+WdT9+kpCc+bsp1gKwQnG60bELQPzV+VWvpH3hWqGSVg3LQkKFN0uZtkYdYnI+w
	XPTYN3hk8e4Pji6ZfwZGRDsuA3KT5VH+MX9ps58jfevv+k5xJyRAr5pbMwh8lla60KZdgbodfKW
	L6sUp1csCLA6e5ZTNn890AtMcI4hDFcyfkjLx2VKJDdBGCHmUkkygZ2PmDPFV8RiEF+k8KTDLjo
	yDzOuADuHvFgrbCSfL/RYNZnZjxIyKfPhVPPR10G4sJHAKRtZGVVDFi6h+Z+/cTLbIvazNpUdnL
	oBLBEEYHvopZSp0CppKXCEA1IfU0=
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr1964995c88.41.1790245976847;
        Thu, 24 Sep 2026 03:32:56 -0700 (PDT)
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr1964960c88.41.1790245976229;
        Thu, 24 Sep 2026 03:32:56 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm12068303c88.10.2026.09.24.03.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 03:32:55 -0700 (PDT)
Message-ID: <3752b72e-82a7-4fc2-be1b-5a5954062bee@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 16:02:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to
 snd_soc_of_xlate_dai_name()
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-6-d5b6f056568e@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-6-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MyBTYWx0ZWRfXyay+Agq8l8m/
 FyKLK6Fn6Fe/1/NpU7ZqHA+D9QRgK+dCjRhZN3omqiBFDzInjPOOMzIlB0SeRb+afTxEFwaJKj+
 +sa36dbmEBNHvzV4+e8sNSHyST9eTPg=
X-Proofpoint-GUID: 8-kyoKafia0mnVId7McqDZRLhQRSJGwb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MyBTYWx0ZWRfXxMUHYZ00jymw
 GNoa/3INRx3iQXhKoNpSh7Ap9kOdQ33/Xg8T55gYU4jSnDpm4rbwBMo/91pE7qAvpIlojdqoplm
 VnQ/1qYwwW5XfS/LDQCtZCIme0rmVlgFag1nO+9HniXDFaQ5xZSBuZGDyJvBWD9+kxd7NiaYeZN
 01bQ7VJT40luZw4tKB7JGYInnqMBhg/4TMy/jo+t2SELpCGHNEvsF/8Ef3vZH26DW2YimozcG+H
 tIqWLamcHxUDp9EVjW9SS8ijbhCqo8uK9nU/Sr4SNHHhaVcl4IEMZRWyf9Z27bWTTD+SSwk9Gtg
 JylsWPUvnc2r+MqRTNjwBV5327EW9kRQzuKg8zImfF9u0zn1ZP7kGbUxY4lajTi0aINwVW1yxSC
 XGcTCMUTyrBVI/NcohVa65jvFv6UxOO+GAfTLtw7fnQ+YrJIDTJBJUFHlaWLUaqntZ77+pPUEJE
 Cs+sBf+PJ1p5u1UR52g==
X-Proofpoint-ORIG-GUID: 8-kyoKafia0mnVId7McqDZRLhQRSJGwb
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4fc59 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kcWvErFG8IZCALGPlGoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240043



On 9/23/2026 12:18 PM, Harendra Gautam wrote:
> Use the new generic snd_soc_of_xlate_dai_name() helper in lpass-cpu.c
> and qaif-cpu.c, and remove the local lpass implementation.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

>   sound/soc/qcom/lpass-cpu.c | 23 +----------------------
>   sound/soc/qcom/qaif-cpu.c  |  1 +
>   2 files changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da36d..61efa45376cd 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -458,30 +458,9 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2 = {
>   };
>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops2);
>   
> -static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
> -				   const struct of_phandle_args *args,
> -				   const char **dai_name)
> -{
> -	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> -	const struct lpass_variant *variant = drvdata->variant;
> -	int id = args->args[0];
> -	int ret = -EINVAL;
> -	int i;
> -
> -	for (i = 0; i  < variant->num_dai; i++) {
> -		if (variant->dai_driver[i].id == id) {
> -			*dai_name = variant->dai_driver[i].name;
> -			ret = 0;
> -			break;
> -		}
> -	}
> -
> -	return ret;
> -}
> -
>   static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
>   	.name = "lpass-cpu",
> -	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
> +	.of_xlate_dai_name = snd_soc_of_xlate_dai_name,
>   	.legacy_dai_naming = 1,
>   };
>   
> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> index e1868dc95cf4..c096ef5133bb 100644
> --- a/sound/soc/qcom/qaif-cpu.c
> +++ b/sound/soc/qcom/qaif-cpu.c
> @@ -594,6 +594,7 @@ EXPORT_SYMBOL_GPL(asoc_qcom_qaif_aif_cpu_dai_ops);
>   
>   static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
>   	.name = "qaif-cpu",
> +	.of_xlate_dai_name = snd_soc_of_xlate_dai_name,
>   };
>   
>   static const struct regmap_config audio_qaif_regmap_config = {
> 

