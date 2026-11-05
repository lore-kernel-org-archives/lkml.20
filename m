Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865540;
	b=qGWArNFyGh5l04txQaD2bNr0vM0y3PtOUQpihZYOhWPDPWEACHd/MtMddZz44bsYopJ7
	 yz9JPi7mg4ldFJn7LcmtojOcAPEiobGiZx90fueysaUBKoTXBwv5aAiLK2wcyn7MyXCYr
	 MhpcpDL8JDrId1wHAqSsVbGXCIMtonKaTlFewk6BCz0DeraVOKKdvaVh2LG2BU9eb8UgB
	 2iEGkQGwR63Age47WehHa18BN1PkREDZNtM19C+FVMR3bL7GuFqtT2Ph+MG+EzqlQOlYb
	 3AhXL9w+19zOnooYJpiaKCwiJQkc6iTjDyyTO26q+d3VixNoij/AEZ4XRvgeSa8wihg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=;
	b=qC7C6NQecGWEZLPE+ArsVHCiAMc30hkIpLOQJ60P/Esp2A82dcMS66+1OUsm5SLs2DQI
	 W2hZkxg6UM1kQy91QnoulMFEhgAGGNwH+GTuHIHNHDbhwaYryyUJV57AVwXJO6LGNI0zZ
	 Ww9CRzPKTVVgKnZhj428P9mc1agbkdZXlWDvHr4bC/BN21KMYjgpAeE8GW4HoIYZh7Eoy
	 8H0gBUXiA7VX++9PJONo1AKM4UwEqQAfWz7llfY5SVR0ZRD2QjolJqGv5dwSBv7LRIS0L
	 yfP4uA3uVKmN/ajNUQ3XVupj/uCFPFy9yK7ZmyznBrGTWrKlihJDdREFxmv4UyKVDsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOlZFjrD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YYOMT6wK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4572606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4572606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOlZFjrD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YYOMT6wK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56ULtX1018088
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 07:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=; b=OOlZFjrD9w0GeGCz
	YEebaqdzGvX+Zz6fYOfT25DN+oBAkUZ2/pEB5DUq6iHZ6ghWtPWNAG1x2V5WBJO/
	yDB0G+jqksL7IfQhxCI6FvgcrTtCv3pHSNlC8wxcyG7zTf3XH7c1u/Ku5ro55iuf
	So+EB42xFzGc5bErYOYBHjvm42UtdCFk0XNPBWNoDHoV8x30iH9Fy7cOQl5t08Se
	aAkqNR/R7QffC5YvRWbWPOT5mfYPTNNW7U9Fp+guKvAvJQiZoY+wk6bPOxfV2Xu1
	IL0tw5qb6NnLmgv3w+o1WcjQiEMp4NWUZqCT4ddDW2LAHMI8yxk/Gc6GRxp1FSiD
	MhNk3Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnkwwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:58:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c6ea5aa1fso3789846d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793865538; x=1794470338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=;
        b=YYOMT6wKlFykMzkGq4kaY185fDMGjAF+l+GMx5QAti2f1tOgIFpCpLw/MWG4eg7gER
         K9SzN2gN2Ho1SBNZlWoLz3Bi5Mf0EDB1IMoiiVJ73gOyirgjBP99aRjNG/t0FXygPLqV
         UJ4zU3N3FwoobwN7g7r7TspyKrI3Z916VD/9XpbeQd3at8bG6BFzCXT4O3OyJ54aH7f2
         01s6KVhjhwkgcB7grcOjOlkc/0tSWhC/MqiV2IL5cqLs4dE+TAJ46TmIuhz/m1ZwHtIp
         FitaG4aNuqFTSDwCMZLzqbvtFuqolJvmjImlFvfuuo2M7QHLtpC/ZhewgSVbPv9GfYyz
         Ynaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865538; x=1794470338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=;
        b=kvtsnD0vX22W/D0TW5FgfriAa5xuZuBFm5RwluxYzSp/LgMNUduqkU6fhNWzdgrMYZ
         CO8DdL/TTb2BkkWGQ5CwF/xedLM+MjzHrBo5FfOOxzfR+3cYAi+wnD+E03B2AuFuINF1
         KawtqmLiJHTgwWeIhc+nhzs3EISnW/Uf//eyE2WMDMvEfytZkuKauE5+zXar+5kDuZ3A
         qduZWStf7iWNA8QYdsueMLwlrjIf7FXNJmT+L3Rw3MQ9N9PskBOHINIsaej1pGJsrgZc
         QjRsREiS9YSLEUrLNhN4dzuiMQuyj1/3AHE7GvZ3EzITA9GQC4xOPnGkreo/l049n8f3
         7Ifw==
X-Forwarded-Encrypted: i=1; AKwUvBytS2mxOEwM1FYO7SvxsfHvhN+C3vxD9i524yl+x9ms3Wyy+OT++mgctkUcw2B16CJtThkElKEsIzH1Pyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b8sYH1rF5YvYGG5ZmCBrKlJxsUNzFUSk/q3cIKxsez/nnZH0i
	YrtmJQVfHJUJy7E9iUnOrj50pcDaFKVaxduc4ZT7/JUACPzWfdGKQJnfe6YUFQI8CPf+B7dd9Te
	1mYuAYf0B4rpvbZLVD7tZcyYe7/XqjPNX+PUg1Bn10UOTZRgl/SseSg3lIN9gRHwAO4s=
