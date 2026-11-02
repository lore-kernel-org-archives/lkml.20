Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631464;
	b=cqOol2YwSDyg4LLuW6w+TsFUHyQESjXcCyqBpwITCvdAT53h0RO9tdGvdxtZcSJZHmYS
	 4Zv9WJgrgnMMKTSWi9h2e+OmW3doGhx2C3nfUosKVCse4dP3fIvWyam0T8qffCUEJxJbt
	 gKVmWTh6vBbLifgFghdVCtsXfAXrGXpX1syUQbTSXZSeUFC45Qo1DlkwDXs0yBDQ5Ltf3
	 84CnecM9WEZCTlpjIlupDQWn1169MullhM/ZwEBPwg4AplVW5xvGXbWjUmyeOPCSyJnUg
	 YBZcQ94rZpVHtTt5ZnE5d8mynN8EBkzkyDBpuXBqM5po1WDyqKjq1QWsP4qrnwHl6CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=;
	b=sfoQAuc1ICWKhgn9SyPWop48+4EGiOpuNY6zFKb7KuzYIgADLSIKkokMOCKS0yXJ1UzD
	 gJnLBVdSjw/ZrljdP4YQ1c9zstKKa0rWDUKZhxfMBq8jm5EWqAIg+30Yq9usQ8Vu2V0OJ
	 BdwXyAJEJEVCG94A5KkK7Mtmdb+GpwXUfccIaW7Mu+Gw0eBv0YEC+dPUxafqxkyyGlegd
	 6EJu5zH3sI2O1kwZPv8vupDT9LJizRm1UGCbef9J3LIa6LOguaBYxwPEihH0bZ6W0QCVi
	 IDtBDg0oSJnfbcjAh2LdDhzvim35XewqDqYqJlHYK3QMYKurd7+9gpU8abamtp1uSdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOpZb9qc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M7LHIB2L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB8606A5A7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6DB8606A5A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOpZb9qc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M7LHIB2L
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpL072991852
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=; b=MOpZb9qcza/MuWZX
	/Jhnru7VEoNOcXEWBrMOe4c8Um46z8/+YAJvZR/yOMWhkntzp0w73f2g8COfrVBp
	ZkS+uYPf0SuJCg/k7HoBtS2yIzuqS5yDwo9CwDwyFK7aaFg8LvzQG5wdcLwGk1g3
	Yy4uS4mgwYvNqsjB7COwbhe8pOVb7+qW6NYbuWZ9hhVJea7hzpIcvOXaVoiwPuD2
	9UkJ7P069SjJQCBj92oquJL2kEjHOZnaQDsLWv7W2mdvxbHf2actDhwEl5BwR8jk
	pLDgUmg/PFMigixW/a6hGVgJmwxHue7j/yc4KvptIwmCOd7z9BUx/AXPBYYCLCdZ
	qwzWIg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgvhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:57:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso107347137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631462; x=1794236262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=;
        b=M7LHIB2LSlAmt2WIaDGGugI+e0LZN2Ap/7uQhtFI6O0FpThwkasInkZ2gbutZcrzpM
         tlDNqeLB+JRa4aqXSRNvrKY5cTHflQ3WvgpYC3I+uPXGQZPLVvwcQiBOauXN6GQcWGJX
         Wy9lAadPnolUuG76oJEm3D5pyGCY4w7I3ZcDRn1+F4o9snzRsV9MJPauXVt4jKCm+uew
         /1CVY25WyI0/S01hMUPkdywoGjaM7DBQA0qdANn9jNz5p22AI9L/EnCvLUB33JFpsVlQ
         MA8tWn5mzaT+ABGFiGxrbPkc0r25iC81JwAwNAd2ommuGAppFoL07qblA5pQG4ipDfp+
         6DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631462; x=1794236262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=;
        b=jqTZL3k8ZwpAVj8yqtOhTif3k7XrYJjrSp6JGvw6RXrtnpOHhYohXMJjvZURNuqaQe
         sPyS0170qF82r470anK3tW2mlr3gadwkTAAI8US1XEekIybQchSG5H6jWL1cAFnNagSw
         2+Tf0X17+k5sT81PaOs2Hr7CQZzdxMz3ZD8W/rUiWqXgpBwiEKMM6V7PGEKZKaWHbkKp
         +pKslaFfirdZFShTkWd4j7PJjnIeyhHrDGJNdx3a62o8BOeo9Fh8r9TdYFuBeUHgcxxT
         1nQAS2m8rBaCJrcesMWANOz9ctIJr746b4EdazKTUZp+6Sr+dZ7m667W7C1gwkm4SA6M
         5RVg==
X-Forwarded-Encrypted: i=1; AKwUvBxuwTJXRCfL8RwVj05eTLW0c9OgaXBa33nS+BqDSQqSjDORusjikkIpQuKcZVdiWudjYXsmoV0zgWidekA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k1ybqb07L+9M0BYSWU/PRZrMZFojR+w7Gpq4LppPlRWFP2BUh
	O1n9wCqeLdSwXMHRKY4WQA2HTatajTMs0WGAXtMck0JlKyezcRCzIkfo0MBPO2srD2KjkQakGQq
	HOqR6avwLNWhVl7LwxyrjJpfnHY1EUzWOgPd1Z6QiutQxb/bdd7IK8deQ0bb9ihlIjzg=
