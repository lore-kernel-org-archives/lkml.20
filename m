Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210573;
	b=mzcWCl1qF8zpUL8CA4ryMw8BvErg/WQ8tEmyCJ/1EieAazWSF4zfaAczvPIVoRkHNbbT
	 7Yf1vbdOB6X6usuxAO/rTYR4eLEkktLdbl9/oNdS+VFpEAN950kg1FmLrcc60rJRM3YKF
	 5HSBFFtVqFOgyg5hSWPu1aZl28TNPf8XxMTfCDQYzYHSL+rAPnwpnooX9/bJlSMKhfTQB
	 modgutXDpAWJRLiDEc99giLrPCo6nb+RuL06zaPLHobUQAxCgC++Ycn/ukroELn6MPsky
	 2XnZbzjBgiIwGeDJpf2xFl/cdcv5SGRSLaAhzThC9t+4JIagf0KxB9oyeps5lypoeUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=;
	b=pBWj/7aCAXkjE56lTLnk8lLsxmMDFwQElIZV5Bd1CjlK8/WA0bb+i9mj7ZD5hb1uwF6d
	 eeoCZTY9OBB74WbHSr+pE2Rwz/9pfy2M69glyC6h9BRm/FK316rs0HoyaYuk89pfPWCTy
	 4TdmmxHwtCZoU1i2H0MPJkmPdz5eG5oNwgLFeK64I4JzEjuJb0S7uV2Dx5npUSoPrT5gk
	 5NULCOUDpdLnsF8CN/CHDYISDG32W7oy9lhYnmrN8g1T6akQg7BRVr7ZECieM5YXrhxMX
	 Lm9AyAusb36NI4hbbYaaCzTZFZe3b3efM27kpk0F0T8VIYN78aAx3r2MR37gPPshcrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PVd/TSEC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d03LVBhQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99346606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99346606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PVd/TSEC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d03LVBhQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A1YS2539985
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 07:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=; b=PVd/TSECefMO65S2
	2dQwe6AfFV1D3yxIAIvTeQEn9ecvrgb4Ew8IJluoZySBvMuX9pgYBQzW99Gb8wq7
	XTxdGKAQNBl0CVp6lbkhAak4JKDcUVfet+Ocu/chEndTwDbKzahMhgSVOLGs3o3m
	o0iu5wpPtwDIcySUTbBO7dMzFcUxXk5bx5wZjGDcU7RCZULSOd5EBJflmFRh4wsB
	YmCujcXMJFCjsBji00JO3jz2ePEgSuA/gDhvioTwKEubLDK6QbM6n4crc1XxLAaX
	1lZNeBPNxspl0hFQG/eq3UGmDErmHRQzLFsFsgaGnhgmjLu4Q8IBewCdiFj1XVTI
	jq/dNw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6n8gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:49:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd769cc9deso242284a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794210571; x=1794815371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=;
        b=d03LVBhQDOLlUkDjNut9Kz5alLJyMDS7zCjmzzP2IZ6aahWy6vnhUtAiuOR4G/qZXe
         xK14bNvwQ44xTokueOrcH5xslwLDHUCppupuXRtJKGl4s4K5ziS3PpUwnWzv4TP6X1Ub
         ahaahP8PWw4DyL7svxyo6TgZad1U5ra7+uPuge9ohPSmeDa5q/dXPg9aw+dcOpBxXRjW
         IW8eEZbFDM44ur6h+tpUb4RRp/5ScCtgppecEWWByfBVluN/Ae/RBf+jhuSVC8zVIKlw
         ARJACtwhJX6ISoqZbwDUizRjC7bLnW1RwKCRyNOOXtMrCg1VL7A+OgXtYMndOASvg5AO
         XMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210571; x=1794815371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDe2ce+Ek0Yzko5s6AlNc0B4Fxdld4KLI1y6EiIO2yk=;
        b=rj9baTzfaLpoRUQma8kobsLeOWZcksfjytKTaO18xEmy4TSo5ZDt1mYy+PQifoSAfK
         uiL8+Nm7I3bJtetqgNiuXw/wkUKqmHRuM0ca1gPqUYD8Vpo6u4xYWjFctm8iQh72l/5+
         /NvjG0YKYRVwNOWnbbnWS3YCbh9tJC1gnj6SWWVBeXw/U8dz0VD0mv4W7UrzxxS1KXkJ
         eumddB9uxkLpQceTNf90MAAX/hX9g1UpaHyYYaxhuq2XFmHzascSeHJCIKvqPKlTF42U
         qpfz8+oMyySGr1rAPZYjIiVhqBG3a8RT1he20z+IR+0LnaL/OIbXzVO7AEhfm9d+/e+f
         v40A==
