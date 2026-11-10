Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301336;
	b=1F5v9FCD/4L36CuTwXWU2Mffa0wpkrbQ0ArGvz+ALQWj53CPeZa3DIOOqmlxXW1MzB09
	 /MnJQTAkB1cfBE+x2OY/1aVplASyxTodlrI9KTAgBuDz1+C5LCuoLup57L08ZmxV9kPYM
	 J2FhXhJtkqJXb43br9CWRp/AAveh3KTy9kpneiu6QkSGqBiDmrRQTlPLm7UsTF4UrQFIi
	 O+PFlvxTYONIfXaXbQ5mWv7P8VYWy0CtxA+Zwr6GcXYfq+pc5W4LWJ2ivYcjve1Ai0EBQ
	 65Nxs4IbjHcE/Jvr5adgKfoNoqLNzqgmAzQuHGAQo92whA0rQFhnaNOw4nUs4HpzzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fs/m/EMOa29tktMuh2e5+aE5N+/Z3wgwvBQ/4dk1bZw=;
	b=bHgvZJ1Xd1MN9Gqkq6JUfrgVzbH9kQ3CiR+oX5iyURTL3zua7Nve3v1RBgSlRtb9N5Ie
	 HDfeQxrunXObAdKPOAk+zK1+NuQol5yiCQ3MPw0ZpcSBcozSy3hvVEq/tTS7Nn2qdab9B
	 UleCVY8tXKxTpkgBe9EEdx3P/QYuegn0LtAFPn2KJRlTOY5ab9u/2qq9VGelC5lGWe2oX
	 m4hdS/68aSsgVXC3crm9eiEWXXy4i+0b/9wclpbBOJNy4n8HauZVkiPOweI5SxY0faQKs
	 AN6fXzzVgSmx9tpQrqoyAc04Tr9jbFe2zRKmwqbFIYoBiibtlU4c1eGcKW2bFyD1hLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GJ9bJ7VF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jbvOTw1J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02C606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A02C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GJ9bJ7VF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jbvOTw1J
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8ZcAx1916840
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fs/m/EMOa29tktMuh2e5+aE5N+/Z3wgwvBQ/4dk1bZw=; b=GJ9bJ7VFGz+uzvSN
	pfVMEAaW5baybuEj/sS4w0AK71rT7RTuHCDoROOZL9b8afwN82vA1YEm0VId4c+K
	3mcsw67J2ispsW+D3LVfsbYp8ne/fxqQnXhzcLMchuzobK7/m1LOBN/SRj7dnXOq
	PI2Y7mFqxeeEBgtJ6HT8plGaz/O0ZNzWSGxthOdg0Tbo0yp4eDbzIJdwJqkxiq7d
	veUUOSZ/VPNdeqDL/SCDG9zWqRwJYmQU4S7f3NIc1/awpDxondAZN6b7cV982H8e
	lxS5kD43EKVTuT8uXUpdNAE5IMFc6JP51Afifumv5kvMSy5TPrtbNJxBlVyEmygN
	fb+aTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4838n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:02:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd66551e02cso2108328a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794301335; x=1794906135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fs/m/EMOa29tktMuh2e5+aE5N+/Z3wgwvBQ/4dk1bZw=;
        b=jbvOTw1JCLlWoCKEJLFV4j36xmhaYdyqWWQ1GvVxx5+OpVS+gmeSjCIDVlcyZvy3sB
         oZgPKZqP1bf6Ev0PRwe4+cz/BwPrqusWs1GD1WP7ecTte1hIpBGLpK81rsLVMWLQyTzr
         gbIFx1vGaKhQm6h351U5dCMMGi/xGhScqB23IfIhUuQEfi1g7k8bd+Xfov64YuRRdpuZ
         BKWw/qAuLqzzQxIdMcUwnoNjUbPh1kSRPF4aGcEv4J5Ihdi/WUCNJaEnZEsXHOO0wdME
         C02joeyEtGP+IMNINxfMK+IzRGY2trckwpMTifc9R5yLCk4gv7t3mAuBEpwljLG+QI5D
         NodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301335; x=1794906135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fs/m/EMOa29tktMuh2e5+aE5N+/Z3wgwvBQ/4dk1bZw=;
        b=u9HN2X574KBMeYHVniVRGN3DfYVaVZoO89XN9QN719FHyWuM9DqEoR1X3nMccS4TtZ
         rniNl0qj0c7amuWCfGBA8VMotZ6AtPjRLO4HdEsKYNyG/dh7tEq4NZ1EIDJL+6o+FCxL
         /KhpUFaKQIUARx/DPHXpzxPekwiBVjiW7O/ItuBkAUefaFWExn0xOoAMyZaGrZWFRZwl
         Z88eBaiGnOrhe4jzPmB/2AsPd4cbOjXilA6qQ+yTG/jU/OTI/vbsSNZT3vvRTLuLkF9d
         MDXal0qjclI4UqKiLXDY4JCnB+Oi6bop/9Vfsrglqv3as/RQ328G7AMCCxvj9I+CYcH8
         u/ow==
