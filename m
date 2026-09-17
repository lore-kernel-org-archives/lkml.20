Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E450AC2F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650345; cv=none; b=fp3ijwO3PKj9cL1BfnRt3e9FawejgcTM8dT239Y8qzgxJDF55DiNiwm19ICnGbvrOh2sWsztMKGOX4/i/vS7dFbXQ2K/hCk8Hru3YV6WE6NdN57e5FCjmrl7/Xs5/BC03i9SR23ZNylQn6/dVbx7an0NFYPNrGfpPc3/biKO8Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650345; c=relaxed/simple;
	bh=Huy42Y0tm9PPznLW3sAAsQFXhfns6BsJrA4WTApQt9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfuAYhe/FL/wuqELKWLox51XT6nX5voaFxV1/s/hRVY/VkylCMh7WIv+7RkXu9XRLpyL160er3RcFYTqUDfW6Z3JzOlhw04lzxS7WQ4o+0wl+onUbzMEj4vd9fpNhtERkES6daD7jUL1HXKIWSojzLnbsgxdmOaSqBMMb8Qqif4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPMDDnkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSlyBaMg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPMDDnkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSlyBaMg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZcaH746584
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FifmQPtjNQP+m3guD1IJw8+5zA4lU7NZ4ITvxl8VCyA=; b=HPMDDnklUAUtsmv4
	6CwlBbJLv9wZnAS8k+Z2rF9OtYRQEGkLGFgB/FSoTY1OiqjI/J3uuQF+oV/YiOUO
	+BbI5j+K7g5pu5cwS/1FtSqNouXOKl8fWwk/2g76Hlfes+Kjlng4ynuoXIsKoova
	mnevW4akSNddPK3cVDZDviJcBbk8i1MNGjOzPqu9WK0CpVgFKu7VE3wsZ8/X6N1Y
	1gj0oxi/HveERGAVPc3+hcDN69UJ1YXbxelrUx3/5JoiK9STxmedVWVTYpz5dYYU
	eBhhjXNehj2LihRorDyDTPhZw0fS3nNheOJZoUGbLtjni4rdj9Rl32/OnT55jVVo
	ng6HUQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra94yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:05:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1554642a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789650334; x=1790255134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FifmQPtjNQP+m3guD1IJw8+5zA4lU7NZ4ITvxl8VCyA=;
        b=XSlyBaMg/sCyEDiFxpapHsdhuypzHDm7MhRYaefXFHnFmkaBid8501uvVUtVocO1eM
         iKQywpzSRNXZKaQu8jvNlq3u/4vkNdiOFzvpI8iO0nyCox3axdBTxxbLMGsD6hblNqMc
         OJ+z9xvgtekGqhBHAZpQc0Gm9yvU4ylhwpbhEepMYp3IGX/4up/weaobkeJAOY1B7f8T
         NNL2fX6AcEgWR97mXu/8AB4Lm3t7eOmiosp0AT6C8h66Whti+8Cl+NlxIsNF89AvnEWM
         DDQOfLdE4/5iz3nyIUp3Q26rd9mp4SNsz4EhCktsqtiuFHDc5q6Sx6lno3sokw1HP27i
         JO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650334; x=1790255134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FifmQPtjNQP+m3guD1IJw8+5zA4lU7NZ4ITvxl8VCyA=;
        b=yUHVlqCI39Gkzaocs6lxog3Vrch30/cW1Zw6m0T3OvDOntJ1aIXpU7Qc/gxya+Q1sZ
         rZ2Rr5B7oB5v+lm+YmyjwlJEDk+oO2Wu36Ynp4+R5A0CLffRoZZ3cpsINeCi1dlaB2TK
         OI7SrlhXdnMosCzCdxGpBwOeSmMkRDnJJ3GwKM6/Oxh+OC7ZRYtWMc9FD7ws464g8T9c
         r44AbSHLe91yu3Q2BNt11TlV/vdQl59VW22Ai0JytD7jvTxLAj41zoikMjFndgw3r1qn
         dAJW0AmCqgvnhhxCYyJwG6FkWzDg6drCXUtAhvgCaFbjXi/pPAl1mF7BknbPMYqeyds9
         Sl6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZIbABZoJ0jsil+WZ/Oa03xbW/LDaQ+L8kAZT90HtEW8POPPyGF34lAiGotIglmtI7ES6foYv6au0mM2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kVrckyudRywU2vA/fRnHpkEliKZjqDJFTphBmO0w9/42ckUY9A
	eGihUb97yDAwnoMFbp4NpRi/MWgiHweW6bL+U/y/W6jKQR6RjOp5+bTK6fy/N8UZKb9v4JTElP/
	4W9FiZ9RX/tdzMPpYfTWhU0y25+90ykeqChlyNY68CyzOpXO9LVzx0avl6AxJB7MPOMM=