X-Forwarded-Encrypted: i=1; AL+hErHnlnh4C+50vkiFq7pD3KPPI+3B415gft3scI7l2la/P9cHSbWi6YVZGgaIThUSte6WeSI+6uSzpCSOJKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/zOD08gcP05FE0ScfaAG6td9YEbto6cDdQwaUITf3RnMzCrsk
	QORHoSsVarUKNpJNtsp+pluGgWyT51gBxBtIqWUpiY0di23IuvMPqBthq3uQeXaITiHMOvXnoh+
	AdkhnvN9kxoiBbaVcpeMVfy+1eIeEWRnivnHU3XxhYJMCVQzJh471Fol4KQTvSd571Pc=
X-Gm-Gg: AYBFou02+uGXvXr8TMTIQdB5PQ65fAKYEX8smdzqbG7j08e/N9DOcxrTy3vI7gXXM7z
	2+NnQSb6NWcaKkQOkoew2fkRBE30sKAHM3DP+MREkpkyqkiOsecN4KyHKOxAwmjcUbcl6uPtXaC
	XLzuaEnc6F35EwnAUsQ6w9OUYhaBqq3iIGtqykLWi6LXxzqDKk3NDKmNYMRkKee11ekYpJyJJAj
	R1w4FtEkzutKKz5v/fsuYP4TqtCxsLVSCihNcAVOEYY8kmYP+Pj0N5Q0rPr1Mg2h0IfNIAuIlLl
	RKSd2rOVglW6PXNLm/RCrm5WEfTpJiN8LnVkkJzjaGlGjR88hbXl5C12MGliaz7Gb8jEwi5hcgk
	fFEX5tvCDQFe1MlWVozMMEcnJ5JX6vBDKU05ZdGgkd8uP6QfKGNo7phB2RNzsHKOInFrEEkG4/h
	E=
X-Received: by 2002:a17:90a:e705:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b12d5c4412mr3197723a91.56.1794210570490;
        Sun, 08 Nov 2026 23:49:30 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b12d5c4412mr3197697a91.56.1794210569988;
        Sun, 08 Nov 2026 23:49:29 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12797095fsm5758248a91.16.2026.11.08.23.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:49:29 -0800 (PST)
Message-ID: <13c25823-0adf-4ad9-83dc-24ebcba39ca9@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:49:20 +0800
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
Subject: Re: [PATCH v4 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
 <20261023-msm_gdsc2-v4-1-40b6a71d4e3f@oss.qualcomm.com>
 <20261026-vagabond-macho-sawfly-9c02dc@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261026-vagabond-macho-sawfly-9c02dc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMCBTYWx0ZWRfX7b+dl8ys44wP
 3ElRbdKTUWH8mhl0VGsu5ciSVpbnpXMJiBt9EuE09bHiPGVi/MrYi1BTphrCvCqOymopD6Nmhez
 DwLbNuMWy/bF1RDsBETLbw4frjBEeutMz5lqQdxMXDS2PrxGh3RaElTrIsIdIq/5eSsKC9wyv7Z
 YdSea7ZrD/OIVx7uaSz8o8LpLLcAW6tMBzg+Wuvc2yJNkGkjyhKHR3tiyPI1RAUzpirch546VZF
 FaqIXzeaYS0fp+GtWY8YRYgulV7zZTJdZzc8Nu8cOU/Z+YYKCWVZI/BI+lqGS9TmNJ8KM5WHN6s
 EPGct72bNse/cr6euQBf/CMjk6Jz2WfO+b7roSbGyrwOp2vFr0Hz2d1OmUnA8tIWhbTNqLNeq/O
 Ok1RkNTPUte7Ii83QnKqA0VGjV6es7Fi78kHqQEo46TsCOebEzEr6gA+A4gUsIi3NLy2RzJxKYG
 AJ2PkAlZlKWV8JwUQ9w==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af17b0b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=msBFRUBLE_5BgBVHHWUA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMCBTYWx0ZWRfXxoEWZkVggtcJ
 6lpSTaHRO107p6FTUXun/5Z1MltSt8Em2KKd4SBdzC4cZOYoAxhxeFEVQ/sbbvsmZIzUMUUF6LI
 vMNpNIVHB5FPhbUGk2XtY3zgkmxdYVI=
X-Proofpoint-ORIG-GUID: 25dPcbQD83tZiilZqVeXRN3uXzRSwQfd
X-Proofpoint-GUID: 25dPcbQD83tZiilZqVeXRN3uXzRSwQfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090030



On 10/26/2026 4:09 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2026 at 04:13:11PM +0800, Yongxing Mou wrote:
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> index aa0cf0ec5b93..7f8e52d52078 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> @@ -61,6 +61,32 @@ required:
>>     - clocks
>>     - clock-names
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
> 
> here should be contains:
> 
Got it, thanks.>> +          const: qcom,kaanapali-dpu
>> +      required:
>> +        - compatible
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +
>> +        power-domain-names:
>> +          items:
>> +            - const: core
>> +            - const: int2
> 
> Drop power domain names or move it to the top. Here you only provide
> constraints, not define new properties.
> 
Got it, will move the items definition to the top-level properties block.
>> +
>> +      required:
>> +        - power-domain-names
>> +    else:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
>> +
>> +        power-domain-names: false
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>>
>> -- 
>> 2.43.0
>>