X-Forwarded-Encrypted: i=1; AL+hErFBL5TQTA/ALPRaDqE71EQek14ouioXgeRwi7CwRoQe5r1OsmIpMJ8B5q+68jNTn7Gs4arXPMjcmD/x8Ck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uGIUpBTgRDxT7ohAAe7qtu0SWqFA3uAnQmZUAnOl2Zwh+5x09
	z5E4IRqrJZPu7CJiYgFI6J/Tb0jnvx3kLCTUTIpxMbXdpnK3RVE9Bcp3eRG4jUCzdlesyjUf7u5
	ZGrR0VjrVCsy4GluNn66xD6gMktVvxuS3zVJ0e65yPD5pox+AoJWtDY5Uw8eMGnsZ1dU=
X-Gm-Gg: AYBFou3o1M6lzOO7zGrYeXAOWSQGzrsyAys8upgaFVvf/I3Cx66KzQiRRtQYbpoOfcF
	6psKtql5C9BayaJskxfvQcyAEopK+LHc7wmkRG2bqh5H8zRo8J41jh6UCGUdwDokFKH55LcXtXY
	1MtTF4lYNHJgY5ozmJQrpMQSlpcOjFG/Bb5xAxUODGouTaT7ne3ObbOFLLFzt/Iaq6lse6tEYhw
	sl/sM4Hrz2rxvbCMs4J5Hog9Ohcq8KIjJI+5i5CHz6x6jJBbJiAG+9jAWvqCbuVv4uRY6g3Mcwx
	DdaAsvtMKZ6B3DB6VfKvxB7BVbGBoONt0zMve2rpdK64+SKnuoayqenhhFB8dgMp53aJiFQHUij
	70e1rUPJraX5pY3JqTecdHaMK0ZUECXvjoe9XGTMJcgcnWLH1qO1V1DFnT9CONl51ulQrOuFx4g
	lq
X-Received: by 2002:a05:6a20:7490:b0:3e0:f07d:a73 with SMTP id adf61e73a8af0-3f18f0b850cmr2016591637.33.1794301334995;
        Tue, 10 Nov 2026 01:02:14 -0800 (PST)
X-Received: by 2002:a05:6a20:7490:b0:3e0:f07d:a73 with SMTP id adf61e73a8af0-3f18f0b850cmr2016550637.33.1794301334523;
        Tue, 10 Nov 2026 01:02:14 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fc2b5sm597115b3a.50.2026.11.10.01.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:02:01 -0800 (PST)