X-Gm-Gg: AYBFou3glvQ6XJXxyPZaU7sD5ftS+DQCoA9kyq8w6iWrePw3DdzoCmvQ5QwoJnoOfRV
	ivzDC3MYPlDg+7/004K5sw3fE61lFQQY5XlNYlW+0FFhAwXOcdymGaOh3v0XO6TKHFjKDycWVvj
	uu8BQTPuFEy67ZxIxVHAlTefPdei4gFt9xgDW+WTli8C0KFkncP2WLrmpM0gnH96PQqftAp5+vu
	ACojgG3iaKTNOUOObE8PCRJPBGAZQiq/q7hf8eMUcN6G5KbUExW7pNh30wwLvhX2pBtZ8S8m/tm
	q5lCD1Cl4bQur8JS2X4I3AD3i1zzfHKIXLWDOmXmzeVcUYd9vdnFggkxJzY9OYgjjuwjY587/ej
	TDxzycf2CDORLUbuH9BcaB3ryJY6+Pr+yaYk=
X-Received: by 2002:a17:90a:d446:b0:39d:feca:f48d with SMTP id 98e67ed59e1d1-39e35daaa88mr4304167a91.3.1789650333890;
        Thu, 17 Sep 2026 06:05:33 -0700 (PDT)
X-Received: by 2002:a17:90a:d446:b0:39d:feca:f48d with SMTP id 98e67ed59e1d1-39e35daaa88mr4304119a91.3.1789650333016;
        Thu, 17 Sep 2026 06:05:33 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e39b057dasm1103153a91.1.2026.09.17.06.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:05:32 -0700 (PDT)
Message-ID: <1e30cea7-7bea-4ea6-b111-177adbac02a3@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:35:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>
 <apmKZl-KaCDg1qmg@baldur>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <apmKZl-KaCDg1qmg@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfX2nMxr0ibEJpe
 HlfbdZnL86OOlkzsqRpIYxMyqXDSRNhglGEXYZyxmCSItHlROF4gh3DjB3dVgcreWE5B3X8khKN
 0LfadH3n5pKa2gPTrjzFjzoFbt/oOYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfXwuZwaE17VWxj
 g4DoCq1iKOMqzAe92EeU3EmPYKsNM3H8T+97DHLQlE2P1lhesltsU6JAD4cGLz177VnyF2Pf1Ca
 GJgF7wocZuNkzhwacZOevDIDXvsKtz8jSGXhXTkfTkWPwv/vRyjgmwEcqpAZ4woVx07hA1F6wOp
 VMzK3W/l2Hc8/BCrAzumEm/sNru52kLCPh9N2JBaXcWGOko6yiDkc2we39YKTENLFtgoHV1aAZU
 FbqHp7rn1boqoQy/OWEyO3AvYVXwnmL2gM0RkAzNMYtJmolxmPuryOvUmDdzHkULVnKpObGZwfm
 Tm+N3Hzp6cy2xkHX1boo9LP6Rm5TpB5yr/CwAyfEHpO9O5oeP1BHo3YxVPBHxeA/zAT7cc4qOU8
 oCP8w617+c1vDiZe+RFEFHJwbJEOqh1U9faahtczQSDieazmxbv5qZ3ZsVlDnHbu15E04EOZXAJ
 6rwoa0Eh+HYbJzxbrJQ==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabe59e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RT33ezYSesx8GuUvZXQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: iaPgjLtMlAPNlydLGgREIjd48I02apHE
X-Proofpoint-ORIG-GUID: iaPgjLtMlAPNlydLGgREIjd48I02apHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170184


On 9/3/2026 8:26 PM, Bjorn Andersson wrote:
> On Tue, Sep 01, 2026 at 07:14:01PM +0530, Avaneesh Kumar Dwivedi wrote:
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
>>
>> Signed-off-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> Retain Nirmesh's authorship.
Nirmesh has helped with validation and internal review. I will rework 
the trailer chain in v2 to better reflect the actual contributions.
>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ff8a35df7862..ff7775dcb954 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1056,6 +1056,13 @@ properties:
>>             - const: qcom,qcs615
>>             - const: qcom,sm6150
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,talos-lyra-evk
>> +          - const: qcom,talos-lyra-evk-som
> I don't think there's value in claiming compatibility with the som, just
> add qcom,talos-lyra-evk to the node above.
Acked, I Will remove compatibility with SoM and that will address 
Krzysztof’s naming concern as well.
>
> Regards,
> Bjorn
>
>> +          - const: qcom,qcs615
>> +          - const: qcom,sm6150
>> +
>>         - items:
>>             - enum:
>>                 - sony,pdx213
>>
>> -- 
>> 2.34.1
>>