X-Gm-Gg: AYBFou0/RlIw/ECPrm5vGmcrc3UhY3yd7mV+8ymFnRPmAL0R2rsS2D6PEWDP5D78FaV
	EUnXflv7MUNgZ60/zHNeTgQNTTg/s4UJSiqdeMFxF6PFD42uzFsXxFY1ZHd6a1018IUCGerLBlO
	MPUu+hG0dSy8qnVlcEwe3+m204Qb1BUcF5MCPRrDwIwXcuCxqYdZptS7LFGGsa96Nhja3kCmNoT
	cd19z22leSMFsWPaRCRLh68INSJUBtKPoTK9HgtRb+yr3AWuOYAFx9lf26MAsQS63Bwt3KSuZam
	3D9LXpAQURcjKxzP41kk1U0ihOXjI9xYJFdy0RpS3N8ZZRq2AVwYyAZovdHnWWekdxZat+PpWn+
	2Wy+KYeIJGGglktYPQjyiQGvpN5GQdhsd90wytBct5T/wTe3DsO5+cAe+TIFmKcR87pmH
X-Received: by 2002:a05:6214:c6f:b0:91c:6ccb:4442 with SMTP id 6a1803df08f44-91ca4a4b1f1mr414798666d6.2.1793865537461;
        Wed, 04 Nov 2026 23:58:57 -0800 (PST)
X-Received: by 2002:a05:6214:c6f:b0:91c:6ccb:4442 with SMTP id 6a1803df08f44-91ca4a4b1f1mr414798016d6.2.1793865536835;
        Wed, 04 Nov 2026 23:58:56 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e46876asm148250766b.57.2026.11.04.23.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:58:55 -0800 (PST)
Message-ID: <4a733192-37c5-459a-9fee-079f8f813b8b@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 08:58:52 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add missing CPU7 3.36GHz OPP
To: Val Packett <val@packett.cool>, nacht@dxdmail.cc,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaron Kling <webgeek1234@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104-sm8550-prime-3p36ghz-v1-1-c72630265379@dxdmail.cc>
 <ef120d58-fb97-4c67-a29b-6b9b07839227@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ef120d58-fb97-4c67-a29b-6b9b07839227@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfX7hNZa4087958
 wBAh/G3Lx53zCu9LxfcJsRhln11ipSK2ReI874V5FN9TVXiStodZp8SInJwiqDX8VF2S8EiDikn
 MtoSvWK60tv8JhA9zkntNgs7A7sYFRccM6HaIQYWUPNSnywZbUIUlD9FCf5KqVAaATCDOn7+7KK
 UoFUrOkFRLzisECVG+fOCY7iz5Z+vtMc5GfmRA82D59/KcNsslOjD69z3cdY4476KgDG9bF4xTj
 nEbYyUELa4f/l3QzySejzVNv0O0e6WoalO2rlWIwOyvfYqX2J/B50LedrO3pmCLv2SApp6PvAG6
 Yo2BWkR97HBUHVejuBrS0lnZP5hanFi/mYsuniXsoV+fvNJResKG2M19eer3OcgoH6H1UsH62Pq
 r3rqpJzkfEZWNtFrcKfH8n4ACgFQIxtu+XIwHJejuQpxmNBe7/o0MrfsC1sTgJpql0nxsYCKCsW
 DigcItVTM4Xt8gEWstg==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aec3742 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9hb5SW-Fs4uWgb81FvgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 0psVfgN1ShSqcjaVoJ_yyYpDjXaFUhsa
X-Proofpoint-GUID: 0psVfgN1ShSqcjaVoJ_yyYpDjXaFUhsa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfXxv6hsgqiJdtf
 T/82CGn5swniJ9IeNBGSiMSWZZeZbz+qpWaQZOn3GZObIcMHpIuSXJWfVhFoJ0l+77phGj2WnvG
 bThitqOo0dCmdCdFkBmDrwPvb/86A58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050031

On 11/4/26 10:24 PM, Val Packett wrote:
> 
> On 11/4/26 4:41 PM, Nizat Mikayilli via B4 Relay wrote:
>> From: Nizat Mikayilli <nacht@dxdmail.cc>
>>
>> The cpufreq LUT on the Samsung Galaxy Tab S9 Wi-Fi has a 3.36GHz boost
>> entry for CPU7 without a matching OPP, so the frequency is dropped:
>>
>> cpu cpu7: Voltage update failed freq=3360000
>> cpu cpu7: failed to update OPP for freq=3360000
>>
>> Fixes: 3f5dcc05cd33 ("arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths")
>> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 03f6d40edea7..ed6e34ac8d56 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -752,6 +752,11 @@ opp-3187200000 {
>>               opp-hz = /bits/ 64 <3187200000>;
>>               opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
>>           };
>> +
>> +        opp-3360000000 {
>> +            opp-hz = /bits/ 64 <3360000000>;
>> +            opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
>> +        };
>>       };
>>         pmu-a510 {
>>
> This seems variant/speedbin dependent and does not apply to all sm8550.
> 
> In fact a quick web search shows that your device has a "Snapdragon 8 Gen 2 for Galaxy" which is a customized chip for Smasnug.
> 
> You should just add the OPP in your tablet's .dts I think.

It's fine to have a superset of supported frequencies in this OPP table,
the frequencies available are retrieved from the LUT exposed by the
microcontroller anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