Message-ID: <c204d6d5-a8dd-4ee0-8519-af09c231a4d7@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:31:47 +0530
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
Subject: Re: [PATCH v4 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>
 <20261105-cunning-whippet-of-success-e4fd3d@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261105-cunning-whippet-of-success-e4fd3d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNSBTYWx0ZWRfXz5EUxl1/hjj7
 2HuqhlbBHdomCO6W4rwFPq7ixoTW3xQKmdfxXNcnf2AyCTL3W58hIJ69nAYR1NSbxUT1G1S+bF6
 St7bEXyk03oYwnwIVftIF9k3MooSi97vdjz4ksloHOKX9dQFfwm+lbhreOrhFXZhLysFq0Z9LDy
 0itP00xGTNgXGb5r2dPjY+WJ8XZ9KDS61Kr3z5hS1CGyk+xNvlbmbzMvPyQXtkEyN94UTUHp6Ko
 5NhTzbRO5kK5OmaywzW5SsjUPBIsLjbqxmG2jhx4S85R6OvC5UmQg5Ew30Bc7QI9C9d/uh/Bf61
 UCfXWRY5pQgzE5I5KNIhA8O9YESNY5UeV4thgCyRX75ykdTDHBkEzwYVutAjrZYI1RXrpd1JZfv
 XBizQ6XKkfFoaDlxZvlVE6+/bHLzDWKrC9lYpPhIKdM7R3lXkJuiJhx7k7jes/OeqEB43tD+7GL
 LzTm353xEoNI2quMH5w==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af2dd97 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eWDS80NfvEsLDdy5rmYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNSBTYWx0ZWRfX0dw/b7FJe9H1
 lmeKFEaFDs5sO0lGm7ISHdgzjJcLuFxwrqQ+IGytXLoMfgzijJG+VGpKVijkf2u2+p4V2kEm0XS
 fj5YYNCqTCcNYkFpQDpONhZpQsUQgig=
X-Proofpoint-GUID: svbvN3yCYrIHbmgtjxnRNuxMgPckYGVp
X-Proofpoint-ORIG-GUID: svbvN3yCYrIHbmgtjxnRNuxMgPckYGVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100035

On 11/5/2026 7:05 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 04, 2026 at 07:33:30PM +0530, Komal Bajaj wrote:
>> The `iommus` property constraint in qcom,pas-common.yaml is too
>> restrictive with `maxItems: 1`, preventing SoCs that require multiple
>> IOMMU entries from being properly described.
>   From here
>
>> Remove `iommus` constraint from qcom,pas-common.yaml and add it to
>> SoC-specific binding files that have EL2 support and require IOMMU
>> configuration:
>>
>> - qcom,sa8775p-pas.yaml: Add `iommus: maxItems: 1` for all sa8775p
>>    and qcs8300 remoteproc compatibles (lemans-el2, monaco-el2)
>>
>> - qcom,sm8150-pas.yaml: Add `iommus: maxItems: 1` for qcs615
>>    remoteproc compatibles (talos-el2)
>>
>> - qcom,sm8550-pas.yaml: Add `iommus: maxItems: 1` for x1e80100
>>    remoteproc compatibles (x1-el2)
> to here - all this repeats the diff.

Sure, I will drop them and keep only the reason for the change, and why 
the SoC bindings now need to declare iommus themselves, in the next 
revision.

>
>> This allows each SoC to define its own IOMMU requirements while
>> maintaining backward compatibility.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,pas-common.yaml      |  3 ---
>>   .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml     |  6 ++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml      | 12 ++++++++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml      | 12 ++++++++++++
> While you are not answering the unknown - what about all other devices?

I checked all users of qcom,pas-common.yaml, including DTS files for PAS 
remoteproc nodes using iommus, and ran dtbs_check on the arm64 qualcomm 
DTBs.
The only affected user outside this series is Glymur, where glymur.dtsi 
specifies iommus for ADSP and CDSP nodes. I will add the corresponding 
constraint to sm8550 binding in next revision.

>
>>   4 files changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index f75cab6b4ed9..4662fe4cff62 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -32,9 +32,6 @@ properties:
>>       minItems: 5
>>       maxItems: 6
>>   
>> -  iommus:
>> -    maxItems: 1
>> -
>>     power-domains:
>>       minItems: 1
>>       maxItems: 3
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> index dda2d144b720..711c2f723b17 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> @@ -106,6 +106,8 @@ allOf:
>>             items:
>>               - const: lcx
>>               - const: lmx
>> +        iommus:
>> +          maxItems: 1
> Missing property definition in top-level.

  Agreed. I will define iommus once in top-level properties of 
qcom,sa8775p-pas.yaml and drop repeated entries from allOf conditions in 
next revision.

Thanks
Komal

>
>>   
>>     - if:
>>         properties:
>> @@ -126,6 +128,8 @@ allOf:
>>               - const: cx
>>               - const: mxc
>>               - const: nsp
>> +        iommus:
>> +          maxItems: 1
>>   
>>     - if:
>>         properties:
>> @@ -144,6 +148,8 @@ allOf:
>>             items:
>>               - const: cx
>>               - const: mxc
>> +        iommus:
>> +          maxItems: 1
> Not sure what is the point of repeating it multiple times.
>
> Best regards,
> Krzysztof
>