X-Gm-Gg: AYBFou1KTH3tI8zKBasC6PSFTLG+UJA+YDraU8qpO8cAn5mKJL5kSJ99vUP2asfagX8
	hs5z0mKe71vkgwXYggAYoUq4m3LN6ZSmM3HHaw8stxR4ZzhAFA/F7kmYqzqw1lgVC+FknBWKRmf
	Depxo/NtdEgFoA3qKixJbQIoCa4VQKNPD39b1DhUKGbck56H0QhokM/VdYw+L3wxeD3LGfu9qgc
	mFyQwe1YrH5E74la+iC4vBBgNEQrVzRpJLj/9aOVYSKaI+XOKupRB1O99REoArO4GvDU2KIDhkk
	+yecgK23+czo6yVQWDyQvjIYSDY8F1jWHU+9gjnfz6c0bJpzpQxZihmRHZGbu7QRpGHZrttk1Um
	5LTsSloNSwUmEUFK+7KRxlxNWqrcvWRqkUWBPA/A/L+Wa4i5f9KMVsxpZj6ZsVjBRGLWPwg==
X-Received: by 2002:a05:6122:512:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec682924c3mr5548012e0c.0.1793631461827;
        Mon, 02 Nov 2026 06:57:41 -0800 (PST)
X-Received: by 2002:a05:6122:512:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec682924c3mr5547994e0c.0.1793631461382;
        Mon, 02 Nov 2026 06:57:41 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm401506066b.21.2026.11.02.06.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:57:40 -0800 (PST)
Message-ID: <ce3b0670-3de1-4c3f-a485-e6bdb8d3d95e@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:57:38 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
 <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
 <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
 <23ac857a-b340-401b-ac24-77b89da2aa8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <23ac857a-b340-401b-ac24-77b89da2aa8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX+BLBNS0N2w+j
 T3XQ6XkVYB2ZbGmjwq61BkG6nZawtiPW63oh68qcKpxR/RU7t7eO8OgmJG+BnOo0VV/KNYDR4Jz
 WYpdcdF1n69JlLRMccOU5bf+K+G+OTgZ4BdNBQxvUGcdG/5Gk65yUmCREA7oo7hD/JKS9N8KLKe
 w/45EQbY54lPTc0s//l1Pa9ooa5V7o5Fwe/cG/EWcn1PGDhZrskFfXOSsk+BGOwptSybg1HspcN
 io7C+lkutQJlzn332YNbhrPs1bddh7mdsJ3DbMwJlRBXsab5DOKmCkSX0237Qnl4Fxyu8VdOF/N
 yBz4d7jK1LelfYp0cFq1FsTPMpBI73kR5bUxo8l62kQMngfyrIgyGH54JYv7Z55r7wAgrIqvD3K
 H2jrjQavR/mvB7nIaHw+RlEo2sb/aIYzeUw0k4QBPJ9ca+vX9EYAOZDhEBGPa5R11irlSYC34rU
 UWqwn3dsU7uYiV31gvw==
X-Proofpoint-GUID: -MT35f2O9-dxqohfZyJvmG8shfmaghJk
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8a4e6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bylRaU9mNTR0WGHX4M4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXxqNDPI90E8qb
 RKgaUfyxlRFIfefzSHfMiJqhqBa57IA9wPWKC8K7fzTkRO067vQvuEQA8diRHa3KHKianiNUiam
 nr3aD4d8A5KlTEtcUXWfY4IrPtJ8Hbk=
X-Proofpoint-ORIG-GUID: -MT35f2O9-dxqohfZyJvmG8shfmaghJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 10/30/26 10:09 PM, Srinivas Kandagatla wrote:
> On 10/29/26 3:27 AM, Le Qi wrote:
>> On 10/20/2026 6:14 PM, Konrad Dybcio wrote:
>>> On 10/9/26 5:04 AM, Le Qi wrote:
>>>> The DP2 DAI link is missing from the sound card definition, preventing
>>>> audio playback over the third DisplayPort interface.
>>>>
>>>> Add the required codec, CPU, and platform DAI configuration to enable
>>>> audio playback over DP2.
>>>>
>>>> Signed-off-by: Le Qi<le.qi@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>>>>   1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/
>>>> boot/dts/qcom/purwa-iot-evk.dts
>>>> index a811d8ca2dbf..93cefffd1f46 100644
>>>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>>> @@ -641,6 +641,22 @@ platform {
>>>>                   sound-dai = <&q6apm>;
>>>>               };
>>>>           };
>>>> +
>>>> +        dp2-dai-link {
>>>> +            link-name = "DP2 Playback";
>>>> +
>>>> +            codec {
>>>> +                sound-dai = <&mdss_dp2>;
>>>> +            };
>>>> +
>>>> +            cpu {
>>>> +                sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>>>> +            };
>>>> +
>>>> +            platform {
>>>> +                sound-dai = <&q6apm>;
>>>> +            };
>>>> +        };
>>> Srini, can/should this be in the SoC DT?
> probably not,
> 1. because the dai-links do not have explicit disabled status, so these
> get parsed
> 2. sound card itself is board specific.
> 
> --srini
>>>
>>> Konrad
>>
>> Hi Konrad,
>>
>> I think it is better to keep this in the board DT, since the sound card
>> is board-specific. DP0 and DP1 DAI links are already defined here, so
>> DP2 should be added alongside them.
>>
>> Srini has also agreed to adding DP2 support in the audio topology.

got it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
